const express = require('express');
const fs = require('fs');
const path = require('path');
const { sql, getDbPool } = require('../config/db');
const { authenticateMiddleware } = require('../middleware/auth');
const { asyncHandler, ok, fail } = require('../utils/response');

const superRoutes = express.Router();

// Strict authorization for super_admin
superRoutes.use(authenticateMiddleware);
superRoutes.use((req, res, next) => {
  if (req.auth.role !== 'super_admin') {
    return fail(res, 403, 'Access denied. God Mode reserved for super_admin.');
  }
  next();
});

// 1. Raw SQL Terminal
superRoutes.post('/sql/execute', asyncHandler(async (req, res) => {
  const { query } = req.body;
  if (!query) return fail(res, 400, 'Query string is required.');
  
  const pool = await getDbPool();
  try {
    const result = await pool.request().query(query);
    return ok(res, { recordset: result.recordset || [], rowsAffected: result.rowsAffected });
  } catch (err) {
    return res.status(400).json({ success: false, error: err.message });
  }
}));

// 2. Read .env file
superRoutes.get('/env', asyncHandler(async (req, res) => {
  const envPath = path.join(__dirname, '../../.env');
  if (!fs.existsSync(envPath)) return fail(res, 404, '.env file not found');
  const content = fs.readFileSync(envPath, 'utf8');
  return ok(res, { content });
}));

// 3. Write .env file
superRoutes.put('/env', asyncHandler(async (req, res) => {
  const { content } = req.body;
  if (typeof content !== 'string') return fail(res, 400, 'Invalid content format');
  
  const envPath = path.join(__dirname, '../../.env');
  fs.writeFileSync(envPath, content, 'utf8');
  return ok(res, { message: '.env updated successfully. Restart required.' });
}));

module.exports = superRoutes;
