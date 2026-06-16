const express = require('express');
const http = require('http');
const https = require('https');
const { URL } = require('url');
const { authenticateCookie } = require('../middleware/auth');
const { ipRateLimit } = require('../middleware/rateLimit');
const { requireAtLeastRole, requireRole, revalidateRoleAtLeast } = require('../middleware/requireRole');
const { requireCsrf } = require('../middleware/csrf');
const { asyncHandler } = require('../utils/asyncHandler');
const { ok } = require('../utils/responses');
const { env } = require('../config/env');
const { sessionCookieOptions, csrfCookieOptions } = require('../utils/cookies');
const { writeAuditEvent } = require('../services/audit.service');
const { rotateSession } = require('../services/session.service');
const { signSessionToken } = require('../services/auth.service');
const { sql, getDbPool } = require('../config/db');
const { tbaisEvents } = require('../services/event.service');
const { encryptPII, decryptPII } = require('../utils/cryptoVault');

const adminRoutes = express.Router();

adminRoutes.use(authenticateCookie);
adminRoutes.use(requireCsrf);

const adminLimiter = ipRateLimit({
  windowMs: 60 * 1000,
  max: 60,
  keyPrefix: 'admin'
});

const superAdminLimiter = ipRateLimit({
  windowMs: 60 * 1000,
  max: 20,
  keyPrefix: 'super-admin'
});

adminRoutes.get('/me', adminLimiter, requireAtLeastRole('admin'), asyncHandler(async (req, res) => {
  const corePool = await getDbPool();
  const userRes = await corePool.request()
    .input('id', sql.Int, req.auth.userId)
    .query(`SELECT id, email, role, is_active FROM dbo.Users WHERE id = @id`);
  if (!userRes.recordset.length) return fail(res, 404, 'User not found');
  return ok(res, { user: userRes.recordset[0] });
}));

adminRoutes.get('/dashboard/batch', adminLimiter, requireAtLeastRole('admin'), asyncHandler(async (req, res) => {
  const corePool = await getDbPool();
  const pool = corePool;

  const [userRes, empRes, leavesRes, expensesRes] = await Promise.all([
    corePool.request()
      .input('id', sql.Int, req.auth.userId)
      .query(`SELECT id, email, role, is_active FROM dbo.Users WHERE id = @id`),
    corePool.request()
      .query(`SELECT * FROM dbo.Employees ORDER BY name ASC`),
    corePool.request()
      .query(`SELECT L.*, E.name as employee_name FROM dbo.Leaves L JOIN dbo.Employees E ON L.employee_id = E.id ORDER BY L.created_at DESC`),
    corePool.request()
      .query(`SELECT EX.*, E.name as employee_name FROM dbo.Expenses EX JOIN dbo.Employees E ON EX.employee_id = E.id ORDER BY EX.created_at DESC`)
  ]);

  return ok(res, {
    user: userRes.recordset[0],
    employees: empRes.recordset.map(emp => ({
      ...emp,
      pan: decryptPII(emp.pan),
      aadhar: decryptPII(emp.aadhar),
      bank_account_number: decryptPII(emp.bank_account_number),
      ifsc_code: decryptPII(emp.ifsc_code),
      uan_no: decryptPII(emp.uan_no)
    })),
    leaves: leavesRes.recordset,
    expenses: expensesRes.recordset
  });
}));

adminRoutes.post('/super-admin/actions', superAdminLimiter, requireRole('super-admin'), revalidateRoleAtLeast('super-admin'), asyncHandler(async (req, res) => {
  await writeAuditEvent({
    actorUserId: Number(req.auth.userId),
    action: 'super_admin.action',
    ip: req.ip,
    userAgent: req.get('user-agent') || '',
    success: true,
    metadata: { route: req.originalUrl },
    failClosed: true
  });

  const rotatedSession = await rotateSession({
    sid: req.auth.sessionId,
    ip: req.ip,
    userAgent: req.get('user-agent') || ''
  });

  if (rotatedSession) {
    const token = signSessionToken({
      id: req.auth.userId,
      role: req.auth.role
    }, rotatedSession);

    res.cookie(env.sessionCookieName, token, sessionCookieOptions());
    res.cookie(env.csrfCookieName, rotatedSession.csrfToken, csrfCookieOptions());
  }

  return ok(res, {
    message: 'Super-admin action endpoint is ready for implementation'
  });
}));

adminRoutes.get('/clients', requireRole('super-admin'), revalidateRoleAtLeast('super-admin'), asyncHandler(async (req, res) => {
  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;
  const result = await pool.request()
    .query(`
      SELECT id, email, role, purchased_modules, is_active, created_at
      FROM dbo.Users
      WHERE role = N'admin'
      ORDER BY created_at DESC;
    `);

  const clients = result.recordset.map(client => {
    let parsedModules = [];
    try {
      parsedModules = JSON.parse(client.purchased_modules || '[]');
    } catch (e) {
      parsedModules = [];
    }
    return {
      id: client.id,
      email: client.email,
      role: client.role,
      purchased_modules: parsedModules,
      isActive: client.is_active,
      createdAt: client.created_at
    };
  });

  return ok(res, { clients });
}));

// POST /api/admin/clients - Create a new admin client
adminRoutes.post('/clients', requireRole('super-admin'), revalidateRoleAtLeast('super-admin'), asyncHandler(async (req, res) => {
  const { email, password, purchased_modules } = req.body;
  if (!email || !password) {
    return res.status(400).json({ success: false, error: 'Email and password are required' });
  }

  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;

  // Check if email already exists
  const existingUser = await pool.request()
    .input('email', sql.NVarChar(254), email.trim())
    .query('SELECT TOP 1 id FROM dbo.Users WHERE email = @email');

  if (existingUser.recordset[0]) {
    return res.status(400).json({ success: false, error: 'A user with this email address already exists' });
  }

  const { hashPassword } = require('../services/auth.service');
  const passwordHash = await hashPassword(password);
  const modulesString = JSON.stringify(Array.isArray(purchased_modules) ? purchased_modules : []);

  const insertResult = await pool.request()
    .input('email', sql.NVarChar(254), email.trim())
    .input('passwordHash', sql.NVarChar(sql.MAX), passwordHash)
    .input('purchasedModules', sql.NVarChar(sql.MAX), modulesString)
    .query(`
      INSERT INTO dbo.Users (email, password_hash, role, purchased_modules, is_active, created_at)
      OUTPUT INSERTED.id
      VALUES (@email, @passwordHash, N'admin', @purchasedModules, 1, GETDATE());
    `);

  const newId = insertResult.recordset[0].id;

  return ok(res, {
    message: 'Client credentials generated successfully',
    client: {
      id: newId,
      email: email.trim(),
      role: 'admin',
      purchased_modules: Array.isArray(purchased_modules) ? purchased_modules : []
    }
  });
}));

// PUT /api/admin/clients/:id - Update client's purchased modules
adminRoutes.put('/clients/:id', requireRole('super-admin'), revalidateRoleAtLeast('super-admin'), asyncHandler(async (req, res) => {
  const clientId = Number(req.params.id);
  const { purchased_modules } = req.body;

  if (!Array.isArray(purchased_modules)) {
    return res.status(400).json({ success: false, error: 'purchased_modules must be an array' });
  }

  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;
  const modulesString = JSON.stringify(purchased_modules);

  const updateResult = await pool.request()
    .input('id', sql.Int, clientId)
    .input('purchasedModules', sql.NVarChar(sql.MAX), modulesString)
    .query(`
      UPDATE dbo.Users
      SET purchased_modules = @purchasedModules, updated_at = GETDATE()
      WHERE id = @id AND role = N'admin';
    `);

  return ok(res, {
    message: 'Client licenses updated successfully',
    client: {
      id: clientId,
      purchased_modules
    }
  });
}));

