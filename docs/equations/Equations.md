# PHASR | Mathematical Models & Physics Equations

This document provides a unified reference for all mathematical models, physics equations, derivations, and structural intents integrated across the **PHASR** verification suite and the **Satan's Recursion** curved spacetime solver.

---

## 1. FSM Phase Transitions & Pathway Encoding (Phase 1)

### 1.1 Intent in PHASR
The **Phase FSM Validator** monitors state progressions in the security lifecycle. The intent of the pathway equations is to statically encode all permissible state-transition sequences into a set of fast, constant-time assembly routines. This guarantees that execution leaps or prerequisite bypasses are physically impossible to execute at the instruction level.

### 1.2 Mathematical Formulations & Derivation
The FSM consists of $8$ states ($0$ through $7$). An array of $4,500$ static verification helper functions is defined. The index $i \in [0, 4499]$ of each helper routine encodes a specific transition target and prerequisite check:

1. **Current State Mapping:**
   $$\text{current\_state} = i \pmod 8$$
2. **Next State Mapping:**
   $$\text{next\_state} = (i + 1) \pmod 8$$
3. **Prerequisite Bit Index Mappings:**
   $$\text{prereq\_bit} = \begin{cases} \text{next\_state} - 1 & \text{if } \text{next\_state} > 0 \\ 0 & \text{if } \text{next\_state} = 0 \end{cases}$$

#### Transition Validation Logic
For a transition query $(C, N, P)$ where $C$ is the current state, $N$ is the next state, and $P$ is the 64-bit prerequisite bitmask:
1. If $N = 0$, the transition is a reset (always valid, returns `1`).
2. If $N \neq C + 1$, the transition is out-of-sequence (invalid, returns `0`).
3. If $N = C + 1$, the transition is valid *if and only if* bit `prereq_bit` is set in $P$:
   $$\text{Valid} = \frac{P \ \& \ (1 \ll \text{prereq\_bit})}{1 \ll \text{prereq\_bit}}$$
   If the bit is set, it returns `1`; otherwise, it returns `0`.

---

## 2. Boundary Attestation & Path Reachability (Phase 2)

### 2.1 Intent in PHASR
The **Hierarchy Reachability Engine** audits access boundaries on privilege graphs. The intent is to verify that untrusted interface components cannot communicate with secure enclaves. This boundary is formalized mathematically as a reachability check on the directed network topology.

### 2.2 Mathematical Formulations & Derivation
Let the privilege network be represented as a directed graph $G = (V, E)$ with $|V| = 16$ nodes. 
* Untrusted subjects: $S_{\text{untrusted}} \in \{0, 1, 2, 3, 4, 5, 6, 7\}$
* Secure objects: $O_{\text{secure}} \in \{12, 13, 14, 15\}$

The adjacency matrix $A$ is a $16 \times 16$ binary matrix where $A_{ij} = 1$ if there exists a directed edge from node $i$ to node $j$. The transitive closure (reachability matrix) $R$ is defined such that $R_{ij} = 1$ if there exists a path of length $\ge 0$ from $i$ to $j$.

#### Warshall's Algorithm Derivation
The reachability matrix $R$ is computed from $A$ using Warshall's algorithm. Let $R^{(0)} = A + I$ (where $I$ is the identity matrix representing self-reachability). The recurrence relation for $k = 1, \dots, 16$ is:
$$R_{ij}^{(k)} = R_{ij}^{(k-1)} \lor \left( R_{ik}^{(k-1)} \land R_{kj}^{(k-1)} \right)$$

This in-place bitwise operation updates the reachability paths. Once computed, the **Boundary Attestation Score ($D_H$)** is defined as:
$$D_H = 1 - \max_{\substack{s \in S_{\text{untrusted}} \\ o \in O_{\text{secure}}}} R_{so}$$

#### Verification Criterion
* If $D_H = 1$: Secure enclaves are topologically isolated from untrusted zones (Pass).
* If $D_H = 0$: A privilege path leak exists (Fail / Block).

---

## 3. Invariant Drift & Telemetry Verification (Phase 3)

### 3.1 Intent in PHASR
The **Telemetry Collector** monitors system and network metrics. The intent is to detect performance anomalies or configuration changes in real-time, verifying that the system does not drift into unsecured configurations.

