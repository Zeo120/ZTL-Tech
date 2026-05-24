#ifndef COMPUTE_BALANCER_H
#define COMPUTE_BALANCER_H

#if defined(_WIN32)
#include <windows.h>
#else
#define _GNU_SOURCE
#include <pthread.h>
#include <unistd.h>
#include <sched.h>
#include <sys/mman.h>
#endif
#include <stdlib.h>

// Determine number of physical cores
static inline int get_core_count(void) {
#if defined(_WIN32)
    SYSTEM_INFO sysinfo;
    GetSystemInfo(&sysinfo);
    return (int)sysinfo.dwNumberOfProcessors;
#else
    return (int)sysconf(_SC_NPROCESSORS_ONLN);
#endif
}

// Pin current thread to core index with priority elevation and physical core mapping (SMT/hyperthreading avoidance)
static inline void pin_current_thread(int core_index) {
    // 1. Thread priority elevation
#if defined(_WIN32)
    SetThreadPriority(GetCurrentThread(), THREAD_PRIORITY_HIGHEST);
#else
    struct sched_param param;
    param.sched_priority = 50; // high priority
    pthread_setschedparam(pthread_self(), SCHED_RR, &param);
#endif

    // 2. Physical core mapping (prioritize even-numbered physical cores over hyperthreaded siblings)
    int cores = get_core_count();
    if (cores <= 0) cores = 1;
    int target_core = (core_index * 2) % cores;

#if defined(_WIN32)
    SetThreadAffinityMask(GetCurrentThread(), 1ULL << target_core);
#else
    cpu_set_t cpuset;
    CPU_ZERO(&cpuset);
    CPU_SET(target_core, &cpuset);
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

// Allocate high-performance memory using HugePages / Large Pages (with fallback)
static inline void* allocate_huge_pages(size_t size) {
#if defined(_WIN32)
    // Attempt large pages commit (requires SeLockMemoryPrivilege enabled in OS), fallback to standard VirtualAlloc
    void* ptr = VirtualAlloc(NULL, size, MEM_COMMIT | MEM_RESERVE | MEM_LARGE_PAGES, PAGE_READWRITE);
    if (!ptr) {
        ptr = VirtualAlloc(NULL, size, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
    }
    return ptr;
#else
    // Attempt Linux HugeTLB anonymous mapping, fallback to malloc
    void* ptr = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
    if (ptr == MAP_FAILED) {
        ptr = malloc(size);
    }
    return ptr;
#endif
}

// Free HugePages allocated memory
static inline void free_huge_pages(void* ptr, size_t size) {
    if (!ptr) return;
#if defined(_WIN32)
    (void)size;
    VirtualFree(ptr, 0, MEM_RELEASE);
#else
    // Attempt to unmap first (checking standard size unmapping), fallback to free
    if (munmap(ptr, size) != 0) {
        free(ptr);
    }
#endif
}

#endif // COMPUTE_BALANCER_H