// Custom lightweight validation helpers (No dependencies)
function validateEmployeePayload(data) {
  const errors = [];
  const { name, age, gender, pan, aadhar, date_of_joining, marital_status, spouse_name, pf_status, uan_no, ifsc_code, base_salary, hra, allowances, deductions } = data;

  if (!name || !name.trim()) errors.push('Name is required.');
  if (!age || isNaN(Number(age)) || Number(age) <= 0) errors.push('Age must be a valid positive integer.');
  if (!gender || !gender.trim()) errors.push('Gender is required.');

  // PAN Check
  if (!pan || !/^[A-Z]{5}[0-9]{4}[A-Z]{1}$/i.test(pan.trim())) {
    errors.push('PAN must be a valid 10-character alphanumeric string (5 letters, 4 numbers, 1 letter).');
  }

  // Aadhar Check
  if (!aadhar || !/^\d{12}$/.test(aadhar.trim())) {
    errors.push('Aadhar must be a valid 12-digit number.');
  }

  // Date of joining Check
  if (!date_of_joining || isNaN(Date.parse(date_of_joining))) {
    errors.push('Date of Joining is invalid.');
  }

  // Conditional Married Check
  if (marital_status === 'Married' && (!spouse_name || !spouse_name.trim())) {
    errors.push('Spouse Name is mandatory when Marital Status is Married.');
  }

  // Conditional PF check
  if (pf_status === 'Applicable' && (!uan_no || !/^\d{12}$/.test(uan_no.trim()))) {
    errors.push('UAN No is mandatory and must be a valid 12-digit number when PF Status is Applicable.');
  }

  // IFSC Code check (optional, but if provided must be valid)
  if (ifsc_code && !/^[A-Z]{4}0[A-Z0-9]{6}$/i.test(ifsc_code.trim())) {
    errors.push('IFSC code must be a valid 11-character Indian Financial System Code.');
  }

  // Salary fields verification
  const checkNonNegative = (val, name) => {
    if (val !== undefined && val !== null && (isNaN(Number(val)) || Number(val) < 0)) {
      errors.push(`${name} must be a non-negative number.`);
    }
  };
  checkNonNegative(base_salary, 'Base Salary');
  checkNonNegative(hra, 'HRA');
  checkNonNegative(allowances, 'Allowances');
  checkNonNegative(deductions, 'Deductions');

  return errors;
}

// GET /api/admin/employees - Fetch employee records for the current tenant user with pagination/search support
adminRoutes.get('/employees', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;

  const searchStr = req.query.search ? req.query.search.trim() : '';
  const hasPagination = req.query.page || req.query.limit;

  let queryWhere = 'WHERE user_id = @userId';
  if (searchStr) {
    queryWhere += ' AND (name LIKE @search OR pan LIKE @search OR aadhar LIKE @search OR status LIKE @search OR gender LIKE @search)';
  }

  let employees = [];
  let totalEmployees = 0;
  let page = 1;
  let limit = 10;
  let totalPages = 1;

  const formatDbDate = (d) => {
    if (!d) return null;
    try {
      return d.toISOString().split('T')[0];
    } catch (e) {
      return null;
    }
  };

  if (hasPagination) {
    page = Math.max(1, parseInt(req.query.page) || 1);
    limit = req.query.limit === 'all' ? 999999 : Math.max(1, parseInt(req.query.limit) || 10);
    const offset = (page - 1) * limit;

    // Get total count
    const countResult = await pool.request()
      .input('userId', sql.Int, userId)
      .input('search', sql.NVarChar, `%${searchStr}%`)
      .query(`
        SELECT COUNT(*) as total
        FROM dbo.Employees
        ${queryWhere};
      `);
    totalEmployees = countResult.recordset[0].total;
    totalPages = Math.ceil(totalEmployees / limit);

    // Get records with offset and limit
    const result = await pool.request()
      .input('userId', sql.Int, userId)
      .input('search', sql.NVarChar, `%${searchStr}%`)
      .input('offset', sql.Int, offset)
      .input('limit', sql.Int, limit)
      .query(`
        SELECT id, name, age, status, gender, pan, marital_status, spouse_name, aadhar,
               date_of_birth, date_of_joining, date_of_exit, bank_account_number, ifsc_code, pf_status, uan_no,
               base_salary, hra, allowances, deductions, state, professional_tax, tds, tax_regime, tax_declarations_json
        FROM dbo.Employees
        ${queryWhere}
        ORDER BY id DESC
        OFFSET @offset ROWS FETCH NEXT @limit ROWS ONLY;
      `);
    employees = result.recordset;
  } else {
    // Return all records (backwards compatibility)
    const result = await pool.request()
      .input('userId', sql.Int, userId)
      .input('search', sql.NVarChar, `%${searchStr}%`)
      .query(`
        SELECT id, name, age, status, gender, pan, marital_status, spouse_name, aadhar,
               date_of_birth, date_of_joining, date_of_exit, bank_account_number, ifsc_code, pf_status, uan_no,
               base_salary, hra, allowances, deductions, state, professional_tax, tds, tax_regime, tax_declarations_json
        FROM dbo.Employees
        ${queryWhere}
        ORDER BY id DESC;
      `);
    employees = result.recordset;
    totalEmployees = employees.length;
  }

  const mappedEmployees = employees.map(row => ({
    ...row,
    pan: decryptPII(row.pan),
    aadhar: decryptPII(row.aadhar),
    bank_account_number: decryptPII(row.bank_account_number),
    ifsc_code: decryptPII(row.ifsc_code),
    uan_no: decryptPII(row.uan_no),
    date_of_birth: formatDbDate(row.date_of_birth),
    date_of_joining: formatDbDate(row.date_of_joining),
    date_of_exit: formatDbDate(row.date_of_exit),
    base_salary: row.base_salary ? Number(row.base_salary) : 0,
    hra: row.hra ? Number(row.hra) : 0,
    allowances: row.allowances ? Number(row.allowances) : 0,
    deductions: row.deductions ? Number(row.deductions) : 0,
    state: row.state || 'Karnataka',
    professional_tax: row.professional_tax ? Number(row.professional_tax) : 0,
    tds: row.tds ? Number(row.tds) : 0
  }));

  return ok(res, {
    employees: mappedEmployees,
    pagination: {
      total: totalEmployees,
      page,
      limit,
      totalPages
    }
  });
}));

// GET /api/admin/employees/summary - Fetch server-side aggregate salary/tax metrics for reports
adminRoutes.get('/employees/summary', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;

  const result = await pool.request()
    .input('userId', sql.Int, userId)
    .query(`
      SELECT 
        SUM(COALESCE(base_salary, 0) + COALESCE(hra, 0) + COALESCE(allowances, 0)) as totalGross,
        SUM(COALESCE(deductions, 0)) as totalDeductions,
        SUM(COALESCE(professional_tax, 0)) as totalPT,
        SUM(COALESCE(tds, 0)) as totalTDS,
        COUNT(*) as totalEmployees
      FROM dbo.Employees
      WHERE user_id = @userId;
    `);

  const row = result.recordset[0] || {};
  const totalGross = row.totalGross ? Number(row.totalGross) : 0;
  const totalDeductions = row.totalDeductions ? Number(row.totalDeductions) : 0;
  const totalNet = totalGross - totalDeductions;
  const totalPT = row.totalPT ? Number(row.totalPT) : 0;
  const totalTDS = row.totalTDS ? Number(row.totalTDS) : 0;
  const totalEmployees = row.totalEmployees ? Number(row.totalEmployees) : 0;

  return ok(res, {
    totalGross,
    totalDeductions,
    totalNet,
    totalPT,
    totalTDS,
    totalEmployees
  });
}));

