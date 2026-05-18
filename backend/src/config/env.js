function required(name) {
  const value = process.env[name];
  if (!value || !value.trim()) {
    throw new Error(`Missing required environment variable: ${name}`);
  }
  return value;
}

function optional(name, fallback = '') {
  return process.env[name] || fallback;
}

function parsePositiveInt(name, fallback) {
  const raw = process.env[name] || String(fallback);
  const value = Number(raw);
  if (!Number.isInteger(value) || value <= 0) {
    throw new Error(`Invalid positive integer environment variable: ${name}`);
  }
  return value;
}

function validateJwtSecret(value) {
  const weakExamples = new Set([
    'replace-with-a-long-random-secret',
    'secret',
    'jwt_secret',
    'changeme',
    'password'
  ]);

  if (weakExamples.has(value.toLowerCase())) {
    throw new Error('JWT_SECRET uses an insecure default value');
  }

  if (Buffer.byteLength(value, 'utf8') < 32) {
    throw new Error('JWT_SECRET must be at least 32 bytes');
  }

  const uniqueChars = new Set(value).size;
  if (uniqueChars < 12) {
    throw new Error('JWT_SECRET does not appear to have enough entropy');
  }

  return value;
}

const nodeEnv = process.env.NODE_ENV || 'development';
const isProduction = nodeEnv === 'production';
const jwtSecret = validateJwtSecret(required('JWT_SECRET'));

if (isProduction && process.env.SQL_TRUST_SERVER_CERTIFICATE === 'true') {
  throw new Error('SQL_TRUST_SERVER_CERTIFICATE=true is not allowed in production');
}

if (isProduction && (!process.env.SQL_USER || !process.env.SQL_PASSWORD)) {
  throw new Error('SQL_USER and SQL_PASSWORD are required in production');
}

const env = {
  nodeEnv,
  isProduction,
  port: parsePositiveInt('PORT', 3000),
  trustProxy: process.env.TRUST_PROXY === 'true',
  jwtSecret,
  jwtIssuer: process.env.JWT_ISSUER || 'ztl-tech',
  jwtAudience: process.env.JWT_AUDIENCE || 'ztl-tech-api',
  sessionTtlSeconds: parsePositiveInt('SESSION_TTL_SECONDS', 3600),
  sessionCookieName: process.env.SESSION_COOKIE_NAME || 'ztl_session',
  csrfCookieName: process.env.CSRF_COOKIE_NAME || 'ztl_csrf',
  csrfHeaderName: (process.env.CSRF_HEADER_NAME || 'x-csrf-token').toLowerCase(),
  sql: {
    server: required('SQL_SERVER'),
    instanceName: optional('SQL_INSTANCE'),
    port: parsePositiveInt('SQL_PORT', 1433),
    database: required('SQL_DATABASE'),
    user: optional('SQL_USER'),
    password: optional('SQL_PASSWORD'),
    options: {
      encrypt: process.env.SQL_ENCRYPT !== 'false',
      trustServerCertificate: process.env.SQL_TRUST_SERVER_CERTIFICATE === 'true'
    }
  },
  redisUrl: required('REDIS_URL'),
  rateLimitFallback: process.env.RATE_LIMIT_REDIS_REQUIRED !== 'true'
    && process.env.RATE_LIMIT_FALLBACK !== 'closed'
};

module.exports = { env };
