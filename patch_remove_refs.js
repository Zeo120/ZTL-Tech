const fs = require('fs');
let code = fs.readFileSync('paradigm/admin.html', 'utf8');

const targetRegex = /const titleEl = document\.getElementById\('reveal-welcome-title'\);[\s\S]*?statusEl\.textContent = "WORKSPACE COCKPIT READY\.";/;
code = code.replace(targetRegex, '');

fs.writeFileSync('paradigm/admin.html', code);
console.log('Removed broken JS references.');
