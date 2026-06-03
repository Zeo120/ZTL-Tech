const sql = require('mssql');
const { env } = require('./env');
const { logger } = require('../utils/logger');

let pool;
let connectingDb;
let paradigmPool;
let paradigmConnectingDb;

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
    pool: { max: 10, min: 0, idleTimeoutMillis: 30000 }
  })
  .then((connectedPool) => { pool = connectedPool; return pool; })
  .catch((error) => { pool = undefined; throw error; })
  .finally(() => { connectingDb = undefined; });

  return connectingDb;
}

async function getParadigmDbPool() {
  if (paradigmPool) return paradigmPool;
  if (paradigmConnectingDb) return paradigmConnectingDb;

  const options = env.paradigmSql.options;

  paradigmConnectingDb = sql.connect({
    server: env.paradigmSql.server,
    port: env.paradigmSql.port,
    database: env.paradigmSql.database,
    ...(env.paradigmSql.user ? { user: env.paradigmSql.user } : {}),
    ...(env.paradigmSql.password ? { password: env.paradigmSql.password } : {}),
    options,
    pool: { max: 20, min: 0, idleTimeoutMillis: 30000 }
  })
  .then((connectedPool) => { paradigmPool = connectedPool; return paradigmPool; })
  .catch((error) => { paradigmPool = undefined; throw error; })
  .finally(() => { paradigmConnectingDb = undefined; });

  return paradigmConnectingDb;
}

async function closeDbPool() {
  if (pool) {
    try { await pool.close(); } catch(e){} finally { pool = undefined; }
  }
  if (paradigmPool) {
    try { await paradigmPool.close(); } catch(e){} finally { paradigmPool = undefined; }
  }
}

module.exports = {
  sql,
  getDbPool,
  getParadigmDbPool,
  closeDbPool
};
