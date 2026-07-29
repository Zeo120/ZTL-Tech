# PHASR Data Flow & Inter-Process Communication

This document visualizes the execution lifecycle and memory structures within the PHASR architecture, tracing data transitions from the Command-Line Router to the Windows NTFS (MFT) and Linux (getdents64) kernel boundaries.

## 1. Cross-Platform Execution Sequence
The following sequence diagram traces the chronological execution path of a codebase scan. The Node.js CLI dynamically routes execution to the natively compiled OS-specific binary, entirely detaching itself from the hot path.

```mermaid
sequenceDiagram
    autonumber
    actor User
    participant CLI as Node.js Universal Router
    participant Main as C++ Orchestrator (Main Thread)
    participant Buffer as Primary SPMC Ring Buffer
    participant ArchBuffer as Secondary Archive Queue
    participant Worker as Primary Worker Threads
    participant ArchWorker as Archive Decomp Threads
    participant Kernel as Win32 (MFT) / POSIX (getdents64)

    User->>CLI: `phasr . --threads 64 --archive-threads 4`
    CLI->>CLI: Strictly route via `process.platform` & `process.arch`
    CLI->>Main: Execute Native Binary (`engine.exe`, `phasr_arm64`, `engine`)
    
    rect rgb(20, 40, 20)
        Note over Main, Kernel: KERNEL-BYPASS ZERO-ALLOCATION HOT LOOP
        Main->>Main: Resolve targetDir to Absolute Path
        Main->>Kernel: Request Standard Directory Handlers (MFT Bypass is PoC only)
        Kernel-->>Main: Raw Directory/File Handlers
        Main->>Buffer: Store Path in `fileQueue[head]`
        Main->>Buffer: std::atomic `head++` (Release Semantics)
        
        Buffer-->>Worker: Spinlock acquires `tail` (Compare-And-Swap)
        Worker->>Kernel: Open / CreateFileA (File Path)
        Worker->>Kernel: ReadFile / read (up to 12KB chunk)
        Kernel-->>Worker: Bytes copied to 12KB Thread Buffer (Synchronous I/O)
        
        alt is Compressed (.zip, .gz, .tar)
            Worker->>ArchBuffer: Push to `archiveQueue[archHead]` (Out-of-band)
            ArchBuffer-->>ArchWorker: CAS Pop `archTail`
            ArchWorker->>Kernel: popen / _popen (tar -xOf / gzip -dc)
            Kernel-->>ArchWorker: Decompressed stream mapped to Thread Buffer
            ArchWorker->>ArchWorker: M3 (Entropy): Analyze Unpacked Payload
        else is Standard File
            par Concurrent Analysis Modules
                Worker->>Worker: M3 (Entropy): Calculate Shannon H(X)
                Worker->>Worker: M4 (Taint): Scan std::string_view for injections
                Worker->>Worker: M5 (Temporal): clock_gettime / GetTickCount drift detection
                Worker->>Worker: M6 (Dissection): Static Binary Analysis (NOP Sleds)
            end
        end
        
        alt Module Triggered Anomaly
            Worker->>Main: lock(printCS) -> push_back(anomalies)
            ArchWorker->>Main: lock(printCS) -> push_back(anomalies)
        end
    end
    
    Main->>Main: M7 (Risk Assessment): Compute Liability vs Total Size
    Main->>User: Output Clean Summary & write `phasr_security_report.md`
```

---

## 2. Entity-Relationship (Memory Topology) Diagram
At extreme throughput speeds, typical object-oriented structures trigger catastrophic heap fragmentation and thread contention. PHASR models its memory entirely as statically sized contiguous memory blocks mapped to CPU Cache lines, utilizing zero-allocation `std::string_view` structures.

The following ER diagram maps the relationships of memory structures across OS targets:

```mermaid
erDiagram
    UNIVERSAL_ROUTER ||--o{ OS_NATIVE_ENGINE : spawns_via_stdio_inherit
    OS_NATIVE_ENGINE ||--|| SPMC_RING_BUFFER : manages
    OS_NATIVE_ENGINE ||--|| SECONDARY_ARCHIVE_QUEUE : manages
    OS_NATIVE_ENGINE ||--o{ WORKER_THREAD : spawns_up_to_256
    OS_NATIVE_ENGINE ||--o{ ARCHIVE_WORKER_THREAD : spawns
    
    SPMC_RING_BUFFER {
        struct LinuxFileTask[8192] "Contiguous Array Queue"
        std_atomic_int head "Producer Index (Main Thread)"
        std_atomic_int tail "Consumer Index (CAS Target)"
    }
    
    SECONDARY_ARCHIVE_QUEUE {
        struct LinuxFileTask[8192] "Out-of-Band Queue"
        std_atomic_int archHead "Producer Index (Worker Thread)"
        std_atomic_int archTail "Consumer Index (Archive Thread)"
    }
    
    WORKER_THREAD ||--|| THREAD_MEMORY_BUFFER : reserves
    ARCHIVE_WORKER_THREAD ||--|| THREAD_MEMORY_BUFFER : reserves
    
    THREAD_MEMORY_BUFFER {
        size_t MAX_BUFFER_SIZE "Strict 12KB Cap per Thread (Prototype)"
        string Allocation "VirtualAlloc (Win32) / malloc equivalent"
        string I_O "Synchronous ReadFile (No mmap yet)"
    }
    
    WORKER_THREAD ||--|| FREQUENCY_ARRAY : computes
    ARCHIVE_WORKER_THREAD ||--|| FREQUENCY_ARRAY : computes
    
    FREQUENCY_ARRAY {
        uint32_t counts[256] "Byte Frequency Histogram (ARM64/x86 ABI)"
        double H_X "Shannon Entropy Float"
    }

    WORKER_THREAD }o--|| PIPELINE_ANOMALIES : triggers
    ARCHIVE_WORKER_THREAD }o--|| PIPELINE_ANOMALIES : triggers
    
    PIPELINE_ANOMALIES {
        vector m3_anomalies "Critical Section Protected"
        vector m4_anomalies "Critical Section Protected"
        vector m5_anomalies "Critical Section Protected"
        vector m6_anomalies "Critical Section Protected"
    }
```
