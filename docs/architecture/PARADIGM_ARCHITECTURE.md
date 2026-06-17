# Paradigm SaaS Architecture

This diagram maps out the core request lifecycle, security middleware, and data persistence layers of the Paradigm backend ecosystem.

```mermaid
graph TD
    %% Entities
    Client["Client / Paradigm Frontend"]
    Network["Internet"]
    
    %% Paradigm Backend Core
    subgraph "Paradigm Node.js / Express Server"
        CustomLogger["Zero-Dependency Logger"]
        SecurityHeaders["Security Headers & CSP"]
        Blackhole["Honeypot Blackhole Router"]
        
        subgraph "Authentication & Integrity"
            Auth["Auth Middleware (Session-to-Device)"]
            RateLimit["IP Rate Limiter"]
            CSRF["Anti-CSRF Validator"]
        end
        
        subgraph "Application Routing"
            AdminAPI["Admin API (CRM/Payroll/HR)"]
            EmpAPI["Employee API (Portal/Attendance)"]
            GridAPI["Grid API (Compute/Offload)"]
        end
        
        subgraph "Internal Services"
            CryptoVault["CryptoVault (AES-GCM PII Encryption)"]
            MailDaemon["Native SMTP Daemon"]
            Audit["Audit Logging Service"]
        end
    end
    
    %% Databases
    subgraph "Data & State Persistence"
        Redis[("Redis (Sessions & Lockouts)")]
        MSSQL[("MSSQL (Enterprise Database)")]
    end

    %% Flow
    Client -->|HTTPS / WSS| Network
    Network --> CustomLogger
    CustomLogger --> SecurityHeaders
    SecurityHeaders --> Blackhole
    
    Blackhole -->|"Valid Routes"| RateLimit
    Blackhole -->|"Scanners (/.env)"| Redis
    
    RateLimit --> CSRF
    CSRF --> Auth
    
    Auth <-->|"Validate Session & Device Hash"| Redis
    
    Auth --> AdminAPI
    Auth --> EmpAPI
    Auth --> GridAPI
    
    AdminAPI --> CryptoVault
    EmpAPI --> CryptoVault
    
    CryptoVault <-->|"Encrypt/Decrypt PII"| MSSQL
    AdminAPI --> MailDaemon
    EmpAPI --> Audit
    
    AdminAPI --> MSSQL
    EmpAPI --> MSSQL
    GridAPI --> MSSQL
```

## Architecture Highlights
- **Honeypot Blackhole:** Scanners are immediately dropped and their IPs blacklisted in Redis.
- **Session-to-Device Binding:** `Auth Middleware` cryptographically ties the session token to the user's IP and User-Agent.
- **PII CryptoVault:** The application layer performs AES-256-GCM encryption before data touches MSSQL.
- **Zero-Dependency Core:** Features like logging and the SMTP Daemon are built on top of native Node.js APIs to eliminate supply chain vulnerabilities.
