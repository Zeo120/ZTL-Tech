const fs = require('fs');
let html = fs.readFileSync('paradigm/admin.html', 'utf8');

html = html.replace(/<\/div>\r?\n\s*<\/div>\r?\n\s*<\/div>\r?\n\s*<\/section>/, '</div>\n                </div>\n            </div>\n        </div>\n        </section>');

fs.writeFileSync('paradigm/admin.html', html);
console.log('Fixed div');
