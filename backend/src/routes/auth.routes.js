const express = require('express');
const { authenticateCookie } = require('../middleware/auth');
const { requireCsrf } = require('../middleware/csrf');
const { loginRateLimit } = require('../middleware/rateLimit');
const { env } = require('../config/env');
const { sessionCookieOptions, csrfCookieOptions } = require('../utils/cookies');
const { asyncHandler } = require('../utils/asyncHandler');
const { ok } = require('../utils/responses');
const { login, findUserById } = require('../services/auth.service');
const { revokeSession, revokeAllSessions } = require('../services/session.service');

const authRoutes = express.Router();

const loginLimiter = loginRateLimit({
  windowMs: 15 * 60 * 1000,
  max: 10,
  keyPrefix: 'login'
});

authRoutes.post('/login', loginLimiter, asyncHandler(async (req, res) => {
  const result = await login(req.body, {
    ip: req.body.simulateNoIp ? '' : req.ip,
    userAgent: req.get('user-agent') || ''
  });

  res.cookie(result.cookieName, result.token, result.cookieOptions);
  res.cookie(result.csrfCookieName, result.csrfToken, csrfCookieOptions());
  return ok(res, { user: result.user });
}));

authRoutes.post('/logout', authenticateCookie, requireCsrf, asyncHandler(async (req, res) => {
  await revokeSession(req.auth.sessionId);
  res.clearCookie(env.sessionCookieName, sessionCookieOptions());
  res.clearCookie(env.csrfCookieName, csrfCookieOptions());
  return ok(res, {});
}));

authRoutes.post('/logout-all', authenticateCookie, requireCsrf, asyncHandler(async (req, res) => {
  await revokeAllSessions(req.auth.userId);
  res.clearCookie(env.sessionCookieName, sessionCookieOptions());
  res.clearCookie(env.csrfCookieName, csrfCookieOptions());
  return ok(res, {});
}));

authRoutes.get('/me', authenticateCookie, asyncHandler(async (req, res) => {
  const user = await findUserById(req.auth.userId);
  if (!user) {
    return res.status(404).json({ success: false, error: 'User not found' });
  }

  let parsedModules = [];
  try {
    parsedModules = JSON.parse(user.purchased_modules || '[]');
  } catch (e) {
    parsedModules = [];
  }

  return ok(res, {
    user: {
      id: user.id,
      email: user.email,
      role: user.role,
      purchased_modules: parsedModules
    }
  });
}));

const crypto = require('crypto');
const env = require('../config/env');
const { decryptPII } = require('../utils/cryptoVault');

authRoutes.get('/magic-payslip', asyncHandler(async (req, res) => {
  const { runId, empId, token } = req.query;
  if (!runId || !empId || !token) throw httpError(400, 'Missing parameters.');

  const magicStr = `${runId}:${empId}`;
  const expectedToken = crypto.createHmac('sha256', env.jwtSecret).update(magicStr).digest('hex');
  if (token !== expectedToken) throw httpError(403, 'Invalid or expired magic link.');

  const pool = await getDbPool();
  const runCheck = await pool.request()
    .input('runId', sql.Int, Number(runId))
    .query("SELECT TOP 1 id, month, year FROM dbo.PayrollRuns WHERE id = @runId AND status = 'Completed';");

  if (!runCheck.recordset[0]) throw httpError(404, 'Payroll run not found or not completed.');
  const payrollRun = runCheck.recordset[0];

  const result = await pool.request()
    .input('runId', sql.Int, Number(runId))
    .input('employeeId', sql.Int, Number(empId))
    .query(`
      SELECT pt.*, e.name AS employee_name, e.pan, e.bank_account_number,
             e.ifsc_code, e.date_of_joining, e.uan_no, e.pf_status
      FROM dbo.PayrollTransactions pt
      INNER JOIN dbo.Employees e ON pt.employee_id = e.id
      WHERE pt.payroll_run_id = @runId AND pt.employee_id = @employeeId;
    `);

  if (!result.recordset[0]) throw httpError(404, 'Transaction not found.');
  const row = result.recordset[0];

  const formatDbDate = (d) => {
    if (!d) return null;
    try { return d.toISOString().split('T')[0]; } catch (e) { return null; }
  };

  const payload = {
    employee: {
      id: row.employee_id,
      name: row.employee_name,
      pan: decryptPII(row.pan),
      bank_account_number: decryptPII(row.bank_account_number),
      ifsc_code: decryptPII(row.ifsc_code),
      uan_no: decryptPII(row.uan_no),
      date_of_joining: formatDbDate(row.date_of_joining)
    },
    transaction: {
      ...row,
      base_salary: row.base_salary ? Number(row.base_salary) : 0,
      hra: row.hra ? Number(row.hra) : 0,
      allowances: row.allowances ? Number(row.allowances) : 0,
      gross_salary: row.gross_salary ? Number(row.gross_salary) : 0,
      deductions: row.deductions ? Number(row.deductions) : 0,
      pf_employee: row.pf_employee ? Number(row.pf_employee) : 0,
      esi_employee: row.esi_employee ? Number(row.esi_employee) : 0,
      professional_tax: row.professional_tax ? Number(row.professional_tax) : 0,
      tds: row.tds ? Number(row.tds) : 0,
      lwp_deduction: row.lwp_deduction ? Number(row.lwp_deduction) : 0,
      net_salary: row.net_salary ? Number(row.net_salary) : 0,
    },
    run: payrollRun
  };

  return ok(res, { payslip_payload: payload });
}));

module.exports = { authRoutes };
;
