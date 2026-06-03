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

  const session = await createSession({
    userId: emp.id,
    role: 'employee',
    ip: req.ip || '',
    userAgent: req.get('user-agent') || ''
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
             date_of_joining, bank_account_number, pf_status, base_salary, status
      FROM dbo.Employees
      WHERE id = @id;
    `);

  if (!result.recordset[0]) throw httpError(404, 'Employee not found');
  return ok(res, { employee: result.recordset[0] });
}));

employeeRoutes.post('/attendance', employeeAuth, requireCsrf, asyncHandler(async (req, res) => {
  const { date, status } = req.body;
  if (!date || !status) throw httpError(400, 'Date and status required');

  const pool = await getDbPool();
  
  // Upsert attendance
  await pool.request()
    .input('empId', sql.Int, req.auth.userId)
    .input('date', sql.Date, date)
    .input('status', sql.NVarChar(50), status)
    .query(`
      IF EXISTS (SELECT 1 FROM dbo.Attendance WHERE employee_id = @empId AND attendance_date = @date)
        UPDATE dbo.Attendance SET status = @status, updated_at = SYSUTCDATETIME() WHERE employee_id = @empId AND attendance_date = @date;
      ELSE
        INSERT INTO dbo.Attendance (employee_id, attendance_date, status) VALUES (@empId, @date, @status);
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

  return ok(res, { message: 'Leave requested successfully' });
}));

module.exports = { employeeRoutes };
