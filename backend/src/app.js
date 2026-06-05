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
const { employeeRoutes } = require('./routes/employee.routes');
const { gridAdminRoutes } = require('./grid/routes/admin.routes');
const { gridEmployeeRoutes } = require('./grid/routes/employee.routes');
const { gridAuthRoutes } = require('./grid/routes/auth.routes');

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

  const frontendPath = path.join(__dirname, '../../');

  function mountStaticRoute(route, folderName) {
    const staticDir = path.join(frontendPath, folderName);

    app.use(route, express.static(staticDir));

    app.get(route, (_req, res) => {
      res.sendFile(path.join(staticDir, 'index.html'));
    });
  }

  // Serve static files from specific whitelisted directories only.
  // This keeps backend internals out of the public surface.
  mountStaticRoute('/paradigm', 'paradigm');
  mountStaticRoute('/phasr', 'phasr');
  mountStaticRoute('/scalpel', 'scalpel');
  mountStaticRoute('/ztl_tech', 'ztl_tech');
  mountStaticRoute('/grid', 'grid');

  // Main pages
  app.get('/', (_req, res) => {
    res.redirect('/ztl_tech/index.html');
  });

  app.get('/ztl', (_req, res) => {
    res.sendFile(path.join(frontendPath, 'ztl_tech', 'index.html'));
  });

  // API routes
  app.use('/api/health', healthRoutes);
  app.use('/api/auth', authRoutes);
  app.use('/api/admin', adminRoutes);
  app.use('/api/employee', employeeRoutes);

  // Grid API routes
  app.use('/api/grid/auth', gridAuthRoutes);
  app.use('/api/grid/admin', gridAdminRoutes);
  app.use('/api/grid/employee', gridEmployeeRoutes);

  // Error handlers
  app.use(notFound);
  app.use(errorHandler);

  return app;
}

module.exports = { createApp };
