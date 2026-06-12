const fs = require('fs');
let content = fs.readFileSync('backend/src/config/initDb.js', 'utf8');

const hrTables = `  ,
  {
    name: 'Recruitment',
    createSql: "CREATE TABLE dbo.Recruitment (id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Recruitment PRIMARY KEY, user_id INT NOT NULL, job_title NVARCHAR(255) NOT NULL, candidate_name NVARCHAR(255) NOT NULL, candidate_email NVARCHAR(255) NOT NULL, status NVARCHAR(50) NOT NULL CONSTRAINT DF_Recruitment_status DEFAULT 'Applied', resume_url NVARCHAR(MAX) NULL, interview_date DATETIME2 NULL, notes NVARCHAR(MAX) NULL, created_at DATETIME2 NOT NULL CONSTRAINT DF_Recruitment_created_at DEFAULT SYSUTCDATETIME(), updated_at DATETIME2 NULL);",
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'user_id', sql: 'INT NOT NULL' },
      { name: 'job_title', sql: 'NVARCHAR(255) NOT NULL' },
      { name: 'candidate_name', sql: 'NVARCHAR(255) NOT NULL' },
      { name: 'candidate_email', sql: 'NVARCHAR(255) NOT NULL' },
      { name: 'status', sql: "NVARCHAR(50) NOT NULL CONSTRAINT DF_Recruitment_status DEFAULT N'Applied'" },
      { name: 'resume_url', sql: 'NVARCHAR(MAX) NULL' },
      { name: 'interview_date', sql: 'DATETIME2 NULL' },
      { name: 'notes', sql: 'NVARCHAR(MAX) NULL' },
      { name: 'created_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_Recruitment_created_at DEFAULT SYSUTCDATETIME()' },
      { name: 'updated_at', sql: 'DATETIME2 NULL' }
    ],
    primaryKey: 'PK_Recruitment',
    indexes: [
      { name: 'IX_Recruitment_user_id', sql: 'CREATE INDEX IX_Recruitment_user_id ON dbo.Recruitment(user_id);' }
    ]
  },
  {
    name: 'Onboarding',
    createSql: "CREATE TABLE dbo.Onboarding (id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Onboarding PRIMARY KEY, user_id INT NOT NULL, employee_id INT NOT NULL, current_stage NVARCHAR(100) NOT NULL CONSTRAINT DF_Onboarding_stage DEFAULT 'Pre-Onboarding', progress_percent INT NOT NULL CONSTRAINT DF_Onboarding_progress DEFAULT 0, checklist_json NVARCHAR(MAX) NULL, start_date DATE NOT NULL, created_at DATETIME2 NOT NULL CONSTRAINT DF_Onboarding_created_at DEFAULT SYSUTCDATETIME(), updated_at DATETIME2 NULL);",
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'user_id', sql: 'INT NOT NULL' },
      { name: 'employee_id', sql: 'INT NOT NULL' },
      { name: 'current_stage', sql: "NVARCHAR(100) NOT NULL CONSTRAINT DF_Onboarding_stage DEFAULT N'Pre-Onboarding'" },
      { name: 'progress_percent', sql: 'INT NOT NULL CONSTRAINT DF_Onboarding_progress DEFAULT 0' },
      { name: 'checklist_json', sql: 'NVARCHAR(MAX) NULL' },
      { name: 'start_date', sql: 'DATE NOT NULL' },
      { name: 'created_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_Onboarding_created_at DEFAULT SYSUTCDATETIME()' },
      { name: 'updated_at', sql: 'DATETIME2 NULL' }
    ],
    primaryKey: 'PK_Onboarding',
    indexes: [
      { name: 'IX_Onboarding_employee_id', sql: 'CREATE INDEX IX_Onboarding_employee_id ON dbo.Onboarding(employee_id);' }
    ]
  },
  {
    name: 'PerformanceReviews',
    createSql: "CREATE TABLE dbo.PerformanceReviews (id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_PerformanceReviews PRIMARY KEY, user_id INT NOT NULL, employee_id INT NOT NULL, reviewer_id INT NULL, review_period NVARCHAR(100) NOT NULL, rating DECIMAL(3,1) NULL, comments NVARCHAR(MAX) NULL, goals_json NVARCHAR(MAX) NULL, created_at DATETIME2 NOT NULL CONSTRAINT DF_PerformanceReviews_created_at DEFAULT SYSUTCDATETIME(), updated_at DATETIME2 NULL);",
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'user_id', sql: 'INT NOT NULL' },
      { name: 'employee_id', sql: 'INT NOT NULL' },
      { name: 'reviewer_id', sql: 'INT NULL' },
      { name: 'review_period', sql: 'NVARCHAR(100) NOT NULL' },
      { name: 'rating', sql: 'DECIMAL(3,1) NULL' },
      { name: 'comments', sql: 'NVARCHAR(MAX) NULL' },
      { name: 'goals_json', sql: 'NVARCHAR(MAX) NULL' },
      { name: 'created_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_PerformanceReviews_created_at DEFAULT SYSUTCDATETIME()' },
      { name: 'updated_at', sql: 'DATETIME2 NULL' }
    ],
    primaryKey: 'PK_PerformanceReviews',
    indexes: [
      { name: 'IX_PerformanceReviews_employee_id', sql: 'CREATE INDEX IX_PerformanceReviews_employee_id ON dbo.PerformanceReviews(employee_id);' }
    ]
  },
  {
    name: 'Documents',
    createSql: "CREATE TABLE dbo.Documents (id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Documents PRIMARY KEY, user_id INT NOT NULL, employee_id INT NULL, document_type NVARCHAR(100) NOT NULL, filename NVARCHAR(255) NOT NULL, s3_url NVARCHAR(MAX) NOT NULL, status NVARCHAR(50) NOT NULL CONSTRAINT DF_Documents_status DEFAULT 'Active', created_at DATETIME2 NOT NULL CONSTRAINT DF_Documents_created_at DEFAULT SYSUTCDATETIME(), updated_at DATETIME2 NULL);",
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'user_id', sql: 'INT NOT NULL' },
      { name: 'employee_id', sql: 'INT NULL' },
      { name: 'document_type', sql: 'NVARCHAR(100) NOT NULL' },
      { name: 'filename', sql: 'NVARCHAR(255) NOT NULL' },
      { name: 's3_url', sql: 'NVARCHAR(MAX) NOT NULL' },
      { name: 'status', sql: "NVARCHAR(50) NOT NULL CONSTRAINT DF_Documents_status DEFAULT N'Active'" },
      { name: 'created_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_Documents_created_at DEFAULT SYSUTCDATETIME()' },
      { name: 'updated_at', sql: 'DATETIME2 NULL' }
    ],
    primaryKey: 'PK_Documents',
    indexes: [
      { name: 'IX_Documents_user_id', sql: 'CREATE INDEX IX_Documents_user_id ON dbo.Documents(user_id);' }
    ]
  }
];`;

