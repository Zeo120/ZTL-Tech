const fs = require('fs');

const filesToPatch = [
    'paradigm/admin.html',
    'paradigm/employees.html',
    'paradigm/payslip.html'
];

filesToPatch.forEach(file => {
    if (fs.existsSync(file)) {
        let content = fs.readFileSync(file, 'utf8');
        // Add the link before <link rel="manifest" or <script src=" or just before </head>
        if (!content.includes('style.css')) {
            if (content.includes('</head>')) {
                content = content.replace('</head>', '  <link rel="stylesheet" href="style.css" />\n  </head>');
                fs.writeFileSync(file, content);
                console.log(`Patched ${file}`);
            }
        }
    }
});
