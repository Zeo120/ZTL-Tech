const { sql, getDbPool } = require('./db');
const { hashPassword } = require('../services/auth.service');
const { logger } = require('../utils/logger');

const ADMIN_EMAIL = 'admin@local.dev';
const ADMIN_PASSWORD = 'admin123';
const ADMIN_ROLE = 'super_admin';

const tables = [
  {
    name: 'Users',
    createSql: `
      CREATE TABLE dbo.Users (
        id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Users PRIMARY KEY,
        email NVARCHAR(254) NOT NULL,
        password_hash NVARCHAR(MAX) NOT NULL,
        role NVARCHAR(32) NOT NULL CONSTRAINT DF_Users_role DEFAULT 'user',
        is_active BIT NOT NULL CONSTRAINT DF_Users_is_active DEFAULT 1,
        created_at DATETIME2 NOT NULL CONSTRAINT DF_Users_created_at DEFAULT GETDATE(),
        updated_at DATETIME2 NULL
      );
    `,
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'email', sql: 'NVARCHAR(254) NOT NULL CONSTRAINT DF_Users_email DEFAULT N\'\'' },
      { name: 'password_hash', sql: 'NVARCHAR(MAX) NOT NULL CONSTRAINT DF_Users_password_hash DEFAULT N\'\'' },
      { name: 'role', sql: 'NVARCHAR(32) NOT NULL CONSTRAINT DF_Users_role DEFAULT N\'user\'' },
      { name: 'purchased_modules', sql: 'NVARCHAR(MAX) NOT NULL CONSTRAINT DF_Users_purchased_modules DEFAULT N\'[]\'' },
      { name: 'is_active', sql: 'BIT NOT NULL CONSTRAINT DF_Users_is_active DEFAULT 1' },
      { name: 'created_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_Users_created_at DEFAULT GETDATE()' },
      { name: 'updated_at', sql: 'DATETIME2 NULL' }
    ],
    primaryKey: 'PK_Users',
    indexes: [
      {
        name: 'UX_Users_email',
        sql: 'CREATE UNIQUE INDEX UX_Users_email ON dbo.Users(email);'
      }
    ]
  },
  {
    name: 'AuditLog',
    createSql: `
      CREATE TABLE dbo.AuditLog (
        id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_AuditLog PRIMARY KEY,
        actor_user_id INT NULL,
        action NVARCHAR(100) NOT NULL,
        target_type NVARCHAR(100) NULL,
        target_id NVARCHAR(100) NULL,
        ip_address NVARCHAR(64) NULL,
        user_agent NVARCHAR(512) NULL,
        success BIT NOT NULL CONSTRAINT DF_AuditLog_success DEFAULT 1,
        metadata_json NVARCHAR(MAX) NULL,
        created_at DATETIME2 NOT NULL CONSTRAINT DF_AuditLog_created_at DEFAULT SYSUTCDATETIME()
      );
    `,
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'actor_user_id', sql: 'INT NULL' },
      { name: 'action', sql: 'NVARCHAR(100) NOT NULL CONSTRAINT DF_AuditLog_action DEFAULT N\'unknown\'' },
      { name: 'target_type', sql: 'NVARCHAR(100) NULL' },
      { name: 'target_id', sql: 'NVARCHAR(100) NULL' },
      { name: 'ip_address', sql: 'NVARCHAR(64) NULL' },
      { name: 'user_agent', sql: 'NVARCHAR(512) NULL' },
      { name: 'success', sql: 'BIT NOT NULL CONSTRAINT DF_AuditLog_success DEFAULT 1' },
      { name: 'metadata_json', sql: 'NVARCHAR(MAX) NULL' },
      { name: 'created_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_AuditLog_created_at DEFAULT SYSUTCDATETIME()' }
    ],
    primaryKey: 'PK_AuditLog',
    indexes: [
      {
        name: 'IX_AuditLog_actor_user_id_created_at',
        sql: 'CREATE INDEX IX_AuditLog_actor_user_id_created_at ON dbo.AuditLog(actor_user_id, created_at);'
      },
      {
        name: 'IX_AuditLog_action_created_at',
        sql: 'CREATE INDEX IX_AuditLog_action_created_at ON dbo.AuditLog(action, created_at);'
      }
    ]
  },
  {
    name: 'Pages',
    createSql: `
      CREATE TABLE dbo.Pages (
        id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Pages PRIMARY KEY,
        user_id INT NOT NULL,
        title NVARCHAR(200) NOT NULL,
        created_at DATETIME2 NOT NULL CONSTRAINT DF_Pages_created_at DEFAULT SYSUTCDATETIME(),
        CONSTRAINT FK_Pages_Users FOREIGN KEY (user_id) REFERENCES dbo.Users(id) ON DELETE CASCADE
      );
    `,
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'user_id', sql: 'INT NOT NULL CONSTRAINT DF_Pages_user_id DEFAULT 0' },
      { name: 'title', sql: 'NVARCHAR(200) NOT NULL CONSTRAINT DF_Pages_title DEFAULT N\'Untitled\'' },
      { name: 'created_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_Pages_created_at DEFAULT SYSUTCDATETIME()' }
    ],
    primaryKey: 'PK_Pages',
    indexes: [
      {
        name: 'IX_Pages_user_id',
        sql: 'CREATE INDEX IX_Pages_user_id ON dbo.Pages(user_id);'
      }
    ]
  },
  {
    name: 'Widgets',
    createSql: `
      CREATE TABLE dbo.Widgets (
        id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Widgets PRIMARY KEY,
        page_id INT NOT NULL,
        type NVARCHAR(100) NOT NULL,
        config_json NVARCHAR(MAX) NULL,
        CONSTRAINT FK_Widgets_Pages FOREIGN KEY (page_id) REFERENCES dbo.Pages(id) ON DELETE CASCADE
      );
    `,
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'page_id', sql: 'INT NOT NULL CONSTRAINT DF_Widgets_page_id DEFAULT 0' },
      { name: 'type', sql: 'NVARCHAR(100) NOT NULL CONSTRAINT DF_Widgets_type DEFAULT N\'unknown\'' },
      { name: 'config_json', sql: 'NVARCHAR(MAX) NULL' }
    ],
    primaryKey: 'PK_Widgets',
    indexes: [
      {
        name: 'IX_Widgets_page_id',
        sql: 'CREATE INDEX IX_Widgets_page_id ON dbo.Widgets(page_id);'
      }
    ]
  },
  {
    name: 'PhasrAudits',
    createSql: `
      CREATE TABLE dbo.PhasrAudits (
        id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_PhasrAudits PRIMARY KEY,
        user_id INT NOT NULL,
        domain_name NVARCHAR(255) NOT NULL,
        proof_details NVARCHAR(MAX) NOT NULL,
        agreement_filename NVARCHAR(255) NULL,
        status NVARCHAR(50) NOT NULL CONSTRAINT DF_PhasrAudits_status DEFAULT 'pending',
        created_at DATETIME2 NOT NULL CONSTRAINT DF_PhasrAudits_created_at DEFAULT SYSUTCDATETIME(),
        CONSTRAINT FK_PhasrAudits_Users FOREIGN KEY (user_id) REFERENCES dbo.Users(id) ON DELETE CASCADE
      );
    `,
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'user_id', sql: 'INT NOT NULL CONSTRAINT DF_PhasrAudits_user_id DEFAULT 0' },
      { name: 'domain_name', sql: 'NVARCHAR(255) NOT NULL CONSTRAINT DF_PhasrAudits_domain_name DEFAULT N\'\'' },
      { name: 'proof_details', sql: 'NVARCHAR(MAX) NOT NULL CONSTRAINT DF_PhasrAudits_proof_details DEFAULT N\'\'' },
      { name: 'agreement_filename', sql: 'NVARCHAR(255) NULL' },
      { name: 'status', sql: 'NVARCHAR(50) NOT NULL CONSTRAINT DF_PhasrAudits_status DEFAULT N\'pending\'' },
      { name: 'created_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_PhasrAudits_created_at DEFAULT SYSUTCDATETIME()' }
    ],
    primaryKey: 'PK_PhasrAudits',
    indexes: [
      {
        name: 'IX_PhasrAudits_user_id',
        sql: 'CREATE INDEX IX_PhasrAudits_user_id ON dbo.PhasrAudits(user_id);'
      }
    ]
  },
  {
    name: 'CodebaseScans',
    createSql: `
      CREATE TABLE dbo.CodebaseScans (
        id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_CodebaseScans PRIMARY KEY,
        user_id INT NOT NULL,
        target_path NVARCHAR(MAX) NOT NULL,
        source_type NVARCHAR(50) NOT NULL,
        scan_focus NVARCHAR(50) NOT NULL,
        total_files INT NOT NULL,
        critical_count INT NOT NULL,
        warning_count INT NOT NULL,
        info_count INT NOT NULL,
        created_at DATETIME2 NOT NULL CONSTRAINT DF_CodebaseScans_created_at DEFAULT SYSUTCDATETIME()
      );
    `,
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'user_id', sql: 'INT NOT NULL CONSTRAINT DF_CodebaseScans_user_id DEFAULT 0' },
      { name: 'target_path', sql: 'NVARCHAR(MAX) NOT NULL CONSTRAINT DF_CodebaseScans_target_path DEFAULT N\'\'' },
      { name: 'source_type', sql: 'NVARCHAR(50) NOT NULL CONSTRAINT DF_CodebaseScans_source_type DEFAULT N\'\'' },
      { name: 'scan_focus', sql: 'NVARCHAR(50) NOT NULL CONSTRAINT DF_CodebaseScans_scan_focus DEFAULT N\'\'' },
      { name: 'total_files', sql: 'INT NOT NULL CONSTRAINT DF_CodebaseScans_total_files DEFAULT 0' },
      { name: 'critical_count', sql: 'INT NOT NULL CONSTRAINT DF_CodebaseScans_critical_count DEFAULT 0' },
      { name: 'warning_count', sql: 'INT NOT NULL CONSTRAINT DF_CodebaseScans_warning_count DEFAULT 0' },
      { name: 'info_count', sql: 'INT NOT NULL CONSTRAINT DF_CodebaseScans_info_count DEFAULT 0' },
      { name: 'created_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_CodebaseScans_created_at DEFAULT SYSUTCDATETIME()' }
    ],
    primaryKey: 'PK_CodebaseScans',
    indexes: [
      {
        name: 'IX_CodebaseScans_user_id',
        sql: 'CREATE INDEX IX_CodebaseScans_user_id ON dbo.CodebaseScans(user_id);'
      }
    ]
  },
  {
    name: 'CodebaseDependencies',
    createSql: `
      CREATE TABLE dbo.CodebaseDependencies (
        id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_CodebaseDependencies PRIMARY KEY,
        scan_id INT NOT NULL,
        name NVARCHAR(255) NOT NULL,
        version NVARCHAR(50) NOT NULL,
        manager NVARCHAR(100) NOT NULL,
        type NVARCHAR(100) NOT NULL,
        created_at DATETIME2 NOT NULL CONSTRAINT DF_CodebaseDependencies_created_at DEFAULT SYSUTCDATETIME()
      );
    `,
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'scan_id', sql: 'INT NOT NULL CONSTRAINT DF_CodebaseDependencies_scan_id DEFAULT 0' },
      { name: 'name', sql: 'NVARCHAR(255) NOT NULL CONSTRAINT DF_CodebaseDependencies_name DEFAULT N\'\'' },
      { name: 'version', sql: 'NVARCHAR(50) NOT NULL CONSTRAINT DF_CodebaseDependencies_version DEFAULT N\'\'' },
      { name: 'manager', sql: 'NVARCHAR(100) NOT NULL CONSTRAINT DF_CodebaseDependencies_manager DEFAULT N\'\'' },
      { name: 'type', sql: 'NVARCHAR(100) NOT NULL CONSTRAINT DF_CodebaseDependencies_type DEFAULT N\'\'' },
      { name: 'created_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_CodebaseDependencies_created_at DEFAULT SYSUTCDATETIME()' }
    ],
    primaryKey: 'PK_CodebaseDependencies',
    indexes: [
      {
        name: 'IX_CodebaseDependencies_scan_id',
        sql: 'CREATE INDEX IX_CodebaseDependencies_scan_id ON dbo.CodebaseDependencies(scan_id);'
      }
    ]
  },
  {
    name: 'CodebaseScanFindings',
    createSql: `
      CREATE TABLE dbo.CodebaseScanFindings (
        id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_CodebaseScanFindings PRIMARY KEY,
        scan_id INT NOT NULL,
        file_path NVARCHAR(MAX) NOT NULL,
        line_number INT NOT NULL,
        code_snippet NVARCHAR(MAX) NOT NULL,
        category NVARCHAR(100) NOT NULL,
        severity NVARCHAR(50) NOT NULL,
        remediation NVARCHAR(MAX) NOT NULL,
        created_at DATETIME2 NOT NULL CONSTRAINT DF_CodebaseScanFindings_created_at DEFAULT SYSUTCDATETIME()
      );
    `,
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'scan_id', sql: 'INT NOT NULL CONSTRAINT DF_CodebaseScanFindings_scan_id DEFAULT 0' },
      { name: 'file_path', sql: 'NVARCHAR(MAX) NOT NULL CONSTRAINT DF_CodebaseScanFindings_file_path DEFAULT N\'\'' },
      { name: 'line_number', sql: 'INT NOT NULL CONSTRAINT DF_CodebaseScanFindings_line_number DEFAULT 0' },
      { name: 'code_snippet', sql: 'NVARCHAR(MAX) NOT NULL CONSTRAINT DF_CodebaseScanFindings_code_snippet DEFAULT N\'\'' },
      { name: 'category', sql: 'NVARCHAR(100) NOT NULL CONSTRAINT DF_CodebaseScanFindings_category DEFAULT N\'\'' },
      { name: 'severity', sql: 'NVARCHAR(50) NOT NULL CONSTRAINT DF_CodebaseScanFindings_severity DEFAULT N\'\'' },
      { name: 'remediation', sql: 'NVARCHAR(MAX) NOT NULL CONSTRAINT DF_CodebaseScanFindings_remediation DEFAULT N\'\'' },
      { name: 'created_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_CodebaseScanFindings_created_at DEFAULT SYSUTCDATETIME()' }
    ],
    primaryKey: 'PK_CodebaseScanFindings',
    indexes: [
      {
        name: 'IX_CodebaseScanFindings_scan_id',
        sql: 'CREATE INDEX IX_CodebaseScanFindings_scan_id ON dbo.CodebaseScanFindings(scan_id);'
      }
    ]
  },
  {
    name: 'Employees',
    createSql: `
      CREATE TABLE dbo.Employees (
        id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Employees PRIMARY KEY,
        user_id INT NOT NULL,
        name NVARCHAR(255) NOT NULL,
        age INT NOT NULL,
        status NVARCHAR(50) NOT NULL CONSTRAINT DF_Employees_status DEFAULT 'Active',
        gender NVARCHAR(50) NOT NULL,
        pan NVARCHAR(50) NOT NULL,
        marital_status NVARCHAR(50) NOT NULL CONSTRAINT DF_Employees_marital DEFAULT 'Unmarried',
        spouse_name NVARCHAR(255) NULL,
        aadhar NVARCHAR(50) NOT NULL,
        date_of_birth DATE NULL,
        date_of_joining DATE NOT NULL,
        date_of_exit DATE NULL,
        email NVARCHAR(255) NULL,
          password_hash NVARCHAR(255) NULL,
          bank_account_number NVARCHAR(100) NULL,
        ifsc_code NVARCHAR(50) NULL,
        pf_status NVARCHAR(50) NOT NULL CONSTRAINT DF_Employees_pf DEFAULT 'Not Applicable',
        uan_no NVARCHAR(50) NULL,
        base_salary DECIMAL(18,2) NULL,
        hra DECIMAL(18,2) NULL,
        allowances DECIMAL(18,2) NULL,
        deductions DECIMAL(18,2) NULL,
        state NVARCHAR(100) NULL CONSTRAINT DF_Employees_state DEFAULT 'Karnataka',
        professional_tax DECIMAL(18,2) NULL CONSTRAINT DF_Employees_professional_tax DEFAULT 0,
        tds DECIMAL(18,2) NULL CONSTRAINT DF_Employees_tds DEFAULT 0,
        created_at DATETIME2 NOT NULL CONSTRAINT DF_Employees_created_at DEFAULT SYSUTCDATETIME(),
        updated_at DATETIME2 NULL,
        CONSTRAINT FK_Employees_Users FOREIGN KEY (user_id) REFERENCES dbo.Users(id) ON DELETE CASCADE
      );
    `,
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'user_id', sql: 'INT NOT NULL CONSTRAINT DF_Employees_user_id DEFAULT 0' },
      { name: 'name', sql: 'NVARCHAR(255) NOT NULL CONSTRAINT DF_Employees_name DEFAULT N\'\'' },
      { name: 'age', sql: 'INT NOT NULL CONSTRAINT DF_Employees_age DEFAULT 0' },
      { name: 'status', sql: 'NVARCHAR(50) NOT NULL CONSTRAINT DF_Employees_status DEFAULT N\'Active\'' },
      { name: 'gender', sql: 'NVARCHAR(50) NOT NULL CONSTRAINT DF_Employees_gender DEFAULT N\'\'' },
      { name: 'pan', sql: 'NVARCHAR(50) NOT NULL CONSTRAINT DF_Employees_pan DEFAULT N\'\'' },
      { name: 'marital_status', sql: 'NVARCHAR(50) NOT NULL CONSTRAINT DF_Employees_marital DEFAULT N\'Unmarried\'' },
      { name: 'spouse_name', sql: 'NVARCHAR(255) NULL' },
      { name: 'aadhar', sql: 'NVARCHAR(50) NOT NULL CONSTRAINT DF_Employees_aadhar DEFAULT N\'\'' },
      { name: 'date_of_birth', sql: 'DATE NULL' },
      { name: 'date_of_joining', sql: 'DATE NOT NULL' },
      { name: 'date_of_exit', sql: 'DATE NULL' },
      { name: 'bank_account_number', sql: 'NVARCHAR(100) NULL' },
      { name: 'ifsc_code', sql: 'NVARCHAR(50) NULL' },
      { name: 'pf_status', sql: 'NVARCHAR(50) NOT NULL CONSTRAINT DF_Employees_pf DEFAULT N\'Not Applicable\'' },
      { name: 'uan_no', sql: 'NVARCHAR(50) NULL' },
      { name: 'base_salary', sql: 'DECIMAL(18,2) NULL' },
      { name: 'hra', sql: 'DECIMAL(18,2) NULL' },
      { name: 'allowances', sql: 'DECIMAL(18,2) NULL' },
      { name: 'deductions', sql: 'DECIMAL(18,2) NULL' },
      { name: 'state', sql: 'NVARCHAR(100) NULL CONSTRAINT DF_Employees_state DEFAULT N\'Karnataka\'' },
      { name: 'professional_tax', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_Employees_professional_tax DEFAULT 0' },
      { name: 'tds', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_Employees_tds DEFAULT 0' },
      { name: 'tax_regime', sql: 'NVARCHAR(20) NULL CONSTRAINT DF_Employees_tax_regime DEFAULT N\'New\'' },
      { name: 'tax_declarations_json', sql: 'NVARCHAR(MAX) NULL' },
      { name: 'created_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_Employees_created_at DEFAULT SYSUTCDATETIME()' },
      { name: 'updated_at', sql: 'DATETIME2 NULL' }
    ],
    primaryKey: 'PK_Employees',
    indexes: [
      {
        name: 'IX_Employees_user_id',
        sql: 'CREATE INDEX IX_Employees_user_id ON dbo.Employees(user_id);'
      }
    ]
  },
  {
    name: 'Attendance',
    createSql: `
      CREATE TABLE dbo.Attendance (
        id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Attendance PRIMARY KEY,
        employee_id INT NOT NULL,
        attendance_date DATE NOT NULL,
        status NVARCHAR(50) NOT NULL,
        created_at DATETIME2 NOT NULL CONSTRAINT DF_Attendance_created_at DEFAULT SYSUTCDATETIME(),
        updated_at DATETIME2 NULL,
        CONSTRAINT UC_Employee_Date UNIQUE (employee_id, attendance_date)
      );
    `,
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'employee_id', sql: 'INT NOT NULL' },
      { name: 'attendance_date', sql: 'DATE NOT NULL' },
      { name: 'status', sql: 'NVARCHAR(50) NOT NULL' },
      { name: 'created_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_Attendance_created_at DEFAULT SYSUTCDATETIME()' },
      { name: 'updated_at', sql: 'DATETIME2 NULL' }
    ],
    primaryKey: 'PK_Attendance',
    indexes: [
      {
        name: 'IX_Attendance_employee_date',
        sql: 'CREATE UNIQUE INDEX IX_Attendance_employee_date ON dbo.Attendance(employee_id, attendance_date);'
      }
    ]
  },
  {
    name: 'PayrollRuns',
    createSql: `
      CREATE TABLE dbo.PayrollRuns (
        id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_PayrollRuns PRIMARY KEY,
        user_id INT NOT NULL,
        month INT NOT NULL,
        year INT NOT NULL,
        status NVARCHAR(50) NOT NULL CONSTRAINT DF_PayrollRuns_status DEFAULT 'Draft',
        total_gross DECIMAL(18,2) NULL CONSTRAINT DF_PayrollRuns_total_gross DEFAULT 0,
        total_deductions DECIMAL(18,2) NULL CONSTRAINT DF_PayrollRuns_total_deductions DEFAULT 0,
        total_net DECIMAL(18,2) NULL CONSTRAINT DF_PayrollRuns_total_net DEFAULT 0,
        total_pf DECIMAL(18,2) NULL CONSTRAINT DF_PayrollRuns_total_pf DEFAULT 0,
        total_esi DECIMAL(18,2) NULL CONSTRAINT DF_PayrollRuns_total_esi DEFAULT 0,
        total_pt DECIMAL(18,2) NULL CONSTRAINT DF_PayrollRuns_total_pt DEFAULT 0,
        total_tds DECIMAL(18,2) NULL CONSTRAINT DF_PayrollRuns_total_tds DEFAULT 0,
        total_lwp_deductions DECIMAL(18,2) NULL CONSTRAINT DF_PayrollRuns_total_lwp_deductions DEFAULT 0,
        processed_at DATETIME2 NULL,
        created_at DATETIME2 NOT NULL CONSTRAINT DF_PayrollRuns_created_at DEFAULT SYSUTCDATETIME(),
        updated_at DATETIME2 NULL,
        CONSTRAINT UC_PayrollRuns_user_month_year UNIQUE (user_id, month, year),
        CONSTRAINT FK_PayrollRuns_Users FOREIGN KEY (user_id) REFERENCES dbo.Users(id) ON DELETE CASCADE
      );
    `,
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'user_id', sql: 'INT NOT NULL CONSTRAINT DF_PayrollRuns_user_id DEFAULT 0' },
      { name: 'month', sql: 'INT NOT NULL CONSTRAINT DF_PayrollRuns_month DEFAULT 1' },
      { name: 'year', sql: 'INT NOT NULL CONSTRAINT DF_PayrollRuns_year DEFAULT 2024' },
      { name: 'status', sql: 'NVARCHAR(50) NOT NULL CONSTRAINT DF_PayrollRuns_status DEFAULT N\'Draft\'' },
      { name: 'total_gross', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollRuns_total_gross DEFAULT 0' },
      { name: 'total_deductions', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollRuns_total_deductions DEFAULT 0' },
      { name: 'total_net', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollRuns_total_net DEFAULT 0' },
      { name: 'total_pf', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollRuns_total_pf DEFAULT 0' },
      { name: 'total_esi', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollRuns_total_esi DEFAULT 0' },
      { name: 'total_pt', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollRuns_total_pt DEFAULT 0' },
      { name: 'total_tds', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollRuns_total_tds DEFAULT 0' },
      { name: 'total_lwp_deductions', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollRuns_total_lwp_deductions DEFAULT 0' },
      { name: 'processed_at', sql: 'DATETIME2 NULL' },
      { name: 'created_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_PayrollRuns_created_at DEFAULT SYSUTCDATETIME()' },
      { name: 'updated_at', sql: 'DATETIME2 NULL' }
    ],
    primaryKey: 'PK_PayrollRuns',
    indexes: [
      {
        name: 'IX_PayrollRuns_user_id',
        sql: 'CREATE INDEX IX_PayrollRuns_user_id ON dbo.PayrollRuns(user_id);'
      },
      {
        name: 'UX_PayrollRuns_user_month_year',
        sql: 'CREATE UNIQUE INDEX UX_PayrollRuns_user_month_year ON dbo.PayrollRuns(user_id, month, year);'
      }
    ]
  },
  {
    name: 'PayrollTransactions',
    createSql: `
      CREATE TABLE dbo.PayrollTransactions (
        id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_PayrollTransactions PRIMARY KEY,
        payroll_run_id INT NOT NULL,
        employee_id INT NOT NULL,
        base_salary DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_base_salary DEFAULT 0,
        hra DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_hra DEFAULT 0,
        allowances DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_allowances DEFAULT 0,
        gross_salary DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_gross_salary DEFAULT 0,
        deductions DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_deductions DEFAULT 0,
        pf_employee DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_pf_employee DEFAULT 0,
        pf_employer DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_pf_employer DEFAULT 0,
        esi_employee DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_esi_employee DEFAULT 0,
        esi_employer DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_esi_employer DEFAULT 0,
        professional_tax DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_professional_tax DEFAULT 0,
        tds DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_tds DEFAULT 0,
        lwp_days INT NULL CONSTRAINT DF_PayrollTx_lwp_days DEFAULT 0,
        lwp_deduction DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_lwp_deduction DEFAULT 0,
        working_days INT NULL CONSTRAINT DF_PayrollTx_working_days DEFAULT 0,
        net_salary DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_net_salary DEFAULT 0,
        payment_status NVARCHAR(50) NOT NULL CONSTRAINT DF_PayrollTx_payment_status DEFAULT 'Pending',
        tax_regime NVARCHAR(20) NULL CONSTRAINT DF_PayrollTx_tax_regime DEFAULT 'New',
        created_at DATETIME2 NOT NULL CONSTRAINT DF_PayrollTx_created_at DEFAULT SYSUTCDATETIME(),
        updated_at DATETIME2 NULL,
        CONSTRAINT UC_PayrollTx_run_employee UNIQUE (payroll_run_id, employee_id),
        CONSTRAINT FK_PayrollTx_PayrollRuns FOREIGN KEY (payroll_run_id) REFERENCES dbo.PayrollRuns(id) ON DELETE CASCADE,
        CONSTRAINT FK_PayrollTx_Employees FOREIGN KEY (employee_id) REFERENCES dbo.Employees(id)
      );
    `,
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'payroll_run_id', sql: 'INT NOT NULL CONSTRAINT DF_PayrollTx_payroll_run_id DEFAULT 0' },
      { name: 'employee_id', sql: 'INT NOT NULL CONSTRAINT DF_PayrollTx_employee_id DEFAULT 0' },
      { name: 'base_salary', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_base_salary DEFAULT 0' },
      { name: 'hra', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_hra DEFAULT 0' },
      { name: 'allowances', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_allowances DEFAULT 0' },
      { name: 'gross_salary', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_gross_salary DEFAULT 0' },
      { name: 'deductions', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_deductions DEFAULT 0' },
      { name: 'pf_employee', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_pf_employee DEFAULT 0' },
      { name: 'pf_employer', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_pf_employer DEFAULT 0' },
      { name: 'esi_employee', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_esi_employee DEFAULT 0' },
      { name: 'esi_employer', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_esi_employer DEFAULT 0' },
      { name: 'professional_tax', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_professional_tax DEFAULT 0' },
      { name: 'tds', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_tds DEFAULT 0' },
      { name: 'lwp_days', sql: 'INT NULL CONSTRAINT DF_PayrollTx_lwp_days DEFAULT 0' },
      { name: 'lwp_deduction', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_lwp_deduction DEFAULT 0' },
      { name: 'working_days', sql: 'INT NULL CONSTRAINT DF_PayrollTx_working_days DEFAULT 0' },
      { name: 'net_salary', sql: 'DECIMAL(18,2) NULL CONSTRAINT DF_PayrollTx_net_salary DEFAULT 0' },
      { name: 'payment_status', sql: 'NVARCHAR(50) NOT NULL CONSTRAINT DF_PayrollTx_payment_status DEFAULT N\'Pending\'' },
      { name: 'tax_regime', sql: 'NVARCHAR(20) NULL CONSTRAINT DF_PayrollTx_tax_regime DEFAULT N\'New\'' },
      { name: 'created_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_PayrollTx_created_at DEFAULT SYSUTCDATETIME()' },
      { name: 'updated_at', sql: 'DATETIME2 NULL' }
    ],
    primaryKey: 'PK_PayrollTransactions',
    indexes: [
      {
        name: 'IX_PayrollTx_payroll_run_id',
        sql: 'CREATE INDEX IX_PayrollTx_payroll_run_id ON dbo.PayrollTransactions(payroll_run_id);'
      },
      {
        name: 'IX_PayrollTx_employee_id',
        sql: 'CREATE INDEX IX_PayrollTx_employee_id ON dbo.PayrollTransactions(employee_id);'
      },
      {
        name: 'UX_PayrollTx_run_employee',
        sql: 'CREATE UNIQUE INDEX UX_PayrollTx_run_employee ON dbo.PayrollTransactions(payroll_run_id, employee_id);'
      }
    ]
  },
  {
    name: 'Leaves',
    createSql: `
      CREATE TABLE dbo.Leaves (
        id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Leaves PRIMARY KEY,
        employee_id INT NOT NULL,
        type NVARCHAR(50) NOT NULL,
        start_date DATE NOT NULL,
        end_date DATE NOT NULL,
        reason NVARCHAR(500) NULL,
        status NVARCHAR(50) NOT NULL CONSTRAINT DF_Leaves_status DEFAULT 'Pending',
        created_at DATETIME2 NOT NULL CONSTRAINT DF_Leaves_created_at DEFAULT SYSUTCDATETIME(),
        updated_at DATETIME2 NULL,
        CONSTRAINT FK_Leaves_Employees FOREIGN KEY (employee_id) REFERENCES dbo.Employees(id) ON DELETE CASCADE
      );
    `,
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'employee_id', sql: 'INT NOT NULL' },
      { name: 'type', sql: 'NVARCHAR(50) NOT NULL' },
      { name: 'start_date', sql: 'DATE NOT NULL' },
      { name: 'end_date', sql: 'DATE NOT NULL' },
      { name: 'reason', sql: 'NVARCHAR(500) NULL' },
      { name: 'status', sql: 'NVARCHAR(50) NOT NULL CONSTRAINT DF_Leaves_status DEFAULT N\'Pending\'' },
      { name: 'created_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_Leaves_created_at DEFAULT SYSUTCDATETIME()' },
      { name: 'updated_at', sql: 'DATETIME2 NULL' }
    ],
    primaryKey: 'PK_Leaves',
    indexes: [
      {
        name: 'IX_Leaves_employee_id',
        sql: 'CREATE INDEX IX_Leaves_employee_id ON dbo.Leaves(employee_id);'
      }
    ]
  },
  {
    name: 'Expenses',
    createSql: `
      CREATE TABLE dbo.Expenses (
        id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Expenses PRIMARY KEY,
        employee_id INT NOT NULL,
        category NVARCHAR(50) NOT NULL,
        amount DECIMAL(18,2) NOT NULL,
        description NVARCHAR(500) NULL,
        receipt_url NVARCHAR(MAX) NULL,
        status NVARCHAR(50) NOT NULL CONSTRAINT DF_Expenses_status DEFAULT 'Pending',
        payroll_run_id INT NULL,
        created_at DATETIME2 NOT NULL CONSTRAINT DF_Expenses_created_at DEFAULT SYSUTCDATETIME(),
        updated_at DATETIME2 NULL,
        CONSTRAINT FK_Expenses_Employees FOREIGN KEY (employee_id) REFERENCES dbo.Employees(id) ON DELETE CASCADE,
        CONSTRAINT FK_Expenses_PayrollRuns FOREIGN KEY (payroll_run_id) REFERENCES dbo.PayrollRuns(id)
      );
    `,
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'employee_id', sql: 'INT NOT NULL' },
      { name: 'category', sql: 'NVARCHAR(50) NOT NULL' },
      { name: 'amount', sql: 'DECIMAL(18,2) NOT NULL' },
      { name: 'description', sql: 'NVARCHAR(500) NULL' },
      { name: 'receipt_url', sql: 'NVARCHAR(MAX) NULL' },
      { name: 'status', sql: 'NVARCHAR(50) NOT NULL CONSTRAINT DF_Expenses_status DEFAULT N\'Pending\'' },
      { name: 'payroll_run_id', sql: 'INT NULL' },
      { name: 'created_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_Expenses_created_at DEFAULT SYSUTCDATETIME()' },
      { name: 'updated_at', sql: 'DATETIME2 NULL' }
    ],
    primaryKey: 'PK_Expenses',
    indexes: [
      {
        name: 'IX_Expenses_employee_id',
        sql: 'CREATE INDEX IX_Expenses_employee_id ON dbo.Expenses(employee_id);'
      },
      {
        name: 'IX_Expenses_payroll_run_id',
        sql: 'CREATE INDEX IX_Expenses_payroll_run_id ON dbo.Expenses(payroll_run_id);'
      }
    ]
  },
  {
    name: 'Documents',
    createSql: `
      CREATE TABLE dbo.Documents (
        id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Documents PRIMARY KEY,
        user_id INT NOT NULL,
        employee_id INT NULL,
        type NVARCHAR(100) NOT NULL,
        file_path NVARCHAR(MAX) NOT NULL,
        generated_at DATETIME2 NOT NULL CONSTRAINT DF_Documents_generated_at DEFAULT SYSUTCDATETIME(),
        CONSTRAINT FK_Documents_Users FOREIGN KEY (user_id) REFERENCES dbo.Users(id) ON DELETE CASCADE,
        CONSTRAINT FK_Documents_Employees FOREIGN KEY (employee_id) REFERENCES dbo.Employees(id)
      );
    `,
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'user_id', sql: 'INT NOT NULL' },
      { name: 'employee_id', sql: 'INT NULL' },
      { name: 'type', sql: 'NVARCHAR(100) NOT NULL' },
      { name: 'file_path', sql: 'NVARCHAR(MAX) NOT NULL' },
      { name: 'generated_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_Documents_generated_at DEFAULT SYSUTCDATETIME()' }
    ],
    primaryKey: 'PK_Documents',
    indexes: [
      {
        name: 'IX_Documents_user_id',
        sql: 'CREATE INDEX IX_Documents_user_id ON dbo.Documents(user_id);'
      },
      {
        name: 'IX_Documents_employee_id',
        sql: 'CREATE INDEX IX_Documents_employee_id ON dbo.Documents(employee_id);'
      }
    ]
  }
];



async function objectExists(pool, name, type) {
  const result = await pool.request()
    .input('name', sql.NVarChar(128), name)
    .input('type', sql.NVarChar(2), type)
    .query(`
      SELECT 1 AS exists_flag
      FROM sys.objects
      WHERE object_id = OBJECT_ID(N'dbo.' + @name)
        AND type = @type;
    `);

  return Boolean(result.recordset[0]);
}

async function columnExists(pool, tableName, columnName) {
  const result = await pool.request()
    .input('tableName', sql.NVarChar(128), tableName)
    .input('columnName', sql.NVarChar(128), columnName)
    .query(`
      SELECT 1 AS exists_flag
      FROM sys.columns
      WHERE object_id = OBJECT_ID(N'dbo.' + @tableName)
        AND name = @columnName;
    `);

  return Boolean(result.recordset[0]);
}

async function indexExists(pool, tableName, indexName) {
  const result = await pool.request()
    .input('tableName', sql.NVarChar(128), tableName)
    .input('indexName', sql.NVarChar(128), indexName)
    .query(`
      SELECT 1 AS exists_flag
      FROM sys.indexes
      WHERE object_id = OBJECT_ID(N'dbo.' + @tableName)
        AND name = @indexName;
    `);

  return Boolean(result.recordset[0]);
}

async function primaryKeyExists(pool, tableName) {
  const result = await pool.request()
    .input('tableName', sql.NVarChar(128), tableName)
    .query(`
      SELECT 1 AS exists_flag
      FROM sys.key_constraints
      WHERE parent_object_id = OBJECT_ID(N'dbo.' + @tableName)
        AND type = 'PK';
    `);

  return Boolean(result.recordset[0]);
}

async function identityColumnExists(pool, tableName) {
  const result = await pool.request()
    .input('tableName', sql.NVarChar(128), tableName)
    .query(`
      SELECT 1 AS exists_flag
      FROM sys.columns
      WHERE object_id = OBJECT_ID(N'dbo.' + @tableName)
        AND is_identity = 1;
    `);

  return Boolean(result.recordset[0]);
}

async function ensureTable(pool, table) {
  if (!(await objectExists(pool, table.name, 'U'))) {
    await pool.request().batch(table.createSql);
    logger.info('table_created', { table: table.name });
    return;
  }

  for (const column of table.columns) {
    if (await columnExists(pool, table.name, column.name)) continue;
    if (column.identity && await identityColumnExists(pool, table.name)) {
      logger.warn('identity_column_add_skipped', { table: table.name, column: column.name });
      continue;
    }

    await pool.request().batch(`ALTER TABLE dbo.${table.name} ADD ${column.name} ${column.sql};`);
    logger.info('column_added', { table: table.name, column: column.name });
  }
}

async function ensurePrimaryKey(pool, table) {
  if (!table.primaryKey || await primaryKeyExists(pool, table.name)) return;
  if (!(await columnExists(pool, table.name, 'id'))) return;

  await pool.request().batch(`ALTER TABLE dbo.${table.name} ADD CONSTRAINT ${table.primaryKey} PRIMARY KEY (id);`);
  logger.info('index_created', { table: table.name, index: table.primaryKey });
}

async function ensureIndexes(pool, table) {
  for (const index of table.indexes || []) {
    if (await indexExists(pool, table.name, index.name)) continue;

    await pool.request().batch(index.sql);
    logger.info('index_created', { table: table.name, index: index.name });
  }
}

async function seedAdmin(pool) {
  const existingAdmin = await pool.request()
    .query(`
      SELECT TOP 1 id
      FROM dbo.Users
      WHERE role IN (N'super-admin', N'admin', N'super_admin');
    `);

  if (existingAdmin.recordset[0]) return;

  const passwordHash = await hashPassword(ADMIN_PASSWORD);

  await pool.request()
    .input('email', sql.NVarChar(254), ADMIN_EMAIL)
    .input('passwordHash', sql.NVarChar(sql.MAX), passwordHash)
    .input('role', sql.NVarChar(32), ADMIN_ROLE)
    .query(`
      IF EXISTS (SELECT 1 FROM dbo.Users WHERE email = @email)
      BEGIN
        UPDATE dbo.Users
        SET
          password_hash = @passwordHash,
          role = @role,
          is_active = 1,
          updated_at = GETDATE()
        WHERE email = @email;
      END
      ELSE
      BEGIN
        INSERT INTO dbo.Users (
          email,
          password_hash,
          role,
          is_active,
          created_at,
          updated_at
        )
        VALUES (
          @email,
          @passwordHash,
          @role,
          1,
          GETDATE(),
          NULL
        );
      END;
    `);

  logger.info('admin_seeded', { email: ADMIN_EMAIL, role: ADMIN_ROLE });
}

async function foreignKeyExists(pool, constraintName) {
  const result = await pool.request()
    .input('constraintName', sql.NVarChar(128), constraintName)
    .query(`
      SELECT 1 AS exists_flag
      FROM sys.foreign_keys
      WHERE name = @constraintName;
    `);

  return Boolean(result.recordset[0]);
}

async function ensureForeignKey(pool, tableName, constraintName, foreignKeySql) {
  if (await foreignKeyExists(pool, constraintName)) return;

  await pool.request().batch(`ALTER TABLE dbo.${tableName} ADD CONSTRAINT ${constraintName} ${foreignKeySql};`);
  logger.info('foreign_key_created', { table: tableName, constraint: constraintName });
}

async function initDb() {
  logger.info('db_init_started');

  const pool = await getDbPool();

  for (const table of tables) {
    await ensureTable(pool, table);
  }

  for (const table of tables) {
    await ensurePrimaryKey(pool, table);
  }

  for (const table of tables) {
    await ensureIndexes(pool, table);
  }

  // Ensure Foreign Key constraints for referential integrity
  await ensureForeignKey(pool, 'Pages', 'FK_Pages_Users', 'FOREIGN KEY (user_id) REFERENCES dbo.Users(id) ON DELETE CASCADE');
  await ensureForeignKey(pool, 'Widgets', 'FK_Widgets_Pages', 'FOREIGN KEY (page_id) REFERENCES dbo.Pages(id) ON DELETE CASCADE');
  await ensureForeignKey(pool, 'PhasrAudits', 'FK_PhasrAudits_Users', 'FOREIGN KEY (user_id) REFERENCES dbo.Users(id) ON DELETE CASCADE');
  await ensureForeignKey(pool, 'CodebaseScans', 'FK_CodebaseScans_Users', 'FOREIGN KEY (user_id) REFERENCES dbo.Users(id) ON DELETE CASCADE');
  await ensureForeignKey(pool, 'CodebaseDependencies', 'FK_CodebaseDependencies_CodebaseScans', 'FOREIGN KEY (scan_id) REFERENCES dbo.CodebaseScans(id) ON DELETE CASCADE');
  await ensureForeignKey(pool, 'CodebaseScanFindings', 'FK_CodebaseScanFindings_CodebaseScans', 'FOREIGN KEY (scan_id) REFERENCES dbo.CodebaseScans(id) ON DELETE CASCADE');
  await ensureForeignKey(pool, 'Employees', 'FK_Employees_Users', 'FOREIGN KEY (user_id) REFERENCES dbo.Users(id) ON DELETE CASCADE');
  await ensureForeignKey(pool, 'Attendance', 'FK_Attendance_Employees', 'FOREIGN KEY (employee_id) REFERENCES dbo.Employees(id) ON DELETE CASCADE');
  await ensureForeignKey(pool, 'PayrollRuns', 'FK_PayrollRuns_Users', 'FOREIGN KEY (user_id) REFERENCES dbo.Users(id) ON DELETE CASCADE');
  await ensureForeignKey(pool, 'PayrollTransactions', 'FK_PayrollTx_PayrollRuns', 'FOREIGN KEY (payroll_run_id) REFERENCES dbo.PayrollRuns(id) ON DELETE CASCADE');
  await ensureForeignKey(pool, 'PayrollTransactions', 'FK_PayrollTx_Employees', 'FOREIGN KEY (employee_id) REFERENCES dbo.Employees(id)');

  await seedAdmin(pool);

  logger.info('db_init_complete');
}

module.exports = { initDb };
