const { fail } = require('../utils/responses');
const { withRedis } = require('../config/redis');
const { env } = require('../config/env');
const { normalizeEmail } = require('../utils/validators');
const { logger } = require('../utils/logger');

const crypto = require('crypto');

function fallbackMemoryRateLimit({ windowMs, max }) {
  const buckets = new Map();

  // Periodically prune expired rate limit entries to prevent memory leaks
  const interval = setInterval(() => {
    const now = Date.now();
    for (const [key, timestamps] of buckets.entries()) {
      const valid = timestamps.filter(t => t > now - windowMs);
      if (valid.length === 0) {
        buckets.delete(key);
      } else {
        buckets.set(key, valid);
      }
    }
  }, 60000);

  if (interval.unref) {
    interval.unref();
  }

  return function check(key) {
    const now = Date.now();
    const windowStart = now - windowMs;
    
    let timestamps = buckets.get(key) || [];
    timestamps = timestamps.filter(t => t > windowStart);
    timestamps.push(now);
    buckets.set(key, timestamps);
    
    return {
      count: timestamps.length,
      allowed: timestamps.length <= max
    };
  };
}

async function incrementRedisLimit(key, windowMs) {
  const now = Date.now();
  const windowStart = now - windowMs;
  const windowSeconds = Math.ceil(windowMs / 1000);

  return withRedis(async (redis) => {
    const multi = redis.multi();
    // Remove timestamps older than the sliding window
    multi.zRemRangeByScore(key, 0, windowStart);
    // Add the current request timestamp with a unique value to prevent collision
    multi.zAdd(key, { score: now, value: `${now}-${crypto.randomUUID()}` });
    // Count the number of requests in the current window
    multi.zCard(key);
    // Set an expiration on the sorted set to prevent memory leaks
    multi.expire(key, windowSeconds);
    
    const results = await multi.exec();
    // results[2] is the output of zCard
    return results[2];
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
        const count = await incrementRedisLimit(key, windowMs);
        
        // Inject modern rate limiting headers
        res.setHeader('X-RateLimit-Limit', max);
        res.setHeader('X-RateLimit-Remaining', Math.max(0, max - count));

        if (count > max) {
          res.setHeader('Retry-After', windowSeconds);
          return fail(res, 429, 'Too many requests. Please try again later.');
        }
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
        const fallbackCheck = fallback(key);
        res.setHeader('X-RateLimit-Limit', max);
        res.setHeader('X-RateLimit-Remaining', Math.max(0, max - fallbackCheck.count));
        
        if (!fallbackCheck.allowed) {
          res.setHeader('Retry-After', windowSeconds);
          return fail(res, 429, 'Too many requests. Please try again later.');
        }
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
