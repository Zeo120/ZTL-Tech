const test = require('node:test');
const assert = require('node:assert');

// Mock DB and Redis to prevent starting background timers/connection pools
require.cache[require.resolve('../../src/config/db.js')] = {
  exports: {
    sql: {},
    getDbPool: async () => {},
    closeDbPool: async () => {}
  }
};
require.cache[require.resolve('../../src/config/redis.js')] = {
  exports: {
    getRedisClient: async () => {},
    closeRedisClient: async () => {},
    withRedis: async (op) => {}
  }
};

const { STATES, SIGNALS, auditLoginSession } = require('../../src/services/tbais.service.js');

// Mock audit.service so we don't hit the DB during testing
const auditService = require('../../src/services/audit.service.js');
let originalWriteAuditEvent;

test.before(() => {
  originalWriteAuditEvent = auditService.writeAuditEvent;
  auditService.writeAuditEvent = async () => {}; // mock no-op
});

test.after(() => {
  auditService.writeAuditEvent = originalWriteAuditEvent; // restore
});

test('TBAIS - Valid Login Path', async (t) => {
  const reqContext = { ip: '192.168.1.1', userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)' };
  
  const result = await auditLoginSession(reqContext, true);
  
  assert.strictEqual(result.state, STATES.Q_TRUSTED, 'Should reach Q_TRUSTED accept state');
  assert.strictEqual(result.trustScore, 100, 'Should have max trust score T_c = 100');
  assert.strictEqual(result.isAnomalous, false, 'Should not be marked anomalous');
});

test('TBAIS - Turing Halting Condition (Missing IP)', async (t) => {
  // Simulate missing IP (undecidable origin)
  const reqContext = { ip: '', userAgent: 'Mozilla/5.0' };
  
  const result = await auditLoginSession(reqContext, true);
  
  assert.strictEqual(result.state, STATES.Q_ANOMALOUS, 'Should HALT at Q_ANOMALOUS');
  assert.strictEqual(result.trustScore, 60, 'Trust score should be reduced (missing IP)');
  assert.strictEqual(result.isAnomalous, true, 'Should be flagged as anomalous');
});

test('TBAIS - Fingerprint Mismatch (Suspicious Agent)', async (t) => {
  // Simulate curl attacker
  const reqContext = { ip: '192.168.1.1', userAgent: 'curl/7.81.0' };
  
  const result = await auditLoginSession(reqContext, true);
  
  assert.strictEqual(result.state, STATES.Q_ANOMALOUS, 'Should HALT at Q_ANOMALOUS');
  assert.strictEqual(result.trustScore, 70, 'Trust score should be reduced (missing FP)');
  assert.strictEqual(result.isAnomalous, true, 'Should be flagged as anomalous');
});

test('TBAIS - Invalid Credentials', async (t) => {
  const reqContext = { ip: '192.168.1.1', userAgent: 'Mozilla/5.0' };
  
  // false flag for credentials Valid
  const result = await auditLoginSession(reqContext, false);
  
  assert.strictEqual(result.state, STATES.Q_ANOMALOUS, 'Should HALT at Q_ANOMALOUS');
  assert.strictEqual(result.isAnomalous, true, 'Should be flagged as anomalous');
});

test('TBAIS - Worst Case (Missing IP and Curl)', async (t) => {
  const reqContext = { ip: 'unknown', userAgent: 'wget/1.21' };
  
  const result = await auditLoginSession(reqContext, true);
  
  assert.strictEqual(result.state, STATES.Q_ANOMALOUS, 'Should HALT at Q_ANOMALOUS');
  assert.strictEqual(result.trustScore, 30, 'Trust score should be minimal');
  assert.strictEqual(result.isAnomalous, true, 'Should be flagged as anomalous');
});
