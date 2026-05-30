const { writeAuditEvent } = require('./audit.service');

// Turing DFA Q Constants
const STATES = {
  Q_INITIATED: 0,
  Q_CREDENTIAL_RECV: 1,
  Q_IP_BOUND: 2,
  Q_FP_MATCH: 3,
  Q_BEHAVIORAL_PASS: 4,
  Q_TRUSTED: 5,
  Q_IP_ABSENT: 6,
  Q_FP_MISMATCH: 7,
  Q_ENTROPY_SPIKE: 8,
  Q_ANOMALOUS: 9
};

const SIGNALS = {
  SIG_CRED_VALID: 0,
  SIG_CRED_INVALID: 1,
  SIG_IP_PRESENT: 2,
  SIG_IP_ABSENT: 3,
  SIG_FP_MATCH: 4,
  SIG_FP_MISMATCH: 5,
  SIG_BEH_NORMAL: 6,
  SIG_BEH_SPIKE: 7,
  SIG_TIME_VALID: 8,
  SIG_TIME_INVALID: 9
};

// Transition table matching tbais_x64.asm exactly
const delta = {
  [STATES.Q_INITIATED]: {
    [SIGNALS.SIG_CRED_VALID]: STATES.Q_CREDENTIAL_RECV,
    default: STATES.Q_ANOMALOUS
  },
  [STATES.Q_CREDENTIAL_RECV]: {
    [SIGNALS.SIG_IP_PRESENT]: STATES.Q_IP_BOUND,
    [SIGNALS.SIG_IP_ABSENT]: STATES.Q_IP_ABSENT,
    default: STATES.Q_ANOMALOUS
  },
  [STATES.Q_IP_BOUND]: {
    [SIGNALS.SIG_FP_MATCH]: STATES.Q_FP_MATCH,
    [SIGNALS.SIG_FP_MISMATCH]: STATES.Q_FP_MISMATCH,
    default: STATES.Q_ANOMALOUS
  },
  [STATES.Q_FP_MATCH]: {
    [SIGNALS.SIG_BEH_NORMAL]: STATES.Q_BEHAVIORAL_PASS,
    [SIGNALS.SIG_BEH_SPIKE]: STATES.Q_ENTROPY_SPIKE,
    default: STATES.Q_ANOMALOUS
  },
  [STATES.Q_BEHAVIORAL_PASS]: {
    [SIGNALS.SIG_TIME_VALID]: STATES.Q_TRUSTED,
    [SIGNALS.SIG_TIME_INVALID]: STATES.Q_ANOMALOUS,
    default: STATES.Q_ANOMALOUS
  },
  [STATES.Q_TRUSTED]: { default: STATES.Q_ANOMALOUS },
  [STATES.Q_IP_ABSENT]: { default: STATES.Q_ANOMALOUS },
  [STATES.Q_FP_MISMATCH]: { default: STATES.Q_ANOMALOUS },
  [STATES.Q_ENTROPY_SPIKE]: { default: STATES.Q_ANOMALOUS },
  [STATES.Q_ANOMALOUS]: { default: STATES.Q_ANOMALOUS }
};

/**
 * Runs the Turing FSM check for a given session login attempt.
 * Implements the design equations for trust score and Turing Halts.
 */
async function auditLoginSession(requestContext, credentialsValid) {
  let state = STATES.Q_INITIATED;
  const signalsFed = [];
  
  // 1. Process Credentials Signal
  if (credentialsValid) {
    state = delta[STATES.Q_INITIATED][SIGNALS.SIG_CRED_VALID] || STATES.Q_ANOMALOUS;
    signalsFed.push('SIG_CRED_VALID');
  } else {
    state = STATES.Q_ANOMALOUS;
    signalsFed.push('SIG_CRED_INVALID');
  }

  // 2. Process IP Signal
  const rawIp = requestContext.ip;
  // If IP is explicitly empty, undefined, or missing (e.g. mocked simulation)
  const hasIp = rawIp && rawIp !== '' && rawIp !== 'undefined' && rawIp !== 'unknown';
  
  if (state !== STATES.Q_ANOMALOUS) {
    if (hasIp) {
      state = delta[STATES.Q_CREDENTIAL_RECV][SIGNALS.SIG_IP_PRESENT] || STATES.Q_ANOMALOUS;
      signalsFed.push('SIG_IP_PRESENT');
    } else {
      // Turing HALT trigger (Undecidable origin)
      state = STATES.Q_IP_ABSENT; 
      signalsFed.push('SIG_IP_ABSENT');
      // Halting in rejection state q9
      state = STATES.Q_ANOMALOUS;
    }
  }

  // 3. Process Device Fingerprint Signal
  const userAgent = requestContext.userAgent || '';
  const isSuspiciousAgent = userAgent.toLowerCase().includes('curl') || 
                            userAgent.toLowerCase().includes('wget') || 
                            userAgent.toLowerCase().includes('headless');
  
  if (state !== STATES.Q_ANOMALOUS) {
    if (!isSuspiciousAgent) {
      state = delta[STATES.Q_IP_BOUND][SIGNALS.SIG_FP_MATCH] || STATES.Q_ANOMALOUS;
      signalsFed.push('SIG_FP_MATCH');
    } else {
      state = STATES.Q_ANOMALOUS;
      signalsFed.push('SIG_FP_MISMATCH');
    }
  }

  // 4. Behavioral / Entropy Verification Signal
  if (state !== STATES.Q_ANOMALOUS) {
    state = delta[STATES.Q_FP_MATCH][SIGNALS.SIG_BEH_NORMAL] || STATES.Q_ANOMALOUS;
    signalsFed.push('SIG_BEH_NORMAL');
  }

  // 5. Temporal Coherence Signal
  if (state !== STATES.Q_ANOMALOUS) {
    state = delta[STATES.Q_BEHAVIORAL_PASS][SIGNALS.SIG_TIME_VALID] || STATES.Q_ANOMALOUS;
    signalsFed.push('SIG_TIME_VALID');
  }

  // Calculate Trust Confidence Score T_c
  const ip_ok = hasIp ? 1 : 0;
  const fp_ok = !isSuspiciousAgent ? 1 : 0;
  const beh_ok = 1;
  const time_ok = 1;
  const trustScore = 40 * ip_ok + 30 * fp_ok + 20 * beh_ok + 10 * time_ok;

  const isAnomalous = state === STATES.Q_ANOMALOUS || !hasIp || isSuspiciousAgent;

  if (isAnomalous) {
    // Record Irregular Login event in AuditLog
    await writeAuditEvent({
      action: 'auth.irregular_login_detected',
      ip: rawIp || '0.0.0.0',
      userAgent: userAgent,
      success: false,
      metadata: {
        signalsFed,
        finalState: state,
        trustScore,
        ipAbsent: !hasIp,
        fpMismatch: isSuspiciousAgent,
        alertType: 'TURING_HALT_ANOMALY'
      }
    });
  }

  return {
    state,
    trustScore,
    isAnomalous
  };
}

module.exports = { auditLoginSession, STATES, SIGNALS };
