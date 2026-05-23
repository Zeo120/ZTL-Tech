# ZTL Tech | Intern's Guide to the Codebase

Welcome to **ZTL Tech**! This guide is written in plain, simple English to help you understand how this whole project works. 

If you are a new intern, junior developer, or just starting out, this README is for you. We will go through what ZTL Tech is, how the code is organized, and explain **every single file** in the project.

---

## 1. What does this project do?

ZTL Tech is a software company that builds high-safety systems. We build tools that help other companies make sure their software is secure, fast, and does not crash.

We have a **Backend** (the server that runs in the background, handles databases, and processes requests) and five **Frontend** folders (the web pages that users see on their screens).

The five web sections are:
1. **ztl_tech** — The main company website (the landing page and admin hub).
2. **phasr** — A security scanner tool to check other codebases for vulnerability bugs.
3. **grid** — A systems blueprint tool to design server layouts.
4. **paradigm** — A custom software builder simulator.
5. **scalpel** — An automation tool to run tasks with human-in-the-loop checks.

---

## 2. Explanation of Every File in the Project

Here is a list of all folders and files, with a simple explanation of what each one does.

### Root Folder Files
*   **`README.md`** *(This file)*: The main guide to help you understand the codebase.
*   **`.gitignore`**: A text file that tells Git which files to ignore (like large `node_modules` folders or secret `.env` files) so we don't upload them to GitHub by accident.
*   **`setup_git.bat`**: A Windows batch script. Double-clicking it automatically initializes Git, stages all files, and makes the first commit.

---

### Backend Files (`backend/`)
The backend is built using **Node.js** and **Express**. It runs a server on your computer that listens to requests from the web pages.

*   **`backend/server.js`**: The main entry point for the backend. It starts the server, connects to databases, and handles clean shutdowns if the server is stopped.
*   **`backend/package.json`**: A file listing all NPM libraries/dependencies our server needs to run (like `express`, `mssql`, or `redis`).
*   **`backend/package-lock.json`**: A file generated automatically by NPM that records the exact versions of the libraries installed.
*   **`backend/.env.example`**: A template file showing what variables are needed to run the server (like database usernames or secret keys).
*   **`backend/.env`**: The actual file where we write our private secrets (like passwords and database credentials). **Never share this file!**
*   **`backend/README.md`**: A technical reference manual describing the backend's security rules.

#### Inside `backend/src/config/` (Settings & Database Connections)
*   **`db.js`**: Connects the server to a Microsoft SQL Server database. It has safety checks to reuse database connections so we don't crash the database.
*   **`env.js`**: Reads settings from the `.env` file and makes sure all required passwords and keys are present before starting.
*   **`initDb.js`**: Automatically creates the database tables we need if they do not exist yet (like `Users`, `Pages`, `Widgets`, `AuditLog`, and `PhasrAudits`).
*   **`redis.js`**: Connects the server to Redis (a super fast in-memory database used for tracking active user log-ins).

#### Inside `backend/src/middleware/` (Security Guards)
Middlewares are functions that run *before* a request reaches our API. They act like security guards at a building.
*   **`auth.js`**: Checks if the user is logged in by looking at their cookies or security tokens.
*   **`csrf.js`**: Prevents "Cross-Site Request Forgery" (an attack where another website tries to make actions on behalf of a logged-in user).
*   **`errorHandler.js`**: A centralized function that catches errors in the code and returns a clean, polite error message to the browser instead of crashing.
*   **`notFound.js`**: Runs when a user tries to access a URL route that does not exist (returns an HTTP 404 error).
*   **`rateLimit.js`**: Limits how many times a user can hit an API route in a minute. This prevents hackers from guessing passwords thousands of times a second.
*   **`requireRole.js`**: Checks if the logged-in user has the right permission level (like `admin` or `super_admin`) before letting them access sensitive areas.
*   **`securityHeaders.js`**: Adds security settings to HTTP headers to prevent browsers from running malicious scripts.

#### Inside `backend/src/routes/` (URL Web Paths)
Routes define the URLs that the backend listens to.
*   **`admin.routes.js`**: Defines URL paths for administrative actions, like starting a PHASR codebase scan or fetching audit logs.
*   **`auth.routes.js`**: Defines URL paths for logging in, logging out, and checking who is currently logged in.
*   **`health.routes.js`**: A simple route (`/api/health`) that returns "OK" to check if the server is running properly.

#### Inside `backend/src/services/` (The Cooks in the Kitchen)
Services contain the actual core logic of the application. If a route is a waiter taking your order, the service is the chef preparing it.
*   **`audit.service.js`**: Writes security log entries to the `AuditLog` database table (e.g., recording who logged in and when).
*   **`auth.service.js`**: Handles hashing passwords safely (using Argon2) and checking if user credentials are correct when logging in.
*   **`ownership.service.js`**: Makes sure a regular admin can only edit or view their own pages, not other admins' pages.
*   **`scanner.service.js`**: The scanner engine. It clones Git repositories, walks through files, and scans files to find security bugs.
*   **`session.service.js`**: Handles generating, tracking, and deleting user session tokens inside the Redis database.
*   **`user.service.js`**: Handles finding and managing user accounts in the SQL Server database.

#### Inside `backend/src/utils/` (Helper Tools)
*   **`asyncHandler.js`**: A helper function to simplify catching errors in modern Javascript asynchronous operations.
*   **`cookies.js`**: A helper to read and write secure, encrypted HTTP cookies on the user's browser.
*   **`httpError.js`**: A standardized template for sending HTTP error status codes (like 400 Bad Request, or 403 Forbidden).
*   **`logger.js`**: Standardizes console prints, formatting logs cleanly so developers can read them easily.
*   **`responses.js`**: Formats standard JSON success responses.
*   **`validators.js`**: Checks if inputs (like email addresses or password lengths) are correct before processing them.