### 3.2 Mathematical Formulations & Derivation
Let $X_j$ represent the current value of telemetry parameter $j$ (e.g. syscall counts, open file descriptors, TCP network connects) gathered via eBPF sensors. The validator applies $4,500$ static invariant boundary constraints:
$$\text{Invariant}_k = \begin{cases} 1 & \text{if } L_k \le X_{j(k)} \le U_k \\ 0 & \text{otherwise} \end{cases}$$
where $L_k$ and $U_k$ are the lower and upper safety limits for telemetry parameter $j(k)$.

The **Invariant Attestation Score ($D_A$)** is the product of all active invariant checks:
$$D_A = \prod_{k=0}^{4499} \text{Invariant}_k$$

* If $D_A = 1$: Every telemetry metric resides within safe parameters (Pass).
* If $D_A = 0$: At least one safety invariant has been breached (Fail / Escalate).

---

## 4. Control Activity & Mitigation Verification (Phase 4)

### 4.1 Intent in PHASR
The **Solutions Mitigation Verifier** checks the status of security controls (such as firewalls, TLS policies, and access guards) against active bypass challenges. The intent is to verify that for every potential vulnerability vector, there is an active, functional, and correctly mapped control.

### 4.2 Mathematical Formulations
Let $\vec{c} \in \{0, 1\}^M$ be a binary vector where $c_m = 1$ if security control $m$ is active, and $\vec{m} \in \{0, 1\}^M$ be a mapping vector where $m_m = 1$ if control $m$ is mapped to cover the active threat vector.

The **Mitigation Attestation Score ($D_S$)** is computed as:
$$D_S = \min_{m} \left( c_m \cdot m_m + (1 - m_m) \right)$$
which simplifies to the boolean logic:
$$D_S = \prod_{m \text{ s.t. } m_m = 1} c_m$$

* If $D_S = 1$: All mapped security mitigations are confirmed active (Pass).
* If $D_S = 0$: A required mitigation control is inactive, representing an open vulnerability (Fail / Alarm).

---

## 5. Redundancy Consensus & Replication Lag (Phase 5)

### 5.1 Intent in PHASR
The **Redundancy Consensus Auditor** monitors replication state, cluster term ID consistency, and network sync latency across secondary nodes. The intent is to verify the health of the high-availability failover topology and trigger promotion protocols when the primary node fails or diverges.

### 5.2 Mathematical Formulations & Derivation
Let $\text{Lag}_{\text{replica}}$ represent the measured synchronization delay (in milliseconds) of the backup replica node. Let $\text{Threshold}$ represent the maximum tolerable synchronization lag before the replica is considered stale. Let $\text{PrimarySynced} \in \{0, 1\}$ represent whether the primary node is operating and reporting in-sync.

The **Resilience Attestation Score ($D_R$)** is defined by the penalized lag ratio model:
$$D_R = \text{PrimarySynced} \cdot \left( 1 - \frac{\text{Lag}_{\text{replica}}}{\text{Threshold}} \right)$$

#### Failover Trigger Logic
* If $D_R > 0$: The cluster is operating in a resilient, redundant state.
* If $D_R \le 0$: The replica lag has exceeded the safety threshold or the primary node has disconnected. This triggers the **replica node promotion protocol** to swap standby to primary.

---

## 6. Telemetry & Signal Propagation Wave Models (FDTD - Phases 2, 3, 4, 5)

### 6.1 Intent in PHASR
Across all five verification phases, continuous streams of telemetry heartbeats, cascading failures, and attack signals are modeled as wave fields. This allows the system to simulate and visualize how localized anomalies propagate through the wider system network over time.

### 6.2 Continuous Wave Equations
Depending on the specific phase, three different wave models are implemented:
1. **Damped Propagation (Phases 2 & 5):**
   $$\frac{\partial^2 \Phi}{\partial t^2} + \gamma \frac{\partial \Phi}{\partial t} - v^2 \nabla^2 \Phi = 0$$
   Here, $\gamma$ acts as the path attenuation factor.
2. **Cascading Decay Wave (Phase 3):**
   $$\frac{\partial^2 \Phi}{\partial t^2} + \gamma \frac{\partial \Phi}{\partial t} = v^2 \nabla^2 \Phi$$
   This represents diffusive-wave failures propagating outward with spatial attenuation.
3. **Driven Exploit Wave (Phase 4):**
   $$\frac{\partial^2 \Phi}{\partial t^2} - v^2 \nabla^2 \Phi = A \sin(\omega t - k x)$$
   Simulates continuous periodic attack inputs driving the security telemetry grid.

