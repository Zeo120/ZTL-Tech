# GRID Architecture & Data Flow

## 1. Request Routing
- **Static Assets:** The Express server explicitly whitelists the `/grid` directory using `mountStaticRoute('/grid', 'grid')` in `app.js`. When a user accesses `http://localhost:3000/grid/index.html`, this route intercepts and serves the static frontend payload.
- **API Routing:** Client-side JavaScript (`grid/js/*.js`) sends asynchronous `fetch` requests specifically targeted at the isolated Grid namespaces (`/api/grid/auth`, `/api/grid/admin`, `/api/grid/employee`).

## 2. Database Decoupling
- **Connection Pool:** The grid routing logic is completely severed from the Core and Paradigm suites. The backend controllers in `backend/src/grid/routes/` are explicitly hardcoded to request `getGridDbPool()` from `backend/src/config/db.js`.
- **Complete Isolation:** Grid routes completely bypass `getDbPool()` and `getParadigmDbPool()`. If a request hits `/api/grid/admin`, the executed T-SQL strictly interacts with the Grid database cluster.

## 3. End-to-End Execution Path
1. **Trigger:** User interaction fires within the Grid UI.
2. **Client Compute:** JavaScript bundles the request payload and targets `/api/grid/...`.
3. **App Router:** `app.js` captures the `/api/grid/` prefix and maps it directly into `backend/src/grid/routes/`.
4. **SQL Execution:** The isolated grid route acquires `getGridDbPool()`, establishes an atomic transaction context, executes the parameterized SQL statement, and returns the response block to the frontend.
