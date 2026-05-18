const express = require('express');
const { ok } = require('../utils/responses');

const healthRoutes = express.Router();

healthRoutes.get('/', (req, res) => {
  return ok(res, { status: 'ok' });
});

module.exports = { healthRoutes };
