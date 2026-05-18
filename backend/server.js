const { createApp } = require('./src/app');
const { env } = require('./src/config/env');
const { closeDbPool } = require('./src/config/db');
const { initDb } = require('./src/config/initDb');
const { closeRedisClient } = require('./src/config/redis');
const { logger } = require('./src/utils/logger');

const app = createApp();

let server;

async function start() {
  await initDb();

  server = app.listen(env.port, () => {
    logger.info('server_started', { port: env.port, env: env.nodeEnv });
  });
}

function shutdown(signal) {
  logger.info('server_shutdown_started', { signal });
  if (!server) {
    Promise.all([closeDbPool(), closeRedisClient()])
      .finally(() => process.exit(0));
    return;
  }

  server.close(async () => {
    await closeDbPool();
    await closeRedisClient();
    logger.info('server_shutdown_complete');
    process.exit(0);
  });
}

process.on('SIGINT', shutdown);
process.on('SIGTERM', shutdown);

start().catch(async (error) => {
  logger.error('server_start_failed', { error });
  await closeDbPool();
  await closeRedisClient();
  process.exit(1);
});
