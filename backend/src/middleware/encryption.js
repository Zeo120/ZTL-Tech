const { getRedisClient } = require('../config/redis');
const { decryptPayload, encryptPayload } = require('../utils/crypto');
const { httpError } = require('../utils/httpError');
const crypto = require('crypto');

async function decryptInterceptor(req, res, next) {
  // Check if payload is encrypted
  if (!req.body || !req.body.encryptedData) {
    return next();
  }

  const handshakeId = req.headers['x-handshake-id'];
  const sessionId = req.headers['x-session-id'] || req.cookies['session_id']; // Depending on auth setup

  if (!handshakeId && !sessionId) {
    return next(httpError(400, 'Encrypted payload requires handshake or session context.'));
  }

  try {
    const redis = await getRedisClient();
    let aesKeyBase64;

    if (handshakeId) {
      aesKeyBase64 = await redis.get(`handshake:${handshakeId}`);
    } else if (sessionId) {
      const sessionData = await redis.get(`session:${sessionId}`);
      if (sessionData) {
        const parsed = JSON.parse(sessionData);
        aesKeyBase64 = parsed.aesKey;
      }
    }

    if (!aesKeyBase64) {
      return next(httpError(401, 'Encryption context expired or invalid. Please renegotiate handshake.'));
    }

    const aesKey = Buffer.from(aesKeyBase64, 'base64');
    
    // Anti-Replay HMAC Verification
    const timestamp = req.headers['x-request-timestamp'];
    const clientSignature = req.headers['x-request-signature'];
    
    if (timestamp && clientSignature && req.method !== 'GET') {
      const now = Date.now();
      const reqTime = parseInt(timestamp, 10);
      
      // Strict 5-minute replay window
      if (Math.abs(now - reqTime) > 300000) {
        return next(httpError(403, 'Request timestamp expired. Possible replay attack.'));
      }
      
      // Reconstruct exactly what the frontend signed
      const rawBody = JSON.stringify({
        encryptedData: req.body.encryptedData,
        iv: req.body.iv,
        authTag: req.body.authTag
      });
      
      const signatureBase = `${req.method}:${req.originalUrl}:${timestamp}:${rawBody}`;
      
      const serverSignatureBuffer = crypto.createHmac('sha256', aesKey)
        .update(signatureBase)
        .digest();
        
      const serverSignature = serverSignatureBuffer.toString('base64');
      
      if (serverSignature !== clientSignature) {
        console.warn(`[ANTI-REPLAY] Signature mismatch detected from ${req.ip}`);
        return next(httpError(403, 'Cryptographic signature verification failed.'));
      }
    }

    // Attach the AES key to the request context so downstream responses can encrypt back
    req.aesKey = aesKey;

    // Decrypt the actual payload and override req.body
    const { encryptedData, iv, authTag } = req.body;
    const decryptedBody = decryptPayload(encryptedData, iv, authTag, aesKey);
    
    req.body = decryptedBody;
    next();
  } catch (err) {
    console.error('Decryption error:', err);
    return next(httpError(400, 'Payload decryption failed.'));
  }
}

function encryptResponse(req, res, next) {
  // Store the original res.json
  const originalJson = res.json;

  res.json = function (body) {
    // If the request was encrypted, encrypt the response
    if (req.aesKey && body && typeof body === 'object') {
      try {
        const encryptedPayload = encryptPayload(body, req.aesKey);
        return originalJson.call(this, encryptedPayload);
      } catch (err) {
        console.error('Encryption error:', err);
        return res.status(500).send('Encryption failed');
      }
    }
    // Otherwise return plaintext
    return originalJson.call(this, body);
  };
  
  next();
}

module.exports = { decryptInterceptor, encryptResponse };