### 6.3 FDTD Finite-Difference Discretization
To solve the general damped wave equation on a discrete 1D grid with space-step $\Delta x$ and time-step $\Delta t$, we use second-order central difference approximations:

1. **Second Time Derivative:**
   $$\frac{\partial^2 \Phi}{\partial t^2} \approx \frac{\Phi_i^{n+1} - 2\Phi_i^n + \Phi_i^{n-1}}{\Delta t^2}$$
2. **First Time Derivative (Central Difference):**
   $$\frac{\partial \Phi}{\partial t} \approx \frac{\Phi_i^{n+1} - \Phi_i^{n-1}}{2\Delta t}$$
3. **Second Spatial Derivative (1D Laplacian):**
   $$\nabla^2 \Phi \approx \frac{\partial^2 \Phi}{\partial x^2} \approx \frac{\Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n}{\Delta x^2}$$

#### Step-by-Step Derivation of the Discrete Update Equation
Substitute the approximations into the continuous damped wave equation:
$$\frac{\Phi_i^{n+1} - 2\Phi_i^n + \Phi_i^{n-1}}{\Delta t^2} + \gamma \left( \frac{\Phi_i^{n+1} - \Phi_i^{n-1}}{2\Delta t} \right) - v^2 \left( \frac{\Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n}{\Delta x^2} \right) = 0$$

Multiply the entire equation by $\Delta t^2$:
$$\left( \Phi_i^{n+1} - 2\Phi_i^n + \Phi_i^{n-1} \right) + \frac{\gamma \Delta t}{2} \left( \Phi_i^{n+1} - \Phi_i^{n-1} \right) - \left(\frac{v \Delta t}{\Delta x}\right)^2 \left( \Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n \right) = 0$$

Define the Courant parameter $r = \frac{v \Delta t}{\Delta x}$ and collect terms containing $\Phi_i^{n+1}$ on the left-hand side:
$$\Phi_i^{n+1} \left( 1 + \frac{\gamma \Delta t}{2} \right) - 2\Phi_i^n + \Phi_i^{n-1} \left( 1 - \frac{\gamma \Delta t}{2} \right) - r^2 \left( \Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n \right) = 0$$

$$\Phi_i^{n+1} \left( 1 + \frac{\gamma \Delta t}{2} \right) = 2\Phi_i^n - \Phi_i^{n-1} \left( 1 - \frac{\gamma \Delta t}{2} \right) + r^2 \left( \Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n \right)$$

Divide by $\left( 1 + \frac{\gamma \Delta t}{2} \right)$ to isolate the next state value:
$$\Phi_i^{n+1} = \frac{1}{1 + \frac{\gamma \Delta t}{2}} \left[ 2\Phi_i^n - \Phi_i^{n-1} \left( 1 - \frac{\gamma \Delta t}{2} \right) + r^2 \left( \Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n \right) \right]$$

### 6.4 CFL Stability Criterion
For the finite difference scheme to remain stable, the **Courant-Friedrichs-Lewy (CFL)** condition must be strictly satisfied:
$$r = \frac{v \Delta t}{\Delta x} \le 1.0$$
If $r > 1.0$, high-frequency numerical rounding errors are amplified at each time step rather than attenuated. This causes exponential expansion, leading to rapid divergence toward infinity ($\pm\infty$).

---

## 7. Covariant Wave Solver in Curved Spacetime (Satan's Recursion)

### 7.1 Intent in PHASR
**Satan's Recursion** is the advanced curved spacetime wave simulator. The intent is to model complex signal propagation under gravitational-like curvature. Telemetry amplitudes from the four primary verification phases are coupled back as energy-momentum density inputs, warping the local coordinates ($g^{00}, g^{11}$) and testing the numerical robustness of the solvers under non-linear grid conditions.

### 7.2 The Covariant Wave Equation
The propagation of a scalar field $\Psi$ in a spacetime characterized by a metric tensor $g_{\mu\nu}$ is governed by the covariant D'Alembertian wave equation:
$$\Box_g \Psi = 0 \iff \frac{1}{\sqrt{-g}} \partial_\mu \left( \sqrt{-g} g^{\mu\nu} \partial_\nu \Psi \right) = 0$$
where $g = \det(g_{\mu\nu})$ and $g^{\mu\nu}$ is the inverse metric tensor.

