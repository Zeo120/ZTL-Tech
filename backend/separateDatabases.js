// Removed dotenv
const sql = require('mssql');

const coreConfig = {
    server: process.env.SQL_SERVER,
    database: process.env.SQL_DATABASE,
    user: process.env.SQL_USER,
    password: process.env.SQL_PASSWORD,
    port: parseInt(process.env.SQL_PORT),
    options: { encrypt: true, trustServerCertificate: true }
};

const suiteConfig = {
    server: process.env.PARADIGM_SQL_SERVER,
    database: process.env.PARADIGM_SQL_DATABASE,
    user: process.env.PARADIGM_SQL_USER,
    password: process.env.PARADIGM_SQL_PASSWORD,
    port: parseInt(process.env.PARADIGM_SQL_PORT),
    options: { encrypt: true, trustServerCertificate: true }
};

const paradigmTables = [
    {
        name: 'Employees',
        sql: `CREATE TABLE dbo.Employees (
          id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Employees PRIMARY KEY,
          user_id INT NOT NULL,
          name NVARCHAR(200) NOT NULL,
          email NVARCHAR(254) NOT NULL,
          age INT NULL,
          gender NVARCHAR(20) NULL,
          pan NVARCHAR(255) NULL,
          aadhar NVARCHAR(255) NULL,
          marital_status NVARCHAR(20) NULL,
          date_of_joining DATETIME2 NULL,
          bank_account_number NVARCHAR(255) NULL,
          ifsc_code NVARCHAR(255) NULL,
          pf_status NVARCHAR(20) NULL,
          uan_no NVARCHAR(255) NULL,
          base_salary DECIMAL(18,2) NULL,
          hra DECIMAL(18,2) NULL,
          allowances DECIMAL(18,2) NULL,
          deductions DECIMAL(18,2) NULL,
          status NVARCHAR(50) NOT NULL DEFAULT 'Active',
          state NVARCHAR(50) NULL DEFAULT 'Karnataka',
          tax_regime NVARCHAR(20) NULL DEFAULT 'New',
          tax_declarations_json NVARCHAR(MAX) NULL,
          professional_tax DECIMAL(18,2) NULL DEFAULT 0,
          tds DECIMAL(18,2) NULL DEFAULT 0,
          created_at DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
          updated_at DATETIME2 NULL
        );`
    },
    {
        name: 'Attendance',
        sql: `CREATE TABLE dbo.Attendance (
          id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Attendance PRIMARY KEY,
          employee_id INT NOT NULL,
          date DATE NOT NULL,
          status NVARCHAR(50) NOT NULL,
          device_time NVARCHAR(100) NULL,
          latitude DECIMAL(9,6) NULL,
          longitude DECIMAL(9,6) NULL,
          created_at DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
          CONSTRAINT FK_Attendance_Employees FOREIGN KEY (employee_id) REFERENCES dbo.Employees(id) ON DELETE CASCADE,
          CONSTRAINT UQ_Attendance_EmpDate UNIQUE (employee_id, date)
        );`
    },
    {
        name: 'PayrollRuns',
        sql: `CREATE TABLE dbo.PayrollRuns (
          id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_PayrollRuns PRIMARY KEY,
          user_id INT NOT NULL,
          month INT NOT NULL,
          year INT NOT NULL,
          status NVARCHAR(50) NOT NULL DEFAULT 'Draft',
          total_gross DECIMAL(18,2) NULL DEFAULT 0,
          total_deductions DECIMAL(18,2) NULL DEFAULT 0,
          total_net DECIMAL(18,2) NULL DEFAULT 0,
          total_pf DECIMAL(18,2) NULL DEFAULT 0,
          total_esi DECIMAL(18,2) NULL DEFAULT 0,
          total_pt DECIMAL(18,2) NULL DEFAULT 0,
          total_tds DECIMAL(18,2) NULL DEFAULT 0,
          total_lwp_deductions DECIMAL(18,2) NULL DEFAULT 0,
          processed_at DATETIME2 NULL,
          created_at DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
          updated_at DATETIME2 NULL,
          CONSTRAINT UQ_PayrollRuns_UserMonthYear UNIQUE (user_id, month, year)
        );`
    },
    {
        name: 'PayrollTransactions',
        sql: `CREATE TABLE dbo.PayrollTransactions (
          id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_PayrollTransactions PRIMARY KEY,
          payroll_run_id INT NOT NULL,
          employee_id INT NOT NULL,
          base_salary DECIMAL(18,2) NULL DEFAULT 0,
          hra DECIMAL(18,2) NULL DEFAULT 0,
          allowances DECIMAL(18,2) NULL DEFAULT 0,
          gross_salary DECIMAL(18,2) NULL DEFAULT 0,
          deductions DECIMAL(18,2) NULL DEFAULT 0,
          pf_employee DECIMAL(18,2) NULL DEFAULT 0,
          pf_employer DECIMAL(18,2) NULL DEFAULT 0,
          esi_employee DECIMAL(18,2) NULL DEFAULT 0,
          esi_employer DECIMAL(18,2) NULL DEFAULT 0,
          professional_tax DECIMAL(18,2) NULL DEFAULT 0,
          tds DECIMAL(18,2) NULL DEFAULT 0,
          lwp_days INT NULL DEFAULT 0,
          lwp_deduction DECIMAL(18,2) NULL DEFAULT 0,
          working_days INT NULL DEFAULT 0,
          net_salary DECIMAL(18,2) NULL DEFAULT 0,
          payment_status NVARCHAR(50) NOT NULL DEFAULT 'Pending',
          created_at DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
          updated_at DATETIME2 NULL,
          CONSTRAINT FK_PayrollTx_PayrollRuns FOREIGN KEY (payroll_run_id) REFERENCES dbo.PayrollRuns(id) ON DELETE CASCADE,
          CONSTRAINT FK_PayrollTx_Employees FOREIGN KEY (employee_id) REFERENCES dbo.Employees(id),
          CONSTRAINT UQ_PayrollTransactions_RunEmp UNIQUE (payroll_run_id, employee_id)
        );`
    }
];

