# PHASR Satan's Recursion Module

This directory houses the **Satan's Recursion** curved spacetime wave solver and verification engine. It statically generates and unrolls Kerr spacetime geodesic coordinate validators, scaling up to 1,000,000 instances, and outputs binary simulation telemetry to render high-fidelity animations.

---

## 1. Directory Contents

* **`satan_recursion.cpp`**: C++ master driver, implementing the covariant wave propagation solver, pointer lookup tables, and unit test entry points.
* **`satan_chunk_xx.cpp`**: Statically generated C++ fallback invariant routines (partitioned into chunks).
* **`satan_chunk_xx_x64.s`**: Statically generated x86-64 assembly containing unrolled Kerr metric routines.
* **`satan_chunk_xx_arm64.s`**: Statically generated ARM64 assembly containing unrolled Kerr metric routines.
* **`Makefile`**: Cross-platform Makefile to automatically detect platform and link all assembly engine chunks.
* **`build.bat`**: Windows MSVC C++ compilation script to compile all chunks and driver.
* **`render_video.py`**: Python script to parse binary outputs and render high-fidelity simulation videos.

---

## 2. Compilation and Verification

### Option A — Windows x86-64 (MSVC C++ Fallback)

1. Ensure **Visual Studio Build Tools** (MSVC C++ compiler) is installed.
2. Run the build batch file:
   ```cmd
   cd phasr\Satan-Recursion
   build.bat
   ```
3. The script compiles all C++ chunks (`*.cpp`) with `/EHsc /W4 /WX /GS /Od` flags and executes the test suite.

### Option B — Linux x86-64 or ARM64 (GAS / GCC)

1. Build using the cross-platform Makefile:
   ```bash
   cd phasr/Satan-Recursion
   make
   ```
2. The Makefile automatically detects the host architecture (`uname -m`) and compiles and links all `satan_chunk_*_x64.s` (on x86-64) or `satan_chunk_*_arm64.s` (on ARM64) files dynamically.
3. Run the output binary:
   ```bash
   ./satan_recursion
   ```

---

## 3. High-Scale Simulation & Video Rendering

To scale the spacetime wave simulation up to 1,000,000 steps and export the states to render video animations:

1. **Run Driver Exporter:**
   ```cmd
   .\satan_recursion.exe --steps 1000000 --export spacetime_simulation.bin --silent
   ```
   * *Output:* `spacetime_simulation.bin` (size: `160,000,008` bytes containing 1,000,000 frames of a 40-cell grid of single-precision floats).

2. **Render Video / GIF:**
   ```bash
   python render_video.py spacetime_simulation.bin gif
   ```
   * *Output:* `spacetime_simulation.gif` (high-fidelity animation showing geodesic wave propagation).

---

## 4. Code Generation & Scaling

The C++ and assembly verification files are generated using:
```bash
node generate_satan.js --chunks <num_chunks> --routines <routines_per_chunk>
```
* **Default 100X Scale (100,000 routines):**
  `node generate_satan.js --chunks 10 --routines 10000`
* **Default 1000X Scale (1,000,000 routines):**
  `node generate_satan.js --chunks 100 --routines 10000`

## 5. Mathematical Models & Equations

For details on the covariant D'Alembertian wave propagation and module design, refer to [Satan-Recursion.md](Satan-Recursion.md).
For detailed analytical derivations, proofs, and step-by-step numerical examples of Kerr metrics and Carter's invariants, refer to the unified [Equation.md](../equations/Equation.md) specification.
