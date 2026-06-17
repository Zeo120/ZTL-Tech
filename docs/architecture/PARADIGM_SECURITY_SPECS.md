# Paradigm SaaS - Security Architecture Specification

This document outlines the core cybersecurity defenses and proactive mitigation strategies integrated into the Paradigm backend ecosystem.

## 1. Existing Security Posture

Paradigm is currently fortified with the following enterprise-grade mechanisms:
* **Password Hashing:** Argon2id with dynamically scaled memory/time cost parameters.
* **Session Management:** Secure, HttpOnly JWT cookies combined with server-side Redis invalidation matrices.
* **Brute-Force Protection:** Stateful Redis tracking with progressive IP-level and account-level lockouts (423 Locked).
* **Session-to-Device Cryptographic Binding:** Ensures that a hijacked session token is mathematically useless if the attacker's IP/User-Agent fingerprint `SHA256(IP + UserAgent)` does not match the original session instantiation hash.
* **PII Encryption Vault:** AES-256-GCM encryption at rest for highly sensitive data (PAN, Aadhar, Bank Accounts).

---

## 2. Active Threat Mitigation Pipeline (Planned Enhancements)

To elevate Paradigm's resilience to military-grade defense, the following zero-dependency custom modules will be incrementally injected:

### A. The Honeypot Blackhole Router
**Objective:** Automatically identify and neutralize reconnaissance bots and vulnerability scanners.
* **Mechanism:** We establish decoy endpoints (`/.env`, `/.git`, `/wp-admin`, `/config.json`).
* **Enforcement:** If a request touches these routes, the middleware immediately intercepts the traffic. It logs the IP, inserts it into a Redis `Blackhole` Set, and drops all future TCP connections from that IP globally with zero CPU overhead.

### B. Cryptographic Request Signatures (Anti-Replay)
**Objective:** Prevent Man-in-the-Middle (MITM) replay attacks and payload tampering.
* **Mechanism:** The frontend must append an `X-Request-Signature` and `X-Request-Timestamp` to every mutating request (POST, PUT, DELETE).
* **Enforcement:** 
  1. The frontend calculates: `HMAC-SHA256(Secret, Timestamp + Method + Path + Stringified_Body)`.
  2. The backend recomputes the HMAC. If it fails to match or the timestamp is > 5 seconds old, the request is instantly dropped (401 Unauthorized).

### C. Payload E2E AES-GCM Encryption
**Objective:** Ensure that data in transit remains entirely unreadable to intermediate proxies or compromised transport layers.
* **Mechanism:** The HTTP body payload is encrypted symmetrically at the application layer on the frontend before transmission.
* **Enforcement:** The Node.js backend intercepts the ciphertext, decrypts it dynamically into `req.body`, and processes it normally.

### D. Strict Content-Security-Policy (CSP) via Nonces
**Objective:** Eradicate all forms of Cross-Site Scripting (XSS).
* **Mechanism:** Upgrade the existing `securityHeaders.js`.
* **Enforcement:** Dynamically generate a strong cryptographic nonce per request, inject it into the CSP header, and require that all inline scripts or styles on the frontend carry the matching `nonce="..."` attribute.

---

*This specification remains a living document and will be continuously updated as new threat vectors are modeled and mitigated.*
