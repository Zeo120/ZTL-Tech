const fs = require('fs');
let code = fs.readFileSync('backend/src/routes/admin.routes.js', 'utf8');

const target = `.query(\`SELECT id, name, email, role, last_login_at, status FROM dbo.Users WHERE id = @id\`),`;
const replacement = `.query(\`SELECT id, email, role, is_active FROM dbo.Users WHERE id = @id\`),`;

code = code.replace(target, replacement);
fs.writeFileSync('backend/src/routes/admin.routes.js', code);
console.log('Patched columns');
