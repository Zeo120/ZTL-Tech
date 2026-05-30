# Nine Circles (Phase 2) — Reachability & Boundary Verification

This document details the mathematical equations, intent, tradeoffs, and assumptions behind the privilege reachability engine in **Nine Circles** (formerly Phase 2).

---

## 1. Warshall Reachability Closure

### Adjacency Matrix & Recurrence
$$R^{(0)} = A \lor I$$
$$R_{ij}^{(k+1)} = R_{ij}^{(k)} \lor \left(R_{ik}^{(k)} \land R_{kj}^{(k)}\right)$$
For $k = 0 \dots 15$, yielding a 16-node transitive closure.

### Boundary Attestation Score
$$D_H = 1 - \max_{\substack{s \in \{0,\dots,7\} \\ o \in \{12,13,14,15\}}} R_{so}$$

### Security Intent
Audits boundary isolation. If any communication path exists between untrusted tiers (nodes 0–7) and the secure enclave (nodes 12–15), $D_H = 0$, triggering privilege-path-leak isolation actions.

### Tradeoffs and Assumptions
*   **Tradeoff**: Transitive closure scales as $O(N^3)$, which is heavy for large privilege graphs. It is optimized to a bitwise OR, assuming a strict limit of 16 domain nodes.
*   **Assumption**: The privilege topology is static during the scan cycle.

---

## 2. Damped Wave — Boundary Propagation

### Continuous Equation
$$\frac{\partial^2 \Phi}{\partial t^2} + \gamma \frac{\partial \Phi}{\partial t} - v^2 \frac{\partial^2 \Phi}{\partial x^2} = A \cdot \delta(x - x_s) \cdot \sin(\omega t)$$

### Discrete Update Rule
$$\Phi_i^{n+1} = \frac{1}{1 + \frac{\gamma \Delta t}{2}} \left[ 2\Phi_i^n - \Phi_i^{n-1}\!\left(1 - \frac{\gamma \Delta t}{2}\right) + r^2 \!\left(\Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n\right) \right]$$

### Security Intent
Models access violations radiating across the network topology. The damping coefficient ($\gamma = 0.4$) prevents unbounded resonance, representing attenuation due to firewalls and routing rules.

### Tradeoffs and Assumptions
*   **Tradeoff**: Simple 1D layout is used instead of a true graph Laplacian.
*   **Assumption**: The spatial velocity represents average hop latency across network subnets.

---

## 3. Schrodinger's Wave Equation — Quantum-Probabilistic Boundary Attestation

### Continuous Equation
$$i \hbar \frac{\partial \Psi(x, t)}{\partial t} = -\frac{\hbar^2}{2m} \frac{\partial^2 \Psi(x, t)}{\partial x^2} + V(x) \Psi(x, t)$$

### Barrier Tunneling Probability (Bypass Coefficient)
$$T = \left[ 1 + \frac{V_0^2 \sinh^2(\kappa a)}{4E(V_0 - E)} \right]^{-1} \quad \text{where} \quad \kappa = \sqrt{\frac{2m(V_0 - E)}{\hbar^2}}$$

### Security Intent
Models the probability of high-velocity intrusion packets "tunneling" (bypassing) a firewall or validation barrier $V(x)$.

### Tradeoffs and Assumptions
*   **Tradeoff**: Uses an abstract quantum analogy for intrusion, which requires tuning of pseudo-physical parameters ($m, \hbar$).
*   **Assumption**: Intrusion attempts can be treated as coherent wave packets.
