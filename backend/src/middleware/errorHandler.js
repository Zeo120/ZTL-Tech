const { env } = require('../config/env');
const { fail } = require('../utils/responses');
const { logger } = require('../utils/logger');

function errorHandler(error, req, res, next) {
  if (res.headersSent) {
    next(error);
    return;
  }

  const status = Number(error.statusCode || error.status || 500);
  const safeStatus = status >= 400 && status < 600 ? status : 500;
  const isOperational = safeStatus < 500;

  logger[isOperational ? 'warn' : 'error']('request_failed', {
    method: req.method,
    path: req.originalUrl,
    status: safeStatus,
    error
  });

  const message = isOperational
    ? error.message || 'Request failed'
    : 'Internal server error';

  if (!env.isProduction && !isOperational) {
    return res.status(safeStatus).json({
      success: false,
      message,
      error: {
        name: error.name,
        message: error.message,
        stack: error.stack
      }
    });
  }

  return fail(res, safeStatus, message);
}

module.exports = { errorHandler };
