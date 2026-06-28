# ZTL Tech - Intern Onboarding & Codebase Guide

Welcome to ZTL Tech! If you're a new intern, this is the first document you should read. We've designed this guide to help you navigate the codebase, understand how the pieces fit together, and start shipping code without needing to guess or ask an AI what a file does.

---

## 🏗️ 1. High-Level Architecture

This repository is a **Monorepo**. That means we have several different frontend applications (for different products) and a single, unified Node.js backend server that powers all of them.

*   **The Backend** serves APIs (like login, employee management, security scans).
*   **The Frontends** are simple, lightweight, static HTML/CSS/JS files (No React, No Next.js). The backend serves these frontend files directly.

---

## 📁 2. Where is Everything? (Directory Structure)

Don't let the number of folders intimidate you. Here is exactly what each folder does:

### 🖥️ The Frontends
These folders contain the UI for our different products. They all follow the same pattern (`index.html` for the landing page, `login.html`, and `admin.html` for the dashboard).
*   `ztl_tech/` - Our main corporate website and Super Admin console.
*   `paradigm/` - Our Enterprise Business Software & Payroll Management system.
*   `grid/` - Network architecture and traffic simulation UI.
*   `scalpel/` - Automated workflow approval UI.
*   `phasr/` - Our flagship security auditing tool.

### ⚙️ The Backend (`/backend`)
This is the brains of the operation. It's an Express.js server connected to Microsoft SQL Server and Redis.
*   `server.js` - The entry point. It starts the server and connects to the DB.
*   `src/app.js` - Connects all the routes and middleware together.
*   `src/routes/` - API Endpoints (e.g., `/api/admin/...`). This is where HTTP requests land.
*   `src/services/` - The heavy lifting. If a route needs to calculate payroll, do a security scan, or query the DB, it calls a function in here.
*   `src/middleware/` - Security checkpoints (CSRF protection, authentication checks) that run *before* a route is hit.
*   `src/config/` - Database (`db.js`, `initDb.js`), Redis (`redis.js`), and Environment Variables (`env.js`) setup.

### 📚 The Docs (`/docs`)
Contains deep-dive architectural documents, mathematical models for PHASR, and detailed engine specs.

---

## 🔒 3. Security & Data Flow (How Things Actually Work)

### Authentication & Sessions
When a user logs in, we don't use simple JWTs in LocalStorage. We use **Secure Sessions stored in Redis**:
1. User logs in (`auth.service.js`).
2. Backend generates a Session ID, stores the user's data in **Redis**, and sets an `HttpOnly` cookie in the user's browser.
3. Every subsequent request automatically sends this cookie.

### CSRF Protection (Crucial!)
To prevent cross-site request forgery, every `POST`, `PUT`, or `DELETE` request requires a CSRF token:
1. On login, the backend sets a `ztl_csrf` cookie (which *can* be read by frontend JavaScript).
2. Whenever the frontend makes a request (like saving an employee), it must manually read the `ztl_csrf` cookie and attach it as the `x-csrf-token` header.
3. The backend (`middleware/csrf.js`) checks if the Header matches the Cookie. If they don't match, you get a `403 CSRF Validation Failed` error.

### Database (MS SQL Server)
We use Microsoft SQL Server. If you need to add a new table:
1. Open `backend/src/config/initDb.js`.
2. Add your table definition to the `tables` array. The server will automatically create it on startup if it doesn't exist.
3. Use parameterized queries (e.g., `request.input('id', sql.Int, myId)`) everywhere to prevent SQL injection.

---

## 🚀 4. How to Run the Project Locally

### Prerequisites
1. **Node.js** (v20+)
2. **Redis** (Running locally on port 6379)
3. **Microsoft SQL Server** (Running locally on port 1433)