// POST /api/admin/employees - Create a new employee record for the current tenant user
adminRoutes.post('/employees', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const validationErrors = validateEmployeePayload(req.body);

  if (validationErrors.length > 0) {
    return res.status(400).json({
      success: false,
      error: validationErrors.join(' ')
    });
  }

  const {
    name, age, status, gender, pan, marital_status, spouse_name, aadhar,
    date_of_birth, date_of_joining, date_of_exit, bank_account_number,
    ifsc_code, pf_status, uan_no, base_salary, hra, allowances, deductions,
    state, professional_tax, tds
  } = req.body;

  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;

  const parseInputDate = (dStr) => {
    if (!dStr) return null;
    const parsed = new Date(dStr);
    return isNaN(parsed.getTime()) ? null : parsed;
  };

  try {
    const insertResult = await pool.request()
      .input('userId', sql.Int, userId)
      .input('name', sql.NVarChar(255), name.trim())
      .input('age', sql.Int, Number(age))
      .input('status', sql.NVarChar(50), status || 'Active')
      .input('gender', sql.NVarChar(50), gender.trim())
      .input('pan', sql.NVarChar(255), encryptPII(pan ? pan.trim() : null))
      .input('maritalStatus', sql.NVarChar(50), marital_status || 'Unmarried')
      .input('spouseName', sql.NVarChar(255), marital_status === 'Married' ? spouse_name.trim() : null)
      .input('aadhar', sql.NVarChar(255), encryptPII(aadhar ? aadhar.trim() : null))
      .input('dateOfBirth', sql.Date, parseInputDate(date_of_birth))
      .input('dateOfJoining', sql.Date, new Date(date_of_joining))
      .input('dateOfExit', sql.Date, status === 'Terminated' ? parseInputDate(date_of_exit) : null)
      .input('bankAccountNumber', sql.NVarChar(255), encryptPII(bank_account_number ? bank_account_number.trim() : null))
      .input('ifscCode', sql.NVarChar(255), encryptPII(ifsc_code ? ifsc_code.trim() : null))
      .input('pfStatus', sql.NVarChar(50), pf_status || 'Not Applicable')
      .input('uanNo', sql.NVarChar(255), encryptPII(pf_status === 'Applicable' && uan_no ? uan_no.trim() : null))
      .input('baseSalary', sql.Decimal(18, 2), base_salary ? Number(base_salary) : 0)
      .input('hra', sql.Decimal(18, 2), hra ? Number(hra) : 0)
      .input('allowances', sql.Decimal(18, 2), allowances ? Number(allowances) : 0)
      .input('deductions', sql.Decimal(18, 2), deductions ? Number(deductions) : 0)
      .input('state', sql.NVarChar(100), state || 'Karnataka')
      .input('professionalTax', sql.Decimal(18, 2), professional_tax ? Number(professional_tax) : 0)
      .input('tds', sql.Decimal(18, 2), tds ? Number(tds) : 0)
      .query(`
        INSERT INTO dbo.Employees (
          user_id, name, age, status, gender, pan, marital_status, spouse_name, aadhar,
          date_of_birth, date_of_joining, date_of_exit, bank_account_number, ifsc_code, pf_status, uan_no,
          base_salary, hra, allowances, deductions, state, professional_tax, tds, created_at
        )
        OUTPUT INSERTED.id
        VALUES (
          @userId, @name, @age, @status, @gender, @pan, @maritalStatus, @spouseName, @aadhar,
          @dateOfBirth, @dateOfJoining, @dateOfExit, @bankAccountNumber, @ifscCode, @pfStatus, @uanNo,
          @baseSalary, @hra, @allowances, @deductions, @state, @professionalTax, @tds, SYSUTCDATETIME()
        );
      `);

    const newId = insertResult.recordset[0].id;

    return ok(res, {
      message: 'Employee record created successfully',
      employeeId: newId
    });
  } catch (err) {
    console.error('SQL INSERT ERROR:', err.message);
    return res.status(400).json({ success: false, error: 'DB Error: ' + err.message });
  }
}));

// PUT /api/admin/employees/:id/salary - Update salary details for an employee
adminRoutes.put('/employees/:id/salary', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const employeeId = Number(req.params.id);
  const { base_salary, hra, allowances, deductions, state, professional_tax, tds, tax_regime, tax_declarations_json } = req.body;

  const numericErrors = [];
  const checkNonNegative = (val, name) => {
    if (val !== undefined && val !== null && (isNaN(Number(val)) || Number(val) < 0)) {
      numericErrors.push(`${name} must be a non-negative number.`);
    }
  };
  checkNonNegative(base_salary, 'Base Salary');
  checkNonNegative(hra, 'HRA');
  checkNonNegative(allowances, 'Allowances');
  checkNonNegative(deductions, 'Deductions');
  checkNonNegative(professional_tax, 'Professional Tax');
  checkNonNegative(tds, 'TDS');

  if (numericErrors.length > 0) {
    return res.status(400).json({
      success: false,
      error: numericErrors.join(' ')
    });
  }

  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;

  const result = await pool.request()
    .input('userId', sql.Int, userId)
    .input('employeeId', sql.Int, employeeId)
    .input('baseSalary', sql.Decimal(18, 2), base_salary ? Number(base_salary) : 0)
    .input('hra', sql.Decimal(18, 2), hra ? Number(hra) : 0)
    .input('allowances', sql.Decimal(18, 2), allowances ? Number(allowances) : 0)
    .input('deductions', sql.Decimal(18, 2), deductions ? Number(deductions) : 0)
    .input('state', sql.NVarChar(100), state || 'Karnataka')
    .input('professionalTax', sql.Decimal(18, 2), professional_tax ? Number(professional_tax) : 0)
    .input('tds', sql.Decimal(18, 2), tds ? Number(tds) : 0)
    .input('taxRegime', sql.NVarChar(20), tax_regime || 'New')
    .input('taxDeclarations', sql.NVarChar(sql.MAX), tax_declarations_json ? JSON.stringify(tax_declarations_json) : null)
    .query(`
      UPDATE dbo.Employees
      SET base_salary = @baseSalary,
          hra = @hra,
          allowances = @allowances,
          deductions = @deductions,
          state = @state,
          professional_tax = @professionalTax,
          tds = @tds,
          tax_regime = @taxRegime,
          tax_declarations_json = @taxDeclarations,
          updated_at = SYSUTCDATETIME()
      WHERE id = @employeeId AND user_id = @userId;
    `);

  if (result.rowsAffected[0] === 0) {
    return res.status(404).json({ success: false, error: 'Employee not found or unauthorized' });
  }

  return ok(res, { message: 'Salary and Tax details updated successfully' });
}));

// DELETE /api/admin/employees/:id - Remove an employee record for the current tenant user
adminRoutes.delete('/employees/:id', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const employeeId = Number(req.params.id);
  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;

  const deleteResult = await suitePool.request()
    .input('id', sql.Int, employeeId)
    .input('userId', sql.Int, userId)
    .query(`
      DELETE FROM dbo.Employees
      WHERE id = @id AND user_id = @userId;
    `);

  if (deleteResult.rowsAffected[0] === 0) {
    return res.status(404).json({ success: false, error: 'Employee not found or unauthorized' });
  }

  return ok(res, { message: 'Employee record deleted successfully' });
}));

// GET /api/admin/employees/attendance - Fetch attendance records for a specific date
adminRoutes.get('/employees/attendance', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const dateStr = req.query.date; // YYYY-MM-DD
  if (!dateStr) {
    return res.status(400).json({ success: false, error: 'Date is required' });
  }

  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;
  const result = await pool.request()
    .input('userId', sql.Int, userId)
    .input('attendanceDate', sql.Date, dateStr)
    .query(`
      SELECT e.id AS employee_id, e.name, a.status, a.attendance_date
      FROM dbo.Employees e
      LEFT JOIN dbo.Attendance a ON e.id = a.employee_id AND a.attendance_date = @attendanceDate
      WHERE e.user_id = @userId
      ORDER BY e.id DESC;
    `);

  return ok(res, { attendance: result.recordset });
}));

