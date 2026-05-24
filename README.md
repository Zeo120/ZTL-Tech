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
*   **`docs/`**: The organized parent directory containing all design, architecture, phase-specific requirements, and physics equations documentation.
    *   **`docs/architecture/`**: Houses global system designs and compute balancer specifications.
    *   **`docs/phasr/`**: Houses context guides and requirements for the 5 validation phases and Satan's Recursion.
    *   **`docs/equations/`**: Houses the proofs, derivations, and numerical examples for the mathematical models.

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
* **`phasr/Phase-1/`**: The consolidated directory containing Phase-1 temporal FSM validator code.
  * **`fsm_validator.asm`**: Core transition logic written in **x86-64 MASM assembly** (Windows/MSVC). Contains 4,500 helper procedures and the master `validate_transition` dispatcher.
  * **`fsm_validator_linux_x64.s`**: Port of the FSM validator in **x86-64 GAS assembly** (Linux System V AMD64 ABI, Intel syntax). Auto-generated, 130,562 lines.
  * **`fsm_validator_linux_arm64.s`**: Port of the FSM validator in **ARM64 AArch64 GAS assembly** (Linux AAPCS64 ABI). Auto-generated, 130,559 lines.
  * **`fsm_validator_fallback.c`**: Pure-C fallback implementation of `validate_transition`, used when assembling on unsupported platforms.
  * **`phase_fsm.c`**: The self-contained C test runner and FDTD numerical wave simulation (with state mappings and configuration constants inlined).
  * **`build.bat`**: The Windows build script using MSVC `ml64` and `cl`.
  * **`Makefile`**: Cross-platform build file. Automatically selects the x86-64 or ARM64 assembly back-end based on the host architecture.
* **`phasr/Phase-2/`**: The source directory for Phase-2 hierarchy access boundary verification.
  * **`reachability_engine.cpp`**: C++ driver and verification suite, implementing a damped numerical wave simulation and containing 1,000 unit tests.
  * **`reachability_arm64.s`**: High-performance ARM64 assembly implementation of transitive closure sweeps.
  * **`reachability_linux_x64.s`**: High-performance x86-64 assembly implementation of transitive closure sweeps.
  * **`Makefile`**: Cross-platform Makefile to compile the assembly on ARM64 or compile the C++ fallback on other hosts.
  * **`build.bat`**: Windows MSVC compilation and test runner script.
* **`phasr/Phase-3/`**: The source directory for Phase-3 invariant drift & telemetry monitoring.
  * **`telemetry_collector.c`**: C driver and emulated eBPF ring buffer, containing C fallback invariants and 500 unit tests.
  * **`telemetry_linux_x64.s`**: Statically generated x86-64 assembly containing 4,500 invariant checks.
  * **`telemetry_arm64.s`**: Statically generated ARM64 assembly containing 4,500 invariant checks.
  * **`Makefile`**: Cross-platform Makefile to link assembly back-ends on Linux.
  * **`build.bat`**: Windows MSVC compilation and test runner script.
* **`phasr/Phase-4/`**: The source directory for Phase-4 solutions mitigation & chaos verification.
  * **`chaos_verifier.cpp`**: C++ driver and verification suite, implementing a driven FDTD wave simulation and containing 1,000 unit tests.
  * **`control_linux_x64.s`**: Statically generated x86-64 assembly containing 4,500 control verification helper routines.
  * **`control_arm64.s`**: Statically generated ARM64 assembly containing 4,500 control verification helper routines.
  * **`Makefile`**: Cross-platform Makefile to link assembly back-ends on Linux.
  * **`build.bat`**: Windows MSVC C++ compilation and test runner script.
* **`phasr/Phase-5/`**: The source directory for Phase-5 redundancy failover attestation.
  * **`consensus_auditor.c`**: C driver and attestation engine, implementing a heartbeat sync FDTD wave simulation and containing 1,000 unit tests.
  * **`consensus_linux_x64.s`**: Statically generated x86-64 assembly containing 4,500 consensus verification helper routines.
  * **`consensus_arm64.s`**: Statically generated ARM64 assembly containing 4,500 consensus verification helper routines.
  * **`Makefile`**: Cross-platform Makefile to link assembly back-ends on Linux.
  * **`build.bat`**: Windows MSVC C compilation and test runner script.
