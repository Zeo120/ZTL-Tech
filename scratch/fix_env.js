const fs = require('fs');

// 1. Fix auth.routes.js
let authContent = fs.readFileSync('D:/Project XT/backend/src/routes/auth.routes.js', 'utf8');
authContent = authContent.replace("const env = require('../config/env');", "");
authContent = authContent.replace("const { decryptPII }", "const env = require('../config/env');\nconst { decryptPII }");
fs.writeFileSync('D:/Project XT/backend/src/routes/auth.routes.js', authContent);
console.log('Fixed auth.routes.js env');

// 2. Fix admin.routes.js 
let adminContent = fs.readFileSync('D:/Project XT/backend/src/routes/admin.routes.js', 'utf8');
adminContent = adminContent.replace("const env = require('../config/env');", "");
adminContent = adminContent.replace("const env = require('../config/env');", ""); // Remove any multiple copies

adminContent = adminContent.replace(/await sendNativeEmail\(\{([\s\S]*?)\}\);[\s\S]*?sentCount\+\+;/m, 
`mailDaemon.enqueue({$1});
    queuedCount++;`);

adminContent = adminContent.replace("let sentCount = 0;", "const { mailDaemon } = require('../utils/mailDaemon');\n  let queuedCount = 0;");
adminContent = adminContent.replace("Successfully dispatched \\${sentCount} payslips via native SMTP", "Successfully pushed \\${queuedCount} payslip emails to the background Daemon queue");

fs.writeFileSync('D:/Project XT/backend/src/routes/admin.routes.js', adminContent);
console.log('Fixed admin.routes.js');
