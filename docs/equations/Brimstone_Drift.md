# Brimstone Drift (Phase 3) — Telemetry Invariants

This document details the mathematical equations, intent, tradeoffs, and assumptions behind the invariant telemetry engine in **Brimstone Drift** (formerly Phase 3).

---

## 1. Telemetry Invariant Product Score

### Mathematical Formulation
Let $X_j$ be the current value of telemetry parameter $j$ and $[L_k, U_k]$ be the safety interval for invariant $k$:

$$\text{Inv}_k = \mathbf{1}\!\left[L_k \leq X_{j(k)} \leq U_k\right]$$

The Invariant Attestation Score ($D_A$) over $K$ invariants is:

$$D_A = \prod_{k=0}^{K-1} \text{Inv}_k = \bigwedge_{k=0}^{K-1} \text{Inv}_k$$

Where:
*   $K = 4,500$ invariants are verified per runtime tick.

### Security Intent
Ensures total alignment with target performance and system bounds (CPU usage, memory limits, socket counts, open descriptors). A single out-of-bounds parameter drops $D_A$ to $0$ instantly, preventing a compromise in one parameter from being masked by others.

### Tradeoffs and Assumptions
*   **Tradeoff**: Zero tolerance. A minor transient spike in a non-critical metric (e.g. disk write rate during logs rotation) can cause an attestation failure.
*   **Assumption**: Invariant thresholds $[L_k, U_k]$ are correctly baseline-calibrated to minimize false positives while preventing evasion.

---

## 2. Telemetry Wave — Cascading Decay Model

### Continuous Equation
$$\frac{\partial^2 \Phi}{\partial t^2} + \gamma_A \frac{\partial \Phi}{\partial t} = v^2 \frac{\partial^2 \Phi}{\partial x^2}$$

### Decaying Mode
$$\Phi(x, t) = \Phi_0 e^{-\alpha x} \cos(k x - \omega t) \quad \text{where} \quad \alpha = \frac{\gamma_A v}{2}$$

### Security Intent
Models the propagation and decay of detected telemetry anomalies across dependent modules. A decay rate $\alpha$ represents the damping effect of node recovery routines.

### Tradeoffs and Assumptions
*   **Tradeoff**: Simplified modeling of system decay.
*   **Assumption**: Nodes are coupled linearly for propagation purposes.