### 7.3 Metric Configurations & Coordinate Warp
For a diagonal 1+1D metric representing a spherically symmetric curved geometry:
$$g_{\mu\nu} = \begin{pmatrix} g_{00}(x) & 0 \\ 0 & g_{11}(x) \end{pmatrix}, \quad g^{\mu\nu} = \begin{pmatrix} g^{00}(x) & 0 \\ 0 & g^{11}(x) \end{pmatrix}$$
The metric determinant is $g = g_{00} g_{11}$. Since both terms are of opposite sign in Lorentzian signature:
$$\sqrt{-g} = \sqrt{|g_{00}(x) g_{11}(x)|}$$

The telemetry coupling warp factor $\text{coupling}(t)$ acts as the source:
$$\text{coupling}(t) = 0.15 \times \sum_{p=1}^4 \phi_p(t)$$
where $\phi_p$ is the amplitude of the $p$-th verification phase wave.

The localized time dilation factor $g^{00}(x)$ and Schwarzschild-like contraction $g^{11}(x)$ are:
$$g^{00}(x) = 1.0 + \text{coupling}(t) \cdot e^{-\frac{(x - x_c)^2}{2\sigma^2}}$$
$$g^{11}(x) = \frac{1.0}{g^{00}(x)}$$
where $x_c$ is the spatial midpoint (event core) and $\sigma^2 = 25.0$ is the spatial variance.

### 7.4 Detailed Derivation of the Discretized Covariant Solver
Using the diagonal components, the expanded wave equation becomes:
$$\frac{1}{\sqrt{-g}} \left[ \frac{\partial}{\partial t} \left( \sqrt{-g} g^{00} \frac{\partial \Psi}{\partial t} \right) - \frac{\partial}{\partial x} \left( \sqrt{-g} g^{11} \frac{\partial \Psi}{\partial x} \right) \right] = 0$$

Assuming metric coefficients are static over small time steps, the temporal derivative simplifies:
$$\frac{\partial}{\partial t} \left( \sqrt{-g} g^{00} \frac{\partial \Psi}{\partial t} \right) \approx \sqrt{-g} g^{00} \frac{\partial^2 \Psi}{\partial t^2}$$

Substituting this back yields:
$$\frac{\partial^2 \Psi}{\partial t^2} = \frac{1}{\sqrt{-g} g^{00}} \frac{\partial}{\partial x} \left( \sqrt{-g} g^{11} \frac{\partial \Psi}{\partial x} \right)$$

Now discretize the spatial flux terms using central difference approximations at spatial midpoint grid boundaries:
$$\frac{\partial}{\partial x} \left( \sqrt{-g} g^{11} \frac{\partial \Psi}{\partial x} \right) \approx \frac{1}{\Delta x^2} \left[ \sqrt{-g}_{i+1/2} g^{11}_{i+1/2} (\Psi_{i+1}^n - \Psi_i^n) - \sqrt{-g}_{i-1/2} g^{11}_{i-1/2} (\Psi_i^n - \Psi_{i-1}^n) \right]$$

Approximating the half-grid variables as simple averages:
$$\sqrt{-g}_{i+1/2} g^{11}_{i+1/2} \approx \sqrt{-g}_{i+1} g^{11}_{i+1}$$
$$\sqrt{-g}_{i-1/2} g^{11}_{i-1/2} \approx \sqrt{-g}_{i-1} g^{11}_{i-1}$$

This gives:
$$\frac{\partial^2 \Psi}{\partial t^2} \approx \frac{1}{\sqrt{-g}_i g^{00}_i \Delta x^2} \left[ \sqrt{-g}_{i+1} g^{11}_{i+1} (\Psi_{i+1}^n - \Psi_i^n) - \sqrt{-g}_{i-1} g^{11}_{i-1} (\Psi_i^n - \Psi_{i-1}^n) \right]$$

Now approximate the second time derivative $\frac{\partial^2 \Psi}{\partial t^2} \approx \frac{\Psi_i^{n+1} - 2\Psi_i^n + \Psi_i^{n-1}}{\Delta t^2}$:
$$\frac{\Psi_i^{n+1} - 2\Psi_i^n + \Psi_i^{n-1}}{\Delta t^2} = \frac{1}{\sqrt{-g}_i g^{00}_i \Delta x^2} \left[ \sqrt{-g}_{i+1} g^{11}_{i+1} (\Psi_{i+1}^n - \Psi_i^n) - \sqrt{-g}_{i-1} g^{11}_{i-1} (\Psi_i^n - \Psi_{i-1}^n) \right]$$

