const express = require('express');
const cors = require('cors');
const cookieParser = require('cookie-parser');
const path = require('path');

const { env } = require('./config/env');
const { honeypotRouter } = require('./middleware/blackhole');
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

  // Blackhole router executes first to instantly drop malicious IPs
  app.use(honeypotRouter);
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

  const fs = require('fs');
  const logFile = path.join(__dirname, '../server.log');
  
  app.use((req, res, next) => {
    const start = Date.now();
    const sanitizeObj = (obj) => {
      if (!obj) return {};
      const sanitized = { ...obj };
      ['password', 'token', 'authorization', 'cookie'].forEach(k => {
        if (sanitized[k]) sanitized[k] = '[REDACTED]';
      });
      return sanitized;
    };

    console.log(`\n[\x1b[36mINCOMING\x1b[0m] ${req.method} ${req.originalUrl}`);
    console.log(`\x1b[90mHEADERS:\x1b[0m`, JSON.stringify(sanitizeObj(req.headers)));
    if (Object.keys(req.query).length) console.log(`\x1b[90mQUERY:\x1b[0m`, JSON.stringify(sanitizeObj(req.query)));
    if (Object.keys(req.body).length) console.log(`\x1b[90mBODY:\x1b[0m`, JSON.stringify(sanitizeObj(req.body)));

    res.on('finish', () => {
      const duration = Date.now() - start;
      const statusColor = res.statusCode >= 500 ? '\x1b[31m' : res.statusCode >= 400 ? '\x1b[33m' : '\x1b[32m';
      console.log(`[\x1b[35mOUTGOING\x1b[0m] ${req.method} ${req.originalUrl} ${statusColor}${res.statusCode}\x1b[0m - ${duration}ms\n`);

      // Write structured JSON to server.log for parsing
      const logEntry = {
        timestamp: new Date().toISOString(),
        ip: req.ip || req.headers['x-forwarded-for'] || req.socket.remoteAddress,
        method: req.method,
        path: req.originalUrl,
        status: res.statusCode,
        duration,
        error: res.statusCode >= 400 ? res.statusMessage : null
      };
      fs.appendFile(logFile, JSON.stringify(logEntry) + '\\n', (err) => {
        if (err) console.error('Failed to write log', err);
      });
    });
    next();
  });

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
