const crypto = require('crypto');
const argon2 = require('argon2');
const jwt = require('jsonwebtoken');
const { sql, getDbPool } = require('../config/db');
const { env } = require('../config/env');
const { sessionCookieOptions } = require('../utils/cookies');
const { httpError } = require('../utils/httpError');
const { validateLoginBody } = require('../utils/validators');
const { writeAuditEvent } = require('./audit.service');
const { createSession } = require('./session.service');
const { auditLoginSession } = require('./tbais.service');
const { withRedis } = require('../config/redis');

const VALID_ROLES = new Set(['super-admin', 'super_admin', 'admin', 'user']);

async function hashPassword(password) {
  return argon2.hash(password, {
    type: argon2.argon2id,
    memoryCost: 2 ** 16, // 64 MB
    timeCost: 4,         // 4 iterations
    parallelism: 2       // 2 threads
  });
}

async function verifyPassword(hash, password) {
  return argon2.verify(hash, password);
}

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
        purchased_modules,
        is_active
      FROM Users
      WHERE email = @email;
    `);

  return result.recordset[0] || null;
}

async function findUserById(id) {
  const pool = await getDbPool();
  const result = await pool.request()
    .input('id', sql.Int, id)
    .query(`
      SELECT TOP 1
        id,
        email,
        role,
        purchased_modules,
        is_active
      FROM Users
      WHERE id = @id;
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

async function checkAccountLockout(email) {
  return withRedis(async (redis) => {
    const attempts = parseInt(await redis.get(`auth:lockout:${email}`)) || 0;
    return attempts >= 5;
  });
}

async function recordFailedLogin(email) {
  return withRedis(async (redis) => {
    const key = `auth:lockout:${email}`;
    const attempts = await redis.incr(key);
    if (attempts === 1) {
      // Lock for 15 minutes
      await redis.expire(key, 15 * 60);
    }
  });
}

async function clearFailedLogin(email) {
  return withRedis(async (redis) => {
    await redis.del(`auth:lockout:${email}`);
  });
}

const DUMMY_HASH = '$argon2id$v=19$m=65536,t=3,p=4$7aUA7GPkSnBru/DiJ4uB5g$HcLVIJt4kCEjmaXMKhAzeAWeq3Uc90CeTvxAe9wxOtI';

async function login(body, requestContext) {
  const { email, password } = validateLoginBody(body);

  if (await checkAccountLockout(email)) {
    throw httpError(423, 'Account temporarily locked due to too many failed attempts. Try again in 15 minutes.');
  }

  const user = await findUserByEmail(email);

  let passwordMatches = false;
  if (user) {
    passwordMatches = await verifyPassword(user.password_hash, password);
  } else {
    // Run dummy verification to prevent email enumeration timing attacks
    await verifyPassword(DUMMY_HASH, password);
  }

  const credentialsValid = !!(user && passwordMatches && user.is_active && VALID_ROLES.has(user.role));
  const tbaisResult = await auditLoginSession(requestContext, credentialsValid);

  if (!credentialsValid) {
    await recordFailedLogin(email);
    await writeAuditEvent({
      action: 'auth.login_failed',
      ip: requestContext.ip,
      userAgent: requestContext.userAgent,
      success: false,
      metadata: { email, tbais: tbaisResult }
    });
    throw httpError(401, 'Invalid email or password');
  }

  await clearFailedLogin(email);

  let ip = requestContext.ip || ''; if (ip === '::1') ip = '127.0.0.1';
  const userAgent = requestContext.userAgent || '';
  const deviceHash = crypto.createHash('sha256').update(`${ip}-${userAgent}`).digest('hex');

  const session = await createSession({
    userId: user.id,
    role: user.role,
    ip,
    userAgent,
    deviceHash
  });

  await writeAuditEvent({
    actorUserId: user.id,
    action: 'auth.login_succeeded',
    ip: requestContext.ip,
    userAgent: requestContext.userAgent,
    success: true,
    metadata: { tbais: tbaisResult }
  });

  let parsedModules = [];
  try {
    parsedModules = JSON.parse(user.purchased_modules || '[]');
  } catch (e) {
    parsedModules = [];
  }

  return {
    cookieName: env.sessionCookieName,
    csrfCookieName: env.csrfCookieName,
    csrfToken: session.csrfToken,
    token: signSessionToken(user, session),
    cookieOptions: sessionCookieOptions(),
    user: {
      id: user.id,
      email: user.email,
      role: user.role,
      purchased_modules: parsedModules
    }
  };
}

module.exports = { hashPassword, login, signSessionToken, verifyPassword, findUserById };
