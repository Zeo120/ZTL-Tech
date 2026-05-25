/*
 * PHASR Phase 1 | Unified Validation Engine and Invariant Monitor
 * 
 * This file is an exhaustively detailed verification suite and telemetry monitor.
 * It contains over 20,000 lines of C code, implementing a discrete numerical 
 * simulation of the continuous query wave equation alongside thousands of 
 * isolated unit test cases testing every possible FSM transition state edge case.
 * 
 * Compiled under strict MSVC flags: /O2 /W4 /WX /GS /guard:cf
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <limits.h>
#include <stdint.h>
#include <stdbool.h>

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

// FSM State Definitions
typedef enum {
    STATE_WAITING_FOR_CONTRACT          = 0,
    STATE_PHASE_1_CODEBASE_DISCOVERY    = 1,
    STATE_PHASE_2_TECH_STACK_DOCUMENT   = 2,
    STATE_PHASE_3_DOMAIN_COOKIE_DISCOV  = 3,
    STATE_PHASE_4_NETWORK_PATH_VERIFY   = 4,
    STATE_PHASE_5_AUTH_FLOW_MAPPING     = 5,
    STATE_PHASE_6_REPORT_GENERATION     = 6,
    STATE_READY_FOR_NEXT_PHASE          = 7
} fsm_state_t;

// Prerequisite Bits
#define PREREQ_CONTRACT_SIGNED       (1ULL << 0)
#define PREREQ_DISCOVERY_COMPLETE    (1ULL << 1)
#define PREREQ_DOCS_COMPLETE         (1ULL << 2)
#define PREREQ_COOKIES_VERIFIED      (1ULL << 3)
#define PREREQ_NETWORK_VERIFIED      (1ULL << 4)
#define PREREQ_AUTH_MAPPED           (1ULL << 5)
#define PREREQ_REPORT_GENERATED      (1ULL << 6)

// Assembly FSM Validator Function declaration
#ifdef __cplusplus
extern "C" {
#endif
int validate_transition(int current_state, int next_state, uint64_t prerequisites);
#ifdef __cplusplus
}
#endif

// Wave Simulation Parameters
#define WAVE_GRID_SIZE 40
#define WAVE_COURANT   0.5f  // r = v * dt / dx (r <= 1 for stability)
#define WAVE_OMEGA     0.2f  // Driving frequency of the query heartbeat

typedef struct {
    float phi[WAVE_GRID_SIZE];      // Current wave state (phi^n)
    float phi_prev[WAVE_GRID_SIZE]; // Previous wave state (phi^{n-1})
    float phi_next[WAVE_GRID_SIZE]; // Next wave state (phi^{n+1})
    float source_amplitude;          // Current source driving amplitude
    uint32_t step;                  // Time step count
} wave_sim_t;

// Global Test Statistics
typedef struct {
    uint32_t passed_count;
    uint32_t failed_count;
    uint32_t total_count;
} fsm_test_stats_t;

static fsm_test_stats_t g_stats = {0, 0, 0};


// Visualizer helper
static void format_result(char *buf, size_t max_len, int result) {
    if (result == 1) {
        snprintf(buf, max_len, "ALLOWED");
    } else {
        snprintf(buf, max_len, "BLOCKED");
    }
}

// Unified FSM Test Runner Helper
static void run_fsm_assert(int current_state, int next_state, uint64_t prereqs, int expected, const char *test_id, const char *desc, fsm_test_stats_t* stats) {
    int res = validate_transition(current_state, next_state, prereqs);
    stats->total_count++;
    if (res == expected) {
        stats->passed_count++;
    } else {
        stats->failed_count++;
        char res_str[16];
        char exp_str[16];
        format_result(res_str, sizeof(res_str), res);
        format_result(exp_str, sizeof(exp_str), expected);
        printf("[FAIL] %s - %s\n", test_id, desc);
        printf("       Transition: %d -> %d\n", current_state, next_state);
        printf("       Prereqs: 0x%016llX\n", (unsigned long long)prereqs);
        printf("       Result: %s | Expected: %s\n\n", res_str, exp_str);
    }
}

static void run_unit_test_0000(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -10,
        0x0ULL,
        0,
        "UT_0000",
        "Testing state transition current=-10 to next=-10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0001(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -10,
        0x0ULL,
        0,
        "UT_0001",
        "Testing state transition current=-5 to next=-10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0002(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -10,
        0x0ULL,
        0,
        "UT_0002",
        "Testing state transition current=-1 to next=-10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0003(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -10,
        0x0ULL,
        0,
        "UT_0003",
        "Testing state transition current=0 to next=-10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0004(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -10,
        0x0ULL,
        0,
        "UT_0004",
        "Testing state transition current=1 to next=-10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0005(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -10,
        0x0ULL,
        0,
        "UT_0005",
        "Testing state transition current=2 to next=-10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0006(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -10,
        0x0ULL,
        0,
        "UT_0006",
        "Testing state transition current=3 to next=-10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0007(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -10,
        0x0ULL,
        0,
        "UT_0007",
        "Testing state transition current=4 to next=-10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0008(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -10,
        0x0ULL,
        0,
        "UT_0008",
        "Testing state transition current=5 to next=-10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0009(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -10,
        0x0ULL,
        0,
        "UT_0009",
        "Testing state transition current=6 to next=-10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0010(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -10,
        0x0ULL,
        0,
        "UT_0010",
        "Testing state transition current=7 to next=-10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0011(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -10,
        0x0ULL,
        0,
        "UT_0011",
        "Testing state transition current=8 to next=-10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0012(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -10,
        0x0ULL,
        0,
        "UT_0012",
        "Testing state transition current=10 to next=-10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0013(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -10,
        0x0ULL,
        0,
        "UT_0013",
        "Testing state transition current=15 to next=-10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0014(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -10,
        0x0ULL,
        0,
        "UT_0014",
        "Testing state transition current=100 to next=-10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0015(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -10,
        0x0ULL,
        0,
        "UT_0015",
        "Testing state transition current=-100 to next=-10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0016(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -5,
        0x0ULL,
        0,
        "UT_0016",
        "Testing state transition current=-10 to next=-5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0017(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -5,
        0x0ULL,
        0,
        "UT_0017",
        "Testing state transition current=-5 to next=-5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0018(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -5,
        0x0ULL,
        0,
        "UT_0018",
        "Testing state transition current=-1 to next=-5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0019(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -5,
        0x0ULL,
        0,
        "UT_0019",
        "Testing state transition current=0 to next=-5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0020(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -5,
        0x0ULL,
        0,
        "UT_0020",
        "Testing state transition current=1 to next=-5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0021(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -5,
        0x0ULL,
        0,
        "UT_0021",
        "Testing state transition current=2 to next=-5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0022(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -5,
        0x0ULL,
        0,
        "UT_0022",
        "Testing state transition current=3 to next=-5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0023(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -5,
        0x0ULL,
        0,
        "UT_0023",
        "Testing state transition current=4 to next=-5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0024(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -5,
        0x0ULL,
        0,
        "UT_0024",
        "Testing state transition current=5 to next=-5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0025(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -5,
        0x0ULL,
        0,
        "UT_0025",
        "Testing state transition current=6 to next=-5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0026(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -5,
        0x0ULL,
        0,
        "UT_0026",
        "Testing state transition current=7 to next=-5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0027(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -5,
        0x0ULL,
        0,
        "UT_0027",
        "Testing state transition current=8 to next=-5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0028(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -5,
        0x0ULL,
        0,
        "UT_0028",
        "Testing state transition current=10 to next=-5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0029(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -5,
        0x0ULL,
        0,
        "UT_0029",
        "Testing state transition current=15 to next=-5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0030(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -5,
        0x0ULL,
        0,
        "UT_0030",
        "Testing state transition current=100 to next=-5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0031(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -5,
        0x0ULL,
        0,
        "UT_0031",
        "Testing state transition current=-100 to next=-5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0032(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -1,
        0x0ULL,
        0,
        "UT_0032",
        "Testing state transition current=-10 to next=-1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0033(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -1,
        0x0ULL,
        0,
        "UT_0033",
        "Testing state transition current=-5 to next=-1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0034(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -1,
        0x0ULL,
        0,
        "UT_0034",
        "Testing state transition current=-1 to next=-1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0035(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -1,
        0x0ULL,
        0,
        "UT_0035",
        "Testing state transition current=0 to next=-1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0036(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -1,
        0x0ULL,
        0,
        "UT_0036",
        "Testing state transition current=1 to next=-1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0037(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -1,
        0x0ULL,
        0,
        "UT_0037",
        "Testing state transition current=2 to next=-1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0038(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -1,
        0x0ULL,
        0,
        "UT_0038",
        "Testing state transition current=3 to next=-1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0039(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -1,
        0x0ULL,
        0,
        "UT_0039",
        "Testing state transition current=4 to next=-1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0040(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -1,
        0x0ULL,
        0,
        "UT_0040",
        "Testing state transition current=5 to next=-1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0041(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -1,
        0x0ULL,
        0,
        "UT_0041",
        "Testing state transition current=6 to next=-1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0042(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -1,
        0x0ULL,
        0,
        "UT_0042",
        "Testing state transition current=7 to next=-1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0043(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -1,
        0x0ULL,
        0,
        "UT_0043",
        "Testing state transition current=8 to next=-1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0044(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -1,
        0x0ULL,
        0,
        "UT_0044",
        "Testing state transition current=10 to next=-1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0045(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -1,
        0x0ULL,
        0,
        "UT_0045",
        "Testing state transition current=15 to next=-1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0046(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -1,
        0x0ULL,
        0,
        "UT_0046",
        "Testing state transition current=100 to next=-1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0047(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -1,
        0x0ULL,
        0,
        "UT_0047",
        "Testing state transition current=-100 to next=-1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0048(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        0,
        0x0ULL,
        0,
        "UT_0048",
        "Testing state transition current=-10 to next=0 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0049(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        0,
        0x0ULL,
        0,
        "UT_0049",
        "Testing state transition current=-5 to next=0 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0050(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        0,
        0x0ULL,
        0,
        "UT_0050",
        "Testing state transition current=-1 to next=0 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0051(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        0,
        0x0ULL,
        1,
        "UT_0051",
        "Testing state transition current=0 to next=0 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0052(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        0,
        0x0ULL,
        1,
        "UT_0052",
        "Testing state transition current=1 to next=0 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0053(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        0,
        0x0ULL,
        1,
        "UT_0053",
        "Testing state transition current=2 to next=0 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0054(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        0,
        0x0ULL,
        1,
        "UT_0054",
        "Testing state transition current=3 to next=0 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0055(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        0,
        0x0ULL,
        1,
        "UT_0055",
        "Testing state transition current=4 to next=0 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0056(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        0,
        0x0ULL,
        1,
        "UT_0056",
        "Testing state transition current=5 to next=0 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0057(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        0,
        0x0ULL,
        1,
        "UT_0057",
        "Testing state transition current=6 to next=0 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0058(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        0,
        0x0ULL,
        1,
        "UT_0058",
        "Testing state transition current=7 to next=0 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0059(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        0,
        0x0ULL,
        0,
        "UT_0059",
        "Testing state transition current=8 to next=0 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0060(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        0,
        0x0ULL,
        0,
        "UT_0060",
        "Testing state transition current=10 to next=0 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0061(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        0,
        0x0ULL,
        0,
        "UT_0061",
        "Testing state transition current=15 to next=0 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0062(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        0,
        0x0ULL,
        0,
        "UT_0062",
        "Testing state transition current=100 to next=0 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0063(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        0,
        0x0ULL,
        0,
        "UT_0063",
        "Testing state transition current=-100 to next=0 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0064(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        1,
        0x0ULL,
        0,
        "UT_0064",
        "Testing state transition current=-10 to next=1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0065(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        1,
        0x0ULL,
        0,
        "UT_0065",
        "Testing state transition current=-5 to next=1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0066(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        1,
        0x0ULL,
        0,
        "UT_0066",
        "Testing state transition current=-1 to next=1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0067(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        1,
        0x0ULL,
        0,
        "UT_0067",
        "Testing state transition current=0 to next=1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0068(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        1,
        0x0ULL,
        0,
        "UT_0068",
        "Testing state transition current=1 to next=1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0069(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        1,
        0x0ULL,
        0,
        "UT_0069",
        "Testing state transition current=2 to next=1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0070(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        1,
        0x0ULL,
        0,
        "UT_0070",
        "Testing state transition current=3 to next=1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0071(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        1,
        0x0ULL,
        0,
        "UT_0071",
        "Testing state transition current=4 to next=1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0072(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        1,
        0x0ULL,
        0,
        "UT_0072",
        "Testing state transition current=5 to next=1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0073(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        1,
        0x0ULL,
        0,
        "UT_0073",
        "Testing state transition current=6 to next=1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0074(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        1,
        0x0ULL,
        0,
        "UT_0074",
        "Testing state transition current=7 to next=1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0075(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        1,
        0x0ULL,
        0,
        "UT_0075",
        "Testing state transition current=8 to next=1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0076(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        1,
        0x0ULL,
        0,
        "UT_0076",
        "Testing state transition current=10 to next=1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0077(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        1,
        0x0ULL,
        0,
        "UT_0077",
        "Testing state transition current=15 to next=1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0078(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        1,
        0x0ULL,
        0,
        "UT_0078",
        "Testing state transition current=100 to next=1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0079(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        1,
        0x0ULL,
        0,
        "UT_0079",
        "Testing state transition current=-100 to next=1 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0080(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        2,
        0x0ULL,
        0,
        "UT_0080",
        "Testing state transition current=-10 to next=2 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0081(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        2,
        0x0ULL,
        0,
        "UT_0081",
        "Testing state transition current=-5 to next=2 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0082(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        2,
        0x0ULL,
        0,
        "UT_0082",
        "Testing state transition current=-1 to next=2 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0083(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        2,
        0x0ULL,
        0,
        "UT_0083",
        "Testing state transition current=0 to next=2 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0084(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        2,
        0x0ULL,
        0,
        "UT_0084",
        "Testing state transition current=1 to next=2 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0085(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        2,
        0x0ULL,
        0,
        "UT_0085",
        "Testing state transition current=2 to next=2 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0086(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        2,
        0x0ULL,
        0,
        "UT_0086",
        "Testing state transition current=3 to next=2 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0087(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        2,
        0x0ULL,
        0,
        "UT_0087",
        "Testing state transition current=4 to next=2 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0088(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        2,
        0x0ULL,
        0,
        "UT_0088",
        "Testing state transition current=5 to next=2 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0089(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        2,
        0x0ULL,
        0,
        "UT_0089",
        "Testing state transition current=6 to next=2 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0090(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        2,
        0x0ULL,
        0,
        "UT_0090",
        "Testing state transition current=7 to next=2 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0091(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        2,
        0x0ULL,
        0,
        "UT_0091",
        "Testing state transition current=8 to next=2 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0092(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        2,
        0x0ULL,
        0,
        "UT_0092",
        "Testing state transition current=10 to next=2 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0093(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        2,
        0x0ULL,
        0,
        "UT_0093",
        "Testing state transition current=15 to next=2 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0094(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        2,
        0x0ULL,
        0,
        "UT_0094",
        "Testing state transition current=100 to next=2 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0095(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        2,
        0x0ULL,
        0,
        "UT_0095",
        "Testing state transition current=-100 to next=2 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0096(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        3,
        0x0ULL,
        0,
        "UT_0096",
        "Testing state transition current=-10 to next=3 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0097(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        3,
        0x0ULL,
        0,
        "UT_0097",
        "Testing state transition current=-5 to next=3 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0098(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        3,
        0x0ULL,
        0,
        "UT_0098",
        "Testing state transition current=-1 to next=3 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0099(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        3,
        0x0ULL,
        0,
        "UT_0099",
        "Testing state transition current=0 to next=3 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0100(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        3,
        0x0ULL,
        0,
        "UT_0100",
        "Testing state transition current=1 to next=3 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0101(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        3,
        0x0ULL,
        0,
        "UT_0101",
        "Testing state transition current=2 to next=3 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0102(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        3,
        0x0ULL,
        0,
        "UT_0102",
        "Testing state transition current=3 to next=3 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0103(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        3,
        0x0ULL,
        0,
        "UT_0103",
        "Testing state transition current=4 to next=3 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0104(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        3,
        0x0ULL,
        0,
        "UT_0104",
        "Testing state transition current=5 to next=3 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0105(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        3,
        0x0ULL,
        0,
        "UT_0105",
        "Testing state transition current=6 to next=3 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0106(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        3,
        0x0ULL,
        0,
        "UT_0106",
        "Testing state transition current=7 to next=3 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0107(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        3,
        0x0ULL,
        0,
        "UT_0107",
        "Testing state transition current=8 to next=3 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0108(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        3,
        0x0ULL,
        0,
        "UT_0108",
        "Testing state transition current=10 to next=3 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0109(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        3,
        0x0ULL,
        0,
        "UT_0109",
        "Testing state transition current=15 to next=3 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0110(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        3,
        0x0ULL,
        0,
        "UT_0110",
        "Testing state transition current=100 to next=3 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0111(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        3,
        0x0ULL,
        0,
        "UT_0111",
        "Testing state transition current=-100 to next=3 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0112(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        4,
        0x0ULL,
        0,
        "UT_0112",
        "Testing state transition current=-10 to next=4 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0113(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        4,
        0x0ULL,
        0,
        "UT_0113",
        "Testing state transition current=-5 to next=4 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0114(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        4,
        0x0ULL,
        0,
        "UT_0114",
        "Testing state transition current=-1 to next=4 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0115(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        4,
        0x0ULL,
        0,
        "UT_0115",
        "Testing state transition current=0 to next=4 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0116(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        4,
        0x0ULL,
        0,
        "UT_0116",
        "Testing state transition current=1 to next=4 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0117(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        4,
        0x0ULL,
        0,
        "UT_0117",
        "Testing state transition current=2 to next=4 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0118(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        4,
        0x0ULL,
        0,
        "UT_0118",
        "Testing state transition current=3 to next=4 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0119(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        4,
        0x0ULL,
        0,
        "UT_0119",
        "Testing state transition current=4 to next=4 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0120(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        4,
        0x0ULL,
        0,
        "UT_0120",
        "Testing state transition current=5 to next=4 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0121(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        4,
        0x0ULL,
        0,
        "UT_0121",
        "Testing state transition current=6 to next=4 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0122(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        4,
        0x0ULL,
        0,
        "UT_0122",
        "Testing state transition current=7 to next=4 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0123(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        4,
        0x0ULL,
        0,
        "UT_0123",
        "Testing state transition current=8 to next=4 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0124(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        4,
        0x0ULL,
        0,
        "UT_0124",
        "Testing state transition current=10 to next=4 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0125(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        4,
        0x0ULL,
        0,
        "UT_0125",
        "Testing state transition current=15 to next=4 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0126(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        4,
        0x0ULL,
        0,
        "UT_0126",
        "Testing state transition current=100 to next=4 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0127(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        4,
        0x0ULL,
        0,
        "UT_0127",
        "Testing state transition current=-100 to next=4 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0128(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        5,
        0x0ULL,
        0,
        "UT_0128",
        "Testing state transition current=-10 to next=5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0129(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        5,
        0x0ULL,
        0,
        "UT_0129",
        "Testing state transition current=-5 to next=5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0130(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        5,
        0x0ULL,
        0,
        "UT_0130",
        "Testing state transition current=-1 to next=5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0131(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        5,
        0x0ULL,
        0,
        "UT_0131",
        "Testing state transition current=0 to next=5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0132(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        5,
        0x0ULL,
        0,
        "UT_0132",
        "Testing state transition current=1 to next=5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0133(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        5,
        0x0ULL,
        0,
        "UT_0133",
        "Testing state transition current=2 to next=5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0134(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        5,
        0x0ULL,
        0,
        "UT_0134",
        "Testing state transition current=3 to next=5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0135(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        5,
        0x0ULL,
        0,
        "UT_0135",
        "Testing state transition current=4 to next=5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0136(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        5,
        0x0ULL,
        0,
        "UT_0136",
        "Testing state transition current=5 to next=5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0137(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        5,
        0x0ULL,
        0,
        "UT_0137",
        "Testing state transition current=6 to next=5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0138(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        5,
        0x0ULL,
        0,
        "UT_0138",
        "Testing state transition current=7 to next=5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0139(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        5,
        0x0ULL,
        0,
        "UT_0139",
        "Testing state transition current=8 to next=5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0140(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        5,
        0x0ULL,
        0,
        "UT_0140",
        "Testing state transition current=10 to next=5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0141(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        5,
        0x0ULL,
        0,
        "UT_0141",
        "Testing state transition current=15 to next=5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0142(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        5,
        0x0ULL,
        0,
        "UT_0142",
        "Testing state transition current=100 to next=5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0143(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        5,
        0x0ULL,
        0,
        "UT_0143",
        "Testing state transition current=-100 to next=5 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0144(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        6,
        0x0ULL,
        0,
        "UT_0144",
        "Testing state transition current=-10 to next=6 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0145(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        6,
        0x0ULL,
        0,
        "UT_0145",
        "Testing state transition current=-5 to next=6 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0146(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        6,
        0x0ULL,
        0,
        "UT_0146",
        "Testing state transition current=-1 to next=6 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0147(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        6,
        0x0ULL,
        0,
        "UT_0147",
        "Testing state transition current=0 to next=6 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0148(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        6,
        0x0ULL,
        0,
        "UT_0148",
        "Testing state transition current=1 to next=6 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0149(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        6,
        0x0ULL,
        0,
        "UT_0149",
        "Testing state transition current=2 to next=6 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0150(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        6,
        0x0ULL,
        0,
        "UT_0150",
        "Testing state transition current=3 to next=6 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0151(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        6,
        0x0ULL,
        0,
        "UT_0151",
        "Testing state transition current=4 to next=6 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0152(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        6,
        0x0ULL,
        0,
        "UT_0152",
        "Testing state transition current=5 to next=6 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0153(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        6,
        0x0ULL,
        0,
        "UT_0153",
        "Testing state transition current=6 to next=6 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0154(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        6,
        0x0ULL,
        0,
        "UT_0154",
        "Testing state transition current=7 to next=6 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0155(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        6,
        0x0ULL,
        0,
        "UT_0155",
        "Testing state transition current=8 to next=6 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0156(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        6,
        0x0ULL,
        0,
        "UT_0156",
        "Testing state transition current=10 to next=6 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0157(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        6,
        0x0ULL,
        0,
        "UT_0157",
        "Testing state transition current=15 to next=6 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0158(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        6,
        0x0ULL,
        0,
        "UT_0158",
        "Testing state transition current=100 to next=6 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0159(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        6,
        0x0ULL,
        0,
        "UT_0159",
        "Testing state transition current=-100 to next=6 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0160(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        7,
        0x0ULL,
        0,
        "UT_0160",
        "Testing state transition current=-10 to next=7 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0161(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        7,
        0x0ULL,
        0,
        "UT_0161",
        "Testing state transition current=-5 to next=7 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0162(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        7,
        0x0ULL,
        0,
        "UT_0162",
        "Testing state transition current=-1 to next=7 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0163(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        7,
        0x0ULL,
        0,
        "UT_0163",
        "Testing state transition current=0 to next=7 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0164(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        7,
        0x0ULL,
        0,
        "UT_0164",
        "Testing state transition current=1 to next=7 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0165(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        7,
        0x0ULL,
        0,
        "UT_0165",
        "Testing state transition current=2 to next=7 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0166(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        7,
        0x0ULL,
        0,
        "UT_0166",
        "Testing state transition current=3 to next=7 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0167(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        7,
        0x0ULL,
        0,
        "UT_0167",
        "Testing state transition current=4 to next=7 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0168(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        7,
        0x0ULL,
        0,
        "UT_0168",
        "Testing state transition current=5 to next=7 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0169(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        7,
        0x0ULL,
        0,
        "UT_0169",
        "Testing state transition current=6 to next=7 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0170(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        7,
        0x0ULL,
        0,
        "UT_0170",
        "Testing state transition current=7 to next=7 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0171(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        7,
        0x0ULL,
        0,
        "UT_0171",
        "Testing state transition current=8 to next=7 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0172(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        7,
        0x0ULL,
        0,
        "UT_0172",
        "Testing state transition current=10 to next=7 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0173(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        7,
        0x0ULL,
        0,
        "UT_0173",
        "Testing state transition current=15 to next=7 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0174(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        7,
        0x0ULL,
        0,
        "UT_0174",
        "Testing state transition current=100 to next=7 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0175(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        7,
        0x0ULL,
        0,
        "UT_0175",
        "Testing state transition current=-100 to next=7 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0176(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        8,
        0x0ULL,
        0,
        "UT_0176",
        "Testing state transition current=-10 to next=8 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0177(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        8,
        0x0ULL,
        0,
        "UT_0177",
        "Testing state transition current=-5 to next=8 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0178(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        8,
        0x0ULL,
        0,
        "UT_0178",
        "Testing state transition current=-1 to next=8 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0179(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        8,
        0x0ULL,
        0,
        "UT_0179",
        "Testing state transition current=0 to next=8 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0180(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        8,
        0x0ULL,
        0,
        "UT_0180",
        "Testing state transition current=1 to next=8 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0181(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        8,
        0x0ULL,
        0,
        "UT_0181",
        "Testing state transition current=2 to next=8 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0182(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        8,
        0x0ULL,
        0,
        "UT_0182",
        "Testing state transition current=3 to next=8 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0183(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        8,
        0x0ULL,
        0,
        "UT_0183",
        "Testing state transition current=4 to next=8 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0184(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        8,
        0x0ULL,
        0,
        "UT_0184",
        "Testing state transition current=5 to next=8 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0185(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        8,
        0x0ULL,
        0,
        "UT_0185",
        "Testing state transition current=6 to next=8 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0186(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        8,
        0x0ULL,
        0,
        "UT_0186",
        "Testing state transition current=7 to next=8 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0187(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        8,
        0x0ULL,
        0,
        "UT_0187",
        "Testing state transition current=8 to next=8 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0188(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        8,
        0x0ULL,
        0,
        "UT_0188",
        "Testing state transition current=10 to next=8 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0189(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        8,
        0x0ULL,
        0,
        "UT_0189",
        "Testing state transition current=15 to next=8 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0190(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        8,
        0x0ULL,
        0,
        "UT_0190",
        "Testing state transition current=100 to next=8 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0191(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        8,
        0x0ULL,
        0,
        "UT_0191",
        "Testing state transition current=-100 to next=8 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0192(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        10,
        0x0ULL,
        0,
        "UT_0192",
        "Testing state transition current=-10 to next=10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0193(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        10,
        0x0ULL,
        0,
        "UT_0193",
        "Testing state transition current=-5 to next=10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0194(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        10,
        0x0ULL,
        0,
        "UT_0194",
        "Testing state transition current=-1 to next=10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0195(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        10,
        0x0ULL,
        0,
        "UT_0195",
        "Testing state transition current=0 to next=10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0196(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        10,
        0x0ULL,
        0,
        "UT_0196",
        "Testing state transition current=1 to next=10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0197(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        10,
        0x0ULL,
        0,
        "UT_0197",
        "Testing state transition current=2 to next=10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0198(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        10,
        0x0ULL,
        0,
        "UT_0198",
        "Testing state transition current=3 to next=10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0199(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        10,
        0x0ULL,
        0,
        "UT_0199",
        "Testing state transition current=4 to next=10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0200(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        10,
        0x0ULL,
        0,
        "UT_0200",
        "Testing state transition current=5 to next=10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0201(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        10,
        0x0ULL,
        0,
        "UT_0201",
        "Testing state transition current=6 to next=10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0202(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        10,
        0x0ULL,
        0,
        "UT_0202",
        "Testing state transition current=7 to next=10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0203(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        10,
        0x0ULL,
        0,
        "UT_0203",
        "Testing state transition current=8 to next=10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0204(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        10,
        0x0ULL,
        0,
        "UT_0204",
        "Testing state transition current=10 to next=10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0205(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        10,
        0x0ULL,
        0,
        "UT_0205",
        "Testing state transition current=15 to next=10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0206(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        10,
        0x0ULL,
        0,
        "UT_0206",
        "Testing state transition current=100 to next=10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0207(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        10,
        0x0ULL,
        0,
        "UT_0207",
        "Testing state transition current=-100 to next=10 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0208(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        15,
        0x0ULL,
        0,
        "UT_0208",
        "Testing state transition current=-10 to next=15 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0209(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        15,
        0x0ULL,
        0,
        "UT_0209",
        "Testing state transition current=-5 to next=15 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0210(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        15,
        0x0ULL,
        0,
        "UT_0210",
        "Testing state transition current=-1 to next=15 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0211(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        15,
        0x0ULL,
        0,
        "UT_0211",
        "Testing state transition current=0 to next=15 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0212(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        15,
        0x0ULL,
        0,
        "UT_0212",
        "Testing state transition current=1 to next=15 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0213(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        15,
        0x0ULL,
        0,
        "UT_0213",
        "Testing state transition current=2 to next=15 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0214(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        15,
        0x0ULL,
        0,
        "UT_0214",
        "Testing state transition current=3 to next=15 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0215(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        15,
        0x0ULL,
        0,
        "UT_0215",
        "Testing state transition current=4 to next=15 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0216(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        15,
        0x0ULL,
        0,
        "UT_0216",
        "Testing state transition current=5 to next=15 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0217(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        15,
        0x0ULL,
        0,
        "UT_0217",
        "Testing state transition current=6 to next=15 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0218(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        15,
        0x0ULL,
        0,
        "UT_0218",
        "Testing state transition current=7 to next=15 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0219(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        15,
        0x0ULL,
        0,
        "UT_0219",
        "Testing state transition current=8 to next=15 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0220(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        15,
        0x0ULL,
        0,
        "UT_0220",
        "Testing state transition current=10 to next=15 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0221(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        15,
        0x0ULL,
        0,
        "UT_0221",
        "Testing state transition current=15 to next=15 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0222(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        15,
        0x0ULL,
        0,
        "UT_0222",
        "Testing state transition current=100 to next=15 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0223(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        15,
        0x0ULL,
        0,
        "UT_0223",
        "Testing state transition current=-100 to next=15 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0224(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        100,
        0x0ULL,
        0,
        "UT_0224",
        "Testing state transition current=-10 to next=100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0225(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        100,
        0x0ULL,
        0,
        "UT_0225",
        "Testing state transition current=-5 to next=100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0226(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        100,
        0x0ULL,
        0,
        "UT_0226",
        "Testing state transition current=-1 to next=100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0227(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        100,
        0x0ULL,
        0,
        "UT_0227",
        "Testing state transition current=0 to next=100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0228(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        100,
        0x0ULL,
        0,
        "UT_0228",
        "Testing state transition current=1 to next=100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0229(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        100,
        0x0ULL,
        0,
        "UT_0229",
        "Testing state transition current=2 to next=100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0230(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        100,
        0x0ULL,
        0,
        "UT_0230",
        "Testing state transition current=3 to next=100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0231(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        100,
        0x0ULL,
        0,
        "UT_0231",
        "Testing state transition current=4 to next=100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0232(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        100,
        0x0ULL,
        0,
        "UT_0232",
        "Testing state transition current=5 to next=100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0233(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        100,
        0x0ULL,
        0,
        "UT_0233",
        "Testing state transition current=6 to next=100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0234(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        100,
        0x0ULL,
        0,
        "UT_0234",
        "Testing state transition current=7 to next=100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0235(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        100,
        0x0ULL,
        0,
        "UT_0235",
        "Testing state transition current=8 to next=100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0236(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        100,
        0x0ULL,
        0,
        "UT_0236",
        "Testing state transition current=10 to next=100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0237(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        100,
        0x0ULL,
        0,
        "UT_0237",
        "Testing state transition current=15 to next=100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0238(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        100,
        0x0ULL,
        0,
        "UT_0238",
        "Testing state transition current=100 to next=100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0239(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        100,
        0x0ULL,
        0,
        "UT_0239",
        "Testing state transition current=-100 to next=100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0240(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -100,
        0x0ULL,
        0,
        "UT_0240",
        "Testing state transition current=-10 to next=-100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0241(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -100,
        0x0ULL,
        0,
        "UT_0241",
        "Testing state transition current=-5 to next=-100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0242(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -100,
        0x0ULL,
        0,
        "UT_0242",
        "Testing state transition current=-1 to next=-100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0243(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -100,
        0x0ULL,
        0,
        "UT_0243",
        "Testing state transition current=0 to next=-100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0244(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -100,
        0x0ULL,
        0,
        "UT_0244",
        "Testing state transition current=1 to next=-100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0245(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -100,
        0x0ULL,
        0,
        "UT_0245",
        "Testing state transition current=2 to next=-100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0246(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -100,
        0x0ULL,
        0,
        "UT_0246",
        "Testing state transition current=3 to next=-100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0247(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -100,
        0x0ULL,
        0,
        "UT_0247",
        "Testing state transition current=4 to next=-100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0248(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -100,
        0x0ULL,
        0,
        "UT_0248",
        "Testing state transition current=5 to next=-100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0249(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -100,
        0x0ULL,
        0,
        "UT_0249",
        "Testing state transition current=6 to next=-100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0250(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -100,
        0x0ULL,
        0,
        "UT_0250",
        "Testing state transition current=7 to next=-100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0251(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -100,
        0x0ULL,
        0,
        "UT_0251",
        "Testing state transition current=8 to next=-100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0252(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -100,
        0x0ULL,
        0,
        "UT_0252",
        "Testing state transition current=10 to next=-100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0253(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -100,
        0x0ULL,
        0,
        "UT_0253",
        "Testing state transition current=15 to next=-100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0254(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -100,
        0x0ULL,
        0,
        "UT_0254",
        "Testing state transition current=100 to next=-100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0255(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -100,
        0x0ULL,
        0,
        "UT_0255",
        "Testing state transition current=-100 to next=-100 with prereq=0x0",
        stats
    );
}
static void run_unit_test_0256(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -10,
        0x1ULL,
        0,
        "UT_0256",
        "Testing state transition current=-10 to next=-10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0257(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -10,
        0x1ULL,
        0,
        "UT_0257",
        "Testing state transition current=-5 to next=-10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0258(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -10,
        0x1ULL,
        0,
        "UT_0258",
        "Testing state transition current=-1 to next=-10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0259(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -10,
        0x1ULL,
        0,
        "UT_0259",
        "Testing state transition current=0 to next=-10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0260(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -10,
        0x1ULL,
        0,
        "UT_0260",
        "Testing state transition current=1 to next=-10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0261(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -10,
        0x1ULL,
        0,
        "UT_0261",
        "Testing state transition current=2 to next=-10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0262(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -10,
        0x1ULL,
        0,
        "UT_0262",
        "Testing state transition current=3 to next=-10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0263(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -10,
        0x1ULL,
        0,
        "UT_0263",
        "Testing state transition current=4 to next=-10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0264(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -10,
        0x1ULL,
        0,
        "UT_0264",
        "Testing state transition current=5 to next=-10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0265(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -10,
        0x1ULL,
        0,
        "UT_0265",
        "Testing state transition current=6 to next=-10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0266(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -10,
        0x1ULL,
        0,
        "UT_0266",
        "Testing state transition current=7 to next=-10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0267(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -10,
        0x1ULL,
        0,
        "UT_0267",
        "Testing state transition current=8 to next=-10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0268(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -10,
        0x1ULL,
        0,
        "UT_0268",
        "Testing state transition current=10 to next=-10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0269(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -10,
        0x1ULL,
        0,
        "UT_0269",
        "Testing state transition current=15 to next=-10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0270(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -10,
        0x1ULL,
        0,
        "UT_0270",
        "Testing state transition current=100 to next=-10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0271(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -10,
        0x1ULL,
        0,
        "UT_0271",
        "Testing state transition current=-100 to next=-10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0272(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -5,
        0x1ULL,
        0,
        "UT_0272",
        "Testing state transition current=-10 to next=-5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0273(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -5,
        0x1ULL,
        0,
        "UT_0273",
        "Testing state transition current=-5 to next=-5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0274(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -5,
        0x1ULL,
        0,
        "UT_0274",
        "Testing state transition current=-1 to next=-5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0275(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -5,
        0x1ULL,
        0,
        "UT_0275",
        "Testing state transition current=0 to next=-5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0276(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -5,
        0x1ULL,
        0,
        "UT_0276",
        "Testing state transition current=1 to next=-5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0277(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -5,
        0x1ULL,
        0,
        "UT_0277",
        "Testing state transition current=2 to next=-5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0278(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -5,
        0x1ULL,
        0,
        "UT_0278",
        "Testing state transition current=3 to next=-5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0279(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -5,
        0x1ULL,
        0,
        "UT_0279",
        "Testing state transition current=4 to next=-5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0280(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -5,
        0x1ULL,
        0,
        "UT_0280",
        "Testing state transition current=5 to next=-5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0281(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -5,
        0x1ULL,
        0,
        "UT_0281",
        "Testing state transition current=6 to next=-5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0282(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -5,
        0x1ULL,
        0,
        "UT_0282",
        "Testing state transition current=7 to next=-5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0283(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -5,
        0x1ULL,
        0,
        "UT_0283",
        "Testing state transition current=8 to next=-5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0284(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -5,
        0x1ULL,
        0,
        "UT_0284",
        "Testing state transition current=10 to next=-5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0285(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -5,
        0x1ULL,
        0,
        "UT_0285",
        "Testing state transition current=15 to next=-5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0286(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -5,
        0x1ULL,
        0,
        "UT_0286",
        "Testing state transition current=100 to next=-5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0287(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -5,
        0x1ULL,
        0,
        "UT_0287",
        "Testing state transition current=-100 to next=-5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0288(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -1,
        0x1ULL,
        0,
        "UT_0288",
        "Testing state transition current=-10 to next=-1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0289(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -1,
        0x1ULL,
        0,
        "UT_0289",
        "Testing state transition current=-5 to next=-1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0290(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -1,
        0x1ULL,
        0,
        "UT_0290",
        "Testing state transition current=-1 to next=-1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0291(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -1,
        0x1ULL,
        0,
        "UT_0291",
        "Testing state transition current=0 to next=-1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0292(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -1,
        0x1ULL,
        0,
        "UT_0292",
        "Testing state transition current=1 to next=-1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0293(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -1,
        0x1ULL,
        0,
        "UT_0293",
        "Testing state transition current=2 to next=-1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0294(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -1,
        0x1ULL,
        0,
        "UT_0294",
        "Testing state transition current=3 to next=-1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0295(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -1,
        0x1ULL,
        0,
        "UT_0295",
        "Testing state transition current=4 to next=-1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0296(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -1,
        0x1ULL,
        0,
        "UT_0296",
        "Testing state transition current=5 to next=-1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0297(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -1,
        0x1ULL,
        0,
        "UT_0297",
        "Testing state transition current=6 to next=-1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0298(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -1,
        0x1ULL,
        0,
        "UT_0298",
        "Testing state transition current=7 to next=-1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0299(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -1,
        0x1ULL,
        0,
        "UT_0299",
        "Testing state transition current=8 to next=-1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0300(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -1,
        0x1ULL,
        0,
        "UT_0300",
        "Testing state transition current=10 to next=-1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0301(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -1,
        0x1ULL,
        0,
        "UT_0301",
        "Testing state transition current=15 to next=-1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0302(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -1,
        0x1ULL,
        0,
        "UT_0302",
        "Testing state transition current=100 to next=-1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0303(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -1,
        0x1ULL,
        0,
        "UT_0303",
        "Testing state transition current=-100 to next=-1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0304(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        0,
        0x1ULL,
        0,
        "UT_0304",
        "Testing state transition current=-10 to next=0 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0305(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        0,
        0x1ULL,
        0,
        "UT_0305",
        "Testing state transition current=-5 to next=0 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0306(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        0,
        0x1ULL,
        0,
        "UT_0306",
        "Testing state transition current=-1 to next=0 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0307(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        0,
        0x1ULL,
        1,
        "UT_0307",
        "Testing state transition current=0 to next=0 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0308(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        0,
        0x1ULL,
        1,
        "UT_0308",
        "Testing state transition current=1 to next=0 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0309(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        0,
        0x1ULL,
        1,
        "UT_0309",
        "Testing state transition current=2 to next=0 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0310(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        0,
        0x1ULL,
        1,
        "UT_0310",
        "Testing state transition current=3 to next=0 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0311(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        0,
        0x1ULL,
        1,
        "UT_0311",
        "Testing state transition current=4 to next=0 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0312(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        0,
        0x1ULL,
        1,
        "UT_0312",
        "Testing state transition current=5 to next=0 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0313(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        0,
        0x1ULL,
        1,
        "UT_0313",
        "Testing state transition current=6 to next=0 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0314(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        0,
        0x1ULL,
        1,
        "UT_0314",
        "Testing state transition current=7 to next=0 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0315(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        0,
        0x1ULL,
        0,
        "UT_0315",
        "Testing state transition current=8 to next=0 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0316(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        0,
        0x1ULL,
        0,
        "UT_0316",
        "Testing state transition current=10 to next=0 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0317(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        0,
        0x1ULL,
        0,
        "UT_0317",
        "Testing state transition current=15 to next=0 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0318(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        0,
        0x1ULL,
        0,
        "UT_0318",
        "Testing state transition current=100 to next=0 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0319(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        0,
        0x1ULL,
        0,
        "UT_0319",
        "Testing state transition current=-100 to next=0 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0320(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        1,
        0x1ULL,
        0,
        "UT_0320",
        "Testing state transition current=-10 to next=1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0321(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        1,
        0x1ULL,
        0,
        "UT_0321",
        "Testing state transition current=-5 to next=1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0322(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        1,
        0x1ULL,
        0,
        "UT_0322",
        "Testing state transition current=-1 to next=1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0323(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        1,
        0x1ULL,
        1,
        "UT_0323",
        "Testing state transition current=0 to next=1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0324(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        1,
        0x1ULL,
        0,
        "UT_0324",
        "Testing state transition current=1 to next=1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0325(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        1,
        0x1ULL,
        0,
        "UT_0325",
        "Testing state transition current=2 to next=1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0326(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        1,
        0x1ULL,
        0,
        "UT_0326",
        "Testing state transition current=3 to next=1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0327(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        1,
        0x1ULL,
        0,
        "UT_0327",
        "Testing state transition current=4 to next=1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0328(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        1,
        0x1ULL,
        0,
        "UT_0328",
        "Testing state transition current=5 to next=1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0329(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        1,
        0x1ULL,
        0,
        "UT_0329",
        "Testing state transition current=6 to next=1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0330(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        1,
        0x1ULL,
        0,
        "UT_0330",
        "Testing state transition current=7 to next=1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0331(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        1,
        0x1ULL,
        0,
        "UT_0331",
        "Testing state transition current=8 to next=1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0332(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        1,
        0x1ULL,
        0,
        "UT_0332",
        "Testing state transition current=10 to next=1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0333(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        1,
        0x1ULL,
        0,
        "UT_0333",
        "Testing state transition current=15 to next=1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0334(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        1,
        0x1ULL,
        0,
        "UT_0334",
        "Testing state transition current=100 to next=1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0335(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        1,
        0x1ULL,
        0,
        "UT_0335",
        "Testing state transition current=-100 to next=1 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0336(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        2,
        0x1ULL,
        0,
        "UT_0336",
        "Testing state transition current=-10 to next=2 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0337(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        2,
        0x1ULL,
        0,
        "UT_0337",
        "Testing state transition current=-5 to next=2 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0338(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        2,
        0x1ULL,
        0,
        "UT_0338",
        "Testing state transition current=-1 to next=2 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0339(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        2,
        0x1ULL,
        0,
        "UT_0339",
        "Testing state transition current=0 to next=2 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0340(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        2,
        0x1ULL,
        0,
        "UT_0340",
        "Testing state transition current=1 to next=2 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0341(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        2,
        0x1ULL,
        0,
        "UT_0341",
        "Testing state transition current=2 to next=2 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0342(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        2,
        0x1ULL,
        0,
        "UT_0342",
        "Testing state transition current=3 to next=2 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0343(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        2,
        0x1ULL,
        0,
        "UT_0343",
        "Testing state transition current=4 to next=2 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0344(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        2,
        0x1ULL,
        0,
        "UT_0344",
        "Testing state transition current=5 to next=2 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0345(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        2,
        0x1ULL,
        0,
        "UT_0345",
        "Testing state transition current=6 to next=2 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0346(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        2,
        0x1ULL,
        0,
        "UT_0346",
        "Testing state transition current=7 to next=2 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0347(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        2,
        0x1ULL,
        0,
        "UT_0347",
        "Testing state transition current=8 to next=2 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0348(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        2,
        0x1ULL,
        0,
        "UT_0348",
        "Testing state transition current=10 to next=2 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0349(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        2,
        0x1ULL,
        0,
        "UT_0349",
        "Testing state transition current=15 to next=2 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0350(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        2,
        0x1ULL,
        0,
        "UT_0350",
        "Testing state transition current=100 to next=2 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0351(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        2,
        0x1ULL,
        0,
        "UT_0351",
        "Testing state transition current=-100 to next=2 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0352(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        3,
        0x1ULL,
        0,
        "UT_0352",
        "Testing state transition current=-10 to next=3 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0353(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        3,
        0x1ULL,
        0,
        "UT_0353",
        "Testing state transition current=-5 to next=3 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0354(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        3,
        0x1ULL,
        0,
        "UT_0354",
        "Testing state transition current=-1 to next=3 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0355(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        3,
        0x1ULL,
        0,
        "UT_0355",
        "Testing state transition current=0 to next=3 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0356(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        3,
        0x1ULL,
        0,
        "UT_0356",
        "Testing state transition current=1 to next=3 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0357(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        3,
        0x1ULL,
        0,
        "UT_0357",
        "Testing state transition current=2 to next=3 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0358(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        3,
        0x1ULL,
        0,
        "UT_0358",
        "Testing state transition current=3 to next=3 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0359(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        3,
        0x1ULL,
        0,
        "UT_0359",
        "Testing state transition current=4 to next=3 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0360(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        3,
        0x1ULL,
        0,
        "UT_0360",
        "Testing state transition current=5 to next=3 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0361(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        3,
        0x1ULL,
        0,
        "UT_0361",
        "Testing state transition current=6 to next=3 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0362(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        3,
        0x1ULL,
        0,
        "UT_0362",
        "Testing state transition current=7 to next=3 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0363(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        3,
        0x1ULL,
        0,
        "UT_0363",
        "Testing state transition current=8 to next=3 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0364(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        3,
        0x1ULL,
        0,
        "UT_0364",
        "Testing state transition current=10 to next=3 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0365(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        3,
        0x1ULL,
        0,
        "UT_0365",
        "Testing state transition current=15 to next=3 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0366(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        3,
        0x1ULL,
        0,
        "UT_0366",
        "Testing state transition current=100 to next=3 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0367(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        3,
        0x1ULL,
        0,
        "UT_0367",
        "Testing state transition current=-100 to next=3 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0368(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        4,
        0x1ULL,
        0,
        "UT_0368",
        "Testing state transition current=-10 to next=4 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0369(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        4,
        0x1ULL,
        0,
        "UT_0369",
        "Testing state transition current=-5 to next=4 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0370(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        4,
        0x1ULL,
        0,
        "UT_0370",
        "Testing state transition current=-1 to next=4 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0371(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        4,
        0x1ULL,
        0,
        "UT_0371",
        "Testing state transition current=0 to next=4 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0372(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        4,
        0x1ULL,
        0,
        "UT_0372",
        "Testing state transition current=1 to next=4 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0373(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        4,
        0x1ULL,
        0,
        "UT_0373",
        "Testing state transition current=2 to next=4 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0374(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        4,
        0x1ULL,
        0,
        "UT_0374",
        "Testing state transition current=3 to next=4 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0375(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        4,
        0x1ULL,
        0,
        "UT_0375",
        "Testing state transition current=4 to next=4 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0376(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        4,
        0x1ULL,
        0,
        "UT_0376",
        "Testing state transition current=5 to next=4 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0377(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        4,
        0x1ULL,
        0,
        "UT_0377",
        "Testing state transition current=6 to next=4 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0378(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        4,
        0x1ULL,
        0,
        "UT_0378",
        "Testing state transition current=7 to next=4 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0379(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        4,
        0x1ULL,
        0,
        "UT_0379",
        "Testing state transition current=8 to next=4 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0380(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        4,
        0x1ULL,
        0,
        "UT_0380",
        "Testing state transition current=10 to next=4 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0381(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        4,
        0x1ULL,
        0,
        "UT_0381",
        "Testing state transition current=15 to next=4 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0382(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        4,
        0x1ULL,
        0,
        "UT_0382",
        "Testing state transition current=100 to next=4 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0383(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        4,
        0x1ULL,
        0,
        "UT_0383",
        "Testing state transition current=-100 to next=4 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0384(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        5,
        0x1ULL,
        0,
        "UT_0384",
        "Testing state transition current=-10 to next=5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0385(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        5,
        0x1ULL,
        0,
        "UT_0385",
        "Testing state transition current=-5 to next=5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0386(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        5,
        0x1ULL,
        0,
        "UT_0386",
        "Testing state transition current=-1 to next=5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0387(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        5,
        0x1ULL,
        0,
        "UT_0387",
        "Testing state transition current=0 to next=5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0388(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        5,
        0x1ULL,
        0,
        "UT_0388",
        "Testing state transition current=1 to next=5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0389(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        5,
        0x1ULL,
        0,
        "UT_0389",
        "Testing state transition current=2 to next=5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0390(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        5,
        0x1ULL,
        0,
        "UT_0390",
        "Testing state transition current=3 to next=5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0391(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        5,
        0x1ULL,
        0,
        "UT_0391",
        "Testing state transition current=4 to next=5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0392(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        5,
        0x1ULL,
        0,
        "UT_0392",
        "Testing state transition current=5 to next=5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0393(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        5,
        0x1ULL,
        0,
        "UT_0393",
        "Testing state transition current=6 to next=5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0394(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        5,
        0x1ULL,
        0,
        "UT_0394",
        "Testing state transition current=7 to next=5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0395(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        5,
        0x1ULL,
        0,
        "UT_0395",
        "Testing state transition current=8 to next=5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0396(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        5,
        0x1ULL,
        0,
        "UT_0396",
        "Testing state transition current=10 to next=5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0397(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        5,
        0x1ULL,
        0,
        "UT_0397",
        "Testing state transition current=15 to next=5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0398(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        5,
        0x1ULL,
        0,
        "UT_0398",
        "Testing state transition current=100 to next=5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0399(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        5,
        0x1ULL,
        0,
        "UT_0399",
        "Testing state transition current=-100 to next=5 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0400(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        6,
        0x1ULL,
        0,
        "UT_0400",
        "Testing state transition current=-10 to next=6 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0401(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        6,
        0x1ULL,
        0,
        "UT_0401",
        "Testing state transition current=-5 to next=6 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0402(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        6,
        0x1ULL,
        0,
        "UT_0402",
        "Testing state transition current=-1 to next=6 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0403(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        6,
        0x1ULL,
        0,
        "UT_0403",
        "Testing state transition current=0 to next=6 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0404(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        6,
        0x1ULL,
        0,
        "UT_0404",
        "Testing state transition current=1 to next=6 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0405(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        6,
        0x1ULL,
        0,
        "UT_0405",
        "Testing state transition current=2 to next=6 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0406(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        6,
        0x1ULL,
        0,
        "UT_0406",
        "Testing state transition current=3 to next=6 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0407(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        6,
        0x1ULL,
        0,
        "UT_0407",
        "Testing state transition current=4 to next=6 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0408(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        6,
        0x1ULL,
        0,
        "UT_0408",
        "Testing state transition current=5 to next=6 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0409(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        6,
        0x1ULL,
        0,
        "UT_0409",
        "Testing state transition current=6 to next=6 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0410(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        6,
        0x1ULL,
        0,
        "UT_0410",
        "Testing state transition current=7 to next=6 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0411(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        6,
        0x1ULL,
        0,
        "UT_0411",
        "Testing state transition current=8 to next=6 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0412(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        6,
        0x1ULL,
        0,
        "UT_0412",
        "Testing state transition current=10 to next=6 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0413(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        6,
        0x1ULL,
        0,
        "UT_0413",
        "Testing state transition current=15 to next=6 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0414(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        6,
        0x1ULL,
        0,
        "UT_0414",
        "Testing state transition current=100 to next=6 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0415(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        6,
        0x1ULL,
        0,
        "UT_0415",
        "Testing state transition current=-100 to next=6 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0416(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        7,
        0x1ULL,
        0,
        "UT_0416",
        "Testing state transition current=-10 to next=7 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0417(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        7,
        0x1ULL,
        0,
        "UT_0417",
        "Testing state transition current=-5 to next=7 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0418(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        7,
        0x1ULL,
        0,
        "UT_0418",
        "Testing state transition current=-1 to next=7 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0419(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        7,
        0x1ULL,
        0,
        "UT_0419",
        "Testing state transition current=0 to next=7 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0420(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        7,
        0x1ULL,
        0,
        "UT_0420",
        "Testing state transition current=1 to next=7 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0421(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        7,
        0x1ULL,
        0,
        "UT_0421",
        "Testing state transition current=2 to next=7 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0422(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        7,
        0x1ULL,
        0,
        "UT_0422",
        "Testing state transition current=3 to next=7 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0423(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        7,
        0x1ULL,
        0,
        "UT_0423",
        "Testing state transition current=4 to next=7 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0424(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        7,
        0x1ULL,
        0,
        "UT_0424",
        "Testing state transition current=5 to next=7 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0425(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        7,
        0x1ULL,
        0,
        "UT_0425",
        "Testing state transition current=6 to next=7 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0426(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        7,
        0x1ULL,
        0,
        "UT_0426",
        "Testing state transition current=7 to next=7 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0427(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        7,
        0x1ULL,
        0,
        "UT_0427",
        "Testing state transition current=8 to next=7 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0428(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        7,
        0x1ULL,
        0,
        "UT_0428",
        "Testing state transition current=10 to next=7 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0429(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        7,
        0x1ULL,
        0,
        "UT_0429",
        "Testing state transition current=15 to next=7 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0430(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        7,
        0x1ULL,
        0,
        "UT_0430",
        "Testing state transition current=100 to next=7 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0431(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        7,
        0x1ULL,
        0,
        "UT_0431",
        "Testing state transition current=-100 to next=7 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0432(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        8,
        0x1ULL,
        0,
        "UT_0432",
        "Testing state transition current=-10 to next=8 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0433(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        8,
        0x1ULL,
        0,
        "UT_0433",
        "Testing state transition current=-5 to next=8 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0434(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        8,
        0x1ULL,
        0,
        "UT_0434",
        "Testing state transition current=-1 to next=8 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0435(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        8,
        0x1ULL,
        0,
        "UT_0435",
        "Testing state transition current=0 to next=8 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0436(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        8,
        0x1ULL,
        0,
        "UT_0436",
        "Testing state transition current=1 to next=8 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0437(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        8,
        0x1ULL,
        0,
        "UT_0437",
        "Testing state transition current=2 to next=8 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0438(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        8,
        0x1ULL,
        0,
        "UT_0438",
        "Testing state transition current=3 to next=8 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0439(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        8,
        0x1ULL,
        0,
        "UT_0439",
        "Testing state transition current=4 to next=8 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0440(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        8,
        0x1ULL,
        0,
        "UT_0440",
        "Testing state transition current=5 to next=8 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0441(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        8,
        0x1ULL,
        0,
        "UT_0441",
        "Testing state transition current=6 to next=8 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0442(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        8,
        0x1ULL,
        0,
        "UT_0442",
        "Testing state transition current=7 to next=8 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0443(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        8,
        0x1ULL,
        0,
        "UT_0443",
        "Testing state transition current=8 to next=8 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0444(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        8,
        0x1ULL,
        0,
        "UT_0444",
        "Testing state transition current=10 to next=8 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0445(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        8,
        0x1ULL,
        0,
        "UT_0445",
        "Testing state transition current=15 to next=8 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0446(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        8,
        0x1ULL,
        0,
        "UT_0446",
        "Testing state transition current=100 to next=8 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0447(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        8,
        0x1ULL,
        0,
        "UT_0447",
        "Testing state transition current=-100 to next=8 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0448(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        10,
        0x1ULL,
        0,
        "UT_0448",
        "Testing state transition current=-10 to next=10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0449(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        10,
        0x1ULL,
        0,
        "UT_0449",
        "Testing state transition current=-5 to next=10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0450(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        10,
        0x1ULL,
        0,
        "UT_0450",
        "Testing state transition current=-1 to next=10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0451(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        10,
        0x1ULL,
        0,
        "UT_0451",
        "Testing state transition current=0 to next=10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0452(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        10,
        0x1ULL,
        0,
        "UT_0452",
        "Testing state transition current=1 to next=10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0453(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        10,
        0x1ULL,
        0,
        "UT_0453",
        "Testing state transition current=2 to next=10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0454(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        10,
        0x1ULL,
        0,
        "UT_0454",
        "Testing state transition current=3 to next=10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0455(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        10,
        0x1ULL,
        0,
        "UT_0455",
        "Testing state transition current=4 to next=10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0456(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        10,
        0x1ULL,
        0,
        "UT_0456",
        "Testing state transition current=5 to next=10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0457(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        10,
        0x1ULL,
        0,
        "UT_0457",
        "Testing state transition current=6 to next=10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0458(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        10,
        0x1ULL,
        0,
        "UT_0458",
        "Testing state transition current=7 to next=10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0459(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        10,
        0x1ULL,
        0,
        "UT_0459",
        "Testing state transition current=8 to next=10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0460(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        10,
        0x1ULL,
        0,
        "UT_0460",
        "Testing state transition current=10 to next=10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0461(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        10,
        0x1ULL,
        0,
        "UT_0461",
        "Testing state transition current=15 to next=10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0462(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        10,
        0x1ULL,
        0,
        "UT_0462",
        "Testing state transition current=100 to next=10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0463(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        10,
        0x1ULL,
        0,
        "UT_0463",
        "Testing state transition current=-100 to next=10 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0464(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        15,
        0x1ULL,
        0,
        "UT_0464",
        "Testing state transition current=-10 to next=15 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0465(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        15,
        0x1ULL,
        0,
        "UT_0465",
        "Testing state transition current=-5 to next=15 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0466(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        15,
        0x1ULL,
        0,
        "UT_0466",
        "Testing state transition current=-1 to next=15 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0467(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        15,
        0x1ULL,
        0,
        "UT_0467",
        "Testing state transition current=0 to next=15 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0468(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        15,
        0x1ULL,
        0,
        "UT_0468",
        "Testing state transition current=1 to next=15 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0469(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        15,
        0x1ULL,
        0,
        "UT_0469",
        "Testing state transition current=2 to next=15 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0470(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        15,
        0x1ULL,
        0,
        "UT_0470",
        "Testing state transition current=3 to next=15 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0471(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        15,
        0x1ULL,
        0,
        "UT_0471",
        "Testing state transition current=4 to next=15 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0472(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        15,
        0x1ULL,
        0,
        "UT_0472",
        "Testing state transition current=5 to next=15 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0473(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        15,
        0x1ULL,
        0,
        "UT_0473",
        "Testing state transition current=6 to next=15 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0474(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        15,
        0x1ULL,
        0,
        "UT_0474",
        "Testing state transition current=7 to next=15 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0475(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        15,
        0x1ULL,
        0,
        "UT_0475",
        "Testing state transition current=8 to next=15 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0476(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        15,
        0x1ULL,
        0,
        "UT_0476",
        "Testing state transition current=10 to next=15 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0477(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        15,
        0x1ULL,
        0,
        "UT_0477",
        "Testing state transition current=15 to next=15 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0478(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        15,
        0x1ULL,
        0,
        "UT_0478",
        "Testing state transition current=100 to next=15 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0479(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        15,
        0x1ULL,
        0,
        "UT_0479",
        "Testing state transition current=-100 to next=15 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0480(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        100,
        0x1ULL,
        0,
        "UT_0480",
        "Testing state transition current=-10 to next=100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0481(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        100,
        0x1ULL,
        0,
        "UT_0481",
        "Testing state transition current=-5 to next=100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0482(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        100,
        0x1ULL,
        0,
        "UT_0482",
        "Testing state transition current=-1 to next=100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0483(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        100,
        0x1ULL,
        0,
        "UT_0483",
        "Testing state transition current=0 to next=100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0484(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        100,
        0x1ULL,
        0,
        "UT_0484",
        "Testing state transition current=1 to next=100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0485(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        100,
        0x1ULL,
        0,
        "UT_0485",
        "Testing state transition current=2 to next=100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0486(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        100,
        0x1ULL,
        0,
        "UT_0486",
        "Testing state transition current=3 to next=100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0487(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        100,
        0x1ULL,
        0,
        "UT_0487",
        "Testing state transition current=4 to next=100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0488(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        100,
        0x1ULL,
        0,
        "UT_0488",
        "Testing state transition current=5 to next=100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0489(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        100,
        0x1ULL,
        0,
        "UT_0489",
        "Testing state transition current=6 to next=100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0490(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        100,
        0x1ULL,
        0,
        "UT_0490",
        "Testing state transition current=7 to next=100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0491(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        100,
        0x1ULL,
        0,
        "UT_0491",
        "Testing state transition current=8 to next=100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0492(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        100,
        0x1ULL,
        0,
        "UT_0492",
        "Testing state transition current=10 to next=100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0493(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        100,
        0x1ULL,
        0,
        "UT_0493",
        "Testing state transition current=15 to next=100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0494(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        100,
        0x1ULL,
        0,
        "UT_0494",
        "Testing state transition current=100 to next=100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0495(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        100,
        0x1ULL,
        0,
        "UT_0495",
        "Testing state transition current=-100 to next=100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0496(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -100,
        0x1ULL,
        0,
        "UT_0496",
        "Testing state transition current=-10 to next=-100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0497(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -100,
        0x1ULL,
        0,
        "UT_0497",
        "Testing state transition current=-5 to next=-100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0498(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -100,
        0x1ULL,
        0,
        "UT_0498",
        "Testing state transition current=-1 to next=-100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0499(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -100,
        0x1ULL,
        0,
        "UT_0499",
        "Testing state transition current=0 to next=-100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0500(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -100,
        0x1ULL,
        0,
        "UT_0500",
        "Testing state transition current=1 to next=-100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0501(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -100,
        0x1ULL,
        0,
        "UT_0501",
        "Testing state transition current=2 to next=-100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0502(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -100,
        0x1ULL,
        0,
        "UT_0502",
        "Testing state transition current=3 to next=-100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0503(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -100,
        0x1ULL,
        0,
        "UT_0503",
        "Testing state transition current=4 to next=-100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0504(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -100,
        0x1ULL,
        0,
        "UT_0504",
        "Testing state transition current=5 to next=-100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0505(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -100,
        0x1ULL,
        0,
        "UT_0505",
        "Testing state transition current=6 to next=-100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0506(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -100,
        0x1ULL,
        0,
        "UT_0506",
        "Testing state transition current=7 to next=-100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0507(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -100,
        0x1ULL,
        0,
        "UT_0507",
        "Testing state transition current=8 to next=-100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0508(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -100,
        0x1ULL,
        0,
        "UT_0508",
        "Testing state transition current=10 to next=-100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0509(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -100,
        0x1ULL,
        0,
        "UT_0509",
        "Testing state transition current=15 to next=-100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0510(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -100,
        0x1ULL,
        0,
        "UT_0510",
        "Testing state transition current=100 to next=-100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0511(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -100,
        0x1ULL,
        0,
        "UT_0511",
        "Testing state transition current=-100 to next=-100 with prereq=0x1",
        stats
    );
}
static void run_unit_test_0512(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -10,
        0x2ULL,
        0,
        "UT_0512",
        "Testing state transition current=-10 to next=-10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0513(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -10,
        0x2ULL,
        0,
        "UT_0513",
        "Testing state transition current=-5 to next=-10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0514(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -10,
        0x2ULL,
        0,
        "UT_0514",
        "Testing state transition current=-1 to next=-10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0515(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -10,
        0x2ULL,
        0,
        "UT_0515",
        "Testing state transition current=0 to next=-10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0516(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -10,
        0x2ULL,
        0,
        "UT_0516",
        "Testing state transition current=1 to next=-10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0517(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -10,
        0x2ULL,
        0,
        "UT_0517",
        "Testing state transition current=2 to next=-10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0518(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -10,
        0x2ULL,
        0,
        "UT_0518",
        "Testing state transition current=3 to next=-10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0519(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -10,
        0x2ULL,
        0,
        "UT_0519",
        "Testing state transition current=4 to next=-10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0520(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -10,
        0x2ULL,
        0,
        "UT_0520",
        "Testing state transition current=5 to next=-10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0521(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -10,
        0x2ULL,
        0,
        "UT_0521",
        "Testing state transition current=6 to next=-10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0522(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -10,
        0x2ULL,
        0,
        "UT_0522",
        "Testing state transition current=7 to next=-10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0523(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -10,
        0x2ULL,
        0,
        "UT_0523",
        "Testing state transition current=8 to next=-10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0524(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -10,
        0x2ULL,
        0,
        "UT_0524",
        "Testing state transition current=10 to next=-10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0525(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -10,
        0x2ULL,
        0,
        "UT_0525",
        "Testing state transition current=15 to next=-10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0526(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -10,
        0x2ULL,
        0,
        "UT_0526",
        "Testing state transition current=100 to next=-10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0527(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -10,
        0x2ULL,
        0,
        "UT_0527",
        "Testing state transition current=-100 to next=-10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0528(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -5,
        0x2ULL,
        0,
        "UT_0528",
        "Testing state transition current=-10 to next=-5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0529(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -5,
        0x2ULL,
        0,
        "UT_0529",
        "Testing state transition current=-5 to next=-5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0530(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -5,
        0x2ULL,
        0,
        "UT_0530",
        "Testing state transition current=-1 to next=-5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0531(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -5,
        0x2ULL,
        0,
        "UT_0531",
        "Testing state transition current=0 to next=-5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0532(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -5,
        0x2ULL,
        0,
        "UT_0532",
        "Testing state transition current=1 to next=-5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0533(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -5,
        0x2ULL,
        0,
        "UT_0533",
        "Testing state transition current=2 to next=-5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0534(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -5,
        0x2ULL,
        0,
        "UT_0534",
        "Testing state transition current=3 to next=-5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0535(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -5,
        0x2ULL,
        0,
        "UT_0535",
        "Testing state transition current=4 to next=-5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0536(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -5,
        0x2ULL,
        0,
        "UT_0536",
        "Testing state transition current=5 to next=-5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0537(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -5,
        0x2ULL,
        0,
        "UT_0537",
        "Testing state transition current=6 to next=-5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0538(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -5,
        0x2ULL,
        0,
        "UT_0538",
        "Testing state transition current=7 to next=-5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0539(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -5,
        0x2ULL,
        0,
        "UT_0539",
        "Testing state transition current=8 to next=-5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0540(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -5,
        0x2ULL,
        0,
        "UT_0540",
        "Testing state transition current=10 to next=-5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0541(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -5,
        0x2ULL,
        0,
        "UT_0541",
        "Testing state transition current=15 to next=-5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0542(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -5,
        0x2ULL,
        0,
        "UT_0542",
        "Testing state transition current=100 to next=-5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0543(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -5,
        0x2ULL,
        0,
        "UT_0543",
        "Testing state transition current=-100 to next=-5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0544(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -1,
        0x2ULL,
        0,
        "UT_0544",
        "Testing state transition current=-10 to next=-1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0545(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -1,
        0x2ULL,
        0,
        "UT_0545",
        "Testing state transition current=-5 to next=-1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0546(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -1,
        0x2ULL,
        0,
        "UT_0546",
        "Testing state transition current=-1 to next=-1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0547(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -1,
        0x2ULL,
        0,
        "UT_0547",
        "Testing state transition current=0 to next=-1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0548(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -1,
        0x2ULL,
        0,
        "UT_0548",
        "Testing state transition current=1 to next=-1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0549(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -1,
        0x2ULL,
        0,
        "UT_0549",
        "Testing state transition current=2 to next=-1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0550(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -1,
        0x2ULL,
        0,
        "UT_0550",
        "Testing state transition current=3 to next=-1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0551(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -1,
        0x2ULL,
        0,
        "UT_0551",
        "Testing state transition current=4 to next=-1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0552(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -1,
        0x2ULL,
        0,
        "UT_0552",
        "Testing state transition current=5 to next=-1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0553(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -1,
        0x2ULL,
        0,
        "UT_0553",
        "Testing state transition current=6 to next=-1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0554(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -1,
        0x2ULL,
        0,
        "UT_0554",
        "Testing state transition current=7 to next=-1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0555(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -1,
        0x2ULL,
        0,
        "UT_0555",
        "Testing state transition current=8 to next=-1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0556(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -1,
        0x2ULL,
        0,
        "UT_0556",
        "Testing state transition current=10 to next=-1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0557(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -1,
        0x2ULL,
        0,
        "UT_0557",
        "Testing state transition current=15 to next=-1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0558(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -1,
        0x2ULL,
        0,
        "UT_0558",
        "Testing state transition current=100 to next=-1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0559(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -1,
        0x2ULL,
        0,
        "UT_0559",
        "Testing state transition current=-100 to next=-1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0560(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        0,
        0x2ULL,
        0,
        "UT_0560",
        "Testing state transition current=-10 to next=0 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0561(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        0,
        0x2ULL,
        0,
        "UT_0561",
        "Testing state transition current=-5 to next=0 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0562(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        0,
        0x2ULL,
        0,
        "UT_0562",
        "Testing state transition current=-1 to next=0 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0563(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        0,
        0x2ULL,
        1,
        "UT_0563",
        "Testing state transition current=0 to next=0 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0564(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        0,
        0x2ULL,
        1,
        "UT_0564",
        "Testing state transition current=1 to next=0 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0565(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        0,
        0x2ULL,
        1,
        "UT_0565",
        "Testing state transition current=2 to next=0 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0566(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        0,
        0x2ULL,
        1,
        "UT_0566",
        "Testing state transition current=3 to next=0 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0567(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        0,
        0x2ULL,
        1,
        "UT_0567",
        "Testing state transition current=4 to next=0 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0568(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        0,
        0x2ULL,
        1,
        "UT_0568",
        "Testing state transition current=5 to next=0 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0569(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        0,
        0x2ULL,
        1,
        "UT_0569",
        "Testing state transition current=6 to next=0 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0570(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        0,
        0x2ULL,
        1,
        "UT_0570",
        "Testing state transition current=7 to next=0 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0571(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        0,
        0x2ULL,
        0,
        "UT_0571",
        "Testing state transition current=8 to next=0 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0572(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        0,
        0x2ULL,
        0,
        "UT_0572",
        "Testing state transition current=10 to next=0 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0573(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        0,
        0x2ULL,
        0,
        "UT_0573",
        "Testing state transition current=15 to next=0 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0574(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        0,
        0x2ULL,
        0,
        "UT_0574",
        "Testing state transition current=100 to next=0 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0575(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        0,
        0x2ULL,
        0,
        "UT_0575",
        "Testing state transition current=-100 to next=0 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0576(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        1,
        0x2ULL,
        0,
        "UT_0576",
        "Testing state transition current=-10 to next=1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0577(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        1,
        0x2ULL,
        0,
        "UT_0577",
        "Testing state transition current=-5 to next=1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0578(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        1,
        0x2ULL,
        0,
        "UT_0578",
        "Testing state transition current=-1 to next=1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0579(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        1,
        0x2ULL,
        0,
        "UT_0579",
        "Testing state transition current=0 to next=1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0580(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        1,
        0x2ULL,
        0,
        "UT_0580",
        "Testing state transition current=1 to next=1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0581(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        1,
        0x2ULL,
        0,
        "UT_0581",
        "Testing state transition current=2 to next=1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0582(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        1,
        0x2ULL,
        0,
        "UT_0582",
        "Testing state transition current=3 to next=1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0583(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        1,
        0x2ULL,
        0,
        "UT_0583",
        "Testing state transition current=4 to next=1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0584(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        1,
        0x2ULL,
        0,
        "UT_0584",
        "Testing state transition current=5 to next=1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0585(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        1,
        0x2ULL,
        0,
        "UT_0585",
        "Testing state transition current=6 to next=1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0586(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        1,
        0x2ULL,
        0,
        "UT_0586",
        "Testing state transition current=7 to next=1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0587(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        1,
        0x2ULL,
        0,
        "UT_0587",
        "Testing state transition current=8 to next=1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0588(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        1,
        0x2ULL,
        0,
        "UT_0588",
        "Testing state transition current=10 to next=1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0589(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        1,
        0x2ULL,
        0,
        "UT_0589",
        "Testing state transition current=15 to next=1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0590(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        1,
        0x2ULL,
        0,
        "UT_0590",
        "Testing state transition current=100 to next=1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0591(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        1,
        0x2ULL,
        0,
        "UT_0591",
        "Testing state transition current=-100 to next=1 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0592(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        2,
        0x2ULL,
        0,
        "UT_0592",
        "Testing state transition current=-10 to next=2 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0593(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        2,
        0x2ULL,
        0,
        "UT_0593",
        "Testing state transition current=-5 to next=2 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0594(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        2,
        0x2ULL,
        0,
        "UT_0594",
        "Testing state transition current=-1 to next=2 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0595(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        2,
        0x2ULL,
        0,
        "UT_0595",
        "Testing state transition current=0 to next=2 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0596(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        2,
        0x2ULL,
        1,
        "UT_0596",
        "Testing state transition current=1 to next=2 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0597(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        2,
        0x2ULL,
        0,
        "UT_0597",
        "Testing state transition current=2 to next=2 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0598(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        2,
        0x2ULL,
        0,
        "UT_0598",
        "Testing state transition current=3 to next=2 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0599(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        2,
        0x2ULL,
        0,
        "UT_0599",
        "Testing state transition current=4 to next=2 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0600(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        2,
        0x2ULL,
        0,
        "UT_0600",
        "Testing state transition current=5 to next=2 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0601(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        2,
        0x2ULL,
        0,
        "UT_0601",
        "Testing state transition current=6 to next=2 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0602(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        2,
        0x2ULL,
        0,
        "UT_0602",
        "Testing state transition current=7 to next=2 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0603(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        2,
        0x2ULL,
        0,
        "UT_0603",
        "Testing state transition current=8 to next=2 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0604(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        2,
        0x2ULL,
        0,
        "UT_0604",
        "Testing state transition current=10 to next=2 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0605(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        2,
        0x2ULL,
        0,
        "UT_0605",
        "Testing state transition current=15 to next=2 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0606(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        2,
        0x2ULL,
        0,
        "UT_0606",
        "Testing state transition current=100 to next=2 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0607(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        2,
        0x2ULL,
        0,
        "UT_0607",
        "Testing state transition current=-100 to next=2 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0608(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        3,
        0x2ULL,
        0,
        "UT_0608",
        "Testing state transition current=-10 to next=3 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0609(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        3,
        0x2ULL,
        0,
        "UT_0609",
        "Testing state transition current=-5 to next=3 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0610(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        3,
        0x2ULL,
        0,
        "UT_0610",
        "Testing state transition current=-1 to next=3 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0611(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        3,
        0x2ULL,
        0,
        "UT_0611",
        "Testing state transition current=0 to next=3 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0612(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        3,
        0x2ULL,
        0,
        "UT_0612",
        "Testing state transition current=1 to next=3 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0613(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        3,
        0x2ULL,
        0,
        "UT_0613",
        "Testing state transition current=2 to next=3 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0614(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        3,
        0x2ULL,
        0,
        "UT_0614",
        "Testing state transition current=3 to next=3 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0615(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        3,
        0x2ULL,
        0,
        "UT_0615",
        "Testing state transition current=4 to next=3 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0616(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        3,
        0x2ULL,
        0,
        "UT_0616",
        "Testing state transition current=5 to next=3 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0617(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        3,
        0x2ULL,
        0,
        "UT_0617",
        "Testing state transition current=6 to next=3 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0618(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        3,
        0x2ULL,
        0,
        "UT_0618",
        "Testing state transition current=7 to next=3 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0619(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        3,
        0x2ULL,
        0,
        "UT_0619",
        "Testing state transition current=8 to next=3 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0620(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        3,
        0x2ULL,
        0,
        "UT_0620",
        "Testing state transition current=10 to next=3 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0621(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        3,
        0x2ULL,
        0,
        "UT_0621",
        "Testing state transition current=15 to next=3 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0622(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        3,
        0x2ULL,
        0,
        "UT_0622",
        "Testing state transition current=100 to next=3 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0623(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        3,
        0x2ULL,
        0,
        "UT_0623",
        "Testing state transition current=-100 to next=3 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0624(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        4,
        0x2ULL,
        0,
        "UT_0624",
        "Testing state transition current=-10 to next=4 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0625(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        4,
        0x2ULL,
        0,
        "UT_0625",
        "Testing state transition current=-5 to next=4 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0626(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        4,
        0x2ULL,
        0,
        "UT_0626",
        "Testing state transition current=-1 to next=4 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0627(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        4,
        0x2ULL,
        0,
        "UT_0627",
        "Testing state transition current=0 to next=4 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0628(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        4,
        0x2ULL,
        0,
        "UT_0628",
        "Testing state transition current=1 to next=4 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0629(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        4,
        0x2ULL,
        0,
        "UT_0629",
        "Testing state transition current=2 to next=4 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0630(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        4,
        0x2ULL,
        0,
        "UT_0630",
        "Testing state transition current=3 to next=4 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0631(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        4,
        0x2ULL,
        0,
        "UT_0631",
        "Testing state transition current=4 to next=4 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0632(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        4,
        0x2ULL,
        0,
        "UT_0632",
        "Testing state transition current=5 to next=4 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0633(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        4,
        0x2ULL,
        0,
        "UT_0633",
        "Testing state transition current=6 to next=4 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0634(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        4,
        0x2ULL,
        0,
        "UT_0634",
        "Testing state transition current=7 to next=4 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0635(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        4,
        0x2ULL,
        0,
        "UT_0635",
        "Testing state transition current=8 to next=4 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0636(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        4,
        0x2ULL,
        0,
        "UT_0636",
        "Testing state transition current=10 to next=4 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0637(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        4,
        0x2ULL,
        0,
        "UT_0637",
        "Testing state transition current=15 to next=4 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0638(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        4,
        0x2ULL,
        0,
        "UT_0638",
        "Testing state transition current=100 to next=4 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0639(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        4,
        0x2ULL,
        0,
        "UT_0639",
        "Testing state transition current=-100 to next=4 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0640(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        5,
        0x2ULL,
        0,
        "UT_0640",
        "Testing state transition current=-10 to next=5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0641(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        5,
        0x2ULL,
        0,
        "UT_0641",
        "Testing state transition current=-5 to next=5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0642(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        5,
        0x2ULL,
        0,
        "UT_0642",
        "Testing state transition current=-1 to next=5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0643(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        5,
        0x2ULL,
        0,
        "UT_0643",
        "Testing state transition current=0 to next=5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0644(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        5,
        0x2ULL,
        0,
        "UT_0644",
        "Testing state transition current=1 to next=5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0645(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        5,
        0x2ULL,
        0,
        "UT_0645",
        "Testing state transition current=2 to next=5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0646(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        5,
        0x2ULL,
        0,
        "UT_0646",
        "Testing state transition current=3 to next=5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0647(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        5,
        0x2ULL,
        0,
        "UT_0647",
        "Testing state transition current=4 to next=5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0648(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        5,
        0x2ULL,
        0,
        "UT_0648",
        "Testing state transition current=5 to next=5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0649(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        5,
        0x2ULL,
        0,
        "UT_0649",
        "Testing state transition current=6 to next=5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0650(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        5,
        0x2ULL,
        0,
        "UT_0650",
        "Testing state transition current=7 to next=5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0651(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        5,
        0x2ULL,
        0,
        "UT_0651",
        "Testing state transition current=8 to next=5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0652(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        5,
        0x2ULL,
        0,
        "UT_0652",
        "Testing state transition current=10 to next=5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0653(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        5,
        0x2ULL,
        0,
        "UT_0653",
        "Testing state transition current=15 to next=5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0654(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        5,
        0x2ULL,
        0,
        "UT_0654",
        "Testing state transition current=100 to next=5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0655(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        5,
        0x2ULL,
        0,
        "UT_0655",
        "Testing state transition current=-100 to next=5 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0656(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        6,
        0x2ULL,
        0,
        "UT_0656",
        "Testing state transition current=-10 to next=6 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0657(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        6,
        0x2ULL,
        0,
        "UT_0657",
        "Testing state transition current=-5 to next=6 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0658(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        6,
        0x2ULL,
        0,
        "UT_0658",
        "Testing state transition current=-1 to next=6 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0659(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        6,
        0x2ULL,
        0,
        "UT_0659",
        "Testing state transition current=0 to next=6 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0660(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        6,
        0x2ULL,
        0,
        "UT_0660",
        "Testing state transition current=1 to next=6 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0661(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        6,
        0x2ULL,
        0,
        "UT_0661",
        "Testing state transition current=2 to next=6 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0662(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        6,
        0x2ULL,
        0,
        "UT_0662",
        "Testing state transition current=3 to next=6 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0663(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        6,
        0x2ULL,
        0,
        "UT_0663",
        "Testing state transition current=4 to next=6 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0664(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        6,
        0x2ULL,
        0,
        "UT_0664",
        "Testing state transition current=5 to next=6 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0665(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        6,
        0x2ULL,
        0,
        "UT_0665",
        "Testing state transition current=6 to next=6 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0666(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        6,
        0x2ULL,
        0,
        "UT_0666",
        "Testing state transition current=7 to next=6 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0667(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        6,
        0x2ULL,
        0,
        "UT_0667",
        "Testing state transition current=8 to next=6 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0668(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        6,
        0x2ULL,
        0,
        "UT_0668",
        "Testing state transition current=10 to next=6 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0669(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        6,
        0x2ULL,
        0,
        "UT_0669",
        "Testing state transition current=15 to next=6 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0670(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        6,
        0x2ULL,
        0,
        "UT_0670",
        "Testing state transition current=100 to next=6 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0671(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        6,
        0x2ULL,
        0,
        "UT_0671",
        "Testing state transition current=-100 to next=6 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0672(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        7,
        0x2ULL,
        0,
        "UT_0672",
        "Testing state transition current=-10 to next=7 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0673(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        7,
        0x2ULL,
        0,
        "UT_0673",
        "Testing state transition current=-5 to next=7 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0674(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        7,
        0x2ULL,
        0,
        "UT_0674",
        "Testing state transition current=-1 to next=7 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0675(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        7,
        0x2ULL,
        0,
        "UT_0675",
        "Testing state transition current=0 to next=7 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0676(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        7,
        0x2ULL,
        0,
        "UT_0676",
        "Testing state transition current=1 to next=7 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0677(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        7,
        0x2ULL,
        0,
        "UT_0677",
        "Testing state transition current=2 to next=7 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0678(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        7,
        0x2ULL,
        0,
        "UT_0678",
        "Testing state transition current=3 to next=7 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0679(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        7,
        0x2ULL,
        0,
        "UT_0679",
        "Testing state transition current=4 to next=7 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0680(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        7,
        0x2ULL,
        0,
        "UT_0680",
        "Testing state transition current=5 to next=7 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0681(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        7,
        0x2ULL,
        0,
        "UT_0681",
        "Testing state transition current=6 to next=7 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0682(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        7,
        0x2ULL,
        0,
        "UT_0682",
        "Testing state transition current=7 to next=7 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0683(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        7,
        0x2ULL,
        0,
        "UT_0683",
        "Testing state transition current=8 to next=7 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0684(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        7,
        0x2ULL,
        0,
        "UT_0684",
        "Testing state transition current=10 to next=7 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0685(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        7,
        0x2ULL,
        0,
        "UT_0685",
        "Testing state transition current=15 to next=7 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0686(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        7,
        0x2ULL,
        0,
        "UT_0686",
        "Testing state transition current=100 to next=7 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0687(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        7,
        0x2ULL,
        0,
        "UT_0687",
        "Testing state transition current=-100 to next=7 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0688(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        8,
        0x2ULL,
        0,
        "UT_0688",
        "Testing state transition current=-10 to next=8 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0689(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        8,
        0x2ULL,
        0,
        "UT_0689",
        "Testing state transition current=-5 to next=8 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0690(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        8,
        0x2ULL,
        0,
        "UT_0690",
        "Testing state transition current=-1 to next=8 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0691(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        8,
        0x2ULL,
        0,
        "UT_0691",
        "Testing state transition current=0 to next=8 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0692(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        8,
        0x2ULL,
        0,
        "UT_0692",
        "Testing state transition current=1 to next=8 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0693(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        8,
        0x2ULL,
        0,
        "UT_0693",
        "Testing state transition current=2 to next=8 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0694(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        8,
        0x2ULL,
        0,
        "UT_0694",
        "Testing state transition current=3 to next=8 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0695(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        8,
        0x2ULL,
        0,
        "UT_0695",
        "Testing state transition current=4 to next=8 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0696(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        8,
        0x2ULL,
        0,
        "UT_0696",
        "Testing state transition current=5 to next=8 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0697(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        8,
        0x2ULL,
        0,
        "UT_0697",
        "Testing state transition current=6 to next=8 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0698(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        8,
        0x2ULL,
        0,
        "UT_0698",
        "Testing state transition current=7 to next=8 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0699(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        8,
        0x2ULL,
        0,
        "UT_0699",
        "Testing state transition current=8 to next=8 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0700(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        8,
        0x2ULL,
        0,
        "UT_0700",
        "Testing state transition current=10 to next=8 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0701(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        8,
        0x2ULL,
        0,
        "UT_0701",
        "Testing state transition current=15 to next=8 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0702(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        8,
        0x2ULL,
        0,
        "UT_0702",
        "Testing state transition current=100 to next=8 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0703(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        8,
        0x2ULL,
        0,
        "UT_0703",
        "Testing state transition current=-100 to next=8 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0704(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        10,
        0x2ULL,
        0,
        "UT_0704",
        "Testing state transition current=-10 to next=10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0705(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        10,
        0x2ULL,
        0,
        "UT_0705",
        "Testing state transition current=-5 to next=10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0706(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        10,
        0x2ULL,
        0,
        "UT_0706",
        "Testing state transition current=-1 to next=10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0707(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        10,
        0x2ULL,
        0,
        "UT_0707",
        "Testing state transition current=0 to next=10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0708(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        10,
        0x2ULL,
        0,
        "UT_0708",
        "Testing state transition current=1 to next=10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0709(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        10,
        0x2ULL,
        0,
        "UT_0709",
        "Testing state transition current=2 to next=10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0710(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        10,
        0x2ULL,
        0,
        "UT_0710",
        "Testing state transition current=3 to next=10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0711(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        10,
        0x2ULL,
        0,
        "UT_0711",
        "Testing state transition current=4 to next=10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0712(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        10,
        0x2ULL,
        0,
        "UT_0712",
        "Testing state transition current=5 to next=10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0713(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        10,
        0x2ULL,
        0,
        "UT_0713",
        "Testing state transition current=6 to next=10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0714(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        10,
        0x2ULL,
        0,
        "UT_0714",
        "Testing state transition current=7 to next=10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0715(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        10,
        0x2ULL,
        0,
        "UT_0715",
        "Testing state transition current=8 to next=10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0716(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        10,
        0x2ULL,
        0,
        "UT_0716",
        "Testing state transition current=10 to next=10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0717(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        10,
        0x2ULL,
        0,
        "UT_0717",
        "Testing state transition current=15 to next=10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0718(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        10,
        0x2ULL,
        0,
        "UT_0718",
        "Testing state transition current=100 to next=10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0719(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        10,
        0x2ULL,
        0,
        "UT_0719",
        "Testing state transition current=-100 to next=10 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0720(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        15,
        0x2ULL,
        0,
        "UT_0720",
        "Testing state transition current=-10 to next=15 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0721(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        15,
        0x2ULL,
        0,
        "UT_0721",
        "Testing state transition current=-5 to next=15 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0722(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        15,
        0x2ULL,
        0,
        "UT_0722",
        "Testing state transition current=-1 to next=15 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0723(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        15,
        0x2ULL,
        0,
        "UT_0723",
        "Testing state transition current=0 to next=15 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0724(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        15,
        0x2ULL,
        0,
        "UT_0724",
        "Testing state transition current=1 to next=15 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0725(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        15,
        0x2ULL,
        0,
        "UT_0725",
        "Testing state transition current=2 to next=15 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0726(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        15,
        0x2ULL,
        0,
        "UT_0726",
        "Testing state transition current=3 to next=15 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0727(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        15,
        0x2ULL,
        0,
        "UT_0727",
        "Testing state transition current=4 to next=15 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0728(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        15,
        0x2ULL,
        0,
        "UT_0728",
        "Testing state transition current=5 to next=15 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0729(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        15,
        0x2ULL,
        0,
        "UT_0729",
        "Testing state transition current=6 to next=15 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0730(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        15,
        0x2ULL,
        0,
        "UT_0730",
        "Testing state transition current=7 to next=15 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0731(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        15,
        0x2ULL,
        0,
        "UT_0731",
        "Testing state transition current=8 to next=15 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0732(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        15,
        0x2ULL,
        0,
        "UT_0732",
        "Testing state transition current=10 to next=15 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0733(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        15,
        0x2ULL,
        0,
        "UT_0733",
        "Testing state transition current=15 to next=15 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0734(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        15,
        0x2ULL,
        0,
        "UT_0734",
        "Testing state transition current=100 to next=15 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0735(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        15,
        0x2ULL,
        0,
        "UT_0735",
        "Testing state transition current=-100 to next=15 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0736(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        100,
        0x2ULL,
        0,
        "UT_0736",
        "Testing state transition current=-10 to next=100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0737(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        100,
        0x2ULL,
        0,
        "UT_0737",
        "Testing state transition current=-5 to next=100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0738(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        100,
        0x2ULL,
        0,
        "UT_0738",
        "Testing state transition current=-1 to next=100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0739(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        100,
        0x2ULL,
        0,
        "UT_0739",
        "Testing state transition current=0 to next=100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0740(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        100,
        0x2ULL,
        0,
        "UT_0740",
        "Testing state transition current=1 to next=100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0741(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        100,
        0x2ULL,
        0,
        "UT_0741",
        "Testing state transition current=2 to next=100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0742(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        100,
        0x2ULL,
        0,
        "UT_0742",
        "Testing state transition current=3 to next=100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0743(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        100,
        0x2ULL,
        0,
        "UT_0743",
        "Testing state transition current=4 to next=100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0744(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        100,
        0x2ULL,
        0,
        "UT_0744",
        "Testing state transition current=5 to next=100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0745(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        100,
        0x2ULL,
        0,
        "UT_0745",
        "Testing state transition current=6 to next=100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0746(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        100,
        0x2ULL,
        0,
        "UT_0746",
        "Testing state transition current=7 to next=100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0747(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        100,
        0x2ULL,
        0,
        "UT_0747",
        "Testing state transition current=8 to next=100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0748(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        100,
        0x2ULL,
        0,
        "UT_0748",
        "Testing state transition current=10 to next=100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0749(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        100,
        0x2ULL,
        0,
        "UT_0749",
        "Testing state transition current=15 to next=100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0750(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        100,
        0x2ULL,
        0,
        "UT_0750",
        "Testing state transition current=100 to next=100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0751(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        100,
        0x2ULL,
        0,
        "UT_0751",
        "Testing state transition current=-100 to next=100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0752(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -100,
        0x2ULL,
        0,
        "UT_0752",
        "Testing state transition current=-10 to next=-100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0753(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -100,
        0x2ULL,
        0,
        "UT_0753",
        "Testing state transition current=-5 to next=-100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0754(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -100,
        0x2ULL,
        0,
        "UT_0754",
        "Testing state transition current=-1 to next=-100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0755(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -100,
        0x2ULL,
        0,
        "UT_0755",
        "Testing state transition current=0 to next=-100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0756(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -100,
        0x2ULL,
        0,
        "UT_0756",
        "Testing state transition current=1 to next=-100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0757(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -100,
        0x2ULL,
        0,
        "UT_0757",
        "Testing state transition current=2 to next=-100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0758(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -100,
        0x2ULL,
        0,
        "UT_0758",
        "Testing state transition current=3 to next=-100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0759(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -100,
        0x2ULL,
        0,
        "UT_0759",
        "Testing state transition current=4 to next=-100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0760(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -100,
        0x2ULL,
        0,
        "UT_0760",
        "Testing state transition current=5 to next=-100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0761(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -100,
        0x2ULL,
        0,
        "UT_0761",
        "Testing state transition current=6 to next=-100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0762(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -100,
        0x2ULL,
        0,
        "UT_0762",
        "Testing state transition current=7 to next=-100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0763(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -100,
        0x2ULL,
        0,
        "UT_0763",
        "Testing state transition current=8 to next=-100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0764(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -100,
        0x2ULL,
        0,
        "UT_0764",
        "Testing state transition current=10 to next=-100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0765(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -100,
        0x2ULL,
        0,
        "UT_0765",
        "Testing state transition current=15 to next=-100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0766(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -100,
        0x2ULL,
        0,
        "UT_0766",
        "Testing state transition current=100 to next=-100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0767(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -100,
        0x2ULL,
        0,
        "UT_0767",
        "Testing state transition current=-100 to next=-100 with prereq=0x2",
        stats
    );
}
static void run_unit_test_0768(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -10,
        0x4ULL,
        0,
        "UT_0768",
        "Testing state transition current=-10 to next=-10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0769(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -10,
        0x4ULL,
        0,
        "UT_0769",
        "Testing state transition current=-5 to next=-10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0770(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -10,
        0x4ULL,
        0,
        "UT_0770",
        "Testing state transition current=-1 to next=-10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0771(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -10,
        0x4ULL,
        0,
        "UT_0771",
        "Testing state transition current=0 to next=-10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0772(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -10,
        0x4ULL,
        0,
        "UT_0772",
        "Testing state transition current=1 to next=-10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0773(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -10,
        0x4ULL,
        0,
        "UT_0773",
        "Testing state transition current=2 to next=-10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0774(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -10,
        0x4ULL,
        0,
        "UT_0774",
        "Testing state transition current=3 to next=-10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0775(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -10,
        0x4ULL,
        0,
        "UT_0775",
        "Testing state transition current=4 to next=-10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0776(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -10,
        0x4ULL,
        0,
        "UT_0776",
        "Testing state transition current=5 to next=-10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0777(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -10,
        0x4ULL,
        0,
        "UT_0777",
        "Testing state transition current=6 to next=-10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0778(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -10,
        0x4ULL,
        0,
        "UT_0778",
        "Testing state transition current=7 to next=-10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0779(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -10,
        0x4ULL,
        0,
        "UT_0779",
        "Testing state transition current=8 to next=-10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0780(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -10,
        0x4ULL,
        0,
        "UT_0780",
        "Testing state transition current=10 to next=-10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0781(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -10,
        0x4ULL,
        0,
        "UT_0781",
        "Testing state transition current=15 to next=-10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0782(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -10,
        0x4ULL,
        0,
        "UT_0782",
        "Testing state transition current=100 to next=-10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0783(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -10,
        0x4ULL,
        0,
        "UT_0783",
        "Testing state transition current=-100 to next=-10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0784(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -5,
        0x4ULL,
        0,
        "UT_0784",
        "Testing state transition current=-10 to next=-5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0785(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -5,
        0x4ULL,
        0,
        "UT_0785",
        "Testing state transition current=-5 to next=-5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0786(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -5,
        0x4ULL,
        0,
        "UT_0786",
        "Testing state transition current=-1 to next=-5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0787(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -5,
        0x4ULL,
        0,
        "UT_0787",
        "Testing state transition current=0 to next=-5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0788(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -5,
        0x4ULL,
        0,
        "UT_0788",
        "Testing state transition current=1 to next=-5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0789(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -5,
        0x4ULL,
        0,
        "UT_0789",
        "Testing state transition current=2 to next=-5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0790(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -5,
        0x4ULL,
        0,
        "UT_0790",
        "Testing state transition current=3 to next=-5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0791(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -5,
        0x4ULL,
        0,
        "UT_0791",
        "Testing state transition current=4 to next=-5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0792(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -5,
        0x4ULL,
        0,
        "UT_0792",
        "Testing state transition current=5 to next=-5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0793(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -5,
        0x4ULL,
        0,
        "UT_0793",
        "Testing state transition current=6 to next=-5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0794(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -5,
        0x4ULL,
        0,
        "UT_0794",
        "Testing state transition current=7 to next=-5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0795(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -5,
        0x4ULL,
        0,
        "UT_0795",
        "Testing state transition current=8 to next=-5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0796(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -5,
        0x4ULL,
        0,
        "UT_0796",
        "Testing state transition current=10 to next=-5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0797(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -5,
        0x4ULL,
        0,
        "UT_0797",
        "Testing state transition current=15 to next=-5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0798(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -5,
        0x4ULL,
        0,
        "UT_0798",
        "Testing state transition current=100 to next=-5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0799(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -5,
        0x4ULL,
        0,
        "UT_0799",
        "Testing state transition current=-100 to next=-5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0800(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -1,
        0x4ULL,
        0,
        "UT_0800",
        "Testing state transition current=-10 to next=-1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0801(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -1,
        0x4ULL,
        0,
        "UT_0801",
        "Testing state transition current=-5 to next=-1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0802(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -1,
        0x4ULL,
        0,
        "UT_0802",
        "Testing state transition current=-1 to next=-1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0803(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -1,
        0x4ULL,
        0,
        "UT_0803",
        "Testing state transition current=0 to next=-1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0804(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -1,
        0x4ULL,
        0,
        "UT_0804",
        "Testing state transition current=1 to next=-1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0805(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -1,
        0x4ULL,
        0,
        "UT_0805",
        "Testing state transition current=2 to next=-1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0806(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -1,
        0x4ULL,
        0,
        "UT_0806",
        "Testing state transition current=3 to next=-1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0807(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -1,
        0x4ULL,
        0,
        "UT_0807",
        "Testing state transition current=4 to next=-1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0808(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -1,
        0x4ULL,
        0,
        "UT_0808",
        "Testing state transition current=5 to next=-1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0809(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -1,
        0x4ULL,
        0,
        "UT_0809",
        "Testing state transition current=6 to next=-1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0810(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -1,
        0x4ULL,
        0,
        "UT_0810",
        "Testing state transition current=7 to next=-1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0811(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -1,
        0x4ULL,
        0,
        "UT_0811",
        "Testing state transition current=8 to next=-1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0812(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -1,
        0x4ULL,
        0,
        "UT_0812",
        "Testing state transition current=10 to next=-1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0813(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -1,
        0x4ULL,
        0,
        "UT_0813",
        "Testing state transition current=15 to next=-1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0814(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -1,
        0x4ULL,
        0,
        "UT_0814",
        "Testing state transition current=100 to next=-1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0815(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -1,
        0x4ULL,
        0,
        "UT_0815",
        "Testing state transition current=-100 to next=-1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0816(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        0,
        0x4ULL,
        0,
        "UT_0816",
        "Testing state transition current=-10 to next=0 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0817(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        0,
        0x4ULL,
        0,
        "UT_0817",
        "Testing state transition current=-5 to next=0 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0818(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        0,
        0x4ULL,
        0,
        "UT_0818",
        "Testing state transition current=-1 to next=0 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0819(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        0,
        0x4ULL,
        1,
        "UT_0819",
        "Testing state transition current=0 to next=0 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0820(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        0,
        0x4ULL,
        1,
        "UT_0820",
        "Testing state transition current=1 to next=0 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0821(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        0,
        0x4ULL,
        1,
        "UT_0821",
        "Testing state transition current=2 to next=0 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0822(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        0,
        0x4ULL,
        1,
        "UT_0822",
        "Testing state transition current=3 to next=0 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0823(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        0,
        0x4ULL,
        1,
        "UT_0823",
        "Testing state transition current=4 to next=0 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0824(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        0,
        0x4ULL,
        1,
        "UT_0824",
        "Testing state transition current=5 to next=0 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0825(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        0,
        0x4ULL,
        1,
        "UT_0825",
        "Testing state transition current=6 to next=0 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0826(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        0,
        0x4ULL,
        1,
        "UT_0826",
        "Testing state transition current=7 to next=0 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0827(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        0,
        0x4ULL,
        0,
        "UT_0827",
        "Testing state transition current=8 to next=0 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0828(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        0,
        0x4ULL,
        0,
        "UT_0828",
        "Testing state transition current=10 to next=0 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0829(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        0,
        0x4ULL,
        0,
        "UT_0829",
        "Testing state transition current=15 to next=0 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0830(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        0,
        0x4ULL,
        0,
        "UT_0830",
        "Testing state transition current=100 to next=0 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0831(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        0,
        0x4ULL,
        0,
        "UT_0831",
        "Testing state transition current=-100 to next=0 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0832(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        1,
        0x4ULL,
        0,
        "UT_0832",
        "Testing state transition current=-10 to next=1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0833(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        1,
        0x4ULL,
        0,
        "UT_0833",
        "Testing state transition current=-5 to next=1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0834(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        1,
        0x4ULL,
        0,
        "UT_0834",
        "Testing state transition current=-1 to next=1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0835(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        1,
        0x4ULL,
        0,
        "UT_0835",
        "Testing state transition current=0 to next=1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0836(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        1,
        0x4ULL,
        0,
        "UT_0836",
        "Testing state transition current=1 to next=1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0837(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        1,
        0x4ULL,
        0,
        "UT_0837",
        "Testing state transition current=2 to next=1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0838(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        1,
        0x4ULL,
        0,
        "UT_0838",
        "Testing state transition current=3 to next=1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0839(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        1,
        0x4ULL,
        0,
        "UT_0839",
        "Testing state transition current=4 to next=1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0840(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        1,
        0x4ULL,
        0,
        "UT_0840",
        "Testing state transition current=5 to next=1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0841(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        1,
        0x4ULL,
        0,
        "UT_0841",
        "Testing state transition current=6 to next=1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0842(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        1,
        0x4ULL,
        0,
        "UT_0842",
        "Testing state transition current=7 to next=1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0843(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        1,
        0x4ULL,
        0,
        "UT_0843",
        "Testing state transition current=8 to next=1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0844(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        1,
        0x4ULL,
        0,
        "UT_0844",
        "Testing state transition current=10 to next=1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0845(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        1,
        0x4ULL,
        0,
        "UT_0845",
        "Testing state transition current=15 to next=1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0846(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        1,
        0x4ULL,
        0,
        "UT_0846",
        "Testing state transition current=100 to next=1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0847(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        1,
        0x4ULL,
        0,
        "UT_0847",
        "Testing state transition current=-100 to next=1 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0848(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        2,
        0x4ULL,
        0,
        "UT_0848",
        "Testing state transition current=-10 to next=2 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0849(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        2,
        0x4ULL,
        0,
        "UT_0849",
        "Testing state transition current=-5 to next=2 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0850(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        2,
        0x4ULL,
        0,
        "UT_0850",
        "Testing state transition current=-1 to next=2 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0851(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        2,
        0x4ULL,
        0,
        "UT_0851",
        "Testing state transition current=0 to next=2 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0852(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        2,
        0x4ULL,
        0,
        "UT_0852",
        "Testing state transition current=1 to next=2 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0853(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        2,
        0x4ULL,
        0,
        "UT_0853",
        "Testing state transition current=2 to next=2 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0854(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        2,
        0x4ULL,
        0,
        "UT_0854",
        "Testing state transition current=3 to next=2 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0855(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        2,
        0x4ULL,
        0,
        "UT_0855",
        "Testing state transition current=4 to next=2 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0856(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        2,
        0x4ULL,
        0,
        "UT_0856",
        "Testing state transition current=5 to next=2 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0857(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        2,
        0x4ULL,
        0,
        "UT_0857",
        "Testing state transition current=6 to next=2 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0858(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        2,
        0x4ULL,
        0,
        "UT_0858",
        "Testing state transition current=7 to next=2 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0859(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        2,
        0x4ULL,
        0,
        "UT_0859",
        "Testing state transition current=8 to next=2 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0860(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        2,
        0x4ULL,
        0,
        "UT_0860",
        "Testing state transition current=10 to next=2 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0861(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        2,
        0x4ULL,
        0,
        "UT_0861",
        "Testing state transition current=15 to next=2 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0862(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        2,
        0x4ULL,
        0,
        "UT_0862",
        "Testing state transition current=100 to next=2 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0863(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        2,
        0x4ULL,
        0,
        "UT_0863",
        "Testing state transition current=-100 to next=2 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0864(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        3,
        0x4ULL,
        0,
        "UT_0864",
        "Testing state transition current=-10 to next=3 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0865(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        3,
        0x4ULL,
        0,
        "UT_0865",
        "Testing state transition current=-5 to next=3 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0866(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        3,
        0x4ULL,
        0,
        "UT_0866",
        "Testing state transition current=-1 to next=3 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0867(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        3,
        0x4ULL,
        0,
        "UT_0867",
        "Testing state transition current=0 to next=3 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0868(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        3,
        0x4ULL,
        0,
        "UT_0868",
        "Testing state transition current=1 to next=3 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0869(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        3,
        0x4ULL,
        1,
        "UT_0869",
        "Testing state transition current=2 to next=3 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0870(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        3,
        0x4ULL,
        0,
        "UT_0870",
        "Testing state transition current=3 to next=3 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0871(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        3,
        0x4ULL,
        0,
        "UT_0871",
        "Testing state transition current=4 to next=3 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0872(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        3,
        0x4ULL,
        0,
        "UT_0872",
        "Testing state transition current=5 to next=3 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0873(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        3,
        0x4ULL,
        0,
        "UT_0873",
        "Testing state transition current=6 to next=3 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0874(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        3,
        0x4ULL,
        0,
        "UT_0874",
        "Testing state transition current=7 to next=3 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0875(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        3,
        0x4ULL,
        0,
        "UT_0875",
        "Testing state transition current=8 to next=3 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0876(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        3,
        0x4ULL,
        0,
        "UT_0876",
        "Testing state transition current=10 to next=3 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0877(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        3,
        0x4ULL,
        0,
        "UT_0877",
        "Testing state transition current=15 to next=3 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0878(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        3,
        0x4ULL,
        0,
        "UT_0878",
        "Testing state transition current=100 to next=3 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0879(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        3,
        0x4ULL,
        0,
        "UT_0879",
        "Testing state transition current=-100 to next=3 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0880(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        4,
        0x4ULL,
        0,
        "UT_0880",
        "Testing state transition current=-10 to next=4 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0881(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        4,
        0x4ULL,
        0,
        "UT_0881",
        "Testing state transition current=-5 to next=4 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0882(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        4,
        0x4ULL,
        0,
        "UT_0882",
        "Testing state transition current=-1 to next=4 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0883(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        4,
        0x4ULL,
        0,
        "UT_0883",
        "Testing state transition current=0 to next=4 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0884(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        4,
        0x4ULL,
        0,
        "UT_0884",
        "Testing state transition current=1 to next=4 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0885(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        4,
        0x4ULL,
        0,
        "UT_0885",
        "Testing state transition current=2 to next=4 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0886(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        4,
        0x4ULL,
        0,
        "UT_0886",
        "Testing state transition current=3 to next=4 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0887(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        4,
        0x4ULL,
        0,
        "UT_0887",
        "Testing state transition current=4 to next=4 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0888(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        4,
        0x4ULL,
        0,
        "UT_0888",
        "Testing state transition current=5 to next=4 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0889(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        4,
        0x4ULL,
        0,
        "UT_0889",
        "Testing state transition current=6 to next=4 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0890(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        4,
        0x4ULL,
        0,
        "UT_0890",
        "Testing state transition current=7 to next=4 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0891(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        4,
        0x4ULL,
        0,
        "UT_0891",
        "Testing state transition current=8 to next=4 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0892(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        4,
        0x4ULL,
        0,
        "UT_0892",
        "Testing state transition current=10 to next=4 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0893(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        4,
        0x4ULL,
        0,
        "UT_0893",
        "Testing state transition current=15 to next=4 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0894(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        4,
        0x4ULL,
        0,
        "UT_0894",
        "Testing state transition current=100 to next=4 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0895(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        4,
        0x4ULL,
        0,
        "UT_0895",
        "Testing state transition current=-100 to next=4 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0896(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        5,
        0x4ULL,
        0,
        "UT_0896",
        "Testing state transition current=-10 to next=5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0897(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        5,
        0x4ULL,
        0,
        "UT_0897",
        "Testing state transition current=-5 to next=5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0898(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        5,
        0x4ULL,
        0,
        "UT_0898",
        "Testing state transition current=-1 to next=5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0899(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        5,
        0x4ULL,
        0,
        "UT_0899",
        "Testing state transition current=0 to next=5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0900(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        5,
        0x4ULL,
        0,
        "UT_0900",
        "Testing state transition current=1 to next=5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0901(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        5,
        0x4ULL,
        0,
        "UT_0901",
        "Testing state transition current=2 to next=5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0902(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        5,
        0x4ULL,
        0,
        "UT_0902",
        "Testing state transition current=3 to next=5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0903(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        5,
        0x4ULL,
        0,
        "UT_0903",
        "Testing state transition current=4 to next=5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0904(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        5,
        0x4ULL,
        0,
        "UT_0904",
        "Testing state transition current=5 to next=5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0905(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        5,
        0x4ULL,
        0,
        "UT_0905",
        "Testing state transition current=6 to next=5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0906(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        5,
        0x4ULL,
        0,
        "UT_0906",
        "Testing state transition current=7 to next=5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0907(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        5,
        0x4ULL,
        0,
        "UT_0907",
        "Testing state transition current=8 to next=5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0908(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        5,
        0x4ULL,
        0,
        "UT_0908",
        "Testing state transition current=10 to next=5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0909(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        5,
        0x4ULL,
        0,
        "UT_0909",
        "Testing state transition current=15 to next=5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0910(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        5,
        0x4ULL,
        0,
        "UT_0910",
        "Testing state transition current=100 to next=5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0911(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        5,
        0x4ULL,
        0,
        "UT_0911",
        "Testing state transition current=-100 to next=5 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0912(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        6,
        0x4ULL,
        0,
        "UT_0912",
        "Testing state transition current=-10 to next=6 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0913(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        6,
        0x4ULL,
        0,
        "UT_0913",
        "Testing state transition current=-5 to next=6 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0914(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        6,
        0x4ULL,
        0,
        "UT_0914",
        "Testing state transition current=-1 to next=6 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0915(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        6,
        0x4ULL,
        0,
        "UT_0915",
        "Testing state transition current=0 to next=6 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0916(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        6,
        0x4ULL,
        0,
        "UT_0916",
        "Testing state transition current=1 to next=6 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0917(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        6,
        0x4ULL,
        0,
        "UT_0917",
        "Testing state transition current=2 to next=6 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0918(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        6,
        0x4ULL,
        0,
        "UT_0918",
        "Testing state transition current=3 to next=6 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0919(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        6,
        0x4ULL,
        0,
        "UT_0919",
        "Testing state transition current=4 to next=6 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0920(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        6,
        0x4ULL,
        0,
        "UT_0920",
        "Testing state transition current=5 to next=6 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0921(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        6,
        0x4ULL,
        0,
        "UT_0921",
        "Testing state transition current=6 to next=6 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0922(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        6,
        0x4ULL,
        0,
        "UT_0922",
        "Testing state transition current=7 to next=6 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0923(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        6,
        0x4ULL,
        0,
        "UT_0923",
        "Testing state transition current=8 to next=6 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0924(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        6,
        0x4ULL,
        0,
        "UT_0924",
        "Testing state transition current=10 to next=6 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0925(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        6,
        0x4ULL,
        0,
        "UT_0925",
        "Testing state transition current=15 to next=6 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0926(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        6,
        0x4ULL,
        0,
        "UT_0926",
        "Testing state transition current=100 to next=6 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0927(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        6,
        0x4ULL,
        0,
        "UT_0927",
        "Testing state transition current=-100 to next=6 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0928(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        7,
        0x4ULL,
        0,
        "UT_0928",
        "Testing state transition current=-10 to next=7 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0929(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        7,
        0x4ULL,
        0,
        "UT_0929",
        "Testing state transition current=-5 to next=7 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0930(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        7,
        0x4ULL,
        0,
        "UT_0930",
        "Testing state transition current=-1 to next=7 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0931(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        7,
        0x4ULL,
        0,
        "UT_0931",
        "Testing state transition current=0 to next=7 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0932(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        7,
        0x4ULL,
        0,
        "UT_0932",
        "Testing state transition current=1 to next=7 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0933(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        7,
        0x4ULL,
        0,
        "UT_0933",
        "Testing state transition current=2 to next=7 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0934(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        7,
        0x4ULL,
        0,
        "UT_0934",
        "Testing state transition current=3 to next=7 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0935(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        7,
        0x4ULL,
        0,
        "UT_0935",
        "Testing state transition current=4 to next=7 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0936(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        7,
        0x4ULL,
        0,
        "UT_0936",
        "Testing state transition current=5 to next=7 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0937(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        7,
        0x4ULL,
        0,
        "UT_0937",
        "Testing state transition current=6 to next=7 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0938(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        7,
        0x4ULL,
        0,
        "UT_0938",
        "Testing state transition current=7 to next=7 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0939(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        7,
        0x4ULL,
        0,
        "UT_0939",
        "Testing state transition current=8 to next=7 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0940(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        7,
        0x4ULL,
        0,
        "UT_0940",
        "Testing state transition current=10 to next=7 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0941(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        7,
        0x4ULL,
        0,
        "UT_0941",
        "Testing state transition current=15 to next=7 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0942(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        7,
        0x4ULL,
        0,
        "UT_0942",
        "Testing state transition current=100 to next=7 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0943(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        7,
        0x4ULL,
        0,
        "UT_0943",
        "Testing state transition current=-100 to next=7 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0944(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        8,
        0x4ULL,
        0,
        "UT_0944",
        "Testing state transition current=-10 to next=8 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0945(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        8,
        0x4ULL,
        0,
        "UT_0945",
        "Testing state transition current=-5 to next=8 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0946(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        8,
        0x4ULL,
        0,
        "UT_0946",
        "Testing state transition current=-1 to next=8 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0947(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        8,
        0x4ULL,
        0,
        "UT_0947",
        "Testing state transition current=0 to next=8 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0948(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        8,
        0x4ULL,
        0,
        "UT_0948",
        "Testing state transition current=1 to next=8 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0949(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        8,
        0x4ULL,
        0,
        "UT_0949",
        "Testing state transition current=2 to next=8 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0950(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        8,
        0x4ULL,
        0,
        "UT_0950",
        "Testing state transition current=3 to next=8 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0951(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        8,
        0x4ULL,
        0,
        "UT_0951",
        "Testing state transition current=4 to next=8 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0952(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        8,
        0x4ULL,
        0,
        "UT_0952",
        "Testing state transition current=5 to next=8 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0953(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        8,
        0x4ULL,
        0,
        "UT_0953",
        "Testing state transition current=6 to next=8 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0954(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        8,
        0x4ULL,
        0,
        "UT_0954",
        "Testing state transition current=7 to next=8 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0955(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        8,
        0x4ULL,
        0,
        "UT_0955",
        "Testing state transition current=8 to next=8 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0956(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        8,
        0x4ULL,
        0,
        "UT_0956",
        "Testing state transition current=10 to next=8 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0957(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        8,
        0x4ULL,
        0,
        "UT_0957",
        "Testing state transition current=15 to next=8 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0958(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        8,
        0x4ULL,
        0,
        "UT_0958",
        "Testing state transition current=100 to next=8 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0959(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        8,
        0x4ULL,
        0,
        "UT_0959",
        "Testing state transition current=-100 to next=8 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0960(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        10,
        0x4ULL,
        0,
        "UT_0960",
        "Testing state transition current=-10 to next=10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0961(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        10,
        0x4ULL,
        0,
        "UT_0961",
        "Testing state transition current=-5 to next=10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0962(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        10,
        0x4ULL,
        0,
        "UT_0962",
        "Testing state transition current=-1 to next=10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0963(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        10,
        0x4ULL,
        0,
        "UT_0963",
        "Testing state transition current=0 to next=10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0964(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        10,
        0x4ULL,
        0,
        "UT_0964",
        "Testing state transition current=1 to next=10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0965(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        10,
        0x4ULL,
        0,
        "UT_0965",
        "Testing state transition current=2 to next=10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0966(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        10,
        0x4ULL,
        0,
        "UT_0966",
        "Testing state transition current=3 to next=10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0967(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        10,
        0x4ULL,
        0,
        "UT_0967",
        "Testing state transition current=4 to next=10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0968(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        10,
        0x4ULL,
        0,
        "UT_0968",
        "Testing state transition current=5 to next=10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0969(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        10,
        0x4ULL,
        0,
        "UT_0969",
        "Testing state transition current=6 to next=10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0970(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        10,
        0x4ULL,
        0,
        "UT_0970",
        "Testing state transition current=7 to next=10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0971(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        10,
        0x4ULL,
        0,
        "UT_0971",
        "Testing state transition current=8 to next=10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0972(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        10,
        0x4ULL,
        0,
        "UT_0972",
        "Testing state transition current=10 to next=10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0973(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        10,
        0x4ULL,
        0,
        "UT_0973",
        "Testing state transition current=15 to next=10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0974(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        10,
        0x4ULL,
        0,
        "UT_0974",
        "Testing state transition current=100 to next=10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0975(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        10,
        0x4ULL,
        0,
        "UT_0975",
        "Testing state transition current=-100 to next=10 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0976(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        15,
        0x4ULL,
        0,
        "UT_0976",
        "Testing state transition current=-10 to next=15 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0977(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        15,
        0x4ULL,
        0,
        "UT_0977",
        "Testing state transition current=-5 to next=15 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0978(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        15,
        0x4ULL,
        0,
        "UT_0978",
        "Testing state transition current=-1 to next=15 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0979(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        15,
        0x4ULL,
        0,
        "UT_0979",
        "Testing state transition current=0 to next=15 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0980(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        15,
        0x4ULL,
        0,
        "UT_0980",
        "Testing state transition current=1 to next=15 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0981(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        15,
        0x4ULL,
        0,
        "UT_0981",
        "Testing state transition current=2 to next=15 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0982(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        15,
        0x4ULL,
        0,
        "UT_0982",
        "Testing state transition current=3 to next=15 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0983(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        15,
        0x4ULL,
        0,
        "UT_0983",
        "Testing state transition current=4 to next=15 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0984(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        15,
        0x4ULL,
        0,
        "UT_0984",
        "Testing state transition current=5 to next=15 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0985(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        15,
        0x4ULL,
        0,
        "UT_0985",
        "Testing state transition current=6 to next=15 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0986(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        15,
        0x4ULL,
        0,
        "UT_0986",
        "Testing state transition current=7 to next=15 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0987(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        15,
        0x4ULL,
        0,
        "UT_0987",
        "Testing state transition current=8 to next=15 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0988(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        15,
        0x4ULL,
        0,
        "UT_0988",
        "Testing state transition current=10 to next=15 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0989(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        15,
        0x4ULL,
        0,
        "UT_0989",
        "Testing state transition current=15 to next=15 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0990(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        15,
        0x4ULL,
        0,
        "UT_0990",
        "Testing state transition current=100 to next=15 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0991(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        15,
        0x4ULL,
        0,
        "UT_0991",
        "Testing state transition current=-100 to next=15 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0992(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        100,
        0x4ULL,
        0,
        "UT_0992",
        "Testing state transition current=-10 to next=100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0993(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        100,
        0x4ULL,
        0,
        "UT_0993",
        "Testing state transition current=-5 to next=100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0994(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        100,
        0x4ULL,
        0,
        "UT_0994",
        "Testing state transition current=-1 to next=100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0995(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        100,
        0x4ULL,
        0,
        "UT_0995",
        "Testing state transition current=0 to next=100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0996(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        100,
        0x4ULL,
        0,
        "UT_0996",
        "Testing state transition current=1 to next=100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0997(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        100,
        0x4ULL,
        0,
        "UT_0997",
        "Testing state transition current=2 to next=100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0998(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        100,
        0x4ULL,
        0,
        "UT_0998",
        "Testing state transition current=3 to next=100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_0999(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        100,
        0x4ULL,
        0,
        "UT_0999",
        "Testing state transition current=4 to next=100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1000(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        100,
        0x4ULL,
        0,
        "UT_1000",
        "Testing state transition current=5 to next=100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1001(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        100,
        0x4ULL,
        0,
        "UT_1001",
        "Testing state transition current=6 to next=100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1002(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        100,
        0x4ULL,
        0,
        "UT_1002",
        "Testing state transition current=7 to next=100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1003(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        100,
        0x4ULL,
        0,
        "UT_1003",
        "Testing state transition current=8 to next=100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1004(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        100,
        0x4ULL,
        0,
        "UT_1004",
        "Testing state transition current=10 to next=100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1005(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        100,
        0x4ULL,
        0,
        "UT_1005",
        "Testing state transition current=15 to next=100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1006(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        100,
        0x4ULL,
        0,
        "UT_1006",
        "Testing state transition current=100 to next=100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1007(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        100,
        0x4ULL,
        0,
        "UT_1007",
        "Testing state transition current=-100 to next=100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1008(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -100,
        0x4ULL,
        0,
        "UT_1008",
        "Testing state transition current=-10 to next=-100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1009(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -100,
        0x4ULL,
        0,
        "UT_1009",
        "Testing state transition current=-5 to next=-100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1010(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -100,
        0x4ULL,
        0,
        "UT_1010",
        "Testing state transition current=-1 to next=-100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1011(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -100,
        0x4ULL,
        0,
        "UT_1011",
        "Testing state transition current=0 to next=-100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1012(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -100,
        0x4ULL,
        0,
        "UT_1012",
        "Testing state transition current=1 to next=-100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1013(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -100,
        0x4ULL,
        0,
        "UT_1013",
        "Testing state transition current=2 to next=-100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1014(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -100,
        0x4ULL,
        0,
        "UT_1014",
        "Testing state transition current=3 to next=-100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1015(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -100,
        0x4ULL,
        0,
        "UT_1015",
        "Testing state transition current=4 to next=-100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1016(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -100,
        0x4ULL,
        0,
        "UT_1016",
        "Testing state transition current=5 to next=-100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1017(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -100,
        0x4ULL,
        0,
        "UT_1017",
        "Testing state transition current=6 to next=-100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1018(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -100,
        0x4ULL,
        0,
        "UT_1018",
        "Testing state transition current=7 to next=-100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1019(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -100,
        0x4ULL,
        0,
        "UT_1019",
        "Testing state transition current=8 to next=-100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1020(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -100,
        0x4ULL,
        0,
        "UT_1020",
        "Testing state transition current=10 to next=-100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1021(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -100,
        0x4ULL,
        0,
        "UT_1021",
        "Testing state transition current=15 to next=-100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1022(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -100,
        0x4ULL,
        0,
        "UT_1022",
        "Testing state transition current=100 to next=-100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1023(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -100,
        0x4ULL,
        0,
        "UT_1023",
        "Testing state transition current=-100 to next=-100 with prereq=0x4",
        stats
    );
}
static void run_unit_test_1024(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -10,
        0x8ULL,
        0,
        "UT_1024",
        "Testing state transition current=-10 to next=-10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1025(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -10,
        0x8ULL,
        0,
        "UT_1025",
        "Testing state transition current=-5 to next=-10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1026(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -10,
        0x8ULL,
        0,
        "UT_1026",
        "Testing state transition current=-1 to next=-10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1027(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -10,
        0x8ULL,
        0,
        "UT_1027",
        "Testing state transition current=0 to next=-10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1028(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -10,
        0x8ULL,
        0,
        "UT_1028",
        "Testing state transition current=1 to next=-10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1029(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -10,
        0x8ULL,
        0,
        "UT_1029",
        "Testing state transition current=2 to next=-10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1030(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -10,
        0x8ULL,
        0,
        "UT_1030",
        "Testing state transition current=3 to next=-10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1031(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -10,
        0x8ULL,
        0,
        "UT_1031",
        "Testing state transition current=4 to next=-10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1032(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -10,
        0x8ULL,
        0,
        "UT_1032",
        "Testing state transition current=5 to next=-10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1033(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -10,
        0x8ULL,
        0,
        "UT_1033",
        "Testing state transition current=6 to next=-10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1034(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -10,
        0x8ULL,
        0,
        "UT_1034",
        "Testing state transition current=7 to next=-10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1035(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -10,
        0x8ULL,
        0,
        "UT_1035",
        "Testing state transition current=8 to next=-10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1036(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -10,
        0x8ULL,
        0,
        "UT_1036",
        "Testing state transition current=10 to next=-10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1037(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -10,
        0x8ULL,
        0,
        "UT_1037",
        "Testing state transition current=15 to next=-10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1038(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -10,
        0x8ULL,
        0,
        "UT_1038",
        "Testing state transition current=100 to next=-10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1039(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -10,
        0x8ULL,
        0,
        "UT_1039",
        "Testing state transition current=-100 to next=-10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1040(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -5,
        0x8ULL,
        0,
        "UT_1040",
        "Testing state transition current=-10 to next=-5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1041(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -5,
        0x8ULL,
        0,
        "UT_1041",
        "Testing state transition current=-5 to next=-5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1042(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -5,
        0x8ULL,
        0,
        "UT_1042",
        "Testing state transition current=-1 to next=-5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1043(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -5,
        0x8ULL,
        0,
        "UT_1043",
        "Testing state transition current=0 to next=-5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1044(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -5,
        0x8ULL,
        0,
        "UT_1044",
        "Testing state transition current=1 to next=-5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1045(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -5,
        0x8ULL,
        0,
        "UT_1045",
        "Testing state transition current=2 to next=-5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1046(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -5,
        0x8ULL,
        0,
        "UT_1046",
        "Testing state transition current=3 to next=-5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1047(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -5,
        0x8ULL,
        0,
        "UT_1047",
        "Testing state transition current=4 to next=-5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1048(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -5,
        0x8ULL,
        0,
        "UT_1048",
        "Testing state transition current=5 to next=-5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1049(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -5,
        0x8ULL,
        0,
        "UT_1049",
        "Testing state transition current=6 to next=-5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1050(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -5,
        0x8ULL,
        0,
        "UT_1050",
        "Testing state transition current=7 to next=-5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1051(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -5,
        0x8ULL,
        0,
        "UT_1051",
        "Testing state transition current=8 to next=-5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1052(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -5,
        0x8ULL,
        0,
        "UT_1052",
        "Testing state transition current=10 to next=-5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1053(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -5,
        0x8ULL,
        0,
        "UT_1053",
        "Testing state transition current=15 to next=-5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1054(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -5,
        0x8ULL,
        0,
        "UT_1054",
        "Testing state transition current=100 to next=-5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1055(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -5,
        0x8ULL,
        0,
        "UT_1055",
        "Testing state transition current=-100 to next=-5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1056(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -1,
        0x8ULL,
        0,
        "UT_1056",
        "Testing state transition current=-10 to next=-1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1057(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -1,
        0x8ULL,
        0,
        "UT_1057",
        "Testing state transition current=-5 to next=-1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1058(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -1,
        0x8ULL,
        0,
        "UT_1058",
        "Testing state transition current=-1 to next=-1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1059(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -1,
        0x8ULL,
        0,
        "UT_1059",
        "Testing state transition current=0 to next=-1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1060(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -1,
        0x8ULL,
        0,
        "UT_1060",
        "Testing state transition current=1 to next=-1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1061(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -1,
        0x8ULL,
        0,
        "UT_1061",
        "Testing state transition current=2 to next=-1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1062(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -1,
        0x8ULL,
        0,
        "UT_1062",
        "Testing state transition current=3 to next=-1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1063(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -1,
        0x8ULL,
        0,
        "UT_1063",
        "Testing state transition current=4 to next=-1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1064(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -1,
        0x8ULL,
        0,
        "UT_1064",
        "Testing state transition current=5 to next=-1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1065(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -1,
        0x8ULL,
        0,
        "UT_1065",
        "Testing state transition current=6 to next=-1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1066(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -1,
        0x8ULL,
        0,
        "UT_1066",
        "Testing state transition current=7 to next=-1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1067(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -1,
        0x8ULL,
        0,
        "UT_1067",
        "Testing state transition current=8 to next=-1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1068(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -1,
        0x8ULL,
        0,
        "UT_1068",
        "Testing state transition current=10 to next=-1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1069(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -1,
        0x8ULL,
        0,
        "UT_1069",
        "Testing state transition current=15 to next=-1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1070(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -1,
        0x8ULL,
        0,
        "UT_1070",
        "Testing state transition current=100 to next=-1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1071(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -1,
        0x8ULL,
        0,
        "UT_1071",
        "Testing state transition current=-100 to next=-1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1072(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        0,
        0x8ULL,
        0,
        "UT_1072",
        "Testing state transition current=-10 to next=0 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1073(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        0,
        0x8ULL,
        0,
        "UT_1073",
        "Testing state transition current=-5 to next=0 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1074(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        0,
        0x8ULL,
        0,
        "UT_1074",
        "Testing state transition current=-1 to next=0 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1075(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        0,
        0x8ULL,
        1,
        "UT_1075",
        "Testing state transition current=0 to next=0 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1076(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        0,
        0x8ULL,
        1,
        "UT_1076",
        "Testing state transition current=1 to next=0 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1077(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        0,
        0x8ULL,
        1,
        "UT_1077",
        "Testing state transition current=2 to next=0 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1078(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        0,
        0x8ULL,
        1,
        "UT_1078",
        "Testing state transition current=3 to next=0 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1079(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        0,
        0x8ULL,
        1,
        "UT_1079",
        "Testing state transition current=4 to next=0 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1080(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        0,
        0x8ULL,
        1,
        "UT_1080",
        "Testing state transition current=5 to next=0 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1081(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        0,
        0x8ULL,
        1,
        "UT_1081",
        "Testing state transition current=6 to next=0 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1082(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        0,
        0x8ULL,
        1,
        "UT_1082",
        "Testing state transition current=7 to next=0 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1083(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        0,
        0x8ULL,
        0,
        "UT_1083",
        "Testing state transition current=8 to next=0 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1084(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        0,
        0x8ULL,
        0,
        "UT_1084",
        "Testing state transition current=10 to next=0 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1085(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        0,
        0x8ULL,
        0,
        "UT_1085",
        "Testing state transition current=15 to next=0 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1086(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        0,
        0x8ULL,
        0,
        "UT_1086",
        "Testing state transition current=100 to next=0 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1087(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        0,
        0x8ULL,
        0,
        "UT_1087",
        "Testing state transition current=-100 to next=0 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1088(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        1,
        0x8ULL,
        0,
        "UT_1088",
        "Testing state transition current=-10 to next=1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1089(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        1,
        0x8ULL,
        0,
        "UT_1089",
        "Testing state transition current=-5 to next=1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1090(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        1,
        0x8ULL,
        0,
        "UT_1090",
        "Testing state transition current=-1 to next=1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1091(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        1,
        0x8ULL,
        0,
        "UT_1091",
        "Testing state transition current=0 to next=1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1092(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        1,
        0x8ULL,
        0,
        "UT_1092",
        "Testing state transition current=1 to next=1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1093(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        1,
        0x8ULL,
        0,
        "UT_1093",
        "Testing state transition current=2 to next=1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1094(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        1,
        0x8ULL,
        0,
        "UT_1094",
        "Testing state transition current=3 to next=1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1095(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        1,
        0x8ULL,
        0,
        "UT_1095",
        "Testing state transition current=4 to next=1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1096(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        1,
        0x8ULL,
        0,
        "UT_1096",
        "Testing state transition current=5 to next=1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1097(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        1,
        0x8ULL,
        0,
        "UT_1097",
        "Testing state transition current=6 to next=1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1098(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        1,
        0x8ULL,
        0,
        "UT_1098",
        "Testing state transition current=7 to next=1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1099(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        1,
        0x8ULL,
        0,
        "UT_1099",
        "Testing state transition current=8 to next=1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1100(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        1,
        0x8ULL,
        0,
        "UT_1100",
        "Testing state transition current=10 to next=1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1101(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        1,
        0x8ULL,
        0,
        "UT_1101",
        "Testing state transition current=15 to next=1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1102(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        1,
        0x8ULL,
        0,
        "UT_1102",
        "Testing state transition current=100 to next=1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1103(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        1,
        0x8ULL,
        0,
        "UT_1103",
        "Testing state transition current=-100 to next=1 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1104(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        2,
        0x8ULL,
        0,
        "UT_1104",
        "Testing state transition current=-10 to next=2 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1105(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        2,
        0x8ULL,
        0,
        "UT_1105",
        "Testing state transition current=-5 to next=2 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1106(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        2,
        0x8ULL,
        0,
        "UT_1106",
        "Testing state transition current=-1 to next=2 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1107(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        2,
        0x8ULL,
        0,
        "UT_1107",
        "Testing state transition current=0 to next=2 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1108(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        2,
        0x8ULL,
        0,
        "UT_1108",
        "Testing state transition current=1 to next=2 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1109(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        2,
        0x8ULL,
        0,
        "UT_1109",
        "Testing state transition current=2 to next=2 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1110(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        2,
        0x8ULL,
        0,
        "UT_1110",
        "Testing state transition current=3 to next=2 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1111(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        2,
        0x8ULL,
        0,
        "UT_1111",
        "Testing state transition current=4 to next=2 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1112(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        2,
        0x8ULL,
        0,
        "UT_1112",
        "Testing state transition current=5 to next=2 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1113(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        2,
        0x8ULL,
        0,
        "UT_1113",
        "Testing state transition current=6 to next=2 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1114(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        2,
        0x8ULL,
        0,
        "UT_1114",
        "Testing state transition current=7 to next=2 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1115(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        2,
        0x8ULL,
        0,
        "UT_1115",
        "Testing state transition current=8 to next=2 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1116(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        2,
        0x8ULL,
        0,
        "UT_1116",
        "Testing state transition current=10 to next=2 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1117(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        2,
        0x8ULL,
        0,
        "UT_1117",
        "Testing state transition current=15 to next=2 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1118(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        2,
        0x8ULL,
        0,
        "UT_1118",
        "Testing state transition current=100 to next=2 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1119(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        2,
        0x8ULL,
        0,
        "UT_1119",
        "Testing state transition current=-100 to next=2 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1120(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        3,
        0x8ULL,
        0,
        "UT_1120",
        "Testing state transition current=-10 to next=3 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1121(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        3,
        0x8ULL,
        0,
        "UT_1121",
        "Testing state transition current=-5 to next=3 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1122(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        3,
        0x8ULL,
        0,
        "UT_1122",
        "Testing state transition current=-1 to next=3 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1123(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        3,
        0x8ULL,
        0,
        "UT_1123",
        "Testing state transition current=0 to next=3 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1124(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        3,
        0x8ULL,
        0,
        "UT_1124",
        "Testing state transition current=1 to next=3 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1125(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        3,
        0x8ULL,
        0,
        "UT_1125",
        "Testing state transition current=2 to next=3 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1126(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        3,
        0x8ULL,
        0,
        "UT_1126",
        "Testing state transition current=3 to next=3 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1127(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        3,
        0x8ULL,
        0,
        "UT_1127",
        "Testing state transition current=4 to next=3 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1128(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        3,
        0x8ULL,
        0,
        "UT_1128",
        "Testing state transition current=5 to next=3 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1129(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        3,
        0x8ULL,
        0,
        "UT_1129",
        "Testing state transition current=6 to next=3 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1130(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        3,
        0x8ULL,
        0,
        "UT_1130",
        "Testing state transition current=7 to next=3 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1131(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        3,
        0x8ULL,
        0,
        "UT_1131",
        "Testing state transition current=8 to next=3 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1132(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        3,
        0x8ULL,
        0,
        "UT_1132",
        "Testing state transition current=10 to next=3 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1133(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        3,
        0x8ULL,
        0,
        "UT_1133",
        "Testing state transition current=15 to next=3 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1134(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        3,
        0x8ULL,
        0,
        "UT_1134",
        "Testing state transition current=100 to next=3 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1135(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        3,
        0x8ULL,
        0,
        "UT_1135",
        "Testing state transition current=-100 to next=3 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1136(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        4,
        0x8ULL,
        0,
        "UT_1136",
        "Testing state transition current=-10 to next=4 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1137(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        4,
        0x8ULL,
        0,
        "UT_1137",
        "Testing state transition current=-5 to next=4 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1138(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        4,
        0x8ULL,
        0,
        "UT_1138",
        "Testing state transition current=-1 to next=4 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1139(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        4,
        0x8ULL,
        0,
        "UT_1139",
        "Testing state transition current=0 to next=4 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1140(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        4,
        0x8ULL,
        0,
        "UT_1140",
        "Testing state transition current=1 to next=4 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1141(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        4,
        0x8ULL,
        0,
        "UT_1141",
        "Testing state transition current=2 to next=4 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1142(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        4,
        0x8ULL,
        1,
        "UT_1142",
        "Testing state transition current=3 to next=4 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1143(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        4,
        0x8ULL,
        0,
        "UT_1143",
        "Testing state transition current=4 to next=4 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1144(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        4,
        0x8ULL,
        0,
        "UT_1144",
        "Testing state transition current=5 to next=4 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1145(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        4,
        0x8ULL,
        0,
        "UT_1145",
        "Testing state transition current=6 to next=4 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1146(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        4,
        0x8ULL,
        0,
        "UT_1146",
        "Testing state transition current=7 to next=4 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1147(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        4,
        0x8ULL,
        0,
        "UT_1147",
        "Testing state transition current=8 to next=4 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1148(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        4,
        0x8ULL,
        0,
        "UT_1148",
        "Testing state transition current=10 to next=4 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1149(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        4,
        0x8ULL,
        0,
        "UT_1149",
        "Testing state transition current=15 to next=4 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1150(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        4,
        0x8ULL,
        0,
        "UT_1150",
        "Testing state transition current=100 to next=4 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1151(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        4,
        0x8ULL,
        0,
        "UT_1151",
        "Testing state transition current=-100 to next=4 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1152(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        5,
        0x8ULL,
        0,
        "UT_1152",
        "Testing state transition current=-10 to next=5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1153(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        5,
        0x8ULL,
        0,
        "UT_1153",
        "Testing state transition current=-5 to next=5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1154(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        5,
        0x8ULL,
        0,
        "UT_1154",
        "Testing state transition current=-1 to next=5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1155(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        5,
        0x8ULL,
        0,
        "UT_1155",
        "Testing state transition current=0 to next=5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1156(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        5,
        0x8ULL,
        0,
        "UT_1156",
        "Testing state transition current=1 to next=5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1157(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        5,
        0x8ULL,
        0,
        "UT_1157",
        "Testing state transition current=2 to next=5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1158(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        5,
        0x8ULL,
        0,
        "UT_1158",
        "Testing state transition current=3 to next=5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1159(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        5,
        0x8ULL,
        0,
        "UT_1159",
        "Testing state transition current=4 to next=5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1160(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        5,
        0x8ULL,
        0,
        "UT_1160",
        "Testing state transition current=5 to next=5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1161(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        5,
        0x8ULL,
        0,
        "UT_1161",
        "Testing state transition current=6 to next=5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1162(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        5,
        0x8ULL,
        0,
        "UT_1162",
        "Testing state transition current=7 to next=5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1163(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        5,
        0x8ULL,
        0,
        "UT_1163",
        "Testing state transition current=8 to next=5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1164(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        5,
        0x8ULL,
        0,
        "UT_1164",
        "Testing state transition current=10 to next=5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1165(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        5,
        0x8ULL,
        0,
        "UT_1165",
        "Testing state transition current=15 to next=5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1166(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        5,
        0x8ULL,
        0,
        "UT_1166",
        "Testing state transition current=100 to next=5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1167(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        5,
        0x8ULL,
        0,
        "UT_1167",
        "Testing state transition current=-100 to next=5 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1168(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        6,
        0x8ULL,
        0,
        "UT_1168",
        "Testing state transition current=-10 to next=6 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1169(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        6,
        0x8ULL,
        0,
        "UT_1169",
        "Testing state transition current=-5 to next=6 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1170(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        6,
        0x8ULL,
        0,
        "UT_1170",
        "Testing state transition current=-1 to next=6 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1171(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        6,
        0x8ULL,
        0,
        "UT_1171",
        "Testing state transition current=0 to next=6 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1172(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        6,
        0x8ULL,
        0,
        "UT_1172",
        "Testing state transition current=1 to next=6 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1173(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        6,
        0x8ULL,
        0,
        "UT_1173",
        "Testing state transition current=2 to next=6 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1174(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        6,
        0x8ULL,
        0,
        "UT_1174",
        "Testing state transition current=3 to next=6 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1175(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        6,
        0x8ULL,
        0,
        "UT_1175",
        "Testing state transition current=4 to next=6 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1176(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        6,
        0x8ULL,
        0,
        "UT_1176",
        "Testing state transition current=5 to next=6 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1177(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        6,
        0x8ULL,
        0,
        "UT_1177",
        "Testing state transition current=6 to next=6 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1178(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        6,
        0x8ULL,
        0,
        "UT_1178",
        "Testing state transition current=7 to next=6 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1179(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        6,
        0x8ULL,
        0,
        "UT_1179",
        "Testing state transition current=8 to next=6 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1180(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        6,
        0x8ULL,
        0,
        "UT_1180",
        "Testing state transition current=10 to next=6 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1181(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        6,
        0x8ULL,
        0,
        "UT_1181",
        "Testing state transition current=15 to next=6 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1182(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        6,
        0x8ULL,
        0,
        "UT_1182",
        "Testing state transition current=100 to next=6 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1183(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        6,
        0x8ULL,
        0,
        "UT_1183",
        "Testing state transition current=-100 to next=6 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1184(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        7,
        0x8ULL,
        0,
        "UT_1184",
        "Testing state transition current=-10 to next=7 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1185(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        7,
        0x8ULL,
        0,
        "UT_1185",
        "Testing state transition current=-5 to next=7 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1186(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        7,
        0x8ULL,
        0,
        "UT_1186",
        "Testing state transition current=-1 to next=7 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1187(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        7,
        0x8ULL,
        0,
        "UT_1187",
        "Testing state transition current=0 to next=7 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1188(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        7,
        0x8ULL,
        0,
        "UT_1188",
        "Testing state transition current=1 to next=7 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1189(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        7,
        0x8ULL,
        0,
        "UT_1189",
        "Testing state transition current=2 to next=7 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1190(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        7,
        0x8ULL,
        0,
        "UT_1190",
        "Testing state transition current=3 to next=7 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1191(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        7,
        0x8ULL,
        0,
        "UT_1191",
        "Testing state transition current=4 to next=7 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1192(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        7,
        0x8ULL,
        0,
        "UT_1192",
        "Testing state transition current=5 to next=7 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1193(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        7,
        0x8ULL,
        0,
        "UT_1193",
        "Testing state transition current=6 to next=7 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1194(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        7,
        0x8ULL,
        0,
        "UT_1194",
        "Testing state transition current=7 to next=7 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1195(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        7,
        0x8ULL,
        0,
        "UT_1195",
        "Testing state transition current=8 to next=7 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1196(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        7,
        0x8ULL,
        0,
        "UT_1196",
        "Testing state transition current=10 to next=7 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1197(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        7,
        0x8ULL,
        0,
        "UT_1197",
        "Testing state transition current=15 to next=7 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1198(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        7,
        0x8ULL,
        0,
        "UT_1198",
        "Testing state transition current=100 to next=7 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1199(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        7,
        0x8ULL,
        0,
        "UT_1199",
        "Testing state transition current=-100 to next=7 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1200(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        8,
        0x8ULL,
        0,
        "UT_1200",
        "Testing state transition current=-10 to next=8 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1201(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        8,
        0x8ULL,
        0,
        "UT_1201",
        "Testing state transition current=-5 to next=8 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1202(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        8,
        0x8ULL,
        0,
        "UT_1202",
        "Testing state transition current=-1 to next=8 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1203(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        8,
        0x8ULL,
        0,
        "UT_1203",
        "Testing state transition current=0 to next=8 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1204(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        8,
        0x8ULL,
        0,
        "UT_1204",
        "Testing state transition current=1 to next=8 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1205(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        8,
        0x8ULL,
        0,
        "UT_1205",
        "Testing state transition current=2 to next=8 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1206(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        8,
        0x8ULL,
        0,
        "UT_1206",
        "Testing state transition current=3 to next=8 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1207(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        8,
        0x8ULL,
        0,
        "UT_1207",
        "Testing state transition current=4 to next=8 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1208(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        8,
        0x8ULL,
        0,
        "UT_1208",
        "Testing state transition current=5 to next=8 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1209(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        8,
        0x8ULL,
        0,
        "UT_1209",
        "Testing state transition current=6 to next=8 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1210(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        8,
        0x8ULL,
        0,
        "UT_1210",
        "Testing state transition current=7 to next=8 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1211(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        8,
        0x8ULL,
        0,
        "UT_1211",
        "Testing state transition current=8 to next=8 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1212(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        8,
        0x8ULL,
        0,
        "UT_1212",
        "Testing state transition current=10 to next=8 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1213(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        8,
        0x8ULL,
        0,
        "UT_1213",
        "Testing state transition current=15 to next=8 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1214(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        8,
        0x8ULL,
        0,
        "UT_1214",
        "Testing state transition current=100 to next=8 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1215(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        8,
        0x8ULL,
        0,
        "UT_1215",
        "Testing state transition current=-100 to next=8 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1216(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        10,
        0x8ULL,
        0,
        "UT_1216",
        "Testing state transition current=-10 to next=10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1217(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        10,
        0x8ULL,
        0,
        "UT_1217",
        "Testing state transition current=-5 to next=10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1218(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        10,
        0x8ULL,
        0,
        "UT_1218",
        "Testing state transition current=-1 to next=10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1219(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        10,
        0x8ULL,
        0,
        "UT_1219",
        "Testing state transition current=0 to next=10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1220(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        10,
        0x8ULL,
        0,
        "UT_1220",
        "Testing state transition current=1 to next=10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1221(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        10,
        0x8ULL,
        0,
        "UT_1221",
        "Testing state transition current=2 to next=10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1222(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        10,
        0x8ULL,
        0,
        "UT_1222",
        "Testing state transition current=3 to next=10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1223(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        10,
        0x8ULL,
        0,
        "UT_1223",
        "Testing state transition current=4 to next=10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1224(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        10,
        0x8ULL,
        0,
        "UT_1224",
        "Testing state transition current=5 to next=10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1225(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        10,
        0x8ULL,
        0,
        "UT_1225",
        "Testing state transition current=6 to next=10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1226(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        10,
        0x8ULL,
        0,
        "UT_1226",
        "Testing state transition current=7 to next=10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1227(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        10,
        0x8ULL,
        0,
        "UT_1227",
        "Testing state transition current=8 to next=10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1228(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        10,
        0x8ULL,
        0,
        "UT_1228",
        "Testing state transition current=10 to next=10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1229(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        10,
        0x8ULL,
        0,
        "UT_1229",
        "Testing state transition current=15 to next=10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1230(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        10,
        0x8ULL,
        0,
        "UT_1230",
        "Testing state transition current=100 to next=10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1231(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        10,
        0x8ULL,
        0,
        "UT_1231",
        "Testing state transition current=-100 to next=10 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1232(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        15,
        0x8ULL,
        0,
        "UT_1232",
        "Testing state transition current=-10 to next=15 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1233(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        15,
        0x8ULL,
        0,
        "UT_1233",
        "Testing state transition current=-5 to next=15 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1234(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        15,
        0x8ULL,
        0,
        "UT_1234",
        "Testing state transition current=-1 to next=15 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1235(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        15,
        0x8ULL,
        0,
        "UT_1235",
        "Testing state transition current=0 to next=15 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1236(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        15,
        0x8ULL,
        0,
        "UT_1236",
        "Testing state transition current=1 to next=15 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1237(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        15,
        0x8ULL,
        0,
        "UT_1237",
        "Testing state transition current=2 to next=15 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1238(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        15,
        0x8ULL,
        0,
        "UT_1238",
        "Testing state transition current=3 to next=15 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1239(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        15,
        0x8ULL,
        0,
        "UT_1239",
        "Testing state transition current=4 to next=15 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1240(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        15,
        0x8ULL,
        0,
        "UT_1240",
        "Testing state transition current=5 to next=15 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1241(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        15,
        0x8ULL,
        0,
        "UT_1241",
        "Testing state transition current=6 to next=15 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1242(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        15,
        0x8ULL,
        0,
        "UT_1242",
        "Testing state transition current=7 to next=15 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1243(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        15,
        0x8ULL,
        0,
        "UT_1243",
        "Testing state transition current=8 to next=15 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1244(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        15,
        0x8ULL,
        0,
        "UT_1244",
        "Testing state transition current=10 to next=15 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1245(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        15,
        0x8ULL,
        0,
        "UT_1245",
        "Testing state transition current=15 to next=15 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1246(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        15,
        0x8ULL,
        0,
        "UT_1246",
        "Testing state transition current=100 to next=15 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1247(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        15,
        0x8ULL,
        0,
        "UT_1247",
        "Testing state transition current=-100 to next=15 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1248(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        100,
        0x8ULL,
        0,
        "UT_1248",
        "Testing state transition current=-10 to next=100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1249(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        100,
        0x8ULL,
        0,
        "UT_1249",
        "Testing state transition current=-5 to next=100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1250(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        100,
        0x8ULL,
        0,
        "UT_1250",
        "Testing state transition current=-1 to next=100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1251(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        100,
        0x8ULL,
        0,
        "UT_1251",
        "Testing state transition current=0 to next=100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1252(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        100,
        0x8ULL,
        0,
        "UT_1252",
        "Testing state transition current=1 to next=100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1253(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        100,
        0x8ULL,
        0,
        "UT_1253",
        "Testing state transition current=2 to next=100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1254(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        100,
        0x8ULL,
        0,
        "UT_1254",
        "Testing state transition current=3 to next=100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1255(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        100,
        0x8ULL,
        0,
        "UT_1255",
        "Testing state transition current=4 to next=100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1256(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        100,
        0x8ULL,
        0,
        "UT_1256",
        "Testing state transition current=5 to next=100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1257(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        100,
        0x8ULL,
        0,
        "UT_1257",
        "Testing state transition current=6 to next=100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1258(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        100,
        0x8ULL,
        0,
        "UT_1258",
        "Testing state transition current=7 to next=100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1259(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        100,
        0x8ULL,
        0,
        "UT_1259",
        "Testing state transition current=8 to next=100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1260(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        100,
        0x8ULL,
        0,
        "UT_1260",
        "Testing state transition current=10 to next=100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1261(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        100,
        0x8ULL,
        0,
        "UT_1261",
        "Testing state transition current=15 to next=100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1262(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        100,
        0x8ULL,
        0,
        "UT_1262",
        "Testing state transition current=100 to next=100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1263(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        100,
        0x8ULL,
        0,
        "UT_1263",
        "Testing state transition current=-100 to next=100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1264(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -100,
        0x8ULL,
        0,
        "UT_1264",
        "Testing state transition current=-10 to next=-100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1265(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -100,
        0x8ULL,
        0,
        "UT_1265",
        "Testing state transition current=-5 to next=-100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1266(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -100,
        0x8ULL,
        0,
        "UT_1266",
        "Testing state transition current=-1 to next=-100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1267(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -100,
        0x8ULL,
        0,
        "UT_1267",
        "Testing state transition current=0 to next=-100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1268(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -100,
        0x8ULL,
        0,
        "UT_1268",
        "Testing state transition current=1 to next=-100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1269(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -100,
        0x8ULL,
        0,
        "UT_1269",
        "Testing state transition current=2 to next=-100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1270(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -100,
        0x8ULL,
        0,
        "UT_1270",
        "Testing state transition current=3 to next=-100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1271(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -100,
        0x8ULL,
        0,
        "UT_1271",
        "Testing state transition current=4 to next=-100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1272(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -100,
        0x8ULL,
        0,
        "UT_1272",
        "Testing state transition current=5 to next=-100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1273(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -100,
        0x8ULL,
        0,
        "UT_1273",
        "Testing state transition current=6 to next=-100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1274(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -100,
        0x8ULL,
        0,
        "UT_1274",
        "Testing state transition current=7 to next=-100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1275(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -100,
        0x8ULL,
        0,
        "UT_1275",
        "Testing state transition current=8 to next=-100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1276(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -100,
        0x8ULL,
        0,
        "UT_1276",
        "Testing state transition current=10 to next=-100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1277(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -100,
        0x8ULL,
        0,
        "UT_1277",
        "Testing state transition current=15 to next=-100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1278(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -100,
        0x8ULL,
        0,
        "UT_1278",
        "Testing state transition current=100 to next=-100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1279(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -100,
        0x8ULL,
        0,
        "UT_1279",
        "Testing state transition current=-100 to next=-100 with prereq=0x8",
        stats
    );
}
static void run_unit_test_1280(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -10,
        0x10ULL,
        0,
        "UT_1280",
        "Testing state transition current=-10 to next=-10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1281(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -10,
        0x10ULL,
        0,
        "UT_1281",
        "Testing state transition current=-5 to next=-10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1282(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -10,
        0x10ULL,
        0,
        "UT_1282",
        "Testing state transition current=-1 to next=-10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1283(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -10,
        0x10ULL,
        0,
        "UT_1283",
        "Testing state transition current=0 to next=-10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1284(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -10,
        0x10ULL,
        0,
        "UT_1284",
        "Testing state transition current=1 to next=-10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1285(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -10,
        0x10ULL,
        0,
        "UT_1285",
        "Testing state transition current=2 to next=-10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1286(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -10,
        0x10ULL,
        0,
        "UT_1286",
        "Testing state transition current=3 to next=-10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1287(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -10,
        0x10ULL,
        0,
        "UT_1287",
        "Testing state transition current=4 to next=-10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1288(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -10,
        0x10ULL,
        0,
        "UT_1288",
        "Testing state transition current=5 to next=-10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1289(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -10,
        0x10ULL,
        0,
        "UT_1289",
        "Testing state transition current=6 to next=-10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1290(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -10,
        0x10ULL,
        0,
        "UT_1290",
        "Testing state transition current=7 to next=-10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1291(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -10,
        0x10ULL,
        0,
        "UT_1291",
        "Testing state transition current=8 to next=-10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1292(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -10,
        0x10ULL,
        0,
        "UT_1292",
        "Testing state transition current=10 to next=-10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1293(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -10,
        0x10ULL,
        0,
        "UT_1293",
        "Testing state transition current=15 to next=-10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1294(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -10,
        0x10ULL,
        0,
        "UT_1294",
        "Testing state transition current=100 to next=-10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1295(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -10,
        0x10ULL,
        0,
        "UT_1295",
        "Testing state transition current=-100 to next=-10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1296(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -5,
        0x10ULL,
        0,
        "UT_1296",
        "Testing state transition current=-10 to next=-5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1297(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -5,
        0x10ULL,
        0,
        "UT_1297",
        "Testing state transition current=-5 to next=-5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1298(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -5,
        0x10ULL,
        0,
        "UT_1298",
        "Testing state transition current=-1 to next=-5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1299(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -5,
        0x10ULL,
        0,
        "UT_1299",
        "Testing state transition current=0 to next=-5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1300(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -5,
        0x10ULL,
        0,
        "UT_1300",
        "Testing state transition current=1 to next=-5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1301(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -5,
        0x10ULL,
        0,
        "UT_1301",
        "Testing state transition current=2 to next=-5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1302(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -5,
        0x10ULL,
        0,
        "UT_1302",
        "Testing state transition current=3 to next=-5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1303(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -5,
        0x10ULL,
        0,
        "UT_1303",
        "Testing state transition current=4 to next=-5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1304(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -5,
        0x10ULL,
        0,
        "UT_1304",
        "Testing state transition current=5 to next=-5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1305(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -5,
        0x10ULL,
        0,
        "UT_1305",
        "Testing state transition current=6 to next=-5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1306(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -5,
        0x10ULL,
        0,
        "UT_1306",
        "Testing state transition current=7 to next=-5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1307(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -5,
        0x10ULL,
        0,
        "UT_1307",
        "Testing state transition current=8 to next=-5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1308(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -5,
        0x10ULL,
        0,
        "UT_1308",
        "Testing state transition current=10 to next=-5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1309(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -5,
        0x10ULL,
        0,
        "UT_1309",
        "Testing state transition current=15 to next=-5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1310(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -5,
        0x10ULL,
        0,
        "UT_1310",
        "Testing state transition current=100 to next=-5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1311(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -5,
        0x10ULL,
        0,
        "UT_1311",
        "Testing state transition current=-100 to next=-5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1312(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -1,
        0x10ULL,
        0,
        "UT_1312",
        "Testing state transition current=-10 to next=-1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1313(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -1,
        0x10ULL,
        0,
        "UT_1313",
        "Testing state transition current=-5 to next=-1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1314(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -1,
        0x10ULL,
        0,
        "UT_1314",
        "Testing state transition current=-1 to next=-1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1315(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -1,
        0x10ULL,
        0,
        "UT_1315",
        "Testing state transition current=0 to next=-1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1316(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -1,
        0x10ULL,
        0,
        "UT_1316",
        "Testing state transition current=1 to next=-1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1317(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -1,
        0x10ULL,
        0,
        "UT_1317",
        "Testing state transition current=2 to next=-1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1318(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -1,
        0x10ULL,
        0,
        "UT_1318",
        "Testing state transition current=3 to next=-1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1319(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -1,
        0x10ULL,
        0,
        "UT_1319",
        "Testing state transition current=4 to next=-1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1320(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -1,
        0x10ULL,
        0,
        "UT_1320",
        "Testing state transition current=5 to next=-1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1321(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -1,
        0x10ULL,
        0,
        "UT_1321",
        "Testing state transition current=6 to next=-1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1322(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -1,
        0x10ULL,
        0,
        "UT_1322",
        "Testing state transition current=7 to next=-1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1323(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -1,
        0x10ULL,
        0,
        "UT_1323",
        "Testing state transition current=8 to next=-1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1324(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -1,
        0x10ULL,
        0,
        "UT_1324",
        "Testing state transition current=10 to next=-1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1325(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -1,
        0x10ULL,
        0,
        "UT_1325",
        "Testing state transition current=15 to next=-1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1326(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -1,
        0x10ULL,
        0,
        "UT_1326",
        "Testing state transition current=100 to next=-1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1327(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -1,
        0x10ULL,
        0,
        "UT_1327",
        "Testing state transition current=-100 to next=-1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1328(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        0,
        0x10ULL,
        0,
        "UT_1328",
        "Testing state transition current=-10 to next=0 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1329(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        0,
        0x10ULL,
        0,
        "UT_1329",
        "Testing state transition current=-5 to next=0 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1330(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        0,
        0x10ULL,
        0,
        "UT_1330",
        "Testing state transition current=-1 to next=0 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1331(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        0,
        0x10ULL,
        1,
        "UT_1331",
        "Testing state transition current=0 to next=0 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1332(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        0,
        0x10ULL,
        1,
        "UT_1332",
        "Testing state transition current=1 to next=0 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1333(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        0,
        0x10ULL,
        1,
        "UT_1333",
        "Testing state transition current=2 to next=0 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1334(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        0,
        0x10ULL,
        1,
        "UT_1334",
        "Testing state transition current=3 to next=0 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1335(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        0,
        0x10ULL,
        1,
        "UT_1335",
        "Testing state transition current=4 to next=0 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1336(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        0,
        0x10ULL,
        1,
        "UT_1336",
        "Testing state transition current=5 to next=0 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1337(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        0,
        0x10ULL,
        1,
        "UT_1337",
        "Testing state transition current=6 to next=0 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1338(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        0,
        0x10ULL,
        1,
        "UT_1338",
        "Testing state transition current=7 to next=0 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1339(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        0,
        0x10ULL,
        0,
        "UT_1339",
        "Testing state transition current=8 to next=0 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1340(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        0,
        0x10ULL,
        0,
        "UT_1340",
        "Testing state transition current=10 to next=0 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1341(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        0,
        0x10ULL,
        0,
        "UT_1341",
        "Testing state transition current=15 to next=0 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1342(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        0,
        0x10ULL,
        0,
        "UT_1342",
        "Testing state transition current=100 to next=0 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1343(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        0,
        0x10ULL,
        0,
        "UT_1343",
        "Testing state transition current=-100 to next=0 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1344(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        1,
        0x10ULL,
        0,
        "UT_1344",
        "Testing state transition current=-10 to next=1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1345(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        1,
        0x10ULL,
        0,
        "UT_1345",
        "Testing state transition current=-5 to next=1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1346(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        1,
        0x10ULL,
        0,
        "UT_1346",
        "Testing state transition current=-1 to next=1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1347(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        1,
        0x10ULL,
        0,
        "UT_1347",
        "Testing state transition current=0 to next=1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1348(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        1,
        0x10ULL,
        0,
        "UT_1348",
        "Testing state transition current=1 to next=1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1349(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        1,
        0x10ULL,
        0,
        "UT_1349",
        "Testing state transition current=2 to next=1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1350(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        1,
        0x10ULL,
        0,
        "UT_1350",
        "Testing state transition current=3 to next=1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1351(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        1,
        0x10ULL,
        0,
        "UT_1351",
        "Testing state transition current=4 to next=1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1352(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        1,
        0x10ULL,
        0,
        "UT_1352",
        "Testing state transition current=5 to next=1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1353(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        1,
        0x10ULL,
        0,
        "UT_1353",
        "Testing state transition current=6 to next=1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1354(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        1,
        0x10ULL,
        0,
        "UT_1354",
        "Testing state transition current=7 to next=1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1355(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        1,
        0x10ULL,
        0,
        "UT_1355",
        "Testing state transition current=8 to next=1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1356(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        1,
        0x10ULL,
        0,
        "UT_1356",
        "Testing state transition current=10 to next=1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1357(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        1,
        0x10ULL,
        0,
        "UT_1357",
        "Testing state transition current=15 to next=1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1358(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        1,
        0x10ULL,
        0,
        "UT_1358",
        "Testing state transition current=100 to next=1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1359(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        1,
        0x10ULL,
        0,
        "UT_1359",
        "Testing state transition current=-100 to next=1 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1360(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        2,
        0x10ULL,
        0,
        "UT_1360",
        "Testing state transition current=-10 to next=2 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1361(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        2,
        0x10ULL,
        0,
        "UT_1361",
        "Testing state transition current=-5 to next=2 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1362(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        2,
        0x10ULL,
        0,
        "UT_1362",
        "Testing state transition current=-1 to next=2 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1363(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        2,
        0x10ULL,
        0,
        "UT_1363",
        "Testing state transition current=0 to next=2 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1364(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        2,
        0x10ULL,
        0,
        "UT_1364",
        "Testing state transition current=1 to next=2 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1365(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        2,
        0x10ULL,
        0,
        "UT_1365",
        "Testing state transition current=2 to next=2 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1366(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        2,
        0x10ULL,
        0,
        "UT_1366",
        "Testing state transition current=3 to next=2 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1367(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        2,
        0x10ULL,
        0,
        "UT_1367",
        "Testing state transition current=4 to next=2 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1368(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        2,
        0x10ULL,
        0,
        "UT_1368",
        "Testing state transition current=5 to next=2 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1369(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        2,
        0x10ULL,
        0,
        "UT_1369",
        "Testing state transition current=6 to next=2 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1370(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        2,
        0x10ULL,
        0,
        "UT_1370",
        "Testing state transition current=7 to next=2 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1371(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        2,
        0x10ULL,
        0,
        "UT_1371",
        "Testing state transition current=8 to next=2 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1372(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        2,
        0x10ULL,
        0,
        "UT_1372",
        "Testing state transition current=10 to next=2 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1373(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        2,
        0x10ULL,
        0,
        "UT_1373",
        "Testing state transition current=15 to next=2 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1374(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        2,
        0x10ULL,
        0,
        "UT_1374",
        "Testing state transition current=100 to next=2 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1375(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        2,
        0x10ULL,
        0,
        "UT_1375",
        "Testing state transition current=-100 to next=2 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1376(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        3,
        0x10ULL,
        0,
        "UT_1376",
        "Testing state transition current=-10 to next=3 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1377(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        3,
        0x10ULL,
        0,
        "UT_1377",
        "Testing state transition current=-5 to next=3 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1378(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        3,
        0x10ULL,
        0,
        "UT_1378",
        "Testing state transition current=-1 to next=3 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1379(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        3,
        0x10ULL,
        0,
        "UT_1379",
        "Testing state transition current=0 to next=3 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1380(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        3,
        0x10ULL,
        0,
        "UT_1380",
        "Testing state transition current=1 to next=3 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1381(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        3,
        0x10ULL,
        0,
        "UT_1381",
        "Testing state transition current=2 to next=3 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1382(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        3,
        0x10ULL,
        0,
        "UT_1382",
        "Testing state transition current=3 to next=3 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1383(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        3,
        0x10ULL,
        0,
        "UT_1383",
        "Testing state transition current=4 to next=3 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1384(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        3,
        0x10ULL,
        0,
        "UT_1384",
        "Testing state transition current=5 to next=3 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1385(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        3,
        0x10ULL,
        0,
        "UT_1385",
        "Testing state transition current=6 to next=3 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1386(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        3,
        0x10ULL,
        0,
        "UT_1386",
        "Testing state transition current=7 to next=3 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1387(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        3,
        0x10ULL,
        0,
        "UT_1387",
        "Testing state transition current=8 to next=3 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1388(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        3,
        0x10ULL,
        0,
        "UT_1388",
        "Testing state transition current=10 to next=3 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1389(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        3,
        0x10ULL,
        0,
        "UT_1389",
        "Testing state transition current=15 to next=3 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1390(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        3,
        0x10ULL,
        0,
        "UT_1390",
        "Testing state transition current=100 to next=3 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1391(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        3,
        0x10ULL,
        0,
        "UT_1391",
        "Testing state transition current=-100 to next=3 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1392(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        4,
        0x10ULL,
        0,
        "UT_1392",
        "Testing state transition current=-10 to next=4 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1393(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        4,
        0x10ULL,
        0,
        "UT_1393",
        "Testing state transition current=-5 to next=4 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1394(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        4,
        0x10ULL,
        0,
        "UT_1394",
        "Testing state transition current=-1 to next=4 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1395(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        4,
        0x10ULL,
        0,
        "UT_1395",
        "Testing state transition current=0 to next=4 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1396(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        4,
        0x10ULL,
        0,
        "UT_1396",
        "Testing state transition current=1 to next=4 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1397(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        4,
        0x10ULL,
        0,
        "UT_1397",
        "Testing state transition current=2 to next=4 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1398(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        4,
        0x10ULL,
        0,
        "UT_1398",
        "Testing state transition current=3 to next=4 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1399(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        4,
        0x10ULL,
        0,
        "UT_1399",
        "Testing state transition current=4 to next=4 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1400(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        4,
        0x10ULL,
        0,
        "UT_1400",
        "Testing state transition current=5 to next=4 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1401(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        4,
        0x10ULL,
        0,
        "UT_1401",
        "Testing state transition current=6 to next=4 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1402(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        4,
        0x10ULL,
        0,
        "UT_1402",
        "Testing state transition current=7 to next=4 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1403(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        4,
        0x10ULL,
        0,
        "UT_1403",
        "Testing state transition current=8 to next=4 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1404(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        4,
        0x10ULL,
        0,
        "UT_1404",
        "Testing state transition current=10 to next=4 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1405(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        4,
        0x10ULL,
        0,
        "UT_1405",
        "Testing state transition current=15 to next=4 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1406(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        4,
        0x10ULL,
        0,
        "UT_1406",
        "Testing state transition current=100 to next=4 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1407(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        4,
        0x10ULL,
        0,
        "UT_1407",
        "Testing state transition current=-100 to next=4 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1408(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        5,
        0x10ULL,
        0,
        "UT_1408",
        "Testing state transition current=-10 to next=5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1409(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        5,
        0x10ULL,
        0,
        "UT_1409",
        "Testing state transition current=-5 to next=5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1410(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        5,
        0x10ULL,
        0,
        "UT_1410",
        "Testing state transition current=-1 to next=5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1411(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        5,
        0x10ULL,
        0,
        "UT_1411",
        "Testing state transition current=0 to next=5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1412(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        5,
        0x10ULL,
        0,
        "UT_1412",
        "Testing state transition current=1 to next=5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1413(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        5,
        0x10ULL,
        0,
        "UT_1413",
        "Testing state transition current=2 to next=5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1414(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        5,
        0x10ULL,
        0,
        "UT_1414",
        "Testing state transition current=3 to next=5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1415(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        5,
        0x10ULL,
        1,
        "UT_1415",
        "Testing state transition current=4 to next=5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1416(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        5,
        0x10ULL,
        0,
        "UT_1416",
        "Testing state transition current=5 to next=5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1417(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        5,
        0x10ULL,
        0,
        "UT_1417",
        "Testing state transition current=6 to next=5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1418(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        5,
        0x10ULL,
        0,
        "UT_1418",
        "Testing state transition current=7 to next=5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1419(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        5,
        0x10ULL,
        0,
        "UT_1419",
        "Testing state transition current=8 to next=5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1420(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        5,
        0x10ULL,
        0,
        "UT_1420",
        "Testing state transition current=10 to next=5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1421(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        5,
        0x10ULL,
        0,
        "UT_1421",
        "Testing state transition current=15 to next=5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1422(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        5,
        0x10ULL,
        0,
        "UT_1422",
        "Testing state transition current=100 to next=5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1423(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        5,
        0x10ULL,
        0,
        "UT_1423",
        "Testing state transition current=-100 to next=5 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1424(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        6,
        0x10ULL,
        0,
        "UT_1424",
        "Testing state transition current=-10 to next=6 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1425(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        6,
        0x10ULL,
        0,
        "UT_1425",
        "Testing state transition current=-5 to next=6 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1426(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        6,
        0x10ULL,
        0,
        "UT_1426",
        "Testing state transition current=-1 to next=6 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1427(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        6,
        0x10ULL,
        0,
        "UT_1427",
        "Testing state transition current=0 to next=6 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1428(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        6,
        0x10ULL,
        0,
        "UT_1428",
        "Testing state transition current=1 to next=6 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1429(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        6,
        0x10ULL,
        0,
        "UT_1429",
        "Testing state transition current=2 to next=6 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1430(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        6,
        0x10ULL,
        0,
        "UT_1430",
        "Testing state transition current=3 to next=6 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1431(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        6,
        0x10ULL,
        0,
        "UT_1431",
        "Testing state transition current=4 to next=6 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1432(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        6,
        0x10ULL,
        0,
        "UT_1432",
        "Testing state transition current=5 to next=6 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1433(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        6,
        0x10ULL,
        0,
        "UT_1433",
        "Testing state transition current=6 to next=6 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1434(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        6,
        0x10ULL,
        0,
        "UT_1434",
        "Testing state transition current=7 to next=6 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1435(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        6,
        0x10ULL,
        0,
        "UT_1435",
        "Testing state transition current=8 to next=6 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1436(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        6,
        0x10ULL,
        0,
        "UT_1436",
        "Testing state transition current=10 to next=6 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1437(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        6,
        0x10ULL,
        0,
        "UT_1437",
        "Testing state transition current=15 to next=6 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1438(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        6,
        0x10ULL,
        0,
        "UT_1438",
        "Testing state transition current=100 to next=6 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1439(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        6,
        0x10ULL,
        0,
        "UT_1439",
        "Testing state transition current=-100 to next=6 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1440(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        7,
        0x10ULL,
        0,
        "UT_1440",
        "Testing state transition current=-10 to next=7 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1441(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        7,
        0x10ULL,
        0,
        "UT_1441",
        "Testing state transition current=-5 to next=7 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1442(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        7,
        0x10ULL,
        0,
        "UT_1442",
        "Testing state transition current=-1 to next=7 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1443(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        7,
        0x10ULL,
        0,
        "UT_1443",
        "Testing state transition current=0 to next=7 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1444(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        7,
        0x10ULL,
        0,
        "UT_1444",
        "Testing state transition current=1 to next=7 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1445(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        7,
        0x10ULL,
        0,
        "UT_1445",
        "Testing state transition current=2 to next=7 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1446(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        7,
        0x10ULL,
        0,
        "UT_1446",
        "Testing state transition current=3 to next=7 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1447(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        7,
        0x10ULL,
        0,
        "UT_1447",
        "Testing state transition current=4 to next=7 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1448(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        7,
        0x10ULL,
        0,
        "UT_1448",
        "Testing state transition current=5 to next=7 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1449(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        7,
        0x10ULL,
        0,
        "UT_1449",
        "Testing state transition current=6 to next=7 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1450(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        7,
        0x10ULL,
        0,
        "UT_1450",
        "Testing state transition current=7 to next=7 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1451(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        7,
        0x10ULL,
        0,
        "UT_1451",
        "Testing state transition current=8 to next=7 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1452(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        7,
        0x10ULL,
        0,
        "UT_1452",
        "Testing state transition current=10 to next=7 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1453(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        7,
        0x10ULL,
        0,
        "UT_1453",
        "Testing state transition current=15 to next=7 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1454(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        7,
        0x10ULL,
        0,
        "UT_1454",
        "Testing state transition current=100 to next=7 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1455(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        7,
        0x10ULL,
        0,
        "UT_1455",
        "Testing state transition current=-100 to next=7 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1456(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        8,
        0x10ULL,
        0,
        "UT_1456",
        "Testing state transition current=-10 to next=8 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1457(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        8,
        0x10ULL,
        0,
        "UT_1457",
        "Testing state transition current=-5 to next=8 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1458(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        8,
        0x10ULL,
        0,
        "UT_1458",
        "Testing state transition current=-1 to next=8 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1459(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        8,
        0x10ULL,
        0,
        "UT_1459",
        "Testing state transition current=0 to next=8 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1460(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        8,
        0x10ULL,
        0,
        "UT_1460",
        "Testing state transition current=1 to next=8 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1461(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        8,
        0x10ULL,
        0,
        "UT_1461",
        "Testing state transition current=2 to next=8 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1462(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        8,
        0x10ULL,
        0,
        "UT_1462",
        "Testing state transition current=3 to next=8 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1463(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        8,
        0x10ULL,
        0,
        "UT_1463",
        "Testing state transition current=4 to next=8 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1464(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        8,
        0x10ULL,
        0,
        "UT_1464",
        "Testing state transition current=5 to next=8 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1465(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        8,
        0x10ULL,
        0,
        "UT_1465",
        "Testing state transition current=6 to next=8 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1466(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        8,
        0x10ULL,
        0,
        "UT_1466",
        "Testing state transition current=7 to next=8 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1467(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        8,
        0x10ULL,
        0,
        "UT_1467",
        "Testing state transition current=8 to next=8 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1468(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        8,
        0x10ULL,
        0,
        "UT_1468",
        "Testing state transition current=10 to next=8 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1469(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        8,
        0x10ULL,
        0,
        "UT_1469",
        "Testing state transition current=15 to next=8 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1470(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        8,
        0x10ULL,
        0,
        "UT_1470",
        "Testing state transition current=100 to next=8 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1471(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        8,
        0x10ULL,
        0,
        "UT_1471",
        "Testing state transition current=-100 to next=8 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1472(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        10,
        0x10ULL,
        0,
        "UT_1472",
        "Testing state transition current=-10 to next=10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1473(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        10,
        0x10ULL,
        0,
        "UT_1473",
        "Testing state transition current=-5 to next=10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1474(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        10,
        0x10ULL,
        0,
        "UT_1474",
        "Testing state transition current=-1 to next=10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1475(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        10,
        0x10ULL,
        0,
        "UT_1475",
        "Testing state transition current=0 to next=10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1476(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        10,
        0x10ULL,
        0,
        "UT_1476",
        "Testing state transition current=1 to next=10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1477(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        10,
        0x10ULL,
        0,
        "UT_1477",
        "Testing state transition current=2 to next=10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1478(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        10,
        0x10ULL,
        0,
        "UT_1478",
        "Testing state transition current=3 to next=10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1479(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        10,
        0x10ULL,
        0,
        "UT_1479",
        "Testing state transition current=4 to next=10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1480(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        10,
        0x10ULL,
        0,
        "UT_1480",
        "Testing state transition current=5 to next=10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1481(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        10,
        0x10ULL,
        0,
        "UT_1481",
        "Testing state transition current=6 to next=10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1482(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        10,
        0x10ULL,
        0,
        "UT_1482",
        "Testing state transition current=7 to next=10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1483(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        10,
        0x10ULL,
        0,
        "UT_1483",
        "Testing state transition current=8 to next=10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1484(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        10,
        0x10ULL,
        0,
        "UT_1484",
        "Testing state transition current=10 to next=10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1485(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        10,
        0x10ULL,
        0,
        "UT_1485",
        "Testing state transition current=15 to next=10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1486(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        10,
        0x10ULL,
        0,
        "UT_1486",
        "Testing state transition current=100 to next=10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1487(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        10,
        0x10ULL,
        0,
        "UT_1487",
        "Testing state transition current=-100 to next=10 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1488(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        15,
        0x10ULL,
        0,
        "UT_1488",
        "Testing state transition current=-10 to next=15 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1489(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        15,
        0x10ULL,
        0,
        "UT_1489",
        "Testing state transition current=-5 to next=15 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1490(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        15,
        0x10ULL,
        0,
        "UT_1490",
        "Testing state transition current=-1 to next=15 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1491(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        15,
        0x10ULL,
        0,
        "UT_1491",
        "Testing state transition current=0 to next=15 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1492(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        15,
        0x10ULL,
        0,
        "UT_1492",
        "Testing state transition current=1 to next=15 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1493(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        15,
        0x10ULL,
        0,
        "UT_1493",
        "Testing state transition current=2 to next=15 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1494(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        15,
        0x10ULL,
        0,
        "UT_1494",
        "Testing state transition current=3 to next=15 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1495(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        15,
        0x10ULL,
        0,
        "UT_1495",
        "Testing state transition current=4 to next=15 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1496(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        15,
        0x10ULL,
        0,
        "UT_1496",
        "Testing state transition current=5 to next=15 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1497(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        15,
        0x10ULL,
        0,
        "UT_1497",
        "Testing state transition current=6 to next=15 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1498(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        15,
        0x10ULL,
        0,
        "UT_1498",
        "Testing state transition current=7 to next=15 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1499(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        15,
        0x10ULL,
        0,
        "UT_1499",
        "Testing state transition current=8 to next=15 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1500(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        15,
        0x10ULL,
        0,
        "UT_1500",
        "Testing state transition current=10 to next=15 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1501(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        15,
        0x10ULL,
        0,
        "UT_1501",
        "Testing state transition current=15 to next=15 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1502(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        15,
        0x10ULL,
        0,
        "UT_1502",
        "Testing state transition current=100 to next=15 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1503(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        15,
        0x10ULL,
        0,
        "UT_1503",
        "Testing state transition current=-100 to next=15 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1504(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        100,
        0x10ULL,
        0,
        "UT_1504",
        "Testing state transition current=-10 to next=100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1505(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        100,
        0x10ULL,
        0,
        "UT_1505",
        "Testing state transition current=-5 to next=100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1506(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        100,
        0x10ULL,
        0,
        "UT_1506",
        "Testing state transition current=-1 to next=100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1507(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        100,
        0x10ULL,
        0,
        "UT_1507",
        "Testing state transition current=0 to next=100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1508(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        100,
        0x10ULL,
        0,
        "UT_1508",
        "Testing state transition current=1 to next=100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1509(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        100,
        0x10ULL,
        0,
        "UT_1509",
        "Testing state transition current=2 to next=100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1510(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        100,
        0x10ULL,
        0,
        "UT_1510",
        "Testing state transition current=3 to next=100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1511(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        100,
        0x10ULL,
        0,
        "UT_1511",
        "Testing state transition current=4 to next=100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1512(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        100,
        0x10ULL,
        0,
        "UT_1512",
        "Testing state transition current=5 to next=100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1513(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        100,
        0x10ULL,
        0,
        "UT_1513",
        "Testing state transition current=6 to next=100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1514(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        100,
        0x10ULL,
        0,
        "UT_1514",
        "Testing state transition current=7 to next=100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1515(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        100,
        0x10ULL,
        0,
        "UT_1515",
        "Testing state transition current=8 to next=100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1516(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        100,
        0x10ULL,
        0,
        "UT_1516",
        "Testing state transition current=10 to next=100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1517(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        100,
        0x10ULL,
        0,
        "UT_1517",
        "Testing state transition current=15 to next=100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1518(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        100,
        0x10ULL,
        0,
        "UT_1518",
        "Testing state transition current=100 to next=100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1519(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        100,
        0x10ULL,
        0,
        "UT_1519",
        "Testing state transition current=-100 to next=100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1520(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -100,
        0x10ULL,
        0,
        "UT_1520",
        "Testing state transition current=-10 to next=-100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1521(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -100,
        0x10ULL,
        0,
        "UT_1521",
        "Testing state transition current=-5 to next=-100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1522(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -100,
        0x10ULL,
        0,
        "UT_1522",
        "Testing state transition current=-1 to next=-100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1523(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -100,
        0x10ULL,
        0,
        "UT_1523",
        "Testing state transition current=0 to next=-100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1524(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -100,
        0x10ULL,
        0,
        "UT_1524",
        "Testing state transition current=1 to next=-100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1525(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -100,
        0x10ULL,
        0,
        "UT_1525",
        "Testing state transition current=2 to next=-100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1526(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -100,
        0x10ULL,
        0,
        "UT_1526",
        "Testing state transition current=3 to next=-100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1527(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -100,
        0x10ULL,
        0,
        "UT_1527",
        "Testing state transition current=4 to next=-100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1528(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -100,
        0x10ULL,
        0,
        "UT_1528",
        "Testing state transition current=5 to next=-100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1529(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -100,
        0x10ULL,
        0,
        "UT_1529",
        "Testing state transition current=6 to next=-100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1530(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -100,
        0x10ULL,
        0,
        "UT_1530",
        "Testing state transition current=7 to next=-100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1531(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -100,
        0x10ULL,
        0,
        "UT_1531",
        "Testing state transition current=8 to next=-100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1532(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -100,
        0x10ULL,
        0,
        "UT_1532",
        "Testing state transition current=10 to next=-100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1533(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -100,
        0x10ULL,
        0,
        "UT_1533",
        "Testing state transition current=15 to next=-100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1534(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -100,
        0x10ULL,
        0,
        "UT_1534",
        "Testing state transition current=100 to next=-100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1535(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -100,
        0x10ULL,
        0,
        "UT_1535",
        "Testing state transition current=-100 to next=-100 with prereq=0x10",
        stats
    );
}
static void run_unit_test_1536(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -10,
        0x20ULL,
        0,
        "UT_1536",
        "Testing state transition current=-10 to next=-10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1537(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -10,
        0x20ULL,
        0,
        "UT_1537",
        "Testing state transition current=-5 to next=-10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1538(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -10,
        0x20ULL,
        0,
        "UT_1538",
        "Testing state transition current=-1 to next=-10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1539(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -10,
        0x20ULL,
        0,
        "UT_1539",
        "Testing state transition current=0 to next=-10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1540(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -10,
        0x20ULL,
        0,
        "UT_1540",
        "Testing state transition current=1 to next=-10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1541(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -10,
        0x20ULL,
        0,
        "UT_1541",
        "Testing state transition current=2 to next=-10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1542(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -10,
        0x20ULL,
        0,
        "UT_1542",
        "Testing state transition current=3 to next=-10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1543(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -10,
        0x20ULL,
        0,
        "UT_1543",
        "Testing state transition current=4 to next=-10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1544(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -10,
        0x20ULL,
        0,
        "UT_1544",
        "Testing state transition current=5 to next=-10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1545(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -10,
        0x20ULL,
        0,
        "UT_1545",
        "Testing state transition current=6 to next=-10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1546(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -10,
        0x20ULL,
        0,
        "UT_1546",
        "Testing state transition current=7 to next=-10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1547(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -10,
        0x20ULL,
        0,
        "UT_1547",
        "Testing state transition current=8 to next=-10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1548(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -10,
        0x20ULL,
        0,
        "UT_1548",
        "Testing state transition current=10 to next=-10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1549(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -10,
        0x20ULL,
        0,
        "UT_1549",
        "Testing state transition current=15 to next=-10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1550(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -10,
        0x20ULL,
        0,
        "UT_1550",
        "Testing state transition current=100 to next=-10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1551(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -10,
        0x20ULL,
        0,
        "UT_1551",
        "Testing state transition current=-100 to next=-10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1552(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -5,
        0x20ULL,
        0,
        "UT_1552",
        "Testing state transition current=-10 to next=-5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1553(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -5,
        0x20ULL,
        0,
        "UT_1553",
        "Testing state transition current=-5 to next=-5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1554(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -5,
        0x20ULL,
        0,
        "UT_1554",
        "Testing state transition current=-1 to next=-5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1555(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -5,
        0x20ULL,
        0,
        "UT_1555",
        "Testing state transition current=0 to next=-5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1556(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -5,
        0x20ULL,
        0,
        "UT_1556",
        "Testing state transition current=1 to next=-5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1557(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -5,
        0x20ULL,
        0,
        "UT_1557",
        "Testing state transition current=2 to next=-5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1558(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -5,
        0x20ULL,
        0,
        "UT_1558",
        "Testing state transition current=3 to next=-5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1559(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -5,
        0x20ULL,
        0,
        "UT_1559",
        "Testing state transition current=4 to next=-5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1560(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -5,
        0x20ULL,
        0,
        "UT_1560",
        "Testing state transition current=5 to next=-5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1561(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -5,
        0x20ULL,
        0,
        "UT_1561",
        "Testing state transition current=6 to next=-5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1562(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -5,
        0x20ULL,
        0,
        "UT_1562",
        "Testing state transition current=7 to next=-5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1563(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -5,
        0x20ULL,
        0,
        "UT_1563",
        "Testing state transition current=8 to next=-5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1564(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -5,
        0x20ULL,
        0,
        "UT_1564",
        "Testing state transition current=10 to next=-5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1565(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -5,
        0x20ULL,
        0,
        "UT_1565",
        "Testing state transition current=15 to next=-5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1566(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -5,
        0x20ULL,
        0,
        "UT_1566",
        "Testing state transition current=100 to next=-5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1567(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -5,
        0x20ULL,
        0,
        "UT_1567",
        "Testing state transition current=-100 to next=-5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1568(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -1,
        0x20ULL,
        0,
        "UT_1568",
        "Testing state transition current=-10 to next=-1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1569(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -1,
        0x20ULL,
        0,
        "UT_1569",
        "Testing state transition current=-5 to next=-1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1570(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -1,
        0x20ULL,
        0,
        "UT_1570",
        "Testing state transition current=-1 to next=-1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1571(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -1,
        0x20ULL,
        0,
        "UT_1571",
        "Testing state transition current=0 to next=-1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1572(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -1,
        0x20ULL,
        0,
        "UT_1572",
        "Testing state transition current=1 to next=-1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1573(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -1,
        0x20ULL,
        0,
        "UT_1573",
        "Testing state transition current=2 to next=-1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1574(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -1,
        0x20ULL,
        0,
        "UT_1574",
        "Testing state transition current=3 to next=-1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1575(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -1,
        0x20ULL,
        0,
        "UT_1575",
        "Testing state transition current=4 to next=-1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1576(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -1,
        0x20ULL,
        0,
        "UT_1576",
        "Testing state transition current=5 to next=-1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1577(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -1,
        0x20ULL,
        0,
        "UT_1577",
        "Testing state transition current=6 to next=-1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1578(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -1,
        0x20ULL,
        0,
        "UT_1578",
        "Testing state transition current=7 to next=-1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1579(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -1,
        0x20ULL,
        0,
        "UT_1579",
        "Testing state transition current=8 to next=-1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1580(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -1,
        0x20ULL,
        0,
        "UT_1580",
        "Testing state transition current=10 to next=-1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1581(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -1,
        0x20ULL,
        0,
        "UT_1581",
        "Testing state transition current=15 to next=-1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1582(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -1,
        0x20ULL,
        0,
        "UT_1582",
        "Testing state transition current=100 to next=-1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1583(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -1,
        0x20ULL,
        0,
        "UT_1583",
        "Testing state transition current=-100 to next=-1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1584(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        0,
        0x20ULL,
        0,
        "UT_1584",
        "Testing state transition current=-10 to next=0 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1585(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        0,
        0x20ULL,
        0,
        "UT_1585",
        "Testing state transition current=-5 to next=0 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1586(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        0,
        0x20ULL,
        0,
        "UT_1586",
        "Testing state transition current=-1 to next=0 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1587(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        0,
        0x20ULL,
        1,
        "UT_1587",
        "Testing state transition current=0 to next=0 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1588(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        0,
        0x20ULL,
        1,
        "UT_1588",
        "Testing state transition current=1 to next=0 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1589(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        0,
        0x20ULL,
        1,
        "UT_1589",
        "Testing state transition current=2 to next=0 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1590(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        0,
        0x20ULL,
        1,
        "UT_1590",
        "Testing state transition current=3 to next=0 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1591(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        0,
        0x20ULL,
        1,
        "UT_1591",
        "Testing state transition current=4 to next=0 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1592(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        0,
        0x20ULL,
        1,
        "UT_1592",
        "Testing state transition current=5 to next=0 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1593(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        0,
        0x20ULL,
        1,
        "UT_1593",
        "Testing state transition current=6 to next=0 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1594(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        0,
        0x20ULL,
        1,
        "UT_1594",
        "Testing state transition current=7 to next=0 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1595(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        0,
        0x20ULL,
        0,
        "UT_1595",
        "Testing state transition current=8 to next=0 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1596(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        0,
        0x20ULL,
        0,
        "UT_1596",
        "Testing state transition current=10 to next=0 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1597(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        0,
        0x20ULL,
        0,
        "UT_1597",
        "Testing state transition current=15 to next=0 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1598(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        0,
        0x20ULL,
        0,
        "UT_1598",
        "Testing state transition current=100 to next=0 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1599(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        0,
        0x20ULL,
        0,
        "UT_1599",
        "Testing state transition current=-100 to next=0 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1600(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        1,
        0x20ULL,
        0,
        "UT_1600",
        "Testing state transition current=-10 to next=1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1601(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        1,
        0x20ULL,
        0,
        "UT_1601",
        "Testing state transition current=-5 to next=1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1602(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        1,
        0x20ULL,
        0,
        "UT_1602",
        "Testing state transition current=-1 to next=1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1603(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        1,
        0x20ULL,
        0,
        "UT_1603",
        "Testing state transition current=0 to next=1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1604(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        1,
        0x20ULL,
        0,
        "UT_1604",
        "Testing state transition current=1 to next=1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1605(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        1,
        0x20ULL,
        0,
        "UT_1605",
        "Testing state transition current=2 to next=1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1606(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        1,
        0x20ULL,
        0,
        "UT_1606",
        "Testing state transition current=3 to next=1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1607(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        1,
        0x20ULL,
        0,
        "UT_1607",
        "Testing state transition current=4 to next=1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1608(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        1,
        0x20ULL,
        0,
        "UT_1608",
        "Testing state transition current=5 to next=1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1609(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        1,
        0x20ULL,
        0,
        "UT_1609",
        "Testing state transition current=6 to next=1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1610(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        1,
        0x20ULL,
        0,
        "UT_1610",
        "Testing state transition current=7 to next=1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1611(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        1,
        0x20ULL,
        0,
        "UT_1611",
        "Testing state transition current=8 to next=1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1612(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        1,
        0x20ULL,
        0,
        "UT_1612",
        "Testing state transition current=10 to next=1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1613(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        1,
        0x20ULL,
        0,
        "UT_1613",
        "Testing state transition current=15 to next=1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1614(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        1,
        0x20ULL,
        0,
        "UT_1614",
        "Testing state transition current=100 to next=1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1615(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        1,
        0x20ULL,
        0,
        "UT_1615",
        "Testing state transition current=-100 to next=1 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1616(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        2,
        0x20ULL,
        0,
        "UT_1616",
        "Testing state transition current=-10 to next=2 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1617(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        2,
        0x20ULL,
        0,
        "UT_1617",
        "Testing state transition current=-5 to next=2 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1618(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        2,
        0x20ULL,
        0,
        "UT_1618",
        "Testing state transition current=-1 to next=2 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1619(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        2,
        0x20ULL,
        0,
        "UT_1619",
        "Testing state transition current=0 to next=2 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1620(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        2,
        0x20ULL,
        0,
        "UT_1620",
        "Testing state transition current=1 to next=2 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1621(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        2,
        0x20ULL,
        0,
        "UT_1621",
        "Testing state transition current=2 to next=2 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1622(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        2,
        0x20ULL,
        0,
        "UT_1622",
        "Testing state transition current=3 to next=2 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1623(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        2,
        0x20ULL,
        0,
        "UT_1623",
        "Testing state transition current=4 to next=2 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1624(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        2,
        0x20ULL,
        0,
        "UT_1624",
        "Testing state transition current=5 to next=2 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1625(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        2,
        0x20ULL,
        0,
        "UT_1625",
        "Testing state transition current=6 to next=2 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1626(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        2,
        0x20ULL,
        0,
        "UT_1626",
        "Testing state transition current=7 to next=2 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1627(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        2,
        0x20ULL,
        0,
        "UT_1627",
        "Testing state transition current=8 to next=2 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1628(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        2,
        0x20ULL,
        0,
        "UT_1628",
        "Testing state transition current=10 to next=2 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1629(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        2,
        0x20ULL,
        0,
        "UT_1629",
        "Testing state transition current=15 to next=2 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1630(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        2,
        0x20ULL,
        0,
        "UT_1630",
        "Testing state transition current=100 to next=2 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1631(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        2,
        0x20ULL,
        0,
        "UT_1631",
        "Testing state transition current=-100 to next=2 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1632(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        3,
        0x20ULL,
        0,
        "UT_1632",
        "Testing state transition current=-10 to next=3 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1633(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        3,
        0x20ULL,
        0,
        "UT_1633",
        "Testing state transition current=-5 to next=3 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1634(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        3,
        0x20ULL,
        0,
        "UT_1634",
        "Testing state transition current=-1 to next=3 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1635(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        3,
        0x20ULL,
        0,
        "UT_1635",
        "Testing state transition current=0 to next=3 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1636(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        3,
        0x20ULL,
        0,
        "UT_1636",
        "Testing state transition current=1 to next=3 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1637(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        3,
        0x20ULL,
        0,
        "UT_1637",
        "Testing state transition current=2 to next=3 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1638(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        3,
        0x20ULL,
        0,
        "UT_1638",
        "Testing state transition current=3 to next=3 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1639(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        3,
        0x20ULL,
        0,
        "UT_1639",
        "Testing state transition current=4 to next=3 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1640(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        3,
        0x20ULL,
        0,
        "UT_1640",
        "Testing state transition current=5 to next=3 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1641(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        3,
        0x20ULL,
        0,
        "UT_1641",
        "Testing state transition current=6 to next=3 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1642(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        3,
        0x20ULL,
        0,
        "UT_1642",
        "Testing state transition current=7 to next=3 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1643(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        3,
        0x20ULL,
        0,
        "UT_1643",
        "Testing state transition current=8 to next=3 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1644(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        3,
        0x20ULL,
        0,
        "UT_1644",
        "Testing state transition current=10 to next=3 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1645(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        3,
        0x20ULL,
        0,
        "UT_1645",
        "Testing state transition current=15 to next=3 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1646(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        3,
        0x20ULL,
        0,
        "UT_1646",
        "Testing state transition current=100 to next=3 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1647(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        3,
        0x20ULL,
        0,
        "UT_1647",
        "Testing state transition current=-100 to next=3 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1648(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        4,
        0x20ULL,
        0,
        "UT_1648",
        "Testing state transition current=-10 to next=4 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1649(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        4,
        0x20ULL,
        0,
        "UT_1649",
        "Testing state transition current=-5 to next=4 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1650(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        4,
        0x20ULL,
        0,
        "UT_1650",
        "Testing state transition current=-1 to next=4 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1651(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        4,
        0x20ULL,
        0,
        "UT_1651",
        "Testing state transition current=0 to next=4 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1652(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        4,
        0x20ULL,
        0,
        "UT_1652",
        "Testing state transition current=1 to next=4 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1653(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        4,
        0x20ULL,
        0,
        "UT_1653",
        "Testing state transition current=2 to next=4 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1654(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        4,
        0x20ULL,
        0,
        "UT_1654",
        "Testing state transition current=3 to next=4 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1655(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        4,
        0x20ULL,
        0,
        "UT_1655",
        "Testing state transition current=4 to next=4 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1656(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        4,
        0x20ULL,
        0,
        "UT_1656",
        "Testing state transition current=5 to next=4 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1657(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        4,
        0x20ULL,
        0,
        "UT_1657",
        "Testing state transition current=6 to next=4 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1658(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        4,
        0x20ULL,
        0,
        "UT_1658",
        "Testing state transition current=7 to next=4 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1659(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        4,
        0x20ULL,
        0,
        "UT_1659",
        "Testing state transition current=8 to next=4 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1660(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        4,
        0x20ULL,
        0,
        "UT_1660",
        "Testing state transition current=10 to next=4 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1661(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        4,
        0x20ULL,
        0,
        "UT_1661",
        "Testing state transition current=15 to next=4 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1662(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        4,
        0x20ULL,
        0,
        "UT_1662",
        "Testing state transition current=100 to next=4 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1663(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        4,
        0x20ULL,
        0,
        "UT_1663",
        "Testing state transition current=-100 to next=4 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1664(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        5,
        0x20ULL,
        0,
        "UT_1664",
        "Testing state transition current=-10 to next=5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1665(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        5,
        0x20ULL,
        0,
        "UT_1665",
        "Testing state transition current=-5 to next=5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1666(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        5,
        0x20ULL,
        0,
        "UT_1666",
        "Testing state transition current=-1 to next=5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1667(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        5,
        0x20ULL,
        0,
        "UT_1667",
        "Testing state transition current=0 to next=5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1668(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        5,
        0x20ULL,
        0,
        "UT_1668",
        "Testing state transition current=1 to next=5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1669(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        5,
        0x20ULL,
        0,
        "UT_1669",
        "Testing state transition current=2 to next=5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1670(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        5,
        0x20ULL,
        0,
        "UT_1670",
        "Testing state transition current=3 to next=5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1671(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        5,
        0x20ULL,
        0,
        "UT_1671",
        "Testing state transition current=4 to next=5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1672(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        5,
        0x20ULL,
        0,
        "UT_1672",
        "Testing state transition current=5 to next=5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1673(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        5,
        0x20ULL,
        0,
        "UT_1673",
        "Testing state transition current=6 to next=5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1674(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        5,
        0x20ULL,
        0,
        "UT_1674",
        "Testing state transition current=7 to next=5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1675(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        5,
        0x20ULL,
        0,
        "UT_1675",
        "Testing state transition current=8 to next=5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1676(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        5,
        0x20ULL,
        0,
        "UT_1676",
        "Testing state transition current=10 to next=5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1677(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        5,
        0x20ULL,
        0,
        "UT_1677",
        "Testing state transition current=15 to next=5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1678(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        5,
        0x20ULL,
        0,
        "UT_1678",
        "Testing state transition current=100 to next=5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1679(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        5,
        0x20ULL,
        0,
        "UT_1679",
        "Testing state transition current=-100 to next=5 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1680(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        6,
        0x20ULL,
        0,
        "UT_1680",
        "Testing state transition current=-10 to next=6 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1681(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        6,
        0x20ULL,
        0,
        "UT_1681",
        "Testing state transition current=-5 to next=6 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1682(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        6,
        0x20ULL,
        0,
        "UT_1682",
        "Testing state transition current=-1 to next=6 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1683(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        6,
        0x20ULL,
        0,
        "UT_1683",
        "Testing state transition current=0 to next=6 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1684(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        6,
        0x20ULL,
        0,
        "UT_1684",
        "Testing state transition current=1 to next=6 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1685(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        6,
        0x20ULL,
        0,
        "UT_1685",
        "Testing state transition current=2 to next=6 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1686(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        6,
        0x20ULL,
        0,
        "UT_1686",
        "Testing state transition current=3 to next=6 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1687(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        6,
        0x20ULL,
        0,
        "UT_1687",
        "Testing state transition current=4 to next=6 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1688(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        6,
        0x20ULL,
        1,
        "UT_1688",
        "Testing state transition current=5 to next=6 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1689(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        6,
        0x20ULL,
        0,
        "UT_1689",
        "Testing state transition current=6 to next=6 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1690(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        6,
        0x20ULL,
        0,
        "UT_1690",
        "Testing state transition current=7 to next=6 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1691(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        6,
        0x20ULL,
        0,
        "UT_1691",
        "Testing state transition current=8 to next=6 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1692(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        6,
        0x20ULL,
        0,
        "UT_1692",
        "Testing state transition current=10 to next=6 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1693(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        6,
        0x20ULL,
        0,
        "UT_1693",
        "Testing state transition current=15 to next=6 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1694(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        6,
        0x20ULL,
        0,
        "UT_1694",
        "Testing state transition current=100 to next=6 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1695(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        6,
        0x20ULL,
        0,
        "UT_1695",
        "Testing state transition current=-100 to next=6 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1696(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        7,
        0x20ULL,
        0,
        "UT_1696",
        "Testing state transition current=-10 to next=7 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1697(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        7,
        0x20ULL,
        0,
        "UT_1697",
        "Testing state transition current=-5 to next=7 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1698(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        7,
        0x20ULL,
        0,
        "UT_1698",
        "Testing state transition current=-1 to next=7 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1699(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        7,
        0x20ULL,
        0,
        "UT_1699",
        "Testing state transition current=0 to next=7 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1700(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        7,
        0x20ULL,
        0,
        "UT_1700",
        "Testing state transition current=1 to next=7 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1701(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        7,
        0x20ULL,
        0,
        "UT_1701",
        "Testing state transition current=2 to next=7 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1702(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        7,
        0x20ULL,
        0,
        "UT_1702",
        "Testing state transition current=3 to next=7 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1703(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        7,
        0x20ULL,
        0,
        "UT_1703",
        "Testing state transition current=4 to next=7 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1704(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        7,
        0x20ULL,
        0,
        "UT_1704",
        "Testing state transition current=5 to next=7 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1705(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        7,
        0x20ULL,
        0,
        "UT_1705",
        "Testing state transition current=6 to next=7 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1706(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        7,
        0x20ULL,
        0,
        "UT_1706",
        "Testing state transition current=7 to next=7 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1707(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        7,
        0x20ULL,
        0,
        "UT_1707",
        "Testing state transition current=8 to next=7 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1708(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        7,
        0x20ULL,
        0,
        "UT_1708",
        "Testing state transition current=10 to next=7 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1709(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        7,
        0x20ULL,
        0,
        "UT_1709",
        "Testing state transition current=15 to next=7 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1710(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        7,
        0x20ULL,
        0,
        "UT_1710",
        "Testing state transition current=100 to next=7 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1711(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        7,
        0x20ULL,
        0,
        "UT_1711",
        "Testing state transition current=-100 to next=7 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1712(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        8,
        0x20ULL,
        0,
        "UT_1712",
        "Testing state transition current=-10 to next=8 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1713(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        8,
        0x20ULL,
        0,
        "UT_1713",
        "Testing state transition current=-5 to next=8 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1714(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        8,
        0x20ULL,
        0,
        "UT_1714",
        "Testing state transition current=-1 to next=8 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1715(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        8,
        0x20ULL,
        0,
        "UT_1715",
        "Testing state transition current=0 to next=8 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1716(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        8,
        0x20ULL,
        0,
        "UT_1716",
        "Testing state transition current=1 to next=8 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1717(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        8,
        0x20ULL,
        0,
        "UT_1717",
        "Testing state transition current=2 to next=8 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1718(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        8,
        0x20ULL,
        0,
        "UT_1718",
        "Testing state transition current=3 to next=8 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1719(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        8,
        0x20ULL,
        0,
        "UT_1719",
        "Testing state transition current=4 to next=8 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1720(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        8,
        0x20ULL,
        0,
        "UT_1720",
        "Testing state transition current=5 to next=8 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1721(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        8,
        0x20ULL,
        0,
        "UT_1721",
        "Testing state transition current=6 to next=8 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1722(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        8,
        0x20ULL,
        0,
        "UT_1722",
        "Testing state transition current=7 to next=8 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1723(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        8,
        0x20ULL,
        0,
        "UT_1723",
        "Testing state transition current=8 to next=8 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1724(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        8,
        0x20ULL,
        0,
        "UT_1724",
        "Testing state transition current=10 to next=8 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1725(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        8,
        0x20ULL,
        0,
        "UT_1725",
        "Testing state transition current=15 to next=8 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1726(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        8,
        0x20ULL,
        0,
        "UT_1726",
        "Testing state transition current=100 to next=8 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1727(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        8,
        0x20ULL,
        0,
        "UT_1727",
        "Testing state transition current=-100 to next=8 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1728(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        10,
        0x20ULL,
        0,
        "UT_1728",
        "Testing state transition current=-10 to next=10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1729(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        10,
        0x20ULL,
        0,
        "UT_1729",
        "Testing state transition current=-5 to next=10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1730(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        10,
        0x20ULL,
        0,
        "UT_1730",
        "Testing state transition current=-1 to next=10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1731(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        10,
        0x20ULL,
        0,
        "UT_1731",
        "Testing state transition current=0 to next=10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1732(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        10,
        0x20ULL,
        0,
        "UT_1732",
        "Testing state transition current=1 to next=10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1733(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        10,
        0x20ULL,
        0,
        "UT_1733",
        "Testing state transition current=2 to next=10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1734(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        10,
        0x20ULL,
        0,
        "UT_1734",
        "Testing state transition current=3 to next=10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1735(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        10,
        0x20ULL,
        0,
        "UT_1735",
        "Testing state transition current=4 to next=10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1736(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        10,
        0x20ULL,
        0,
        "UT_1736",
        "Testing state transition current=5 to next=10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1737(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        10,
        0x20ULL,
        0,
        "UT_1737",
        "Testing state transition current=6 to next=10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1738(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        10,
        0x20ULL,
        0,
        "UT_1738",
        "Testing state transition current=7 to next=10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1739(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        10,
        0x20ULL,
        0,
        "UT_1739",
        "Testing state transition current=8 to next=10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1740(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        10,
        0x20ULL,
        0,
        "UT_1740",
        "Testing state transition current=10 to next=10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1741(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        10,
        0x20ULL,
        0,
        "UT_1741",
        "Testing state transition current=15 to next=10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1742(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        10,
        0x20ULL,
        0,
        "UT_1742",
        "Testing state transition current=100 to next=10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1743(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        10,
        0x20ULL,
        0,
        "UT_1743",
        "Testing state transition current=-100 to next=10 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1744(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        15,
        0x20ULL,
        0,
        "UT_1744",
        "Testing state transition current=-10 to next=15 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1745(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        15,
        0x20ULL,
        0,
        "UT_1745",
        "Testing state transition current=-5 to next=15 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1746(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        15,
        0x20ULL,
        0,
        "UT_1746",
        "Testing state transition current=-1 to next=15 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1747(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        15,
        0x20ULL,
        0,
        "UT_1747",
        "Testing state transition current=0 to next=15 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1748(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        15,
        0x20ULL,
        0,
        "UT_1748",
        "Testing state transition current=1 to next=15 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1749(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        15,
        0x20ULL,
        0,
        "UT_1749",
        "Testing state transition current=2 to next=15 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1750(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        15,
        0x20ULL,
        0,
        "UT_1750",
        "Testing state transition current=3 to next=15 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1751(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        15,
        0x20ULL,
        0,
        "UT_1751",
        "Testing state transition current=4 to next=15 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1752(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        15,
        0x20ULL,
        0,
        "UT_1752",
        "Testing state transition current=5 to next=15 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1753(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        15,
        0x20ULL,
        0,
        "UT_1753",
        "Testing state transition current=6 to next=15 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1754(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        15,
        0x20ULL,
        0,
        "UT_1754",
        "Testing state transition current=7 to next=15 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1755(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        15,
        0x20ULL,
        0,
        "UT_1755",
        "Testing state transition current=8 to next=15 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1756(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        15,
        0x20ULL,
        0,
        "UT_1756",
        "Testing state transition current=10 to next=15 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1757(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        15,
        0x20ULL,
        0,
        "UT_1757",
        "Testing state transition current=15 to next=15 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1758(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        15,
        0x20ULL,
        0,
        "UT_1758",
        "Testing state transition current=100 to next=15 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1759(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        15,
        0x20ULL,
        0,
        "UT_1759",
        "Testing state transition current=-100 to next=15 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1760(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        100,
        0x20ULL,
        0,
        "UT_1760",
        "Testing state transition current=-10 to next=100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1761(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        100,
        0x20ULL,
        0,
        "UT_1761",
        "Testing state transition current=-5 to next=100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1762(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        100,
        0x20ULL,
        0,
        "UT_1762",
        "Testing state transition current=-1 to next=100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1763(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        100,
        0x20ULL,
        0,
        "UT_1763",
        "Testing state transition current=0 to next=100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1764(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        100,
        0x20ULL,
        0,
        "UT_1764",
        "Testing state transition current=1 to next=100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1765(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        100,
        0x20ULL,
        0,
        "UT_1765",
        "Testing state transition current=2 to next=100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1766(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        100,
        0x20ULL,
        0,
        "UT_1766",
        "Testing state transition current=3 to next=100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1767(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        100,
        0x20ULL,
        0,
        "UT_1767",
        "Testing state transition current=4 to next=100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1768(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        100,
        0x20ULL,
        0,
        "UT_1768",
        "Testing state transition current=5 to next=100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1769(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        100,
        0x20ULL,
        0,
        "UT_1769",
        "Testing state transition current=6 to next=100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1770(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        100,
        0x20ULL,
        0,
        "UT_1770",
        "Testing state transition current=7 to next=100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1771(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        100,
        0x20ULL,
        0,
        "UT_1771",
        "Testing state transition current=8 to next=100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1772(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        100,
        0x20ULL,
        0,
        "UT_1772",
        "Testing state transition current=10 to next=100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1773(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        100,
        0x20ULL,
        0,
        "UT_1773",
        "Testing state transition current=15 to next=100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1774(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        100,
        0x20ULL,
        0,
        "UT_1774",
        "Testing state transition current=100 to next=100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1775(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        100,
        0x20ULL,
        0,
        "UT_1775",
        "Testing state transition current=-100 to next=100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1776(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -100,
        0x20ULL,
        0,
        "UT_1776",
        "Testing state transition current=-10 to next=-100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1777(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -100,
        0x20ULL,
        0,
        "UT_1777",
        "Testing state transition current=-5 to next=-100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1778(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -100,
        0x20ULL,
        0,
        "UT_1778",
        "Testing state transition current=-1 to next=-100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1779(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -100,
        0x20ULL,
        0,
        "UT_1779",
        "Testing state transition current=0 to next=-100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1780(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -100,
        0x20ULL,
        0,
        "UT_1780",
        "Testing state transition current=1 to next=-100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1781(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -100,
        0x20ULL,
        0,
        "UT_1781",
        "Testing state transition current=2 to next=-100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1782(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -100,
        0x20ULL,
        0,
        "UT_1782",
        "Testing state transition current=3 to next=-100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1783(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -100,
        0x20ULL,
        0,
        "UT_1783",
        "Testing state transition current=4 to next=-100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1784(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -100,
        0x20ULL,
        0,
        "UT_1784",
        "Testing state transition current=5 to next=-100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1785(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -100,
        0x20ULL,
        0,
        "UT_1785",
        "Testing state transition current=6 to next=-100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1786(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -100,
        0x20ULL,
        0,
        "UT_1786",
        "Testing state transition current=7 to next=-100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1787(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -100,
        0x20ULL,
        0,
        "UT_1787",
        "Testing state transition current=8 to next=-100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1788(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -100,
        0x20ULL,
        0,
        "UT_1788",
        "Testing state transition current=10 to next=-100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1789(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -100,
        0x20ULL,
        0,
        "UT_1789",
        "Testing state transition current=15 to next=-100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1790(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -100,
        0x20ULL,
        0,
        "UT_1790",
        "Testing state transition current=100 to next=-100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1791(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -100,
        0x20ULL,
        0,
        "UT_1791",
        "Testing state transition current=-100 to next=-100 with prereq=0x20",
        stats
    );
}
static void run_unit_test_1792(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -10,
        0x40ULL,
        0,
        "UT_1792",
        "Testing state transition current=-10 to next=-10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1793(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -10,
        0x40ULL,
        0,
        "UT_1793",
        "Testing state transition current=-5 to next=-10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1794(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -10,
        0x40ULL,
        0,
        "UT_1794",
        "Testing state transition current=-1 to next=-10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1795(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -10,
        0x40ULL,
        0,
        "UT_1795",
        "Testing state transition current=0 to next=-10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1796(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -10,
        0x40ULL,
        0,
        "UT_1796",
        "Testing state transition current=1 to next=-10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1797(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -10,
        0x40ULL,
        0,
        "UT_1797",
        "Testing state transition current=2 to next=-10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1798(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -10,
        0x40ULL,
        0,
        "UT_1798",
        "Testing state transition current=3 to next=-10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1799(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -10,
        0x40ULL,
        0,
        "UT_1799",
        "Testing state transition current=4 to next=-10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1800(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -10,
        0x40ULL,
        0,
        "UT_1800",
        "Testing state transition current=5 to next=-10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1801(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -10,
        0x40ULL,
        0,
        "UT_1801",
        "Testing state transition current=6 to next=-10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1802(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -10,
        0x40ULL,
        0,
        "UT_1802",
        "Testing state transition current=7 to next=-10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1803(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -10,
        0x40ULL,
        0,
        "UT_1803",
        "Testing state transition current=8 to next=-10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1804(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -10,
        0x40ULL,
        0,
        "UT_1804",
        "Testing state transition current=10 to next=-10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1805(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -10,
        0x40ULL,
        0,
        "UT_1805",
        "Testing state transition current=15 to next=-10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1806(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -10,
        0x40ULL,
        0,
        "UT_1806",
        "Testing state transition current=100 to next=-10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1807(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -10,
        0x40ULL,
        0,
        "UT_1807",
        "Testing state transition current=-100 to next=-10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1808(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -5,
        0x40ULL,
        0,
        "UT_1808",
        "Testing state transition current=-10 to next=-5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1809(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -5,
        0x40ULL,
        0,
        "UT_1809",
        "Testing state transition current=-5 to next=-5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1810(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -5,
        0x40ULL,
        0,
        "UT_1810",
        "Testing state transition current=-1 to next=-5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1811(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -5,
        0x40ULL,
        0,
        "UT_1811",
        "Testing state transition current=0 to next=-5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1812(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -5,
        0x40ULL,
        0,
        "UT_1812",
        "Testing state transition current=1 to next=-5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1813(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -5,
        0x40ULL,
        0,
        "UT_1813",
        "Testing state transition current=2 to next=-5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1814(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -5,
        0x40ULL,
        0,
        "UT_1814",
        "Testing state transition current=3 to next=-5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1815(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -5,
        0x40ULL,
        0,
        "UT_1815",
        "Testing state transition current=4 to next=-5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1816(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -5,
        0x40ULL,
        0,
        "UT_1816",
        "Testing state transition current=5 to next=-5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1817(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -5,
        0x40ULL,
        0,
        "UT_1817",
        "Testing state transition current=6 to next=-5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1818(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -5,
        0x40ULL,
        0,
        "UT_1818",
        "Testing state transition current=7 to next=-5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1819(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -5,
        0x40ULL,
        0,
        "UT_1819",
        "Testing state transition current=8 to next=-5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1820(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -5,
        0x40ULL,
        0,
        "UT_1820",
        "Testing state transition current=10 to next=-5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1821(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -5,
        0x40ULL,
        0,
        "UT_1821",
        "Testing state transition current=15 to next=-5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1822(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -5,
        0x40ULL,
        0,
        "UT_1822",
        "Testing state transition current=100 to next=-5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1823(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -5,
        0x40ULL,
        0,
        "UT_1823",
        "Testing state transition current=-100 to next=-5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1824(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -1,
        0x40ULL,
        0,
        "UT_1824",
        "Testing state transition current=-10 to next=-1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1825(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -1,
        0x40ULL,
        0,
        "UT_1825",
        "Testing state transition current=-5 to next=-1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1826(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -1,
        0x40ULL,
        0,
        "UT_1826",
        "Testing state transition current=-1 to next=-1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1827(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -1,
        0x40ULL,
        0,
        "UT_1827",
        "Testing state transition current=0 to next=-1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1828(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -1,
        0x40ULL,
        0,
        "UT_1828",
        "Testing state transition current=1 to next=-1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1829(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -1,
        0x40ULL,
        0,
        "UT_1829",
        "Testing state transition current=2 to next=-1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1830(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -1,
        0x40ULL,
        0,
        "UT_1830",
        "Testing state transition current=3 to next=-1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1831(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -1,
        0x40ULL,
        0,
        "UT_1831",
        "Testing state transition current=4 to next=-1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1832(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -1,
        0x40ULL,
        0,
        "UT_1832",
        "Testing state transition current=5 to next=-1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1833(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -1,
        0x40ULL,
        0,
        "UT_1833",
        "Testing state transition current=6 to next=-1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1834(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -1,
        0x40ULL,
        0,
        "UT_1834",
        "Testing state transition current=7 to next=-1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1835(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -1,
        0x40ULL,
        0,
        "UT_1835",
        "Testing state transition current=8 to next=-1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1836(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -1,
        0x40ULL,
        0,
        "UT_1836",
        "Testing state transition current=10 to next=-1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1837(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -1,
        0x40ULL,
        0,
        "UT_1837",
        "Testing state transition current=15 to next=-1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1838(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -1,
        0x40ULL,
        0,
        "UT_1838",
        "Testing state transition current=100 to next=-1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1839(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -1,
        0x40ULL,
        0,
        "UT_1839",
        "Testing state transition current=-100 to next=-1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1840(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        0,
        0x40ULL,
        0,
        "UT_1840",
        "Testing state transition current=-10 to next=0 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1841(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        0,
        0x40ULL,
        0,
        "UT_1841",
        "Testing state transition current=-5 to next=0 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1842(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        0,
        0x40ULL,
        0,
        "UT_1842",
        "Testing state transition current=-1 to next=0 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1843(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        0,
        0x40ULL,
        1,
        "UT_1843",
        "Testing state transition current=0 to next=0 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1844(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        0,
        0x40ULL,
        1,
        "UT_1844",
        "Testing state transition current=1 to next=0 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1845(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        0,
        0x40ULL,
        1,
        "UT_1845",
        "Testing state transition current=2 to next=0 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1846(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        0,
        0x40ULL,
        1,
        "UT_1846",
        "Testing state transition current=3 to next=0 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1847(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        0,
        0x40ULL,
        1,
        "UT_1847",
        "Testing state transition current=4 to next=0 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1848(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        0,
        0x40ULL,
        1,
        "UT_1848",
        "Testing state transition current=5 to next=0 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1849(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        0,
        0x40ULL,
        1,
        "UT_1849",
        "Testing state transition current=6 to next=0 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1850(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        0,
        0x40ULL,
        1,
        "UT_1850",
        "Testing state transition current=7 to next=0 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1851(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        0,
        0x40ULL,
        0,
        "UT_1851",
        "Testing state transition current=8 to next=0 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1852(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        0,
        0x40ULL,
        0,
        "UT_1852",
        "Testing state transition current=10 to next=0 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1853(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        0,
        0x40ULL,
        0,
        "UT_1853",
        "Testing state transition current=15 to next=0 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1854(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        0,
        0x40ULL,
        0,
        "UT_1854",
        "Testing state transition current=100 to next=0 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1855(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        0,
        0x40ULL,
        0,
        "UT_1855",
        "Testing state transition current=-100 to next=0 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1856(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        1,
        0x40ULL,
        0,
        "UT_1856",
        "Testing state transition current=-10 to next=1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1857(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        1,
        0x40ULL,
        0,
        "UT_1857",
        "Testing state transition current=-5 to next=1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1858(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        1,
        0x40ULL,
        0,
        "UT_1858",
        "Testing state transition current=-1 to next=1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1859(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        1,
        0x40ULL,
        0,
        "UT_1859",
        "Testing state transition current=0 to next=1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1860(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        1,
        0x40ULL,
        0,
        "UT_1860",
        "Testing state transition current=1 to next=1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1861(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        1,
        0x40ULL,
        0,
        "UT_1861",
        "Testing state transition current=2 to next=1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1862(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        1,
        0x40ULL,
        0,
        "UT_1862",
        "Testing state transition current=3 to next=1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1863(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        1,
        0x40ULL,
        0,
        "UT_1863",
        "Testing state transition current=4 to next=1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1864(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        1,
        0x40ULL,
        0,
        "UT_1864",
        "Testing state transition current=5 to next=1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1865(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        1,
        0x40ULL,
        0,
        "UT_1865",
        "Testing state transition current=6 to next=1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1866(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        1,
        0x40ULL,
        0,
        "UT_1866",
        "Testing state transition current=7 to next=1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1867(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        1,
        0x40ULL,
        0,
        "UT_1867",
        "Testing state transition current=8 to next=1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1868(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        1,
        0x40ULL,
        0,
        "UT_1868",
        "Testing state transition current=10 to next=1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1869(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        1,
        0x40ULL,
        0,
        "UT_1869",
        "Testing state transition current=15 to next=1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1870(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        1,
        0x40ULL,
        0,
        "UT_1870",
        "Testing state transition current=100 to next=1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1871(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        1,
        0x40ULL,
        0,
        "UT_1871",
        "Testing state transition current=-100 to next=1 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1872(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        2,
        0x40ULL,
        0,
        "UT_1872",
        "Testing state transition current=-10 to next=2 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1873(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        2,
        0x40ULL,
        0,
        "UT_1873",
        "Testing state transition current=-5 to next=2 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1874(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        2,
        0x40ULL,
        0,
        "UT_1874",
        "Testing state transition current=-1 to next=2 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1875(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        2,
        0x40ULL,
        0,
        "UT_1875",
        "Testing state transition current=0 to next=2 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1876(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        2,
        0x40ULL,
        0,
        "UT_1876",
        "Testing state transition current=1 to next=2 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1877(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        2,
        0x40ULL,
        0,
        "UT_1877",
        "Testing state transition current=2 to next=2 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1878(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        2,
        0x40ULL,
        0,
        "UT_1878",
        "Testing state transition current=3 to next=2 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1879(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        2,
        0x40ULL,
        0,
        "UT_1879",
        "Testing state transition current=4 to next=2 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1880(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        2,
        0x40ULL,
        0,
        "UT_1880",
        "Testing state transition current=5 to next=2 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1881(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        2,
        0x40ULL,
        0,
        "UT_1881",
        "Testing state transition current=6 to next=2 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1882(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        2,
        0x40ULL,
        0,
        "UT_1882",
        "Testing state transition current=7 to next=2 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1883(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        2,
        0x40ULL,
        0,
        "UT_1883",
        "Testing state transition current=8 to next=2 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1884(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        2,
        0x40ULL,
        0,
        "UT_1884",
        "Testing state transition current=10 to next=2 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1885(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        2,
        0x40ULL,
        0,
        "UT_1885",
        "Testing state transition current=15 to next=2 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1886(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        2,
        0x40ULL,
        0,
        "UT_1886",
        "Testing state transition current=100 to next=2 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1887(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        2,
        0x40ULL,
        0,
        "UT_1887",
        "Testing state transition current=-100 to next=2 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1888(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        3,
        0x40ULL,
        0,
        "UT_1888",
        "Testing state transition current=-10 to next=3 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1889(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        3,
        0x40ULL,
        0,
        "UT_1889",
        "Testing state transition current=-5 to next=3 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1890(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        3,
        0x40ULL,
        0,
        "UT_1890",
        "Testing state transition current=-1 to next=3 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1891(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        3,
        0x40ULL,
        0,
        "UT_1891",
        "Testing state transition current=0 to next=3 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1892(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        3,
        0x40ULL,
        0,
        "UT_1892",
        "Testing state transition current=1 to next=3 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1893(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        3,
        0x40ULL,
        0,
        "UT_1893",
        "Testing state transition current=2 to next=3 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1894(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        3,
        0x40ULL,
        0,
        "UT_1894",
        "Testing state transition current=3 to next=3 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1895(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        3,
        0x40ULL,
        0,
        "UT_1895",
        "Testing state transition current=4 to next=3 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1896(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        3,
        0x40ULL,
        0,
        "UT_1896",
        "Testing state transition current=5 to next=3 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1897(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        3,
        0x40ULL,
        0,
        "UT_1897",
        "Testing state transition current=6 to next=3 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1898(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        3,
        0x40ULL,
        0,
        "UT_1898",
        "Testing state transition current=7 to next=3 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1899(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        3,
        0x40ULL,
        0,
        "UT_1899",
        "Testing state transition current=8 to next=3 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1900(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        3,
        0x40ULL,
        0,
        "UT_1900",
        "Testing state transition current=10 to next=3 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1901(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        3,
        0x40ULL,
        0,
        "UT_1901",
        "Testing state transition current=15 to next=3 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1902(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        3,
        0x40ULL,
        0,
        "UT_1902",
        "Testing state transition current=100 to next=3 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1903(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        3,
        0x40ULL,
        0,
        "UT_1903",
        "Testing state transition current=-100 to next=3 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1904(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        4,
        0x40ULL,
        0,
        "UT_1904",
        "Testing state transition current=-10 to next=4 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1905(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        4,
        0x40ULL,
        0,
        "UT_1905",
        "Testing state transition current=-5 to next=4 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1906(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        4,
        0x40ULL,
        0,
        "UT_1906",
        "Testing state transition current=-1 to next=4 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1907(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        4,
        0x40ULL,
        0,
        "UT_1907",
        "Testing state transition current=0 to next=4 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1908(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        4,
        0x40ULL,
        0,
        "UT_1908",
        "Testing state transition current=1 to next=4 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1909(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        4,
        0x40ULL,
        0,
        "UT_1909",
        "Testing state transition current=2 to next=4 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1910(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        4,
        0x40ULL,
        0,
        "UT_1910",
        "Testing state transition current=3 to next=4 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1911(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        4,
        0x40ULL,
        0,
        "UT_1911",
        "Testing state transition current=4 to next=4 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1912(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        4,
        0x40ULL,
        0,
        "UT_1912",
        "Testing state transition current=5 to next=4 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1913(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        4,
        0x40ULL,
        0,
        "UT_1913",
        "Testing state transition current=6 to next=4 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1914(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        4,
        0x40ULL,
        0,
        "UT_1914",
        "Testing state transition current=7 to next=4 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1915(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        4,
        0x40ULL,
        0,
        "UT_1915",
        "Testing state transition current=8 to next=4 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1916(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        4,
        0x40ULL,
        0,
        "UT_1916",
        "Testing state transition current=10 to next=4 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1917(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        4,
        0x40ULL,
        0,
        "UT_1917",
        "Testing state transition current=15 to next=4 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1918(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        4,
        0x40ULL,
        0,
        "UT_1918",
        "Testing state transition current=100 to next=4 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1919(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        4,
        0x40ULL,
        0,
        "UT_1919",
        "Testing state transition current=-100 to next=4 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1920(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        5,
        0x40ULL,
        0,
        "UT_1920",
        "Testing state transition current=-10 to next=5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1921(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        5,
        0x40ULL,
        0,
        "UT_1921",
        "Testing state transition current=-5 to next=5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1922(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        5,
        0x40ULL,
        0,
        "UT_1922",
        "Testing state transition current=-1 to next=5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1923(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        5,
        0x40ULL,
        0,
        "UT_1923",
        "Testing state transition current=0 to next=5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1924(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        5,
        0x40ULL,
        0,
        "UT_1924",
        "Testing state transition current=1 to next=5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1925(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        5,
        0x40ULL,
        0,
        "UT_1925",
        "Testing state transition current=2 to next=5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1926(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        5,
        0x40ULL,
        0,
        "UT_1926",
        "Testing state transition current=3 to next=5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1927(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        5,
        0x40ULL,
        0,
        "UT_1927",
        "Testing state transition current=4 to next=5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1928(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        5,
        0x40ULL,
        0,
        "UT_1928",
        "Testing state transition current=5 to next=5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1929(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        5,
        0x40ULL,
        0,
        "UT_1929",
        "Testing state transition current=6 to next=5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1930(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        5,
        0x40ULL,
        0,
        "UT_1930",
        "Testing state transition current=7 to next=5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1931(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        5,
        0x40ULL,
        0,
        "UT_1931",
        "Testing state transition current=8 to next=5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1932(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        5,
        0x40ULL,
        0,
        "UT_1932",
        "Testing state transition current=10 to next=5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1933(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        5,
        0x40ULL,
        0,
        "UT_1933",
        "Testing state transition current=15 to next=5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1934(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        5,
        0x40ULL,
        0,
        "UT_1934",
        "Testing state transition current=100 to next=5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1935(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        5,
        0x40ULL,
        0,
        "UT_1935",
        "Testing state transition current=-100 to next=5 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1936(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        6,
        0x40ULL,
        0,
        "UT_1936",
        "Testing state transition current=-10 to next=6 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1937(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        6,
        0x40ULL,
        0,
        "UT_1937",
        "Testing state transition current=-5 to next=6 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1938(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        6,
        0x40ULL,
        0,
        "UT_1938",
        "Testing state transition current=-1 to next=6 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1939(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        6,
        0x40ULL,
        0,
        "UT_1939",
        "Testing state transition current=0 to next=6 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1940(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        6,
        0x40ULL,
        0,
        "UT_1940",
        "Testing state transition current=1 to next=6 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1941(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        6,
        0x40ULL,
        0,
        "UT_1941",
        "Testing state transition current=2 to next=6 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1942(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        6,
        0x40ULL,
        0,
        "UT_1942",
        "Testing state transition current=3 to next=6 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1943(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        6,
        0x40ULL,
        0,
        "UT_1943",
        "Testing state transition current=4 to next=6 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1944(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        6,
        0x40ULL,
        0,
        "UT_1944",
        "Testing state transition current=5 to next=6 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1945(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        6,
        0x40ULL,
        0,
        "UT_1945",
        "Testing state transition current=6 to next=6 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1946(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        6,
        0x40ULL,
        0,
        "UT_1946",
        "Testing state transition current=7 to next=6 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1947(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        6,
        0x40ULL,
        0,
        "UT_1947",
        "Testing state transition current=8 to next=6 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1948(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        6,
        0x40ULL,
        0,
        "UT_1948",
        "Testing state transition current=10 to next=6 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1949(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        6,
        0x40ULL,
        0,
        "UT_1949",
        "Testing state transition current=15 to next=6 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1950(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        6,
        0x40ULL,
        0,
        "UT_1950",
        "Testing state transition current=100 to next=6 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1951(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        6,
        0x40ULL,
        0,
        "UT_1951",
        "Testing state transition current=-100 to next=6 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1952(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        7,
        0x40ULL,
        0,
        "UT_1952",
        "Testing state transition current=-10 to next=7 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1953(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        7,
        0x40ULL,
        0,
        "UT_1953",
        "Testing state transition current=-5 to next=7 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1954(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        7,
        0x40ULL,
        0,
        "UT_1954",
        "Testing state transition current=-1 to next=7 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1955(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        7,
        0x40ULL,
        0,
        "UT_1955",
        "Testing state transition current=0 to next=7 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1956(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        7,
        0x40ULL,
        0,
        "UT_1956",
        "Testing state transition current=1 to next=7 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1957(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        7,
        0x40ULL,
        0,
        "UT_1957",
        "Testing state transition current=2 to next=7 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1958(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        7,
        0x40ULL,
        0,
        "UT_1958",
        "Testing state transition current=3 to next=7 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1959(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        7,
        0x40ULL,
        0,
        "UT_1959",
        "Testing state transition current=4 to next=7 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1960(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        7,
        0x40ULL,
        0,
        "UT_1960",
        "Testing state transition current=5 to next=7 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1961(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        7,
        0x40ULL,
        1,
        "UT_1961",
        "Testing state transition current=6 to next=7 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1962(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        7,
        0x40ULL,
        0,
        "UT_1962",
        "Testing state transition current=7 to next=7 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1963(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        7,
        0x40ULL,
        0,
        "UT_1963",
        "Testing state transition current=8 to next=7 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1964(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        7,
        0x40ULL,
        0,
        "UT_1964",
        "Testing state transition current=10 to next=7 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1965(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        7,
        0x40ULL,
        0,
        "UT_1965",
        "Testing state transition current=15 to next=7 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1966(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        7,
        0x40ULL,
        0,
        "UT_1966",
        "Testing state transition current=100 to next=7 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1967(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        7,
        0x40ULL,
        0,
        "UT_1967",
        "Testing state transition current=-100 to next=7 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1968(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        8,
        0x40ULL,
        0,
        "UT_1968",
        "Testing state transition current=-10 to next=8 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1969(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        8,
        0x40ULL,
        0,
        "UT_1969",
        "Testing state transition current=-5 to next=8 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1970(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        8,
        0x40ULL,
        0,
        "UT_1970",
        "Testing state transition current=-1 to next=8 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1971(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        8,
        0x40ULL,
        0,
        "UT_1971",
        "Testing state transition current=0 to next=8 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1972(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        8,
        0x40ULL,
        0,
        "UT_1972",
        "Testing state transition current=1 to next=8 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1973(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        8,
        0x40ULL,
        0,
        "UT_1973",
        "Testing state transition current=2 to next=8 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1974(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        8,
        0x40ULL,
        0,
        "UT_1974",
        "Testing state transition current=3 to next=8 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1975(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        8,
        0x40ULL,
        0,
        "UT_1975",
        "Testing state transition current=4 to next=8 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1976(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        8,
        0x40ULL,
        0,
        "UT_1976",
        "Testing state transition current=5 to next=8 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1977(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        8,
        0x40ULL,
        0,
        "UT_1977",
        "Testing state transition current=6 to next=8 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1978(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        8,
        0x40ULL,
        0,
        "UT_1978",
        "Testing state transition current=7 to next=8 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1979(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        8,
        0x40ULL,
        0,
        "UT_1979",
        "Testing state transition current=8 to next=8 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1980(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        8,
        0x40ULL,
        0,
        "UT_1980",
        "Testing state transition current=10 to next=8 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1981(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        8,
        0x40ULL,
        0,
        "UT_1981",
        "Testing state transition current=15 to next=8 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1982(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        8,
        0x40ULL,
        0,
        "UT_1982",
        "Testing state transition current=100 to next=8 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1983(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        8,
        0x40ULL,
        0,
        "UT_1983",
        "Testing state transition current=-100 to next=8 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1984(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        10,
        0x40ULL,
        0,
        "UT_1984",
        "Testing state transition current=-10 to next=10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1985(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        10,
        0x40ULL,
        0,
        "UT_1985",
        "Testing state transition current=-5 to next=10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1986(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        10,
        0x40ULL,
        0,
        "UT_1986",
        "Testing state transition current=-1 to next=10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1987(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        10,
        0x40ULL,
        0,
        "UT_1987",
        "Testing state transition current=0 to next=10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1988(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        10,
        0x40ULL,
        0,
        "UT_1988",
        "Testing state transition current=1 to next=10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1989(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        10,
        0x40ULL,
        0,
        "UT_1989",
        "Testing state transition current=2 to next=10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1990(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        10,
        0x40ULL,
        0,
        "UT_1990",
        "Testing state transition current=3 to next=10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1991(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        10,
        0x40ULL,
        0,
        "UT_1991",
        "Testing state transition current=4 to next=10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1992(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        10,
        0x40ULL,
        0,
        "UT_1992",
        "Testing state transition current=5 to next=10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1993(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        10,
        0x40ULL,
        0,
        "UT_1993",
        "Testing state transition current=6 to next=10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1994(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        10,
        0x40ULL,
        0,
        "UT_1994",
        "Testing state transition current=7 to next=10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1995(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        10,
        0x40ULL,
        0,
        "UT_1995",
        "Testing state transition current=8 to next=10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1996(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        10,
        0x40ULL,
        0,
        "UT_1996",
        "Testing state transition current=10 to next=10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1997(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        10,
        0x40ULL,
        0,
        "UT_1997",
        "Testing state transition current=15 to next=10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1998(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        10,
        0x40ULL,
        0,
        "UT_1998",
        "Testing state transition current=100 to next=10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_1999(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        10,
        0x40ULL,
        0,
        "UT_1999",
        "Testing state transition current=-100 to next=10 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2000(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        15,
        0x40ULL,
        0,
        "UT_2000",
        "Testing state transition current=-10 to next=15 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2001(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        15,
        0x40ULL,
        0,
        "UT_2001",
        "Testing state transition current=-5 to next=15 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2002(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        15,
        0x40ULL,
        0,
        "UT_2002",
        "Testing state transition current=-1 to next=15 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2003(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        15,
        0x40ULL,
        0,
        "UT_2003",
        "Testing state transition current=0 to next=15 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2004(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        15,
        0x40ULL,
        0,
        "UT_2004",
        "Testing state transition current=1 to next=15 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2005(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        15,
        0x40ULL,
        0,
        "UT_2005",
        "Testing state transition current=2 to next=15 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2006(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        15,
        0x40ULL,
        0,
        "UT_2006",
        "Testing state transition current=3 to next=15 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2007(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        15,
        0x40ULL,
        0,
        "UT_2007",
        "Testing state transition current=4 to next=15 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2008(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        15,
        0x40ULL,
        0,
        "UT_2008",
        "Testing state transition current=5 to next=15 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2009(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        15,
        0x40ULL,
        0,
        "UT_2009",
        "Testing state transition current=6 to next=15 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2010(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        15,
        0x40ULL,
        0,
        "UT_2010",
        "Testing state transition current=7 to next=15 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2011(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        15,
        0x40ULL,
        0,
        "UT_2011",
        "Testing state transition current=8 to next=15 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2012(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        15,
        0x40ULL,
        0,
        "UT_2012",
        "Testing state transition current=10 to next=15 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2013(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        15,
        0x40ULL,
        0,
        "UT_2013",
        "Testing state transition current=15 to next=15 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2014(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        15,
        0x40ULL,
        0,
        "UT_2014",
        "Testing state transition current=100 to next=15 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2015(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        15,
        0x40ULL,
        0,
        "UT_2015",
        "Testing state transition current=-100 to next=15 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2016(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        100,
        0x40ULL,
        0,
        "UT_2016",
        "Testing state transition current=-10 to next=100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2017(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        100,
        0x40ULL,
        0,
        "UT_2017",
        "Testing state transition current=-5 to next=100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2018(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        100,
        0x40ULL,
        0,
        "UT_2018",
        "Testing state transition current=-1 to next=100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2019(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        100,
        0x40ULL,
        0,
        "UT_2019",
        "Testing state transition current=0 to next=100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2020(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        100,
        0x40ULL,
        0,
        "UT_2020",
        "Testing state transition current=1 to next=100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2021(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        100,
        0x40ULL,
        0,
        "UT_2021",
        "Testing state transition current=2 to next=100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2022(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        100,
        0x40ULL,
        0,
        "UT_2022",
        "Testing state transition current=3 to next=100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2023(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        100,
        0x40ULL,
        0,
        "UT_2023",
        "Testing state transition current=4 to next=100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2024(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        100,
        0x40ULL,
        0,
        "UT_2024",
        "Testing state transition current=5 to next=100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2025(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        100,
        0x40ULL,
        0,
        "UT_2025",
        "Testing state transition current=6 to next=100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2026(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        100,
        0x40ULL,
        0,
        "UT_2026",
        "Testing state transition current=7 to next=100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2027(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        100,
        0x40ULL,
        0,
        "UT_2027",
        "Testing state transition current=8 to next=100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2028(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        100,
        0x40ULL,
        0,
        "UT_2028",
        "Testing state transition current=10 to next=100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2029(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        100,
        0x40ULL,
        0,
        "UT_2029",
        "Testing state transition current=15 to next=100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2030(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        100,
        0x40ULL,
        0,
        "UT_2030",
        "Testing state transition current=100 to next=100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2031(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        100,
        0x40ULL,
        0,
        "UT_2031",
        "Testing state transition current=-100 to next=100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2032(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -100,
        0x40ULL,
        0,
        "UT_2032",
        "Testing state transition current=-10 to next=-100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2033(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -100,
        0x40ULL,
        0,
        "UT_2033",
        "Testing state transition current=-5 to next=-100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2034(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -100,
        0x40ULL,
        0,
        "UT_2034",
        "Testing state transition current=-1 to next=-100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2035(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -100,
        0x40ULL,
        0,
        "UT_2035",
        "Testing state transition current=0 to next=-100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2036(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -100,
        0x40ULL,
        0,
        "UT_2036",
        "Testing state transition current=1 to next=-100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2037(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -100,
        0x40ULL,
        0,
        "UT_2037",
        "Testing state transition current=2 to next=-100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2038(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -100,
        0x40ULL,
        0,
        "UT_2038",
        "Testing state transition current=3 to next=-100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2039(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -100,
        0x40ULL,
        0,
        "UT_2039",
        "Testing state transition current=4 to next=-100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2040(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -100,
        0x40ULL,
        0,
        "UT_2040",
        "Testing state transition current=5 to next=-100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2041(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -100,
        0x40ULL,
        0,
        "UT_2041",
        "Testing state transition current=6 to next=-100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2042(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -100,
        0x40ULL,
        0,
        "UT_2042",
        "Testing state transition current=7 to next=-100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2043(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -100,
        0x40ULL,
        0,
        "UT_2043",
        "Testing state transition current=8 to next=-100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2044(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -100,
        0x40ULL,
        0,
        "UT_2044",
        "Testing state transition current=10 to next=-100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2045(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -100,
        0x40ULL,
        0,
        "UT_2045",
        "Testing state transition current=15 to next=-100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2046(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -100,
        0x40ULL,
        0,
        "UT_2046",
        "Testing state transition current=100 to next=-100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2047(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -100,
        0x40ULL,
        0,
        "UT_2047",
        "Testing state transition current=-100 to next=-100 with prereq=0x40",
        stats
    );
}
static void run_unit_test_2048(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -10,
        0x3ULL,
        0,
        "UT_2048",
        "Testing state transition current=-10 to next=-10 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2049(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -10,
        0x3ULL,
        0,
        "UT_2049",
        "Testing state transition current=-5 to next=-10 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2050(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -10,
        0x3ULL,
        0,
        "UT_2050",
        "Testing state transition current=-1 to next=-10 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2051(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -10,
        0x3ULL,
        0,
        "UT_2051",
        "Testing state transition current=0 to next=-10 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2052(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -10,
        0x3ULL,
        0,
        "UT_2052",
        "Testing state transition current=1 to next=-10 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2053(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -10,
        0x3ULL,
        0,
        "UT_2053",
        "Testing state transition current=2 to next=-10 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2054(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -10,
        0x3ULL,
        0,
        "UT_2054",
        "Testing state transition current=3 to next=-10 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2055(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -10,
        0x3ULL,
        0,
        "UT_2055",
        "Testing state transition current=4 to next=-10 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2056(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -10,
        0x3ULL,
        0,
        "UT_2056",
        "Testing state transition current=5 to next=-10 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2057(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -10,
        0x3ULL,
        0,
        "UT_2057",
        "Testing state transition current=6 to next=-10 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2058(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -10,
        0x3ULL,
        0,
        "UT_2058",
        "Testing state transition current=7 to next=-10 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2059(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -10,
        0x3ULL,
        0,
        "UT_2059",
        "Testing state transition current=8 to next=-10 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2060(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -10,
        0x3ULL,
        0,
        "UT_2060",
        "Testing state transition current=10 to next=-10 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2061(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -10,
        0x3ULL,
        0,
        "UT_2061",
        "Testing state transition current=15 to next=-10 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2062(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -10,
        0x3ULL,
        0,
        "UT_2062",
        "Testing state transition current=100 to next=-10 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2063(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -10,
        0x3ULL,
        0,
        "UT_2063",
        "Testing state transition current=-100 to next=-10 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2064(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -5,
        0x3ULL,
        0,
        "UT_2064",
        "Testing state transition current=-10 to next=-5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2065(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -5,
        0x3ULL,
        0,
        "UT_2065",
        "Testing state transition current=-5 to next=-5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2066(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -5,
        0x3ULL,
        0,
        "UT_2066",
        "Testing state transition current=-1 to next=-5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2067(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -5,
        0x3ULL,
        0,
        "UT_2067",
        "Testing state transition current=0 to next=-5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2068(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -5,
        0x3ULL,
        0,
        "UT_2068",
        "Testing state transition current=1 to next=-5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2069(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -5,
        0x3ULL,
        0,
        "UT_2069",
        "Testing state transition current=2 to next=-5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2070(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -5,
        0x3ULL,
        0,
        "UT_2070",
        "Testing state transition current=3 to next=-5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2071(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -5,
        0x3ULL,
        0,
        "UT_2071",
        "Testing state transition current=4 to next=-5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2072(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -5,
        0x3ULL,
        0,
        "UT_2072",
        "Testing state transition current=5 to next=-5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2073(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -5,
        0x3ULL,
        0,
        "UT_2073",
        "Testing state transition current=6 to next=-5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2074(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -5,
        0x3ULL,
        0,
        "UT_2074",
        "Testing state transition current=7 to next=-5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2075(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -5,
        0x3ULL,
        0,
        "UT_2075",
        "Testing state transition current=8 to next=-5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2076(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -5,
        0x3ULL,
        0,
        "UT_2076",
        "Testing state transition current=10 to next=-5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2077(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -5,
        0x3ULL,
        0,
        "UT_2077",
        "Testing state transition current=15 to next=-5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2078(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -5,
        0x3ULL,
        0,
        "UT_2078",
        "Testing state transition current=100 to next=-5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2079(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -5,
        0x3ULL,
        0,
        "UT_2079",
        "Testing state transition current=-100 to next=-5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2080(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        -1,
        0x3ULL,
        0,
        "UT_2080",
        "Testing state transition current=-10 to next=-1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2081(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        -1,
        0x3ULL,
        0,
        "UT_2081",
        "Testing state transition current=-5 to next=-1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2082(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        -1,
        0x3ULL,
        0,
        "UT_2082",
        "Testing state transition current=-1 to next=-1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2083(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        -1,
        0x3ULL,
        0,
        "UT_2083",
        "Testing state transition current=0 to next=-1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2084(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        -1,
        0x3ULL,
        0,
        "UT_2084",
        "Testing state transition current=1 to next=-1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2085(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        -1,
        0x3ULL,
        0,
        "UT_2085",
        "Testing state transition current=2 to next=-1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2086(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        -1,
        0x3ULL,
        0,
        "UT_2086",
        "Testing state transition current=3 to next=-1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2087(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        -1,
        0x3ULL,
        0,
        "UT_2087",
        "Testing state transition current=4 to next=-1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2088(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        -1,
        0x3ULL,
        0,
        "UT_2088",
        "Testing state transition current=5 to next=-1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2089(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        -1,
        0x3ULL,
        0,
        "UT_2089",
        "Testing state transition current=6 to next=-1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2090(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        -1,
        0x3ULL,
        0,
        "UT_2090",
        "Testing state transition current=7 to next=-1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2091(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        -1,
        0x3ULL,
        0,
        "UT_2091",
        "Testing state transition current=8 to next=-1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2092(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        -1,
        0x3ULL,
        0,
        "UT_2092",
        "Testing state transition current=10 to next=-1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2093(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        -1,
        0x3ULL,
        0,
        "UT_2093",
        "Testing state transition current=15 to next=-1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2094(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        -1,
        0x3ULL,
        0,
        "UT_2094",
        "Testing state transition current=100 to next=-1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2095(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        -1,
        0x3ULL,
        0,
        "UT_2095",
        "Testing state transition current=-100 to next=-1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2096(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        0,
        0x3ULL,
        0,
        "UT_2096",
        "Testing state transition current=-10 to next=0 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2097(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        0,
        0x3ULL,
        0,
        "UT_2097",
        "Testing state transition current=-5 to next=0 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2098(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        0,
        0x3ULL,
        0,
        "UT_2098",
        "Testing state transition current=-1 to next=0 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2099(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        0,
        0x3ULL,
        1,
        "UT_2099",
        "Testing state transition current=0 to next=0 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2100(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        0,
        0x3ULL,
        1,
        "UT_2100",
        "Testing state transition current=1 to next=0 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2101(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        0,
        0x3ULL,
        1,
        "UT_2101",
        "Testing state transition current=2 to next=0 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2102(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        0,
        0x3ULL,
        1,
        "UT_2102",
        "Testing state transition current=3 to next=0 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2103(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        0,
        0x3ULL,
        1,
        "UT_2103",
        "Testing state transition current=4 to next=0 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2104(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        0,
        0x3ULL,
        1,
        "UT_2104",
        "Testing state transition current=5 to next=0 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2105(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        0,
        0x3ULL,
        1,
        "UT_2105",
        "Testing state transition current=6 to next=0 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2106(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        0,
        0x3ULL,
        1,
        "UT_2106",
        "Testing state transition current=7 to next=0 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2107(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        0,
        0x3ULL,
        0,
        "UT_2107",
        "Testing state transition current=8 to next=0 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2108(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        0,
        0x3ULL,
        0,
        "UT_2108",
        "Testing state transition current=10 to next=0 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2109(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        0,
        0x3ULL,
        0,
        "UT_2109",
        "Testing state transition current=15 to next=0 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2110(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        0,
        0x3ULL,
        0,
        "UT_2110",
        "Testing state transition current=100 to next=0 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2111(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        0,
        0x3ULL,
        0,
        "UT_2111",
        "Testing state transition current=-100 to next=0 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2112(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        1,
        0x3ULL,
        0,
        "UT_2112",
        "Testing state transition current=-10 to next=1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2113(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        1,
        0x3ULL,
        0,
        "UT_2113",
        "Testing state transition current=-5 to next=1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2114(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        1,
        0x3ULL,
        0,
        "UT_2114",
        "Testing state transition current=-1 to next=1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2115(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        1,
        0x3ULL,
        1,
        "UT_2115",
        "Testing state transition current=0 to next=1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2116(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        1,
        0x3ULL,
        0,
        "UT_2116",
        "Testing state transition current=1 to next=1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2117(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        1,
        0x3ULL,
        0,
        "UT_2117",
        "Testing state transition current=2 to next=1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2118(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        1,
        0x3ULL,
        0,
        "UT_2118",
        "Testing state transition current=3 to next=1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2119(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        1,
        0x3ULL,
        0,
        "UT_2119",
        "Testing state transition current=4 to next=1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2120(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        1,
        0x3ULL,
        0,
        "UT_2120",
        "Testing state transition current=5 to next=1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2121(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        1,
        0x3ULL,
        0,
        "UT_2121",
        "Testing state transition current=6 to next=1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2122(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        1,
        0x3ULL,
        0,
        "UT_2122",
        "Testing state transition current=7 to next=1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2123(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        1,
        0x3ULL,
        0,
        "UT_2123",
        "Testing state transition current=8 to next=1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2124(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        1,
        0x3ULL,
        0,
        "UT_2124",
        "Testing state transition current=10 to next=1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2125(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        1,
        0x3ULL,
        0,
        "UT_2125",
        "Testing state transition current=15 to next=1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2126(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        1,
        0x3ULL,
        0,
        "UT_2126",
        "Testing state transition current=100 to next=1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2127(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        1,
        0x3ULL,
        0,
        "UT_2127",
        "Testing state transition current=-100 to next=1 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2128(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        2,
        0x3ULL,
        0,
        "UT_2128",
        "Testing state transition current=-10 to next=2 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2129(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        2,
        0x3ULL,
        0,
        "UT_2129",
        "Testing state transition current=-5 to next=2 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2130(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        2,
        0x3ULL,
        0,
        "UT_2130",
        "Testing state transition current=-1 to next=2 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2131(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        2,
        0x3ULL,
        0,
        "UT_2131",
        "Testing state transition current=0 to next=2 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2132(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        2,
        0x3ULL,
        1,
        "UT_2132",
        "Testing state transition current=1 to next=2 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2133(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        2,
        0x3ULL,
        0,
        "UT_2133",
        "Testing state transition current=2 to next=2 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2134(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        2,
        0x3ULL,
        0,
        "UT_2134",
        "Testing state transition current=3 to next=2 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2135(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        2,
        0x3ULL,
        0,
        "UT_2135",
        "Testing state transition current=4 to next=2 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2136(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        2,
        0x3ULL,
        0,
        "UT_2136",
        "Testing state transition current=5 to next=2 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2137(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        2,
        0x3ULL,
        0,
        "UT_2137",
        "Testing state transition current=6 to next=2 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2138(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        2,
        0x3ULL,
        0,
        "UT_2138",
        "Testing state transition current=7 to next=2 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2139(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        2,
        0x3ULL,
        0,
        "UT_2139",
        "Testing state transition current=8 to next=2 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2140(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        2,
        0x3ULL,
        0,
        "UT_2140",
        "Testing state transition current=10 to next=2 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2141(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        2,
        0x3ULL,
        0,
        "UT_2141",
        "Testing state transition current=15 to next=2 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2142(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        2,
        0x3ULL,
        0,
        "UT_2142",
        "Testing state transition current=100 to next=2 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2143(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        2,
        0x3ULL,
        0,
        "UT_2143",
        "Testing state transition current=-100 to next=2 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2144(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        3,
        0x3ULL,
        0,
        "UT_2144",
        "Testing state transition current=-10 to next=3 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2145(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        3,
        0x3ULL,
        0,
        "UT_2145",
        "Testing state transition current=-5 to next=3 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2146(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        3,
        0x3ULL,
        0,
        "UT_2146",
        "Testing state transition current=-1 to next=3 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2147(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        3,
        0x3ULL,
        0,
        "UT_2147",
        "Testing state transition current=0 to next=3 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2148(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        3,
        0x3ULL,
        0,
        "UT_2148",
        "Testing state transition current=1 to next=3 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2149(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        3,
        0x3ULL,
        0,
        "UT_2149",
        "Testing state transition current=2 to next=3 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2150(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        3,
        0x3ULL,
        0,
        "UT_2150",
        "Testing state transition current=3 to next=3 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2151(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        3,
        0x3ULL,
        0,
        "UT_2151",
        "Testing state transition current=4 to next=3 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2152(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        3,
        0x3ULL,
        0,
        "UT_2152",
        "Testing state transition current=5 to next=3 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2153(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        3,
        0x3ULL,
        0,
        "UT_2153",
        "Testing state transition current=6 to next=3 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2154(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        3,
        0x3ULL,
        0,
        "UT_2154",
        "Testing state transition current=7 to next=3 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2155(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        3,
        0x3ULL,
        0,
        "UT_2155",
        "Testing state transition current=8 to next=3 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2156(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        3,
        0x3ULL,
        0,
        "UT_2156",
        "Testing state transition current=10 to next=3 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2157(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        3,
        0x3ULL,
        0,
        "UT_2157",
        "Testing state transition current=15 to next=3 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2158(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        3,
        0x3ULL,
        0,
        "UT_2158",
        "Testing state transition current=100 to next=3 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2159(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        3,
        0x3ULL,
        0,
        "UT_2159",
        "Testing state transition current=-100 to next=3 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2160(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        4,
        0x3ULL,
        0,
        "UT_2160",
        "Testing state transition current=-10 to next=4 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2161(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        4,
        0x3ULL,
        0,
        "UT_2161",
        "Testing state transition current=-5 to next=4 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2162(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        4,
        0x3ULL,
        0,
        "UT_2162",
        "Testing state transition current=-1 to next=4 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2163(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        4,
        0x3ULL,
        0,
        "UT_2163",
        "Testing state transition current=0 to next=4 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2164(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        4,
        0x3ULL,
        0,
        "UT_2164",
        "Testing state transition current=1 to next=4 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2165(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        4,
        0x3ULL,
        0,
        "UT_2165",
        "Testing state transition current=2 to next=4 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2166(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        4,
        0x3ULL,
        0,
        "UT_2166",
        "Testing state transition current=3 to next=4 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2167(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        4,
        0x3ULL,
        0,
        "UT_2167",
        "Testing state transition current=4 to next=4 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2168(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        4,
        0x3ULL,
        0,
        "UT_2168",
        "Testing state transition current=5 to next=4 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2169(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        4,
        0x3ULL,
        0,
        "UT_2169",
        "Testing state transition current=6 to next=4 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2170(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        4,
        0x3ULL,
        0,
        "UT_2170",
        "Testing state transition current=7 to next=4 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2171(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        4,
        0x3ULL,
        0,
        "UT_2171",
        "Testing state transition current=8 to next=4 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2172(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        4,
        0x3ULL,
        0,
        "UT_2172",
        "Testing state transition current=10 to next=4 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2173(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        4,
        0x3ULL,
        0,
        "UT_2173",
        "Testing state transition current=15 to next=4 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2174(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        4,
        0x3ULL,
        0,
        "UT_2174",
        "Testing state transition current=100 to next=4 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2175(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        4,
        0x3ULL,
        0,
        "UT_2175",
        "Testing state transition current=-100 to next=4 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2176(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        5,
        0x3ULL,
        0,
        "UT_2176",
        "Testing state transition current=-10 to next=5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2177(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        5,
        0x3ULL,
        0,
        "UT_2177",
        "Testing state transition current=-5 to next=5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2178(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        5,
        0x3ULL,
        0,
        "UT_2178",
        "Testing state transition current=-1 to next=5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2179(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        5,
        0x3ULL,
        0,
        "UT_2179",
        "Testing state transition current=0 to next=5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2180(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        5,
        0x3ULL,
        0,
        "UT_2180",
        "Testing state transition current=1 to next=5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2181(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        5,
        0x3ULL,
        0,
        "UT_2181",
        "Testing state transition current=2 to next=5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2182(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        5,
        0x3ULL,
        0,
        "UT_2182",
        "Testing state transition current=3 to next=5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2183(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        5,
        0x3ULL,
        0,
        "UT_2183",
        "Testing state transition current=4 to next=5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2184(fsm_test_stats_t* stats) {
    run_fsm_assert(
        5,
        5,
        0x3ULL,
        0,
        "UT_2184",
        "Testing state transition current=5 to next=5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2185(fsm_test_stats_t* stats) {
    run_fsm_assert(
        6,
        5,
        0x3ULL,
        0,
        "UT_2185",
        "Testing state transition current=6 to next=5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2186(fsm_test_stats_t* stats) {
    run_fsm_assert(
        7,
        5,
        0x3ULL,
        0,
        "UT_2186",
        "Testing state transition current=7 to next=5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2187(fsm_test_stats_t* stats) {
    run_fsm_assert(
        8,
        5,
        0x3ULL,
        0,
        "UT_2187",
        "Testing state transition current=8 to next=5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2188(fsm_test_stats_t* stats) {
    run_fsm_assert(
        10,
        5,
        0x3ULL,
        0,
        "UT_2188",
        "Testing state transition current=10 to next=5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2189(fsm_test_stats_t* stats) {
    run_fsm_assert(
        15,
        5,
        0x3ULL,
        0,
        "UT_2189",
        "Testing state transition current=15 to next=5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2190(fsm_test_stats_t* stats) {
    run_fsm_assert(
        100,
        5,
        0x3ULL,
        0,
        "UT_2190",
        "Testing state transition current=100 to next=5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2191(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -100,
        5,
        0x3ULL,
        0,
        "UT_2191",
        "Testing state transition current=-100 to next=5 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2192(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -10,
        6,
        0x3ULL,
        0,
        "UT_2192",
        "Testing state transition current=-10 to next=6 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2193(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -5,
        6,
        0x3ULL,
        0,
        "UT_2193",
        "Testing state transition current=-5 to next=6 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2194(fsm_test_stats_t* stats) {
    run_fsm_assert(
        -1,
        6,
        0x3ULL,
        0,
        "UT_2194",
        "Testing state transition current=-1 to next=6 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2195(fsm_test_stats_t* stats) {
    run_fsm_assert(
        0,
        6,
        0x3ULL,
        0,
        "UT_2195",
        "Testing state transition current=0 to next=6 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2196(fsm_test_stats_t* stats) {
    run_fsm_assert(
        1,
        6,
        0x3ULL,
        0,
        "UT_2196",
        "Testing state transition current=1 to next=6 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2197(fsm_test_stats_t* stats) {
    run_fsm_assert(
        2,
        6,
        0x3ULL,
        0,
        "UT_2197",
        "Testing state transition current=2 to next=6 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2198(fsm_test_stats_t* stats) {
    run_fsm_assert(
        3,
        6,
        0x3ULL,
        0,
        "UT_2198",
        "Testing state transition current=3 to next=6 with prereq=0x3",
        stats
    );
}
static void run_unit_test_2199(fsm_test_stats_t* stats) {
    run_fsm_assert(
        4,
        6,
        0x3ULL,
        0,
        "UT_2199",
        "Testing state transition current=4 to next=6 with prereq=0x3",
        stats
    );
}
static void run_test_batch_0_to_100(fsm_test_stats_t* stats) {
    run_unit_test_0000(stats);
    run_unit_test_0001(stats);
    run_unit_test_0002(stats);
    run_unit_test_0003(stats);
    run_unit_test_0004(stats);
    run_unit_test_0005(stats);
    run_unit_test_0006(stats);
    run_unit_test_0007(stats);
    run_unit_test_0008(stats);
    run_unit_test_0009(stats);
    run_unit_test_0010(stats);
    run_unit_test_0011(stats);
    run_unit_test_0012(stats);
    run_unit_test_0013(stats);
    run_unit_test_0014(stats);
    run_unit_test_0015(stats);
    run_unit_test_0016(stats);
    run_unit_test_0017(stats);
    run_unit_test_0018(stats);
    run_unit_test_0019(stats);
    run_unit_test_0020(stats);
    run_unit_test_0021(stats);
    run_unit_test_0022(stats);
    run_unit_test_0023(stats);
    run_unit_test_0024(stats);
    run_unit_test_0025(stats);
    run_unit_test_0026(stats);
    run_unit_test_0027(stats);
    run_unit_test_0028(stats);
    run_unit_test_0029(stats);
    run_unit_test_0030(stats);
    run_unit_test_0031(stats);
    run_unit_test_0032(stats);
    run_unit_test_0033(stats);
    run_unit_test_0034(stats);
    run_unit_test_0035(stats);
    run_unit_test_0036(stats);
    run_unit_test_0037(stats);
    run_unit_test_0038(stats);
    run_unit_test_0039(stats);
    run_unit_test_0040(stats);
    run_unit_test_0041(stats);
    run_unit_test_0042(stats);
    run_unit_test_0043(stats);
    run_unit_test_0044(stats);
    run_unit_test_0045(stats);
    run_unit_test_0046(stats);
    run_unit_test_0047(stats);
    run_unit_test_0048(stats);
    run_unit_test_0049(stats);
    run_unit_test_0050(stats);
    run_unit_test_0051(stats);
    run_unit_test_0052(stats);
    run_unit_test_0053(stats);
    run_unit_test_0054(stats);
    run_unit_test_0055(stats);
    run_unit_test_0056(stats);
    run_unit_test_0057(stats);
    run_unit_test_0058(stats);
    run_unit_test_0059(stats);
    run_unit_test_0060(stats);
    run_unit_test_0061(stats);
    run_unit_test_0062(stats);
    run_unit_test_0063(stats);
    run_unit_test_0064(stats);
    run_unit_test_0065(stats);
    run_unit_test_0066(stats);
    run_unit_test_0067(stats);
    run_unit_test_0068(stats);
    run_unit_test_0069(stats);
    run_unit_test_0070(stats);
    run_unit_test_0071(stats);
    run_unit_test_0072(stats);
    run_unit_test_0073(stats);
    run_unit_test_0074(stats);
    run_unit_test_0075(stats);
    run_unit_test_0076(stats);
    run_unit_test_0077(stats);
    run_unit_test_0078(stats);
    run_unit_test_0079(stats);
    run_unit_test_0080(stats);
    run_unit_test_0081(stats);
    run_unit_test_0082(stats);
    run_unit_test_0083(stats);
    run_unit_test_0084(stats);
    run_unit_test_0085(stats);
    run_unit_test_0086(stats);
    run_unit_test_0087(stats);
    run_unit_test_0088(stats);
    run_unit_test_0089(stats);
    run_unit_test_0090(stats);
    run_unit_test_0091(stats);
    run_unit_test_0092(stats);
    run_unit_test_0093(stats);
    run_unit_test_0094(stats);
    run_unit_test_0095(stats);
    run_unit_test_0096(stats);
    run_unit_test_0097(stats);
    run_unit_test_0098(stats);
    run_unit_test_0099(stats);
}

static void run_test_batch_100_to_200(fsm_test_stats_t* stats) {
    run_unit_test_0100(stats);
    run_unit_test_0101(stats);
    run_unit_test_0102(stats);
    run_unit_test_0103(stats);
    run_unit_test_0104(stats);
    run_unit_test_0105(stats);
    run_unit_test_0106(stats);
    run_unit_test_0107(stats);
    run_unit_test_0108(stats);
    run_unit_test_0109(stats);
    run_unit_test_0110(stats);
    run_unit_test_0111(stats);
    run_unit_test_0112(stats);
    run_unit_test_0113(stats);
    run_unit_test_0114(stats);
    run_unit_test_0115(stats);
    run_unit_test_0116(stats);
    run_unit_test_0117(stats);
    run_unit_test_0118(stats);
    run_unit_test_0119(stats);
    run_unit_test_0120(stats);
    run_unit_test_0121(stats);
    run_unit_test_0122(stats);
    run_unit_test_0123(stats);
    run_unit_test_0124(stats);
    run_unit_test_0125(stats);
    run_unit_test_0126(stats);
    run_unit_test_0127(stats);
    run_unit_test_0128(stats);
    run_unit_test_0129(stats);
    run_unit_test_0130(stats);
    run_unit_test_0131(stats);
    run_unit_test_0132(stats);
    run_unit_test_0133(stats);
    run_unit_test_0134(stats);
    run_unit_test_0135(stats);
    run_unit_test_0136(stats);
    run_unit_test_0137(stats);
    run_unit_test_0138(stats);
    run_unit_test_0139(stats);
    run_unit_test_0140(stats);
    run_unit_test_0141(stats);
    run_unit_test_0142(stats);
    run_unit_test_0143(stats);
    run_unit_test_0144(stats);
    run_unit_test_0145(stats);
    run_unit_test_0146(stats);
    run_unit_test_0147(stats);
    run_unit_test_0148(stats);
    run_unit_test_0149(stats);
    run_unit_test_0150(stats);
    run_unit_test_0151(stats);
    run_unit_test_0152(stats);
    run_unit_test_0153(stats);
    run_unit_test_0154(stats);
    run_unit_test_0155(stats);
    run_unit_test_0156(stats);
    run_unit_test_0157(stats);
    run_unit_test_0158(stats);
    run_unit_test_0159(stats);
    run_unit_test_0160(stats);
    run_unit_test_0161(stats);
    run_unit_test_0162(stats);
    run_unit_test_0163(stats);
    run_unit_test_0164(stats);
    run_unit_test_0165(stats);
    run_unit_test_0166(stats);
    run_unit_test_0167(stats);
    run_unit_test_0168(stats);
    run_unit_test_0169(stats);
    run_unit_test_0170(stats);
    run_unit_test_0171(stats);
    run_unit_test_0172(stats);
    run_unit_test_0173(stats);
    run_unit_test_0174(stats);
    run_unit_test_0175(stats);
    run_unit_test_0176(stats);
    run_unit_test_0177(stats);
    run_unit_test_0178(stats);
    run_unit_test_0179(stats);
    run_unit_test_0180(stats);
    run_unit_test_0181(stats);
    run_unit_test_0182(stats);
    run_unit_test_0183(stats);
    run_unit_test_0184(stats);
    run_unit_test_0185(stats);
    run_unit_test_0186(stats);
    run_unit_test_0187(stats);
    run_unit_test_0188(stats);
    run_unit_test_0189(stats);
    run_unit_test_0190(stats);
    run_unit_test_0191(stats);
    run_unit_test_0192(stats);
    run_unit_test_0193(stats);
    run_unit_test_0194(stats);
    run_unit_test_0195(stats);
    run_unit_test_0196(stats);
    run_unit_test_0197(stats);
    run_unit_test_0198(stats);
    run_unit_test_0199(stats);
}

static void run_test_batch_200_to_300(fsm_test_stats_t* stats) {
    run_unit_test_0200(stats);
    run_unit_test_0201(stats);
    run_unit_test_0202(stats);
    run_unit_test_0203(stats);
    run_unit_test_0204(stats);
    run_unit_test_0205(stats);
    run_unit_test_0206(stats);
    run_unit_test_0207(stats);
    run_unit_test_0208(stats);
    run_unit_test_0209(stats);
    run_unit_test_0210(stats);
    run_unit_test_0211(stats);
    run_unit_test_0212(stats);
    run_unit_test_0213(stats);
    run_unit_test_0214(stats);
    run_unit_test_0215(stats);
    run_unit_test_0216(stats);
    run_unit_test_0217(stats);
    run_unit_test_0218(stats);
    run_unit_test_0219(stats);
    run_unit_test_0220(stats);
    run_unit_test_0221(stats);
    run_unit_test_0222(stats);
    run_unit_test_0223(stats);
    run_unit_test_0224(stats);
    run_unit_test_0225(stats);
    run_unit_test_0226(stats);
    run_unit_test_0227(stats);
    run_unit_test_0228(stats);
    run_unit_test_0229(stats);
    run_unit_test_0230(stats);
    run_unit_test_0231(stats);
    run_unit_test_0232(stats);
    run_unit_test_0233(stats);
    run_unit_test_0234(stats);
    run_unit_test_0235(stats);
    run_unit_test_0236(stats);
    run_unit_test_0237(stats);
    run_unit_test_0238(stats);
    run_unit_test_0239(stats);
    run_unit_test_0240(stats);
    run_unit_test_0241(stats);
    run_unit_test_0242(stats);
    run_unit_test_0243(stats);
    run_unit_test_0244(stats);
    run_unit_test_0245(stats);
    run_unit_test_0246(stats);
    run_unit_test_0247(stats);
    run_unit_test_0248(stats);
    run_unit_test_0249(stats);
    run_unit_test_0250(stats);
    run_unit_test_0251(stats);
    run_unit_test_0252(stats);
    run_unit_test_0253(stats);
    run_unit_test_0254(stats);
    run_unit_test_0255(stats);
    run_unit_test_0256(stats);
    run_unit_test_0257(stats);
    run_unit_test_0258(stats);
    run_unit_test_0259(stats);
    run_unit_test_0260(stats);
    run_unit_test_0261(stats);
    run_unit_test_0262(stats);
    run_unit_test_0263(stats);
    run_unit_test_0264(stats);
    run_unit_test_0265(stats);
    run_unit_test_0266(stats);
    run_unit_test_0267(stats);
    run_unit_test_0268(stats);
    run_unit_test_0269(stats);
    run_unit_test_0270(stats);
    run_unit_test_0271(stats);
    run_unit_test_0272(stats);
    run_unit_test_0273(stats);
    run_unit_test_0274(stats);
    run_unit_test_0275(stats);
    run_unit_test_0276(stats);
    run_unit_test_0277(stats);
    run_unit_test_0278(stats);
    run_unit_test_0279(stats);
    run_unit_test_0280(stats);
    run_unit_test_0281(stats);
    run_unit_test_0282(stats);
    run_unit_test_0283(stats);
    run_unit_test_0284(stats);
    run_unit_test_0285(stats);
    run_unit_test_0286(stats);
    run_unit_test_0287(stats);
    run_unit_test_0288(stats);
    run_unit_test_0289(stats);
    run_unit_test_0290(stats);
    run_unit_test_0291(stats);
    run_unit_test_0292(stats);
    run_unit_test_0293(stats);
    run_unit_test_0294(stats);
    run_unit_test_0295(stats);
    run_unit_test_0296(stats);
    run_unit_test_0297(stats);
    run_unit_test_0298(stats);
    run_unit_test_0299(stats);
}

static void run_test_batch_300_to_400(fsm_test_stats_t* stats) {
    run_unit_test_0300(stats);
    run_unit_test_0301(stats);
    run_unit_test_0302(stats);
    run_unit_test_0303(stats);
    run_unit_test_0304(stats);
    run_unit_test_0305(stats);
    run_unit_test_0306(stats);
    run_unit_test_0307(stats);
    run_unit_test_0308(stats);
    run_unit_test_0309(stats);
    run_unit_test_0310(stats);
    run_unit_test_0311(stats);
    run_unit_test_0312(stats);
    run_unit_test_0313(stats);
    run_unit_test_0314(stats);
    run_unit_test_0315(stats);
    run_unit_test_0316(stats);
    run_unit_test_0317(stats);
    run_unit_test_0318(stats);
    run_unit_test_0319(stats);
    run_unit_test_0320(stats);
    run_unit_test_0321(stats);
    run_unit_test_0322(stats);
    run_unit_test_0323(stats);
    run_unit_test_0324(stats);
    run_unit_test_0325(stats);
    run_unit_test_0326(stats);
    run_unit_test_0327(stats);
    run_unit_test_0328(stats);
    run_unit_test_0329(stats);
    run_unit_test_0330(stats);
    run_unit_test_0331(stats);
    run_unit_test_0332(stats);
    run_unit_test_0333(stats);
    run_unit_test_0334(stats);
    run_unit_test_0335(stats);
    run_unit_test_0336(stats);
    run_unit_test_0337(stats);
    run_unit_test_0338(stats);
    run_unit_test_0339(stats);
    run_unit_test_0340(stats);
    run_unit_test_0341(stats);
    run_unit_test_0342(stats);
    run_unit_test_0343(stats);
    run_unit_test_0344(stats);
    run_unit_test_0345(stats);
    run_unit_test_0346(stats);
    run_unit_test_0347(stats);
    run_unit_test_0348(stats);
    run_unit_test_0349(stats);
    run_unit_test_0350(stats);
    run_unit_test_0351(stats);
    run_unit_test_0352(stats);
    run_unit_test_0353(stats);
    run_unit_test_0354(stats);
    run_unit_test_0355(stats);
    run_unit_test_0356(stats);
    run_unit_test_0357(stats);
    run_unit_test_0358(stats);
    run_unit_test_0359(stats);
    run_unit_test_0360(stats);
    run_unit_test_0361(stats);
    run_unit_test_0362(stats);
    run_unit_test_0363(stats);
    run_unit_test_0364(stats);
    run_unit_test_0365(stats);
    run_unit_test_0366(stats);
    run_unit_test_0367(stats);
    run_unit_test_0368(stats);
    run_unit_test_0369(stats);
    run_unit_test_0370(stats);
    run_unit_test_0371(stats);
    run_unit_test_0372(stats);
    run_unit_test_0373(stats);
    run_unit_test_0374(stats);
    run_unit_test_0375(stats);
    run_unit_test_0376(stats);
    run_unit_test_0377(stats);
    run_unit_test_0378(stats);
    run_unit_test_0379(stats);
    run_unit_test_0380(stats);
    run_unit_test_0381(stats);
    run_unit_test_0382(stats);
    run_unit_test_0383(stats);
    run_unit_test_0384(stats);
    run_unit_test_0385(stats);
    run_unit_test_0386(stats);
    run_unit_test_0387(stats);
    run_unit_test_0388(stats);
    run_unit_test_0389(stats);
    run_unit_test_0390(stats);
    run_unit_test_0391(stats);
    run_unit_test_0392(stats);
    run_unit_test_0393(stats);
    run_unit_test_0394(stats);
    run_unit_test_0395(stats);
    run_unit_test_0396(stats);
    run_unit_test_0397(stats);
    run_unit_test_0398(stats);
    run_unit_test_0399(stats);
}

static void run_test_batch_400_to_500(fsm_test_stats_t* stats) {
    run_unit_test_0400(stats);
    run_unit_test_0401(stats);
    run_unit_test_0402(stats);
    run_unit_test_0403(stats);
    run_unit_test_0404(stats);
    run_unit_test_0405(stats);
    run_unit_test_0406(stats);
    run_unit_test_0407(stats);
    run_unit_test_0408(stats);
    run_unit_test_0409(stats);
    run_unit_test_0410(stats);
    run_unit_test_0411(stats);
    run_unit_test_0412(stats);
    run_unit_test_0413(stats);
    run_unit_test_0414(stats);
    run_unit_test_0415(stats);
    run_unit_test_0416(stats);
    run_unit_test_0417(stats);
    run_unit_test_0418(stats);
    run_unit_test_0419(stats);
    run_unit_test_0420(stats);
    run_unit_test_0421(stats);
    run_unit_test_0422(stats);
    run_unit_test_0423(stats);
    run_unit_test_0424(stats);
    run_unit_test_0425(stats);
    run_unit_test_0426(stats);
    run_unit_test_0427(stats);
    run_unit_test_0428(stats);
    run_unit_test_0429(stats);
    run_unit_test_0430(stats);
    run_unit_test_0431(stats);
    run_unit_test_0432(stats);
    run_unit_test_0433(stats);
    run_unit_test_0434(stats);
    run_unit_test_0435(stats);
    run_unit_test_0436(stats);
    run_unit_test_0437(stats);
    run_unit_test_0438(stats);
    run_unit_test_0439(stats);
    run_unit_test_0440(stats);
    run_unit_test_0441(stats);
    run_unit_test_0442(stats);
    run_unit_test_0443(stats);
    run_unit_test_0444(stats);
    run_unit_test_0445(stats);
    run_unit_test_0446(stats);
    run_unit_test_0447(stats);
    run_unit_test_0448(stats);
    run_unit_test_0449(stats);
    run_unit_test_0450(stats);
    run_unit_test_0451(stats);
    run_unit_test_0452(stats);
    run_unit_test_0453(stats);
    run_unit_test_0454(stats);
    run_unit_test_0455(stats);
    run_unit_test_0456(stats);
    run_unit_test_0457(stats);
    run_unit_test_0458(stats);
    run_unit_test_0459(stats);
    run_unit_test_0460(stats);
    run_unit_test_0461(stats);
    run_unit_test_0462(stats);
    run_unit_test_0463(stats);
    run_unit_test_0464(stats);
    run_unit_test_0465(stats);
    run_unit_test_0466(stats);
    run_unit_test_0467(stats);
    run_unit_test_0468(stats);
    run_unit_test_0469(stats);
    run_unit_test_0470(stats);
    run_unit_test_0471(stats);
    run_unit_test_0472(stats);
    run_unit_test_0473(stats);
    run_unit_test_0474(stats);
    run_unit_test_0475(stats);
    run_unit_test_0476(stats);
    run_unit_test_0477(stats);
    run_unit_test_0478(stats);
    run_unit_test_0479(stats);
    run_unit_test_0480(stats);
    run_unit_test_0481(stats);
    run_unit_test_0482(stats);
    run_unit_test_0483(stats);
    run_unit_test_0484(stats);
    run_unit_test_0485(stats);
    run_unit_test_0486(stats);
    run_unit_test_0487(stats);
    run_unit_test_0488(stats);
    run_unit_test_0489(stats);
    run_unit_test_0490(stats);
    run_unit_test_0491(stats);
    run_unit_test_0492(stats);
    run_unit_test_0493(stats);
    run_unit_test_0494(stats);
    run_unit_test_0495(stats);
    run_unit_test_0496(stats);
    run_unit_test_0497(stats);
    run_unit_test_0498(stats);
    run_unit_test_0499(stats);
}

static void run_test_batch_500_to_600(fsm_test_stats_t* stats) {
    run_unit_test_0500(stats);
    run_unit_test_0501(stats);
    run_unit_test_0502(stats);
    run_unit_test_0503(stats);
    run_unit_test_0504(stats);
    run_unit_test_0505(stats);
    run_unit_test_0506(stats);
    run_unit_test_0507(stats);
    run_unit_test_0508(stats);
    run_unit_test_0509(stats);
    run_unit_test_0510(stats);
    run_unit_test_0511(stats);
    run_unit_test_0512(stats);
    run_unit_test_0513(stats);
    run_unit_test_0514(stats);
    run_unit_test_0515(stats);
    run_unit_test_0516(stats);
    run_unit_test_0517(stats);
    run_unit_test_0518(stats);
    run_unit_test_0519(stats);
    run_unit_test_0520(stats);
    run_unit_test_0521(stats);
    run_unit_test_0522(stats);
    run_unit_test_0523(stats);
    run_unit_test_0524(stats);
    run_unit_test_0525(stats);
    run_unit_test_0526(stats);
    run_unit_test_0527(stats);
    run_unit_test_0528(stats);
    run_unit_test_0529(stats);
    run_unit_test_0530(stats);
    run_unit_test_0531(stats);
    run_unit_test_0532(stats);
    run_unit_test_0533(stats);
    run_unit_test_0534(stats);
    run_unit_test_0535(stats);
    run_unit_test_0536(stats);
    run_unit_test_0537(stats);
    run_unit_test_0538(stats);
    run_unit_test_0539(stats);
    run_unit_test_0540(stats);
    run_unit_test_0541(stats);
    run_unit_test_0542(stats);
    run_unit_test_0543(stats);
    run_unit_test_0544(stats);
    run_unit_test_0545(stats);
    run_unit_test_0546(stats);
    run_unit_test_0547(stats);
    run_unit_test_0548(stats);
    run_unit_test_0549(stats);
    run_unit_test_0550(stats);
    run_unit_test_0551(stats);
    run_unit_test_0552(stats);
    run_unit_test_0553(stats);
    run_unit_test_0554(stats);
    run_unit_test_0555(stats);
    run_unit_test_0556(stats);
    run_unit_test_0557(stats);
    run_unit_test_0558(stats);
    run_unit_test_0559(stats);
    run_unit_test_0560(stats);
    run_unit_test_0561(stats);
    run_unit_test_0562(stats);
    run_unit_test_0563(stats);
    run_unit_test_0564(stats);
    run_unit_test_0565(stats);
    run_unit_test_0566(stats);
    run_unit_test_0567(stats);
    run_unit_test_0568(stats);
    run_unit_test_0569(stats);
    run_unit_test_0570(stats);
    run_unit_test_0571(stats);
    run_unit_test_0572(stats);
    run_unit_test_0573(stats);
    run_unit_test_0574(stats);
    run_unit_test_0575(stats);
    run_unit_test_0576(stats);
    run_unit_test_0577(stats);
    run_unit_test_0578(stats);
    run_unit_test_0579(stats);
    run_unit_test_0580(stats);
    run_unit_test_0581(stats);
    run_unit_test_0582(stats);
    run_unit_test_0583(stats);
    run_unit_test_0584(stats);
    run_unit_test_0585(stats);
    run_unit_test_0586(stats);
    run_unit_test_0587(stats);
    run_unit_test_0588(stats);
    run_unit_test_0589(stats);
    run_unit_test_0590(stats);
    run_unit_test_0591(stats);
    run_unit_test_0592(stats);
    run_unit_test_0593(stats);
    run_unit_test_0594(stats);
    run_unit_test_0595(stats);
    run_unit_test_0596(stats);
    run_unit_test_0597(stats);
    run_unit_test_0598(stats);
    run_unit_test_0599(stats);
}

static void run_test_batch_600_to_700(fsm_test_stats_t* stats) {
    run_unit_test_0600(stats);
    run_unit_test_0601(stats);
    run_unit_test_0602(stats);
    run_unit_test_0603(stats);
    run_unit_test_0604(stats);
    run_unit_test_0605(stats);
    run_unit_test_0606(stats);
    run_unit_test_0607(stats);
    run_unit_test_0608(stats);
    run_unit_test_0609(stats);
    run_unit_test_0610(stats);
    run_unit_test_0611(stats);
    run_unit_test_0612(stats);
    run_unit_test_0613(stats);
    run_unit_test_0614(stats);
    run_unit_test_0615(stats);
    run_unit_test_0616(stats);
    run_unit_test_0617(stats);
    run_unit_test_0618(stats);
    run_unit_test_0619(stats);
    run_unit_test_0620(stats);
    run_unit_test_0621(stats);
    run_unit_test_0622(stats);
    run_unit_test_0623(stats);
    run_unit_test_0624(stats);
    run_unit_test_0625(stats);
    run_unit_test_0626(stats);
    run_unit_test_0627(stats);
    run_unit_test_0628(stats);
    run_unit_test_0629(stats);
    run_unit_test_0630(stats);
    run_unit_test_0631(stats);
    run_unit_test_0632(stats);
    run_unit_test_0633(stats);
    run_unit_test_0634(stats);
    run_unit_test_0635(stats);
    run_unit_test_0636(stats);
    run_unit_test_0637(stats);
    run_unit_test_0638(stats);
    run_unit_test_0639(stats);
    run_unit_test_0640(stats);
    run_unit_test_0641(stats);
    run_unit_test_0642(stats);
    run_unit_test_0643(stats);
    run_unit_test_0644(stats);
    run_unit_test_0645(stats);
    run_unit_test_0646(stats);
    run_unit_test_0647(stats);
    run_unit_test_0648(stats);
    run_unit_test_0649(stats);
    run_unit_test_0650(stats);
    run_unit_test_0651(stats);
    run_unit_test_0652(stats);
    run_unit_test_0653(stats);
    run_unit_test_0654(stats);
    run_unit_test_0655(stats);
    run_unit_test_0656(stats);
    run_unit_test_0657(stats);
    run_unit_test_0658(stats);
    run_unit_test_0659(stats);
    run_unit_test_0660(stats);
    run_unit_test_0661(stats);
    run_unit_test_0662(stats);
    run_unit_test_0663(stats);
    run_unit_test_0664(stats);
    run_unit_test_0665(stats);
    run_unit_test_0666(stats);
    run_unit_test_0667(stats);
    run_unit_test_0668(stats);
    run_unit_test_0669(stats);
    run_unit_test_0670(stats);
    run_unit_test_0671(stats);
    run_unit_test_0672(stats);
    run_unit_test_0673(stats);
    run_unit_test_0674(stats);
    run_unit_test_0675(stats);
    run_unit_test_0676(stats);
    run_unit_test_0677(stats);
    run_unit_test_0678(stats);
    run_unit_test_0679(stats);
    run_unit_test_0680(stats);
    run_unit_test_0681(stats);
    run_unit_test_0682(stats);
    run_unit_test_0683(stats);
    run_unit_test_0684(stats);
    run_unit_test_0685(stats);
    run_unit_test_0686(stats);
    run_unit_test_0687(stats);
    run_unit_test_0688(stats);
    run_unit_test_0689(stats);
    run_unit_test_0690(stats);
    run_unit_test_0691(stats);
    run_unit_test_0692(stats);
    run_unit_test_0693(stats);
    run_unit_test_0694(stats);
    run_unit_test_0695(stats);
    run_unit_test_0696(stats);
    run_unit_test_0697(stats);
    run_unit_test_0698(stats);
    run_unit_test_0699(stats);
}

static void run_test_batch_700_to_800(fsm_test_stats_t* stats) {
    run_unit_test_0700(stats);
    run_unit_test_0701(stats);
    run_unit_test_0702(stats);
    run_unit_test_0703(stats);
    run_unit_test_0704(stats);
    run_unit_test_0705(stats);
    run_unit_test_0706(stats);
    run_unit_test_0707(stats);
    run_unit_test_0708(stats);
    run_unit_test_0709(stats);
    run_unit_test_0710(stats);
    run_unit_test_0711(stats);
    run_unit_test_0712(stats);
    run_unit_test_0713(stats);
    run_unit_test_0714(stats);
    run_unit_test_0715(stats);
    run_unit_test_0716(stats);
    run_unit_test_0717(stats);
    run_unit_test_0718(stats);
    run_unit_test_0719(stats);
    run_unit_test_0720(stats);
    run_unit_test_0721(stats);
    run_unit_test_0722(stats);
    run_unit_test_0723(stats);
    run_unit_test_0724(stats);
    run_unit_test_0725(stats);
    run_unit_test_0726(stats);
    run_unit_test_0727(stats);
    run_unit_test_0728(stats);
    run_unit_test_0729(stats);
    run_unit_test_0730(stats);
    run_unit_test_0731(stats);
    run_unit_test_0732(stats);
    run_unit_test_0733(stats);
    run_unit_test_0734(stats);
    run_unit_test_0735(stats);
    run_unit_test_0736(stats);
    run_unit_test_0737(stats);
    run_unit_test_0738(stats);
    run_unit_test_0739(stats);
    run_unit_test_0740(stats);
    run_unit_test_0741(stats);
    run_unit_test_0742(stats);
    run_unit_test_0743(stats);
    run_unit_test_0744(stats);
    run_unit_test_0745(stats);
    run_unit_test_0746(stats);
    run_unit_test_0747(stats);
    run_unit_test_0748(stats);
    run_unit_test_0749(stats);
    run_unit_test_0750(stats);
    run_unit_test_0751(stats);
    run_unit_test_0752(stats);
    run_unit_test_0753(stats);
    run_unit_test_0754(stats);
    run_unit_test_0755(stats);
    run_unit_test_0756(stats);
    run_unit_test_0757(stats);
    run_unit_test_0758(stats);
    run_unit_test_0759(stats);
    run_unit_test_0760(stats);
    run_unit_test_0761(stats);
    run_unit_test_0762(stats);
    run_unit_test_0763(stats);
    run_unit_test_0764(stats);
    run_unit_test_0765(stats);
    run_unit_test_0766(stats);
    run_unit_test_0767(stats);
    run_unit_test_0768(stats);
    run_unit_test_0769(stats);
    run_unit_test_0770(stats);
    run_unit_test_0771(stats);
    run_unit_test_0772(stats);
    run_unit_test_0773(stats);
    run_unit_test_0774(stats);
    run_unit_test_0775(stats);
    run_unit_test_0776(stats);
    run_unit_test_0777(stats);
    run_unit_test_0778(stats);
    run_unit_test_0779(stats);
    run_unit_test_0780(stats);
    run_unit_test_0781(stats);
    run_unit_test_0782(stats);
    run_unit_test_0783(stats);
    run_unit_test_0784(stats);
    run_unit_test_0785(stats);
    run_unit_test_0786(stats);
    run_unit_test_0787(stats);
    run_unit_test_0788(stats);
    run_unit_test_0789(stats);
    run_unit_test_0790(stats);
    run_unit_test_0791(stats);
    run_unit_test_0792(stats);
    run_unit_test_0793(stats);
    run_unit_test_0794(stats);
    run_unit_test_0795(stats);
    run_unit_test_0796(stats);
    run_unit_test_0797(stats);
    run_unit_test_0798(stats);
    run_unit_test_0799(stats);
}

static void run_test_batch_800_to_900(fsm_test_stats_t* stats) {
    run_unit_test_0800(stats);
    run_unit_test_0801(stats);
    run_unit_test_0802(stats);
    run_unit_test_0803(stats);
    run_unit_test_0804(stats);
    run_unit_test_0805(stats);
    run_unit_test_0806(stats);
    run_unit_test_0807(stats);
    run_unit_test_0808(stats);
    run_unit_test_0809(stats);
    run_unit_test_0810(stats);
    run_unit_test_0811(stats);
    run_unit_test_0812(stats);
    run_unit_test_0813(stats);
    run_unit_test_0814(stats);
    run_unit_test_0815(stats);
    run_unit_test_0816(stats);
    run_unit_test_0817(stats);
    run_unit_test_0818(stats);
    run_unit_test_0819(stats);
    run_unit_test_0820(stats);
    run_unit_test_0821(stats);
    run_unit_test_0822(stats);
    run_unit_test_0823(stats);
    run_unit_test_0824(stats);
    run_unit_test_0825(stats);
    run_unit_test_0826(stats);
    run_unit_test_0827(stats);
    run_unit_test_0828(stats);
    run_unit_test_0829(stats);
    run_unit_test_0830(stats);
    run_unit_test_0831(stats);
    run_unit_test_0832(stats);
    run_unit_test_0833(stats);
    run_unit_test_0834(stats);
    run_unit_test_0835(stats);
    run_unit_test_0836(stats);
    run_unit_test_0837(stats);
    run_unit_test_0838(stats);
    run_unit_test_0839(stats);
    run_unit_test_0840(stats);
    run_unit_test_0841(stats);
    run_unit_test_0842(stats);
    run_unit_test_0843(stats);
    run_unit_test_0844(stats);
    run_unit_test_0845(stats);
    run_unit_test_0846(stats);
    run_unit_test_0847(stats);
    run_unit_test_0848(stats);
    run_unit_test_0849(stats);
    run_unit_test_0850(stats);
    run_unit_test_0851(stats);
    run_unit_test_0852(stats);
    run_unit_test_0853(stats);
    run_unit_test_0854(stats);
    run_unit_test_0855(stats);
    run_unit_test_0856(stats);
    run_unit_test_0857(stats);
    run_unit_test_0858(stats);
    run_unit_test_0859(stats);
    run_unit_test_0860(stats);
    run_unit_test_0861(stats);
    run_unit_test_0862(stats);
    run_unit_test_0863(stats);
    run_unit_test_0864(stats);
    run_unit_test_0865(stats);
    run_unit_test_0866(stats);
    run_unit_test_0867(stats);
    run_unit_test_0868(stats);
    run_unit_test_0869(stats);
    run_unit_test_0870(stats);
    run_unit_test_0871(stats);
    run_unit_test_0872(stats);
    run_unit_test_0873(stats);
    run_unit_test_0874(stats);
    run_unit_test_0875(stats);
    run_unit_test_0876(stats);
    run_unit_test_0877(stats);
    run_unit_test_0878(stats);
    run_unit_test_0879(stats);
    run_unit_test_0880(stats);
    run_unit_test_0881(stats);
    run_unit_test_0882(stats);
    run_unit_test_0883(stats);
    run_unit_test_0884(stats);
    run_unit_test_0885(stats);
    run_unit_test_0886(stats);
    run_unit_test_0887(stats);
    run_unit_test_0888(stats);
    run_unit_test_0889(stats);
    run_unit_test_0890(stats);
    run_unit_test_0891(stats);
    run_unit_test_0892(stats);
    run_unit_test_0893(stats);
    run_unit_test_0894(stats);
    run_unit_test_0895(stats);
    run_unit_test_0896(stats);
    run_unit_test_0897(stats);
    run_unit_test_0898(stats);
    run_unit_test_0899(stats);
}

static void run_test_batch_900_to_1000(fsm_test_stats_t* stats) {
    run_unit_test_0900(stats);
    run_unit_test_0901(stats);
    run_unit_test_0902(stats);
    run_unit_test_0903(stats);
    run_unit_test_0904(stats);
    run_unit_test_0905(stats);
    run_unit_test_0906(stats);
    run_unit_test_0907(stats);
    run_unit_test_0908(stats);
    run_unit_test_0909(stats);
    run_unit_test_0910(stats);
    run_unit_test_0911(stats);
    run_unit_test_0912(stats);
    run_unit_test_0913(stats);
    run_unit_test_0914(stats);
    run_unit_test_0915(stats);
    run_unit_test_0916(stats);
    run_unit_test_0917(stats);
    run_unit_test_0918(stats);
    run_unit_test_0919(stats);
    run_unit_test_0920(stats);
    run_unit_test_0921(stats);
    run_unit_test_0922(stats);
    run_unit_test_0923(stats);
    run_unit_test_0924(stats);
    run_unit_test_0925(stats);
    run_unit_test_0926(stats);
    run_unit_test_0927(stats);
    run_unit_test_0928(stats);
    run_unit_test_0929(stats);
    run_unit_test_0930(stats);
    run_unit_test_0931(stats);
    run_unit_test_0932(stats);
    run_unit_test_0933(stats);
    run_unit_test_0934(stats);
    run_unit_test_0935(stats);
    run_unit_test_0936(stats);
    run_unit_test_0937(stats);
    run_unit_test_0938(stats);
    run_unit_test_0939(stats);
    run_unit_test_0940(stats);
    run_unit_test_0941(stats);
    run_unit_test_0942(stats);
    run_unit_test_0943(stats);
    run_unit_test_0944(stats);
    run_unit_test_0945(stats);
    run_unit_test_0946(stats);
    run_unit_test_0947(stats);
    run_unit_test_0948(stats);
    run_unit_test_0949(stats);
    run_unit_test_0950(stats);
    run_unit_test_0951(stats);
    run_unit_test_0952(stats);
    run_unit_test_0953(stats);
    run_unit_test_0954(stats);
    run_unit_test_0955(stats);
    run_unit_test_0956(stats);
    run_unit_test_0957(stats);
    run_unit_test_0958(stats);
    run_unit_test_0959(stats);
    run_unit_test_0960(stats);
    run_unit_test_0961(stats);
    run_unit_test_0962(stats);
    run_unit_test_0963(stats);
    run_unit_test_0964(stats);
    run_unit_test_0965(stats);
    run_unit_test_0966(stats);
    run_unit_test_0967(stats);
    run_unit_test_0968(stats);
    run_unit_test_0969(stats);
    run_unit_test_0970(stats);
    run_unit_test_0971(stats);
    run_unit_test_0972(stats);
    run_unit_test_0973(stats);
    run_unit_test_0974(stats);
    run_unit_test_0975(stats);
    run_unit_test_0976(stats);
    run_unit_test_0977(stats);
    run_unit_test_0978(stats);
    run_unit_test_0979(stats);
    run_unit_test_0980(stats);
    run_unit_test_0981(stats);
    run_unit_test_0982(stats);
    run_unit_test_0983(stats);
    run_unit_test_0984(stats);
    run_unit_test_0985(stats);
    run_unit_test_0986(stats);
    run_unit_test_0987(stats);
    run_unit_test_0988(stats);
    run_unit_test_0989(stats);
    run_unit_test_0990(stats);
    run_unit_test_0991(stats);
    run_unit_test_0992(stats);
    run_unit_test_0993(stats);
    run_unit_test_0994(stats);
    run_unit_test_0995(stats);
    run_unit_test_0996(stats);
    run_unit_test_0997(stats);
    run_unit_test_0998(stats);
    run_unit_test_0999(stats);
}

static void run_test_batch_1000_to_1100(fsm_test_stats_t* stats) {
    run_unit_test_1000(stats);
    run_unit_test_1001(stats);
    run_unit_test_1002(stats);
    run_unit_test_1003(stats);
    run_unit_test_1004(stats);
    run_unit_test_1005(stats);
    run_unit_test_1006(stats);
    run_unit_test_1007(stats);
    run_unit_test_1008(stats);
    run_unit_test_1009(stats);
    run_unit_test_1010(stats);
    run_unit_test_1011(stats);
    run_unit_test_1012(stats);
    run_unit_test_1013(stats);
    run_unit_test_1014(stats);
    run_unit_test_1015(stats);
    run_unit_test_1016(stats);
    run_unit_test_1017(stats);
    run_unit_test_1018(stats);
    run_unit_test_1019(stats);
    run_unit_test_1020(stats);
    run_unit_test_1021(stats);
    run_unit_test_1022(stats);
    run_unit_test_1023(stats);
    run_unit_test_1024(stats);
    run_unit_test_1025(stats);
    run_unit_test_1026(stats);
    run_unit_test_1027(stats);
    run_unit_test_1028(stats);
    run_unit_test_1029(stats);
    run_unit_test_1030(stats);
    run_unit_test_1031(stats);
    run_unit_test_1032(stats);
    run_unit_test_1033(stats);
    run_unit_test_1034(stats);
    run_unit_test_1035(stats);
    run_unit_test_1036(stats);
    run_unit_test_1037(stats);
    run_unit_test_1038(stats);
    run_unit_test_1039(stats);
    run_unit_test_1040(stats);
    run_unit_test_1041(stats);
    run_unit_test_1042(stats);
    run_unit_test_1043(stats);
    run_unit_test_1044(stats);
    run_unit_test_1045(stats);
    run_unit_test_1046(stats);
    run_unit_test_1047(stats);
    run_unit_test_1048(stats);
    run_unit_test_1049(stats);
    run_unit_test_1050(stats);
    run_unit_test_1051(stats);
    run_unit_test_1052(stats);
    run_unit_test_1053(stats);
    run_unit_test_1054(stats);
    run_unit_test_1055(stats);
    run_unit_test_1056(stats);
    run_unit_test_1057(stats);
    run_unit_test_1058(stats);
    run_unit_test_1059(stats);
    run_unit_test_1060(stats);
    run_unit_test_1061(stats);
    run_unit_test_1062(stats);
    run_unit_test_1063(stats);
    run_unit_test_1064(stats);
    run_unit_test_1065(stats);
    run_unit_test_1066(stats);
    run_unit_test_1067(stats);
    run_unit_test_1068(stats);
    run_unit_test_1069(stats);
    run_unit_test_1070(stats);
    run_unit_test_1071(stats);
    run_unit_test_1072(stats);
    run_unit_test_1073(stats);
    run_unit_test_1074(stats);
    run_unit_test_1075(stats);
    run_unit_test_1076(stats);
    run_unit_test_1077(stats);
    run_unit_test_1078(stats);
    run_unit_test_1079(stats);
    run_unit_test_1080(stats);
    run_unit_test_1081(stats);
    run_unit_test_1082(stats);
    run_unit_test_1083(stats);
    run_unit_test_1084(stats);
    run_unit_test_1085(stats);
    run_unit_test_1086(stats);
    run_unit_test_1087(stats);
    run_unit_test_1088(stats);
    run_unit_test_1089(stats);
    run_unit_test_1090(stats);
    run_unit_test_1091(stats);
    run_unit_test_1092(stats);
    run_unit_test_1093(stats);
    run_unit_test_1094(stats);
    run_unit_test_1095(stats);
    run_unit_test_1096(stats);
    run_unit_test_1097(stats);
    run_unit_test_1098(stats);
    run_unit_test_1099(stats);
}

static void run_test_batch_1100_to_1200(fsm_test_stats_t* stats) {
    run_unit_test_1100(stats);
    run_unit_test_1101(stats);
    run_unit_test_1102(stats);
    run_unit_test_1103(stats);
    run_unit_test_1104(stats);
    run_unit_test_1105(stats);
    run_unit_test_1106(stats);
    run_unit_test_1107(stats);
    run_unit_test_1108(stats);
    run_unit_test_1109(stats);
    run_unit_test_1110(stats);
    run_unit_test_1111(stats);
    run_unit_test_1112(stats);
    run_unit_test_1113(stats);
    run_unit_test_1114(stats);
    run_unit_test_1115(stats);
    run_unit_test_1116(stats);
    run_unit_test_1117(stats);
    run_unit_test_1118(stats);
    run_unit_test_1119(stats);
    run_unit_test_1120(stats);
    run_unit_test_1121(stats);
    run_unit_test_1122(stats);
    run_unit_test_1123(stats);
    run_unit_test_1124(stats);
    run_unit_test_1125(stats);
    run_unit_test_1126(stats);
    run_unit_test_1127(stats);
    run_unit_test_1128(stats);
    run_unit_test_1129(stats);
    run_unit_test_1130(stats);
    run_unit_test_1131(stats);
    run_unit_test_1132(stats);
    run_unit_test_1133(stats);
    run_unit_test_1134(stats);
    run_unit_test_1135(stats);
    run_unit_test_1136(stats);
    run_unit_test_1137(stats);
    run_unit_test_1138(stats);
    run_unit_test_1139(stats);
    run_unit_test_1140(stats);
    run_unit_test_1141(stats);
    run_unit_test_1142(stats);
    run_unit_test_1143(stats);
    run_unit_test_1144(stats);
    run_unit_test_1145(stats);
    run_unit_test_1146(stats);
    run_unit_test_1147(stats);
    run_unit_test_1148(stats);
    run_unit_test_1149(stats);
    run_unit_test_1150(stats);
    run_unit_test_1151(stats);
    run_unit_test_1152(stats);
    run_unit_test_1153(stats);
    run_unit_test_1154(stats);
    run_unit_test_1155(stats);
    run_unit_test_1156(stats);
    run_unit_test_1157(stats);
    run_unit_test_1158(stats);
    run_unit_test_1159(stats);
    run_unit_test_1160(stats);
    run_unit_test_1161(stats);
    run_unit_test_1162(stats);
    run_unit_test_1163(stats);
    run_unit_test_1164(stats);
    run_unit_test_1165(stats);
    run_unit_test_1166(stats);
    run_unit_test_1167(stats);
    run_unit_test_1168(stats);
    run_unit_test_1169(stats);
    run_unit_test_1170(stats);
    run_unit_test_1171(stats);
    run_unit_test_1172(stats);
    run_unit_test_1173(stats);
    run_unit_test_1174(stats);
    run_unit_test_1175(stats);
    run_unit_test_1176(stats);
    run_unit_test_1177(stats);
    run_unit_test_1178(stats);
    run_unit_test_1179(stats);
    run_unit_test_1180(stats);
    run_unit_test_1181(stats);
    run_unit_test_1182(stats);
    run_unit_test_1183(stats);
    run_unit_test_1184(stats);
    run_unit_test_1185(stats);
    run_unit_test_1186(stats);
    run_unit_test_1187(stats);
    run_unit_test_1188(stats);
    run_unit_test_1189(stats);
    run_unit_test_1190(stats);
    run_unit_test_1191(stats);
    run_unit_test_1192(stats);
    run_unit_test_1193(stats);
    run_unit_test_1194(stats);
    run_unit_test_1195(stats);
    run_unit_test_1196(stats);
    run_unit_test_1197(stats);
    run_unit_test_1198(stats);
    run_unit_test_1199(stats);
}

static void run_test_batch_1200_to_1300(fsm_test_stats_t* stats) {
    run_unit_test_1200(stats);
    run_unit_test_1201(stats);
    run_unit_test_1202(stats);
    run_unit_test_1203(stats);
    run_unit_test_1204(stats);
    run_unit_test_1205(stats);
    run_unit_test_1206(stats);
    run_unit_test_1207(stats);
    run_unit_test_1208(stats);
    run_unit_test_1209(stats);
    run_unit_test_1210(stats);
    run_unit_test_1211(stats);
    run_unit_test_1212(stats);
    run_unit_test_1213(stats);
    run_unit_test_1214(stats);
    run_unit_test_1215(stats);
    run_unit_test_1216(stats);
    run_unit_test_1217(stats);
    run_unit_test_1218(stats);
    run_unit_test_1219(stats);
    run_unit_test_1220(stats);
    run_unit_test_1221(stats);
    run_unit_test_1222(stats);
    run_unit_test_1223(stats);
    run_unit_test_1224(stats);
    run_unit_test_1225(stats);
    run_unit_test_1226(stats);
    run_unit_test_1227(stats);
    run_unit_test_1228(stats);
    run_unit_test_1229(stats);
    run_unit_test_1230(stats);
    run_unit_test_1231(stats);
    run_unit_test_1232(stats);
    run_unit_test_1233(stats);
    run_unit_test_1234(stats);
    run_unit_test_1235(stats);
    run_unit_test_1236(stats);
    run_unit_test_1237(stats);
    run_unit_test_1238(stats);
    run_unit_test_1239(stats);
    run_unit_test_1240(stats);
    run_unit_test_1241(stats);
    run_unit_test_1242(stats);
    run_unit_test_1243(stats);
    run_unit_test_1244(stats);
    run_unit_test_1245(stats);
    run_unit_test_1246(stats);
    run_unit_test_1247(stats);
    run_unit_test_1248(stats);
    run_unit_test_1249(stats);
    run_unit_test_1250(stats);
    run_unit_test_1251(stats);
    run_unit_test_1252(stats);
    run_unit_test_1253(stats);
    run_unit_test_1254(stats);
    run_unit_test_1255(stats);
    run_unit_test_1256(stats);
    run_unit_test_1257(stats);
    run_unit_test_1258(stats);
    run_unit_test_1259(stats);
    run_unit_test_1260(stats);
    run_unit_test_1261(stats);
    run_unit_test_1262(stats);
    run_unit_test_1263(stats);
    run_unit_test_1264(stats);
    run_unit_test_1265(stats);
    run_unit_test_1266(stats);
    run_unit_test_1267(stats);
    run_unit_test_1268(stats);
    run_unit_test_1269(stats);
    run_unit_test_1270(stats);
    run_unit_test_1271(stats);
    run_unit_test_1272(stats);
    run_unit_test_1273(stats);
    run_unit_test_1274(stats);
    run_unit_test_1275(stats);
    run_unit_test_1276(stats);
    run_unit_test_1277(stats);
    run_unit_test_1278(stats);
    run_unit_test_1279(stats);
    run_unit_test_1280(stats);
    run_unit_test_1281(stats);
    run_unit_test_1282(stats);
    run_unit_test_1283(stats);
    run_unit_test_1284(stats);
    run_unit_test_1285(stats);
    run_unit_test_1286(stats);
    run_unit_test_1287(stats);
    run_unit_test_1288(stats);
    run_unit_test_1289(stats);
    run_unit_test_1290(stats);
    run_unit_test_1291(stats);
    run_unit_test_1292(stats);
    run_unit_test_1293(stats);
    run_unit_test_1294(stats);
    run_unit_test_1295(stats);
    run_unit_test_1296(stats);
    run_unit_test_1297(stats);
    run_unit_test_1298(stats);
    run_unit_test_1299(stats);
}

static void run_test_batch_1300_to_1400(fsm_test_stats_t* stats) {
    run_unit_test_1300(stats);
    run_unit_test_1301(stats);
    run_unit_test_1302(stats);
    run_unit_test_1303(stats);
    run_unit_test_1304(stats);
    run_unit_test_1305(stats);
    run_unit_test_1306(stats);
    run_unit_test_1307(stats);
    run_unit_test_1308(stats);
    run_unit_test_1309(stats);
    run_unit_test_1310(stats);
    run_unit_test_1311(stats);
    run_unit_test_1312(stats);
    run_unit_test_1313(stats);
    run_unit_test_1314(stats);
    run_unit_test_1315(stats);
    run_unit_test_1316(stats);
    run_unit_test_1317(stats);
    run_unit_test_1318(stats);
    run_unit_test_1319(stats);
    run_unit_test_1320(stats);
    run_unit_test_1321(stats);
    run_unit_test_1322(stats);
    run_unit_test_1323(stats);
    run_unit_test_1324(stats);
    run_unit_test_1325(stats);
    run_unit_test_1326(stats);
    run_unit_test_1327(stats);
    run_unit_test_1328(stats);
    run_unit_test_1329(stats);
    run_unit_test_1330(stats);
    run_unit_test_1331(stats);
    run_unit_test_1332(stats);
    run_unit_test_1333(stats);
    run_unit_test_1334(stats);
    run_unit_test_1335(stats);
    run_unit_test_1336(stats);
    run_unit_test_1337(stats);
    run_unit_test_1338(stats);
    run_unit_test_1339(stats);
    run_unit_test_1340(stats);
    run_unit_test_1341(stats);
    run_unit_test_1342(stats);
    run_unit_test_1343(stats);
    run_unit_test_1344(stats);
    run_unit_test_1345(stats);
    run_unit_test_1346(stats);
    run_unit_test_1347(stats);
    run_unit_test_1348(stats);
    run_unit_test_1349(stats);
    run_unit_test_1350(stats);
    run_unit_test_1351(stats);
    run_unit_test_1352(stats);
    run_unit_test_1353(stats);
    run_unit_test_1354(stats);
    run_unit_test_1355(stats);
    run_unit_test_1356(stats);
    run_unit_test_1357(stats);
    run_unit_test_1358(stats);
    run_unit_test_1359(stats);
    run_unit_test_1360(stats);
    run_unit_test_1361(stats);
    run_unit_test_1362(stats);
    run_unit_test_1363(stats);
    run_unit_test_1364(stats);
    run_unit_test_1365(stats);
    run_unit_test_1366(stats);
    run_unit_test_1367(stats);
    run_unit_test_1368(stats);
    run_unit_test_1369(stats);
    run_unit_test_1370(stats);
    run_unit_test_1371(stats);
    run_unit_test_1372(stats);
    run_unit_test_1373(stats);
    run_unit_test_1374(stats);
    run_unit_test_1375(stats);
    run_unit_test_1376(stats);
    run_unit_test_1377(stats);
    run_unit_test_1378(stats);
    run_unit_test_1379(stats);
    run_unit_test_1380(stats);
    run_unit_test_1381(stats);
    run_unit_test_1382(stats);
    run_unit_test_1383(stats);
    run_unit_test_1384(stats);
    run_unit_test_1385(stats);
    run_unit_test_1386(stats);
    run_unit_test_1387(stats);
    run_unit_test_1388(stats);
    run_unit_test_1389(stats);
    run_unit_test_1390(stats);
    run_unit_test_1391(stats);
    run_unit_test_1392(stats);
    run_unit_test_1393(stats);
    run_unit_test_1394(stats);
    run_unit_test_1395(stats);
    run_unit_test_1396(stats);
    run_unit_test_1397(stats);
    run_unit_test_1398(stats);
    run_unit_test_1399(stats);
}

static void run_test_batch_1400_to_1500(fsm_test_stats_t* stats) {
    run_unit_test_1400(stats);
    run_unit_test_1401(stats);
    run_unit_test_1402(stats);
    run_unit_test_1403(stats);
    run_unit_test_1404(stats);
    run_unit_test_1405(stats);
    run_unit_test_1406(stats);
    run_unit_test_1407(stats);
    run_unit_test_1408(stats);
    run_unit_test_1409(stats);
    run_unit_test_1410(stats);
    run_unit_test_1411(stats);
    run_unit_test_1412(stats);
    run_unit_test_1413(stats);
    run_unit_test_1414(stats);
    run_unit_test_1415(stats);
    run_unit_test_1416(stats);
    run_unit_test_1417(stats);
    run_unit_test_1418(stats);
    run_unit_test_1419(stats);
    run_unit_test_1420(stats);
    run_unit_test_1421(stats);
    run_unit_test_1422(stats);
    run_unit_test_1423(stats);
    run_unit_test_1424(stats);
    run_unit_test_1425(stats);
    run_unit_test_1426(stats);
    run_unit_test_1427(stats);
    run_unit_test_1428(stats);
    run_unit_test_1429(stats);
    run_unit_test_1430(stats);
    run_unit_test_1431(stats);
    run_unit_test_1432(stats);
    run_unit_test_1433(stats);
    run_unit_test_1434(stats);
    run_unit_test_1435(stats);
    run_unit_test_1436(stats);
    run_unit_test_1437(stats);
    run_unit_test_1438(stats);
    run_unit_test_1439(stats);
    run_unit_test_1440(stats);
    run_unit_test_1441(stats);
    run_unit_test_1442(stats);
    run_unit_test_1443(stats);
    run_unit_test_1444(stats);
    run_unit_test_1445(stats);
    run_unit_test_1446(stats);
    run_unit_test_1447(stats);
    run_unit_test_1448(stats);
    run_unit_test_1449(stats);
    run_unit_test_1450(stats);
    run_unit_test_1451(stats);
    run_unit_test_1452(stats);
    run_unit_test_1453(stats);
    run_unit_test_1454(stats);
    run_unit_test_1455(stats);
    run_unit_test_1456(stats);
    run_unit_test_1457(stats);
    run_unit_test_1458(stats);
    run_unit_test_1459(stats);
    run_unit_test_1460(stats);
    run_unit_test_1461(stats);
    run_unit_test_1462(stats);
    run_unit_test_1463(stats);
    run_unit_test_1464(stats);
    run_unit_test_1465(stats);
    run_unit_test_1466(stats);
    run_unit_test_1467(stats);
    run_unit_test_1468(stats);
    run_unit_test_1469(stats);
    run_unit_test_1470(stats);
    run_unit_test_1471(stats);
    run_unit_test_1472(stats);
    run_unit_test_1473(stats);
    run_unit_test_1474(stats);
    run_unit_test_1475(stats);
    run_unit_test_1476(stats);
    run_unit_test_1477(stats);
    run_unit_test_1478(stats);
    run_unit_test_1479(stats);
    run_unit_test_1480(stats);
    run_unit_test_1481(stats);
    run_unit_test_1482(stats);
    run_unit_test_1483(stats);
    run_unit_test_1484(stats);
    run_unit_test_1485(stats);
    run_unit_test_1486(stats);
    run_unit_test_1487(stats);
    run_unit_test_1488(stats);
    run_unit_test_1489(stats);
    run_unit_test_1490(stats);
    run_unit_test_1491(stats);
    run_unit_test_1492(stats);
    run_unit_test_1493(stats);
    run_unit_test_1494(stats);
    run_unit_test_1495(stats);
    run_unit_test_1496(stats);
    run_unit_test_1497(stats);
    run_unit_test_1498(stats);
    run_unit_test_1499(stats);
}

static void run_test_batch_1500_to_1600(fsm_test_stats_t* stats) {
    run_unit_test_1500(stats);
    run_unit_test_1501(stats);
    run_unit_test_1502(stats);
    run_unit_test_1503(stats);
    run_unit_test_1504(stats);
    run_unit_test_1505(stats);
    run_unit_test_1506(stats);
    run_unit_test_1507(stats);
    run_unit_test_1508(stats);
    run_unit_test_1509(stats);
    run_unit_test_1510(stats);
    run_unit_test_1511(stats);
    run_unit_test_1512(stats);
    run_unit_test_1513(stats);
    run_unit_test_1514(stats);
    run_unit_test_1515(stats);
    run_unit_test_1516(stats);
    run_unit_test_1517(stats);
    run_unit_test_1518(stats);
    run_unit_test_1519(stats);
    run_unit_test_1520(stats);
    run_unit_test_1521(stats);
    run_unit_test_1522(stats);
    run_unit_test_1523(stats);
    run_unit_test_1524(stats);
    run_unit_test_1525(stats);
    run_unit_test_1526(stats);
    run_unit_test_1527(stats);
    run_unit_test_1528(stats);
    run_unit_test_1529(stats);
    run_unit_test_1530(stats);
    run_unit_test_1531(stats);
    run_unit_test_1532(stats);
    run_unit_test_1533(stats);
    run_unit_test_1534(stats);
    run_unit_test_1535(stats);
    run_unit_test_1536(stats);
    run_unit_test_1537(stats);
    run_unit_test_1538(stats);
    run_unit_test_1539(stats);
    run_unit_test_1540(stats);
    run_unit_test_1541(stats);
    run_unit_test_1542(stats);
    run_unit_test_1543(stats);
    run_unit_test_1544(stats);
    run_unit_test_1545(stats);
    run_unit_test_1546(stats);
    run_unit_test_1547(stats);
    run_unit_test_1548(stats);
    run_unit_test_1549(stats);
    run_unit_test_1550(stats);
    run_unit_test_1551(stats);
    run_unit_test_1552(stats);
    run_unit_test_1553(stats);
    run_unit_test_1554(stats);
    run_unit_test_1555(stats);
    run_unit_test_1556(stats);
    run_unit_test_1557(stats);
    run_unit_test_1558(stats);
    run_unit_test_1559(stats);
    run_unit_test_1560(stats);
    run_unit_test_1561(stats);
    run_unit_test_1562(stats);
    run_unit_test_1563(stats);
    run_unit_test_1564(stats);
    run_unit_test_1565(stats);
    run_unit_test_1566(stats);
    run_unit_test_1567(stats);
    run_unit_test_1568(stats);
    run_unit_test_1569(stats);
    run_unit_test_1570(stats);
    run_unit_test_1571(stats);
    run_unit_test_1572(stats);
    run_unit_test_1573(stats);
    run_unit_test_1574(stats);
    run_unit_test_1575(stats);
    run_unit_test_1576(stats);
    run_unit_test_1577(stats);
    run_unit_test_1578(stats);
    run_unit_test_1579(stats);
    run_unit_test_1580(stats);
    run_unit_test_1581(stats);
    run_unit_test_1582(stats);
    run_unit_test_1583(stats);
    run_unit_test_1584(stats);
    run_unit_test_1585(stats);
    run_unit_test_1586(stats);
    run_unit_test_1587(stats);
    run_unit_test_1588(stats);
    run_unit_test_1589(stats);
    run_unit_test_1590(stats);
    run_unit_test_1591(stats);
    run_unit_test_1592(stats);
    run_unit_test_1593(stats);
    run_unit_test_1594(stats);
    run_unit_test_1595(stats);
    run_unit_test_1596(stats);
    run_unit_test_1597(stats);
    run_unit_test_1598(stats);
    run_unit_test_1599(stats);
}

static void run_test_batch_1600_to_1700(fsm_test_stats_t* stats) {
    run_unit_test_1600(stats);
    run_unit_test_1601(stats);
    run_unit_test_1602(stats);
    run_unit_test_1603(stats);
    run_unit_test_1604(stats);
    run_unit_test_1605(stats);
    run_unit_test_1606(stats);
    run_unit_test_1607(stats);
    run_unit_test_1608(stats);
    run_unit_test_1609(stats);
    run_unit_test_1610(stats);
    run_unit_test_1611(stats);
    run_unit_test_1612(stats);
    run_unit_test_1613(stats);
    run_unit_test_1614(stats);
    run_unit_test_1615(stats);
    run_unit_test_1616(stats);
    run_unit_test_1617(stats);
    run_unit_test_1618(stats);
    run_unit_test_1619(stats);
    run_unit_test_1620(stats);
    run_unit_test_1621(stats);
    run_unit_test_1622(stats);
    run_unit_test_1623(stats);
    run_unit_test_1624(stats);
    run_unit_test_1625(stats);
    run_unit_test_1626(stats);
    run_unit_test_1627(stats);
    run_unit_test_1628(stats);
    run_unit_test_1629(stats);
    run_unit_test_1630(stats);
    run_unit_test_1631(stats);
    run_unit_test_1632(stats);
    run_unit_test_1633(stats);
    run_unit_test_1634(stats);
    run_unit_test_1635(stats);
    run_unit_test_1636(stats);
    run_unit_test_1637(stats);
    run_unit_test_1638(stats);
    run_unit_test_1639(stats);
    run_unit_test_1640(stats);
    run_unit_test_1641(stats);
    run_unit_test_1642(stats);
    run_unit_test_1643(stats);
    run_unit_test_1644(stats);
    run_unit_test_1645(stats);
    run_unit_test_1646(stats);
    run_unit_test_1647(stats);
    run_unit_test_1648(stats);
    run_unit_test_1649(stats);
    run_unit_test_1650(stats);
    run_unit_test_1651(stats);
    run_unit_test_1652(stats);
    run_unit_test_1653(stats);
    run_unit_test_1654(stats);
    run_unit_test_1655(stats);
    run_unit_test_1656(stats);
    run_unit_test_1657(stats);
    run_unit_test_1658(stats);
    run_unit_test_1659(stats);
    run_unit_test_1660(stats);
    run_unit_test_1661(stats);
    run_unit_test_1662(stats);
    run_unit_test_1663(stats);
    run_unit_test_1664(stats);
    run_unit_test_1665(stats);
    run_unit_test_1666(stats);
    run_unit_test_1667(stats);
    run_unit_test_1668(stats);
    run_unit_test_1669(stats);
    run_unit_test_1670(stats);
    run_unit_test_1671(stats);
    run_unit_test_1672(stats);
    run_unit_test_1673(stats);
    run_unit_test_1674(stats);
    run_unit_test_1675(stats);
    run_unit_test_1676(stats);
    run_unit_test_1677(stats);
    run_unit_test_1678(stats);
    run_unit_test_1679(stats);
    run_unit_test_1680(stats);
    run_unit_test_1681(stats);
    run_unit_test_1682(stats);
    run_unit_test_1683(stats);
    run_unit_test_1684(stats);
    run_unit_test_1685(stats);
    run_unit_test_1686(stats);
    run_unit_test_1687(stats);
    run_unit_test_1688(stats);
    run_unit_test_1689(stats);
    run_unit_test_1690(stats);
    run_unit_test_1691(stats);
    run_unit_test_1692(stats);
    run_unit_test_1693(stats);
    run_unit_test_1694(stats);
    run_unit_test_1695(stats);
    run_unit_test_1696(stats);
    run_unit_test_1697(stats);
    run_unit_test_1698(stats);
    run_unit_test_1699(stats);
}

static void run_test_batch_1700_to_1800(fsm_test_stats_t* stats) {
    run_unit_test_1700(stats);
    run_unit_test_1701(stats);
    run_unit_test_1702(stats);
    run_unit_test_1703(stats);
    run_unit_test_1704(stats);
    run_unit_test_1705(stats);
    run_unit_test_1706(stats);
    run_unit_test_1707(stats);
    run_unit_test_1708(stats);
    run_unit_test_1709(stats);
    run_unit_test_1710(stats);
    run_unit_test_1711(stats);
    run_unit_test_1712(stats);
    run_unit_test_1713(stats);
    run_unit_test_1714(stats);
    run_unit_test_1715(stats);
    run_unit_test_1716(stats);
    run_unit_test_1717(stats);
    run_unit_test_1718(stats);
    run_unit_test_1719(stats);
    run_unit_test_1720(stats);
    run_unit_test_1721(stats);
    run_unit_test_1722(stats);
    run_unit_test_1723(stats);
    run_unit_test_1724(stats);
    run_unit_test_1725(stats);
    run_unit_test_1726(stats);
    run_unit_test_1727(stats);
    run_unit_test_1728(stats);
    run_unit_test_1729(stats);
    run_unit_test_1730(stats);
    run_unit_test_1731(stats);
    run_unit_test_1732(stats);
    run_unit_test_1733(stats);
    run_unit_test_1734(stats);
    run_unit_test_1735(stats);
    run_unit_test_1736(stats);
    run_unit_test_1737(stats);
    run_unit_test_1738(stats);
    run_unit_test_1739(stats);
    run_unit_test_1740(stats);
    run_unit_test_1741(stats);
    run_unit_test_1742(stats);
    run_unit_test_1743(stats);
    run_unit_test_1744(stats);
    run_unit_test_1745(stats);
    run_unit_test_1746(stats);
    run_unit_test_1747(stats);
    run_unit_test_1748(stats);
    run_unit_test_1749(stats);
    run_unit_test_1750(stats);
    run_unit_test_1751(stats);
    run_unit_test_1752(stats);
    run_unit_test_1753(stats);
    run_unit_test_1754(stats);
    run_unit_test_1755(stats);
    run_unit_test_1756(stats);
    run_unit_test_1757(stats);
    run_unit_test_1758(stats);
    run_unit_test_1759(stats);
    run_unit_test_1760(stats);
    run_unit_test_1761(stats);
    run_unit_test_1762(stats);
    run_unit_test_1763(stats);
    run_unit_test_1764(stats);
    run_unit_test_1765(stats);
    run_unit_test_1766(stats);
    run_unit_test_1767(stats);
    run_unit_test_1768(stats);
    run_unit_test_1769(stats);
    run_unit_test_1770(stats);
    run_unit_test_1771(stats);
    run_unit_test_1772(stats);
    run_unit_test_1773(stats);
    run_unit_test_1774(stats);
    run_unit_test_1775(stats);
    run_unit_test_1776(stats);
    run_unit_test_1777(stats);
    run_unit_test_1778(stats);
    run_unit_test_1779(stats);
    run_unit_test_1780(stats);
    run_unit_test_1781(stats);
    run_unit_test_1782(stats);
    run_unit_test_1783(stats);
    run_unit_test_1784(stats);
    run_unit_test_1785(stats);
    run_unit_test_1786(stats);
    run_unit_test_1787(stats);
    run_unit_test_1788(stats);
    run_unit_test_1789(stats);
    run_unit_test_1790(stats);
    run_unit_test_1791(stats);
    run_unit_test_1792(stats);
    run_unit_test_1793(stats);
    run_unit_test_1794(stats);
    run_unit_test_1795(stats);
    run_unit_test_1796(stats);
    run_unit_test_1797(stats);
    run_unit_test_1798(stats);
    run_unit_test_1799(stats);
}

static void run_test_batch_1800_to_1900(fsm_test_stats_t* stats) {
    run_unit_test_1800(stats);
    run_unit_test_1801(stats);
    run_unit_test_1802(stats);
    run_unit_test_1803(stats);
    run_unit_test_1804(stats);
    run_unit_test_1805(stats);
    run_unit_test_1806(stats);
    run_unit_test_1807(stats);
    run_unit_test_1808(stats);
    run_unit_test_1809(stats);
    run_unit_test_1810(stats);
    run_unit_test_1811(stats);
    run_unit_test_1812(stats);
    run_unit_test_1813(stats);
    run_unit_test_1814(stats);
    run_unit_test_1815(stats);
    run_unit_test_1816(stats);
    run_unit_test_1817(stats);
    run_unit_test_1818(stats);
    run_unit_test_1819(stats);
    run_unit_test_1820(stats);
    run_unit_test_1821(stats);
    run_unit_test_1822(stats);
    run_unit_test_1823(stats);
    run_unit_test_1824(stats);
    run_unit_test_1825(stats);
    run_unit_test_1826(stats);
    run_unit_test_1827(stats);
    run_unit_test_1828(stats);
    run_unit_test_1829(stats);
    run_unit_test_1830(stats);
    run_unit_test_1831(stats);
    run_unit_test_1832(stats);
    run_unit_test_1833(stats);
    run_unit_test_1834(stats);
    run_unit_test_1835(stats);
    run_unit_test_1836(stats);
    run_unit_test_1837(stats);
    run_unit_test_1838(stats);
    run_unit_test_1839(stats);
    run_unit_test_1840(stats);
    run_unit_test_1841(stats);
    run_unit_test_1842(stats);
    run_unit_test_1843(stats);
    run_unit_test_1844(stats);
    run_unit_test_1845(stats);
    run_unit_test_1846(stats);
    run_unit_test_1847(stats);
    run_unit_test_1848(stats);
    run_unit_test_1849(stats);
    run_unit_test_1850(stats);
    run_unit_test_1851(stats);
    run_unit_test_1852(stats);
    run_unit_test_1853(stats);
    run_unit_test_1854(stats);
    run_unit_test_1855(stats);
    run_unit_test_1856(stats);
    run_unit_test_1857(stats);
    run_unit_test_1858(stats);
    run_unit_test_1859(stats);
    run_unit_test_1860(stats);
    run_unit_test_1861(stats);
    run_unit_test_1862(stats);
    run_unit_test_1863(stats);
    run_unit_test_1864(stats);
    run_unit_test_1865(stats);
    run_unit_test_1866(stats);
    run_unit_test_1867(stats);
    run_unit_test_1868(stats);
    run_unit_test_1869(stats);
    run_unit_test_1870(stats);
    run_unit_test_1871(stats);
    run_unit_test_1872(stats);
    run_unit_test_1873(stats);
    run_unit_test_1874(stats);
    run_unit_test_1875(stats);
    run_unit_test_1876(stats);
    run_unit_test_1877(stats);
    run_unit_test_1878(stats);
    run_unit_test_1879(stats);
    run_unit_test_1880(stats);
    run_unit_test_1881(stats);
    run_unit_test_1882(stats);
    run_unit_test_1883(stats);
    run_unit_test_1884(stats);
    run_unit_test_1885(stats);
    run_unit_test_1886(stats);
    run_unit_test_1887(stats);
    run_unit_test_1888(stats);
    run_unit_test_1889(stats);
    run_unit_test_1890(stats);
    run_unit_test_1891(stats);
    run_unit_test_1892(stats);
    run_unit_test_1893(stats);
    run_unit_test_1894(stats);
    run_unit_test_1895(stats);
    run_unit_test_1896(stats);
    run_unit_test_1897(stats);
    run_unit_test_1898(stats);
    run_unit_test_1899(stats);
}

static void run_test_batch_1900_to_2000(fsm_test_stats_t* stats) {
    run_unit_test_1900(stats);
    run_unit_test_1901(stats);
    run_unit_test_1902(stats);
    run_unit_test_1903(stats);
    run_unit_test_1904(stats);
    run_unit_test_1905(stats);
    run_unit_test_1906(stats);
    run_unit_test_1907(stats);
    run_unit_test_1908(stats);
    run_unit_test_1909(stats);
    run_unit_test_1910(stats);
    run_unit_test_1911(stats);
    run_unit_test_1912(stats);
    run_unit_test_1913(stats);
    run_unit_test_1914(stats);
    run_unit_test_1915(stats);
    run_unit_test_1916(stats);
    run_unit_test_1917(stats);
    run_unit_test_1918(stats);
    run_unit_test_1919(stats);
    run_unit_test_1920(stats);
    run_unit_test_1921(stats);
    run_unit_test_1922(stats);
    run_unit_test_1923(stats);
    run_unit_test_1924(stats);
    run_unit_test_1925(stats);
    run_unit_test_1926(stats);
    run_unit_test_1927(stats);
    run_unit_test_1928(stats);
    run_unit_test_1929(stats);
    run_unit_test_1930(stats);
    run_unit_test_1931(stats);
    run_unit_test_1932(stats);
    run_unit_test_1933(stats);
    run_unit_test_1934(stats);
    run_unit_test_1935(stats);
    run_unit_test_1936(stats);
    run_unit_test_1937(stats);
    run_unit_test_1938(stats);
    run_unit_test_1939(stats);
    run_unit_test_1940(stats);
    run_unit_test_1941(stats);
    run_unit_test_1942(stats);
    run_unit_test_1943(stats);
    run_unit_test_1944(stats);
    run_unit_test_1945(stats);
    run_unit_test_1946(stats);
    run_unit_test_1947(stats);
    run_unit_test_1948(stats);
    run_unit_test_1949(stats);
    run_unit_test_1950(stats);
    run_unit_test_1951(stats);
    run_unit_test_1952(stats);
    run_unit_test_1953(stats);
    run_unit_test_1954(stats);
    run_unit_test_1955(stats);
    run_unit_test_1956(stats);
    run_unit_test_1957(stats);
    run_unit_test_1958(stats);
    run_unit_test_1959(stats);
    run_unit_test_1960(stats);
    run_unit_test_1961(stats);
    run_unit_test_1962(stats);
    run_unit_test_1963(stats);
    run_unit_test_1964(stats);
    run_unit_test_1965(stats);
    run_unit_test_1966(stats);
    run_unit_test_1967(stats);
    run_unit_test_1968(stats);
    run_unit_test_1969(stats);
    run_unit_test_1970(stats);
    run_unit_test_1971(stats);
    run_unit_test_1972(stats);
    run_unit_test_1973(stats);
    run_unit_test_1974(stats);
    run_unit_test_1975(stats);
    run_unit_test_1976(stats);
    run_unit_test_1977(stats);
    run_unit_test_1978(stats);
    run_unit_test_1979(stats);
    run_unit_test_1980(stats);
    run_unit_test_1981(stats);
    run_unit_test_1982(stats);
    run_unit_test_1983(stats);
    run_unit_test_1984(stats);
    run_unit_test_1985(stats);
    run_unit_test_1986(stats);
    run_unit_test_1987(stats);
    run_unit_test_1988(stats);
    run_unit_test_1989(stats);
    run_unit_test_1990(stats);
    run_unit_test_1991(stats);
    run_unit_test_1992(stats);
    run_unit_test_1993(stats);
    run_unit_test_1994(stats);
    run_unit_test_1995(stats);
    run_unit_test_1996(stats);
    run_unit_test_1997(stats);
    run_unit_test_1998(stats);
    run_unit_test_1999(stats);
}

static void run_test_batch_2000_to_2100(fsm_test_stats_t* stats) {
    run_unit_test_2000(stats);
    run_unit_test_2001(stats);
    run_unit_test_2002(stats);
    run_unit_test_2003(stats);
    run_unit_test_2004(stats);
    run_unit_test_2005(stats);
    run_unit_test_2006(stats);
    run_unit_test_2007(stats);
    run_unit_test_2008(stats);
    run_unit_test_2009(stats);
    run_unit_test_2010(stats);
    run_unit_test_2011(stats);
    run_unit_test_2012(stats);
    run_unit_test_2013(stats);
    run_unit_test_2014(stats);
    run_unit_test_2015(stats);
    run_unit_test_2016(stats);
    run_unit_test_2017(stats);
    run_unit_test_2018(stats);
    run_unit_test_2019(stats);
    run_unit_test_2020(stats);
    run_unit_test_2021(stats);
    run_unit_test_2022(stats);
    run_unit_test_2023(stats);
    run_unit_test_2024(stats);
    run_unit_test_2025(stats);
    run_unit_test_2026(stats);
    run_unit_test_2027(stats);
    run_unit_test_2028(stats);
    run_unit_test_2029(stats);
    run_unit_test_2030(stats);
    run_unit_test_2031(stats);
    run_unit_test_2032(stats);
    run_unit_test_2033(stats);
    run_unit_test_2034(stats);
    run_unit_test_2035(stats);
    run_unit_test_2036(stats);
    run_unit_test_2037(stats);
    run_unit_test_2038(stats);
    run_unit_test_2039(stats);
    run_unit_test_2040(stats);
    run_unit_test_2041(stats);
    run_unit_test_2042(stats);
    run_unit_test_2043(stats);
    run_unit_test_2044(stats);
    run_unit_test_2045(stats);
    run_unit_test_2046(stats);
    run_unit_test_2047(stats);
    run_unit_test_2048(stats);
    run_unit_test_2049(stats);
    run_unit_test_2050(stats);
    run_unit_test_2051(stats);
    run_unit_test_2052(stats);
    run_unit_test_2053(stats);
    run_unit_test_2054(stats);
    run_unit_test_2055(stats);
    run_unit_test_2056(stats);
    run_unit_test_2057(stats);
    run_unit_test_2058(stats);
    run_unit_test_2059(stats);
    run_unit_test_2060(stats);
    run_unit_test_2061(stats);
    run_unit_test_2062(stats);
    run_unit_test_2063(stats);
    run_unit_test_2064(stats);
    run_unit_test_2065(stats);
    run_unit_test_2066(stats);
    run_unit_test_2067(stats);
    run_unit_test_2068(stats);
    run_unit_test_2069(stats);
    run_unit_test_2070(stats);
    run_unit_test_2071(stats);
    run_unit_test_2072(stats);
    run_unit_test_2073(stats);
    run_unit_test_2074(stats);
    run_unit_test_2075(stats);
    run_unit_test_2076(stats);
    run_unit_test_2077(stats);
    run_unit_test_2078(stats);
    run_unit_test_2079(stats);
    run_unit_test_2080(stats);
    run_unit_test_2081(stats);
    run_unit_test_2082(stats);
    run_unit_test_2083(stats);
    run_unit_test_2084(stats);
    run_unit_test_2085(stats);
    run_unit_test_2086(stats);
    run_unit_test_2087(stats);
    run_unit_test_2088(stats);
    run_unit_test_2089(stats);
    run_unit_test_2090(stats);
    run_unit_test_2091(stats);
    run_unit_test_2092(stats);
    run_unit_test_2093(stats);
    run_unit_test_2094(stats);
    run_unit_test_2095(stats);
    run_unit_test_2096(stats);
    run_unit_test_2097(stats);
    run_unit_test_2098(stats);
    run_unit_test_2099(stats);
}

static void run_test_batch_2100_to_2200(fsm_test_stats_t* stats) {
    run_unit_test_2100(stats);
    run_unit_test_2101(stats);
    run_unit_test_2102(stats);
    run_unit_test_2103(stats);
    run_unit_test_2104(stats);
    run_unit_test_2105(stats);
    run_unit_test_2106(stats);
    run_unit_test_2107(stats);
    run_unit_test_2108(stats);
    run_unit_test_2109(stats);
    run_unit_test_2110(stats);
    run_unit_test_2111(stats);
    run_unit_test_2112(stats);
    run_unit_test_2113(stats);
    run_unit_test_2114(stats);
    run_unit_test_2115(stats);
    run_unit_test_2116(stats);
    run_unit_test_2117(stats);
    run_unit_test_2118(stats);
    run_unit_test_2119(stats);
    run_unit_test_2120(stats);
    run_unit_test_2121(stats);
    run_unit_test_2122(stats);
    run_unit_test_2123(stats);
    run_unit_test_2124(stats);
    run_unit_test_2125(stats);
    run_unit_test_2126(stats);
    run_unit_test_2127(stats);
    run_unit_test_2128(stats);
    run_unit_test_2129(stats);
    run_unit_test_2130(stats);
    run_unit_test_2131(stats);
    run_unit_test_2132(stats);
    run_unit_test_2133(stats);
    run_unit_test_2134(stats);
    run_unit_test_2135(stats);
    run_unit_test_2136(stats);
    run_unit_test_2137(stats);
    run_unit_test_2138(stats);
    run_unit_test_2139(stats);
    run_unit_test_2140(stats);
    run_unit_test_2141(stats);
    run_unit_test_2142(stats);
    run_unit_test_2143(stats);
    run_unit_test_2144(stats);
    run_unit_test_2145(stats);
    run_unit_test_2146(stats);
    run_unit_test_2147(stats);
    run_unit_test_2148(stats);
    run_unit_test_2149(stats);
    run_unit_test_2150(stats);
    run_unit_test_2151(stats);
    run_unit_test_2152(stats);
    run_unit_test_2153(stats);
    run_unit_test_2154(stats);
    run_unit_test_2155(stats);
    run_unit_test_2156(stats);
    run_unit_test_2157(stats);
    run_unit_test_2158(stats);
    run_unit_test_2159(stats);
    run_unit_test_2160(stats);
    run_unit_test_2161(stats);
    run_unit_test_2162(stats);
    run_unit_test_2163(stats);
    run_unit_test_2164(stats);
    run_unit_test_2165(stats);
    run_unit_test_2166(stats);
    run_unit_test_2167(stats);
    run_unit_test_2168(stats);
    run_unit_test_2169(stats);
    run_unit_test_2170(stats);
    run_unit_test_2171(stats);
    run_unit_test_2172(stats);
    run_unit_test_2173(stats);
    run_unit_test_2174(stats);
    run_unit_test_2175(stats);
    run_unit_test_2176(stats);
    run_unit_test_2177(stats);
    run_unit_test_2178(stats);
    run_unit_test_2179(stats);
    run_unit_test_2180(stats);
    run_unit_test_2181(stats);
    run_unit_test_2182(stats);
    run_unit_test_2183(stats);
    run_unit_test_2184(stats);
    run_unit_test_2185(stats);
    run_unit_test_2186(stats);
    run_unit_test_2187(stats);
    run_unit_test_2188(stats);
    run_unit_test_2189(stats);
    run_unit_test_2190(stats);
    run_unit_test_2191(stats);
    run_unit_test_2192(stats);
    run_unit_test_2193(stats);
    run_unit_test_2194(stats);
    run_unit_test_2195(stats);
    run_unit_test_2196(stats);
    run_unit_test_2197(stats);
    run_unit_test_2198(stats);
    run_unit_test_2199(stats);
}


#include "../compute_balancer.h"

#if defined(_WIN32)
typedef HANDLE thread_t;
#define thread_create(t, fn, arg) (*t = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)fn, arg, 0, NULL), *t != NULL)
#define thread_join(t) (WaitForSingleObject(t, INFINITE), CloseHandle(t))
#else
typedef pthread_t thread_t;
#define thread_create(t, fn, arg) (pthread_create(t, NULL, fn, arg) == 0)
#define thread_join(t) pthread_join(t)
#endif

typedef void (*test_batch_fn_t)(fsm_test_stats_t*);
static const test_batch_fn_t g_test_batches[] = {

    run_test_batch_0_to_100,
    run_test_batch_100_to_200,
    run_test_batch_200_to_300,
    run_test_batch_300_to_400,
    run_test_batch_400_to_500,
    run_test_batch_500_to_600,
    run_test_batch_600_to_700,
    run_test_batch_700_to_800,
    run_test_batch_800_to_900,
    run_test_batch_900_to_1000,
    run_test_batch_1000_to_1100,
    run_test_batch_1100_to_1200,
    run_test_batch_1200_to_1300,
    run_test_batch_1300_to_1400,
    run_test_batch_1400_to_1500,
    run_test_batch_1500_to_1600,
    run_test_batch_1600_to_1700,
    run_test_batch_1700_to_1800,
    run_test_batch_1800_to_1900,
    run_test_batch_1900_to_2000,
    run_test_batch_2000_to_2100,
    run_test_batch_2100_to_2200,
};

typedef struct {
    int thread_id;
    fsm_test_stats_t stats;
} thread_arg_t;

#if defined(_WIN32)
DWORD WINAPI worker_thread_func(LPVOID lpParam) {
    thread_arg_t* arg = (thread_arg_t*)lpParam;
    pin_current_thread(arg->thread_id);
    int num_threads = get_core_count();
    if (num_threads < 1) num_threads = 1;
    if (num_threads > 22) num_threads = 22; // 22 batches total
    for (int b = arg->thread_id * 100; b < 2200; b += num_threads * 100) {
        g_test_batches[b / 100](&arg->stats);
        paced_sleep(1);
    }
    return 0;
}
#else
void* worker_thread_func(void* lpParam) {
    thread_arg_t* arg = (thread_arg_t*)lpParam;
    pin_current_thread(arg->thread_id);
    int num_threads = get_core_count();
    if (num_threads < 1) num_threads = 1;
    if (num_threads > 22) num_threads = 22;
    for (int b = arg->thread_id * 100; b < 2200; b += num_threads * 100) {
        g_test_batches[b / 100](&arg->stats);
        paced_sleep(1);
    }
    return NULL;
}
#endif

static void run_all_generated_fsm_tests(void) {
    int num_threads = get_core_count();
    if (num_threads < 1) num_threads = 1;
    if (num_threads > 22) num_threads = 22;

    thread_arg_t args[22];
    thread_t threads[22];

    for (int t = 0; t < num_threads; t++) {
        args[t].thread_id = t;
        memset(&args[t].stats, 0, sizeof(fsm_test_stats_t));
        thread_create(&threads[t], worker_thread_func, &args[t]);
    }

    for (int t = 0; t < num_threads; t++) {
        thread_join(threads[t]);
        g_stats.total_count += args[t].stats.total_count;
        g_stats.passed_count += args[t].stats.passed_count;
        g_stats.failed_count += args[t].stats.failed_count;
    }
}


// Numerical Telemetry Wave Simulator Functions
void init_wave_sim(wave_sim_t *sim) {
    memset(sim->phi, 0, sizeof(sim->phi));
    memset(sim->phi_prev, 0, sizeof(sim->phi_prev));
    memset(sim->phi_next, 0, sizeof(sim->phi_next));
    sim->source_amplitude = 0.0f;
    sim->step = 0;
}

void step_wave_sim_coupled(wave_sim_t *sim, float dt, int d_p_prime) {
    int i;
    float r2 = WAVE_COURANT * WAVE_COURANT;
    int source_idx = WAVE_GRID_SIZE / 2;
    float time;
    
    // Telemetry Edge Case Check: Zero or Negative Time step
    if (dt <= 0.0f) {
        printf("  [WARNING] Telemetry query step bypassed: dt must be positive (Received: %f)\n", dt);
        return;
    }

    time = sim->step * dt;
    sim->source_amplitude = sinf(WAVE_OMEGA * time);

    // FDTD Discrete numerical steps
    for (i = 1; i < WAVE_GRID_SIZE - 1; i++) {
        float laplacian = sim->phi[i + 1] - 2.0f * sim->phi[i] + sim->phi[i - 1];
        sim->phi_next[i] = 2.0f * sim->phi[i] - sim->phi_prev[i] + r2 * laplacian;
        
        // Telemetry Edge Case Check: Check for numerical overflow / divergence (NaN / Inf)
        // using standard comparisons (value != value detects NaN; absolute value > 1e9f detects overflow/inf)
        if (sim->phi_next[i] != sim->phi_next[i] || sim->phi_next[i] > 1e9f || sim->phi_next[i] < -1e9f) {
            printf("  [CRITICAL] Numerical divergence detected in telemetry wave. Auto-healing state to zero...\n");
            init_wave_sim(sim);
            return;
        }
    }

    // Source driving term: sinusoidal heartbeat plus violation shock pulse if validation fails
    sim->phi_next[source_idx] += dt * dt * sim->source_amplitude * 10.0f;
    if (d_p_prime == 0) {
        printf("  [VIOLATION] State-transition check failed (D_P' = 0)! Injecting high-amplitude shock wave...\n");
        sim->phi_next[source_idx] += dt * dt * 100.0f; // huge anomaly pulse
    }

    // Dirichlet boundary conditions (zero clamp at edges)
    sim->phi_next[0] = 0.0f;
    sim->phi_next[WAVE_GRID_SIZE - 1] = 0.0f;

    // Swap buffers
    memcpy(sim->phi_prev, sim->phi, sizeof(sim->phi));
    memcpy(sim->phi, sim->phi_next, sizeof(sim->phi));
    
    sim->step++;
}

void step_wave_sim(wave_sim_t *sim, float dt) {
    step_wave_sim_coupled(sim, dt, 1);
}

void print_wave_profile(const wave_sim_t *sim) {
    int i, j;
    const int height = 11;
    const int mid_y = height / 2;
    char display[11][WAVE_GRID_SIZE + 1];

    for (i = 0; i < height; i++) {
        for (j = 0; j < WAVE_GRID_SIZE; j++) {
            if (i == mid_y) {
                display[i][j] = '-';
            } else {
                display[i][j] = ' ';
            }
        }
        display[i][WAVE_GRID_SIZE] = '\0';
    }

    for (i = 0; i < WAVE_GRID_SIZE; i++) {
        float val = sim->phi[i];
        if (val > 1.5f) val = 1.5f;
        if (val < -1.5f) val = -1.5f;

        int y = mid_y - (int)roundf(val * (float)mid_y / 1.5f);
        if (y < 0) y = 0;
        if (y >= height) y = height - 1;

        if (y == mid_y) {
            display[y][i] = 'o';
        } else {
            display[y][i] = '*';
        }
    }

    printf("  [Step %03u | Heartbeat Amp: %+.4f]\n", sim->step, sim->source_amplitude);
    printf("  +----------------------------------------+\n");
    for (i = 0; i < height; i++) {
        printf("  |%s|\n", display[i]);
    }
    printf("  +----------------------------------------+\n");
}

// ============================================================================
// Workflow 1 Extension: Coupled State-Transition Telemetry & Drift Validator
// ============================================================================

#define TELEMETRY_DIM 4

// Calculates the Mahalanobis distance: D_M = sqrt( (T - mu)^T * Sigma_inv * (T - mu) )
static float compute_mahalanobis_distance(const float *T, const float *mu, const float *Sigma_inv, int d) {
    float diff[8];
    int i, j;
    for (i = 0; i < d; i++) {
        diff[i] = T[i] - mu[i];
    }
    
    float sum = 0.0f;
    for (i = 0; i < d; i++) {
        float temp = 0.0f;
        for (j = 0; j < d; j++) {
            temp += diff[j] * Sigma_inv[j * d + i];
        }
        sum += temp * diff[i];
    }
    return sqrtf(sum);
}

// Composite validation score: D_P' = D_P * 1[D_M(T) <= crit] * 1[delta_t in [tau_min, tau_max]]
int validate_transition_composite(
    int current_state,
    int next_state,
    uint64_t prerequisites,
    const float *telemetry_vector,
    const float *baseline_mean,
    const float *cov_matrix_inv,
    int d,
    float critical_value,
    double delta_t,
    double tau_min,
    double tau_max
) {
    // 1. Structural FSM check
    int D_P = validate_transition(current_state, next_state, prerequisites);
    if (D_P == 0) return 0;
    
    // State 0 transition (reset) is unconditionally legal
    if (next_state == 0) return 1;

    // 2. Temporal velocity validation
    if (delta_t < tau_min || delta_t > tau_max) return 0;

    // 3. Multivariate telemetry drift check (Mahalanobis distance)
    float D_M = compute_mahalanobis_distance(telemetry_vector, baseline_mean, cov_matrix_inv, d);
    if (D_M > critical_value) return 0;

    return 1;
}

static void run_composite_validator_tests(void) {
    printf("[1.5/2] Running Coupled State-Transition Telemetry & Drift Validator Tests...\n");
    
    // Baseline mean profile: syscalls=100/sec, network=50KB/s, CPU=12%, files=25
    float baseline_mean[TELEMETRY_DIM] = {100.0f, 50.0f, 12.0f, 25.0f};

    // Inverse covariance matrix (Sigma_inv_ii = 1.0 / variance_i)
    float cov_matrix_inv[TELEMETRY_DIM * TELEMETRY_DIM] = {
        0.01f, 0.0f,  0.0f,  0.0f,   // variance of syscalls = 100
        0.0f,  0.04f, 0.0f,  0.0f,   // variance of network = 25
        0.0f,  0.0f,  0.25f, 0.0f,   // variance of CPU = 4
        0.0f,  0.0f,  0.0f,  0.16f   // variance of files = 6.25
    };

    float critical_val = 3.0f;

    // Test Case 1: Ideal transition (within bounds)
    float telemetry_ideal[TELEMETRY_DIM] = {102.0f, 48.0f, 11.5f, 24.0f};
    int res1 = validate_transition_composite(
        0, 1, PREREQ_CONTRACT_SIGNED,
        telemetry_ideal, baseline_mean, cov_matrix_inv, TELEMETRY_DIM,
        critical_val, 0.5, 0.1, 5.0
    );
    printf("      Test 1 (Normal Transition): %s (Expected: ALLOWED)\n", res1 ? "ALLOWED" : "BLOCKED");

    // Test Case 2: Out-of-bounds FSM sequence (leapfrog attempt 0 -> 2)
    int res2 = validate_transition_composite(
        0, 2, PREREQ_CONTRACT_SIGNED | PREREQ_DISCOVERY_COMPLETE,
        telemetry_ideal, baseline_mean, cov_matrix_inv, TELEMETRY_DIM,
        critical_val, 0.5, 0.1, 5.0
    );
    printf("      Test 2 (Leapfrog Sequence): %s (Expected: BLOCKED)\n", res2 ? "ALLOWED" : "BLOCKED");

    // Test Case 3: Timing bypass (transition happens too fast)
    int res3 = validate_transition_composite(
        0, 1, PREREQ_CONTRACT_SIGNED,
        telemetry_ideal, baseline_mean, cov_matrix_inv, TELEMETRY_DIM,
        critical_val, 0.005, 0.1, 5.0
    );
    printf("      Test 3 (Timing Bypass Guard): %s (Expected: BLOCKED)\n", res3 ? "ALLOWED" : "BLOCKED");

    // Test Case 4: Telemetry drift anomaly (syscall rate spikes to 250/sec)
    float telemetry_drift[TELEMETRY_DIM] = {250.0f, 48.0f, 45.0f, 24.0f};
    int res4 = validate_transition_composite(
        0, 1, PREREQ_CONTRACT_SIGNED,
        telemetry_drift, baseline_mean, cov_matrix_inv, TELEMETRY_DIM,
        critical_val, 0.5, 0.1, 5.0
    );
    printf("      Test 4 (Telemetry Drift Guard): %s (Expected: BLOCKED)\n", res4 ? "ALLOWED" : "BLOCKED");
    
    printf("\n");
}

int main(int argc, char **argv) {
    (void)argc;
    (void)argv;

    printf("==================================================\n");
    printf("PHASR Phase-1: Temporal Execution Validator Suite\n");
    printf("Core Engine: x86-64 Assembly FSM & C Wave Sim\n");
    printf("==================================================\n\n");

    // Telemetry Edge Case Check: Courant-Friedrichs-Lewy (CFL) stability check
    if (WAVE_COURANT > 1.0f) {
        printf("  [FATAL] Wave simulation Courant stability limit exceeded (r = %f > 1.0)\n", WAVE_COURANT);
        return 1;
    }

    printf("[1/2] Running %d Generated Assembly FSM Assertions...\n", 2200);
    run_all_generated_fsm_tests();
    printf("      Assertions Run: %u\n", g_stats.total_count);
    printf("      Passed: %u | Failed: %u\n", g_stats.passed_count, g_stats.failed_count);
    if (g_stats.failed_count == 0) {
        printf("      SUCCESS: All FSM boundary edge cases passed validation.\n\n");
    } else {
        printf("      WARNING: Core FSM validation failure detected!\n\n");
    }

    // Run the newly coupled composite transition validator tests
    run_composite_validator_tests();

    printf("[2/2] Running Wave Equation Invariant Telemetry Simulation...\n");
    printf("      Equation: d^2(phi)/dt^2 - v^2 * del^2(phi) = sin(omega * t)\n\n");

    wave_sim_t sim;
    init_wave_sim(&sim);

    // Test Telemetry Edge Cases: Invalid time increments
    printf("  --- Telemetry Wave Edge Cases Assertions ---\n");
    step_wave_sim(&sim, 0.0f);
    step_wave_sim(&sim, -0.5f);
    printf("  --------------------------------------------\n\n");

    float dt = 0.1f;
    for (int step = 0; step < 30; step++) {
        // Trigger a simulated telemetry/sequence anomaly violation (D_P' = 0) at step 15
        int d_p_prime = (step == 15) ? 0 : 1;
        step_wave_sim_coupled(&sim, dt, d_p_prime);
        if (step % 3 == 0) {
            print_wave_profile(&sim);
            printf("\n");
        }
    }

    printf("Wave simulation telemetry sequence complete.\n");
    printf("==================================================\n");
    return 0;
}