* **`phasr/Satan-Recursion/`**: The source directory for Satan's Recursion curved spacetime wave solver.
  * **`satan_recursion.cpp`**: C++ master driver, containing wave propagation solvers, pointer tables, and the unit test entry points.
  * **`satan_chunk_xx.cpp`**: Statically generated C++ fallback invariant routines (partitioned into chunks).
  * **`satan_chunk_xx_x64.s`**: Statically generated x86-64 assembly containing unrolled Kerr metric routines.
  * **`satan_chunk_xx_arm64.s`**: Statically generated ARM64 assembly containing unrolled Kerr metric routines.
  * **`Makefile`**: Cross-platform Makefile to automatically detect platform and link all assembly engine chunks.
  * **`build.bat`**: Windows MSVC C++ compilation script to compile all chunks and driver.
  * **`render_video.py`**: Python script to parse binary outputs and render high-fidelity simulation videos.







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

The FSM validator ships with two assembly back-ends and a pure-C fallback.

#### Option A — Windows x86-64 (MSVC / MASM)

1. Ensure **Visual Studio Build Tools** (MSVC C++ compiler and MASM tools) are installed.
2. Open a standard command prompt in the workspace root.
3. Run the build batch file:
   ```cmd
   cd phasr\Phase-1
   build.bat
   ```
4. This script automatically:
   * Sets up the x64 environment via `vcvars64.bat`.
   * Assembles `fsm_validator.asm` with MASM `ml64.exe`.
   * Compiles and links `phase_fsm.c` with `cl.exe` using security flags (`/GS`, `/guard:cf`, `/WX`).
   * Runs the `phase_fsm.exe` binary displaying test outputs and a real-time ASCII wave simulation.

#### Option B — Linux x86-64 or ARM64 (GAS / GCC)

1. Ensure a **GCC toolchain** and GNU Assembler (`as`) are installed on your Linux host:
   ```bash
   sudo apt install gcc binutils   # Debian/Ubuntu
   ```
2. Build using the cross-platform Makefile:
   ```bash
   cd phasr/Phase-1
   make
   ```
3. The Makefile automatically detects the host architecture (`uname -m`) and links against `fsm_validator_linux_x64.s` (on x86-64) or `fsm_validator_linux_arm64.s` (on AArch64/ARM64). It falls back to the pure C implementation (`fsm_validator_fallback.c`) on other architectures.
4. Run the output binary:
   ```bash
   ./phase_fsm
   ```

> **Note:** The Phase-1 assembly files are auto-generated. To regenerate them:
> * Linux x86-64: `node generate_fsm_asm_linux_x64.js`
> * Linux ARM64: `node generate_fsm_asm_arm64.js`

---

### 4. Compiling and Running Phase-2 Hierarchy Reachability Engine

The reachability engine compiles with either of the two assembly back-ends (x86-64 / ARM64) or a C++ fallback.

#### Option A — Windows x86-64 (MSVC C++ Fallback)

1. Ensure **Visual Studio Build Tools** (MSVC C++ compiler) is installed.
2. Run the build batch file:
   ```cmd
   cd phasr\Phase-2
   build.bat
   ```
3. The script compiles `reachability_engine.cpp` with `/EHsc /W4 /WX /GS` flags and executes the test suite.

#### Option B — Linux x86-64 or ARM64 (GAS / GCC)

1. Build using the cross-platform Makefile:
   ```bash
   cd phasr/Phase-2
   make
   ```
2. The Makefile automatically detects the host architecture (`uname -m`) and compiles `reachability_linux_x64.s` (on x86-64) or `reachability_arm64.s` (on ARM64), falling back to C++ on other architectures.
3. Run the output binary:
   ```bash
   ./reachability_engine
   ```

> **Note:** The Phase-2 assembly files are auto-generated. To regenerate them:
> * Linux x86-64: `node generate_reachability_asm_x64.js`
> * Linux ARM64: `node generate_reachability_asm_arm64.js`

---

### 5. Compiling and Running Phase-3 Telemetry Collector

The telemetry collector compiles with either of the two assembly back-ends (x86-64 / ARM64) or a C fallback.

#### Option A — Windows x86-64 (MSVC C Fallback)

1. Ensure **Visual Studio Build Tools** (MSVC C++ compiler) is installed.
2. Run the build batch file:
   ```cmd
   cd phasr\Phase-3
   build.bat
   ```
3. The script compiles `telemetry_collector.c` with `/W4 /WX /GS` flags and executes the test suite.

#### Option B — Linux x86-64 or ARM64 (GAS / GCC)

1. Build using the cross-platform Makefile:
   ```bash
   cd phasr/Phase-3
   make
   ```
