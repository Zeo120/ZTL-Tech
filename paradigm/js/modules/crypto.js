import { apiBase } from './core.js';

let aesKey = null;
let hmacKey = null;
let currentHandshakeId = null;

// Utility to convert ArrayBuffer to Base64
function bufferToBase64(buffer) {
  let binary = '';
  const bytes = new Uint8Array(buffer);
  for (let i = 0; i < bytes.byteLength; i++) {
    binary += String.fromCharCode(bytes[i]);
  }
  return btoa(binary);
}

// Utility to convert Base64 to ArrayBuffer
function base64ToBuffer(base64) {
  const binary_string = atob(base64);
  const len = binary_string.length;
  const bytes = new Uint8Array(len);
  for (let i = 0; i < len; i++) {
    bytes[i] = binary_string.charCodeAt(i);
  }
  return bytes.buffer;
}

export async function initializeE2E() {
  try {
    // 1. Generate P-256 ECDH KeyPair natively in the browser
    const keyPair = await window.crypto.subtle.generateKey(
      { name: "ECDH", namedCurve: "P-256" },
      true,
      ["deriveBits"]
    );

    // 2. Export client public key to raw format and convert to base64
    const rawPublicKey = await window.crypto.subtle.exportKey("raw", keyPair.publicKey);
    const clientPublicKeyBase64 = bufferToBase64(rawPublicKey);

    // 3. Send to handshake endpoint to initiate Diffie-Hellman Key Exchange
    const res = await fetch(`${apiBase}/api/auth/handshake`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ clientPublicKey: clientPublicKeyBase64 })
    });
    const data = await res.json();
    
    if (!data.success) throw new Error("Handshake failed");

    currentHandshakeId = data.data.handshakeId;
    const serverPublicKeyBuffer = base64ToBuffer(data.data.serverPublicKey);

    // 4. Import server's public key
    const serverPublicKey = await window.crypto.subtle.importKey(
      "raw",
      serverPublicKeyBuffer,
      { name: "ECDH", namedCurve: "P-256" },
      true,
      []
    );

    // 5. Derive the Shared Secret locally
    const sharedSecret = await window.crypto.subtle.deriveBits(
      { name: "ECDH", public: serverPublicKey },
      keyPair.privateKey,
      256
    );

    // 6. Hash with SHA-256 to derive final AES-GCM Key (guarantees parity with Node.js crypto module)
    const keyMaterial = await window.crypto.subtle.digest("SHA-256", sharedSecret);
    
    // 7. Lock the AES key into memory for the duration of the session
    aesKey = await window.crypto.subtle.importKey(
      "raw",
      keyMaterial,
      { name: "AES-GCM" },
      false,
      ["encrypt", "decrypt"]
    );
    
    // 8. Import the same key material for HMAC-SHA256 to sign requests (Anti-Replay)
    hmacKey = await window.crypto.subtle.importKey(
      "raw",
      keyMaterial,
      { name: "HMAC", hash: "SHA-256" },
      false,
      ["sign"]
    );
    
    console.log("[E2E] Cryptographic Handshake Complete. AES-256-GCM Channel Secured with HMAC Anti-Replay.");
  } catch (error) {
    console.error("[E2E] Handshake error:", error);
  }
}

/**
 * A secure fetch wrapper that intercepts outgoing API requests, automatically encrypts JSON payloads
 * using the AES-256-GCM session key, and natively decrypts encrypted JSON responses.
 */
export async function secureFetch(url, options = {}) {
  if (!aesKey) {
    console.warn("[E2E] AES key missing. Falling back to plaintext fetch.");
    return fetch(url, options);
  }

  const headers = new Headers(options.headers || {});
  if (currentHandshakeId) {
    headers.set('X-Handshake-Id', currentHandshakeId);
  }

  let bodyData = options.body;

  // Intercept and Encrypt the Payload
  if (bodyData && typeof bodyData === "string") {
    const iv = window.crypto.getRandomValues(new Uint8Array(12));
    const encodedBody = new TextEncoder().encode(bodyData);
    
    const encryptedBuffer = await window.crypto.subtle.encrypt(
      { name: "AES-GCM", iv: iv },
      aesKey,
      encodedBody
    );

    // WebCrypto appends the AuthTag to the end of the ciphertext buffer automatically.
    // Node.js extracts it explicitly. We must separate them to match Node's AES-GCM expectation.
    const encryptedBytes = new Uint8Array(encryptedBuffer);
    const authTag = encryptedBytes.slice(-16);
    const cipherText = encryptedBytes.slice(0, -16);

    bodyData = JSON.stringify({
      encryptedData: bufferToBase64(cipherText),
      iv: bufferToBase64(iv),
      authTag: bufferToBase64(authTag)
    });
    
    headers.set("Content-Type", "application/json");
  }

  // Anti-Replay: Sign the request cryptographically
  const timestamp = Date.now().toString();
  headers.set('X-Request-Timestamp', timestamp);

  const method = (options.method || 'GET').toUpperCase();
  // Build the signature base string: METHOD:URL:TIMESTAMP[:BODY]
  let signatureBase = `${method}:${url}:${timestamp}`;
  if (bodyData && method !== 'GET') {
    signatureBase += `:${bodyData}`;
  }

  const encoder = new TextEncoder();
  const signatureBuffer = await window.crypto.subtle.sign(
    "HMAC",
    hmacKey,
    encoder.encode(signatureBase)
  );
  
  headers.set('X-Request-Signature', bufferToBase64(signatureBuffer));

  const response = await fetch(url, { ...options, headers, body: bodyData });
  
  // Clone response to safely intercept the .json() parser
  const resClone = response.clone();
  
  resClone.json = async () => {
    const data = await response.json();
    
    // If the response is cryptographically wrapped, decrypt it
    if (data && data.encryptedData && data.iv && data.authTag) {
      const ivBuffer = base64ToBuffer(data.iv);
      const authTagBuffer = base64ToBuffer(data.authTag);
      const cipherTextBuffer = base64ToBuffer(data.encryptedData);
      
      // Node.js sends the tag separately; WebCrypto needs it appended to the ciphertext
      const combined = new Uint8Array(cipherTextBuffer.byteLength + authTagBuffer.byteLength);
      combined.set(new Uint8Array(cipherTextBuffer), 0);
      combined.set(new Uint8Array(authTagBuffer), cipherTextBuffer.byteLength);

      const decryptedBuffer = await window.crypto.subtle.decrypt(
        { name: "AES-GCM", iv: ivBuffer },
        aesKey,
        combined
      );
      
      const decryptedString = new TextDecoder().decode(decryptedBuffer);
      return JSON.parse(decryptedString);
    }
    return data;
  };

  return resClone;
}
