# Paradigm Architecture & Data Flow

## 1. Request Routing
- **Static Assets:** The Node.js Express server explicitly whitelists the `/paradigm` directory using `mountStaticRoute('/paradigm', 'paradigm')`. This isolates the frontend surface area.
- **API Routing:** Client-side JavaScript (`paradigm/js/*.js`) sends asynchronous HTTP requests to the core backend API endpoints (`/api/auth`, `/api/admin`, `/api/employee`).

## 2. Database Architecture
- **Connection Pool:** When a Paradigm API route is invoked, it acquires its connection via `suitePool = await getParadigmDbPool()` located in `backend/src/config/db.js`.
- **Separation of Concerns:** This completely decouples Paradigm operations from the ZTL Core and Grid databases. Transactions executed here only mutate the designated Paradigm Database.

## 3. Client-Side Compute Model
- **Hardware Acceleration:** Animations utilize `will-change: transform, opacity;` to cache state in GPU memory.
- **Batch Processing:** IntersectionObservers chunk DOM registrations via `requestIdleCallback`, while `content-visibility: auto` aggressively halts off-screen layout paints. This architecture explicitly caps Client-Side Memory (CSM) at `< 80MB`.

## 4. End-to-End Execution Path
1. **Trigger:** User interacts with UI (e.g., submitting a form in `index.html`).
2. **Client Compute:** `js/index.js` intercepts, modifies the DOM, and dispatches a `fetch` request.
3. **Backend Middleware:** Express intercepts the request, runs CSRF validation and JWT authentication.
4. **SQL Execution:** Route logic requests `getParadigmDbPool()`, executes a parameterized T-SQL query, and returns the payload.
