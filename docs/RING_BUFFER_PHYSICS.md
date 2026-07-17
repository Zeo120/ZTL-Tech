# Single-Producer Multiple-Consumer (SPMC) Ring Buffer

## Overview
At speeds exceeding 25,000 files per second, traditional CPU threading models collapse due to lock contention. If 16 threads fight for a `std::mutex`, the OS spends more time context-switching and stalling the memory bus than actually reading the files.

PHASR solves this using a **Lock-Free SPMC Ring Buffer** utilizing C++11 Atomics.

## The Physical State Mechanics

The queue is backed by an immutably sized 2D character array, mapping perfectly into contiguous CPU cache lines:
```cpp
char taskQueue[8192][MAX_PATH];
```

Three atomic invariants govern the state physics:
1. `queueHead`: Points to the next task to be consumed.
2. `queueTail`: Points to the next empty slot for the producer.
3. `activeWorkers`: Tracks core saturation.

### Consumer Consumption Equation

When a consumer thread attempts to take a task, it must overcome atomic cache line contention using Compare-And-Swap (CAS):

$$ \text{State}_{t+1} = \begin{cases} \text{Success}, & \text{if } \text{CAS}(\text{queueHead}, H, H+1) == \text{True} \\ \text{Spin}, & \text{if } \text{CAS}(\text{queueHead}, H, H+1) == \text{False} \end{cases} $$

The consumer thread executes a `std::memory_order_acquire` load to read the current head. It then copies the immutable path into local L1 memory *before* triggering the CAS instruction. This fundamentally eliminates the risk of the Producer overwriting the memory while it's in transit.

### Yield Starvation Physics

A critical failure in basic lock-free queues is spinlock starvation. If a consumer thread loops indefinitely on a failed CAS:
```cpp
while (true) { /* Spin */ }
```
It triggers a `PAUSE` instruction storm, saturating the CPU pipeline and denying the Producer thread the physical silicon time-slice it needs to read the Master File Table (MFT).

PHASR leverages OS context yielding to bypass this:
```cpp
Sleep(0); // Yield time slice
```
By executing `Sleep(0)`, the thread instantly surrenders the remainder of its OS scheduling quantum, effectively pausing itself in silicon and granting immediate 100% core access back to the main Producer thread. This mathematical balance allows the system to achieve its 60,000 f/s rating.
