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
        Main->>Main: Resolve targetDir to Absolute Path (In-Memory MFT Tree)
        Main->>Kernel: Request USN Journal & Enumerate Master File Table
        Kernel-->>Main: Raw Directory/File Handlers
        Main->>Buffer: Store Path in `fileQueue[head]`
        Main->>Buffer: std::atomic `head++` (Release Semantics)
        
        Buffer-->>Worker: Spinlock acquires `tail` (Compare-And-Swap)
        Worker->>Kernel: OpenFileById (using pre-resolved FRN)
        Worker->>Kernel: CreateFileMappingA / MapViewOfFile (up to 30MB map)
        Kernel-->>Worker: OS Memory Manager hands direct zero-allocation pointer
        
        alt is Compressed (.zip, .gz, .tar)
            Worker->>ArchBuffer: Push to `archiveQueue[archHead]` (Out-of-band)
            ArchBuffer-->>ArchWorker: CAS Pop `archTail`
            ArchWorker->>Kernel: Native In-Memory ZLIB DEFLATE (#ifdef) / popen
            Kernel-->>ArchWorker: Decompressed stream mapped directly to memory
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
            Worker->>Worker: Lock-Free Push to Thread-Local vector
            ArchWorker->>ArchWorker: Lock-Free Push to Thread-Local vector
        end
    end
    
    Main->>Main: Batch Merge Thread-Local vectors into Global Anomaly List
    
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
        alignas_64_atomic_int head "Producer Index (Main Thread)"
        alignas_64_atomic_int tail "Consumer Index (CAS Target)"
    }
    
    SECONDARY_ARCHIVE_QUEUE {
        struct LinuxFileTask[8192] "Out-of-Band Queue"
        alignas_64_atomic_int archHead "Producer Index (Worker Thread)"
        alignas_64_atomic_int archTail "Consumer Index (Archive Thread)"
    }
    
    WORKER_THREAD ||--|| THREAD_MEMORY_BUFFER : reserves
    ARCHIVE_WORKER_THREAD ||--|| THREAD_MEMORY_BUFFER : reserves
    
    THREAD_MEMORY_BUFFER {
        size_t MAX_BUFFER_SIZE "Up to 30MB Memory Map Boundary"
        string Allocation "Zero-Allocation MapViewOfFile (Win32)"
        string I_O "Hardware OS Paging (No Synchronous I/O)"
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
        vector m3_anomalies "Thread-Local batch-merged on thread exit"
        vector m4_anomalies "Thread-Local batch-merged on thread exit"
        vector m5_anomalies "Thread-Local batch-merged on thread exit"
        vector m6_anomalies "Thread-Local batch-merged on thread exit"
    }
```
