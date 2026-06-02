const { getDbPool } = require('./backend/src/config/db');

async function checkColumns() {
    try {
        const pool = await getDbPool();
        const res = await pool.request().query("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Employees'");
        console.log(res.recordset.map(r => r.COLUMN_NAME));
        process.exit(0);
    } catch (e) {
        console.error(e);
        process.exit(1);
    }
}
checkColumns();