---

### Grid Folder Files (`grid/`)
GRID is a visual simulator tool used to map network architecture.
*   **`grid/index.html`**: The product landing page. It has a custom animated SVG showing server networks with flowing particles.
*   **`grid/login.html`**: The login page for the GRID console.
*   **`grid/style.css`**: The stylesheet specifying colors, buttons, and animations for GRID.
*   **`grid/admin.html`**: The dashboard console. It has an interactive network blueprint modeler, a slider to simulate traffic up to 1 million requests/second, and a database sharding planner.

---

### Paradigm Folder Files (`paradigm/`)
PARADIGM helps users design and mock custom business software.
*   **`paradigm/index.html`**: The landing page displaying information about paradigm software design.
*   **`paradigm/login.html`**: The login page for PARADIGM.
*   **`paradigm/style.css`**: The stylesheet specifying custom purple styles and layouts for PARADIGM.
*   **`paradigm/admin.html`**: The dashboard console. It has a code generator preview window, an architectural debt analyzer, and a sprint simulator.

---

### Phasr Folder Files (`phasr/`)
PHASR is our security audit platform.
*   **`phasr/index.html`**: The landing page featuring a radar graphic showing a security system scan.
*   **`phasr/login.html`**: The login page for PHASR.
*   **`phasr/style.css`**: The stylesheet specifying security-themed crimson red styles.
*   **`phasr/ztl_consent_agreement.txt`**: A terms and conditions agreement file that users upload when testing the PHASR scanner.
*   **`phasr/admin.html`**: The dashboard console. It includes interactive diagrams mapping trust boundaries and a portal to submit DNS configurations for audits.
* **`phasr/nerd-stats.html`**: The codebase analyzer screen. It has a split layout: a list of flagged files on the left, and a code editor pane on the right highlighting vulnerable lines.
* **`phasr/src/`**: The core source code directory for Phase-1 security verification.
  * **`fsm_validator.asm`**: Core transition logic written in x86-64 assembly.
  * **`phase_fsm.c`**: The self-contained C test runner and FDTD numerical wave simulation (with state mappings and configuration constants inlined).
  * **`build.bat`**: The Windows build script using MSVC `ml64` and `cl`.


---


### Scalpel Folder Files (`scalpel/`)
SCALPEL orchestrates automated workflows with human approval gates.
*   **`scalpel/index.html`**: The landing page introducing supervised task orchestration.
*   **`scalpel/login.html`**: The login page for SCALPEL.
*   **`scalpel/style.css`**: The stylesheet specifying high-visibility cyan styles.
*   **`scalpel/admin.html`**: The dashboard console. It has interactive components to schedule backup tasks, dispatch mock agent swarms, and simulate auto-healing circuits.

---

### ZTL Tech Folder Files (`ztl_tech/`)
The core corporate hub folder.
*   **`ztl_tech/index.html`**: The primary homepage of ZTL Tech. Features a large, interactive regular hexagon SVG network map in the center that users can hover over.
*   **`ztl_tech/login.html`**: The general login page.
*   **`ztl_tech/style.css`**: Global variable definitions, layouts, and styles shared across the corporate hub.
*   **`ztl_tech/admin.html`**: The general admin console hub.
*   **`ztl_tech/super_admin.html`**: A privileged dashboard for super-admin operators, housing database configuration controls.

---

## 3. Crucial Concepts for Interns

### 1. Viewport Scroll Animations
We animate headings and sections as you scroll down the page. 
*   We add the class `animate` to an element in the HTML.
*   The CSS sets `opacity: 0` and shifts the element down slightly (`transform: translateY(30px)`).
*   A Javascript **`IntersectionObserver`** script monitors the scroll position. When the element enters the viewport, Javascript adds the class `visible`, which transitions `opacity` to `1` and returns the element to its original position.

### 2. The Browser "Style-Batching" Bug & Fixing It
Sometimes on mobile devices, if we tell Javascript to show an animated element immediately when the page loads, the browser gets confused. It processes the "hidden" state and the "visible" state at the exact same millisecond (this is called "style batching"). As a result, the transition animation is skipped, and the element appears instantly.

**The Fix:**
Inside our scripts, we wrap the startup visibility function (`forceHeroVisible()`) in a `setTimeout` with a tiny delay of **50 milliseconds**:
```javascript
const forceHeroVisible = () => {
    setTimeout(() => {
        document.querySelectorAll('.hero .animate').forEach(el => {
            el.classList.add('visible');
        });
    }, 50); // The 50ms delay gives the browser time to paint the hidden state first
};
```
This forces the browser to register the hidden state first, resulting in a smooth animation.

---

### 3. Compiling and Running Phase-1 FSM Validator
To compile and execute the FSM transition assertions and telemetry wave simulation:
1. Ensure **Visual Studio Build Tools** (MSVC C++ compiler and tools) are installed.
2. Open a standard command prompt or terminal in the workspace root.
3. Run the build batch file:
   ```cmd
   cd phasr\src
   build.bat
   ```
4. This script automatically:
   * Sets up the x64 environment via `vcvars64.bat`.
   * Assembles `fsm_validator.asm` with MASM `ml64.exe`.
   * Compiles and links `phase_fsm.c` with `cl.exe` utilizing security flags (`/GS`, `/guard:cf`, `/WX`).
   * Runs the `phase_fsm.exe` binary displaying test outputs and a real-time ASCII wave simulation.

