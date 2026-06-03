# PHASR Intern Onboarding: The Complete Architecture Guide

Welcome to the **PHASR** (Predictive Heuristic Attack Surface Reconnaissance) team. 

This document is designed to take you from zero to fully understanding how this massive, mathematically-driven security engine works. Read this carefully before touching the codebase.

---

## 1. What is PHASR?

At its core, PHASR is an automated, high-assurance security auditor. Instead of relying on simple regular expressions or known signature databases (like an antivirus), PHASR uses **pure mathematics, physics simulations, and Turing State Machines** to prove whether a codebase is secure or vulnerable.

Our philosophy is: *Security is a mathematical proof. If a vulnerability exists, it can be modeled, simulated, and blocked.*

---

## 1. The Epistemology of PHASR (Why We Build This Way)

To work on PHASR, you must first unlearn standard web security. We do not use regex to find SQL injection. We do not use signature databases to find malware. We do not use AI heuristics that "guess" if behavior is bad.

**PHASR is built on Formal Verification and Computational Physics.** 

Why? Because of the **Halting Problem**. In 1936, Alan Turing proved it is mathematically impossible to write a program that can analyze any arbitrary program and determine if it will eventually halt or run forever. By extension, it is impossible to write a general scanner that finds all vulnerabilities in Turing-Complete languages (like JavaScript or C++). 
To bypass this mathematical impossibility, PHASR forces the application's logic down into a **Deterministic Finite Automaton (DFA)**—a state machine that is *not* Turing-complete. We can mathematically prove a DFA's behavior 100% of the time. 

---

## 2. The Native Tech Stack: V8, C++, and Assembly

Our stack is designed around **Zero-Copy Memory Execution** and **V8 Isolate Concurrency**.

1.  **Node.js (The Traffic Controller)**: Handles the I/O event loop. It routes HTTP traffic. 
2.  **Worker Threads (V8 Isolates)**: Node.js is single-threaded. If you run an $O(V^3)$ matrix multiplication on the main thread, the server freezes. Worker Threads spawn entirely separate V8 JavaScript engines (Isolates) in memory to run heavy graph math across multiple CPU cores without blocking the API.
3.  **C++ N-API Bridge (`node-addon-api`)**: JavaScript is garbage-collected; it pauses execution to clean memory. For Phase 5 mitigations, this latency is unacceptable. N-API allows us to allocate a raw `ArrayBuffer` in JavaScript, pass the raw memory pointer into C++, and execute it instantly without copying the data.
4.  **x86-64/ARM64 Assembly**: The lowest level of the system. The C++ bridge jumps execution directly into native machine code to process the DFA state transitions.

---

## 3. The 5 Mathematical Phases (The Absolute Deep Dive)

### Phase 1: Acherons Gate (AST Parsing & Graph Traversal)
*   **The Mechanism:** Source code is parsed into an Abstract Syntax Tree (AST), a Directed Acyclic Graph (DAG) of the program's logic.
*   **Traversal Algorithms:** We use **Depth-First Search (DFS)** to trace data flows from user input (sources) to dangerous functions (sinks).
*   **Cyclomatic Complexity:** We calculate $M = E - N + 2P$ (Edges - Nodes + Connected Components) for every function. If complexity exceeds mathematical thresholds, the function is flagged as inherently un-auditable.

