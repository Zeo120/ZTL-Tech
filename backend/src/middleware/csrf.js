const { env } = require('../config/env');
const { fail } = require('../utils/responses');

const SAFE_METHODS = new Set(['GET', 'HEAD', 'OPTIONS']);

function requireCsrf(req, res, next) {
  if (SAFE_METHODS.has(req.method)) return next();

  if (!req.auth || req.auth.authSource !== 'cookie') {
    return fail(res, 403, 'CSRF requires cookie authentication');
  }

  const cookieToken = req.cookies[env.csrfCookieName];
  const headerToken = req.get(env.csrfHeaderName);
  const sessionToken = req.auth.csrfToken;

  if (!cookieToken || !headerToken || !sessionToken || cookieToken !== sessionToken || headerToken !== sessionToken) {
    return fail(res, 403, 'CSRF validation failed');
  }

  return next();
}

module.exports = { requireCsrf };
