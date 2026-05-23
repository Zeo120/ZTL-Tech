# PHASR Phase 3 | Invariant Drift & Assumption Monitoring

## Target Workflow: Telemetry Collector & Assumption Graph

### Recommended Language: C (with eBPF)

---

### Technical Rationale

1.  **Native Kernel Integration:**
    To monitor system drift, PHASR must run hooks inside the Linux kernel using eBPF. The eBPF probes must be written in raw, restricted **C** to compile natively into BPF bytecode without importing garbage-collected runtimes.

2.  **Low-Level System Observability:**
    C provides direct access to kernel data structures, system call tables, network socket headers, and file system descriptors, ensuring that telemetry is captured at the source with minimal instruction overhead.

3.  **Low-Level Graph Processing:**
    The user-space collector that processes eBPF ring buffers is written in C, utilizing flat array representations of the assumption dependency graph to ensure CPU cache locality and prevent memory allocation overhead.
