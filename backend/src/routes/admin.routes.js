const express = require('express');
const { authenticateCookie } = require('../middleware/auth');
const { ipRateLimit } = require('../middleware/rateLimit');
const { requireAtLeastRole, requireRole, revalidateRoleAtLeast } = require('../middleware/requireRole');
const { requireCsrf } = require('../middleware/csrf');
const { asyncHandler } = require('../utils/asyncHandler');
const { ok } = require('../utils/responses');
const { env } = require('../config/env');
const { sessionCookieOptions, csrfCookieOptions } = require('../utils/cookies');
const { writeAuditEvent } = require('../services/audit.service');
const { rotateSession } = require('../services/session.service');
const { signSessionToken } = require('../services/auth.service');

const adminRoutes = express.Router();

adminRoutes.use(authenticateCookie);
adminRoutes.use(requireCsrf);

const adminLimiter = ipRateLimit({
  windowMs: 60 * 1000,
  max: 60,
  keyPrefix: 'admin'
});

const superAdminLimiter = ipRateLimit({
  windowMs: 60 * 1000,
  max: 20,
  keyPrefix: 'super-admin'
});

adminRoutes.get('/dashboard', adminLimiter, requireAtLeastRole('admin'), revalidateRoleAtLeast('admin'), (req, res) => {
  return ok(res, {
    message: 'Admin dashboard data endpoint is ready for implementation'
  });
});

adminRoutes.post('/super-admin/actions', superAdminLimiter, requireRole('super-admin'), revalidateRoleAtLeast('super-admin'), asyncHandler(async (req, res) => {
  await writeAuditEvent({
    actorUserId: Number(req.auth.userId),
    action: 'super_admin.action',
    ip: req.ip,
    userAgent: req.get('user-agent') || '',
    success: true,
    metadata: { route: req.originalUrl },
    failClosed: true
  });

  const rotatedSession = await rotateSession({
    sid: req.auth.sessionId,
    ip: req.ip,
    userAgent: req.get('user-agent') || ''
  });

  if (rotatedSession) {
    const token = signSessionToken({
      id: req.auth.userId,
      role: req.auth.role
    }, rotatedSession);

    res.cookie(env.sessionCookieName, token, sessionCookieOptions());
    res.cookie(env.csrfCookieName, rotatedSession.csrfToken, csrfCookieOptions());
  }

  return ok(res, {
    message: 'Super-admin action endpoint is ready for implementation'
  });
}));

module.exports = { adminRoutes };
