# Satan's Recursion Architecture & Flow

This document details the architectural design, mathematical model, and execution flow of the **Satan's Recursion** curved spacetime wave solver module.

---

## 1. Metric Modulation & Multi-Wave Coupling

Satan's Recursion implements a coupled $1+1\text{D}$ wave equation on a curved spacetime grid. The metric coordinates $g^{00}$ (time dilation factor) and $g^{11}$ (space contraction factor) are dynamically altered near the center of the grid representing high energy density events (e.g., Neutron Star mergers). The amplitudes of the other four verification phases act as the energy-momentum sources altering the curvature.

```mermaid
graph TD
    P1["Phase 1 (FSM Invariants)"] --> Source["Coupled Energy-Momentum Source"]
    P2["Phase 2 (Reachability)"] --> Source
    P3["Phase 3 (Telemetry Drift)"] --> Source
    P4["Phase 4 (Chaos Controls)"] --> Source
    
    Source -->|"Modulation Factor (coupling)"| Metric["Spacetime Metric: g00 & g11"]
    Metric -->|"Curvature Warp (Schwarzschild-like)"| Wave["Covariant Wave Solver: Box_g (Psi) = 0"]
```

---

## 2. Numerical Simulation Loop

For each time step $dt$, the solver propagates the wave $\Psi(x, t)$ across the grid using finite difference approximations of the covariant D'Alembertian in curved space:

$$\frac{\partial}{\partial t} \left( \sqrt{-g} g^{00} \frac{\partial \Psi}{\partial t} \right) + \frac{\partial}{\partial x} \left( \sqrt{-g} g^{11} \frac{\partial \Psi}{\partial x} \right) = 0$$

```mermaid
flowchart TD
    Start["Step Start (t -> t + dt)"] --> Amplitude["Compute Source Amplitude: sin(0.2 * step * dt)"]
    Amplitude --> LoopGrid["Iterate Grid Cells (i = 1 to GridSize-2)"]
    
    LoopGrid --> DetG["Compute Local Metric Determinant: det(g) = g00 * g11"]
    DetG --> SqrtG["Compute sqrt(-g) for cell, next, and previous"]
    SqrtG --> SpatialDiv["Calculate Spatial Flux: term_next - term_prev"]
    SpatialDiv --> TimeUpdate["Update Amplitude: Psi_next[i] = 2*Psi[i] - Psi_prev[i] + factor * spatial_div"]
    TimeUpdate --> CheckSingularity{"Singularity Detected?"}
    
    CheckSingularity -->|"Yes"| Heal["Auto-Heal: Reset Simulation to Flat Space"]
    CheckSingularity -->|"No"| Boundary["Apply Boundaries: Node 0 = Source, Node N-1 = 0"]
    
    Heal --> Done["Step Complete"]
    Boundary --> Shift["Shift Buffers: Psi_prev = Psi, Psi = Psi_next"]
    Shift --> Done
```

---

## 3. Statically Generated Verification Flow

To run the audits, 10,000 helper functions are statically compiled. The driver executes 1,000 test cases, verifying the invariants against expected mathematical outcomes.

```mermaid
flowchart LR
    subgraph Host OS detection
        Linux["Linux (x86-64 / ARM64)"] -->|"Assembly Back-end"| Assembly["satan_linux_x64.s / satan_arm64.s"]
        Windows["Windows (MSVC)"] -->|"C++ Fallback"| Fallback["satan_recursion.cpp (inline implementations)"]
    end
    
    Assembly --> Driver["satan_recursion (C++ driver)"]
    Fallback --> Driver
    Driver -->|"Runs 1,000 cases"| AuditLoop["Evaluate 15 random audits per case"]
    AuditLoop -->|"Compare passes"| InvariantCheck{"Passed == Expected?"}
    
    InvariantCheck -->|"Pass"| IncPass["Increment passed counter"]
    InvariantCheck -->|"Fail"| IncFail["Increment failed counter"]
```

---

## 4. Video Frame & Animation Generation Flow

The simulation output can be scaled up to 1,000,000 steps and exported as a binary float sequence stream for animation rendering.

```mermaid
flowchart TD
    RunSim["Run Driver: satan_recursion --steps 1000000 --export spacetime_simulation.bin --silent"]
    RunSim -->|"Exports Raw Binary"| BinaryFile["spacetime_simulation.bin (header + 160MB data)"]
    
    BinaryFile -->|"Process in Python"| PythonScript["render_video.py"]
    PythonScript -->|"numpy.frombuffer"| Reshape["Reshape Array to (Steps, GridSize)"]
    
    Reshape -->|"Render Loop"| Matplotlib["matplotlib.animation.FuncAnimation"]
    Matplotlib -->|"Option A"| GIF["Export spacetime_simulation.gif (Pillow Writer)"]
    Matplotlib -->|"Option B"| MP4["Export spacetime_simulation.mp4 (FFMpeg Writer)"]
    Matplotlib -->|"Option C"| PNGs["Export Individual Frame Images"]
```

