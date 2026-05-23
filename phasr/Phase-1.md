# PHASR Phase 1 | Lifecycle Sequence Verification

## Target Workflow: Phase FSM Validator

### Recommended Languages: x86-64 Assembly / C

---

### Technical Rationale

1.  **Zero Overhead Enclave Execution:**
    The Phase FSM validator must run inside restricted hardware enclaves (Intel SGX / AWS Nitro). Executing this validator via custom-tailored **x86-64 Assembly** ensures there is zero runtime overhead, zero library dependencies, and the smallest possible executable footprint.

2.  **Instruction-Level Determinism:**
    By writing the core FSM transition check in Assembly, we have absolute control over the CPU registers and instruction execution count. This guarantees that validation execution time is constant and completely immune to compiler optimization deviations.

3.  **Low-Level State Boundary Protection:**
    C is used as the interface wrapper to feed telemetry variables into the Assembly execution block, ensuring direct access to register allocations and memory-page segmentation.

---

## Edge Cases Handled & Security Hardening

### 1. Verification Edge Cases
*   **Out-of-Bounds Values**: Any `current_state` or `next_state` argument value outside the valid range of `[0, 7]` is immediately intercepted and blocked.
*   **Non-Sequential State Jumps**: The validator prevents bypassing verification stages (leapfrogging). The only permitted forward transition is $s_b = s_a + 1$.
*   **Missing Prerequisites**: Every state progression requires specific prerequisite bits in the 64-bit validator bitmask. If a single dependent bit is missing, the validator blocks the execution path.
*   **Fail-Closed State Reset**: Transition to state `0` (Reset / Disconnect) is allowed from any state to handle session timeouts, panic conditions, or cluster node failover resets safely.
*   **Constant-Time Execution**: No conditional branch instructions depend on the values of the state variables during validation. This guarantees constant execution time and mitigates timing side-channel attacks.

### 2. Software Hardening & Toolchain Security
*   **Control Flow Guard (`/guard:cf`)**: Enables compiler and linker security checks to prevent hijack attempts targeting indirect call paths.
*   **Buffer Security Check (`/GS`)**: Inserts stack canary checks to detect buffer overflows and immediately terminate execution.
*   **Zero-Warning Enforcement (`/W4 /WX`)**: Treats all warnings as compile-time errors to ensure strict code cleanliness.