### Phase 2: Nine Circles (Reachability & Sparse Matrices)
*   **The Mechanism:** Finding privilege escalation paths using Adjacency Matrices $A$.
*   **The Math (Warshall's Algorithm):** 
    $$ R^{(k)}_{i,j} = R^{(k-1)}_{i,j} \lor (R^{(k-1)}_{i,k} \land R^{(k-1)}_{k,j}) $$
    *   **$R^{(k)}_{i,j}$**: Boolean (1 or 0) indicating a path from $i \to j$.
*   **V8 Optimization (Sparse Matrices):** An enterprise application might have 100,000 routes. A $100,000 \times 100,000$ matrix requires 10GB of RAM. Because most routes don't connect, the matrix is *sparse* (mostly zeros). We represent this in V8 using adjacency lists (Maps of Sets) to compute Warshall's Algorithm without blowing the memory heap.

### Phase 3: Brimstone Drift (Axiomatic Assumptions)
*   **The Math (Trust Boundaries):** A Trust Boundary $T_B$ is defined mathematically:
    $$ T_B = \{ (u, v) \in E \mid C(u) \neq C(v) \} $$
    *   **$C(u), C(v)$**: Clearance levels. If $u$ is public and $v$ is admin, the edge crossing them is a trust boundary.
    If a path from Phase 2 crosses $T_B$ without traversing an isolated input validation node, the application's security axioms are mathematically void.

### Phase 4: Abaddons Chasm (The Physics of Exploits)
*   **The Mechanism:** Finding the optimal exploit path is NP-Hard (equivalent to the Traveling Salesman Problem with constraints). We solve it heuristically using the **Yee Algorithm** for Maxwell's equations.
*   **The Math (FDTD Wave Equations):** We treat the software graph as a 2D electromagnetic grid. An exploit payload is an electrical wave $E_z$.
    $$ E_z^{n+1}(i,j) = E_z^n(i,j) + \frac{\Delta t}{\epsilon} \left( \frac{H_y^{n+0.5}(i,j) - H_y^{n+0.5}(i-1,j)}{\Delta x} - \dots \right) $$
    *   **$\epsilon$ (Permittivity)**: The "resistance" of a node. A Web Application Firewall (WAF) node has high permittivity, slowing down or absorbing the wave.
*   **Stability (The CFL Condition):** 
    $$ \Delta t \le \frac{1}{c \sqrt{\frac{1}{\Delta x^2} + \frac{1}{\Delta y^2}}} $$
    If the time step $\Delta t$ is too large, the simulation explodes (numerical dispersion). The wave cannot propagate faster than one grid cell per tick.
*   **Boundary Conditions (PML):** We apply Perfectly Matched Layers (PML) to the edges of the simulation grid to absorb the waves, preventing exploits from "bouncing" off the edge of the software graph and creating infinite feedback loops.

### Phase 5: Legions Consensus (The Assembly DFA)
*   **The Mechanism:** The exploit path is blocked by a Deterministic Finite Automaton (DFA) deployed in Assembly.
*   **The System V ABI:** When C++ calls our Assembly, it uses the Application Binary Interface rules. The first argument (the DFA State Pointer) goes into the `RDI` register. The second argument (the Signal Tape Pointer) goes into `RSI`.
*   **Instruction Pipeline:**
    ```assembly
    mov r8b, byte [rsi]    ; Load the next signal from the tape
    cmp r8b, SIG_INVALID   ; Compare against anomalous signal
    je .halt_q9            ; Jump directly to the Reject State
    ```
    The State Transition Table is stored in the `.rodata` (read-only) section of the binary to prevent L1 cache misses, allowing transitions in $<1$ nanosecond.

---

## 4. TBAIS (Turing-Based Anomaly Interception System)

TBAIS is a live, 10-state Turing Machine $M = (Q, \Sigma, \delta, q_0, F)$ defending the authentication layer.

### Information Theory & Shannon Entropy
How do we calculate the **Trust Confidence Score ($T_c$)** to distinguish a human from an automated exploit script? We use Shannon Entropy over a temporal vector $T = [t_1, t_2, \dots, t_n]$.
$$ H(X) = - \sum_{i=1}^{n} P(x_i) \log_2 P(x_i) $$
*   **$H(X)$**: Total entropy.
*   **$P(x_i)$**: The probability of a specific keystroke interval or network delay occurring naturally.
Scripts operate with zero variance (low entropy) or extreme pseudo-randomness (high entropy). If $H(X)$ diverges from the human baseline, $T_c$ drops.

### The Architecture of a Turing Halt ($q_9$)
1.  **State Collapse:** If $T_c$ falls too low, the $\delta$ function transitions to $q_9$.
2.  **Telemetry:** The C++ bridge returns the $q_9$ pointer to the Node.js event loop.
3.  **Real-Time Push (SSE):** Node.js emits the event down the **Server-Sent Events** HTTP connection. SSE uses a long-lived `keep-alive` TCP socket, resulting in zero handshake overhead compared to WebSockets.
4.  **Execution:** The Admin Dashboard updates instantly, isolating the attacker.

---

## 5. Architectural Golden Rules for Interns

1.  **Never Block the Event Loop:** Node.js is a single-threaded traffic controller. If you need to do heavy math (like parsing ASTs or running matrix calculations), you MUST dispatch it to `queue.service.js` which sends it to a background **Worker Thread**.
2.  **No Unnecessary Dependencies:** If you can build it with native Node APIs (`node:test`, `EventEmitter`, `worker_threads`), do not install a package. We do not use Jest, Mocha, Redis, or Socket.io. Keep `package.json` clean. This reduces the attack surface of our own tool.
3.  **Trust the Math:** If you are writing a security check, ask yourself: *"Can this be mathematically proven as a state transition?"* If it requires "guessing" or "heuristics", it belongs in the trash. PHASR operates on mathematical certainty.

---

### Your First Tasks
If you are just starting, familiarize yourself with:
1.  `backend/src/services/tbais.service.js` (Understand the DFA transition logic).
2.  `backend/tests/unit/tbais.service.test.js` (See how we natively test the logic).
3.  `admin.routes.js` (Look at the `/api/admin/events` SSE endpoint).
