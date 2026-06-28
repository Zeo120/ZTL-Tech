# ZTL-Tech Enterprise Monorepo

Welcome to the **ZTL-Tech Enterprise Monorepo**. This repository houses our suite of next-generation business, security, and infrastructure applications, all powered by a unified, high-performance Node.js backend. 

This document serves as the central hub for understanding the architecture, navigating the codebase, and setting up the development environment.

---

## 1. System Architecture

ZTL-Tech utilizes a monolithic backend architecture serving multiple isolated frontend applications.

*   **The Backend Core:** A robust Express.js server providing unified APIs for authentication, employee management, payroll processing, and security auditing. It connects to **Microsoft SQL Server** for persistent enterprise data and **Redis** for high-speed session management.
*   **The Frontends:** We embrace a Zero-Dependency, Vanilla web philosophy. Our frontends are built with raw HTML, CSS, and JS—bypassing frameworks like React or Next.js to ensure maximum execution speed and absolute control over the DOM.

---

## 2. Product Suite Overview (The Frontends)

The `/` root directory contains the independent UI folders for each of our flagship products. Each product follows a standardized entry pattern (`index.html`, `login.html`, `admin.html`).

*   **`ztl_tech/`**: The primary corporate landing page and the Super Admin "God Mode" console.
*   **`paradigm/`**: Our Enterprise Business Software. Features strict Multi-Tenant isolation and a Cryptographic Payroll engine.
*   **`grid/`**: Network architecture mapping and real-time traffic simulation interface.
*   **`scalpel/`**: Automated, high-speed workflow and approval routing UI.
*   **`phasr/`**: Predictive Heuristic Attack Surface Reconnaissance—our flagship deterministic security auditing tool.

---

## 3. Backend Structure (`/backend`)

The brain of the ZTL-Tech ecosystem.

*   **`server.js`**: The primary application bootstrapper. Initializes database connections and starts the listener.
*   **`src/app.js`**: The central Express router and middleware pipeline registry.
*   **`src/routes/`**: API endpoint definitions categorized by domain (e.g., Auth, Admin, Employee, Super Admin).
*   **`src/services/`**: The core business logic layer (payroll calculations, security scans, data mutations).
*   **`src/middleware/`**: Critical security interceptors (CSRF validation, Session checks, Rate limiting) that execute before any route logic.
*   **`src/config/`**: Connection managers for MSSQL (`db.js`, `initDb.js`), Redis (`redis.js`), and environment variables (`env.js`).

---

## 4. Security & Data Integrity

Security is not an afterthought; it is woven into the fabric of the architecture.

*   **Redis Secure Sessions**: We reject stateless JWTs in LocalStorage. Authentication relies on cryptographically secure, stateful session IDs stored in Redis and transmitted exclusively via `HttpOnly` cookies.
*   **Strict Anti-CSRF**: Every state-mutating request (`POST`, `PUT`, `DELETE`) requires a CSRF token. The backend issues a `ztl_csrf` cookie upon login, which the frontend must manually attach as the `x-csrf-token` header on subsequent requests.
*   **Cryptographic Payroll (Paradigm)**: Completed payroll runs are immutably sealed using SHA-256 Merkle Roots, ensuring zero post-processing tampering.
*   **Headless PDF Generation**: Payslips are generated purely programmatically via `pdf-lib` manipulating binary buffers, ensuring 100% reliable output to `/tempmediaStorage` without the overhead of headless browsers.

---

## 5. UI/UX Design Philosophy

We prioritize aesthetics and fluidity to create a premium user experience:

*   **Glassmorphism**: Extensive use of frosted glass panels (`.table-glass`) across data-heavy interfaces.
*   **Hardware-Accelerated Modals**: Forms and data-entry panels slide in smoothly from the screen edges (`.slide-over-overlay`), eliminating jarring popups.
*   **Antigravity Particle Matrix**: A custom background engine rendering dynamic, performant particle systems that adapt beautifully to both Light and Dark modes via explicit CSS variables.

---

## 6. Super Admin "God Mode" Terminal

The system includes a highly restricted `super_admin` God Mode terminal located at `ztl_tech/god_mode.html`. Communicating with `backend/src/routes/super.routes.js`, this terminal grants:
*   **Raw SQL Execution**: Direct querying and mutation of the MSSQL Enterprise Database.
*   **Environment Management**: Live read/write access to the server's `.env` configuration file.
*(Note: These routes enforce absolute Role-Based Access Control).*

---

## 7. Dynamic Feature Injection

The repository root contains several powerful `inject_*.js` utility scripts. These scripts dynamically patch the codebase to wire in new modules across the database, backend routes, and frontend UI:
*   **HR Core**: `inject_hr_routes.js`, `inject_hr_tables.js`, `inject_hr_ui.js`, `wire_hr_module.js`
*   **Candidate Sourcing**: `inject_sourcing_routes.js`, `inject_sourcing_ui.js`
*   **External Integrations**: `inject_integrations_db.js`

*Usage: Execute via Node (e.g., `node inject_hr_routes.js`) to install the desired module.*

---

## 8. Local Development Setup

### Prerequisites
*   **Node.js** (v20+)
*   **Redis** (Local instance on port `6379`)
*   **Microsoft SQL Server** (Local instance on port `1433`)

### Initialization
1. Navigate to the backend directory:
   ```bash
   cd backend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Configure your environment:
   Copy `.env.example` to `.env` and populate your SQL Server credentials, Redis URL, and a highly secure `JWT_SECRET`.

### Execution
Start the development server:
```bash
npm run dev
```
The server will automatically initialize required database schemas via `initDb.js` and serve the ecosystem at `http://localhost:3000`.

*   **ZTL-Tech Home**: `http://localhost:3000/ztl_tech`
*   **Paradigm Suite**: `http://localhost:3000/paradigm`

---

## 9. Documentation Deep Dives

For extensive architectural blueprints, mathematical models, and engine specifications, consult the `/docs` directory. Key documents include Tradeoff Analyses and specific product architecture guides.

---
*Welcome to the cutting edge of enterprise software.*