// POST /api/admin/employees/attendance - Update or record attendance for a specific date
adminRoutes.post('/employees/attendance', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const { employee_id, attendance_date, status } = req.body;

  if (!employee_id || !attendance_date || !status) {
    return res.status(400).json({ success: false, error: 'employee_id, attendance_date, and status are required' });
  }

  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;

  // First verify employee belongs to user
  const checkEmp = await pool.request()
    .input('employeeId', sql.Int, employee_id)
    .input('userId', sql.Int, userId)
    .query('SELECT 1 FROM dbo.Employees WHERE id = @employeeId AND user_id = @userId');

  if (checkEmp.rowsAffected[0] === 0) {
    return res.status(404).json({ success: false, error: 'Employee not found or unauthorized' });
  }

  // Upsert using MERGE
  await pool.request()
    .input('employeeId', sql.Int, employee_id)
    .input('attendanceDate', sql.Date, attendance_date)
    .input('status', sql.NVarChar(50), status)
    .query(`
      MERGE dbo.Attendance AS target
      USING (SELECT @employeeId AS employee_id, @attendanceDate AS attendance_date) AS source
      ON (target.employee_id = source.employee_id AND target.attendance_date = source.attendance_date)
      WHEN MATCHED THEN
          UPDATE SET status = @status, updated_at = SYSUTCDATETIME()
      WHEN NOT MATCHED THEN
          INSERT (employee_id, attendance_date, status, created_at)
          VALUES (source.employee_id, source.attendance_date, @status, SYSUTCDATETIME());
    `);

  return ok(res, { message: 'Attendance status recorded successfully' });
}));

// =============================================
// PAYROLL ROUTES
// =============================================

// GET /api/admin/payroll/runs - Fetch all payroll runs for the current user
adminRoutes.get('/payroll/runs', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;

  const result = await pool.request()
    .input('userId', sql.Int, userId)
    .query(`
      SELECT id, user_id, month, year, status,
             total_gross, total_deductions, total_net,
             total_pf, total_esi, total_pt, total_tds, total_lwp_deductions,
             processed_at, created_at, updated_at
      FROM dbo.PayrollRuns
      WHERE user_id = @userId
      ORDER BY year DESC, month DESC;
    `);

  return ok(res, {
    runs: result.recordset.map(row => ({
      id: row.id,
      user_id: row.user_id,
      month: row.month,
      year: row.year,
      status: row.status,
      total_gross: row.total_gross ? Number(row.total_gross) : 0,
      total_deductions: row.total_deductions ? Number(row.total_deductions) : 0,
      total_net: row.total_net ? Number(row.total_net) : 0,
      total_pf: row.total_pf ? Number(row.total_pf) : 0,
      total_esi: row.total_esi ? Number(row.total_esi) : 0,
      total_pt: row.total_pt ? Number(row.total_pt) : 0,
      total_tds: row.total_tds ? Number(row.total_tds) : 0,
      total_lwp_deductions: row.total_lwp_deductions ? Number(row.total_lwp_deductions) : 0,
      processed_at: row.processed_at,
      created_at: row.created_at,
      updated_at: row.updated_at
    }))
  });
}));

// POST /api/admin/payroll/runs - Create a new payroll run
adminRoutes.post('/payroll/runs', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const { month, year } = req.body;

  const monthNum = parseInt(month, 10);
  const yearNum = parseInt(year, 10);

  if (isNaN(monthNum) || monthNum < 1 || monthNum > 12) {
    return res.status(400).json({ success: false, error: 'Month must be between 1 and 12.' });
  }
  if (isNaN(yearNum) || yearNum < 2020) {
    return res.status(400).json({ success: false, error: 'Year must be 2020 or later.' });
  }

  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;

  // Check for duplicate
  const existing = await pool.request()
    .input('userId', sql.Int, userId)
    .input('month', sql.Int, monthNum)
    .input('year', sql.Int, yearNum)
    .query(`
      SELECT TOP 1 id FROM dbo.PayrollRuns
      WHERE user_id = @userId AND month = @month AND year = @year;
    `);

  if (existing.recordset[0]) {
    return res.status(409).json({ success: false, error: 'A payroll run already exists for this month and year.' });
  }

  const insertResult = await suitePool.request()
    .input('userId', sql.Int, userId)
    .input('month', sql.Int, monthNum)
    .input('year', sql.Int, yearNum)
    .query(`
      INSERT INTO dbo.PayrollRuns (user_id, month, year, status, created_at)
      OUTPUT INSERTED.id
      VALUES (@userId, @month, @year, 'Draft', SYSUTCDATETIME());
    `);

  const newId = insertResult.recordset[0].id;

  return ok(res, {
    message: 'Payroll run created successfully',
    run: { id: newId, month: monthNum, year: yearNum, status: 'Draft' }
  });
}));