async function run() {
    let corePool, suitePool;
    try {
        console.log('Connecting to Core DB...');
        corePool = await sql.connect(coreConfig);
        console.log('Connecting to Suite DB...');
        suitePool = await sql.connect(suiteConfig);

        // 1. Create Schema in ParadigmSuite
        for (const t of paradigmTables) {
            console.log(`Checking table ${t.name} in ParadigmSuite...`);
            const check = await suitePool.request().query(`SELECT * FROM sys.tables WHERE name = '${t.name}'`);
            if (check.recordset.length === 0) {
                console.log(`Creating ${t.name}...`);
                await suitePool.request().query(t.sql);
            } else {
                console.log(`Table ${t.name} exists.`);
            }
        }

        // 2. Clone Data
        for (const t of paradigmTables) {
            console.log(`Cloning data for ${t.name}...`);
            const data = await corePool.request().query(`SELECT * FROM dbo.${t.name}`);
            if (data.recordset.length > 0) {
                // Enable identity insert
                await suitePool.request().query(`SET IDENTITY_INSERT dbo.${t.name} ON`);
                
                // Build dynamic insert
                const columns = Object.keys(data.recordset[0]);
                for (const row of data.recordset) {
                    const req = suitePool.request();
                    let colsStr = columns.join(', ');
                    let valsStr = columns.map((c, i) => `@p${i}`).join(', ');
                    columns.forEach((c, i) => req.input(`p${i}`, row[c]));
                    
                    // Check if row already exists
                    const checkRow = await suitePool.request()
                        .input('id', sql.Int, row.id)
                        .query(`SELECT id FROM dbo.${t.name} WHERE id = @id`);
                        
                    if (checkRow.recordset.length === 0) {
                        await req.query(`INSERT INTO dbo.${t.name} (${colsStr}) VALUES (${valsStr})`);
                    }
                }
                
                await suitePool.request().query(`SET IDENTITY_INSERT dbo.${t.name} OFF`);
                console.log(`Cloned ${data.recordset.length} rows to ${t.name}.`);
            } else {
                console.log(`No data in core ${t.name} to clone.`);
            }
        }

        console.log('Database clone successful!');
    } catch (e) {
        console.error(e);
    } finally {
        if (corePool) await corePool.close();
        if (suitePool) await suitePool.close();
    }
}

run();
