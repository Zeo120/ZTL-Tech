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

  await seedAdmin(pool);

  logger.info('db_init_complete');
}

module.exports = { initDb };
