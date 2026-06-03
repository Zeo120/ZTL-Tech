const { sql, getDbPool } = require('../backend/src/config/db');
require('dotenv').config({ path: '../backend/.env' });

async function runAlters() {
  const pool = await getDbPool();
  try {
    // 1. Alter Employees table for AES-256 PII fields
    await pool.request().batch(`
      ALTER TABLE dbo.Employees ALTER COLUMN pan NVARCHAR(255) NOT NULL;
      ALTER TABLE dbo.Employees ALTER COLUMN aadhar NVARCHAR(255) NOT NULL;
      ALTER TABLE dbo.Employees ALTER COLUMN bank_account_number NVARCHAR(255) NULL;
      ALTER TABLE dbo.Employees ALTER COLUMN ifsc_code NVARCHAR(100) NULL;
      ALTER TABLE dbo.Employees ALTER COLUMN uan_no NVARCHAR(255) NULL;
    `);
    console.log('Successfully altered Employees table columns for encryption.');
  } catch (err) {
    console.log('Error altering Employees:', err.message);
  }

  try {
    // 2. Add Hash columns to AuditLog
    await pool.request().batch(`
      IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'previous_hash' AND Object_ID = Object_ID(N'dbo.AuditLog'))
      BEGIN
          ALTER TABLE dbo.AuditLog ADD previous_hash NVARCHAR(64) NULL;
      END
      IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'current_hash' AND Object_ID = Object_ID(N'dbo.AuditLog'))
      BEGIN
          ALTER TABLE dbo.AuditLog ADD current_hash NVARCHAR(64) NULL;
      END
    `);
    console.log('Successfully added hash columns to AuditLog.');
  } catch (err) {
    console.log('Error altering AuditLog:', err.message);
  }

  process.exit(0);
}

runAlters();
