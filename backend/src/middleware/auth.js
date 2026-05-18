const jwt = require('jsonwebtoken');
const { env } = require('../config/env');
const { fail } = require('../utils/responses');
const { getSession, touchSession } = require('../services/session.service');

function readAuthInputs(req) {
  const header = req.get('authorization') || '';
  const bearerToken = header.startsWith('Bearer ') ? header.slice(7) : null;
  const cookieToken = req.cookies[env.sessionCookieName] || null;

  return { bearerToken, cookieToken };
}

function authenticate(options = {}) {
  const mode = options.mode || 'any';

  return async function authenticateMiddleware(req, res, next) {
    const { bearerToken, cookieToken } = readAuthInputs(req);

    if (bearerToken && cookieToken) {
      return fail(res, 400, 'Use either cookie auth or bearer auth, not both');
    }

    if (mode === 'cookie' && bearerToken) {
      return fail(res, 401, 'Cookie authentication required');
    }

    if (mode === 'bearer' && cookieToken) {
      return fail(res, 401, 'Bearer authentication required');
    }

    const token = mode === 'cookie'
      ? cookieToken
      : mode === 'bearer'
        ? bearerToken
        : bearerToken || cookieToken;
    const source = bearerToken ? 'bearer' : cookieToken ? 'cookie' : null;

  if (!token) return fail(res, 401, 'Authentication required');

  try {
    const payload = jwt.verify(token, env.jwtSecret, {
      algorithms: ['HS256'],
      issuer: env.jwtIssuer,
      audience: env.jwtAudience
    });
    const session = await getSession(payload.sid);

    if (!payload.sub || !payload.sid || !session || session.userId !== String(payload.sub)) {
      return fail(res, 401, 'Invalid or expired session');
    }

    await touchSession(session.sid);

    req.auth = {
      userId: payload.sub,
      role: session.role,
      tokenRole: payload.role,
      sessionId: session.sid,
      authSource: source,
      csrfToken: session.csrfToken
    };
    return next();
  } catch (error) {
    return fail(res, 401, 'Invalid or expired session');
  }
  };
}

const authenticateAny = authenticate();
const authenticateCookie = authenticate({ mode: 'cookie' });
const authenticateBearer = authenticate({ mode: 'bearer' });

module.exports = {
  authenticate,
  authenticateAny,
  authenticateCookie,
  authenticateBearer
};
