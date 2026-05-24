# PHASR | Mathematical Models & Physics Equations

This document provides detailed derivations, mathematical proofs, and numerical examples for the physical models and wave solvers integrated across the PHASR verification suite and the **Satan's Recursion** module.

---

## 1. Carter's Constant ($Q$) Invariant

### 1.1 Context and Derivation
In a rotating, axisymmetric spacetime described by the **Kerr metric**, a test particle's trajectory (geodesic) preserves three standard constants of motion:
1. **Energy ($E$):** Associated with the stationarity of the metric (time translation Killing vector $\xi_t = \partial_t$).
2. **Axial Angular Momentum ($L_z$):** Associated with axisymmetry (rotation Killing vector $\xi_\phi = \partial_\phi$).
3. **Rest Mass ($m$):** Associated with the normalized 4-velocity metric constraint $g_{\mu\nu} p^\mu p^\nu = -m^2$.

In 1968, Brandon Carter discovered that the Kerr geodesic equations are completely separable, implying the existence of a fourth constant of motion, **Carter's Constant ($Q$)**. This invariant is associated with a second-rank symmetric **Killing tensor** $K_{\mu\nu}$ satisfying the Killing equation:
$$\nabla_{(\lambda} K_{\mu\nu)} = 0$$
The constant $Q$ is defined along any geodesic with 4-momentum $p^\mu$ as:
$$Q = K_{\mu\nu} p^\mu p^\nu$$
In Boyer-Lindquist coordinates, the tensor components yield:
$$Q = p_\theta^2 + \cos^2\theta \left[ a^2(m^2 - E^2) + \frac{L_z^2}{\sin^2\theta} \right]$$

### 1.2 Mathematical Proof (Separability)
The Hamilton-Jacobi equation for a particle of mass $m$ is:
$$\frac{\partial S}{\partial \lambda} + \frac{1}{2} g^{\mu\nu} \frac{\partial S}{\partial x^\mu} \frac{\partial S}{\partial x^\nu} = 0$$
Using the Boyer-Lindquist inverse metric components and assuming a separated action $S(\lambda, t, r, \theta, \phi) = -\frac{1}{2} m^2 \lambda - E t + L_z \phi + S_r(r) + S_\theta(\theta)$, we substitute and expand:
$$\Delta \left( \frac{dS_r}{dr} \right)^2 - \frac{\left[ (r^2 + a^2)E - a L_z \right]^2}{\Delta} + m^2 r^2 + \left( \frac{dS_\theta}{d\theta} \right)^2 + \cos^2\theta \left( a^2 (m^2 - E^2) + \frac{L_z^2}{\sin^2\theta} \right) = 0$$
Since the terms group cleanly into functions of $r$ and functions of $\theta$, they must equal a separation constant $C$ (related to $Q$):
$$\left( \frac{dS_\theta}{d\theta} \right)^2 + \cos^2\theta \left[ a^2(m^2 - E^2) + \frac{L_z^2}{\sin^2\theta} \right] = Q$$
Recognizing that $p_\theta = \frac{\partial S}{\partial \theta} = \frac{dS_\theta}{d\theta}$, this directly proves the invariance of $Q$:
$$Q = p_\theta^2 + \cos^2\theta \left[ a^2(m^2 - E^2) + \frac{L_z^2}{\sin^2\theta} \right]$$

### 1.3 Numerical Example
Consider a photon ($m = 0$) orbiting in a Kerr spacetime with spin parameter $a = 0.5$ at an angle $\theta = \frac{\pi}{4}$ with invariants $E = 1.0$ and $L_z = 2.0$. Suppose the conjugate momentum $p_\theta$ is measured to be $1.5$.
1. Evaluate trigonometric values:
   $$\cos^2\left(\frac{\pi}{4}\right) = 0.50, \quad \sin^2\left(\frac{\pi}{4}\right) = 0.50$$
