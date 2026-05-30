# Acherons Gate (Phase 1) — Temporal FSM & Telemetry Equations

This document details the mathematical equations, intent, tradeoffs, and assumptions behind the temporal sequence verification engine in **Acherons Gate** (formerly Phase 1).

---

## 1. FSM Prerequisite Bitmask Transition Guard

### Mathematical Formulation
For a query $(C, N, P)$ where $C$ is the current state, $N$ is the requested next state, and $P \in \mathbb{Z}_{64}$ is the 64-bit prerequisite bitmask:

$$
p_{\text{req}}(N) = \begin{cases} N - 1 & \text{if } N > 0 \\ 0 & \text{if } N = 0 \end{cases}
$$

**Transition validity:**

$$
\text{Valid}(C, N, P) = \begin{cases} 1 & \text{if } N = 0 \quad \text{(reset — always legal)} \\ 0 & \text{if } N \neq C + 1 \quad \text{(out-of-sequence — always blocked)} \\ \left\lfloor \frac{P \ \text{AND} \ \left(1 \ll p_{\text{req}}(N)\right)}{1 \ll p_{\text{req}}(N)} \right\rfloor & \text{if } N = C + 1 \end{cases}
$$

### Security Intent
Ensures strict, one-way state transitions. By using a 64-bit bitmask register, we prevent attackers from skipping intermediate verification steps (e.g., bypassing network binding or fingerprint validation) and jumping directly to a trusted state.

### Tradeoffs and Assumptions
*   **Tradeoff**: Extremely rigid. Any out-of-order execution, even for non-security-critical states, causes immediate failure. This requires strict state management in client sessions.
*   **Assumption**: The host is trusted to store the prerequisites register securely (e.g. inside an SGX enclave or cryptographically signed session token) without tamper risk.
*   **Philosophy**: Complete determinism. A single bit mismatch must trigger a hard reject rather than trying to auto-correct state.

---

## 2. Undamped Driven Wave — Heartbeat Simulation

### Continuous Equation
$$\frac{\partial^2 \Phi}{\partial t^2} - v^2 \frac{\partial^2 \Phi}{\partial x^2} = A \cdot \delta(x - x_s) \cdot \sin(\omega t)$$

### Discrete Update Rule (FDTD, $\gamma = 0$)
$$\Phi_i^{n+1} = 2\Phi_i^n - \Phi_i^{n-1} + r^2 \left(\Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n\right)$$
With source injection:
$$\Phi_{x_s}^{n+1} \mathrel{+}= \Delta t^2 \cdot \sin(\omega \cdot n \Delta t) \cdot 10.0$$

### Security Intent
Continuous query heartbeats across cluster nodes are modeled as a propagating wave. A flat/dead wave signals subsystem failure. An unbounded growing wave indicates numerical instability, triggering resets.

### Tradeoffs and Assumptions
*   **Tradeoff**: Lacks physical decay ($\gamma=0$). This means signals remain in the grid indefinitely unless explicitly reset, increasing overall grid energy.
*   **Assumption**: The time step $\Delta t$ and velocity satisfy the CFL criterion ($r \leq 1.0$) to avoid numerical divergence.

---

## 3. State-Transition Telemetry Data Collection

### Mathematical Formulation
A vector $\mathbf{T}_{a \to b}$ of $d$ normalized parameters is captured during transitions:

$$
\mathbf{T}_{a \to b} = \begin{bmatrix} X_1(t) \\ X_2(t) \\ \vdots \\ X_d(t) \end{bmatrix} \in \mathbb{R}^d
$$

$$
D_M(\mathbf{T}_{a \to b}) = \sqrt{(\mathbf{T}_{a \to b} - \boldsymbol{\mu}_a)^T \mathbf{\Sigma}_a^{-1} (\mathbf{T}_{a \to b} - \boldsymbol{\mu}_a)} \leq \chi^2_{d, \, 1-\alpha}
$$

### Security Intent
Mitigates Time-of-Check to Time-of-Use (TOCTOU) vulnerability window between state check and state usage.

### Tradeoffs and Assumptions
*   **Tradeoff**: High computational cost of computing the Mahalanobis distance ($O(d^2)$ matrix operation) on every transition.
*   **Assumption**: Telemetry metrics follow a multivariate normal distribution to ensure the validity of the Mahalanobis metric.