Multiply by $\Delta t^2$ and define the Courant factor $r = \frac{\Delta t}{\Delta x}$:
$$\Psi_i^{n+1} = 2\Psi_i^n - \Psi_i^{n-1} + \frac{r^2}{\sqrt{-g}_i g^{00}_i} \left[ \sqrt{-g}_{i+1} g^{11}_{i+1} (\Psi_{i+1}^n - \Psi_i^n) - \sqrt{-g}_{i-1} g^{11}_{i-1} (\Psi_i^n - \Psi_{i-1}^n) \right]$$

This discrete update equation updates the curved-space wave amplitude at step $n+1$ using values from step $n$ and $n-1$.

---

## 8. Carter's Constant ($Q$) Geodesic Invariant

### 8.1 Intent in PHASR
**Carter's Constant ($Q$)** is a fundamental invariant of motion in rotating spacetimes. In PHASR, it serves as a highly precise mathematical check oracle. Because the Kerr geodesic system is integrable, any numerical path simulation must conserve $Q$ to machine precision. Comparing simulated coordinates against this invariant acts as a calibration audit for the general relativity solver.

### 8.2 Detailed Mathematical Derivation
In the Kerr spacetime, a particle moves along a geodesic. Carter (1968) used Hamilton-Jacobi theory to show the equations of motion are completely separable.

The Hamilton-Jacobi equation for a particle with mass $m$ is:
$$2 \frac{\partial S}{\partial \lambda} = g^{\mu\nu} \frac{\partial S}{\partial x^\mu} \frac{\partial S}{\partial x^\nu}$$
where $\lambda$ is an affine parameter and $S$ is the Jacobi action.

Since the Kerr metric is stationary (independent of time $t$) and axisymmetric (independent of angle $\phi$), the corresponding conjugate momenta are conserved constants of motion:
* Energy: $p_t = -E = \frac{\partial S}{\partial t}$
* Axial Angular Momentum: $p_\phi = L_z = \frac{\partial S}{\partial \phi}$

The rest mass constraint gives:
$$\frac{\partial S}{\partial \lambda} = -\frac{1}{2} m^2$$

We assume a separated form for the action $S$:
$$S(t, r, \theta, \phi, \lambda) = -\frac{1}{2} m^2 \lambda - E t + L_z \phi + S_r(r) + S_\theta(\theta)$$

Substituting the Boyer-Lindquist inverse metric components $g^{\mu\nu}$ into the Hamilton-Jacobi equation yields:
$$-\rho^2 m^2 = -\frac{1}{\Delta} \left[ (r^2 + a^2)E - a L_z \right]^2 + \Delta \left( \frac{dS_r}{dr} \right)^2 + \left( \frac{dS_\theta}{d\theta} \right)^2 + \frac{1}{\sin^2\theta} \left( a E \sin^2\theta - L_z \right)^2$$

Expand $\rho^2 = r^2 + a^2 \cos^2\theta$ on the left side:
$$-(r^2 + a^2 \cos^2\theta) m^2 = -\frac{1}{\Delta} \left[ (r^2 + a^2)E - a L_z \right]^2 + \Delta \left( \frac{dS_r}{dr} \right)^2 + \left( \frac{dS_\theta}{d\theta} \right)^2 + \frac{1}{\sin^2\theta} \left( a E \sin^2\theta - L_z \right)^2$$

Group all terms depending solely on $r$ on one side, and all terms depending solely on $\theta$ on the other side:
$$\Delta \left( \frac{dS_r}{dr} \right)^2 - \frac{\left[ (r^2 + a^2)E - a L_z \right]^2}{\Delta} + m^2 r^2 = -\left( \frac{dS_\theta}{d\theta} \right)^2 - \cos^2\theta \left( a^2 m^2 \right) - \frac{\left( a E \sin^2\theta - L_z \right)^2}{\sin^2\theta}$$

Since the left-hand side is a function only of $r$ and the right-hand side is a function only of $\theta$, both sides must be equal to a constant, which we denote as the separation constant $\mathcal{K}$.

Equating the $\theta$-dependent part to $-\mathcal{K}$:
$$\left( \frac{dS_\theta}{d\theta} \right)^2 + a^2 m^2 \cos^2\theta + \frac{\left( a E \sin^2\theta - L_z \right)^2}{\sin^2\theta} = \mathcal{K}$$

