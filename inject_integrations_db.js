const fs = require('fs');
let content = fs.readFileSync('backend/src/config/initDb.js', 'utf8');

const integrationsTable = `  ,
  {
    name: 'OAuthIntegrations',
    createSql: "CREATE TABLE dbo.OAuthIntegrations (id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_OAuthIntegrations PRIMARY KEY, user_id INT NOT NULL, platform NVARCHAR(50) NOT NULL, auth_token NVARCHAR(MAX) NULL, status NVARCHAR(50) NOT NULL CONSTRAINT DF_OAuthIntegrations_status DEFAULT 'Linked', created_at DATETIME2 NOT NULL CONSTRAINT DF_OAuthIntegrations_created_at DEFAULT SYSUTCDATETIME(), updated_at DATETIME2 NULL);",
    columns: [
      { name: 'id', sql: 'INT IDENTITY(1,1) NOT NULL', identity: true },
      { name: 'user_id', sql: 'INT NOT NULL' },
      { name: 'platform', sql: 'NVARCHAR(50) NOT NULL' },
      { name: 'auth_token', sql: 'NVARCHAR(MAX) NULL' },
      { name: 'status', sql: "NVARCHAR(50) NOT NULL CONSTRAINT DF_OAuthIntegrations_status DEFAULT N'Linked'" },
      { name: 'created_at', sql: 'DATETIME2 NOT NULL CONSTRAINT DF_OAuthIntegrations_created_at DEFAULT SYSUTCDATETIME()' },
      { name: 'updated_at', sql: 'DATETIME2 NULL' }
    ],
    primaryKey: 'PK_OAuthIntegrations',
    indexes: [
      { name: 'IX_OAuthIntegrations_user_id', sql: 'CREATE INDEX IX_OAuthIntegrations_user_id ON dbo.OAuthIntegrations(user_id);' }
    ]
  }
];`;

const foreignKey = `
  await ensureForeignKey(pool, 'OAuthIntegrations', 'FK_OAuthIntegrations_Users', 'FOREIGN KEY (user_id) REFERENCES dbo.Users(id) ON DELETE CASCADE');
`;

if (!content.includes('OAuthIntegrations')) {
    content = content.replace(/\];/, integrationsTable);
    content = content.replace("await ensureForeignKey(pool, 'Documents', 'FK_Documents_Employees', 'FOREIGN KEY (employee_id) REFERENCES dbo.Employees(id)');", 
        "await ensureForeignKey(pool, 'Documents', 'FK_Documents_Employees', 'FOREIGN KEY (employee_id) REFERENCES dbo.Employees(id)');" + foreignKey);
    fs.writeFileSync('backend/src/config/initDb.js', content);
    console.log('OAuthIntegrations Table Injected');
} else {
    console.log('OAuthIntegrations Table already present');
}
