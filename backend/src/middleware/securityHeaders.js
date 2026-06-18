const { env } = require('../config/env');
const crypto = require('crypto');

function securityHeaders(req, res, next) {
  // Generate a cryptographically secure 256-bit nonce
  const nonce = crypto.randomBytes(32).toString('base64');
  res.locals.nonce = nonce;

  res.setHeader('X-Content-Type-Options', 'nosniff');
  res.setHeader('Referrer-Policy', 'no-referrer');
  res.setHeader('Permissions-Policy', 'camera=(), microphone=(), geolocation=()');

  if (req.path.startsWith('/api/')) {
    res.setHeader('Content-Security-Policy', "default-src 'none'; frame-ancestors 'none'");
  } else if (!req.path.match(/\.(css|png|jpg|jpeg|svg|ico|woff|woff2)$/)) {
    // Inject the military-grade Strict CSP on HTML pages
    res.setHeader('Content-Security-Policy', `script-src 'self' 'nonce-${nonce}' 'strict-dynamic'; object-src 'none'; base-uri 'none';`);
  }

  if (env.isProduction) {
    res.setHeader('Strict-Transport-Security', 'max-age=15552000; includeSubDomains');
  }

  next();
}

module.exports = { securityHeaders };