// POST /api/admin/payroll/runs/:id/process - Process a payroll run
adminRoutes.post('/payroll/runs/:id/process', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const runId = Number(req.params.id);

  if (!runId || isNaN(runId)) {
    return res.status(400).json({ success: false, error: 'Invalid payroll run ID.' });
  }

  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;

  // Verify run belongs to user and is in Draft status
  const runResult = await pool.request()
    .input('runId', sql.Int, runId)
    .input('userId', sql.Int, userId)
    .query(`
      SELECT id, month, year, status
      FROM dbo.PayrollRuns
      WHERE id = @runId AND user_id = @userId;
    `);

  if (!runResult.recordset[0]) {
    return res.status(404).json({ success: false, error: 'Payroll run not found or access denied.' });
  }

  const run = runResult.recordset[0];
  if (run.status !== 'Draft') {
    return res.status(400).json({ success: false, error: 'Only Draft payroll runs can be processed.' });
  }

  const payrollMonth = run.month;
  const payrollYear = run.year;

  // Fetch ALL employees for the user (not paginated)
  const employeesResult = await pool.request()
    .input('userId', sql.Int, userId)
    .query(`
      SELECT id, name, base_salary, hra, allowances, deductions,
             professional_tax, tds, pf_status
      FROM dbo.Employees
      WHERE user_id = @userId AND status = 'Active';
    `);

  const employees = employeesResult.recordset;
  if (employees.length === 0) {
    return res.status(400).json({ success: false, error: 'No active employees found to process payroll.' });
  }

  // Build start/end dates for attendance LWP query
  // Month is 1-indexed; build first and last day of that month
  const startDate = `${payrollYear}-${String(payrollMonth).padStart(2, '0')}-01`;
  const lastDay = new Date(payrollYear, payrollMonth, 0).getDate();
  const endDate = `${payrollYear}-${String(payrollMonth).padStart(2, '0')}-${String(lastDay).padStart(2, '0')}`;

  // Fetch LWP (Absent) counts for all employees in one query
  const lwpResult = await pool.request()
    .input('userId', sql.Int, userId)
    .input('startDate', sql.Date, startDate)
    .input('endDate', sql.Date, endDate)
    .query(`
      SELECT A.employee_id, COUNT(*) AS absent_count
      FROM dbo.Attendance A
      JOIN dbo.Employees E ON A.employee_id = E.id
      WHERE E.user_id = @userId
        AND A.attendance_date >= @startDate
        AND A.attendance_date <= @endDate
        AND A.status = 'Absent'
      GROUP BY A.employee_id;
    `);

  const lwpMap = {};
  for (const row of lwpResult.recordset) {
    lwpMap[row.employee_id] = row.absent_count;
  }

  // Fetch pending approved expenses for all employees
  const expensesResult = await pool.request()
    .input('userId', sql.Int, userId)
    .query(`
      SELECT EX.id, EX.employee_id, EX.amount
      FROM dbo.Expenses EX
      JOIN dbo.Employees E ON EX.employee_id = E.id
      WHERE E.user_id = @userId AND EX.status = 'Approved' AND EX.payroll_run_id IS NULL;
    `);

  const expenseMap = {};
  const expenseIdsMap = {};
  for (const row of expensesResult.recordset) {
    if (!expenseMap[row.employee_id]) {
      expenseMap[row.employee_id] = 0;
      expenseIdsMap[row.employee_id] = [];
    }
    expenseMap[row.employee_id] += Number(row.amount);
    expenseIdsMap[row.employee_id].push(row.id);
  }

  // Standard working days per month
  const STANDARD_WORKING_DAYS = 26;

  // Calculate payroll for each employee
  const transactions = [];
  let grandTotalGross = 0;
  let grandTotalDeductions = 0;
  let grandTotalNet = 0;
  let grandTotalPf = 0;
  let grandTotalEsi = 0;
  let grandTotalPt = 0;
  let grandTotalTds = 0;
  let grandTotalLwp = 0;

  for (const emp of employees) {
    const baseSalary = emp.base_salary ? Number(emp.base_salary) : 0;
    const empHra = emp.hra ? Number(emp.hra) : 0;
    const baseEmpAllowances = emp.allowances ? Number(emp.allowances) : 0;
    const expenseReimbursement = expenseMap[emp.id] || 0;
    const empAllowances = baseEmpAllowances + expenseReimbursement;
    const empDeductions = emp.deductions ? Number(emp.deductions) : 0;
    const empPt = emp.professional_tax ? Number(emp.professional_tax) : 0;
    const empTds = emp.tds ? Number(emp.tds) : 0;

    const grossSalary = baseSalary + empHra + empAllowances;

    // LWP calculation
    const lwpDays = lwpMap[emp.id] || 0;
    const lwpDeduction = Math.round((grossSalary / STANDARD_WORKING_DAYS) * lwpDays * 100) / 100;

    // PF Employee: 12% of base_salary, capped at 1800 if base <= 15000
    let pfEmployee = 0;
    if (emp.pf_status === 'Applicable') {
      if (baseSalary <= 15000) {
        pfEmployee = Math.min(Math.round(baseSalary * 0.12 * 100) / 100, 1800);
      } else {
        pfEmployee = Math.round(baseSalary * 0.12 * 100) / 100;
      }
    }
    // PF Employer: Same as PF Employee
    const pfEmployer = pfEmployee;

    // ESI Employee: 0.75% of gross if gross <= 21000, else 0
    let esiEmployee = 0;
    let esiEmployer = 0;
    if (grossSalary <= 21000) {
      esiEmployee = Math.round(grossSalary * 0.0075 * 100) / 100;
      esiEmployer = Math.round(grossSalary * 0.0325 * 100) / 100;
    }

    // Net Salary = gross - lwp_deduction - pf_employee - esi_employee - professional_tax - tds - deductions
    const netSalary = Math.round((grossSalary - lwpDeduction - pfEmployee - esiEmployee - empPt - empTds - empDeductions) * 100) / 100;

    const totalDeductionsForEmp = Math.round((lwpDeduction + pfEmployee + esiEmployee + empPt + empTds + empDeductions) * 100) / 100;

    transactions.push({
      employeeId: emp.id,
      baseSalary,
      hra: empHra,
      allowances: empAllowances,
      grossSalary,
      workingDays: STANDARD_WORKING_DAYS,
      lwpDays,
      lwpDeduction,
      pfEmployee,
      pfEmployer,
      esiEmployee,
      esiEmployer,
      professionalTax: empPt,
      tds: empTds,
      deductions: empDeductions,
      netSalary
    });

    grandTotalGross += grossSalary;
    grandTotalDeductions += totalDeductionsForEmp;
    grandTotalNet += netSalary;
    grandTotalPf += pfEmployee + pfEmployer;
    grandTotalEsi += esiEmployee + esiEmployer;
    grandTotalPt += empPt;
    grandTotalTds += empTds;
    grandTotalLwp += lwpDeduction;
  }

  // Round grand totals
  grandTotalGross = Math.round(grandTotalGross * 100) / 100;
  grandTotalDeductions = Math.round(grandTotalDeductions * 100) / 100;
  grandTotalNet = Math.round(grandTotalNet * 100) / 100;
  grandTotalPf = Math.round(grandTotalPf * 100) / 100;
  grandTotalEsi = Math.round(grandTotalEsi * 100) / 100;
  grandTotalPt = Math.round(grandTotalPt * 100) / 100;
  grandTotalTds = Math.round(grandTotalTds * 100) / 100;
  grandTotalLwp = Math.round(grandTotalLwp * 100) / 100;

  // Use SQL transaction for atomicity
  const transaction = new sql.Transaction(suitePool);
  await transaction.begin();
  try {
    // Insert a PayrollTransactions row for each employee
    for (const txn of transactions) {
      const request = new sql.Request(transaction);
        const txInsertRes = await request
        .input('payrollRunId', sql.Int, runId)
        .input('employeeId', sql.Int, txn.employeeId)
        .input('baseSalary', sql.Decimal(18, 2), txn.baseSalary)
        .input('hra', sql.Decimal(18, 2), txn.hra)
        .input('allowances', sql.Decimal(18, 2), txn.allowances)
        .input('grossSalary', sql.Decimal(18, 2), txn.grossSalary)
        .input('deductions', sql.Decimal(18, 2), txn.deductions)
        .input('pfEmployee', sql.Decimal(18, 2), txn.pfEmployee)
        .input('pfEmployer', sql.Decimal(18, 2), txn.pfEmployer)
        .input('esiEmployee', sql.Decimal(18, 2), txn.esiEmployee)
        .input('esiEmployer', sql.Decimal(18, 2), txn.esiEmployer)
        .input('professionalTax', sql.Decimal(18, 2), txn.professionalTax)
        .input('tds', sql.Decimal(18, 2), txn.tds)
        .input('lwpDays', sql.Int, txn.lwpDays)
        .input('lwpDeduction', sql.Decimal(18, 2), txn.lwpDeduction)
        .input('workingDays', sql.Int, txn.workingDays)
        .input('netSalary', sql.Decimal(18, 2), txn.netSalary)
        .query(`
          INSERT INTO dbo.PayrollTransactions (
            payroll_run_id, employee_id, base_salary, hra, allowances, gross_salary,
            deductions, pf_employee, pf_employer, esi_employee, esi_employer,
            professional_tax, tds, lwp_days, lwp_deduction, working_days,
            net_salary, payment_status, created_at
          ) OUTPUT INSERTED.id VALUES (
            @payrollRunId, @employeeId, @baseSalary, @hra, @allowances, @grossSalary,
            @deductions, @pfEmployee, @pfEmployer, @esiEmployee, @esiEmployer,
            @professionalTax, @tds, @lwpDays, @lwpDeduction, @workingDays,
            @netSalary, 'Pending', SYSUTCDATETIME()
          );
        `);

      const insertedTxnId = txInsertRes.recordset[0].id;

      await new sql.Request(transaction)
        .input('txnId', sql.Int, insertedTxnId)
        .input('basic', sql.Decimal(18, 2), txn.baseSalary)
        .input('hra', sql.Decimal(18, 2), txn.hra)
        .input('allowances', sql.Decimal(18, 2), txn.allowances)
        .query(`
          INSERT INTO dbo.PayrollEarnings (transaction_id, earning_code, amount) VALUES 
          (@txnId, 'BASIC', @basic),
          (@txnId, 'HRA', @hra),
          (@txnId, 'ALLOWANCES', @allowances);
        `);

      await new sql.Request(transaction)
        .input('txnId', sql.Int, insertedTxnId)
        .input('pt', sql.Decimal(18, 2), txn.professionalTax)
        .input('tds', sql.Decimal(18, 2), txn.tds)
        .input('pf', sql.Decimal(18, 2), txn.pfEmployee)
        .input('esi', sql.Decimal(18, 2), txn.esiEmployee)
        .input('lwp', sql.Decimal(18, 2), txn.lwpDeduction)
        .query(`
          INSERT INTO dbo.PayrollDeductions (transaction_id, deduction_code, amount) VALUES 
          (@txnId, 'PROF_TAX', @pt),
          (@txnId, 'TDS', @tds),
          (@txnId, 'PF_EMP', @pf),
          (@txnId, 'ESI_EMP', @esi),
          (@txnId, 'LWP', @lwp);
        `);

      const maxBaseForEps = Math.min(txn.baseSalary, 15000);
      const epsAmount = txn.pfEmployer > 0 ? Math.round(maxBaseForEps * 0.0833 * 100) / 100 : 0;
      const epfAmount = txn.pfEmployer > 0 ? txn.pfEmployer - epsAmount : 0;
      const esiErAmount = txn.esiEmployer;

      await new sql.Request(transaction)
        .input('txnId', sql.Int, insertedTxnId)
        .input('eps', sql.Decimal(18, 2), epsAmount)
        .input('epf', sql.Decimal(18, 2), epfAmount)
        .input('esi', sql.Decimal(18, 2), esiErAmount)
        .query(`
          INSERT INTO dbo.PayrollContributions (transaction_id, contribution_code, amount) VALUES 
          (@txnId, 'EPS', @eps),
          (@txnId, 'EPF', @epf),
          (@txnId, 'ESI', @esi);
        `);

      const crypto = require('crypto');
      const hash = crypto.createHash('sha256').update(insertedTxnId.toString() + txn.netSalary.toString()).digest('hex');
      await new sql.Request(transaction)
        .input('txnId', sql.Int, insertedTxnId)
        .input('hash', sql.VarChar(255), hash)
        .query(`
          INSERT INTO dbo.PayrollProofs (transaction_id, merkle_root_hash, created_at) VALUES 
          (@txnId, @hash, SYSUTCDATETIME());
        `);

      // Tag expenses if any
      const expIds = expenseIdsMap[txn.employeeId];
      if (expIds && expIds.length > 0) {
        for (const expId of expIds) {
          const expRequest = new sql.Request(transaction);
          await expRequest
            .input('expId', sql.Int, expId)
            .input('runId', sql.Int, runId)
            .query(`UPDATE dbo.Expenses SET payroll_run_id = @runId WHERE id = @expId`);
        }
      }
    }

    // Update the PayrollRuns row with totals and status = 'Completed'
    const updateRequest = new sql.Request(transaction);
    await updateRequest
      .input('runId', sql.Int, runId)
      .input('totalGross', sql.Decimal(18, 2), grandTotalGross)
      .input('totalDeductions', sql.Decimal(18, 2), grandTotalDeductions)
      .input('totalNet', sql.Decimal(18, 2), grandTotalNet)
      .input('totalPf', sql.Decimal(18, 2), grandTotalPf)
      .input('totalEsi', sql.Decimal(18, 2), grandTotalEsi)
      .input('totalPt', sql.Decimal(18, 2), grandTotalPt)
      .input('totalTds', sql.Decimal(18, 2), grandTotalTds)
      .input('totalLwpDeductions', sql.Decimal(18, 2), grandTotalLwp)
      .query(`
        UPDATE dbo.PayrollRuns
        SET status = 'Completed',
            total_gross = @totalGross,
            total_deductions = @totalDeductions,
            total_net = @totalNet,
            total_pf = @totalPf,
            total_esi = @totalEsi,
            total_pt = @totalPt,
            total_tds = @totalTds,
            total_lwp_deductions = @totalLwpDeductions,
            processed_at = SYSUTCDATETIME(),
            updated_at = SYSUTCDATETIME()
        WHERE id = @runId;
      `);

    await transaction.commit();
  } catch (err) {
    await transaction.rollback();
    throw err;
  }

  return ok(res, {
    message: 'Payroll run processed successfully',
    summary: {
      runId,
      month: payrollMonth,
      year: payrollYear,
      employeeCount: transactions.length,
      totalGross: grandTotalGross,
      totalDeductions: grandTotalDeductions,
      totalNet: grandTotalNet,
      totalPf: grandTotalPf,
      totalEsi: grandTotalEsi,
      totalPt: grandTotalPt,
      totalTds: grandTotalTds,
      totalLwpDeductions: grandTotalLwp
    }
  });
}));

