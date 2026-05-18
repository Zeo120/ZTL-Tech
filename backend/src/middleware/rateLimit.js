const { fail } = require('../utils/responses');
const { withRedis } = require('../config/redis');
const { env } = require('../config/env');
const { normalizeEmail } = require('../utils/validators');
const { logger } = require('../utils/logger');

function fallbackMemoryRateLimit({ windowMs, max }) {
  const buckets = new Map();

  return function check(key) {
    const now = Date.now();
    const current = buckets.get(key);

    if (!current || current.resetAt <= now) {
      buckets.set(key, { count: 1, resetAt: now + windowMs });
      return true;
    }

    current.count += 1;
    return current.count <= max;
  };
}

async function incrementRedisLimit(key, windowSeconds) {
  return withRedis(async (redis) => {
    const count = await redis.incr(key);
    if (count === 1) await redis.expire(key, windowSeconds);
    return count;
  });
}

function getIp(req) {
  return req.ip || req.socket.remoteAddress || 'unknown';
}

function redisRateLimit({ windowMs, max, keyPrefix, keyParts, failClosedOnRedisError = false }) {
  const windowSeconds = Math.ceil(windowMs / 1000);
  const fallback = fallbackMemoryRateLimit({ windowMs, max });

  return async function rateLimitMiddleware(req, res, next) {
    const parts = keyParts(req).filter(Boolean);
    const keys = parts.map((part) => `rl:${keyPrefix}:${part}`);

    try {
      for (const key of keys) {
        const count = await incrementRedisLimit(key, windowSeconds);
        if (count > max) return fail(res, 429, 'Too many requests');
      }
      return next();
    } catch (error) {
      logger.error('rate_limit_redis_failed', { error, keyPrefix });

      // Production login limiting must fail closed; development keeps a bounded
      // in-memory fallback so local work is not blocked by Redis restarts.
      if (failClosedOnRedisError || !env.rateLimitFallback) {
        return fail(res, 503, 'Rate limiter unavailable');
      }

      for (const key of keys) {
        if (!fallback(key)) return fail(res, 429, 'Too many requests');
      }
      return next();
    }
  };
}

function loginRateLimit(options) {
  return redisRateLimit({
    ...options,
    failClosedOnRedisError: env.isProduction,
    keyParts: (req) => [
      `ip:${getIp(req)}`,
      `email:${normalizeEmail(req.body && req.body.email) || 'missing'}`
    ]
  });
}

function ipRateLimit(options) {
  return redisRateLimit({
    ...options,
    keyParts: (req) => [`ip:${getIp(req)}`]
  });
}

module.exports = {
  loginRateLimit,
  ipRateLimit
};
