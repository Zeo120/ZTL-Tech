const { createApp } = require('./src/app');
const { env } = require('./src/config/env');
const { closeDbPool } = require('./src/config/db');
const { initDb } = require('./src/config/initDb');
const { closeRedisClient } = require('./src/config/redis');
const { logger } = require('./src/utils/logger');

const app = createApp();

let server;

async function start() {
  try {
    await initDb();

    server = app.listen(env.port, '0.0.0.0', () => {
      logger.info('server_started', {
        port: env.port,
        env: env.nodeEnv,
        local: `http://localhost:${env.port}`,
        network: `http://192.168.1.21:${env.port}`
      });
    });
  } catch (error) {
    logger.error('server_start_failed', { error });

    await closeDbPool();
    await closeRedisClient();

    process.exit(1);
  }
}

async function shutdown(signal) {
  logger.info('server_shutdown_started', { signal });

  // Set a hard timeout to force shutdown if server.close hangs under active keep-alive connections
  const forceShutdownTimeout = setTimeout(async () => {
    logger.warn('server_shutdown_forced', { reason: 'Graceful shutdown timeout exceeded' });
    try {
      await Promise.all([
        closeDbPool(),
        closeRedisClient()
      ]);
    } catch (err) {
      logger.error('server_shutdown_forced_cleanup_failed', { error: err });
    }
    process.exit(1);
  }, 10000); // 10 seconds hard timeout

  if (forceShutdownTimeout.unref) {
    forceShutdownTimeout.unref();
  }

  try {
    if (!server) {
      await Promise.all([
        closeDbPool(),
        closeRedisClient()
      ]);
      clearTimeout(forceShutdownTimeout);
      process.exit(0);
      return;
    }

    server.close(async () => {
      clearTimeout(forceShutdownTimeout);
      try {
        await Promise.all([
          closeDbPool(),
          closeRedisClient()
        ]);
        logger.info('server_shutdown_complete');
        process.exit(0);
      } catch (error) {
        logger.error('server_shutdown_failed', { error });
        process.exit(1);
      }
    });
  } catch (error) {
    clearTimeout(forceShutdownTimeout);
    logger.error('server_shutdown_failed', { error });
    process.exit(1);
  }
}

process.on('SIGINT', () => shutdown('SIGINT'));
process.on('SIGTERM', () => shutdown('SIGTERM'));

start();