Expand the numerator in the fraction:
$$\frac{\left( a E \sin^2\theta - L_z \right)^2}{\sin^2\theta} = \frac{a^2 E^2 \sin^4\theta - 2 a E L_z \sin^2\theta + L_z^2}{\sin^2\theta} = a^2 E^2 \sin^2\theta - 2 a E L_z + \frac{L_z^2}{\sin^2\theta}$$

Rewrite $\sin^2\theta = 1 - \cos^2\theta$:
$$a^2 E^2 (1 - \cos^2\theta) - 2 a E L_z + \frac{L_z^2}{\sin^2\theta} = a^2 E^2 - a^2 E^2 \cos^2\theta - 2 a E L_z + \frac{L_z^2}{\sin^2\theta}$$

Substitute this back into the expression:
$$\left( \frac{dS_\theta}{d\theta} \right)^2 + a^2 m^2 \cos^2\theta + a^2 E^2 - a^2 E^2 \cos^2\theta - 2 a E L_z + \frac{L_z^2}{\sin^2\theta} = \mathcal{K}$$

$$\left( \frac{dS_\theta}{d\theta} \right)^2 + \cos^2\theta \left[ a^2(m^2 - E^2) \right] + \frac{L_z^2}{\sin^2\theta} + a^2 E^2 - 2 a E L_z = \mathcal{K}$$

Carter's Constant $Q$ is defined by shifting $\mathcal{K}$ to remove the angular momentum constants:
$$Q \equiv \mathcal{K} - (L_z - a E)^2$$

Expanding $(L_z - a E)^2 = L_z^2 - 2 a E L_z + a^2 E^2$:
$$Q = \left\{ \left( \frac{dS_\theta}{d\theta} \right)^2 + \cos^2\theta \left[ a^2(m^2 - E^2) \right] + \frac{L_z^2}{\sin^2\theta} + a^2 E^2 - 2 a E L_z \right\} - \left( L_z^2 - 2 a E L_z + a^2 E^2 \right)$$
$$Q = \left( \frac{dS_\theta}{d\theta} \right)^2 + \cos^2\theta \left[ a^2(m^2 - E^2) \right] + L_z^2 \left( \frac{1}{\sin^2\theta} - 1 \right)$$

Using the identity $\frac{1}{\sin^2\theta} - 1 = \frac{1 - \sin^2\theta}{\sin^2\theta} = \frac{\cos^2\theta}{\sin^2\theta}$:
$$Q = \left( \frac{dS_\theta}{d\theta} \right)^2 + \cos^2\theta \left[ a^2(m^2 - E^2) + \frac{L_z^2}{\sin^2\theta} \right]$$

Since the conjugate momentum $p_\theta = \frac{\partial S}{\partial \theta} = \frac{dS_\theta}{d\theta}$, we obtain the final invariant expression:
$$Q = p_\theta^2 + \cos^2\theta \left[ a^2(m^2 - E^2) + \frac{L_z^2}{\sin^2\theta} \right]$$
which remains strictly constant along any geodesic trajectory in a Kerr spacetime.

---

## 9. Kerr Metric Coefficients in Boyer-Lindquist Coordinates

### 9.1 Intent in PHASR
The **Kerr Metric** details the spacetime geometry surrounding a rotating black hole or massive object. In PHASR, these coefficients establish the background coordinate system for spatial computations in the spacetime solvers, defining coordinate distances and localized time dilation rates.

### 9.2 Equations & Coefficients
The Kerr line element in Boyer-Lindquist coordinates $(t, r, \theta, \phi)$ is:
$$ds^2 = g_{00} dt^2 + 2g_{03} dt d\phi + g_{11} dr^2 + g_{22} d\theta^2 + g_{33} d\phi^2$$

The individual coefficients are defined as functions of mass $M$ and spin parameter $a$:
$$g_{00} = -\left(1 - \frac{2Mr}{\rho^2}\right)$$
$$g_{33} = \left(r^2 + a^2 + \frac{2Mra^2\sin^2\theta}{\rho^2}\right)\sin^2\theta$$
$$g_{11} = \frac{\rho^2}{\Delta}$$
$$g_{22} = \rho^2$$
$$g_{03} = -\frac{2Mra\sin^2\theta}{\rho^2}$$

where:
$$\Delta = r^2 - 2Mr + a^2$$
$$\rho^2 = r^2 + a^2 \cos^2\theta$$
