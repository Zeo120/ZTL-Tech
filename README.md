# ZTL Tech Codebase Guide

This repository contains the ZTL Tech web experience, a Node.js backend, and several PHASR validation and simulation engines. It is organized as a mixed application workspace: static frontend sections live at the project root, the API server lives in `backend/`, and PHASR native-code modules live under `phasr/`.

## Project Overview

ZTL Tech is presented as a high-safety software systems company with several product areas:

- `ztl_tech/` - main corporate website, login page, admin hub, and super-admin console.
- `phasr/` - security audit platform, codebase analyzer UI, validator engines, and simulation tools.
- `grid/` - network architecture blueprinting and traffic simulation UI.
- `paradigm/` - custom business software design simulator UI.
- `scalpel/` - supervised automation and approval-gated workflow UI.
- `backend/` - Express API server for authentication, admin operations, database setup, audits, and scanner execution.
- `docs/` - architecture notes, PHASR phase requirements, and mathematical model documentation.

## Repository Layout

```text
.
+-- backend/                         Node.js Express API
+-- docs/
|   +-- architecture/                 System architecture documentation
|   +-- equations/                    Mathematical model notes
|   +-- phasr/                        PHASR phase documentation
+-- grid/                             GRID static frontend
+-- paradigm/                         PARADIGM static frontend
+-- phasr/                            PHASR frontend, engines, generated assets
+-- scalpel/                          SCALPEL static frontend
+-- ztl_tech/                         Main ZTL Tech frontend
+-- codebase_scan_findings_report.txt Latest scanner findings report
+-- phasr_transition_attestation_summary.txt
+-- setup_git.bat
+-- README.md
```

## Backend

The backend is a CommonJS Node.js application using Express. It serves API routes and also exposes the static frontend folders through whitelisted paths.

Important backend files:

- `backend/server.js` - process entry point; initializes the database, starts the HTTP server, and handles graceful shutdown.
- `backend/src/app.js` - Express app factory; configures middleware, static frontend routes, page redirects, API routes, and error handlers.
- `backend/src/config/env.js` - validates environment configuration.
- `backend/src/config/db.js` - manages SQL Server connections.
- `backend/src/config/initDb.js` - creates required SQL tables when the server starts.
- `backend/src/config/redis.js` - manages Redis session storage.
- `backend/src/routes/auth.routes.js` - login, logout, session, and CSRF-related endpoints.
- `backend/src/routes/admin.routes.js` - admin workflows including PHASR scan operations and audit access.
- `backend/src/routes/health.routes.js` - health check endpoint.
- `backend/src/services/scanner.service.js` - codebase scanner that records scan metadata, dependencies, and findings.
- `backend/src/middleware/` - authentication, CSRF, rate limiting, role checks, security headers, 404 handling, and centralized error handling.
- `backend/src/utils/` - shared helpers for cookies, errors, logging, validation, and responses.

## Requirements

For the backend:

- Node.js with support for `node --env-file`
- npm
- Microsoft SQL Server
- Redis

For PHASR native modules:

- Windows: Visual Studio Build Tools with MSVC and MASM where required.
- Linux x86-64 or ARM64: GCC/G++, GNU assembler, and `make`.
- Python is needed for selected rendering scripts.
- FFmpeg or equivalent tooling may be needed if regenerating video artifacts from frame outputs.

## Backend Setup

```powershell
cd backend
npm install
Copy-Item .env.example .env
```

Edit `backend/.env` with local values:

- `PORT`
- `JWT_SECRET`
- SQL Server settings
- `REDIS_URL`
- session and CSRF settings

Run the backend:

```powershell
npm run dev
```

or:

```powershell
npm start
```

By default, the server redirects `/` to `/ztl_tech/index.html` and serves the product frontends from:

- `/ztl_tech`
- `/phasr`
- `/grid`
- `/paradigm`
- `/scalpel`

The health check is available at:

```text
/api/health
```

## Frontend Sections

Each product section is currently a static HTML/CSS experience:

- `index.html` - public-facing product page.
- `login.html` - login page for that product area.
- `admin.html` - operator console or dashboard.
- `style.css` - section-specific styling.

`ztl_tech/` also includes `super_admin.html` for privileged database and administrative controls.

## PHASR Structure

PHASR combines static UI pages, native validation engines, generated assembly, generated visualizations, and documentation.

Top-level PHASR files include:

