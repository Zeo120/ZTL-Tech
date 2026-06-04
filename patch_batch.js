const fs = require('fs');
let code = fs.readFileSync('backend/src/routes/admin.routes.js', 'utf8');

const target = `  const [userRes, empRes, leavesRes, expensesRes] = await Promise.all([
    suitePool.request()
      .input('id', sql.Int, req.auth.userId)
      .query(\`SELECT id, name, email, role, last_login_at, status FROM dbo.Users WHERE id = @id\`),`;

const replacement = `  const [userRes, empRes, leavesRes, expensesRes] = await Promise.all([
    corePool.request()
      .input('id', sql.Int, req.auth.userId)
      .query(\`SELECT id, name, email, role, last_login_at, status FROM dbo.Users WHERE id = @id\`),`;

code = code.replace(target, replacement);
fs.writeFileSync('backend/src/routes/admin.routes.js', code);
console.log('Fixed admin.routes.js');
