const argon2 = require('argon2');
const jwt = require('jsonwebtoken');
const { sql, getDbPool } = require('../config/db');
const { env } = require('../config/env');
const { sessionCookieOptions } = require('../utils/cookies');
const { httpError } = require('../utils/httpError');
const { validateLoginBody } = require('../utils/validators');
const { writeAuditEvent } = require('./audit.service');
const { createSession } = require('./session.service');

const VALID_ROLES = new Set(['super-admin', 'admin', 'user']);

async function findUserByEmail(email) {
  const pool = await getDbPool();
  const result = await pool.request()
    .input('email', sql.NVarChar(254), email)
    .query(`
      SELECT TOP 1
        id,
        email,
        password_hash,
        role,
        is_active
      FROM Users
      WHERE email = @email;
    `);

  return result.recordset[0] || null;
}

function signSessionToken(user, session) {
  return jwt.sign(
    {
      role: user.role,
      sid: session.sid
    },
    env.jwtSecret,
    {
      algorithm: 'HS256',
      subject: String(user.id),
      issuer: env.jwtIssuer,
      audience: env.jwtAudience,
      expiresIn: env.sessionTtlSeconds
    }
  );
}

async function login(body, requestContext) {
  const { email, password } = validateLoginBody(body);
  const user = await findUserByEmail(email);

  const passwordMatches = user
    ? await argon2.verify(user.password_hash, password)
    : false;

  if (!user || !passwordMatches || !user.is_active || !VALID_ROLES.has(user.role)) {
    await writeAuditEvent({
      action: 'auth.login_failed',
      ip: requestContext.ip,
      userAgent: requestContext.userAgent,
      success: false,
      metadata: { email }
    });
    throw httpError(401, 'Invalid email or password');
  }

  const session = await createSession({
    userId: user.id,
    role: user.role,
    ip: requestContext.ip,
    userAgent: requestContext.userAgent
  });

  await writeAuditEvent({
    actorUserId: user.id,
    action: 'auth.login_succeeded',
    ip: requestContext.ip,
    userAgent: requestContext.userAgent,
    success: true
  });

  return {
    cookieName: env.sessionCookieName,
    csrfCookieName: env.csrfCookieName,
    csrfToken: session.csrfToken,
    token: signSessionToken(user, session),
    cookieOptions: sessionCookieOptions(),
    user: {
      id: user.id,
      email: user.email,
      role: user.role
    }
  };
}

module.exports = { login, signSessionToken };
