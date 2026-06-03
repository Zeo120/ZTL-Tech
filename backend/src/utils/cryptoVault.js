const crypto = require('crypto');
const { env } = require('../config/env');

const ALGORITHM = 'aes-256-gcm';

function getEncryptionKey() {
  return crypto.createHash('sha256').update(env.jwtSecret).digest();
}

function encryptPII(text) {
  if (text == null) return text;
  
  const textStr = String(text);
  const iv = crypto.randomBytes(12);
  const cipher = crypto.createCipheriv(ALGORITHM, getEncryptionKey(), iv);
  
  let encrypted = cipher.update(textStr, 'utf8', 'hex');
  encrypted += cipher.final('hex');
  
  const authTag = cipher.getAuthTag().toString('hex');
  const ivHex = iv.toString('hex');
  
  return `${ivHex}:${authTag}:${encrypted}`;
}

function decryptPII(cipherText) {
  if (cipherText == null) return cipherText;

  const cipherTextStr = String(cipherText);
  const parts = cipherTextStr.split(':');
  
  // If not exactly 3 parts, fail gracefully and return plaintext
  if (parts.length !== 3) {
    return cipherTextStr;
  }
  
  try {
    const [ivHex, authTagHex, encrypted] = parts;
    const iv = Buffer.from(ivHex, 'hex');
    const authTag = Buffer.from(authTagHex, 'hex');
    
    // Quick validation on lengths to avoid crashing on invalid hex
    if (iv.length !== 12 || authTag.length !== 16) {
      return cipherTextStr;
    }

    const decipher = crypto.createDecipheriv(ALGORITHM, getEncryptionKey(), iv);
    decipher.setAuthTag(authTag);
    
    let decrypted = decipher.update(encrypted, 'hex', 'utf8');
    decrypted += decipher.final('utf8');
    
    return decrypted;
  } catch (err) {
    // If decryption fails (e.g., auth tag mismatch or not encrypted), return gracefully
    return cipherTextStr;
  }
}

module.exports = {
  encryptPII,
  decryptPII
};
