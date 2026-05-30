# Satan's Recursion — Curved Spacetime Wave Propagation

This document details the mathematical equations, intent, tradeoffs, and assumptions behind the curved spacetime wave verifier in **Satan's Recursion**.

---

## 1. Covariant D'Alembertian in 1+1D Curved Spacetime

### Continuous Equation
$$\Box_g \Psi \equiv \frac{1}{\sqrt{-g}}\, \partial_\mu\!\left(\sqrt{-g}\, g^{\mu\nu}\, \partial_\nu \Psi\right) = 0$$

### Discrete Curved FDTD Update
$$\Psi_i^{n+1} = 2\Psi_i^n - \Psi_i^{n-1} + \mathcal{F}_i\!\left[\sqrt{-g}_{i+1}\,g^{11}_{i+1}\!\left(\Psi_{i+1}^n - \Psi_i^n\right) - \sqrt{-g}_{i-1}\,g^{11}_{i-1}\!\left(\Psi_i^n - \Psi_{i-1}^n\right)\right]$$

Where:
*   $\mathcal{F}_i = \frac{r^2}{\sqrt{-g}_i\, g^{00}_i}$ represents the local coordinate geometry scaling.

### Security Intent
Tests the numerical solver under complex general relativistic conditions. Telemetry amplitudes warp the spacetime manifold, verifying that FDTD stability holds even under dynamic metric scaling.

### Tradeoffs and Assumptions
*   **Tradeoff**: 1+1D restriction simplifies the field complexity but ignores angular cross-terms present in true 3+1D Kerr metrics.
*   **Assumption**: The metric changes slowly relative to the FDTD grid update frequency.

---

## 2. Metric Modulation via Telemetry Coupling

### Mathematical Formulation
$$\kappa(t) = 0.15 \times \sum_{p=1}^{4} \Phi_p(t)$$
$$g^{00}_i = 1 + \kappa(t) \cdot \exp\!\left(-\frac{(i - 20)^2}{50}\right) \quad \text{and} \quad g^{11}_i = \frac{1}{g^{00}_i}$$

### Security Intent
Couples structural validation states directly to the geometric curvature of the wave solver. High anomaly scores produce extreme metric curvature, leading to a simulation singularity.

---

## 3. Carter's Constant — Kerr Geodesic Invariant

### Mathematical Formulation
$$Q = p_\theta^2 + \cos^2\theta\!\left[a^2(m^2 - E^2) + \frac{L_z^2}{\sin^2\theta}\right]$$

### Security Intent
Serves as a high-precision calibration check. Any numerical path through the curved metric must conserve $Q$. If $dQ/d\tau > 0$, it flags drift in the FDTD solver before it pollutes attestation logs.

---

## 4. Kerr Metric Coefficients in Boyer-Lindquist Coordinates

### Line Element
$$ds^2 = g_{00}\,dt^2 + 2g_{03}\,dt\,d\phi + g_{11}\,dr^2 + g_{22}\,d\theta^2 + g_{33}\,d\phi^2$$
Where:
*   $g_{00} = -\left(1 - \frac{2Mr}{\rho^2}\right)$
*   $g_{11} = \frac{\rho^2}{\Delta}$
*   $g_{22} = \rho^2$
*   $g_{33} = \left(r^2 + a^2 + \frac{2Mra^2\sin^2\theta}{\rho^2}\right)\sin^2\theta$

---

## 5. Einstein's Field Equations — Spacetime Curvature of Codebase Vulnerabilities

### Mathematical Formulation
$$R_{\mu\nu} - \frac{1}{2} R g_{\mu\nu} + \Lambda g_{\mu\nu} = \kappa T_{\mu\nu}$$

### Security Intent
Models codebase vulnerabilities as physical mass-energy, dragging execution paths (geodesics) toward failure singularities.
