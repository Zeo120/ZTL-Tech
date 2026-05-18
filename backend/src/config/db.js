const sql = require('mssql');
const { env } = require('./env');
const { logger } = require('../utils/logger');

let pool;

async function getDbPool() {
  if (pool) return pool;

  pool = await sql.connect({
    server: env.sql.server,
    port: env.sql.port,
    database: env.sql.database,
    ...(env.sql.user ? { user: env.sql.user } : {}),
    ...(env.sql.password ? { password: env.sql.password } : {}),
    options: env.sql.options,
    pool: {
      max: 10,
      min: 0,
      idleTimeoutMillis: 30000
    }
  });

  return pool;
}

async function closeDbPool() {
  if (!pool) return;
  try {
    await pool.close();
  } catch (error) {
    logger.error('db_pool_close_failed', { error });
  } finally {
    pool = undefined;
  }
}

module.exports = {
  sql,
  getDbPool,
  closeDbPool
};
