# PHASR — Mathematical Equations, Derivations & Intent

> **Scope.** Every equation implemented across the six PHASR modules is catalogued here with:
> its **mathematical origin**, its **step-by-step derivation**, the **exact constants used in code**,
> and the **security intent** it enforces at runtime.
>
> Source files referenced: `Phase-1/phase_fsm.c`, `Phase-2/reachability_engine.cpp`,
> `Phase-3/telemetry_collector.c`, `Phase-4/chaos_verifier.cpp`,
> `Phase-5/consensus_auditor.c`, `Satan-Recursion/satan_recursion.cpp`

---

## Table of Contents

| # | Equation | Phase | Score |
|---|----------|-------|-------|
| 1 | [FSM Prerequisite Bitmask Transition Guard](#1-fsm-prerequisite-bitmask-transition-guard) | Phase 1 | — |
| 2 | [Undamped Driven Wave — Heartbeat Simulation](#2-undamped-driven-wave--heartbeat-simulation) | Phase 1 | — |
| 3 | [Warshall Reachability Closure](#3-warshall-reachability-closure) | Phase 2 | $D_H$ |
| 4 | [Damped Wave — Boundary Propagation](#4-damped-wave--boundary-propagation) | Phase 2 | — |
| 5 | [Telemetry Invariant Product Score](#5-telemetry-invariant-product-score) | Phase 3 | $D_A$ |
| 6 | [Mitigation Coverage Min-Product Score](#6-mitigation-coverage-min-product-score) | Phase 4 | $D_S$ |
| 7 | [Driven Exploit Wave — Control Bypass Simulation](#7-driven-exploit-wave--control-bypass-simulation) | Phase 4 | — |
| 8 | [Penalised Replication-Lag Resilience Score](#8-penalised-replication-lag-resilience-score) | Phase 5 | $D_R$ |
| 9 | [FDTD Discretisation of the General Damped Wave Equation](#9-fdtd-discretisation-of-the-general-damped-wave-equation) | All | — |
| 10 | [CFL Stability Criterion](#10-cfl-stability-criterion) | All | — |
| 11 | [Covariant D'Alembertian in 1+1D Curved Spacetime](#11-covariant-dalembert-operator-in-11d-curved-spacetime) | Satan's Recursion | — |
| 12 | [Metric Modulation via Telemetry Coupling](#12-metric-modulation-via-telemetry-coupling) | Satan's Recursion | — |
| 13 | [Carter's Constant — Kerr Geodesic Invariant](#13-carters-constant--kerr-geodesic-invariant) | Satan's Recursion | — |
| 14 | [Kerr Metric Coefficients in Boyer-Lindquist Coordinates](#14-kerr-metric-coefficients-in-boyer-lindquist-coordinates) | Satan's Recursion | — |

---

## 1. FSM Prerequisite Bitmask Transition Guard

### Origin
Classical finite-state machine theory. Encodes legal state progressions as a
**64-bit bitmask prerequisite check** implemented entirely in hand-written x86-64 / ARM64 assembly.

### Security Intent
The Phase-1 FSM validator enforces a strict, linear execution order across eight security
lifecycle states. Every state advance requires that the **exact prerequisite bit for that
transition** is already set in the caller's 64-bit prerequisite register. This makes it
physically impossible for any code path to skip a phase or re-enter a phase out of sequence —
the assembly gates reject any such query with a hard `0` return.

**States** (`fsm_state_t`, `phase_fsm.c` line 25):

| Bit index | State | Value |
|-----------|-------|-------|
| 0 | `PREREQ_CONTRACT_SIGNED` | `1ULL << 0` |
| 1 | `PREREQ_DISCOVERY_COMPLETE` | `1ULL << 1` |
| 2 | `PREREQ_DOCS_COMPLETE` | `1ULL << 2` |
| 3 | `PREREQ_COOKIES_VERIFIED` | `1ULL << 3` |
| 4 | `PREREQ_NETWORK_VERIFIED` | `1ULL << 4` |
| 5 | `PREREQ_AUTH_MAPPED` | `1ULL << 5` |
| 6 | `PREREQ_REPORT_GENERATED` | `1ULL << 6` |

### Mathematical Formulation

For a query $(C, N, P)$ where $C$ is the current state, $N$ is the requested next state,
and $P \in \mathbb{Z}_{64}$ is the 64-bit prerequisite bitmask:

$$\text{prereq\_bit}(N) = \begin{cases} N - 1 & \text{if } N > 0 \\ 0 & \text{if } N = 0 \end{cases}$$

**Transition validity:**

$$\text{Valid}(C, N, P) = \begin{cases} 1 & \text{if } N = 0 \quad \text{(reset — always legal)} \\ 0 & \text{if } N \neq C + 1 \quad \text{(out-of-sequence — always blocked)} \\ \left\lfloor \dfrac{P \;\&\; \left(1 \ll \text{prereq\_bit}(N)\right)}{1 \ll \text{prereq\_bit}(N)} \right\rfloor & \text{if } N = C + 1 \end{cases}$$

The last case extracts a single bit: if bit `prereq_bit` is set in $P$ the result is `1`
(allowed); if clear the result is `0` (blocked).

### Derivation
The bitmask formula is equivalent to the Boolean expression:

$$\text{Valid} = \mathbb{1}\!\left[P \;\&\; \left(1 \ll (N-1)\right) \neq 0\right]$$

where $\mathbb{1}[\cdot]$ is the Iverson bracket. This is implemented directly in MASM as a
`BT` (bit-test) instruction operating on register `r8` (prerequisite), with the bit index
derived from `rdx` (next state):

```asm
; Pseudo-code of assembly gate (fsm_validator.asm)
cmp  rdx, 0           ; if next_state == 0 → reset
je   allow
lea  rcx, [rdx - 1]   ; prereq_bit = next_state - 1
bt   r8, rcx          ; test bit prereq_bit in prerequisites
jnc  block            ; if not set → block
allow: mov eax, 1 ; ret
block: mov eax, 0 ; ret
```

### Code Constants (`phase_fsm.c`)
| Constant | Value | Meaning |
|----------|-------|---------|
| `NUM_STATES` | 8 | States 0–7 |
| `NUM_HELPERS` | 4,500 | Static assertion functions |
| `NUM_TESTS` | 2,200 | Generated test cases |

---

## 2. Undamped Driven Wave — Heartbeat Simulation

### Origin
1D scalar wave equation with a spatially-localised harmonic source term, discretised
using the **Finite-Difference Time-Domain (FDTD)** method.

### Security Intent
Continuous telemetry heartbeats in Phase 1 are modelled as a wave propagating across a
discrete spatial grid. A flat or absent wave indicates a stalled or dead subsystem;
a growing unbounded wave indicates numerical instability that triggers an auto-heal reset.
The driven source at the grid midpoint represents an external query signal.

### Continuous Equation

$$\frac{\partial^2 \Phi}{\partial t^2} - v^2 \frac{\partial^2 \Phi}{\partial x^2} = A \cdot \delta(x - x_s) \cdot \sin(\omega t)$$

where $\delta(x - x_s)$ localises the source at $x_s = \lfloor N/2 \rfloor$.

### Code Constants (`phase_fsm.c`)
| `#define` | Value | Physical meaning |
|-----------|-------|-----------------|
| `WAVE_GRID_SIZE` | 40 | Spatial grid cells $N$ |
| `WAVE_COURANT` | 0.5 | Courant number $r = v\Delta t / \Delta x$ |
| `WAVE_OMEGA` | 0.2 | Source angular frequency $\omega$ (rad/step) |
| `dt` (runtime) | 0.1 | Time step $\Delta t$ |
| Source amplitude | ×10.0 | $A$ — source strength multiplier |

### Discrete Update Rule
From the FDTD derivation (see §9), with $\gamma = 0$ (no damping):

$$\Phi_i^{n+1} = 2\Phi_i^n - \Phi_i^{n-1} + r^2 \left(\Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n\right)$$

Source injection at $i = x_s$ after the spatial loop:

$$\Phi_{x_s}^{n+1} \mathrel{+}= \Delta t^2 \cdot \sin(\omega \cdot n \Delta t) \cdot 10.0$$

Boundary conditions (Dirichlet): $\Phi_0^n = \Phi_{N-1}^n = 0$ at all times.

---

## 3. Warshall Reachability Closure

### Origin
Roy–Warshall algorithm (1959/1962). Computes the transitive closure of a directed
graph using an $O(n^3)$ triple-nested loop (optimised to bitwise row-OR for 16-node graphs).

### Security Intent
Phase 2 audits the privilege graph $G = (V, E)$ with $|V| = 16$ nodes representing
access boundaries. The **Boundary Attestation Score** $D_H$ is `1` only when no path
exists from any untrusted node to any secure-enclave node. If a path exists, $D_H = 0$
and a privilege-path-leak alert is raised.

**Node partition:**

| Tier | Nodes | Bit-range |
|------|-------|-----------|
| Untrusted | 0–7 | bits 0–7 of `uint16_t` row |
| Transit | 8–11 | bits 8–11 |
| Secure Enclave | 12–15 | bits 12–15 |

### Mathematical Formulation

Let $A \in \{0,1\}^{16\times16}$ be the adjacency matrix where $A_{ij}=1$ iff edge $i \to j$
exists. Initialise the reachability matrix with self-loops:

$$R^{(0)} = A \lor I$$

Apply the Warshall recurrence for $k = 0, 1, \ldots, 15$:

$$R_{ij}^{(k+1)} = R_{ij}^{(k)} \lor \left(R_{ik}^{(k)} \land R_{kj}^{(k)}\right)$$

After $n=16$ passes, $R_{ij} = 1$ iff a directed path of length $\geq 0$ exists from $i$ to $j$.

### Boundary Attestation Score

$$D_H = 1 - \max_{\substack{s \in \{0,\ldots,7\} \\ o \in \{12,13,14,15\}}} R_{so}$$

$$D_H = \begin{cases} 1 & \text{Secure enclaves topologically isolated (Pass)} \\ 0 & \text{Privilege path leak detected (Fail / Block)} \end{cases}$$

### Derivation of the Bitwise Optimisation
Because rows are stored as `uint16_t` (16 bits), the inner loop over $j$ collapses
to a single bitwise OR:

```cpp
// reachability_engine.cpp — compute_reachability_fallback()
for (int k = 0; k < NUM_NODES; k++) {       // pivot
    uint16_t row_k = reachability[k];
    for (int i = 0; i < NUM_NODES; i++) {
        if (reachability[i] & (1 << k))     // can i reach k?
            reachability[i] |= row_k;        // then i can reach everything k reaches
    }
}
```

This is $O(n^2)$ word operations for a 16-node graph, equivalent to the full $O(n^3)$
element-wise algorithm but vectorised to a 16-bit word width.

### Code Constants (`reachability_engine.cpp`)
| Constant | Value | Meaning |
|----------|-------|---------|
| `NUM_NODES` | 16 | Graph vertex count $\|V\|$ |
| `NUM_HELPERS` | 4,500 | Static boundary audit functions |
| `NUM_TESTS` | 1,000 | Generated reachability test cases |

---

## 4. Damped Wave — Boundary Propagation

### Origin
1D damped scalar wave equation. In Phase 2, propagation speed and attenuation
model how an access-boundary violation signal radiates across the privilege graph.

### Security Intent
High damping ($\gamma = 0.4$) ensures that a localised boundary probe attenuates rapidly
and does not flood the entire graph topology. If damping were zero or negative,
numerical simulations would diverge — the auto-heal circuit detects this and resets the
wave grid, preventing NaN / Inf pollution from affecting attestation scores.

### Continuous Equation

$$\frac{\partial^2 \Phi}{\partial t^2} + \gamma \frac{\partial \Phi}{\partial t} - v^2 \frac{\partial^2 \Phi}{\partial x^2} = A \cdot \delta(x - x_s) \cdot \sin(\omega t)$$

### Discrete Update Rule (from §9 with $\gamma > 0$)

$$\Phi_i^{n+1} = \frac{1}{1 + \frac{\gamma \Delta t}{2}} \left[ 2\Phi_i^n - \Phi_i^{n-1}\!\left(1 - \frac{\gamma \Delta t}{2}\right) + r^2 \!\left(\Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n\right) \right]$$

In code (`reachability_engine.cpp`):

```cpp
float denom      = 1.0f + (WAVE_GAMMA * dt / 2.0f);
float inv_denom  = 1.0f / denom;
float prev_coeff = 1.0f - (WAVE_GAMMA * dt / 2.0f);
phi_next[i] = inv_denom * (2.f*phi[i] - phi_prev[i]*prev_coeff + r2*laplacian);
```

### Code Constants (`reachability_engine.cpp`)
| `#define` | Value | Physical meaning |
|-----------|-------|-----------------|
| `WAVE_GRID_SIZE` | 40 | Grid cells |
| `WAVE_COURANT` | 0.5 | Courant number $r$ |
| `WAVE_GAMMA` | 0.4 | Damping coefficient $\gamma$ |
| `WAVE_OMEGA` | 0.2 | Source frequency $\omega$ |

---

## 5. Telemetry Invariant Product Score

### Origin
Boolean product / conjunction of interval checks, generalised from formal safety-monitor
literature (Rushby 1994 — "Formal Methods and the Certification of Critical Systems").

### Security Intent
Phase 3 continuously monitors $K = 4{,}500$ telemetry invariants drawn from live eBPF sensor
data (syscall counts, open file descriptors, TCP connections, etc.). The **Invariant Attestation
Score** $D_A$ is exactly `1` only when **every single** invariant is within bounds.
A single out-of-range metric drives $D_A$ to `0` and triggers immediate escalation, giving
zero tolerance for partial compliance.

### Mathematical Formulation

Let $X_j$ be the current measured value of telemetry parameter $j$, and let $[L_k, U_k]$
be the safety interval for invariant $k$ targeting parameter $j(k)$:

$$\text{Inv}_k = \mathbb{1}\!\left[L_k \leq X_{j(k)} \leq U_k\right] = \begin{cases} 1 & \text{in bounds} \\ 0 & \text{out of bounds} \end{cases}$$

**Invariant Attestation Score:**

$$\boxed{D_A = \prod_{k=0}^{4499} \text{Inv}_k}$$

| $D_A$ | Interpretation |
|-------|----------------|
| $1$ | Every metric within safe bounds — Pass |
| $0$ | At least one bound violated — Fail / Escalate |

### Derivation
The product of binary variables $\{0,1\}$ is the Boolean AND over all $k$:

$$D_A = \bigwedge_{k=0}^{4499} \text{Inv}_k$$

A single `0` term collapses the entire product to `0` regardless of all other terms.
This is stronger than a threshold or averaging approach — no "good" metrics can
compensate for a single bad one.

### Phase-3 Telemetry Wave — Cascading Decay Model

Beyond the invariant score, Phase 3 runs a **damped FDTD wave simulation** to model
how a detected telemetry anomaly propagates and decays across the monitoring grid.
The source is a cosine-modulated heartbeat at the left boundary:

$$\frac{\partial^2 \Phi}{\partial t^2} + \gamma_A \frac{\partial \Phi}{\partial t} - v^2 \frac{\partial^2 \Phi}{\partial x^2} = 0, \qquad \Phi(0,t) = \cos(\omega t)$$

The Crank-Nicolson update (from §9 with $\gamma = \gamma_A$) reads:

$$\Phi_i^{n+1} = \frac{2\Phi_i^n - \Phi_i^{n-1}\left(1 - \frac{\gamma_A\Delta t}{2}\right) + r^2\left(\Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n\right)}{1 + \frac{\gamma_A\Delta t}{2}}$$

**Telemetry struct** (`telemetry_collector.c`):
```c
typedef struct {
    uint64_t syscall_count;     // eBPF hook count
    uint64_t net_packets;       // network packet rate
    float    cpu_usage_pct;     // CPU utilisation
    uint64_t memory_mb;         // resident memory
    uint64_t disk_read_bytes;   // I/O read throughput
    uint64_t disk_write_bytes;  // I/O write throughput
    uint32_t open_fds;          // open file descriptors
    uint32_t active_tcp_conns;  // active TCP connections
} telemetry_event_t;
```

**Ring buffer pointer arithmetic** (capacity = 256 entries):

$$\text{head}_{n+1} = (\text{head}_n + 1) \bmod 256 \qquad \text{tail}_{n+1} = (\text{tail}_n + 1) \bmod 256$$

**Code Constants (`telemetry_collector.c`):**

| `#define` | Value | Meaning |
|-----------|-------|---------|
| `WAVE_GRID_SIZE` | 40 | Grid cells |
| `WAVE_COURANT` | 0.5 | Courant $r$ |
| `WAVE_GAMMA` | **0.3** | Damping $\gamma_A$ (anomaly attenuation) |
| `WAVE_OMEGA` | 0.2 | Source frequency $\omega$ |
| `RING_BUFFER_SIZE` | 256 | Telemetry ring buffer capacity |
| `NUM_INVARIANTS` | 4,500 | Invariant check functions |
| `NUM_TEST_CASES` | 500 | Generated test cases |

---

## 6. Mitigation Coverage Min-Product Score

### Origin
Coverage mapping from threat modelling (STRIDE / DREAD frameworks). Each vulnerability
vector must be covered by at least one active, correctly-mapped security control.

### Security Intent
Phase 4 verifies that for every active threat vector there exists an active, correctly-mapped
mitigation (firewall rule, TLS policy, access guard, etc.). The **Mitigation Attestation Score**
$D_S$ is `1` only if every mapped control is confirmed active. An inactive control for a
live threat is an **open vulnerability** and drives $D_S$ to `0`.

### Mathematical Formulation

Let $\vec{c} \in \{0,1\}^M$ where $c_m = 1$ if control $m$ is active, and
$\vec{m} \in \{0,1\}^M$ where $m_m = 1$ if control $m$ is mapped to the current threat:

$$\boxed{D_S = \prod_{\{m \,:\, m_m = 1\}} c_m}$$

Equivalently:

$$D_S = \min_{m \,:\, m_m=1}\, c_m$$

| $D_S$ | Interpretation |
|-------|----------------|
| $1$ | All mapped mitigations active — Pass |
| $0$ | At least one mapped mitigation inactive — Fail / Alarm |

### Derivation
For $M$ controls with mapping bits $m_m$:

$$D_S = \prod_{m=0}^{M-1} \left(c_m \cdot m_m + (1 - m_m)\right)$$

When $m_m = 0$ the factor is $(c_m \cdot 0 + 1) = 1$ (unmapped control is ignored).
When $m_m = 1$ the factor is $c_m$ (mapped control must be active).
The product of all factors is therefore `1` iff every mapped control is active.

---

## 7. Driven Exploit Wave — Control Bypass Simulation

### Origin
Forced 1D wave equation. The source term represents a periodic adversarial signal
continuously exciting the system — analogous to a sustained exploit payload.

### Security Intent
Phase 4 runs a side-by-side simulation:
- **Secured** path: high damping (`GAMMA_SEC = 0.8`) — wave is rapidly attenuated before
  reaching the perimeter. This models a correctly-deployed mitigation dampening an attack.
- **Bypassed** path: low damping (`GAMMA_BYP = 0.03`) — wave floods past the perimeter,
  demonstrating that without active controls an exploit reaches protected targets.

The visual difference (used in the exploit video `chaos_bypass_wave.mp4`) makes the
security consequence of $D_S = 0$ immediately tangible.

### Continuous Equation

$$\frac{\partial^2 \Phi}{\partial t^2} + \gamma \frac{\partial \Phi}{\partial t} - v^2 \frac{\partial^2 \Phi}{\partial x^2} = A \sin(\omega t - k x)$$

The spatially-travelling source $A\sin(\omega t - kx)$ models a coherent attack wavefront.

### Discrete Update Rule

$$\Phi_i^{n+1} = \frac{2\Phi_i^n - \Phi_i^{n-1}(1 - \frac{\gamma\Delta t}{2}) + r^2(\Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n) + \Delta t^2 \cdot A\sin(\omega t - k \cdot i)}{1 + \frac{\gamma\Delta t}{2}}$$

### Code Constants (`chaos_verifier.cpp`)
| Constant | Secured value | Bypassed value | Meaning |
|----------|:---:|:---:|---------|
| `GAMMA_SEC` | **0.8** | — | High attenuation (mitigated) |
| `GAMMA_BYP` | — | **0.03** | Near-zero damping (bypassed) |
| `WAVE_GRID_SIZE` | 60 | 60 | Grid cells |
| `WAVE_COURANT` `r` | 0.5 | 0.5 | $v\Delta t/\Delta x$ |
| `WAVE_OMEGA` $\omega$ | 0.2 | 0.2 | Drive frequency |
| `WAVE_K` $k$ | 0.15 | 0.15 | Spatial wave number |
| `A` | 1.5 | 1.5 | Source amplitude |
| `DT` $\Delta t$ | 0.1 | 0.1 | Time step |
| `PERIMETER` | 50 | 50 | Cell index of security perimeter |

---

## 8. Penalised Replication-Lag Resilience Score

### Origin
Penalised-ratio model derived from SLA (Service Level Agreement) lag-threshold
monitoring and Raft consensus protocol health checks.

### Security Intent
Phase 5 monitors high-availability cluster health. The **Resilience Attestation Score** $D_R$
accounts for two independent failure modes:
1. The **primary node goes offline** (`primary_synced = 0`) → $D_R$ collapses to `0`.
2. The **replication lag exceeds the threshold** → the lag-ratio term falls below zero,
   signalling a stale replica that cannot safely promote to primary.

When $D_R \leq 0$, the **replica promotion protocol** is triggered, elevating the standby
node to primary to restore cluster consensus.

### Mathematical Formulation

Let:
- $\text{PSync} \in \{0,1\}$ — primary node sync flag (`primary_synced`)
- $L$ — current replica lag in ms (`replication_lag`)
- $T$ — maximum tolerable lag in ms (`sync_threshold`)

$$\boxed{D_R = \text{PSync} \cdot \left(1 - \frac{L}{T}\right)}$$

| Condition | $D_R$ | Action |
|-----------|:-----:|--------|
| Primary synced, $L \ll T$ | $\approx 1$ | Healthy cluster |
| Primary synced, $L = T$ | $0$ | Replica stale — promote |
| Primary synced, $L > T$ | $< 0$ | Replica stale — promote |
| Primary desynced | $0$ | Primary lost — promote |

### Derivation
The $1 - L/T$ term is a **continuous penalty factor** on the lag ratio. When $L=0$
(perfectly in sync) the factor is `1`. When $L=T$ (at the threshold) the factor is `0`.
Multiplying by `PSync` gates the entire score: even a perfectly-synced replica returns
$D_R = 0$ if the primary has gone offline.

### Code Struct (`consensus_auditor.c`)
```c
typedef struct {
    uint32_t primary_synced;      // PSync
    uint32_t replication_lag;     // L (ms)
    uint32_t sync_threshold;      // T (ms)
    uint32_t active_nodes;        // node count
    uint32_t consensus_quorum;    // quorum flag
    uint32_t heartbeat_rtt_ms;    // RTT
    uint32_t term_id;             // Raft term
    uint32_t election_timeout_ms; // election timeout
} cluster_status_t;
```

---

## 9. FDTD Discretisation of the General Damped Wave Equation

### Origin
Yee (1966) FDTD scheme applied to the scalar damped wave equation. Used in all five
phases as the shared telemetry simulation kernel.

### Continuous Equation

$$\frac{\partial^2 \Phi}{\partial t^2} + \gamma \frac{\partial \Phi}{\partial t} - v^2 \frac{\partial^2 \Phi}{\partial x^2} = f(x,t)$$

where $\gamma \geq 0$ is the damping coefficient and $f$ is an optional source term.

### Derivation — Step by Step

**Step 1 — Discretise the second time derivative** (central difference):

$$\frac{\partial^2 \Phi}{\partial t^2} \approx \frac{\Phi_i^{n+1} - 2\Phi_i^n + \Phi_i^{n-1}}{\Delta t^2}$$

**Step 2 — Discretise the first time derivative** (central difference):

$$\frac{\partial \Phi}{\partial t} \approx \frac{\Phi_i^{n+1} - \Phi_i^{n-1}}{2\Delta t}$$

**Step 3 — Discretise the 1D Laplacian** (second spatial derivative):

$$\frac{\partial^2 \Phi}{\partial x^2} \approx \frac{\Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n}{\Delta x^2}$$

**Step 4 — Substitute** into the continuous equation:

$$\frac{\Phi_i^{n+1} - 2\Phi_i^n + \Phi_i^{n-1}}{\Delta t^2} + \gamma\frac{\Phi_i^{n+1} - \Phi_i^{n-1}}{2\Delta t} - v^2 \frac{\Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n}{\Delta x^2} = f_i^n$$

**Step 5 — Multiply through by $\Delta t^2$**:

$$\left(\Phi_i^{n+1} - 2\Phi_i^n + \Phi_i^{n-1}\right) + \frac{\gamma\Delta t}{2}\!\left(\Phi_i^{n+1} - \Phi_i^{n-1}\right) - r^2\!\left(\Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n\right) = \Delta t^2 f_i^n$$

where $r = v\Delta t / \Delta x$ is the **Courant number**.

**Step 6 — Collect $\Phi_i^{n+1}$ terms on the left**:

$$\Phi_i^{n+1}\!\left(1 + \frac{\gamma\Delta t}{2}\right) = 2\Phi_i^n - \Phi_i^{n-1}\!\left(1 - \frac{\gamma\Delta t}{2}\right) + r^2\!\left(\Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n\right) + \Delta t^2 f_i^n$$

**Step 7 — Divide through** to obtain the explicit update:

$$\boxed{\Phi_i^{n+1} = \frac{2\Phi_i^n - \Phi_i^{n-1}\!\left(1 - \dfrac{\gamma\Delta t}{2}\right) + r^2\!\left(\Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n\right) + \Delta t^2 f_i^n}{1 + \dfrac{\gamma\Delta t}{2}}}$$

When $\gamma = 0$ and $f = 0$ this reduces to the simple undamped update used in Phase 1:

$$\Phi_i^{n+1} = 2\Phi_i^n - \Phi_i^{n-1} + r^2\!\left(\Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n\right)$$

### Shared Constants (all phases)

| Symbol | Code | Ph-1 | Ph-2 | Ph-3 | Ph-4 | Ph-5 | Satan |
|--------|------|:----:|:----:|:----:|:----:|:----:|:-----:|
| $N$ | `WAVE_GRID_SIZE` | 40 | 40 | 40 | 40 | 40 | 40 |
| $r$ | `WAVE_COURANT` | 0.5 | 0.5 | 0.5 | 0.5 | 0.5 | 0.5 |
| $\omega$ | `WAVE_OMEGA` | 0.2 | 0.2 | 0.2 | 0.2 | 0.2 | 0.2 |
| $\gamma$ | `WAVE_GAMMA` | — | **0.4** | **0.3** | — | — | — |
| $k$ | `WAVE_K` | — | — | — | **0.15** | — | — |
| Source fn | — | $\sin\omega t$ | $\sin\omega t$ | $\cos\omega t$ | $\sin(\omega t-ki)$ | — | $\sin 0.2\,n\Delta t$ |
| Wave type | — | Undamped | Damped | Damped | Driven | Undamped | Curved |
| $\Delta t$ | `dt` | 0.1 | 0.1 | 0.1 | 0.1 | 0.1 | 0.1 |

---

## 10. CFL Stability Criterion

### Origin
Courant, Friedrichs & Lewy (1928). Necessary condition for the explicit FDTD scheme
to be stable and convergent.

### Security Intent
If $r > 1.0$, the FDTD update amplifies high-frequency numerical errors at each step,
causing exponential divergence to $\pm\infty$ within a few dozen time steps. All five
phases check this condition at startup and abort with a `[FATAL]` message if violated,
preventing corrupted attestation scores from being reported.

### Condition

$$r = \frac{v \cdot \Delta t}{\Delta x} \leq 1.0$$

### Derivation
Consider a Fourier mode $\Phi_i^n = \xi^n e^{i \kappa i \Delta x}$ substituted into the
undamped update equation. The amplification factor $\xi$ satisfies:

$$\xi + \xi^{-1} = 2 - 2r^2(1 - \cos\kappa\Delta x)$$

For $|\xi| \leq 1$ (non-growing modes) we need:

$$2r^2(1 - \cos\kappa\Delta x) \leq 4 \quad \Rightarrow \quad r^2 \leq \frac{2}{1 - \cos\kappa\Delta x}$$

The worst case is $\kappa\Delta x = \pi$ (highest spatial frequency), giving $r^2 \leq 1$,
hence **$r \leq 1$**.

### Startup Check (all phases)
```c
// phase_fsm.c, main()
if (WAVE_COURANT > 1.0f) {
    printf("[FATAL] Wave simulation Courant stability limit exceeded (r = %f > 1.0)\n",
           WAVE_COURANT);
    return 1;
}
```

---

## 11. Covariant D'Alembertian in 1+1D Curved Spacetime

### Origin
General Relativity — covariant wave equation for a scalar field $\Psi$ on a Lorentzian
manifold with metric $g_{\mu\nu}$.

### Security Intent
Satan's Recursion elevates the telemetry wave grid from flat Euclidean space into a
**dynamically-curved 1+1D Lorentzian manifold**. The metric is warped in real time by
coupling the amplitude outputs of all four preceding phases. This stress-tests the
numerical solver under non-trivial geometric conditions and verifies that the FDTD kernel
remains stable even when spacetime is actively distorted by security events.

### Continuous Equation

$$\Box_g \Psi \equiv \frac{1}{\sqrt{-g}}\, \partial_\mu\!\left(\sqrt{-g}\, g^{\mu\nu}\, \partial_\nu \Psi\right) = 0$$

For a diagonal $1+1$D metric $(g^{00}, g^{11})$:

$$\frac{1}{\sqrt{-g}}\left[\frac{\partial}{\partial t}\!\left(\sqrt{-g}\, g^{00}\, \frac{\partial\Psi}{\partial t}\right) - \frac{\partial}{\partial x}\!\left(\sqrt{-g}\, g^{11}\, \frac{\partial\Psi}{\partial x}\right)\right] = 0$$

Assuming metric coefficients are quasi-static over $\Delta t$, the temporal term simplifies and
the equation reduces to:

$$\frac{\partial^2\Psi}{\partial t^2} = \frac{1}{\sqrt{-g}_i \, g^{00}_i}\, \frac{\partial}{\partial x}\!\left(\sqrt{-g}\, g^{11}\, \frac{\partial\Psi}{\partial x}\right)$$

### Derivation of the Discrete Curved Update

**Spatial flux divergence** (central difference at half-cell boundaries):

$$\frac{\partial}{\partial x}\!\left(\sqrt{-g}\, g^{11}\, \frac{\partial\Psi}{\partial x}\right) \approx \frac{1}{\Delta x^2}\!\left[\sqrt{-g}_{i+1}\,g^{11}_{i+1}\!\left(\Psi_{i+1}^n - \Psi_i^n\right) - \sqrt{-g}_{i-1}\,g^{11}_{i-1}\!\left(\Psi_i^n - \Psi_{i-1}^n\right)\right]$$

**Temporal update** (substituting the FDTD second derivative):

$$\frac{\Psi_i^{n+1} - 2\Psi_i^n + \Psi_i^{n-1}}{\Delta t^2} = \frac{1}{\sqrt{-g}_i\, g^{00}_i \Delta x^2}\!\left[\sqrt{-g}_{i+1}\,g^{11}_{i+1}\!\left(\Psi_{i+1}^n - \Psi_i^n\right) - \sqrt{-g}_{i-1}\,g^{11}_{i-1}\!\left(\Psi_i^n - \Psi_{i-1}^n\right)\right]$$

Defining $r^2 = (\Delta t / \Delta x)^2$ and the local geometry factor $\mathcal{F}_i = r^2 / (\sqrt{-g}_i\, g^{00}_i)$:

$$\boxed{\Psi_i^{n+1} = 2\Psi_i^n - \Psi_i^{n-1} + \mathcal{F}_i\!\left[\sqrt{-g}_{i+1}\,g^{11}_{i+1}\!\left(\Psi_{i+1}^n - \Psi_i^n\right) - \sqrt{-g}_{i-1}\,g^{11}_{i-1}\!\left(\Psi_i^n - \Psi_{i-1}^n\right)\right]}$$

### Code Implementation (`satan_recursion.cpp`, line 200096–200110)
```cpp
for (int i = 1; i < WAVE_GRID_SIZE - 1; i++) {
    float det_g_prev = sim->g00[i-1] * sim->g11[i-1];
    float det_g_curr = sim->g00[i]   * sim->g11[i];
    float det_g_next = sim->g00[i+1] * sim->g11[i+1];

    float sqrt_g_prev = std::sqrt(std::abs(det_g_prev));
    float sqrt_g_curr = std::sqrt(std::abs(det_g_curr));
    float sqrt_g_next = std::sqrt(std::abs(det_g_next));

    float term_next  = sqrt_g_next * sim->g11[i+1] * (sim->phi[i+1] - sim->phi[i]);
    float term_prev  = sqrt_g_prev * sim->g11[i-1] * (sim->phi[i]   - sim->phi[i-1]);
    float factor     = r2 / (sqrt_g_curr * sim->g00[i]);

    sim->phi_next[i] = 2.f*sim->phi[i] - sim->phi_prev[i] + factor*(term_next - term_prev);
}
```

Boundary: $\Psi_0^{n+1} = \sin(0.2 \cdot n\Delta t)$ (driven source), $\Psi_{N-1}^{n+1} = 0$ (Dirichlet sink).

### Code Constants (`satan_recursion.cpp`)
| Constant | Value | Meaning |
|----------|-------|---------|
| `WAVE_GRID_SIZE` | 40 | Spatial grid |
| `WAVE_COURANT` | 0.5 | Courant number $r$ |
| `TOTAL_ROUTINES` | 100,000 | Total audit functions ($10 \times 10{,}000$) |
| Source $\omega$ | 0.2 | Drive frequency (hard-coded in source boundary) |

---

## 12. Metric Modulation via Telemetry Coupling

### Origin
Derived from the linearised weak-field approximation of General Relativity,
where the metric deviation $h_{\mu\nu} = g_{\mu\nu} - \eta_{\mu\nu}$ from flat Minkowski
space is sourced by a stress-energy distribution.

### Security Intent
The four telemetry wave amplitudes from Phases 1–4 are summed and scaled to produce a
**coupling scalar** $\kappa(t)$. This coupling warps the spacetime metric around a
Gaussian "event core" at the grid midpoint. Large security events (large phase amplitudes)
produce strong curvature, stress-testing the solver. Small amplitudes restore near-flat
Minkowski geometry.

### Equations

**Coupling scalar:**

$$\kappa(t) = 0.15 \times \sum_{p=1}^{4} \Phi_p(t)$$

**Gaussian spatial profile** (distance from grid centre $x_c = N/2$, variance $\sigma^2 = 25$):

$$P(x) = \exp\!\left(-\frac{(x - x_c)^2}{2\sigma^2}\right) = \exp\!\left(-\frac{(i - 20)^2}{50}\right)$$

**Time-dilation component** $g^{00}(x)$ (inverse Schwarzschild-like factor):

$$g^{00}_i = 1 + \kappa(t) \cdot P(x_i)$$

**Spatial contraction component** $g^{11}(x)$:

$$g^{11}_i = \frac{1}{g^{00}_i} = \frac{1}{1 + \kappa(t) \cdot P(x_i)}$$

**Metric determinant** (Lorentzian signature: $g_{00} < 0$, $g_{11} > 0$):

$$\sqrt{-g_i} = \sqrt{|g^{00}_i \cdot g^{11}_i|} = \sqrt{\left|\frac{g^{00}_i}{g^{00}_i}\right|} = 1$$

> **Note.** Because $g^{11} = 1/g^{00}$, the product $g^{00}\cdot g^{11} = 1$, so
> $\sqrt{-g} = 1$ identically. The code computes it explicitly via `sqrt(abs(det))` to
> remain general for future non-reciprocal metric extensions.

### Code Implementation (`satan_recursion.cpp`, `modulate_metric()`)
```cpp
float coupling = 0.15f * (wave1 + wave2 + wave3 + wave4);
for (int i = 0; i < WAVE_GRID_SIZE; i++) {
    float dist = std::abs(i - WAVE_GRID_SIZE / 2);        // |x - x_c|
    float profile = std::exp(-(dist * dist) / 50.0f);     // Gaussian, sigma^2 = 25
    sim->g00[i] = 1.0f + coupling * profile;
    sim->g11[i] = 1.0f / sim->g00[i];
}
```

| Parameter | Value | Description |
|-----------|-------|-------------|
| Coupling scale | 0.15 | $0.15 \times \sum \Phi_p$ |
| $x_c$ | 20 | Grid midpoint (event core) |
| $2\sigma^2$ | 50 | Spatial variance denominator |
| Flat initialisation | $g^{00} = g^{11} = 1$ | Minkowski metric at startup |

---

## 13. Carter's Constant — Kerr Geodesic Invariant

### Origin
Brandon Carter (1968) — "Global Structure of the Kerr Family of Gravitational Fields",
*Physical Review*, **174**, 1559. Derived via Hamilton-Jacobi separation of the Kerr metric.

### Security Intent
Carter's Constant $Q$ is a **conserved quantity** along every geodesic in Kerr spacetime.
In Satan's Recursion it serves as a high-precision **calibration oracle**: any numerical
trajectory through the curved metric must conserve $Q$ to machine precision. Deviation
from the expected value flags numerical instability in the curved-spacetime solver before
it can corrupt attestation scores.

### Derivation

**Starting point** — Hamilton-Jacobi equation for a test particle of mass $m$:

$$2\frac{\partial S}{\partial \lambda} = g^{\mu\nu}\frac{\partial S}{\partial x^\mu}\frac{\partial S}{\partial x^\nu}$$

The Kerr metric has two Killing vectors ($\partial_t$, $\partial_\phi$), giving conserved
energy $E$ and axial angular momentum $L_z$. Assume the separated ansatz:

$$S = -\tfrac{1}{2}m^2\lambda - Et + L_z\phi + S_r(r) + S_\theta(\theta)$$

Substituting Boyer-Lindquist inverse metric $g^{\mu\nu}$ and rearranging into
$r$-only and $\theta$-only groupings:

$$\underbrace{\Delta\!\left(\frac{dS_r}{dr}\right)^2 - \frac{\left[(r^2+a^2)E - aL_z\right]^2}{\Delta} + m^2r^2}_{R(r)} = \underbrace{-\left(\frac{dS_\theta}{d\theta}\right)^2 - a^2m^2\cos^2\theta - \frac{(aE\sin^2\theta - L_z)^2}{\sin^2\theta}}_{\Theta(\theta)}$$

Since the left side depends only on $r$ and the right side only on $\theta$, both equal
a **separation constant** $\mathcal{K}$.

Rewriting the $\theta$-equation:

$$\left(\frac{dS_\theta}{d\theta}\right)^2 + a^2m^2\cos^2\theta + \frac{(aE\sin^2\theta - L_z)^2}{\sin^2\theta} = \mathcal{K}$$

Expanding $\sin^2\theta = 1 - \cos^2\theta$ and regrouping:

$$\left(\frac{dS_\theta}{d\theta}\right)^2 + \cos^2\theta\!\left[a^2(m^2 - E^2)\right] + \frac{L_z^2}{\sin^2\theta} + a^2E^2 - 2aEL_z = \mathcal{K}$$

Carter defined a **shifted separation constant** to remove the $L_z$-$E$ cross terms:

$$Q \equiv \mathcal{K} - (L_z - aE)^2 = \mathcal{K} - L_z^2 + 2aEL_z - a^2E^2$$

Substituting and simplifying using $\tfrac{1}{\sin^2\theta} - 1 = \tfrac{\cos^2\theta}{\sin^2\theta}$:

$$\boxed{Q = p_\theta^2 + \cos^2\theta\!\left[a^2(m^2 - E^2) + \frac{L_z^2}{\sin^2\theta}\right]}$$

where $p_\theta = \partial S/\partial\theta = dS_\theta/d\theta$ is the $\theta$-component of
the covariant 4-momentum. $Q$ is **strictly conserved** along any Kerr geodesic.

**Special cases:**

| Condition | $Q$ value | Physical meaning |
|-----------|-----------|-----------------|
| Equatorial orbit ($\theta = \pi/2$) | $Q = 0$ | Geodesic confined to equatorial plane |
| Polar orbit ($L_z = 0$, $a=0$) | $Q = p_\theta^2 + a^2m^2\cos^2\theta$ | Pure polar motion |
| Massless photon ($m = 0$) | $Q = p_\theta^2 - \cos^2\theta\,(a^2E^2 - L_z^2/\sin^2\theta)$ | Null geodesic |

---

## 14. Kerr Metric Coefficients in Boyer-Lindquist Coordinates

### Origin
Roy Kerr (1963) — "Gravitational Field of a Spinning Mass as an Example of
Algebraically Special Metrics", *Physical Review Letters*, **11**, 237.
Boyer & Lindquist (1967) coordinates.

### Security Intent
These coefficients define the background spacetime geometry in which Satan's Recursion
propagates its scalar wave. They set the local speed of wave propagation (via $g^{11}$)
and the local time-dilation rate (via $g^{00}$). Accurate implementation of these
coefficients ensures the curved-spacetime solver operates on a physically-correct metric
rather than an ad hoc distortion.

### Line Element

$$ds^2 = g_{00}\,dt^2 + 2g_{03}\,dt\,d\phi + g_{11}\,dr^2 + g_{22}\,d\theta^2 + g_{33}\,d\phi^2$$

### Metric Components

$$g_{00} = -\!\left(1 - \frac{2Mr}{\rho^2}\right)$$

$$g_{11} = \frac{\rho^2}{\Delta}$$

$$g_{22} = \rho^2$$

$$g_{33} = \left(r^2 + a^2 + \frac{2Mra^2\sin^2\theta}{\rho^2}\right)\sin^2\theta$$

$$g_{03} = -\frac{2Mra\sin^2\theta}{\rho^2}$$

### Auxiliary Functions

$$\Delta(r) = r^2 - 2Mr + a^2 \qquad \text{(horizon function)}$$

$$\rho^2(r,\theta) = r^2 + a^2\cos^2\theta \qquad \text{(conformal factor)}$$

### Key Surfaces

| Surface | Condition | Physical meaning |
|---------|-----------|-----------------|
| Outer horizon $r_+$ | $\Delta = 0$, $r_+ = M + \sqrt{M^2 - a^2}$ | Event horizon |
| Inner horizon $r_-$ | $\Delta = 0$, $r_- = M - \sqrt{M^2 - a^2}$ | Cauchy horizon |
| Ergosphere outer | $g_{00} = 0$, $r = M + \sqrt{M^2 - a^2\cos^2\theta}$ | Static limit surface |
| Singularity | $\rho^2 = 0$ → $r = 0, \theta = \pi/2$ | Ring singularity |

### Kerr Spin Parameter Constraint

$$0 \leq |a| \leq M \qquad \text{(extremal Kerr: } |a| = M\text{)}$$

For $|a| > M$, $\Delta$ has no real roots → no event horizon → **naked singularity** (unphysical).

---

## Summary — Score Definitions

| Score | Symbol | Phase | Pass condition | Fail action |
|-------|--------|-------|----------------|-------------|
| Boundary Attestation | $D_H$ | 2 | $D_H = 1$ (no path) | Block + alert |
| Invariant Attestation | $D_A$ | 3 | $D_A = 1$ (all in bounds) | Escalate |
| Mitigation Attestation | $D_S$ | 4 | $D_S = 1$ (all controls active) | Alarm |
| Resilience Attestation | $D_R$ | 5 | $D_R > 0$ (lag within threshold) | Promote replica |

> **Composite gate.** In Satan's Recursion the four scores are ANDed as a final
> spacetime integrity check. Any single failure collapses the composite gate and the
> curved-spacetime audit registers a **singularity event**.
