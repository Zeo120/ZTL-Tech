const express = require('express');
const cors = require('cors');
const cookieParser = require('cookie-parser');
const path = require('path');

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

  app.use(cors({
    origin: true,
    credentials: true
  }));

  app.use(express.json({ limit: '64kb' }));

  app.use(express.urlencoded({
    extended: false,
    limit: '32kb'
  }));

  app.use(cookieParser());

  // ROOT PROJECT PATH
  const frontendPath = path.join(__dirname, '../../');

  console.log('Frontend Path:', frontendPath);

  // Serve static files
  app.use(express.static(frontendPath));

  // Main pages
  app.get('/', (_req, res) => {
    res.sendFile(path.join(frontendPath, 'index.html'));
  });

  app.get('/phasr', (_req, res) => {
    res.sendFile(path.join(frontendPath, 'phasr', 'index.html'));
  });

  app.get('/grid', (_req, res) => {
    res.sendFile(path.join(frontendPath, 'grid', 'index.html'));
  });

  app.get('/paradigm', (_req, res) => {
    res.sendFile(path.join(frontendPath, 'paradigm', 'index.html'));
  });

  app.get('/scalpel', (_req, res) => {
    res.sendFile(path.join(frontendPath, 'scalpel', 'index.html'));
  });

  app.get('/ztl', (_req, res) => {
    res.sendFile(path.join(frontendPath, 'ztl_tech', 'index.html'));
  });

  // API routes
  app.use('/api/health', healthRoutes);
  app.use('/api/auth', authRoutes);
  app.use('/api/admin', adminRoutes);

  // Error handlers
  app.use(notFound);
  app.use(errorHandler);

  return app;
}

module.exports = { createApp };