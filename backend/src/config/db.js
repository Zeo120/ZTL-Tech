const sql = require('mssql');
const { env } = require('./env');
const { logger } = require('../utils/logger');

let pool;
let connectingDb;

async function getDbPool() {
  console.warn('Backend SQL access is disabled in static-only mode.');
  return null;
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
