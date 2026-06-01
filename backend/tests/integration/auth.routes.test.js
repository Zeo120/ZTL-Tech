const test = require('node:test');
const assert = require('node:assert/strict');
const jwt = require('jsonwebtoken');

// 1. Configure Mock Env Vars if not set (Node --env-file might have loaded them)
if (!process.env.JWT_SECRET) {
  process.env.JWT_SECRET = 'd207d896660ef7df1915bfaea2fa3b375d78ffd6c2114f9449dab2bc521dda4ad4a28fe5c0d68da0454d9d8fdbacdaeb0e7de2964f65c3a79a1d9b8c87210888';
}
if (!process.env.SQL_SERVER) {
  process.env.SQL_SERVER = 'localhost';
}
if (!process.env.SQL_DATABASE) {
  process.env.SQL_DATABASE = 'testdb';
}
if (!process.env.REDIS_URL) {
  process.env.REDIS_URL = 'redis://localhost:6379';
}

const { env } = require('../../src/config/env');

// 2. Mock Modules in Require Cache to bypass DB and Redis entirely
const mockAuthService = {
  login: async (body, requestContext) => {
    const { email, password } = body;
    if (email === 'admin@ztl.tech' && password === 'correct-password') {
      const csrfToken = 'mock-csrf-token-12345';
      const sid = 'mock-session-id-12345';
      const user = { id: 1, email: 'admin@ztl.tech', role: 'admin' };
      
      const token = jwt.sign(
        { role: user.role, sid },
        env.jwtSecret,
        {
          algorithm: 'HS256',
          subject: String(user.id),
          issuer: env.jwtIssuer,
          audience: env.jwtAudience,
          expiresIn: 3600
        }
      );
      
      return {
        cookieName: env.sessionCookieName,
        csrfCookieName: env.csrfCookieName,
        csrfToken,
        token,
        cookieOptions: { httpOnly: true, secure: false },
        user
      };
    }
    const { httpError } = require('../../src/utils/httpError');
    throw httpError(401, 'Invalid email or password');
  },
  findUserById: async (id) => {
    if (String(id) === '1') {
      return {
        id: 1,
        email: 'admin@ztl.tech',
        role: 'admin',
        is_active: true
      };
    }
    return null;
  },
  signSessionToken: (user, session) => {
    return jwt.sign(
      { role: user.role, sid: session.sid },
      env.jwtSecret,
      {
        algorithm: 'HS256',
        subject: String(user.id),
        issuer: env.jwtIssuer,
        audience: env.jwtAudience,
        expiresIn: env.sessionTtlSeconds
      }
    );
  }
};

let revokedSessions = new Set();
let allSessionsRevoked = false;

const mockSessionService = {
  getSession: async (sid) => {
    if (sid === 'mock-session-id-12345' && !revokedSessions.has(sid) && !allSessionsRevoked) {
      return {
        sid,
        userId: '1',
        role: 'admin',
        csrfToken: 'mock-csrf-token-12345'
      };
    }
    return null;
  },
  touchSession: async (sid) => {},
  revokeSession: async (sid) => {
    revokedSessions.add(sid);
  },
  revokeAllSessions: async (userId) => {
    allSessionsRevoked = true;
  },
  rotateSession: async ({ sid, ip, userAgent }) => {
    return {
      sid: 'mock-session-id-12345',
      userId: '1',
      role: 'admin',
      csrfToken: 'mock-csrf-token-12345'
    };
  }
};

const mockRateLimit = {
  loginRateLimit: () => (req, res, next) => next(),
  ipRateLimit: () => (req, res, next) => next()
};

const mockAuditService = {
  writeAuditEvent: async () => {}
};

// Inject the mocks into require.cache
require.cache[require.resolve('../../src/services/auth.service.js')] = { exports: mockAuthService };
require.cache[require.resolve('../../src/services/session.service.js')] = { exports: mockSessionService };
require.cache[require.resolve('../../src/middleware/rateLimit.js')] = { exports: mockRateLimit };
require.cache[require.resolve('../../src/services/audit.service.js')] = { exports: mockAuditService };

// 3. Load App and setup test server
const { createApp } = require('../../src/app');

function parseCookies(res) {
  const cookies = {};
  const setCookieHeaders = res.headers.getSetCookie ? res.headers.getSetCookie() : [];
  for (const str of setCookieHeaders) {
    const parts = str.split(';')[0].split('=');
    const key = parts[0].trim();
    const val = parts[1] ? parts[1].trim() : '';
    cookies[key] = val;
  }
  return cookies;
}

