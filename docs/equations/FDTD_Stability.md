# FDTD Wave Solver & CFL Stability Criterion

This document details the general mathematical discretisation and stability analysis used in all PHASR wave propagation simulation kernels.

---

## 1. FDTD Discretisation of the General Damped Wave Equation

### Continuous PDE
$$\frac{\partial^2 \Phi}{\partial t^2} + \gamma \frac{\partial \Phi}{\partial t} - v^2 \frac{\partial^2 \Phi}{\partial x^2} = f(x,t)$$

### Explicit Update Rule
$$\Phi_i^{n+1} = \frac{2\Phi_i^n - \Phi_i^{n-1}\!\left(1 - \frac{\gamma\Delta t}{2}\right) + r^2\!\left(\Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n\right) + \Delta t^2 f_i^n}{1 + \frac{\gamma\Delta t}{2}}$$

Where:
*   $r = \frac{v\Delta t}{\Delta x}$ is the Courant number.
*   $\gamma \geq 0$ is the damping coefficient.
*   $f(x, t)$ is the source injection term.

### Tradeoffs and Assumptions
*   **Tradeoff**: The central-difference approximation is second-order accurate in space and time, balancing computational cost with solver accuracy.
*   **Assumption**: Metric variables are slowly-varying relative to the simulation time step $\Delta t$.

---

## 2. CFL Stability Criterion

### Mathematical Formulation
$$r = \frac{v \cdot \Delta t}{\Delta x} \leq 1.0$$

### Security Intent
If $r > 1.0$, rounding errors grow exponentially at each step, causing numerical blowup to infinity. We check this boundary at startup to reject corrupted configuration states.

### Tradeoffs and Assumptions
*   **Tradeoff**: Constrains the maximum time step $\Delta t$ based on spatial resolution, requiring more iterations to model longer windows.
*   **Assumption**: The spatial grid spacing $\Delta x$ is uniform.
