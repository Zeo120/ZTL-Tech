const fs = require('fs');
let c = fs.readFileSync('D:/Project XT/backend/src/routes/admin.routes.js', 'utf8');
c = c.replace(/\\`</g, '`<');
c = c.replace(/><\\/g, '><');
c = c.replace(/\\`/g, '`');
c = c.replace(/\\\${/g, '${');
fs.writeFileSync('D:/Project XT/backend/src/routes/admin.routes.js', c);
