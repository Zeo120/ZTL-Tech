# PHASR (DEVM) - Global Data Flow & Relationship Architecture

This document maps the exact flow of data through the 4 Pillars of the DEVM and how the isolated states mathematically interact to form the final Total Economic Cost (TEC/M) and Deployment Status.

## Global State Resolution Map

```mermaid
graph TD
    %% Define Data Inputs
    subgraph Data_Ingestion [External & Internal Data Sources]
        Codebase[(Raw Codebase Repository)]
        Internet((External DNS/OSINT))
    end

    %% Module 1: Access Points
    subgraph M1 [Module 1: Access Point Matrix]
        M1_AutoDiscover(Domain Auto-Discovery)
        M1_OSINT(External OSINT Scanner)
        M1_Official(Official Route Scanner)
        M1_Shadow(Shadow Route Scanner)
        
        M1_AutoDiscover -.-> M1_OSINT
    end

    %% Module 2: Data Analyser
    subgraph M2 [Module 2: Data Analyser]
        M2_Mass(Physical Mass Calculation)
        M2_AST(AST / Structural Depth)
    end

    %% Module 3: Anomaly Analyser
    subgraph M3 [Module 3: Anomaly Analyser]
        M3_Window(128-Byte Sliding Window)
        M3_Entropy(Shannon Entropy Hx)
        M3_Collapse{Hx >= 5.8?}
    end

    %% Module 4: Security Math (Taint/Data Flow)
    subgraph M4 [Module 4: Security Math]
        M4_Input(Track Input State A)
        M4_DB(Track DB Exec State B)
        M4_Sanitize(Track Sanitization State C)
        M4_Equation{A + B without C?}
    end

    %% Orchestration / Hardware Bridge
    subgraph Bridge [Orchestrator: Inference Bridge]
        CrossVerify(Cross-Inference Verifier)
        ParanoiaCheck{Contradiction? M1 vs M2}
        WaveCollapse[State Wave Collapse: 0 or 1]
    end

    %% Business Logic / OCaml
    subgraph Econ [Module 4: Economical Analysis]
        TEC(Total Economic Cost TEC/M)
        DeployStatus[Deployment Resolution: Halt or Deploy]
    end

    %% Wiring the Data Flow
    Codebase --> M1_AutoDiscover
    Codebase --> M1_Official
    Codebase --> M1_Shadow
    Internet --> M1_OSINT

    Codebase --> M2_Mass
    Codebase --> M2_AST

    Codebase --> M3_Window
    M3_Window --> M3_Entropy
    M3_Entropy --> M3_Collapse

    Codebase --> M4_Input
    Codebase --> M4_DB
    Codebase --> M4_Sanitize
    M4_Input --> M4_Equation
    M4_DB --> M4_Equation
    M4_Sanitize --> M4_Equation

    %% Routing to the Bridge
    M1_Official --> CrossVerify
    M1_Shadow --> CrossVerify
    M2_Mass --> CrossVerify
    M2_AST --> CrossVerify
    M3_Collapse -- "0 = Anomaly" --> CrossVerify
    M4_Equation -- "0 = Taint Flow" --> CrossVerify

    %% Bridge Resolution
    CrossVerify --> ParanoiaCheck
    ParanoiaCheck --> WaveCollapse

    %% Final Economic Routing
    WaveCollapse --> TEC
    M2_Mass --> TEC
    M1_Official --> TEC
    M1_Shadow --> TEC
    
    TEC --> DeployStatus

    %% Styling
    style WaveCollapse fill:#ff4d4d,stroke:#333,stroke-width:2px,color:#fff
    style DeployStatus fill:#4CAF50,stroke:#333,stroke-width:2px,color:#fff
    style Codebase fill:#2196F3,stroke:#333,stroke-width:2px,color:#fff
```

## Data Relationship Breakdown

### 1. The Inputs
The system ingests two absolute realities: the **Raw Source Code** and the **External Internet** footprint.

### 2. The Isolated Scanners (M1, M2, M3, M4)
Each module acts as a completely isolated observer of the codebase. 
*   **M1** maps the boundaries.
*   **M2** weighs the physical mass.
*   **M3** measures the randomness (entropy).
*   **M4** traces the data flows (Input to Execution).

### 3. The Orchestration Bridge
This is the physical C++ layer that forces the isolated states to interact. It receives the array of endpoints (M1) and the structural depth (M2) and checks for contradictions (e.g., "If M1 found no shadow endpoints, why is M2's AST depth 50 levels deep?"). If there is a contradiction, or if any module returned a `0`, the Bridge executes a **Wave Collapse**, reducing the entire state of the codebase to `0`.

### 4. The Business Resolution
The `0` or `1` state, along with the raw physical metrics (Total Bytes, Total Endpoints), is routed to the OCaml Business Logic layer. This translates the physics into **Liability and Maintenance Costs (TEC/M)**, yielding the final executive decision: **Halt or Deploy**.
