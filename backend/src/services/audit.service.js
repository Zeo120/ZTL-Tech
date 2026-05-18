const { sql, getDbPool } = require('../config/db');
const { logger } = require('../utils/logger');

async function writeAuditEvent({
  actorUserId = null,
  action,
  targetType = null,
  targetId = null,
  ip = null,
  userAgent = null,
  success = true,
  metadata = {},
  failClosed = false
}) {
  try {
    const pool = await getDbPool();
    await pool.request()
      .input('actorUserId', sql.Int, actorUserId)
      .input('action', sql.NVarChar(100), action)
      .input('targetType', sql.NVarChar(100), targetType)
      .input('targetId', sql.NVarChar(100), targetId)
      .input('ip', sql.NVarChar(64), ip)
      .input('userAgent', sql.NVarChar(512), userAgent)
      .input('success', sql.Bit, success)
      .input('metadataJson', sql.NVarChar(sql.MAX), JSON.stringify(metadata))
      .query(`
        INSERT INTO AuditLog (
          actor_user_id,
          action,
          target_type,
          target_id,
          ip_address,
          user_agent,
          success,
          metadata_json,
          created_at
        )
        VALUES (
          @actorUserId,
          @action,
          @targetType,
          @targetId,
          @ip,
          @userAgent,
          @success,
          @metadataJson,
          SYSUTCDATETIME()
        );
      `);
  } catch (error) {
    logger.error('audit_write_failed', { error, action });
    if (failClosed) throw error;
  }
}

module.exports = { writeAuditEvent };
