const fs = require('fs');

let js = fs.readFileSync('backend/src/routes/admin.routes.js', 'utf8');

if (!js.includes('const getParadigmDbPool = getDbPool;')) {
    js = js.replace('const adminRoutes = express.Router();', 'const getParadigmDbPool = getDbPool;\n\nconst adminRoutes = express.Router();');
    fs.writeFileSync('backend/src/routes/admin.routes.js', js);
    console.log('Fixed getParadigmDbPool in admin.routes.js');
}