2. Substitute parameters into the equation:
   $$Q = 1.5^2 + 0.5 \left[ 0.5^2(0 - 1.0^2) + \frac{2.0^2}{0.5} \right]$$
   $$Q = 2.25 + 0.5 \left[ 0.25(-1.0) + 8.0 \right]$$
   $$Q = 2.25 + 0.5 \left[ -0.25 + 8.0 \right]$$
   $$Q = 2.25 + 0.5 \left[ 7.75 \right] = 2.25 + 3.875 = 6.125$$
At any point along the geodesic trajectory, the computed value will always equal $6.125$.

---

## 2. Kerr Metric Coefficients in Boyer-Lindquist Coordinates

### 2.1 Derivation & Coefficients
The Kerr line element in Boyer-Lindquist coordinates $(t, r, \theta, \phi)$ is:
$$ds^2 = g_{00} dt^2 + 2g_{03} dt d\phi + g_{11} dr^2 + g_{22} d\theta^2 + g_{33} d\phi^2$$
We define auxiliary functions:
$$\Delta = r^2 - 2Mr + a^2, \quad \rho^2 = r^2 + a^2 \cos^2\theta$$
where $M$ is the black hole mass and $a$ is the angular momentum per unit mass ($a = J/M$). The metric coefficients are:
$$g_{00} = -\left(1 - \frac{2Mr}{\rho^2}\right)$$
$$g_{33} = \left(r^2 + a^2 + \frac{2Mra^2\sin^2\theta}{\rho^2}\right)\sin^2\theta$$
$$g_{11} = \frac{\rho^2}{\Delta}, \quad g_{22} = \rho^2, \quad g_{03} = -\frac{2Mra\sin^2\theta}{\rho^2}$$

### 2.2 Numerical Example
Let $M = 1.0$, $a = 0.8$, $r = 3.0$, and $\theta = \frac{\pi}{6}$ (30 degrees).
1. Compute auxiliary variables:
   $$\cos^2\left(\frac{\pi}{6}\right) = 0.75, \quad \sin^2\left(\frac{\pi}{6}\right) = 0.25$$
   $$\Delta = 3.0^2 - 2(1.0)(3.0) + 0.8^2 = 9.0 - 6.0 + 0.64 = 3.64$$
   $$\rho^2 = 3.0^2 + 0.8^2(0.75) = 9.0 + 0.64(0.75) = 9.0 + 0.48 = 9.48$$
2. Compute $g_{00}$:
   $$g_{00} = -\left(1 - \frac{2(1.0)(3.0)}{9.48}\right) = -\left(1 - \frac{6.0}{9.48}\right) \approx -(1 - 0.6329) = -0.3671$$
3. Compute $g_{33}$:
   $$g_{33} = \left(3.0^2 + 0.8^2 + \frac{2(1.0)(3.0)(0.8^2)(0.25)}{9.48}\right)(0.25)$$
   $$g_{33} = \left(9.0 + 0.64 + \frac{6.0(0.64)(0.25)}{9.48}\right)(0.25)$$
   $$g_{33} = \left(9.64 + \frac{0.96}{9.48}\right)(0.25) \approx (9.64 + 0.1013)(0.25) \approx 9.7413 \times 0.25 = 2.4353$$

---

## 3. Continuous Damped Wave Equations (FDTD)

### 3.1 Mathematical Derivation
Continuous telemetry and privilege signals are modeled as a damped, driven wave equation:
$$\frac{\partial^2 \Phi}{\partial t^2} + \gamma \frac{\partial \Phi}{\partial t} - v^2 \frac{\partial^2 \Phi}{\partial x^2} = S(x, t)$$
where $\gamma$ is the damping coefficient, $v$ is the wave propagation velocity, and $S(x, t)$ is the spatial driving force.

