# Module 5: Temporal Physics (Side-Channel Architecture)

## 1. The Mathematics (The Variance Equation)
A Timing Attack is a side-channel vulnerability where an attacker deduces the internal state of a system based on how long it takes to process a request. 

To evaluate this without guessing, DEVM relies on the **Temporal Variance Equation**:

$$ \Delta T = \left| \mu(C_{valid}) - \mu(C_{invalid}) \right| $$

**Variables:**
*   **$C$**: CPU Clock Cycles (Measured at the hardware level using the x86 `RDTSC` instruction).
*   **$\mu$**: The median CPU cycles over $N$ iterations (to filter out random operating system noise).
*   **$\Delta T$**: The absolute difference in execution time between a valid state and an invalid state.

### The Mathematical Rule (The Threshold):
Let $\epsilon$ be the physical limit of network noise (usually ~5,000 CPU cycles).
If $\Delta T > \epsilon$, the application is mathematically leaking its internal state through time. 
**Result: State Collapse (0).**

---

## 2. Intent
Standard security scanners completely fail against Timing Attacks. A scanner looks at this code:
```javascript
if (user.password === inputPassword) { return true; }
```
And says "Looks fine." But physically, string comparison exits early if the first letter is wrong. This means a wrong first letter takes 100 CPU cycles, but a correct first letter takes 200 CPU cycles. An attacker measures this to brute-force passwords one letter at a time.

**The Intent of Module 5** is to drop below the code logic and measure the literal physics of the CPU executing that code. If the CPU takes longer to process path A than path B, it is an absolute physical vulnerability, and deployment must be halted.

---

## 3. Architecture
To measure temporal physics, Module 5 is implemented as a **Bare-Metal CPU Profiler**.

1.  **Hardware Hook**: The module executes the x86_64 `RDTSC` (Read Time-Stamp Counter) instruction before and after a critical function to capture the exact CPU clock cycle.
2.  **Dynamic Fuzzing**: The module feeds the function a known *Valid* state and a known *Invalid* state 1,000 times each.
3.  **Statistical Smoothing**: It calculates the median ($\mu$) cycles for both states to drop outliers caused by random OS background tasks.
4.  **Wave Collapse**: If the absolute difference ($\Delta T$) is greater than the safety threshold, the pipeline is halted.

```mermaid
graph TD
    A[Function Execution] --> B[Inject Valid State]
    A --> C[Inject Invalid State]
    
    B --> D[RDTSC: Measure Cycles]
    C --> E[RDTSC: Measure Cycles]
    
    D --> F[Calculate Median μ Valid]
    E --> G[Calculate Median μ Invalid]
    
    F --> H{Is |μ_Valid - μ_Invalid| > Threshold?}
    G --> H
    
    H -- Yes --> I[State = 0 Wave Collapse]
    H -- No --> J[State = 1 Safe]
```

---

## 4. Trade-Offs

### Advantages (Pros)
*   **Invisible Threat Detection**: Mathematically proves the existence of vulnerabilities that are entirely invisible to static code analysis and standard security tools.
*   **Hardware Precision**: Evaluates the code based on the physical reality of the silicon, not human assumptions.

### Disadvantages (Cons)
*   **Operating System Noise**: The biggest challenge of temporal physics is OS context switching. If the Windows/Linux kernel decides to pause the Engine thread to allocate memory for Google Chrome precisely when Module 5 is running, the CPU cycles will spike by 500,000, creating a massive false positive. This requires intense statistical smoothing and hardware thread pinning to mitigate.
*   **Constant-Time Overhead**: Forcing developers to write "Constant-Time" code to fix these leaks usually requires them to use unoptimized algorithms (like comparing the entire string even after a mismatch), which slows down the application globally.

---

## 5. Integration with Current Architecture (DEVM)

Module 5 integrates flawlessly into the established architecture thanks to the **Dynamic Module Registry**.

1.  **The Registry (`phasr.yaml`)**: Module 5 has been appended to the global manifest (`- path: "./Module5_TemporalPhysics"`).
2.  **The Engine (`Engine.c`)**: When the pure C orchestrator boots, it parses the YAML file and dynamically spawns a hardware thread to execute `TemporalScanner.asm`. The Engine does not require recompilation to absorb this new physical constraint.
3.  **The Inference Bridge**: The `0` or `1` state output from Module 5 is passed to the Bridge. If Module 5 detects a Timing Leak (State = 0), the Bridge immediately triggers a **Global Wave Collapse**, ensuring the Side-Channel vulnerability blocks the entire deployment pipeline.
4.  **The Economics (OCaml)**: A temporal leak represents an extreme liability (mass data exfiltration). The economic layer assigns a massive dollar penalty to the TEC/M equation for this specific anomaly.
