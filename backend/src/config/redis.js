const { createClient } = require('redis');
const { env } = require('./env');
const { logger } = require('../utils/logger');

let client;
let connecting;

async function getRedisClient() {
  if (client && client.isOpen) return client;
  if (connecting) return connecting;

  client = createClient({ url: env.redisUrl });
  client.on('error', (error) => {
    logger.error('redis_error', { error });
  });

  connecting = client.connect()
    .then(() => client)
    .finally(() => {
      connecting = undefined;
    });

  return connecting;
}

async function closeRedisClient() {
  if (!client || !client.isOpen) return;
  await client.quit();
}

async function withRedis(operation) {
  const redis = await getRedisClient();
  return operation(redis);
}

module.exports = {
  getRedisClient,
  closeRedisClient,
  withRedis
};
