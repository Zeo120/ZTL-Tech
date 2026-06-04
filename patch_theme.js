const fs = require('fs');
const glob = require('fs').readdirSync('paradigm').filter(f => f.endsWith('.html'));

const themeVars = {
    '--bg-color': '#0b0c10',
    '--surface-color': 'rgba(30, 41, 59, 0.5)',
    '--surface-border': 'rgba(255, 255, 255, 0.08)',
    '--accent-primary': '#4f46e5',
    '--accent-secondary': '#ec4899',
    '--accent-tertiary': '#06b6d4',
    '--text-primary': '#ffffff',
    '--text-secondary': '#94a3b8',
    'rgba(10, 10, 12, 0.9)': 'rgba(30, 41, 59, 0.5)',
    '#050507': '#0b0c10',
    'rgba(5, 5, 7, 0.8)': 'rgba(11, 12, 16, 0.7)',
    'rgba(255, 255, 255, 0.02)': 'rgba(255, 255, 255, 0.04)',
    'background: var(--bg-color);': 'background: var(--bg-color); background-image: radial-gradient(circle at 15% 50%, rgba(79, 70, 229, 0.15) 0%, transparent 40%), radial-gradient(circle at 85% 30%, rgba(236, 72, 153, 0.15) 0%, transparent 40%); background-attachment: fixed;',
    'background-color: var(--bg-color);': 'background: var(--bg-color); background-image: radial-gradient(circle at 15% 50%, rgba(79, 70, 229, 0.15) 0%, transparent 40%), radial-gradient(circle at 85% 30%, rgba(236, 72, 153, 0.15) 0%, transparent 40%); background-attachment: fixed;',
};

for (const file of glob) {
    if (file === 'login.html') continue; // Already manually patched
    let content = fs.readFileSync('paradigm/' + file, 'utf8');
    
    // Apply variable replacements
    for (const [key, value] of Object.entries(themeVars)) {
        if (key.startsWith('--')) {
            // Find declaration like --bg-color: #000; and replace the value
            const regex = new RegExp(`${key}:\\s*[^;]+;`, 'g');
            content = content.replace(regex, `${key}: ${value};`);
        } else {
            // Raw text replacement
            content = content.split(key).join(value);
        }
    }
    
    // Update any stray #a259ff to new accent
    content = content.replace(/#a259ff/gi, '#4f46e5');
    
    fs.writeFileSync('paradigm/' + file, content);
}
console.log('All HTML files patched with new theme styles.');