// GET /api/admin/payroll/runs/:id/transactions - Fetch all transactions for a payroll run
adminRoutes.get('/payroll/runs/:id/transactions', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const runId = Number(req.params.id);

  if (!runId || isNaN(runId)) {
    return res.status(400).json({ success: false, error: 'Invalid payroll run ID.' });
  }

  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;

  // Verify run belongs to user
  const runCheck = await pool.request()
    .input('runId', sql.Int, runId)
    .input('userId', sql.Int, userId)
    .query('SELECT TOP 1 id FROM dbo.PayrollRuns WHERE id = @runId AND user_id = @userId;');

  if (!runCheck.recordset[0]) {
    return res.status(404).json({ success: false, error: 'Payroll run not found or access denied.' });
  }

  const result = await pool.request()
    .input('runId', sql.Int, runId)
    .query(`
      SELECT pt.id, pt.payroll_run_id, pt.employee_id,
             e.name AS employee_name,
             pt.base_salary, pt.hra, pt.allowances, pt.gross_salary,
             pt.deductions, pt.pf_employee, pt.pf_employer,
             pt.esi_employee, pt.esi_employer,
             pt.professional_tax, pt.tds,
             pt.lwp_days, pt.lwp_deduction, pt.working_days,
             pt.net_salary, pt.payment_status, pt.created_at
      FROM dbo.PayrollTransactions pt
      INNER JOIN dbo.Employees e ON pt.employee_id = e.id
      WHERE pt.payroll_run_id = @runId
      ORDER BY e.name ASC;
    `);

  return ok(res, {
    transactions: result.recordset.map(row => ({
      id: row.id,
      payroll_run_id: row.payroll_run_id,
      employee_id: row.employee_id,
      employee_name: row.employee_name,
      base_salary: row.base_salary ? Number(row.base_salary) : 0,
      hra: row.hra ? Number(row.hra) : 0,
      allowances: row.allowances ? Number(row.allowances) : 0,
      gross_salary: row.gross_salary ? Number(row.gross_salary) : 0,
      deductions: row.deductions ? Number(row.deductions) : 0,
      pf_employee: row.pf_employee ? Number(row.pf_employee) : 0,
      pf_employer: row.pf_employer ? Number(row.pf_employer) : 0,
      esi_employee: row.esi_employee ? Number(row.esi_employee) : 0,
      esi_employer: row.esi_employer ? Number(row.esi_employer) : 0,
      professional_tax: row.professional_tax ? Number(row.professional_tax) : 0,
      tds: row.tds ? Number(row.tds) : 0,
      lwp_days: row.lwp_days || 0,
      lwp_deduction: row.lwp_deduction ? Number(row.lwp_deduction) : 0,
      working_days: row.working_days || 26,
      net_salary: row.net_salary ? Number(row.net_salary) : 0,
      payment_status: row.payment_status,
      created_at: row.created_at
    }))
  });
}));

const { sendNativeEmail } = require('../utils/nativeMailer');
const crypto = require('crypto');

