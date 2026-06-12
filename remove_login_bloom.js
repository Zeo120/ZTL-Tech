const fs = require('fs');

let html = fs.readFileSync('paradigm/login.html', 'utf8');

// 1. Remove the glowing background divs entirely
html = html.replace(/<div class="bg-glow">[\s\S]*?<\/div>\s*<\/div>/g, '');

// 2. Eradicate purple variables
html = html.replace(/--surface: #0a0a0f;/g, '--surface: #000000;');
html = html.replace(/--surface-border: rgba\(147, 51, 234, 0\.2\);/g, '--surface-border: #1a1a1a;');
html = html.replace(/--accent-glow: rgba\(147, 51, 234, 0\.5\);/g, '--accent-glow: transparent;');

// 3. Nuke specific class css if it exists
html = html.replace(/\.bg-glow \{[\s\S]*?z-index: 0;\s*\}/g, '');
html = html.replace(/\.glow-1, \.glow-2 \{[\s\S]*?filter: blur\(120px\);\s*\}/g, '');
html = html.replace(/\.glow-1 \{[\s\S]*?top: -20%;\s*\}/g, '');
html = html.replace(/\.glow-2 \{[\s\S]*?bottom: -20%;\s*\}/g, '');

// 4. Remove box shadows from .login-card
html = html.replace(/box-shadow: 0 0 40px var\(--accent-glow\);/g, 'box-shadow: none;');
html = html.replace(/box-shadow: 0 0 100px var\(--accent-glow\);/g, 'box-shadow: none;');

fs.writeFileSync('paradigm/login.html', html);
console.log('Login page bloom removed');
