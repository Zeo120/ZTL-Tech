const fs = require('fs');
const path = require('path');

const adminPath = path.join(__dirname, 'backend', 'src', 'routes', 'admin.routes.js');
let adminCode = fs.readFileSync(adminPath, 'utf8');

// 1. Update imports
adminCode = adminCode.replace(`const { sql, getDbPool } = require('../config/db');`, `const { sql, getDbPool, getParadigmDbPool } = require('../config/db');`);

// 2. We will replace `const pool = await getDbPool();` with `const corePool = await getDbPool(); const suitePool = await getParadigmDbPool(); const pool = corePool;` to provide both and keep defaults.
adminCode = adminCode.replace(/const pool = await getDbPool\(\);/g, `const corePool = await getDbPool();\n  const suitePool = await getParadigmDbPool();\n  const pool = corePool;`);

// 3. Now we replace `pool.request()` with `suitePool.request()` where appropriate.
// Dashboard batch
adminCode = adminCode.replace(/pool\.request\(\)\s*\.input\('userId',\s*sql\.Int,\s*userId\)\s*\.query\(`\s*SELECT TOP 5 \*\s*FROM dbo\.AuditLog/s, 
  match => match.replace('pool.request', 'corePool.request'));

adminCode = adminCode.replace(/pool\.request\(\)\s*\.input\('userId',\s*sql\.Int,\s*userId\)\s*\.query\(`\s*SELECT COUNT\(\*\) as emp_count\s*FROM dbo\.Employees/s, 
  match => match.replace('pool.request', 'suitePool.request'));

adminCode = adminCode.replace(/pool\.request\(\)\s*\.input\('userId',\s*sql\.Int,\s*userId\)\s*\.query\(`\s*SELECT COUNT\(\*\) as present_today\s*FROM dbo\.Attendance/s, 
  match => match.replace('pool.request', 'suitePool.request'));

// Employee endpoints
adminCode = adminCode.replace(/pool\.request\(\)\s*\.input\('userId',\s*sql\.Int,\s*userId\)\s*\.query\('SELECT \* FROM dbo\.Employees/g, 
  match => match.replace('pool.request', 'suitePool.request'));

adminCode = adminCode.replace(/pool\.request\(\)\s*\.input\('userId',\s*sql\.Int,\s*userId\)\s*\.query\('SELECT \* FROM dbo\.Employees WHERE id = @id/g, 
  match => match.replace('pool.request', 'suitePool.request'));

adminCode = adminCode.replace(/pool\.request\(\)[\s\S]*?INSERT INTO dbo\.Employees/g, 
  match => match.replace('pool.request', 'suitePool.request'));

adminCode = adminCode.replace(/pool\.request\(\)[\s\S]*?UPDATE dbo\.Employees/g, 
  match => match.replace('pool.request', 'suitePool.request'));

adminCode = adminCode.replace(/pool\.request\(\)[\s\S]*?DELETE FROM dbo\.Employees/g, 
  match => match.replace('pool.request', 'suitePool.request'));

// Attendance endpoints
adminCode = adminCode.replace(/pool\.request\(\)[\s\S]*?SELECT a\.\*, e\.name[\s\S]*?FROM dbo\.Attendance/g, 
  match => match.replace('pool.request', 'suitePool.request'));

adminCode = adminCode.replace(/pool\.request\(\)[\s\S]*?SELECT TOP 1 id FROM dbo\.Employees/g, 
  match => match.replace('pool.request', 'suitePool.request'));

adminCode = adminCode.replace(/pool\.request\(\)[\s\S]*?SELECT id, status FROM dbo\.Attendance/g, 
  match => match.replace('pool.request', 'suitePool.request'));

adminCode = adminCode.replace(/pool\.request\(\)[\s\S]*?INSERT INTO dbo\.Attendance/g, 
  match => match.replace('pool.request', 'suitePool.request'));

adminCode = adminCode.replace(/pool\.request\(\)[\s\S]*?UPDATE dbo\.Attendance/g, 
  match => match.replace('pool.request', 'suitePool.request'));

// Payroll endpoints
adminCode = adminCode.replace(/pool\.request\(\)[\s\S]*?SELECT \* FROM dbo\.PayrollRuns/g, 
  match => match.replace('pool.request', 'suitePool.request'));

adminCode = adminCode.replace(/pool\.request\(\)[\s\S]*?SELECT TOP 1 id FROM dbo\.PayrollRuns/g, 
  match => match.replace('pool.request', 'suitePool.request'));

adminCode = adminCode.replace(/pool\.request\(\)[\s\S]*?INSERT INTO dbo\.PayrollRuns/g, 
  match => match.replace('pool.request', 'suitePool.request'));

adminCode = adminCode.replace(/pool\.request\(\)[\s\S]*?SELECT TOP 1 id, status, month, year FROM dbo\.PayrollRuns/g, 
  match => match.replace('pool.request', 'suitePool.request'));

adminCode = adminCode.replace(/pool\.request\(\)[\s\S]*?SELECT \* FROM dbo\.Employees WHERE user_id/g, 
  match => match.replace('pool.request', 'suitePool.request'));

adminCode = adminCode.replace(/new sql\.Transaction\(pool\)/g, `new sql.Transaction(suitePool)`);

adminCode = adminCode.replace(/pool\.request\(\)[\s\S]*?SELECT pt\.\*[\s\S]*?FROM dbo\.PayrollTransactions pt/g, 
  match => match.replace('pool.request', 'suitePool.request'));

fs.writeFileSync(adminPath, adminCode);
console.log('admin.routes.js refactored');

// Refactor employee.routes.js
const empPath = path.join(__dirname, 'backend', 'src', 'routes', 'employee.routes.js');
let empCode = fs.readFileSync(empPath, 'utf8');

empCode = empCode.replace(`const { sql, getDbPool } = require('../config/db');`, `const { sql, getParadigmDbPool } = require('../config/db');`);
empCode = empCode.replace(/getDbPool/g, 'getParadigmDbPool');

fs.writeFileSync(empPath, empCode);
console.log('employee.routes.js refactored');

// Refactor auth.routes.js for employee login
const authPath = path.join(__dirname, 'backend', 'src', 'routes', 'auth.routes.js');
let authCode = fs.readFileSync(authPath, 'utf8');
authCode = authCode.replace(`const { sql, getDbPool } = require('../config/db');`, `const { sql, getDbPool, getParadigmDbPool } = require('../config/db');`);
authCode = authCode.replace(/const pool = await getDbPool\(\);/g, `const pool = await getDbPool();\n  const suitePool = await getParadigmDbPool();`);
authCode = authCode.replace(/pool\.request\(\)[\s\S]*?SELECT id, name, user_id FROM dbo\.Employees/g, 
  match => match.replace('pool.request', 'suitePool.request'));
authCode = authCode.replace(/pool\.request\(\)[\s\S]*?SELECT pt\.id[\s\S]*?FROM dbo\.PayrollTransactions pt/g, 
  match => match.replace('pool.request', 'suitePool.request'));

fs.writeFileSync(authPath, authCode);
console.log('auth.routes.js refactored');

