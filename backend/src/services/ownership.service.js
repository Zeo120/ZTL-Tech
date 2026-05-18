const { sql, getDbPool } = require('../config/db');

async function findPageForUser({ pageId, userId }) {
  const pool = await getDbPool();
  const result = await pool.request()
    .input('pageId', sql.Int, pageId)
    .input('userId', sql.Int, Number(userId))
    .query(`
      SELECT TOP 1
        p.id,
        p.user_id,
        p.title,
        p.created_at
      FROM Pages p
      WHERE p.id = @pageId
        AND p.user_id = @userId;
    `);

  return result.recordset[0] || null;
}

async function findWidgetForUser({ widgetId, userId }) {
  const pool = await getDbPool();
  const result = await pool.request()
    .input('widgetId', sql.Int, widgetId)
    .input('userId', sql.Int, Number(userId))
    .query(`
      SELECT TOP 1
        w.id,
        w.page_id,
        w.type,
        w.config_json
      FROM Widgets w
      INNER JOIN Pages p ON p.id = w.page_id
      WHERE w.id = @widgetId
        AND p.user_id = @userId;
    `);

  return result.recordset[0] || null;
}

module.exports = {
  findPageForUser,
  findWidgetForUser
};
