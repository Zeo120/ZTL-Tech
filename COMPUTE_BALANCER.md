# PHASR | Custom Compute Balancer Architectural Specification

This document details the design, platform primitives, thread affinity configurations, and concurrency patterns of the **Deterministic Custom Compute Balancer** integrated across the PHASR security verification suite.

---

## 1. Executive Summary & Design Goals

High-throughput validation of complex invariant equations involves billions of static loop cycles, creating unique hardware and software challenges:
1. **Thermal Junction Spikes ($T_J > 90^\circ\text{C}$):** Continuous multi-threaded execution pushes silicon to its thermal limit, triggering aggressive OS/hardware thermal throttling.
2. **Scheduler Non-Determinism:** Standard CPU schedulers dynamically migrate threads across cores, causing execution duration variance and thrashing local caches.
3. **L1 Instruction Cache (I-Cache) Thrashing:** Running millions of lines of unrolled validation assembly exceeds the typical 32KB L1 I-Cache, creating memory bus bottlenecks.

The **Custom Compute Balancer** solves these issues through static thread-to-core mapping, localized cache tiling, and deterministic sleep pacing.

---

## 2. Platform Primitives Abstraction

All verification phases (Phase 1 through 5, and Satan's Recursion) utilize the unified macro/inline wrapper definitions in [compute_balancer.h](file:///d:/Project%20XT/phasr/compute_balancer.h).

```cpp
#ifndef COMPUTE_BALANCER_H
#define COMPUTE_BALANCER_H

#if defined(_WIN32)
#include <windows.h>
#else
#define _GNU_SOURCE
#include <pthread.h>
#include <unistd.h>
#include <sched.h>
#endif

// Determine number of physical/logical cores
static inline int get_core_count(void) {
#if defined(_WIN32)
    SYSTEM_INFO sysinfo;
    GetSystemInfo(&sysinfo);
    return (int)sysinfo.dwNumberOfProcessors;
#else
    return (int)sysconf(_SC_NPROCESSORS_ONLN);
#endif
}

// Pin current thread to core index
static inline void pin_current_thread(int core_index) {
    int cores = get_core_count();
    if (cores <= 0) cores = 1;
#if defined(_WIN32)
    SetThreadAffinityMask(GetCurrentThread(), 1ULL << (core_index % cores));
#else
    cpu_set_t cpuset;
    CPU_ZERO(&cpuset);
    CPU_SET(core_index % cores, &cpuset);
    pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &cpuset);
#endif
}

// Paced sleep in milliseconds
static inline void paced_sleep(int ms) {
#if defined(_WIN32)
    Sleep((DWORD)ms);
#else
    usleep((useconds_t)ms * 1000);
#endif
}

#endif // COMPUTE_BALANCER_H
```

---

## 3. Core Architectural Pillars

### A. NUMA Core Pinning (Thread Affinity)
By locking each worker thread onto a single physical core, we prevent the operating system from migrating threads. This preserves **L1/L2 cache locality** and ensures that the core's cache lines remain warm with local validation parameters.

### B. Static Task Partitioning (No Work-Stealing)
Traditional task schedulers use dynamic work-stealing (e.g., Intel TBB, OpenMP) which allocates work based on runtime scheduler state. The PHASR balancer uses a deterministic **static round-robin** allocation mapping chunk $C$ to thread $T$:
$$T = C \pmod N$$
where $N$ is the number of active threads. This ensures identical execution steps across multiple runs.

### C. Thermal Duty-Cycle Pacing
To limit junction temperatures ($T_J$) to a safe range ($65^\circ\text{C}$ to $70^\circ\text{C}$), worker threads execute paced sleep cycles:
- Workers sleep for **1 millisecond** after completing a validation block (typically 100 assertions).
- This introduces a deterministic cool-down duty cycle, preventing physical hardware degradation and throttling spikes.

---

## 4. Concurrency & Thread-Safety Patterns

To allow concurrent thread execution without performance degradation or data corruption, the balancer enforces strict **thread-local isolation** across all verification engines:

### 1. Thread-Local Statistics Accumulation
Instead of writing directly to global stats variables (which introduces cache-line bouncing and lock-contention), each worker thread maintains a private statistical counter structure:
```cpp
typedef struct {
    uint32_t passed_count;
    uint32_t failed_count;
    uint32_t total_count;
} fsm_test_stats_t;
```
These are aggregated on the master thread after joining all worker threads.

### 2. Thread-Local Telemetry Buffers (Phase 3)
During telemetry collector verification, ring buffers are populated and popped. In multi-threaded execution, a shared ring buffer causes race conditions. The balancer allocates a private `ring_buffer_t` locally in each thread's stack:
```c
ring_buffer_t local_rb;
init_ring_buffer(&local_rb);
// Safe to push/pop without mutex lock contention
```

---

## 5. Verification Mapping Summary

The Custom Compute Balancer is implemented uniformly across the entire verification suite:

| Phase | Path | Target Code | Threads | Pacing | Race Mitigation |
| :--- | :--- | :--- | :---: | :---: | :--- |
| **Phase 1** | Temporal Validator | `phase_fsm.c` | Up to 22 | `paced_sleep(1)` | Thread-local FSM stats |
| **Phase 2** | Reachability Engine | `reachability_engine.cpp` | Up to 10 | `paced_sleep(1)` | Thread-local Graph stats |
| **Phase 3** | Telemetry Collector | `telemetry_collector.c` | Up to 5 | `paced_sleep(1)` | Thread-local stats & eBPF ring buffers |
| **Phase 4** | Chaos Verifier | `chaos_verifier.cpp` | Up to 10 | `paced_sleep(1)` | Thread-local Control stats |
| **Phase 5** | Consensus Auditor | `consensus_auditor.c` | Up to 10 | `paced_sleep(1)` | Thread-local Audit stats |
| **Satan-R** | Curved Spacetime Sim | `satan_recursion.cpp` | Native CPU count | `paced_sleep(1)` | Thread-local Kerr stats |
