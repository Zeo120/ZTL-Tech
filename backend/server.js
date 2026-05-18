const { createApp } = require('./src/app');
const { env } = require('./src/config/env');
const { closeDbPool } = require('./src/config/db');
const { closeRedisClient } = require('./src/config/redis');
const { logger } = require('./src/utils/logger');

const app = createApp();

const server = app.listen(env.port, () => {
  logger.info('server_started', { port: env.port, env: env.nodeEnv });
});

function shutdown(signal) {
  logger.info('server_shutdown_started', { signal });
  server.close(async () => {
    await closeDbPool();
    await closeRedisClient();
    logger.info('server_shutdown_complete');
    process.exit(0);
  });
}

process.on('SIGINT', shutdown);
process.on('SIGTERM', shutdown);
