const { getRedisClient } = require('../config/redis');

// Predefined set of common automated scanner paths.
// If any of these are hit, the IP is immediately blacklisted.
const HONEYPOT_PATHS = new Set([
  '/.env',
  '/.env.local',
  '/.env.production',
  '/.git',
  '/.git/config',
  '/wp-admin',
  '/wp-login.php',
  '/.vscode',
  '/phpinfo.php',
  '/config.json',
  '/package.json',
  '/docker-compose.yml',
  '/xmlrpc.php',
  '/server-status',
  '/adminer.php'
]);

const BLACKLIST_PREFIX = 'bh:';
const BLACKLIST_TTL = 86400; // 24 hours

async function honeypotRouter(req, res, next) {
  const ip = req.ip || req.headers['x-forwarded-for'] || req.socket.remoteAddress;
  
  if (!ip) return next();

  try {
    const redis = await getRedisClient();
    const blacklistKey = `${BLACKLIST_PREFIX}${ip}`;

    // 1. Check if IP is already in the Blackhole.
    const isBlacklisted = await redis.get(blacklistKey);
    
    if (isBlacklisted) {
      // Act like a true blackhole: drop connection instantly without sending HTTP response headers
      return req.socket.destroy(); 
    }

    // 2. Check if the current path is a honeypot trap
    if (HONEYPOT_PATHS.has(req.path)) {
      // Register IP into the Blackhole
      await redis.set(blacklistKey, '1', { EX: BLACKLIST_TTL });
      
      console.warn(`[BLACKHOLE] IP ${ip} stepped on honeypot path: ${req.path}. Blacklisted for 24 hours.`);
      
      return req.socket.destroy();
    }

    next();
  } catch (error) {
    console.error('Blackhole middleware error:', error);
    // Fail open if Redis drops to prevent locking out legitimate traffic
    next();
  }
}

module.exports = { honeypotRouter };
