# ZTL Tech Backend

Minimal Express backend scaffold for ZTL Tech.

## Layout

```txt
backend/
  server.js
  src/
    app.js
    config/
      db.js
      env.js
      redis.js
    middleware/
      auth.js
      csrf.js
      errorHandler.js
      notFound.js
      rateLimit.js
      requireRole.js
      securityHeaders.js
    routes/
      admin.routes.js
      auth.routes.js
      health.routes.js
    services/
      audit.service.js
      auth.service.js
      ownership.service.js
      session.service.js
      user.service.js
    utils/
      asyncHandler.js
      cookies.js
      httpError.js
      logger.js
      responses.js
      validators.js
```

## Security Posture

- Express hides `x-powered-by`.
- JSON body size is capped.
- Auth supports HTTP-only cookie sessions or `Authorization: Bearer`.
- JWTs include `sid` and are validated against Redis sessions.
- Logout revokes the active Redis session.
- Logout-all invalidates all sessions for the user.
- RBAC is explicit in route middleware.
- Admin and super-admin routes re-check current DB role and active state.
- SQL Server access uses `mssql` request parameters only.
- Login attempts are audit logged.
- Super-admin action audit writes fail closed.
- Operational errors return predictable JSON.
- Production errors do not expose stack traces.
- Logs redact sensitive key substrings.
- Redis-backed rate limiting is used for login, admin, and super-admin routes.
- Cookie-authenticated unsafe admin/logout routes require session-bound CSRF validation.
- Admin routes only accept HTTP-only cookie auth.
- Requests containing both cookie auth and Bearer auth are rejected.
- Minimal security headers are set without adding Helmet.

## Trust Boundaries

- Frontend input is untrusted.
- JWT claims are authentication hints, not permanent authorization truth.
- Redis is the source of truth for active session state and CSRF tokens.
- SQL Server is the source of truth for user role, active status, and ownership.
- Ownership must be enforced in SQL with `WHERE` filters and joins.

## Expected Tables

The first auth path expects:

```sql
Users(
  id INT PRIMARY KEY,
  email NVARCHAR(254) UNIQUE NOT NULL,
  password_hash NVARCHAR(MAX) NOT NULL,
  role NVARCHAR(32) NOT NULL,
  is_active BIT NOT NULL
)

Pages(
  id INT PRIMARY KEY,
  user_id INT NOT NULL,
  title NVARCHAR(200) NOT NULL,
  created_at DATETIME2 NOT NULL
)

Widgets(
  id INT PRIMARY KEY,
  page_id INT NOT NULL,
  type NVARCHAR(100) NOT NULL,
  config_json NVARCHAR(MAX) NULL
)

AuditLog(
  id INT IDENTITY PRIMARY KEY,
  actor_user_id INT NULL,
  action NVARCHAR(100) NOT NULL,
  target_type NVARCHAR(100) NULL,
  target_id NVARCHAR(100) NULL,
  ip_address NVARCHAR(64) NULL,
  user_agent NVARCHAR(512) NULL,
  success BIT NOT NULL,
  metadata_json NVARCHAR(MAX) NULL,
  created_at DATETIME2 NOT NULL
)
```

## Run

```powershell
cd backend
copy .env.example .env
npm install
npm run dev
```

Use a long random `JWT_SECRET` before running outside local development.

For cookie-authenticated unsafe requests, send the authenticated session's `ztl_csrf` cookie value in the `x-csrf-token` header.

In production, login rate limiting fails closed when Redis is unavailable. In development, the limiter uses a bounded in-memory fallback to avoid blocking local work during Redis restarts.