// POST /api/admin/payroll/runs/:id/dispatch - Dispatch payslips via raw SMTP magic links
adminRoutes.post('/payroll/runs/:id/dispatch', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const runId = Number(req.params.id);
  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;

  const runCheck = await pool.request()
    .input('runId', sql.Int, runId)
    .input('userId', sql.Int, userId)
    .query("SELECT TOP 1 id, status, month, year FROM dbo.PayrollRuns WHERE id = @runId AND user_id = @userId;");

  if (!runCheck.recordset[0]) throw httpError(404, 'Payroll run not found.');
  if (runCheck.recordset[0].status !== 'Completed') throw httpError(400, 'Only completed payroll runs can be dispatched.');

  const runInfo = runCheck.recordset[0];

  const result = await pool.request()
    .input('runId', sql.Int, runId)
    .query(`
      SELECT pt.id as transaction_id, pt.employee_id, e.email, e.name
      FROM dbo.PayrollTransactions pt
      JOIN dbo.Employees e ON pt.employee_id = e.id
      WHERE pt.payroll_run_id = @runId AND e.email IS NOT NULL AND e.email != ''
    `);

  const monthNames = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
  const monthYear = monthNames[runInfo.month - 1] + ' ' + runInfo.year;
  const basePath = req.headers.origin || 'http://localhost:3000';

  const { mailDaemon } = require('../utils/mailDaemon');
  let queuedCount = 0;
  for (const row of result.recordset) {
    const magicStr = `${runId}:${row.employee_id}`;
    const token = crypto.createHmac('sha256', env.jwtSecret).update(magicStr).digest('hex');
    const magicLink = `${basePath}/paradigm/payslip.html?runId=${runId}&empId=${row.employee_id}&token=${token}`;

    const html = `<div style="font-family: monospace; padding: 20px;">
        <h2>Paradigm Payroll Engine</h2>
        <p>Hello ${row.name},</p>
        <p>Your mathematical payslip for ${monthYear} has been generated.</p>
        <p>Please click the cryptographically signed magic link below to natively render your PDF payslip:</p>
        <p><a href="${magicLink}" style="background: #000; color: #fff; padding: 10px 15px; text-decoration: none;">VIEW PAYSLIP</a></p>
        <p style="font-size: 11px; opacity: 0.6; margin-top: 30px;">(This link is cryptographically tied to your device session. Do not share it.)</p>
    </div>`;

    mailDaemon.enqueue({
        to: row.email,
        subject: `Payslip for ${monthYear} - Paradigm`,
        html: html
    });
    queuedCount++;
  }

  return ok(res, { message: `Successfully pushed ${queuedCount} payslip emails to the background Daemon queue.` });
}));

// GET /api/admin/payroll/runs/:id/payslip/:employeeId - Fetch single transaction for payslip
adminRoutes.get('/payroll/runs/:id/payslip/:employeeId', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const runId = Number(req.params.id);
  const employeeId = Number(req.params.employeeId);

  if (!runId || isNaN(runId) || !employeeId || isNaN(employeeId)) {
    return res.status(400).json({ success: false, error: 'Invalid payroll run ID or employee ID.' });
  }

  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;

  // Verify run belongs to user
  const runCheck = await pool.request()
    .input('runId', sql.Int, runId)
    .input('userId', sql.Int, userId)
    .query('SELECT TOP 1 id, month, year FROM dbo.PayrollRuns WHERE id = @runId AND user_id = @userId;');

  if (!runCheck.recordset[0]) {
    return res.status(404).json({ success: false, error: 'Payroll run not found or access denied.' });
  }

  const payrollRun = runCheck.recordset[0];

  const result = await pool.request()
    .input('runId', sql.Int, runId)
    .input('employeeId', sql.Int, employeeId)
    .input('userId', sql.Int, userId)
    .query(`
      SELECT pt.id, pt.payroll_run_id, pt.employee_id,
             pt.base_salary, pt.hra, pt.allowances, pt.gross_salary,
             pt.deductions, pt.pf_employee, pt.pf_employer,
             pt.esi_employee, pt.esi_employer,
             pt.professional_tax, pt.tds,
             pt.lwp_days, pt.lwp_deduction, pt.working_days,
             pt.net_salary, pt.payment_status, pt.created_at,
             e.name AS employee_name, e.pan, e.bank_account_number,
             e.ifsc_code, e.date_of_joining, e.uan_no, e.pf_status,
             c.name AS company_name, c.address AS company_address, c.cin AS company_cin,
             jp.department, jp.designation,
             kyc.document_number AS aadhar_number
      FROM dbo.PayrollTransactions pt
      INNER JOIN dbo.Employees e ON pt.employee_id = e.id
      LEFT JOIN dbo.Companies c ON e.company_id = c.id
      LEFT JOIN dbo.EmployeeJobProfiles jp ON e.id = jp.employee_id
      LEFT JOIN dbo.EmployeeKYC kyc ON e.id = kyc.employee_id AND kyc.document_type = 'AADHAR'
      WHERE pt.payroll_run_id = @runId
        AND pt.employee_id = @employeeId
        AND e.user_id = @userId;
    `);

  if (!result.recordset[0]) {
    return res.status(404).json({ success: false, error: 'Payslip not found for this employee in the specified payroll run.' });
  }

  const row = result.recordset[0];

  const formatDbDate = (d) => {
    if (!d) return null;
    try { return d.toISOString().split('T')[0]; } catch (e) { return null; }
  };

  const numberToWordsIndian = (num) => {
    if (num === 0) return 'Zero Rupees Only';
    const a = ['', 'One ', 'Two ', 'Three ', 'Four ', 'Five ', 'Six ', 'Seven ', 'Eight ', 'Nine ', 'Ten ', 'Eleven ', 'Twelve ', 'Thirteen ', 'Fourteen ', 'Fifteen ', 'Sixteen ', 'Seventeen ', 'Eighteen ', 'Nineteen '];
    const b = ['', '', 'Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'];
    const inWords = (n) => {
      let str = '';
      if (n > 99) { str += a[Math.floor(n / 100)] + 'Hundred '; n %= 100; }
      if (n > 19) { str += b[Math.floor(n / 10)] + ' '; n %= 10; }
      if (n > 0) { str += a[n]; }
      return str.trim();
    };
    let str = '';
    let n = Math.floor(num);
    if (n >= 10000000) { str += inWords(Math.floor(n / 10000000)) + ' Crore '; n %= 10000000; }
    if (n >= 100000) { str += inWords(Math.floor(n / 100000)) + ' Lakh '; n %= 100000; }
    if (n >= 1000) { str += inWords(Math.floor(n / 1000)) + ' Thousand '; n %= 1000; }
    if (n > 0) { str += inWords(n); }
    return str.trim() + ' Rupees Only';
  };

  const netSalaryVal = row.net_salary ? Number(row.net_salary) : 0;
  const baseSalaryVal = row.base_salary ? Number(row.base_salary) : 0;
  const pfEmployerVal = row.pf_employer ? Number(row.pf_employer) : 0;
  const maxBaseForEps = Math.min(baseSalaryVal, 15000);
  const epsAmount = pfEmployerVal > 0 ? Math.round(maxBaseForEps * 0.0833 * 100) / 100 : 0;
  const epfAmount = pfEmployerVal > 0 ? pfEmployerVal - epsAmount : 0;

  return ok(res, {
    payslip: {
      id: row.id,
      payroll_run_id: row.payroll_run_id,
      month: payrollRun.month,
      year: payrollRun.year,
      employee_id: row.employee_id,
      employee_name: row.employee_name,
      pan: decryptPII(row.pan),
      bank_account_number: decryptPII(row.bank_account_number),
      ifsc_code: decryptPII(row.ifsc_code),
      uan_no: decryptPII(row.uan_no),
      aadhar_number: row.aadhar_number ? decryptPII(row.aadhar_number) : null,
      date_of_joining: formatDbDate(row.date_of_joining),
      department: row.department,
      designation: row.designation,
      pf_status: row.pf_status,
      base_salary: baseSalaryVal,
      hra: row.hra ? Number(row.hra) : 0,
      allowances: row.allowances ? Number(row.allowances) : 0,
      gross_salary: row.gross_salary ? Number(row.gross_salary) : 0,
      deductions: row.deductions ? Number(row.deductions) : 0,
      pf_employee: row.pf_employee ? Number(row.pf_employee) : 0,
      pf_employer: pfEmployerVal,
      esi_employee: row.esi_employee ? Number(row.esi_employee) : 0,
      esi_employer: row.esi_employer ? Number(row.esi_employer) : 0,
      professional_tax: row.professional_tax ? Number(row.professional_tax) : 0,
      tds: row.tds ? Number(row.tds) : 0,
      lwp_days: row.lwp_days || 0,
      lwp_deduction: row.lwp_deduction ? Number(row.lwp_deduction) : 0,
      working_days: row.working_days || 26,
      net_salary: netSalaryVal,
      payment_status: row.payment_status,
      created_at: row.created_at,
      number_to_words: numberToWordsIndian(netSalaryVal),
      ctc_breakdown: {
        eps: epsAmount,
        epf: epfAmount
      },
      company_metadata: {
        name: row.company_name || 'Akin Analytics',
        address: row.company_address || '123 AI Park, Tech City',
        cin: row.company_cin || 'U72900MH2023PTC123456'
      }
    }
  });
}));


