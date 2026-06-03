const crypto = require('crypto');
const express = require('express');
const { sql, getDbPool } = require('../config/db');
const { env } = require('../config/env');
const { authenticateCookie } = require('../middleware/auth');
const { requireCsrf } = require('../middleware/csrf');
const { loginRateLimit } = require('../middleware/rateLimit');
const { asyncHandler } = require('../utils/asyncHandler');
const { ok } = require('../utils/responses');
const { httpError } = require('../utils/httpError');
const { verifyPassword, signSessionToken } = require('../services/auth.service');
const { createSession, revokeSession } = require('../services/session.service');
const { sessionCookieOptions, csrfCookieOptions } = require('../utils/cookies');
const { decryptPII } = require('../utils/cryptoVault');

const employeeRoutes = express.Router();

const loginLimiter = loginRateLimit({
  windowMs: 15 * 60 * 1000,
  max: 10,
  keyPrefix: 'emp_login'
});

const DUMMY_HASH = '$argon2id$v=19$m=65536,t=3,p=4$7aUA7GPkSnBru/DiJ4uB5g$HcLVIJt4kCEjmaXMKhAzeAWeq3Uc90CeTvxAe9wxOtI';

employeeRoutes.post('/login', loginLimiter, asyncHandler(async (req, res) => {
  const { email, password } = req.body;
  if (!email || !password) throw httpError(400, 'Email and password required');

  const pool = await getDbPool();
  const result = await pool.request()
    .input('email', sql.NVarChar(255), email)
    .query(`
      SELECT id, user_id, name, email, password_hash, status
      FROM dbo.Employees
      WHERE email = @email AND status = 'Active';
    `);

  const emp = result.recordset[0];
  let passwordMatches = false;
  if (emp && emp.password_hash) {
    passwordMatches = await verifyPassword(emp.password_hash, password);
  } else {
    await verifyPassword(DUMMY_HASH, password);
  }

  if (!emp || !passwordMatches) {
    throw httpError(401, 'Invalid email or password');
  }

  const ip = req.ip || '';
  const userAgent = req.get('user-agent') || '';
  const deviceHash = crypto.createHash('sha256').update(`${ip}-${userAgent}`).digest('hex');

  const session = await createSession({
    userId: emp.id,
    role: 'employee',
    ip,
    userAgent,
    deviceHash
  });

  const token = signSessionToken({ id: emp.id, role: 'employee' }, session);

  res.cookie(env.sessionCookieName, token, sessionCookieOptions());
  res.cookie(env.csrfCookieName, session.csrfToken, csrfCookieOptions());
  
  return ok(res, { employee: { id: emp.id, name: emp.name, email: emp.email } });
}));

employeeRoutes.post('/logout', authenticateCookie, requireCsrf, asyncHandler(async (req, res) => {
  if (req.auth.role !== 'employee') throw httpError(403, 'Not an employee');
  await revokeSession(req.auth.sessionId);
  res.clearCookie(env.sessionCookieName, sessionCookieOptions());
  res.clearCookie(env.csrfCookieName, csrfCookieOptions());
  return ok(res, {});
}));

const employeeAuth = [authenticateCookie, (req, res, next) => {
  if (req.auth.role !== 'employee') return next(httpError(403, 'Employee access only'));
  next();
}];

employeeRoutes.get('/me', employeeAuth, asyncHandler(async (req, res) => {
  const pool = await getDbPool();
  const result = await pool.request()
    .input('id', sql.Int, req.auth.userId)
    .query(`
      SELECT id, name, email, age, gender, pan, aadhar, marital_status,
             date_of_joining, bank_account_number, ifsc_code, uan_no, pf_status, base_salary, status
      FROM dbo.Employees
      WHERE id = @id;
    `);

  if (!result.recordset[0]) throw httpError(404, 'Employee not found');
  
  const emp = result.recordset[0];
  emp.pan = decryptPII(emp.pan);
  emp.aadhar = decryptPII(emp.aadhar);
  emp.bank_account_number = decryptPII(emp.bank_account_number);
  emp.ifsc_code = decryptPII(emp.ifsc_code);
  emp.uan_no = decryptPII(emp.uan_no);

  return ok(res, { employee: emp });
}));

