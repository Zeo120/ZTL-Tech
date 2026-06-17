# Phase 8: FDTD Stability | Wave Propagation Damping & Attenuation

## 1. Target Workflow: Courant Condition Monitor
The **FDTD Stability Monitor** ensures that the simulated exploit waves (injected in Phase 6) do not result in infinite mathematical resonance that could crash the node. It enforces physical damping limits using the Courant number.

## 2. Execution Architecture

```mermaid
graph TD
    classDef wave fill:#0f172a,stroke:#f59e0b,stroke-width:2px,color:#fff
    classDef damp fill:#14532d,stroke:#22c55e,stroke-width:2px,color:#fff
    classDef block fill:#450a0a,stroke:#ff3366,stroke-width:2px,color:#fff
    
    W[Exploit Wave Injected]:::wave --> C[Calculate Courant Number 'r']:::damp
    C --> V{r <= 1.0?}:::damp
    V -->|Yes| P[Propagate Wave]:::wave
    V -->|No| D[Apply Gamma Attenuation]:::block
    D --> P
```