// POST /api/admin/employees/:id/credentials - Set employee credentials
adminRoutes.post('/employees/:id/credentials', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const empId = Number(req.params.id);
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ success: false, error: 'Email and password required' });
  }

  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;
  
  // Verify employee belongs to admin
  const empRes = await pool.request()
    .input('empId', sql.Int, empId)
    .input('userId', sql.Int, userId)
    .query(`SELECT id FROM dbo.Employees WHERE id = @empId AND user_id = @userId`);
    
  if (!empRes.recordset[0]) {
    return res.status(404).json({ success: false, error: 'Employee not found' });
  }

  const { hashPassword } = require('../services/auth.service');
  const passwordHash = await hashPassword(password);

  await pool.request()
    .input('empId', sql.Int, empId)
    .input('email', sql.NVarChar(255), email)
    .input('passwordHash', sql.NVarChar(255), passwordHash)
    .query(`UPDATE dbo.Employees SET email = @email, password_hash = @passwordHash WHERE id = @empId`);

  return ok(res, { message: 'Credentials generated successfully' });
}));

// GET /api/admin/leaves - Fetch all leaves
adminRoutes.get('/leaves', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;
  
  const result = await pool.request()
    .input('userId', sql.Int, userId)
    .query(`
      SELECT L.id, L.employee_id, E.name AS employee_name, L.type, L.start_date, L.end_date, L.reason, L.status, L.created_at
      FROM dbo.Leaves L
      JOIN dbo.Employees E ON L.employee_id = E.id
      WHERE E.user_id = @userId
      ORDER BY L.created_at DESC;
    `);

  return ok(res, { leaves: result.recordset });
}));

// POST /api/admin/leaves - Admin creates a leave for employee
adminRoutes.post('/leaves', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const { employee_id, type, start_date, end_date, reason } = req.body;
  
  if (!employee_id || !type || !start_date || !end_date) {
    return res.status(400).json({ success: false, error: 'Missing required fields' });
  }

  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;
  
  // Verify ownership
  const empRes = await pool.request()
    .input('empId', sql.Int, employee_id)
    .input('userId', sql.Int, userId)
    .query(`SELECT id FROM dbo.Employees WHERE id = @empId AND user_id = @userId`);
    
  if (!empRes.recordset[0]) return res.status(404).json({ success: false, error: 'Employee not found' });

  await pool.request()
    .input('empId', sql.Int, employee_id)
    .input('type', sql.NVarChar(50), type)
    .input('start', sql.Date, start_date)
    .input('end', sql.Date, end_date)
    .input('reason', sql.NVarChar(500), reason || null)
    .query(`
      INSERT INTO dbo.Leaves (employee_id, type, start_date, end_date, reason, status)
      VALUES (@empId, @type, @start, @end, @reason, 'Approved');
    `);

  return ok(res, { message: 'Leave created and approved' });
}));

// PUT /api/admin/leaves/:id/status - Approve or reject leave
adminRoutes.put('/leaves/:id/status', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const leaveId = Number(req.params.id);
  const { status } = req.body;
  
  if (status !== 'Approved' && status !== 'Rejected') {
    return res.status(400).json({ success: false, error: 'Status must be Approved or Rejected' });
  }

  const corePool = await getDbPool();
  const suitePool = await getDbPool();
  const pool = corePool;
  
  // Update if owned
  const updateRes = await pool.request()
    .input('leaveId', sql.Int, leaveId)
    .input('userId', sql.Int, userId)
    .input('status', sql.NVarChar(50), status)
    .query(`
      UPDATE L
      SET L.status = @status, L.updated_at = SYSUTCDATETIME()
      FROM dbo.Leaves L
      JOIN dbo.Employees E ON L.employee_id = E.id
      WHERE L.id = @leaveId AND E.user_id = @userId;
    `);
    
  return ok(res, { message: 'Leave status updated' });
}));

// ============================================================================
// EXTERNAL SOURCING & INTEGRATIONS (LinkedIn, Indeed)
// ============================================================================

adminRoutes.get('/integrations', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const corePool = await getDbPool();
  const result = await corePool.request()
    .input('userId', sql.Int, userId)
    .query('SELECT platform, status, created_at FROM dbo.OAuthIntegrations WHERE user_id = @userId');
  ok(res, { integrations: result.recordset });
}));

adminRoutes.post('/integrations/link', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const { platform } = req.body;
  if (!platform || !['LinkedIn', 'Indeed'].includes(platform)) return fail(res, 400, 'Invalid platform');
  
  const corePool = await getDbPool();
  
  await corePool.request()
    .input('userId', sql.Int, userId)
    .input('platform', sql.NVarChar(50), platform)
    .input('token', sql.NVarChar(sql.MAX), 'mock_oauth_token_' + Date.now())
    .query(`
      IF EXISTS (SELECT 1 FROM dbo.OAuthIntegrations WHERE user_id = @userId AND platform = @platform)
        UPDATE dbo.OAuthIntegrations SET status = 'Linked', auth_token = @token, updated_at = SYSUTCDATETIME() 
        WHERE user_id = @userId AND platform = @platform;
      ELSE
        INSERT INTO dbo.OAuthIntegrations (user_id, platform, auth_token, status)
        VALUES (@userId, @platform, @token, 'Linked');
    `);
    
  ok(res, { success: true, platform });
}));

adminRoutes.post('/recruitment/sourcing/boolean-search', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const { query, platform } = req.body;
  
  const corePool = await getDbPool();
  const check = await corePool.request()
    .input('userId', sql.Int, userId)
    .input('platform', sql.NVarChar(50), platform || 'LinkedIn')
    .query("SELECT 1 FROM dbo.OAuthIntegrations WHERE user_id = @userId AND platform = @platform AND status = 'Linked'");
    
  if (check.recordset.length === 0) {
    return fail(res, 403, `${platform || 'LinkedIn'} Account Not Linked. Please authenticate first.`);
  }
  
  const tokens = query.match(/"([^"]+)"|\b(AND|OR|NOT)\b/g) || [];
  const titles = ['Senior Full Stack Engineer', 'Lead Developer', 'Backend Architect', 'Frontend Specialist'];
  const companies = ['TechCorp', 'Innovatech', 'DataSync', 'CloudNine', 'NeuralNet'];
  const names = ['Alex Mercer', 'Sarah Connor', 'John Wick', 'Elena Fisher', 'Marcus Fenix'];
  
  const candidates = [];
  const count = Math.floor(Math.random() * 5) + 2;
  
  for (let i = 0; i < count; i++) {
      candidates.push({
          candidate_name: names[Math.floor(Math.random() * names.length)] + ' ' + Math.floor(Math.random() * 1000),
          job_title: titles[Math.floor(Math.random() * titles.length)],
          company: companies[Math.floor(Math.random() * companies.length)],
          candidate_email: `candidate_${Date.now()}_${i}@${platform.toLowerCase()}.mock`,
          resume_url: `https://${platform.toLowerCase()}.com/in/mock-profile-${Date.now()}`,
          match_score: Math.floor(Math.random() * 20) + 80 + '%'
      });
  }
  
  await new Promise(r => setTimeout(r, 1000));
  ok(res, { results: candidates, boolean_tokens_parsed: tokens });
}));


// ============================================================================
module.exports = { adminRoutes };