employeeRoutes.post('/attendance', employeeAuth, requireCsrf, asyncHandler(async (req, res) => {
  const { date, status, device_time, latitude, longitude } = req.body;
  if (!date || !status) throw httpError(400, 'Date and status required');

  if (latitude != null && longitude != null) {
    const lat1 = 12.9716;
    const lon1 = 77.5946;
    const lat2 = parseFloat(latitude);
    const lon2 = parseFloat(longitude);
    
    const R = 6371; // km
    const dLat = (lat2 - lat1) * Math.PI / 180;
    const dLon = (lon2 - lon1) * Math.PI / 180;
    const a = Math.sin(dLat/2) * Math.sin(dLat/2) +
              Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
              Math.sin(dLon/2) * Math.sin(dLon/2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    const d = R * c; // in km
    
    if (d > 0.05) {
      throw httpError(403, 'Geofence strictly breached. Punch rejected.');
    }
  }

  const pool = await getDbPool();
  
  // Upsert attendance
  await pool.request()
    .input('empId', sql.Int, req.auth.userId)
    .input('date', sql.Date, date)
    .input('status', sql.NVarChar(50), status)
    .input('deviceTime', sql.NVarChar(100), device_time || null)
    .input('latitude', sql.Decimal(9, 6), latitude != null ? latitude : null)
    .input('longitude', sql.Decimal(9, 6), longitude != null ? longitude : null)
    .query(`
      IF EXISTS (SELECT 1 FROM dbo.Attendance WHERE employee_id = @empId AND attendance_date = @date)
        UPDATE dbo.Attendance SET status = @status, device_time = ISNULL(@deviceTime, device_time), latitude = ISNULL(@latitude, latitude), longitude = ISNULL(@longitude, longitude), updated_at = SYSUTCDATETIME() WHERE employee_id = @empId AND attendance_date = @date;
      ELSE
        INSERT INTO dbo.Attendance (employee_id, attendance_date, status, device_time, latitude, longitude) VALUES (@empId, @date, @status, @deviceTime, @latitude, @longitude);
    `);

  return ok(res, { message: 'Attendance recorded' });
}));

employeeRoutes.post('/leaves', employeeAuth, requireCsrf, asyncHandler(async (req, res) => {
  const { type, start_date, end_date, reason } = req.body;
  if (!type || !start_date || !end_date) throw httpError(400, 'Missing required fields');

  const pool = await getDbPool();
  await pool.request()
    .input('empId', sql.Int, req.auth.userId)
    .input('type', sql.NVarChar(50), type)
    .input('start', sql.Date, start_date)
    .input('end', sql.Date, end_date)
    .input('reason', sql.NVarChar(500), reason || null)
    .query(`
      INSERT INTO dbo.Leaves (employee_id, type, start_date, end_date, reason, status)
      VALUES (@empId, @type, @start, @end, @reason, 'Pending');
    `);

  return ok(res, { message: 'Leave request submitted' });
}));

employeeRoutes.get('/payslips', employeeAuth, asyncHandler(async (req, res) => {
  const pool = await getDbPool();
  const result = await pool.request()
    .input('empId', sql.Int, req.auth.userId)
    .query(`
      SELECT T.*, R.month, R.year 
      FROM dbo.PayrollTransactions T
      JOIN dbo.PayrollRuns R ON T.payroll_run_id = R.id
      WHERE T.employee_id = @empId AND R.status = 'Completed'
      ORDER BY R.year DESC, R.month DESC
    `);
  return ok(res, { payslips: result.recordset });
}));

module.exports = { employeeRoutes };
