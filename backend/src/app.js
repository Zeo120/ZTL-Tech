const express = require('express');
const cookieParser = require('cookie-parser');
const { env } = require('./config/env');
const { securityHeaders } = require('./middleware/securityHeaders');
const { notFound } = require('./middleware/notFound');
const { errorHandler } = require('./middleware/errorHandler');
const { healthRoutes } = require('./routes/health.routes');
const { authRoutes } = require('./routes/auth.routes');
const { adminRoutes } = require('./routes/admin.routes');

function createApp() {
  const app = express();

  app.disable('x-powered-by');
  app.set('trust proxy', env.trustProxy);

  app.use(securityHeaders);
  app.use(express.json({ limit: '64kb' }));
  app.use(express.urlencoded({ extended: false, limit: '32kb' }));
  app.use(cookieParser());

  app.use('/api/health', healthRoutes);
  app.use('/api/auth', authRoutes);
  app.use('/api/admin', adminRoutes);

  app.use(notFound);
  app.use(errorHandler);

  return app;
}

module.exports = { createApp };