To solve this numerically using the **Finite-Difference Time-Domain (FDTD)** method, we approximate derivatives with central difference equations at discrete steps $n$ and grid points $i$:
$$\frac{\partial^2 \Phi}{\partial t^2} \approx \frac{\Phi_i^{n+1} - 2\Phi_i^n + \Phi_i^{n-1}}{\Delta t^2}$$
$$\frac{\partial \Phi}{\partial t} \approx \frac{\Phi_i^{n+1} - \Phi_i^{n-1}}{2\Delta t}$$
$$\frac{\partial^2 \Phi}{\partial x^2} \approx \frac{\Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n}{\Delta x^2}$$

Substituting these approximations into the continuous equation:
$$\frac{\Phi_i^{n+1} - 2\Phi_i^n + \Phi_i^{n-1}}{\Delta t^2} + \gamma \frac{\Phi_i^{n+1} - \Phi_i^{n-1}}{2\Delta t} - v^2 \frac{\Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n}{\Delta x^2} = S_i^n$$

Multiply by $\Delta t^2$ and define the Courant number $r = \frac{v \Delta t}{\Delta x}$:
$$\left( \Phi_i^{n+1} - 2\Phi_i^n + \Phi_i^{n-1} \right) + \frac{\gamma \Delta t}{2} \left( \Phi_i^{n+1} - \Phi_i^{n-1} \right) - r^2 \left( \Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n \right) = \Delta t^2 S_i^n$$

Collect terms for $\Phi_i^{n+1}$ and solve:
$$\Phi_i^{n+1} \left(1 + \frac{\gamma \Delta t}{2}\right) = 2\Phi_i^n - \Phi_i^{n-1}\left(1 - \frac{\gamma \Delta t}{2}\right) + r^2 \left( \Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n \right) + \Delta t^2 S_i^n$$
$$\Phi_i^{n+1} = \frac{1}{1 + \gamma \Delta t / 2} \left[ 2\Phi_i^n - \Phi_i^{n-1}\left(1 - \frac{\gamma \Delta t}{2}\right) + r^2 \left( \Phi_{i+1}^n - 2\Phi_i^n + \Phi_{i-1}^n \right) + \Delta t^2 S_i^n \right]$$

### 3.2 Stability Criterion
For numerical stability, the Courant-Friedrichs-Lewy (CFL) condition must be satisfied:
$$r = \frac{v \Delta t}{\Delta x} \le 1.0$$
If $r > 1.0$, high-frequency numerical errors accumulate, leading to simulation divergence ($\Phi \rightarrow \pm\infty$).

### 3.3 Numerical Example
Let $r = 0.5$, damping $\gamma = 0.4$, source driving term $S = 0$, and time step size $\Delta t = 0.1$.
1. Compute coefficients:
   $$\frac{\gamma \Delta t}{2} = \frac{0.4 \times 0.1}{2} = 0.02$$
   $$\text{Denominator} = 1 + 0.02 = 1.02, \quad \text{Multiplier} = \frac{1}{1.02} \approx 0.9804$$
   $$\text{Previous step coefficient} = 1 - 0.02 = 0.98$$
2. Let the grid values at step $n$ be:
   $$\Phi_{i-1}^n = 0.10, \quad \Phi_i^n = 0.80, \quad \Phi_{i+1}^n = 0.20$$
   Let the value at step $n-1$ be:
   $$\Phi_i^{n-1} = 0.75$$
3. Compute the next state $\Phi_i^{n+1}$:
   $$\Phi_i^{n+1} = 0.9804 \left[ 2(0.80) - 0.75(0.98) + 0.5^2 (0.20 - 2(0.80) + 0.10) \right]$$
   $$\Phi_i^{n+1} = 0.9804 \left[ 1.60 - 0.735 + 0.25 (0.30 - 1.60) \right]$$
   $$\Phi_i^{n+1} = 0.9804 \left[ 0.865 + 0.25 (-1.30) \right]$$
   $$\Phi_i^{n+1} = 0.9804 \left[ 0.865 - 0.325 \right]$$
   $$\Phi_i^{n+1} = 0.9804 \left[ 0.540 \right] \approx 0.5294$$
The wave state successfully decays and propagates from $0.80$ to $0.5294$.