### Setup Steps
1. Navigate to the backend folder:
   ```bash
   cd backend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Set up your environment file:
   Copy `.env.example` to `.env`. Fill in your SQL Server credentials, Redis URL, and a random string for `JWT_SECRET`.
   *(Note: For isolated Paradigm development, you might be instructed to use `.env.paradigm` instead).*

### Start the Server
```bash
npm run dev
```
The server will boot up, initialize the database tables automatically, and serve the application at `http://localhost:3000`.

*To visit the ZTL Tech Homepage:* Go to `http://localhost:3000/ztl_tech`
*To visit Paradigm:* Go to `http://localhost:3000/paradigm`

---

## 💡 5. Common Gotchas for Interns

*   **My form submission was rejected!** Check your browser's network tab. If it's a 403 error, your frontend fetch call is probably missing the `x-csrf-token` header or the `credentials: 'include'` flag.
*   **My database changes aren't showing!** Make sure you didn't just update the frontend UI. You need to update the Schema in `initDb.js` and ensure the backend route (`admin.routes.js`) is actually executing the SQL `INSERT`/`UPDATE`.
*   **Where do I put my CSS?** We don't use Tailwind. We use Vanilla CSS. Put it in the `style.css` file inside the respective product folder (e.g., `paradigm/style.css`). Keep designs sleek and symmetrical.

Good luck, and welcome to the team!

---

## 🌟 6. Recent Overhauls & Architecture Upgrades (Paradigm Suite)

**The Caveman Philosophy (Divide & Rule):**
We have recently overhauled the Paradigm Enterprise Software to enforce strict Multi-Tenant isolation. Every employee, payroll ledger, and attendance record is strictly partitioned by `company_id`. The blast radius of any data breach is mathematically contained to a single corporate entity.

**Cryptographic Payroll & PDF Engine:**
*   **Merkle Roots:** All completed Payroll Runs are cryptographically sealed using SHA-256 Merkle Roots generated from the employee transactions, ensuring zero tampering post-processing.
*   **Headless PDF Generation:** We bypass unreliable headless browsers in production by using `pdf-lib` to programmatically inject binary text into pure PDF buffers, guaranteeing 100% reliable Payslip generation in the `/tempmediaStorage` directory.

**Aesthetic Paradigm Shift (UI/UX):**
*   **Glassmorphic Data Tables:** All legacy HTML tables in the Payroll module have been aggressively upgraded to Frosted Glass panels (`.table-glass`).
*   **Slide-Over Modals:** We eradicated jarring center-screen popups. All forms (e.g., `Add Corporate Employee`, `Create Payroll Run`) now smoothly slide in from the right edge using hardware-accelerated CSS transitions (`.slide-over-overlay`).
*   **Antigravity Particle Matrix:** The background engine handles intense dynamic particles. We've introduced explicit CSS variables (`--particle-1`, `--line-opacity`) into the `:root` to ensure the matrix is deeply black and highly visible in Light Mode, and a glowing translucent white in Dark Mode.

---

## 🛠️ 7. Super Admin "God Mode" Terminal

We have introduced a strict `super_admin` God Mode terminal accessible at `ztl_tech/god_mode.html`. This interfaces with `backend/src/routes/super.routes.js` to allow:
*   **Raw SQL Execution:** Direct querying of the Enterprise Database via the API.
*   **Environment Management:** Direct read/write access to the `.env` file on the server.
*(Note: These routes enforce strict Role-Based Access Control and require the `super_admin` role).*

## 💉 8. Dynamic Feature Injection Scripts

The root directory contains several `inject_*.js` scripts. These are designed to dynamically inject additional modules into the frontend UI, backend routes, and database schemas:
*   **HR Module:** `inject_hr_routes.js`, `inject_hr_tables.js`, `inject_hr_ui.js`, `wire_hr_module.js`
*   **Sourcing:** `inject_sourcing_routes.js`, `inject_sourcing_ui.js`
*   **Integrations:** `inject_integrations_db.js`

To install these modules, run the scripts via Node (e.g., `node inject_hr_routes.js`).
