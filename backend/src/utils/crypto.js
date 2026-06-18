const crypto = require('crypto');

// ECDH settings
const CURVE_NAME = 'prime256v1'; // P-256 curve equivalent in Node.js

/**
 * Generates a new Server ECDH keypair
 * @returns {crypto.ECDH}
 */
function generateServerECDH() {
  const ecdh = crypto.createECDH(CURVE_NAME);
  ecdh.generateKeys();
  return ecdh;
}

/**
 * Computes a shared secret and hashes it to ensure perfect key parity with the browser's WebCrypto API
 * @param {crypto.ECDH} serverEcdh 
 * @param {string} clientPublicKeyBase64 
 * @returns {Buffer} 32-byte AES-256 key
 */
function deriveAESKey(serverEcdh, clientPublicKeyBase64) {
  // Client public key is sent as base64 raw uncompressed bytes from WebCrypto
  const clientKeyBuffer = Buffer.from(clientPublicKeyBase64, 'base64');
  const sharedSecret = serverEcdh.computeSecret(clientKeyBuffer);
  
  // We hash the raw shared secret with SHA-256 to normalize it into a secure 32-byte AES-256 key
  return crypto.createHash('sha256').update(sharedSecret).digest();
}

/**
 * Encrypts a JSON payload using AES-256-GCM
 * @param {Object} payload - The data to encrypt
 * @param {Buffer} aesKey - 32-byte AES key derived from ECDH
 * @returns {Object} { encryptedData, iv, authTag } all mapped to base64
 */
function encryptPayload(payload, aesKey) {
  if (!aesKey || aesKey.length !== 32) throw new Error('Invalid AES Key length');
  
  const iv = crypto.randomBytes(12); // GCM standard IV size
  const cipher = crypto.createCipheriv('aes-256-gcm', aesKey, iv);
  
  const jsonStr = JSON.stringify(payload);
  let encrypted = cipher.update(jsonStr, 'utf8', 'base64');
  encrypted += cipher.final('base64');
  
  const authTag = cipher.getAuthTag().toString('base64');
  
  return {
    encryptedData: encrypted,
    iv: iv.toString('base64'),
    authTag
  };
}

/**
 * Decrypts an AES-256-GCM payload
 * @param {string} encryptedDataBase64 
 * @param {string} ivBase64 
 * @param {string} authTagBase64 
 * @param {Buffer} aesKey 
 * @returns {Object} The parsed JSON payload
 */
function decryptPayload(encryptedDataBase64, ivBase64, authTagBase64, aesKey) {
  if (!aesKey || aesKey.length !== 32) throw new Error('Invalid AES Key length');
  
  const iv = Buffer.from(ivBase64, 'base64');
  const authTag = Buffer.from(authTagBase64, 'base64');
  
  const decipher = crypto.createDecipheriv('aes-256-gcm', aesKey, iv);
  decipher.setAuthTag(authTag);
  
  let decrypted = decipher.update(encryptedDataBase64, 'base64', 'utf8');
  decrypted += decipher.final('utf8');
  
  return JSON.parse(decrypted);
}

module.exports = {
  generateServerECDH,
  deriveAESKey,
  encryptPayload,
  decryptPayload
};
