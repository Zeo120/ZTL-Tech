# Paradigm Architecture & Data Flow

## 1. Request Routing & PWA Infrastructure
- **Static Assets & PWA:** The frontend surface area (`/paradigm`) is fully isolated. It has been upgraded to a **Progressive Web App (PWA)**, utilizing a `manifest.json` and a Service Worker (`sw.js`) for offline caching, asset interception, and standalone desktop installability.
- **API Routing:** Client-side JavaScript (`paradigm/js/*.js`) sends asynchronous HTTP requests to core backend API endpoints (`/api/auth`, `/api/admin`, `/api/employee`).

## 2. Database Architecture & PII Vault
- **Connection Pool:** When an API route is invoked, it acquires its connection via `suitePool = await getParadigmDbPool()` located in `backend/src/config/db.js`, completely decoupling it from the ZTL Core databases.
- **PII Cryptographic Encryption:** Highly sensitive Employee Personal Identifiable Information (PII) such as PAN, Aadhar, and Bank Details are intercepted by the `cryptoVault.js` module. They are symmetrically encrypted at the application layer using **AES-256-GCM** before touching the SQL Database, ensuring that data at rest remains fully blinded to database administrators.

## 3. Advanced Security & Auth Context
- **Session-to-Device Binding:** Authentication sessions employ real-time cryptographic binding. User-Agent and IP metadata are hashed via SHA-256 and bound to the Redis session. If the session is hijacked by a different device, the hash mismatch immediately destroys the session, preventing replay attacks.
- **Geofenced Attendance:** The Employee Portal leverages `navigator.geolocation`. Clock-in coordinates are verified via the backend using the Haversine formula to ensure the user is physically within the strict ZTL HQ geofence before authorizing the punch-in.

## 4. Client-Side Compute Model & Aesthetics
- **Particle UI & Glassmorphism:** The application strictly adheres to a premium dark-mode aesthetic. A persistent, highly optimized HTML5 Canvas renders an interactive background particle network on an underlay z-index, while foreground modules utilize `backdrop-filter: blur()` for performance-friendly glassmorphism.
- **Hardware Acceleration:** Animations utilize `will-change: transform, opacity;` to cache state in GPU memory.
- **Batch Processing:** IntersectionObservers chunk DOM registrations, explicitly capping Client-Side Memory (CSM) to keep the app ultra-responsive.

## 5. Sub-Modules (HR & Payroll)
- **Dynamic View Engine:** The `admin.js` handles client-side routing within the unified dashboard layout (`switchView`).
- **HR & Payroll Automation:** Integrated capabilities span from comprehensive Roster management and Leave/Approval queues to dynamic, automated Salary computations mapped to real-world standard deductions (PF, ESI, TDS, LWP), which output into immutable `PayrollRuns` and `PayrollTransactions` ledger tables.

## 6. End-to-End Execution Path
1. **Trigger:** User interacts with UI (e.g., submitting an attendance form with Geolocation).
2. **Client Compute:** Local JavaScript intercepts, manipulates the DOM, and dispatches a JSON `fetch` request.
3. **Backend Middleware:** Express intercepts the request, runs CSRF validation, validates the JWT, and verifies the Device Hash fingerprint.
4. **SQL Execution:** Route logic utilizes parameterized T-SQL queries (or triggers the `cryptoVault` for decryption) and returns the payload to dynamically update the View.
