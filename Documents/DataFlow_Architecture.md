# PHASR (DEVM) - Global Data Flow & Relationship Architecture

This document maps the exact flow of data through the PHASR DEVM. It has been updated to reflect the **Dynamic Module Registry** pattern and the **x86_64 Unrolled Assembly** hardware physics layer, including Module 5 (Temporal Physics).

## Global State Resolution Map

```mermaid
graph TD
    %% Define Data Inputs
    subgraph Data_Ingestion ["Data Sources"]
        Codebase[("Raw Codebase Repository")]
        Manifest[("phasr.yaml : Module Registry")]
        Internet(("External DNS/OSINT"))
    end

    %% CLI Service Gateway (The Dynamic Router)
    subgraph CLI ["CLI Service Gateway (phasr)"]
        Router("router.js : Physical Mass Orchestrator")
    end

    %% Dynamic Main Engine
    subgraph Core ["Hardware Engines (Dynamic Handoff)"]
        NodeEngine("V8 Node.js Engine (< 200KB)")
        CppEngine("C++ Hybrid Balancer (> 200KB)")
        AsmEngine("Pure Assembly Core (> 1GB)")
    end

    Codebase -->|Calculates Physical Mass| Router
    Router -->|Routes Payload| NodeEngine
    Router -->|Routes Payload| CppEngine
    Router -->|Routes Payload| AsmEngine
    
    Manifest -->|Loads Active Modules| CppEngine
    Manifest -->|Loads Active Modules| AsmEngine
    %% Dynamic Assembly Execution Layer
    subgraph Modules ["Hardware Physics Layer: Multi-Arch (x86_64 & ARM64)"]
        M1("M1: Access Points .asm/.s")
        M2("M2: Data Analyser .asm/.s")
        M3("M3: Anomaly Analyser .asm/.s")
        M4("M4: Security Math .asm/.s")
        M5("M5: Temporal Physics .asm/.s")
        M6("M6: Binary Dissection .asm/.s")
        MN("MN: Custom Vectorized Expansion")
    end

    CppEngine -->|Spawns Hardware Threads| M1
    CppEngine -->|Spawns Hardware Threads| M2
    CppEngine -->|Spawns Hardware Threads| M3
    CppEngine -->|Spawns Hardware Threads| M4
    AsmEngine -->|Bare-Metal _popen Recursion| M3
    AsmEngine -->|Bare-Metal _popen Recursion| M5
    AsmEngine -->|Bare-Metal _popen Recursion| M6
    CppEngine -.->|Dynamically Loads| MN
    
    Internet --> M1

    %% Orchestration / Hardware Bridge
    subgraph Bridge ["Inference Bridge"]
        CrossVerify("Cross-Inference State Verifier")
        ParanoiaCheck{"Contradiction Check"}
        WaveCollapse["Global Wave Collapse: 0 or 1"]
    end

    M1 -->|Hardware State| CrossVerify
    M2 -->|Hardware State| CrossVerify
    M3 -->|Hardware State| CrossVerify
    M4 -->|Hardware State| CrossVerify
    M5 -->|Hardware State| CrossVerify
    M6 -->|Hardware State| CrossVerify
    MN -.->|Hardware State| CrossVerify

    CrossVerify --> ParanoiaCheck
    ParanoiaCheck --> WaveCollapse

    %% Business Logic / Tradeoff Analyser
    subgraph Econ ["Module 7: Tradeoff Analyser Layer"]
        M7("M7: Tradeoff Analyser (Economic Equation)")
        DeployStatus["Resolution: Halt or Deploy"]
    end

    %% Final Economic Routing
    WaveCollapse --> M7
    M2 -->|Physical Mass| M7
    M1 -->|Total Routes| M7
    M5 -->|Timing Leak Liability| M7
    M6 -->|Hostile Instructions| M7
    
    M7 --> DeployStatus

    %% Styling
    style WaveCollapse fill:#ff4d4d,stroke:#333,stroke-width:2px,color:#fff
    style DeployStatus fill:#4CAF50,stroke:#333,stroke-width:2px,color:#fff
    style Codebase fill:#2196F3,stroke:#333,stroke-width:2px,color:#fff
    style Manifest fill:#FF9800,stroke:#333,stroke-width:2px,color:#fff
```

## Data Relationship Breakdown

### 1. The CLI Service Gateway & Ingestion
The unified `phasr` CLI (`router.js`) acts as the entry point and Service Gateway. It calculates the physical mass of the codebase and dynamically routes execution to the Node.js Engine, C++ Hybrid Balancer, or the Pure Assembly Hardware Override. These engines ingest a manifest (`phasr.yaml`) at runtime, dictating exactly which assembly modules should be executed.

### 2. The Hardware Physics Layer (M1 ... Mn)
Each module acts as a completely isolated observer of the codebase, executed as a raw binary. They are natively written in **Dual-Architecture Unrolled Assembly (x86_64 NASM and ARM64 AArch64)**. This allows the Engine to route evaluation vectors to the correct native silicon instructions (e.g., bypassing branch predictors using `CMOVG` on Intel or `CSEL` on Apple Silicon), running at literal hardware clock speed without translation crutches like Rosetta.
*   **M1** maps boundaries via unrolled SIMD string matching.
*   **M2** weighs mass via unrolled loop byte evaluation (x86 & ARM64).
*   **M3** calculates entropy using the hardware FPU `FYL2X` instruction.
*   **M4** traces data flows via bare-metal state mapping.
*   **M5** measures temporal side-channel leaks using the `RDTSC` instruction.
*   **M6** dynamically disassembles compiled artifacts to statically evaluate register manipulation.
*   **Mn** (Any future `.asm` module dynamically loaded via the registry).

### 3. The Inference Bridge
This is the layer that forces the isolated states to interact. It receives the outputs of `N` hardware modules and checks for contradictions. If there is a contradiction, or if *any* single module in the dynamic registry returned a `0`, the Bridge executes a **Wave Collapse**, reducing the global state to `0`.

### 4. The Business Resolution (Module 7)
The `0` or `1` state, along with the raw physical metrics, is routed to **Module 7 (Tradeoff Analyser)**. This translates the physics into **Absolute Financial Liability vs Maintenance Costs**, yielding the final cryptoeconomic decision: **Halt or Deploy**.
