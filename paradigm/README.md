# Paradigm - Enterprise Business Software & Payroll Management

Paradigm is our flagship enterprise business suite designed for seamless payroll management, employee tracking, and HR administration. 

## 🏗️ Architecture Note: Database Isolation

**Paradigm operates on an isolated database architecture.** 
Unlike other products in the ZTL Tech monorepo that share the core `ZTLtech` database, Paradigm has been successfully sharded to its own dedicated database: **`ParadigmSuite`**.

This zero-downtime separation guarantees high-performance throughput for payroll processing without competing for resources with security scans or network traffic simulations from other products.

### Multi-Tenant Database Connectivity
The backend node server dynamically routes traffic based on the endpoint:
- **Core Operations:** Uses `getDbPool()` which connects to the `ZTLtech` database.
- **Paradigm Operations:** Uses `getParadigmDbPool()` which connects to the `ParadigmSuite` database.

When writing backend queries for Paradigm (e.g., querying `Employees`, `Attendance`, `Leaves`, `Expenses`, `PayrollRuns`), you **MUST** use `suitePool.request()`. The only exception is the `Users` table which is still stored in the Core Database for centralized authentication.

## ⚙️ Local Development

To run Paradigm locally, ensure your `backend/.env` file contains both the Core and Paradigm SQL credentials:

```env
# Core Database
SQL_SERVER=...
SQL_USER=...
SQL_PASSWORD=...
SQL_DATABASE=ZTLtech

# Paradigm Isolated Database
PARADIGM_SQL_SERVER=...
PARADIGM_SQL_USER=...
PARADIGM_SQL_PASSWORD=...
PARADIGM_SQL_DATABASE=ParadigmSuite
```

## 🖥️ UI / UX Philosophy

Paradigm follows a minimalist, data-first UX approach:
- All new features must seamlessly fit into the single-page application (SPA) layout without full page reloads.
- Heavy computational tasks (like Payroll processing) use asynchronous background jobs on the backend with polling updates on the UI.
- The UI contains no external dependencies like React or Tailwind, maintaining pure, extremely fast Vanilla JS and CSS performance.
