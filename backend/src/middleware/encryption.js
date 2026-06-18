const { getRedisClient } = require('../config/redis');
const { decryptPayload, encryptPayload } = require('../utils/crypto');
const { httpError } = require('../utils/httpError');

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