2. The Makefile automatically detects the host architecture (`uname -m`) and compiles `telemetry_linux_x64.s` (on x86-64) or `telemetry_arm64.s` (on ARM64), falling back to C on other architectures.
3. Run the output binary:
   ```bash
   ./telemetry_collector
   ```

> **Note:** The Phase-3 assembly files are auto-generated. To regenerate them, run:
> * `node generate_phase_3.js`

---

### 6. Compiling and Running Phase-4 Chaos Verifier

The chaos verifier compiles with either of the two assembly back-ends (x86-64 / ARM64) or a C++ fallback.

#### Option A — Windows x86-64 (MSVC C++ Fallback)

1. Ensure **Visual Studio Build Tools** (MSVC C++ compiler) is installed.
2. Run the build batch file:
   ```cmd
   cd phasr\Phase-4
   build.bat
   ```
3. The script compiles `chaos_verifier.cpp` with `/EHsc /W4 /WX /GS` flags and executes the test suite.

#### Option B — Linux x86-64 or ARM64 (GAS / GCC)

1. Build using the cross-platform Makefile:
   ```bash
   cd phasr/Phase-4
   make
   ```
2. The Makefile automatically detects the host architecture (`uname -m`) and compiles `control_linux_x64.s` (on x86-64) or `control_arm64.s` (on ARM64), falling back to C++ on other architectures.
3. Run the output binary:
   ```bash
   ./chaos_verifier
   ```

> **Note:** The Phase-4 assembly files are auto-generated. To regenerate them, run:
> * `node generate_phase_4.js`

---

### 7. Compiling and Running Phase-5 Consensus Auditor

The consensus auditor compiles with either of the two assembly back-ends (x86-64 / ARM64) or a C fallback.

#### Option A — Windows x86-64 (MSVC C Fallback)

1. Ensure **Visual Studio Build Tools** (MSVC C++ compiler) is installed.
2. Run the build batch file:
   ```cmd
   cd phasr\Phase-5
   build.bat
   ```
3. The script compiles `consensus_auditor.c` with `/W4 /WX /GS` flags and executes the test suite.

#### Option B — Linux x86-64 or ARM64 (GAS / GCC)

1. Build using the cross-platform Makefile:
   ```bash
   cd phasr/Phase-5
   make
   ```
2. The Makefile automatically detects the host architecture (`uname -m`) and compiles `consensus_linux_x64.s` (on x86-64) or `consensus_arm64.s` (on ARM64), falling back to C on other architectures.
3. Run the output binary:
   ```bash
   ./consensus_auditor
   ```

> **Note:** The Phase-5 assembly files are auto-generated. To regenerate them, run:
> * `node generate_phase_5.js`

---

### 8. Compiling and Running Satan's Recursion Wave Solver

Satan's Recursion compiles with either of the two assembly back-ends (x86-64 / ARM64) or a portable C++ fallback.

#### Option A — Windows x86-64 (MSVC C++ Fallback)

1. Ensure **Visual Studio Build Tools** (MSVC C++ compiler) is installed.
2. Run the build batch file:
   ```cmd
   cd phasr\Satan-Recursion
   build.bat
   ```
3. The script compiles all C++ chunks (`*.cpp`) with `/EHsc /W4 /WX /GS /Od` flags and executes the test suite.

#### Option B — Linux x86-64 or ARM64 (GAS / GCC)

1. Build using the cross-platform Makefile:
   ```bash
   cd phasr/Satan-Recursion
   make
   ```
2. The Makefile automatically detects the host architecture (`uname -m`) and compiles and links all `satan_chunk_*_x64.s` (on x86-64) or `satan_chunk_*_arm64.s` (on ARM64) files dynamically, falling back to C++ chunks on other platforms.
3. Run the output binary:
   ```bash
   ./satan_recursion
   ```

#### Option C — Generating Video Frames & Visualizations
To scale the simulation up to 1,000,000 steps and export the states to render video animation:
```cmd
cd phasr\Satan-Recursion
:: Run 1,000,000 simulation steps and export binary states
.\satan_recursion.exe --steps 1000000 --export spacetime_simulation.bin --silent

:: Generate animation GIF or MP4 via Python script
python render_video.py spacetime_simulation.bin gif
```

> **Note:** The Satan's Recursion assembly and C++ helper files are auto-generated. To regenerate them at 100X Scale (100,000 routines), run:
> * `node generate_satan.js --chunks 10 --routines 10000`