- `phasr/index.html` - PHASR landing page.
- `phasr/login.html` - PHASR login page.
- `phasr/admin.html` - PHASR admin dashboard.
- `phasr/nerd-stats.html` - codebase analyzer UI with finding list and code pane.
- `phasr/style.css` - PHASR styling.
- `phasr/ztl_consent_agreement.txt` - consent text used by the scanner workflow.
- `phasr/compute_balancer.h` - compute-balancing support header.
- `phasr/render_exploit_paths.py` - exploit path visualization renderer.
- `phasr/exploit_video_gen.cpp` - native exploit visualization generator.
- `phasr/build_exploit_video.bat` - Windows video build helper.
- `phasr/*.gif` and `phasr/*.mp4` - generated visualization outputs.
- `phasr/frames_*/` - generated PPM frame directories.

PHASR validation and simulation modules:

- `phasr/Phase-1/` - temporal FSM transition validation.
- `phasr/Phase-2/` - hierarchy reachability and access-boundary verification.
- `phasr/Phase-3/` - invariant drift and telemetry monitoring.
- `phasr/Phase-4/` - mitigation and chaos verification.
- `phasr/Phase-5/` - redundancy failover and consensus attestation.
- `phasr/Satan-Recursion/` - curved spacetime wave solver with chunked generated routines.
- `phasr/Primordial-Sin/` - primordial engine driver and assembly backends.
- `phasr/Lucifers-Blessing/` - Lucifer engine driver and assembly backends.

## Building PHASR Modules

Most PHASR engine folders provide both a Windows `build.bat` and a Linux/Unix `Makefile`.

Windows example:

```cmd
cd phasr\Phase-1
build.bat
```

Linux example:

```bash
cd phasr/Phase-1
make
./phase_fsm
```

The same pattern applies to `Phase-2` through `Phase-5`, `Satan-Recursion`, `Primordial-Sin`, and `Lucifers-Blessing`, with each module producing its own executable.

Architecture support varies by module:

- x86-64 Linux assembly backends are present across the generated PHASR engines.
- ARM64 Linux assembly backends are present for several phase modules and Satan's Recursion.
- Windows builds generally use MSVC, MASM where present, or portable C/C++ fallbacks.

## Satan's Recursion Visualization

To run a large simulation and export a binary state file:

```cmd
cd phasr\Satan-Recursion
satan_recursion.exe --steps 1000000 --export spacetime_simulation.bin --silent
```

To render an animation:

```cmd
python render_video.py spacetime_simulation.bin gif
```

The generated Satan's Recursion helper files can be regenerated with:

```bash
node generate_satan.js --chunks 10 --routines 10000
```

## Documentation

Useful documentation entry points:

- `docs/architecture/ARCHITECTURE.md`
- `docs/architecture/COMPUTE_BALANCER.md`
- `docs/phasr/PHASR_CORE_CONTEXT.md`
- `docs/phasr/Phase-1.md`
- `docs/phasr/Phase-2.md`
- `docs/phasr/Phase-3.md`
- `docs/phasr/Phase-4.md`
- `docs/phasr/Phase-5.md`
- `docs/phasr/Satan-Recursion.md`
- `docs/equations/Equations.md`

## Security Notes

- Do not commit `backend/.env`; use `backend/.env.example` as the template.
- Static files are intentionally served only from approved frontend directories.
- Authentication uses secure cookies and session tracking through Redis.
- CSRF protection is handled by backend middleware and token headers.
- Scanner findings are persisted to SQL Server and mirrored into `codebase_scan_findings_report.txt`.
- Keep generated reports and visualization artifacts under review before committing them, because they can become large or stale.

## Common Development Commands

Install backend dependencies:

```powershell
cd backend
npm install
```

Run backend in watch mode:

```powershell
cd backend
npm run dev
```

Run backend normally:

```powershell
cd backend
npm start
```

Build a PHASR module on Windows:

```cmd
cd phasr\Phase-4
build.bat
```

Build a PHASR module on Linux:

```bash
cd phasr/Phase-4
make
./chaos_verifier
```

## Maintenance Guidance

- Keep generated assembly and generated frame/video outputs separate from handwritten source when possible.
- Update this README whenever a new top-level product folder, backend route group, PHASR engine, or required service is added.
- Prefer documenting generated-code regeneration commands in the module-specific docs rather than expanding this root README with every generated file.
