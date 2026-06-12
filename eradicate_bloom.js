const fs = require('fs');

let css = fs.readFileSync('paradigm/style.css', 'utf8');

// Replace all occurrences of background-image with radial gradients
css = css.replace(/background-image:\s*radial-gradient\([\s\S]*?;\s*background-attachment:\s*fixed;/g, '');

// If it spans without background-attachment fixed, let's just wipe out background-image entirely in body blocks
css = css.replace(/body\s*\{[\s\S]*?\}/g, (match) => {
    return match.replace(/background-image:\s*radial-gradient[\s\S]*?\);/, '');
});

// Also remove bg-glow, glow-1, glow-2 classes entirely
css = css.replace(/\.bg-glow\s*\{[\s\S]*?\}/g, '');
css = css.replace(/\.glow-1\s*\{[\s\S]*?\}/g, '');
css = css.replace(/\.glow-2\s*\{[\s\S]*?\}/g, '');

fs.writeFileSync('paradigm/style.css', css);
console.log('Completely eradicated all bloom gradients from style.css');
