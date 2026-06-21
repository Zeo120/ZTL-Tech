const sql = require('mssql');
const { env } = require('./env');
const { logger } = require('../utils/logger');

let pool;
let connectingDb;

async function getDbPool() {
  if (pool) return pool;
  if (connectingDb) return connectingDb;

  const options = {
    ...env.sql.options,
    ...(env.sql.instanceName ? { instanceName: env.sql.instanceName } : {})
  };

  connectingDb = sql.connect({
    server: env.sql.server,
    ...(env.sql.instanceName ? {} : { port: env.sql.port }),
    database: env.sql.database,
    ...(env.sql.user ? { user: env.sql.user } : {}),
    ...(env.sql.password ? { password: env.sql.password } : {}),
    options,
    pool: { max: 2, min: 0, idleTimeoutMillis: 15000 }
  })
  .then((connectedPool) => { pool = connectedPool; return pool; })
  .catch((error) => { pool = undefined; throw error; })
  .finally(() => { connectingDb = undefined; });

  return connectingDb;
}

async function closeDbPool() {
  if (pool) {
    try { await pool.close(); } catch(e){} finally { pool = undefined; }
  }
}

module.exports = {
  sql,
  getDbPool,
  closeDbPool
};
