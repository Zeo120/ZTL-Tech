const { env } = require('../config/env');
const { fail } = require('../utils/responses');

const SAFE_METHODS = new Set(['GET', 'HEAD', 'OPTIONS']);

function requireCsrf(req, res, next) {
  if (SAFE_METHODS.has(req.method)) return next();

  if (!req.auth) {
    return fail(res, 401, 'Authentication required');
  }

  if (req.auth.authSource !== 'cookie') {
    return next();
  }

  const cookieToken = req.cookies[env.csrfCookieName];
  const headerToken = req.get(env.csrfHeaderName);
  const sessionToken = req.auth.csrfToken;

  if (!cookieToken || !headerToken || !sessionToken) {
    return fail(res, 403, 'CSRF validation failed');
  }

  try {
    const crypto = require('crypto');
    const cookieBuf = Buffer.from(cookieToken, 'utf8');
    const headerBuf = Buffer.from(headerToken, 'utf8');
    const sessionBuf = Buffer.from(sessionToken, 'utf8');

    if (
      cookieBuf.length !== sessionBuf.length ||
      headerBuf.length !== sessionBuf.length ||
      !crypto.timingSafeEqual(cookieBuf, sessionBuf) ||
      !crypto.timingSafeEqual(headerBuf, sessionBuf)
    ) {
      return fail(res, 403, 'CSRF validation failed');
    }
  } catch (err) {
    return fail(res, 403, 'CSRF validation failed');
  }

  return next();
}

module.exports = { requireCsrf };
