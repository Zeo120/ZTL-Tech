const { sql, getDbPool } = require('../config/db');
const { revokeAllSessions } = require('./session.service');

async function findUserAuthState(userId) {
  const pool = await getDbPool();
  const result = await pool.request()
    .input('userId', sql.Int, Number(userId))
    .query(`
      SELECT TOP 1
        id,
        role,
        is_active
      FROM Users
      WHERE id = @userId;
    `);

  return result.recordset[0] || null;
}

async function updateUserRole({ userId, role }) {
  const pool = await getDbPool();
  await pool.request()
    .input('userId', sql.Int, Number(userId))
    .input('role', sql.NVarChar(32), role)
    .query(`
      UPDATE Users
      SET role = @role
      WHERE id = @userId;
    `);

  await revokeAllSessions(userId);
}

async function disableUser({ userId }) {
  const pool = await getDbPool();
  await pool.request()
    .input('userId', sql.Int, Number(userId))
    .query(`
      UPDATE Users
      SET is_active = 0
      WHERE id = @userId;
    `);

  await revokeAllSessions(userId);
}

async function markPasswordChanged({ userId }) {
  await revokeAllSessions(userId);
}

module.exports = {
  findUserAuthState,
  updateUserRole,
  disableUser,
  markPasswordChanged
};
