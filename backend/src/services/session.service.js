const crypto = require('crypto');
const { env } = require('../config/env');
const { withRedis } = require('../config/redis');

function sessionKey(sid) {
  return `session:${sid}`;
}

function userSessionsKey(userId) {
  return `user:${userId}:sessions`;
}

function userVersionKey(userId) {
  return `user:${userId}:sessionVersion`;
}

function nowSeconds() {
  return Math.floor(Date.now() / 1000);
}

function hashContext(value) {
  return crypto
    .createHash('sha256')
    .update(String(value || 'unknown'))
    .digest('hex');
}

async function getUserSessionVersion(userId) {
  const version = await withRedis((redis) => redis.get(userVersionKey(userId)));
  return Number(version || 0);
}

async function createSession({ userId, role, ip, userAgent }) {
  const sid = crypto.randomUUID();
  const csrfToken = crypto.randomBytes(32).toString('base64url');
  const issuedAt = nowSeconds();
  const expiresAt = issuedAt + env.sessionTtlSeconds;
  const version = await getUserSessionVersion(userId);

  const session = {
    sid,
    userId: String(userId),
    role,
    issuedAt,
    lastSeen: issuedAt,
    expiresAt,
    csrfToken,
    userAgentHash: hashContext(userAgent),
    ipHash: hashContext(ip),
    revoked: false,
    version
  };

  await withRedis(async (redis) => {
    await redis.multi()
      .set(sessionKey(sid), JSON.stringify(session), { EX: env.sessionTtlSeconds })
      .sAdd(userSessionsKey(userId), sid)
      .expire(userSessionsKey(userId), env.sessionTtlSeconds)
      .exec();
  });

  return session;
}

async function getSession(sid) {
  if (!sid) return null;
  const raw = await withRedis((redis) => redis.get(sessionKey(sid)));
  if (!raw) return null;

  let session;
  try {
    session = JSON.parse(raw);
  } catch (error) {
    await withRedis((redis) => redis.del(sessionKey(sid)));
    return null;
  }

  if (session.revoked || session.expiresAt <= nowSeconds()) return null;

  const currentVersion = await getUserSessionVersion(session.userId);
  if (Number(session.version || 0) !== currentVersion) return null;

  return session;
}

async function touchSession(sid) {
  if (!sid) return;
  await withRedis(async (redis) => {
    const raw = await redis.get(sessionKey(sid));
    if (!raw) return;

    let session;
    try {
      session = JSON.parse(raw);
    } catch (error) {
      await redis.del(sessionKey(sid));
      return;
    }

    session.lastSeen = nowSeconds();
    const ttl = Math.max(1, session.expiresAt - session.lastSeen);
    await redis.set(sessionKey(sid), JSON.stringify(session), { EX: ttl });
  });
}

async function revokeSession(sid) {
  if (!sid) return;
  const session = await getSession(sid);

  await withRedis(async (redis) => {
    const tx = redis.multi().del(sessionKey(sid));
    if (session) tx.sRem(userSessionsKey(session.userId), sid);
    await tx.exec();
  });
}

async function revokeAllSessions(userId) {
  await withRedis(async (redis) => {
    const sids = await redis.sMembers(userSessionsKey(userId));
    const tx = redis.multi();

    for (const sid of sids) tx.del(sessionKey(sid));
    tx.del(userSessionsKey(userId));
    tx.incr(userVersionKey(userId));

    await tx.exec();
  });
}

async function rotateSession({ sid, ip, userAgent }) {
  const current = await getSession(sid);
  if (!current) return null;

  await revokeSession(sid);
  return createSession({
    userId: current.userId,
    role: current.role,
    ip,
    userAgent
  });
}

module.exports = {
  createSession,
  getSession,
  touchSession,
  revokeSession,
  revokeAllSessions,
  rotateSession
};