test('Auth Routes Integration Test Suite', async (t) => {
  const app = createApp();
  let server;
  let baseUrl;

  test.before(() => {
    return new Promise((resolve) => {
      server = app.listen(0, '127.0.0.1', () => {
        const { port } = server.address();
        baseUrl = `http://127.0.0.1:${port}`;
        resolve();
      });
    });
  });

  test.after(() => {
    return new Promise((resolve) => {
      server.close(() => {
        resolve();
      });
    });
  });

  test.beforeEach(() => {
    revokedSessions.clear();
    allSessionsRevoked = false;
  });

  await t.test('POST /api/auth/login - Success', async () => {
    const res = await fetch(`${baseUrl}/api/auth/login`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email: 'admin@ztl.tech', password: 'correct-password' })
    });

    assert.strictEqual(res.status, 200);
    const body = await res.json();
    assert.strictEqual(body.success, true);
    assert.strictEqual(body.data.user.email, 'admin@ztl.tech');

    const cookies = parseCookies(res);
    assert.ok(cookies[env.sessionCookieName]);
    assert.strictEqual(cookies[env.csrfCookieName], 'mock-csrf-token-12345');
  });

  await t.test('POST /api/auth/login - Failure (Invalid Credentials)', async () => {
    const res = await fetch(`${baseUrl}/api/auth/login`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email: 'admin@ztl.tech', password: 'wrong-password' })
    });

    assert.strictEqual(res.status, 401);
    const body = await res.json();
    assert.strictEqual(body.success, false);
    
    const cookies = parseCookies(res);
    assert.ok(!cookies[env.sessionCookieName]);
  });

  await t.test('GET /api/auth/me - Success (Authenticated)', async () => {
    // 1. Login to get token and CSRF
    const loginRes = await fetch(`${baseUrl}/api/auth/login`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email: 'admin@ztl.tech', password: 'correct-password' })
    });
    const cookies = parseCookies(loginRes);

    // 2. Fetch /me using the session cookie
    const res = await fetch(`${baseUrl}/api/auth/me`, {
      headers: {
        'Cookie': `${env.sessionCookieName}=${cookies[env.sessionCookieName]}`
      }
    });

    assert.strictEqual(res.status, 200);
    const body = await res.json();
    assert.strictEqual(body.success, true);
    assert.strictEqual(body.data.user.email, 'admin@ztl.tech');
  });

  await t.test('GET /api/auth/me - Failure (Unauthenticated)', async () => {
    const res = await fetch(`${baseUrl}/api/auth/me`);
    assert.strictEqual(res.status, 401);
  });

  await t.test('POST /api/auth/logout - Success (With Valid CSRF)', async () => {
    // 1. Login
    const loginRes = await fetch(`${baseUrl}/api/auth/login`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email: 'admin@ztl.tech', password: 'correct-password' })
    });
    const cookies = parseCookies(loginRes);
    const sessionCookie = cookies[env.sessionCookieName];
    const csrfToken = cookies[env.csrfCookieName];

    // 2. Logout with Cookie and CSRF Header
    const res = await fetch(`${baseUrl}/api/auth/logout`, {
      method: 'POST',
      headers: {
        'Cookie': `${env.sessionCookieName}=${sessionCookie}; ${env.csrfCookieName}=${csrfToken}`,
        [env.csrfHeaderName]: csrfToken
      }
    });

    assert.strictEqual(res.status, 200);
    const body = await res.json();
    assert.strictEqual(body.success, true);

    // Verify session was revoked in memory
    assert.ok(revokedSessions.has('mock-session-id-12345'));
  });

  await t.test('POST /api/auth/logout - Failure (Invalid CSRF)', async () => {
    // 1. Login
    const loginRes = await fetch(`${baseUrl}/api/auth/login`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email: 'admin@ztl.tech', password: 'correct-password' })
    });
    const cookies = parseCookies(loginRes);
    const sessionCookie = cookies[env.sessionCookieName];
    const csrfToken = cookies[env.csrfCookieName];

    // 2. Logout with Cookie but incorrect CSRF Header
    const res = await fetch(`${baseUrl}/api/auth/logout`, {
      method: 'POST',
      headers: {
        'Cookie': `${env.sessionCookieName}=${sessionCookie}; ${env.csrfCookieName}=${csrfToken}`,
        [env.csrfHeaderName]: 'wrong-csrf-token'
      }
    });

    assert.strictEqual(res.status, 403);
    // Verify session was NOT revoked in memory
    assert.ok(!revokedSessions.has('mock-session-id-12345'));
  });

  await t.test('POST /api/auth/logout-all - Success', async () => {
    // 1. Login
    const loginRes = await fetch(`${baseUrl}/api/auth/login`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email: 'admin@ztl.tech', password: 'correct-password' })
    });
    const cookies = parseCookies(loginRes);
    const sessionCookie = cookies[env.sessionCookieName];
    const csrfToken = cookies[env.csrfCookieName];

    // 2. Logout All
    const res = await fetch(`${baseUrl}/api/auth/logout-all`, {
      method: 'POST',
      headers: {
        'Cookie': `${env.sessionCookieName}=${sessionCookie}; ${env.csrfCookieName}=${csrfToken}`,
        [env.csrfHeaderName]: csrfToken
      }
    });

    assert.strictEqual(res.status, 200);
    assert.ok(allSessionsRevoked);
  });
});
