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
