const fs = require('fs');
const path = require('path');

const replacements = {
    'â–¼': '▼',
    'â†’': '→',
    'â†—': '↗',
    'â€”': '—',
    'â€¢': '•',
    'â‚¹': '₹',
    'âœ“': '✓',
    'âœ—': '✗',
    'âœ•': '✕',
    'âš¡': '⚡',
    'â†»': '↻',
    'â— ': '●',
    'âˆ’': '−',
    'Î¦': 'Φ',
    'â ¿': 'ⁿ',
    'â º': '⁺',
    'Â¹': '¹',
    'â‚Š': '₊',
    'â‚ ': '₁',
    'â‚‹': '₋',
    'âˆ ': '∇',
    'â‚–': 'ₖ',
    'â‚Œ': '₌',
    'â‚€': '₀',
    'á´·': 'ᵏ',
    'â »': '⁻',
    'â‹€': '⋀',
    'â‚ ': '₂',
    'â‚ƒ': '₃',
    'â‚„': '₄',
    'â‚…': '₅',
    'â‚‰': '₉',
    'âˆ¨': '∨',
    'âˆ§': '∧',
    'â‹˜': '⋘',
    'â‚˜': 'ₘ',
    'á´¹': 'ᵐ',
    'â–¡': '□',
    'â‰¡': '≡',
    'âˆš': '√',
    'âˆ‚': '∂',
    'Î¼': 'μ',
    'Î½': 'ν',
    'Î¸': 'θ',
    'Ï†': 'φ',
    'Î´': 'δ',
    'Î£': 'Σ',
    'Ã—': '×',
    'Â©': '©'
};

function walk(dir) {
    let results = [];
    const list = fs.readdirSync(dir);
    list.forEach(file => {
        if (file === 'node_modules' || file === '.git') return;
        const filePath = path.join(dir, file);
        const stat = fs.statSync(filePath);
        if (stat && stat.isDirectory()) {
            results = results.concat(walk(filePath));
        } else if (filePath.endsWith('.html') || filePath.endsWith('.css') || filePath.endsWith('.js')) {
            results.push(filePath);
        }
    });
    return results;
}

const files = walk(process.cwd());
files.forEach(file => {
    let content = fs.readFileSync(file, 'utf8');
    let changed = false;
    for (const [mangled, original] of Object.entries(replacements)) {
        if (content.includes(mangled)) {
            // Replaces all occurrences globally using split/join to avoid needing regex escapes
            content = content.split(mangled).join(original);
            changed = true;
        }
    }
    if (changed) {
        fs.writeFileSync(file, content, 'utf8');
        console.log(`Fixed ${file}`);
    }
});