const foreignKeys = `
  await ensureForeignKey(pool, 'Recruitment', 'FK_Recruitment_Users', 'FOREIGN KEY (user_id) REFERENCES dbo.Users(id) ON DELETE CASCADE');
  await ensureForeignKey(pool, 'Onboarding', 'FK_Onboarding_Users', 'FOREIGN KEY (user_id) REFERENCES dbo.Users(id)');
  await ensureForeignKey(pool, 'Onboarding', 'FK_Onboarding_Employees', 'FOREIGN KEY (employee_id) REFERENCES dbo.Employees(id) ON DELETE CASCADE');
  await ensureForeignKey(pool, 'PerformanceReviews', 'FK_PerformanceReviews_Users', 'FOREIGN KEY (user_id) REFERENCES dbo.Users(id)');
  await ensureForeignKey(pool, 'PerformanceReviews', 'FK_PerformanceReviews_Employees', 'FOREIGN KEY (employee_id) REFERENCES dbo.Employees(id) ON DELETE CASCADE');
  await ensureForeignKey(pool, 'Documents', 'FK_Documents_Users', 'FOREIGN KEY (user_id) REFERENCES dbo.Users(id) ON DELETE CASCADE');
  await ensureForeignKey(pool, 'Documents', 'FK_Documents_Employees', 'FOREIGN KEY (employee_id) REFERENCES dbo.Employees(id)');
`;

if (!content.includes('Recruitment')) {
    content = content.replace(/\];/, hrTables);
    
    // Also inject foreign keys
    content = content.replace("await ensureForeignKey(pool, 'PayrollTransactions', 'FK_PayrollTx_Employees', 'FOREIGN KEY (employee_id) REFERENCES dbo.Employees(id)');", 
        "await ensureForeignKey(pool, 'PayrollTransactions', 'FK_PayrollTx_Employees', 'FOREIGN KEY (employee_id) REFERENCES dbo.Employees(id)');" + foreignKeys);
    
    fs.writeFileSync('backend/src/config/initDb.js', content);
    console.log('HR Tables Injected');
} else {
    console.log('HR Tables already present');
}
