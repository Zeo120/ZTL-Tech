const express = require('express');
const { authenticateCookie } = require('../middleware/auth');
const { requireCsrf } = require('../middleware/csrf');
const { loginRateLimit } = require('../middleware/rateLimit');
const { env } = require('../config/env');
const { sessionCookieOptions, csrfCookieOptions } = require('../utils/cookies');
const { asyncHandler } = require('../utils/asyncHandler');
const { ok } = require('../utils/responses');
const { login } = require('../services/auth.service');
const { revokeSession, revokeAllSessions } = require('../services/session.service');

const authRoutes = express.Router();

const loginLimiter = loginRateLimit({
  windowMs: 15 * 60 * 1000,
  max: 10,
  keyPrefix: 'login'
});

authRoutes.post('/login', loginLimiter, asyncHandler(async (req, res) => {
  const result = await login(req.body, {
    ip: req.ip,
    userAgent: req.get('user-agent') || ''
  });

  res.cookie(result.cookieName, result.token, result.cookieOptions);
  res.cookie(result.csrfCookieName, result.csrfToken, csrfCookieOptions());
  return ok(res, { user: result.user });
}));

authRoutes.post('/logout', authenticateCookie, requireCsrf, asyncHandler(async (req, res) => {
  await revokeSession(req.auth.sessionId);
  res.clearCookie(env.sessionCookieName, sessionCookieOptions());
  res.clearCookie(env.csrfCookieName, csrfCookieOptions());
  return ok(res, {});
}));

authRoutes.post('/logout-all', authenticateCookie, requireCsrf, asyncHandler(async (req, res) => {
  await revokeAllSessions(req.auth.userId);
  res.clearCookie(env.sessionCookieName, sessionCookieOptions());
  res.clearCookie(env.csrfCookieName, csrfCookieOptions());
  return ok(res, {});
}));

authRoutes.get('/me', authenticateCookie, (req, res) => {
  return ok(res, { user: req.auth });
});

module.exports = { authRoutes };
;
