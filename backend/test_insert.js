
const { getDbPool, sql } = require('./src/config/db');

async function testInsert() {
    try {
        const pool = await getDbPool();
        const insertResult = await pool.request()
            .input('userId', sql.Int, 1)
            .input('name', sql.NVarChar(255), 'Test')
            .input('age', sql.Int, 25)
            .input('status', sql.NVarChar(50), 'Active')
            .input('gender', sql.NVarChar(50), 'Male')
            .input('pan', sql.NVarChar(50), 'ABCDE1234F')
            .input('maritalStatus', sql.NVarChar(50), 'Unmarried')
            .input('spouseName', sql.NVarChar(255), null)
            .input('aadhar', sql.NVarChar(50), '123456789012')
            .input('dateOfBirth', sql.Date, new Date('1995-01-01'))
            .input('dateOfJoining', sql.Date, new Date('2020-01-01'))
            .input('dateOfExit', sql.Date, null)
            .input('bankAccountNumber', sql.NVarChar(100), null)
            .input('ifscCode', sql.NVarChar(50), null)
            .input('pfStatus', sql.NVarChar(50), 'Not Applicable')
            .input('uanNo', sql.NVarChar(50), null)
            .input('baseSalary', sql.Decimal(18, 2), 0)
            .input('hra', sql.Decimal(18, 2), 0)
            .input('allowances', sql.Decimal(18, 2), 0)
            .input('deductions', sql.Decimal(18, 2), 0)
            .input('state', sql.NVarChar(100), 'Karnataka')
            .input('professionalTax', sql.Decimal(18, 2), 0)
            .input('tds', sql.Decimal(18, 2), 0)
            .query(`
                INSERT INTO dbo.Employees (
                    user_id, name, age, status, gender, pan, marital_status, spouse_name, aadhar,
                    date_of_birth, date_of_joining, date_of_exit, bank_account_number, ifsc_code, pf_status, uan_no,
                    base_salary, hra, allowances, deductions, state, professional_tax, tds, created_at
                )
                OUTPUT INSERTED.id
                VALUES (
                    @userId, @name, @age, @status, @gender, @pan, @maritalStatus, @spouseName, @aadhar,
                    @dateOfBirth, @dateOfJoining, @dateOfExit, @bankAccountNumber, @ifscCode, @pfStatus, @uanNo,
                    @baseSalary, @hra, @allowances, @deductions, @state, @professionalTax, @tds, SYSUTCDATETIME()
                );
            `);

        console.log('Success!', insertResult.recordset);
    } catch (err) {
        console.error('SQL ERROR:', err.message);
    }
    process.exit(0);
}

testInsert();
