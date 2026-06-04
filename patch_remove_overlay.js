const fs = require('fs');
let code = fs.readFileSync('paradigm/admin.html', 'utf8');

// Remove the HTML for the overlay entirely
const overlayHtmlRegex = /<div id="reveal-screen-overlay">[\s\S]*?<\/div>\s*<\/div>/;
code = code.replace(overlayHtmlRegex, '');

// Remove the JS that interacts with the overlay
const overlayJsRegex = /const overlay = document\.getElementById\('reveal-screen-overlay'\);[\s\S]*?}, 800\);\s*}/;
code = code.replace(overlayJsRegex, '');

fs.writeFileSync('paradigm/admin.html', code);
console.log('Overlay removed.');
