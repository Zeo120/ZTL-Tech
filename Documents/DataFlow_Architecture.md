# PHASR (DEVM) - Global Data Flow & Relationship Architecture

This document maps the exact flow of data through the PHASR DEVM. It has been updated to reflect the **Dynamic Module Registry** pattern, ensuring the Main Engine complies with the Open/Closed Principle (Open for extension, Closed for modification). 

## Global State Resolution Map

```mermaid
graph TD
    %% Define Data Inputs
    subgraph Data_Ingestion [Data Sources]
        Codebase[(Raw Codebase Repository)]
        Manifest[(phasr.yaml : Module Registry)]
        Internet((External DNS/OSINT))
    end

    %% Dynamic Main Engine
    subgraph Core [Main Engine Orchestration]
        Engine(Engine.c : Bare-Metal Thread Spawner)
    end

    Manifest -->|Loads Active Modules| Engine
    Codebase --> Engine

    %% Dynamic Module Execution Layer
    subgraph Modules [Dynamic Module Execution Layer]
        M1(Module 1: Access Points)
        M2(Module 2: Data Analyser)
        M3(Module 3: Anomaly Analyser)
        M4(Module 4: Security Math)
        MN(Module N: Custom Expansion)
    end

    Engine -->|Forks/Executes| M1
    Engine -->|Forks/Executes| M2
    Engine -->|Forks/Executes| M3
    Engine -->|Forks/Executes| M4
    Engine -.->|Dynamically Loads| MN
    
    Internet --> M1

    %% Orchestration / Hardware Bridge
    subgraph Bridge [Inference Bridge]
        CrossVerify(Cross-Inference State Verifier)
        ParanoiaCheck{Contradiction Check}
        WaveCollapse[Global Wave Collapse: 0 or 1]
    end

    M1 -->|State Output| CrossVerify
    M2 -->|State Output| CrossVerify
    M3 -->|State Output| CrossVerify
    M4 -->|State Output| CrossVerify
    MN -.->|State Output| CrossVerify

    CrossVerify --> ParanoiaCheck
    ParanoiaCheck --> WaveCollapse

    %% Business Logic / OCaml
    subgraph Econ [Economical Analysis Layer]
        TEC(Total Economic Cost TEC/M)
        DeployStatus[Resolution: Halt or Deploy]
    end

    %% Final Economic Routing
    WaveCollapse --> TEC
    M2 -->|Physical Mass| TEC
    M1 -->|Total Routes| TEC
    
    TEC --> DeployStatus

    %% Styling
    style WaveCollapse fill:#ff4d4d,stroke:#333,stroke-width:2px,color:#fff
    style DeployStatus fill:#4CAF50,stroke:#333,stroke-width:2px,color:#fff
    style Codebase fill:#2196F3,stroke:#333,stroke-width:2px,color:#fff
    style Manifest fill:#FF9800,stroke:#333,stroke-width:2px,color:#fff
```

## Data Relationship Breakdown

### 1. The Dynamic Ingestion (The Registry)
The C Orchestrator (`Engine.c`) no longer hardcodes modules. It ingests a manifest (`phasr.yaml`) at runtime. This registry dictates exactly which modules exist and should be executed, allowing infinite horizontal scaling of security constraints without ever needing to recompile the Core Engine.

### 2. The Isolated Scanners (M1 ... Mn)
Each module acts as a completely isolated observer of the codebase, spun up in parallel by the Main Engine.
*   **M1** maps the boundaries.
*   **M2** weighs the physical mass.
*   **M3** measures the randomness (entropy).
*   **M4** traces the data flows (Input to Execution).
*   **Mn** (Any future module dynamically loaded via the registry).

### 3. The Inference Bridge
This is the physical C++ layer that forces the isolated states to interact. It receives the outputs of `N` modules and checks for contradictions (e.g., "If M1 found no shadow endpoints, why is M2's AST depth 50 levels deep?"). If there is a contradiction, or if *any* single module in the dynamic registry returned a `0`, the Bridge executes a **Wave Collapse**, reducing the global state to `0`.

### 4. The Business Resolution
The `0` or `1` state, along with the raw physical metrics (Total Bytes, Total Endpoints), is routed to the OCaml Business Logic layer. This translates the physics into **Liability and Maintenance Costs (TEC/M)**, yielding the final executive decision: **Halt or Deploy**.
