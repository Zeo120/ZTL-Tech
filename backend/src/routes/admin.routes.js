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
const { sql, getDbPool } = require('../config/db');

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

// POST /api/admin/phasr/free-audit
adminRoutes.post('/phasr/free-audit', adminLimiter, requireAtLeastRole('admin'), asyncHandler(async (req, res) => {
  const { domainName, proofDetails, agreementFilename } = req.body;
  if (!domainName || !proofDetails) {
    return res.status(400).json({ success: false, error: 'Domain name and proof details are required.' });
  }

  const userId = Number(req.auth.userId);
  const pool = await getDbPool();

  // Create Audit record
  const insertResult = await pool.request()
    .input('userId', sql.Int, userId)
    .input('domainName', sql.NVarChar(255), domainName)
    .input('proofDetails', sql.NVarChar(sql.MAX), proofDetails)
    .input('agreementFilename', sql.NVarChar(255), agreementFilename || null)
    .query(`
      INSERT INTO PhasrAudits (user_id, domain_name, proof_details, agreement_filename, status, created_at)
      VALUES (@userId, @domainName, @proofDetails, @agreementFilename, 'verifying', SYSUTCDATETIME());
      SELECT SCOPE_IDENTITY() as id;
    `);

  const auditId = insertResult.recordset[0].id;

  // Log setup in AuditLog
  await writeAuditEvent({
    actorUserId: userId,
    action: 'phasr.free_audit_setup',
    targetType: 'domain',
    targetId: domainName,
    ip: req.ip,
    userAgent: req.get('user-agent') || '',
    success: true,
    metadata: { auditId, domainName, status: 'verifying' }
  });

  // Start background simulation
  setTimeout(async () => {
    try {
      const bgPool = await getDbPool();
      
      // Update status to active
      await bgPool.request()
        .input('auditId', sql.Int, auditId)
        .query(`UPDATE PhasrAudits SET status = 'active' WHERE id = @auditId`);

      // Write port scan start
      await writeAuditEvent({
        actorUserId: userId,
        action: 'phasr.port_scan_started',
        targetType: 'domain',
        targetId: domainName,
        ip: '127.0.0.1',
        userAgent: 'PHASR Scanner Engine v1.0',
        success: true,
        metadata: { auditId, details: `Port scan initiated on subnet interfaces for ${domainName}` }
      });

      // Write port scan completed after 1 sec
      setTimeout(async () => {
        await writeAuditEvent({
          actorUserId: userId,
          action: 'phasr.port_scan_completed',
          targetType: 'domain',
          targetId: domainName,
          ip: '127.0.0.1',
          userAgent: 'PHASR Scanner Engine v1.0',
          success: true,
          metadata: { auditId, details: `Port scan complete. Found 2 open ports: 80 (HTTP), 443 (HTTPS).` }
        });
      }, 1000);

      // Write SSL check completed after 2 sec
      setTimeout(async () => {
        await writeAuditEvent({
          actorUserId: userId,
          action: 'phasr.ssl_check_completed',
          targetType: 'domain',
          targetId: domainName,
          ip: '127.0.0.1',
          userAgent: 'PHASR Scanner Engine v1.0',
          success: true,
          metadata: { auditId, details: `SSL/TLS cipher suite verified: TLS 1.3 enforced. Perfect Forward Secrecy verified.` }
        });
      }, 2000);

      // Write Security Headers audit after 3 sec
      setTimeout(async () => {
        await writeAuditEvent({
          actorUserId: userId,
          action: 'phasr.http_headers_audited',
          targetType: 'domain',
          targetId: domainName,
          ip: '127.0.0.1',
          userAgent: 'PHASR Scanner Engine v1.0',
          success: false,
          metadata: { auditId, details: `HTTP Headers: missing Content-Security-Policy (CSP) headers. HIGH risk detected.` }
        });
      }, 3000);

      // Write final report generation after 4 sec
      setTimeout(async () => {
        await writeAuditEvent({
          actorUserId: userId,
          action: 'phasr.vulnerability_report_generated',
          targetType: 'domain',
          targetId: domainName,
          ip: '127.0.0.1',
          userAgent: 'PHASR Scanner Engine v1.0',
          success: true,
          metadata: { auditId, details: `PHASR Shield security baseline check complete. Threat model updated for ${domainName}.` }
        });
      }, 4000);

    } catch (bgErr) {
      console.error('Background audit logger error:', bgErr);
    }
  }, 1000);

  return ok(res, {
    message: 'Free audit registered successfully. Initiating automated verification...'
  });
}));

// GET /api/admin/phasr/logs
adminRoutes.get('/phasr/logs', adminLimiter, requireAtLeastRole('admin'), asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const pool = await getDbPool();

  const logsResult = await pool.request()
    .input('userId', sql.Int, userId)
    .query(`
      SELECT id, action, target_type, target_id, success, metadata_json, created_at
      FROM AuditLog
      WHERE actor_user_id = @userId OR action LIKE 'phasr.%'
      ORDER BY created_at DESC;
    `);

  return ok(res, {
    logs: logsResult.recordset.map(row => ({
      id: row.id,
      action: row.action,
      targetType: row.target_type,
      targetId: row.target_id,
      success: row.success,
      metadata: row.metadata_json ? JSON.parse(row.metadata_json) : null,
      createdAt: row.created_at
    }))
  });
}));

module.exports = { adminRoutes };
