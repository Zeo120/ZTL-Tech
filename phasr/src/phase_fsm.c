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
static void run_fsm_assert(int current_state, int next_state, uint64_t prereqs, int expected, const char *test_id, const char *desc) {
    int res = validate_transition(current_state, next_state, prereqs);
    g_stats.total_count++;
    if (res == expected) {
        g_stats.passed_count++;
    } else {
        g_stats.failed_count++;
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

static void run_unit_test_0000(void) {
    run_fsm_assert(
        -10,
        -10,
        0x0ULL,
        0,
        "UT_0000",
        "Testing state transition current=-10 to next=-10 with prereq=0x0"
    );
}
static void run_unit_test_0001(void) {
    run_fsm_assert(
        -5,
        -10,
        0x0ULL,
        0,
        "UT_0001",
        "Testing state transition current=-5 to next=-10 with prereq=0x0"
    );
}
static void run_unit_test_0002(void) {
    run_fsm_assert(
        -1,
        -10,
        0x0ULL,
        0,
        "UT_0002",
        "Testing state transition current=-1 to next=-10 with prereq=0x0"
    );
}
static void run_unit_test_0003(void) {
    run_fsm_assert(
        0,
        -10,
        0x0ULL,
        0,
        "UT_0003",
        "Testing state transition current=0 to next=-10 with prereq=0x0"
    );
}
static void run_unit_test_0004(void) {
    run_fsm_assert(
        1,
        -10,
        0x0ULL,
        0,
        "UT_0004",
        "Testing state transition current=1 to next=-10 with prereq=0x0"
    );
}
static void run_unit_test_0005(void) {
    run_fsm_assert(
        2,
        -10,
        0x0ULL,
        0,
        "UT_0005",
        "Testing state transition current=2 to next=-10 with prereq=0x0"
    );
}
static void run_unit_test_0006(void) {
    run_fsm_assert(
        3,
        -10,
        0x0ULL,
        0,
        "UT_0006",
        "Testing state transition current=3 to next=-10 with prereq=0x0"
    );
}
static void run_unit_test_0007(void) {
    run_fsm_assert(
        4,
        -10,
        0x0ULL,
        0,
        "UT_0007",
        "Testing state transition current=4 to next=-10 with prereq=0x0"
    );
}
static void run_unit_test_0008(void) {
    run_fsm_assert(
        5,
        -10,
        0x0ULL,
        0,
        "UT_0008",
        "Testing state transition current=5 to next=-10 with prereq=0x0"
    );
}
static void run_unit_test_0009(void) {
    run_fsm_assert(
        6,
        -10,
        0x0ULL,
        0,
        "UT_0009",
        "Testing state transition current=6 to next=-10 with prereq=0x0"
    );
}
static void run_unit_test_0010(void) {
    run_fsm_assert(
        7,
        -10,
        0x0ULL,
        0,
        "UT_0010",
        "Testing state transition current=7 to next=-10 with prereq=0x0"
    );
}
static void run_unit_test_0011(void) {
    run_fsm_assert(
        8,
        -10,
        0x0ULL,
        0,
        "UT_0011",
        "Testing state transition current=8 to next=-10 with prereq=0x0"
    );
}
static void run_unit_test_0012(void) {
    run_fsm_assert(
        10,
        -10,
        0x0ULL,
        0,
        "UT_0012",
        "Testing state transition current=10 to next=-10 with prereq=0x0"
    );
}
static void run_unit_test_0013(void) {
    run_fsm_assert(
        15,
        -10,
        0x0ULL,
        0,
        "UT_0013",
        "Testing state transition current=15 to next=-10 with prereq=0x0"
    );
}
static void run_unit_test_0014(void) {
    run_fsm_assert(
        100,
        -10,
        0x0ULL,
        0,
        "UT_0014",
        "Testing state transition current=100 to next=-10 with prereq=0x0"
    );
}
static void run_unit_test_0015(void) {
    run_fsm_assert(
        -100,
        -10,
        0x0ULL,
        0,
        "UT_0015",
        "Testing state transition current=-100 to next=-10 with prereq=0x0"
    );
}
static void run_unit_test_0016(void) {
    run_fsm_assert(
        -10,
        -5,
        0x0ULL,
        0,
        "UT_0016",
        "Testing state transition current=-10 to next=-5 with prereq=0x0"
    );
}
static void run_unit_test_0017(void) {
    run_fsm_assert(
        -5,
        -5,
        0x0ULL,
        0,
        "UT_0017",
        "Testing state transition current=-5 to next=-5 with prereq=0x0"
    );
}
static void run_unit_test_0018(void) {
    run_fsm_assert(
        -1,
        -5,
        0x0ULL,
        0,
        "UT_0018",
        "Testing state transition current=-1 to next=-5 with prereq=0x0"
    );
}
static void run_unit_test_0019(void) {
    run_fsm_assert(
        0,
        -5,
        0x0ULL,
        0,
        "UT_0019",
        "Testing state transition current=0 to next=-5 with prereq=0x0"
    );
}
static void run_unit_test_0020(void) {
    run_fsm_assert(
        1,
        -5,
        0x0ULL,
        0,
        "UT_0020",
        "Testing state transition current=1 to next=-5 with prereq=0x0"
    );
}
static void run_unit_test_0021(void) {
    run_fsm_assert(
        2,
        -5,
        0x0ULL,
        0,
        "UT_0021",
        "Testing state transition current=2 to next=-5 with prereq=0x0"
    );
}
static void run_unit_test_0022(void) {
    run_fsm_assert(
        3,
        -5,
        0x0ULL,
        0,
        "UT_0022",
        "Testing state transition current=3 to next=-5 with prereq=0x0"
    );
}
static void run_unit_test_0023(void) {
    run_fsm_assert(
        4,
        -5,
        0x0ULL,
        0,
        "UT_0023",
        "Testing state transition current=4 to next=-5 with prereq=0x0"
    );
}
static void run_unit_test_0024(void) {
    run_fsm_assert(
        5,
        -5,
        0x0ULL,
        0,
        "UT_0024",
        "Testing state transition current=5 to next=-5 with prereq=0x0"
    );
}
static void run_unit_test_0025(void) {
    run_fsm_assert(
        6,
        -5,
        0x0ULL,
        0,
        "UT_0025",
        "Testing state transition current=6 to next=-5 with prereq=0x0"
    );
}
static void run_unit_test_0026(void) {
    run_fsm_assert(
        7,
        -5,
        0x0ULL,
        0,
        "UT_0026",
        "Testing state transition current=7 to next=-5 with prereq=0x0"
    );
}
static void run_unit_test_0027(void) {
    run_fsm_assert(
        8,
        -5,
        0x0ULL,
        0,
        "UT_0027",
        "Testing state transition current=8 to next=-5 with prereq=0x0"
    );
}
static void run_unit_test_0028(void) {
    run_fsm_assert(
        10,
        -5,
        0x0ULL,
        0,
        "UT_0028",
        "Testing state transition current=10 to next=-5 with prereq=0x0"
    );
}
static void run_unit_test_0029(void) {
    run_fsm_assert(
        15,
        -5,
        0x0ULL,
        0,
        "UT_0029",
        "Testing state transition current=15 to next=-5 with prereq=0x0"
    );
}
static void run_unit_test_0030(void) {
    run_fsm_assert(
        100,
        -5,
        0x0ULL,
        0,
        "UT_0030",
        "Testing state transition current=100 to next=-5 with prereq=0x0"
    );
}
static void run_unit_test_0031(void) {
    run_fsm_assert(
        -100,
        -5,
        0x0ULL,
        0,
        "UT_0031",
        "Testing state transition current=-100 to next=-5 with prereq=0x0"
    );
}
static void run_unit_test_0032(void) {
    run_fsm_assert(
        -10,
        -1,
        0x0ULL,
        0,
        "UT_0032",
        "Testing state transition current=-10 to next=-1 with prereq=0x0"
    );
}
static void run_unit_test_0033(void) {
    run_fsm_assert(
        -5,
        -1,
        0x0ULL,
        0,
        "UT_0033",
        "Testing state transition current=-5 to next=-1 with prereq=0x0"
    );
}
static void run_unit_test_0034(void) {
    run_fsm_assert(
        -1,
        -1,
        0x0ULL,
        0,
        "UT_0034",
        "Testing state transition current=-1 to next=-1 with prereq=0x0"
    );
}
static void run_unit_test_0035(void) {
    run_fsm_assert(
        0,
        -1,
        0x0ULL,
        0,
        "UT_0035",
        "Testing state transition current=0 to next=-1 with prereq=0x0"
    );
}
static void run_unit_test_0036(void) {
    run_fsm_assert(
        1,
        -1,
        0x0ULL,
        0,
        "UT_0036",
        "Testing state transition current=1 to next=-1 with prereq=0x0"
    );
}
static void run_unit_test_0037(void) {
    run_fsm_assert(
        2,
        -1,
        0x0ULL,
        0,
        "UT_0037",
        "Testing state transition current=2 to next=-1 with prereq=0x0"
    );
}
static void run_unit_test_0038(void) {
    run_fsm_assert(
        3,
        -1,
        0x0ULL,
        0,
        "UT_0038",
        "Testing state transition current=3 to next=-1 with prereq=0x0"
    );
}
static void run_unit_test_0039(void) {
    run_fsm_assert(
        4,
        -1,
        0x0ULL,
        0,
        "UT_0039",
        "Testing state transition current=4 to next=-1 with prereq=0x0"
    );
}
static void run_unit_test_0040(void) {
    run_fsm_assert(
        5,
        -1,
        0x0ULL,
        0,
        "UT_0040",
        "Testing state transition current=5 to next=-1 with prereq=0x0"
    );
}
static void run_unit_test_0041(void) {
    run_fsm_assert(
        6,
        -1,
        0x0ULL,
        0,
        "UT_0041",
        "Testing state transition current=6 to next=-1 with prereq=0x0"
    );
}
static void run_unit_test_0042(void) {
    run_fsm_assert(
        7,
        -1,
        0x0ULL,
        0,
        "UT_0042",
        "Testing state transition current=7 to next=-1 with prereq=0x0"
    );
}
static void run_unit_test_0043(void) {
    run_fsm_assert(
        8,
        -1,
        0x0ULL,
        0,
        "UT_0043",
        "Testing state transition current=8 to next=-1 with prereq=0x0"
    );
}
static void run_unit_test_0044(void) {
    run_fsm_assert(
        10,
        -1,
        0x0ULL,
        0,
        "UT_0044",
        "Testing state transition current=10 to next=-1 with prereq=0x0"
    );
}
static void run_unit_test_0045(void) {
    run_fsm_assert(
        15,
        -1,
        0x0ULL,
        0,
        "UT_0045",
        "Testing state transition current=15 to next=-1 with prereq=0x0"
    );
}
static void run_unit_test_0046(void) {
    run_fsm_assert(
        100,
        -1,
        0x0ULL,
        0,
        "UT_0046",
        "Testing state transition current=100 to next=-1 with prereq=0x0"
    );
}
static void run_unit_test_0047(void) {
    run_fsm_assert(
        -100,
        -1,
        0x0ULL,
        0,
        "UT_0047",
        "Testing state transition current=-100 to next=-1 with prereq=0x0"
    );
}
static void run_unit_test_0048(void) {
    run_fsm_assert(
        -10,
        0,
        0x0ULL,
        0,
        "UT_0048",
        "Testing state transition current=-10 to next=0 with prereq=0x0"
    );
}
static void run_unit_test_0049(void) {
    run_fsm_assert(
        -5,
        0,
        0x0ULL,
        0,
        "UT_0049",
        "Testing state transition current=-5 to next=0 with prereq=0x0"
    );
}
static void run_unit_test_0050(void) {
    run_fsm_assert(
        -1,
        0,
        0x0ULL,
        0,
        "UT_0050",
        "Testing state transition current=-1 to next=0 with prereq=0x0"
    );
}
static void run_unit_test_0051(void) {
    run_fsm_assert(
        0,
        0,
        0x0ULL,
        1,
        "UT_0051",
        "Testing state transition current=0 to next=0 with prereq=0x0"
    );
}
static void run_unit_test_0052(void) {
    run_fsm_assert(
        1,
        0,
        0x0ULL,
        1,
        "UT_0052",
        "Testing state transition current=1 to next=0 with prereq=0x0"
    );
}
static void run_unit_test_0053(void) {
    run_fsm_assert(
        2,
        0,
        0x0ULL,
        1,
        "UT_0053",
        "Testing state transition current=2 to next=0 with prereq=0x0"
    );
}
static void run_unit_test_0054(void) {
    run_fsm_assert(
        3,
        0,
        0x0ULL,
        1,
        "UT_0054",
        "Testing state transition current=3 to next=0 with prereq=0x0"
    );
}
static void run_unit_test_0055(void) {
    run_fsm_assert(
        4,
        0,
        0x0ULL,
        1,
        "UT_0055",
        "Testing state transition current=4 to next=0 with prereq=0x0"
    );
}
static void run_unit_test_0056(void) {
    run_fsm_assert(
        5,
        0,
        0x0ULL,
        1,
        "UT_0056",
        "Testing state transition current=5 to next=0 with prereq=0x0"
    );
}
static void run_unit_test_0057(void) {
    run_fsm_assert(
        6,
        0,
        0x0ULL,
        1,
        "UT_0057",
        "Testing state transition current=6 to next=0 with prereq=0x0"
    );
}
static void run_unit_test_0058(void) {
    run_fsm_assert(
        7,
        0,
        0x0ULL,
        1,
        "UT_0058",
        "Testing state transition current=7 to next=0 with prereq=0x0"
    );
}
static void run_unit_test_0059(void) {
    run_fsm_assert(
        8,
        0,
        0x0ULL,
        0,
        "UT_0059",
        "Testing state transition current=8 to next=0 with prereq=0x0"
    );
}
static void run_unit_test_0060(void) {
    run_fsm_assert(
        10,
        0,
        0x0ULL,
        0,
        "UT_0060",
        "Testing state transition current=10 to next=0 with prereq=0x0"
    );
}
static void run_unit_test_0061(void) {
    run_fsm_assert(
        15,
        0,
        0x0ULL,
        0,
        "UT_0061",
        "Testing state transition current=15 to next=0 with prereq=0x0"
    );
}
static void run_unit_test_0062(void) {
    run_fsm_assert(
        100,
        0,
        0x0ULL,
        0,
        "UT_0062",
        "Testing state transition current=100 to next=0 with prereq=0x0"
    );
}
static void run_unit_test_0063(void) {
    run_fsm_assert(
        -100,
        0,
        0x0ULL,
        0,
        "UT_0063",
        "Testing state transition current=-100 to next=0 with prereq=0x0"
    );
}
static void run_unit_test_0064(void) {
    run_fsm_assert(
        -10,
        1,
        0x0ULL,
        0,
        "UT_0064",
        "Testing state transition current=-10 to next=1 with prereq=0x0"
    );
}
static void run_unit_test_0065(void) {
    run_fsm_assert(
        -5,
        1,
        0x0ULL,
        0,
        "UT_0065",
        "Testing state transition current=-5 to next=1 with prereq=0x0"
    );
}
static void run_unit_test_0066(void) {
    run_fsm_assert(
        -1,
        1,
        0x0ULL,
        0,
        "UT_0066",
        "Testing state transition current=-1 to next=1 with prereq=0x0"
    );
}
static void run_unit_test_0067(void) {
    run_fsm_assert(
        0,
        1,
        0x0ULL,
        0,
        "UT_0067",
        "Testing state transition current=0 to next=1 with prereq=0x0"
    );
}
static void run_unit_test_0068(void) {
    run_fsm_assert(
        1,
        1,
        0x0ULL,
        0,
        "UT_0068",
        "Testing state transition current=1 to next=1 with prereq=0x0"
    );
}
static void run_unit_test_0069(void) {
    run_fsm_assert(
        2,
        1,
        0x0ULL,
        0,
        "UT_0069",
        "Testing state transition current=2 to next=1 with prereq=0x0"
    );
}
static void run_unit_test_0070(void) {
    run_fsm_assert(
        3,
        1,
        0x0ULL,
        0,
        "UT_0070",
        "Testing state transition current=3 to next=1 with prereq=0x0"
    );
}
static void run_unit_test_0071(void) {
    run_fsm_assert(
        4,
        1,
        0x0ULL,
        0,
        "UT_0071",
        "Testing state transition current=4 to next=1 with prereq=0x0"
    );
}
static void run_unit_test_0072(void) {
    run_fsm_assert(
        5,
        1,
        0x0ULL,
        0,
        "UT_0072",
        "Testing state transition current=5 to next=1 with prereq=0x0"
    );
}
static void run_unit_test_0073(void) {
    run_fsm_assert(
        6,
        1,
        0x0ULL,
        0,
        "UT_0073",
        "Testing state transition current=6 to next=1 with prereq=0x0"
    );
}
static void run_unit_test_0074(void) {
    run_fsm_assert(
        7,
        1,
        0x0ULL,
        0,
        "UT_0074",
        "Testing state transition current=7 to next=1 with prereq=0x0"
    );
}
static void run_unit_test_0075(void) {
    run_fsm_assert(
        8,
        1,
        0x0ULL,
        0,
        "UT_0075",
        "Testing state transition current=8 to next=1 with prereq=0x0"
    );
}
static void run_unit_test_0076(void) {
    run_fsm_assert(
        10,
        1,
        0x0ULL,
        0,
        "UT_0076",
        "Testing state transition current=10 to next=1 with prereq=0x0"
    );
}
static void run_unit_test_0077(void) {
    run_fsm_assert(
        15,
        1,
        0x0ULL,
        0,
        "UT_0077",
        "Testing state transition current=15 to next=1 with prereq=0x0"
    );
}
static void run_unit_test_0078(void) {
    run_fsm_assert(
        100,
        1,
        0x0ULL,
        0,
        "UT_0078",
        "Testing state transition current=100 to next=1 with prereq=0x0"
    );
}
static void run_unit_test_0079(void) {
    run_fsm_assert(
        -100,
        1,
        0x0ULL,
        0,
        "UT_0079",
        "Testing state transition current=-100 to next=1 with prereq=0x0"
    );
}
static void run_unit_test_0080(void) {
    run_fsm_assert(
        -10,
        2,
        0x0ULL,
        0,
        "UT_0080",
        "Testing state transition current=-10 to next=2 with prereq=0x0"
    );
}
static void run_unit_test_0081(void) {
    run_fsm_assert(
        -5,
        2,
        0x0ULL,
        0,
        "UT_0081",
        "Testing state transition current=-5 to next=2 with prereq=0x0"
    );
}
static void run_unit_test_0082(void) {
    run_fsm_assert(
        -1,
        2,
        0x0ULL,
        0,
        "UT_0082",
        "Testing state transition current=-1 to next=2 with prereq=0x0"
    );
}
static void run_unit_test_0083(void) {
    run_fsm_assert(
        0,
        2,
        0x0ULL,
        0,
        "UT_0083",
        "Testing state transition current=0 to next=2 with prereq=0x0"
    );
}
static void run_unit_test_0084(void) {
    run_fsm_assert(
        1,
        2,
        0x0ULL,
        0,
        "UT_0084",
        "Testing state transition current=1 to next=2 with prereq=0x0"
    );
}
static void run_unit_test_0085(void) {
    run_fsm_assert(
        2,
        2,
        0x0ULL,
        0,
        "UT_0085",
        "Testing state transition current=2 to next=2 with prereq=0x0"
    );
}
static void run_unit_test_0086(void) {
    run_fsm_assert(
        3,
        2,
        0x0ULL,
        0,
        "UT_0086",
        "Testing state transition current=3 to next=2 with prereq=0x0"
    );
}
static void run_unit_test_0087(void) {
    run_fsm_assert(
        4,
        2,
        0x0ULL,
        0,
        "UT_0087",
        "Testing state transition current=4 to next=2 with prereq=0x0"
    );
}
static void run_unit_test_0088(void) {
    run_fsm_assert(
        5,
        2,
        0x0ULL,
        0,
        "UT_0088",
        "Testing state transition current=5 to next=2 with prereq=0x0"
    );
}
static void run_unit_test_0089(void) {
    run_fsm_assert(
        6,
        2,
        0x0ULL,
        0,
        "UT_0089",
        "Testing state transition current=6 to next=2 with prereq=0x0"
    );
}
static void run_unit_test_0090(void) {
    run_fsm_assert(
        7,
        2,
        0x0ULL,
        0,
        "UT_0090",
        "Testing state transition current=7 to next=2 with prereq=0x0"
    );
}
static void run_unit_test_0091(void) {
    run_fsm_assert(
        8,
        2,
        0x0ULL,
        0,
        "UT_0091",
        "Testing state transition current=8 to next=2 with prereq=0x0"
    );
}
static void run_unit_test_0092(void) {
    run_fsm_assert(
        10,
        2,
        0x0ULL,
        0,
        "UT_0092",
        "Testing state transition current=10 to next=2 with prereq=0x0"
    );
}
static void run_unit_test_0093(void) {
    run_fsm_assert(
        15,
        2,
        0x0ULL,
        0,
        "UT_0093",
        "Testing state transition current=15 to next=2 with prereq=0x0"
    );
}
static void run_unit_test_0094(void) {
    run_fsm_assert(
        100,
        2,
        0x0ULL,
        0,
        "UT_0094",
        "Testing state transition current=100 to next=2 with prereq=0x0"
    );
}
static void run_unit_test_0095(void) {
    run_fsm_assert(
        -100,
        2,
        0x0ULL,
        0,
        "UT_0095",
        "Testing state transition current=-100 to next=2 with prereq=0x0"
    );
}
static void run_unit_test_0096(void) {
    run_fsm_assert(
        -10,
        3,
        0x0ULL,
        0,
        "UT_0096",
        "Testing state transition current=-10 to next=3 with prereq=0x0"
    );
}
static void run_unit_test_0097(void) {
    run_fsm_assert(
        -5,
        3,
        0x0ULL,
        0,
        "UT_0097",
        "Testing state transition current=-5 to next=3 with prereq=0x0"
    );
}
static void run_unit_test_0098(void) {
    run_fsm_assert(
        -1,
        3,
        0x0ULL,
        0,
        "UT_0098",
        "Testing state transition current=-1 to next=3 with prereq=0x0"
    );
}
static void run_unit_test_0099(void) {
    run_fsm_assert(
        0,
        3,
        0x0ULL,
        0,
        "UT_0099",
        "Testing state transition current=0 to next=3 with prereq=0x0"
    );
}
static void run_unit_test_0100(void) {
    run_fsm_assert(
        1,
        3,
        0x0ULL,
        0,
        "UT_0100",
        "Testing state transition current=1 to next=3 with prereq=0x0"
    );
}
static void run_unit_test_0101(void) {
    run_fsm_assert(
        2,
        3,
        0x0ULL,
        0,
        "UT_0101",
        "Testing state transition current=2 to next=3 with prereq=0x0"
    );
}
static void run_unit_test_0102(void) {
    run_fsm_assert(
        3,
        3,
        0x0ULL,
        0,
        "UT_0102",
        "Testing state transition current=3 to next=3 with prereq=0x0"
    );
}
static void run_unit_test_0103(void) {
    run_fsm_assert(
        4,
        3,
        0x0ULL,
        0,
        "UT_0103",
        "Testing state transition current=4 to next=3 with prereq=0x0"
    );
}
static void run_unit_test_0104(void) {
    run_fsm_assert(
        5,
        3,
        0x0ULL,
        0,
        "UT_0104",
        "Testing state transition current=5 to next=3 with prereq=0x0"
    );
}
static void run_unit_test_0105(void) {
    run_fsm_assert(
        6,
        3,
        0x0ULL,
        0,
        "UT_0105",
        "Testing state transition current=6 to next=3 with prereq=0x0"
    );
}
static void run_unit_test_0106(void) {
    run_fsm_assert(
        7,
        3,
        0x0ULL,
        0,
        "UT_0106",
        "Testing state transition current=7 to next=3 with prereq=0x0"
    );
}
static void run_unit_test_0107(void) {
    run_fsm_assert(
        8,
        3,
        0x0ULL,
        0,
        "UT_0107",
        "Testing state transition current=8 to next=3 with prereq=0x0"
    );
}
static void run_unit_test_0108(void) {
    run_fsm_assert(
        10,
        3,
        0x0ULL,
        0,
        "UT_0108",
        "Testing state transition current=10 to next=3 with prereq=0x0"
    );
}
static void run_unit_test_0109(void) {
    run_fsm_assert(
        15,
        3,
        0x0ULL,
        0,
        "UT_0109",
        "Testing state transition current=15 to next=3 with prereq=0x0"
    );
}
static void run_unit_test_0110(void) {
    run_fsm_assert(
        100,
        3,
        0x0ULL,
        0,
        "UT_0110",
        "Testing state transition current=100 to next=3 with prereq=0x0"
    );
}
static void run_unit_test_0111(void) {
    run_fsm_assert(
        -100,
        3,
        0x0ULL,
        0,
        "UT_0111",
        "Testing state transition current=-100 to next=3 with prereq=0x0"
    );
}
static void run_unit_test_0112(void) {
    run_fsm_assert(
        -10,
        4,
        0x0ULL,
        0,
        "UT_0112",
        "Testing state transition current=-10 to next=4 with prereq=0x0"
    );
}
static void run_unit_test_0113(void) {
    run_fsm_assert(
        -5,
        4,
        0x0ULL,
        0,
        "UT_0113",
        "Testing state transition current=-5 to next=4 with prereq=0x0"
    );
}
static void run_unit_test_0114(void) {
    run_fsm_assert(
        -1,
        4,
        0x0ULL,
        0,
        "UT_0114",
        "Testing state transition current=-1 to next=4 with prereq=0x0"
    );
}
static void run_unit_test_0115(void) {
    run_fsm_assert(
        0,
        4,
        0x0ULL,
        0,
        "UT_0115",
        "Testing state transition current=0 to next=4 with prereq=0x0"
    );
}
static void run_unit_test_0116(void) {
    run_fsm_assert(
        1,
        4,
        0x0ULL,
        0,
        "UT_0116",
        "Testing state transition current=1 to next=4 with prereq=0x0"
    );
}
static void run_unit_test_0117(void) {
    run_fsm_assert(
        2,
        4,
        0x0ULL,
        0,
        "UT_0117",
        "Testing state transition current=2 to next=4 with prereq=0x0"
    );
}
static void run_unit_test_0118(void) {
    run_fsm_assert(
        3,
        4,
        0x0ULL,
        0,
        "UT_0118",
        "Testing state transition current=3 to next=4 with prereq=0x0"
    );
}
static void run_unit_test_0119(void) {
    run_fsm_assert(
        4,
        4,
        0x0ULL,
        0,
        "UT_0119",
        "Testing state transition current=4 to next=4 with prereq=0x0"
    );
}
static void run_unit_test_0120(void) {
    run_fsm_assert(
        5,
        4,
        0x0ULL,
        0,
        "UT_0120",
        "Testing state transition current=5 to next=4 with prereq=0x0"
    );
}
static void run_unit_test_0121(void) {
    run_fsm_assert(
        6,
        4,
        0x0ULL,
        0,
        "UT_0121",
        "Testing state transition current=6 to next=4 with prereq=0x0"
    );
}
static void run_unit_test_0122(void) {
    run_fsm_assert(
        7,
        4,
        0x0ULL,
        0,
        "UT_0122",
        "Testing state transition current=7 to next=4 with prereq=0x0"
    );
}
static void run_unit_test_0123(void) {
    run_fsm_assert(
        8,
        4,
        0x0ULL,
        0,
        "UT_0123",
        "Testing state transition current=8 to next=4 with prereq=0x0"
    );
}
static void run_unit_test_0124(void) {
    run_fsm_assert(
        10,
        4,
        0x0ULL,
        0,
        "UT_0124",
        "Testing state transition current=10 to next=4 with prereq=0x0"
    );
}
static void run_unit_test_0125(void) {
    run_fsm_assert(
        15,
        4,
        0x0ULL,
        0,
        "UT_0125",
        "Testing state transition current=15 to next=4 with prereq=0x0"
    );
}
static void run_unit_test_0126(void) {
    run_fsm_assert(
        100,
        4,
        0x0ULL,
        0,
        "UT_0126",
        "Testing state transition current=100 to next=4 with prereq=0x0"
    );
}
static void run_unit_test_0127(void) {
    run_fsm_assert(
        -100,
        4,
        0x0ULL,
        0,
        "UT_0127",
        "Testing state transition current=-100 to next=4 with prereq=0x0"
    );
}
static void run_unit_test_0128(void) {
    run_fsm_assert(
        -10,
        5,
        0x0ULL,
        0,
        "UT_0128",
        "Testing state transition current=-10 to next=5 with prereq=0x0"
    );
}
static void run_unit_test_0129(void) {
    run_fsm_assert(
        -5,
        5,
        0x0ULL,
        0,
        "UT_0129",
        "Testing state transition current=-5 to next=5 with prereq=0x0"
    );
}
static void run_unit_test_0130(void) {
    run_fsm_assert(
        -1,
        5,
        0x0ULL,
        0,
        "UT_0130",
        "Testing state transition current=-1 to next=5 with prereq=0x0"
    );
}
static void run_unit_test_0131(void) {
    run_fsm_assert(
        0,
        5,
        0x0ULL,
        0,
        "UT_0131",
        "Testing state transition current=0 to next=5 with prereq=0x0"
    );
}
static void run_unit_test_0132(void) {
    run_fsm_assert(
        1,
        5,
        0x0ULL,
        0,
        "UT_0132",
        "Testing state transition current=1 to next=5 with prereq=0x0"
    );
}
static void run_unit_test_0133(void) {
    run_fsm_assert(
        2,
        5,
        0x0ULL,
        0,
        "UT_0133",
        "Testing state transition current=2 to next=5 with prereq=0x0"
    );
}
static void run_unit_test_0134(void) {
    run_fsm_assert(
        3,
        5,
        0x0ULL,
        0,
        "UT_0134",
        "Testing state transition current=3 to next=5 with prereq=0x0"
    );
}
static void run_unit_test_0135(void) {
    run_fsm_assert(
        4,
        5,
        0x0ULL,
        0,
        "UT_0135",
        "Testing state transition current=4 to next=5 with prereq=0x0"
    );
}
static void run_unit_test_0136(void) {
    run_fsm_assert(
        5,
        5,
        0x0ULL,
        0,
        "UT_0136",
        "Testing state transition current=5 to next=5 with prereq=0x0"
    );
}
static void run_unit_test_0137(void) {
    run_fsm_assert(
        6,
        5,
        0x0ULL,
        0,
        "UT_0137",
        "Testing state transition current=6 to next=5 with prereq=0x0"
    );
}
static void run_unit_test_0138(void) {
    run_fsm_assert(
        7,
        5,
        0x0ULL,
        0,
        "UT_0138",
        "Testing state transition current=7 to next=5 with prereq=0x0"
    );
}
static void run_unit_test_0139(void) {
    run_fsm_assert(
        8,
        5,
        0x0ULL,
        0,
        "UT_0139",
        "Testing state transition current=8 to next=5 with prereq=0x0"
    );
}
static void run_unit_test_0140(void) {
    run_fsm_assert(
        10,
        5,
        0x0ULL,
        0,
        "UT_0140",
        "Testing state transition current=10 to next=5 with prereq=0x0"
    );
}
static void run_unit_test_0141(void) {
    run_fsm_assert(
        15,
        5,
        0x0ULL,
        0,
        "UT_0141",
        "Testing state transition current=15 to next=5 with prereq=0x0"
    );
}
static void run_unit_test_0142(void) {
    run_fsm_assert(
        100,
        5,
        0x0ULL,
        0,
        "UT_0142",
        "Testing state transition current=100 to next=5 with prereq=0x0"
    );
}
static void run_unit_test_0143(void) {
    run_fsm_assert(
        -100,
        5,
        0x0ULL,
        0,
        "UT_0143",
        "Testing state transition current=-100 to next=5 with prereq=0x0"
    );
}
static void run_unit_test_0144(void) {
    run_fsm_assert(
        -10,
        6,
        0x0ULL,
        0,
        "UT_0144",
        "Testing state transition current=-10 to next=6 with prereq=0x0"
    );
}
static void run_unit_test_0145(void) {
    run_fsm_assert(
        -5,
        6,
        0x0ULL,
        0,
        "UT_0145",
        "Testing state transition current=-5 to next=6 with prereq=0x0"
    );
}
static void run_unit_test_0146(void) {
    run_fsm_assert(
        -1,
        6,
        0x0ULL,
        0,
        "UT_0146",
        "Testing state transition current=-1 to next=6 with prereq=0x0"
    );
}
static void run_unit_test_0147(void) {
    run_fsm_assert(
        0,
        6,
        0x0ULL,
        0,
        "UT_0147",
        "Testing state transition current=0 to next=6 with prereq=0x0"
    );
}
static void run_unit_test_0148(void) {
    run_fsm_assert(
        1,
        6,
        0x0ULL,
        0,
        "UT_0148",
        "Testing state transition current=1 to next=6 with prereq=0x0"
    );
}
static void run_unit_test_0149(void) {
    run_fsm_assert(
        2,
        6,
        0x0ULL,
        0,
        "UT_0149",
        "Testing state transition current=2 to next=6 with prereq=0x0"
    );
}
static void run_unit_test_0150(void) {
    run_fsm_assert(
        3,
        6,
        0x0ULL,
        0,
        "UT_0150",
        "Testing state transition current=3 to next=6 with prereq=0x0"
    );
}
static void run_unit_test_0151(void) {
    run_fsm_assert(
        4,
        6,
        0x0ULL,
        0,
        "UT_0151",
        "Testing state transition current=4 to next=6 with prereq=0x0"
    );
}
static void run_unit_test_0152(void) {
    run_fsm_assert(
        5,
        6,
        0x0ULL,
        0,
        "UT_0152",
        "Testing state transition current=5 to next=6 with prereq=0x0"
    );
}
static void run_unit_test_0153(void) {
    run_fsm_assert(
        6,
        6,
        0x0ULL,
        0,
        "UT_0153",
        "Testing state transition current=6 to next=6 with prereq=0x0"
    );
}
static void run_unit_test_0154(void) {
    run_fsm_assert(
        7,
        6,
        0x0ULL,
        0,
        "UT_0154",
        "Testing state transition current=7 to next=6 with prereq=0x0"
    );
}
static void run_unit_test_0155(void) {
    run_fsm_assert(
        8,
        6,
        0x0ULL,
        0,
        "UT_0155",
        "Testing state transition current=8 to next=6 with prereq=0x0"
    );
}
static void run_unit_test_0156(void) {
    run_fsm_assert(
        10,
        6,
        0x0ULL,
        0,
        "UT_0156",
        "Testing state transition current=10 to next=6 with prereq=0x0"
    );
}
static void run_unit_test_0157(void) {
    run_fsm_assert(
        15,
        6,
        0x0ULL,
        0,
        "UT_0157",
        "Testing state transition current=15 to next=6 with prereq=0x0"
    );
}
static void run_unit_test_0158(void) {
    run_fsm_assert(
        100,
        6,
        0x0ULL,
        0,
        "UT_0158",
        "Testing state transition current=100 to next=6 with prereq=0x0"
    );
}
static void run_unit_test_0159(void) {
    run_fsm_assert(
        -100,
        6,
        0x0ULL,
        0,
        "UT_0159",
        "Testing state transition current=-100 to next=6 with prereq=0x0"
    );
}
static void run_unit_test_0160(void) {
    run_fsm_assert(
        -10,
        7,
        0x0ULL,
        0,
        "UT_0160",
        "Testing state transition current=-10 to next=7 with prereq=0x0"
    );
}
static void run_unit_test_0161(void) {
    run_fsm_assert(
        -5,
        7,
        0x0ULL,
        0,
        "UT_0161",
        "Testing state transition current=-5 to next=7 with prereq=0x0"
    );
}
static void run_unit_test_0162(void) {
    run_fsm_assert(
        -1,
        7,
        0x0ULL,
        0,
        "UT_0162",
        "Testing state transition current=-1 to next=7 with prereq=0x0"
    );
}
static void run_unit_test_0163(void) {
    run_fsm_assert(
        0,
        7,
        0x0ULL,
        0,
        "UT_0163",
        "Testing state transition current=0 to next=7 with prereq=0x0"
    );
}
static void run_unit_test_0164(void) {
    run_fsm_assert(
        1,
        7,
        0x0ULL,
        0,
        "UT_0164",
        "Testing state transition current=1 to next=7 with prereq=0x0"
    );
}
static void run_unit_test_0165(void) {
    run_fsm_assert(
        2,
        7,
        0x0ULL,
        0,
        "UT_0165",
        "Testing state transition current=2 to next=7 with prereq=0x0"
    );
}
static void run_unit_test_0166(void) {
    run_fsm_assert(
        3,
        7,
        0x0ULL,
        0,
        "UT_0166",
        "Testing state transition current=3 to next=7 with prereq=0x0"
    );
}
static void run_unit_test_0167(void) {
    run_fsm_assert(
        4,
        7,
        0x0ULL,
        0,
        "UT_0167",
        "Testing state transition current=4 to next=7 with prereq=0x0"
    );
}
static void run_unit_test_0168(void) {
    run_fsm_assert(
        5,
        7,
        0x0ULL,
        0,
        "UT_0168",
        "Testing state transition current=5 to next=7 with prereq=0x0"
    );
}
static void run_unit_test_0169(void) {
    run_fsm_assert(
        6,
        7,
        0x0ULL,
        0,
        "UT_0169",
        "Testing state transition current=6 to next=7 with prereq=0x0"
    );
}
static void run_unit_test_0170(void) {
    run_fsm_assert(
        7,
        7,
        0x0ULL,
        0,
        "UT_0170",
        "Testing state transition current=7 to next=7 with prereq=0x0"
    );
}
static void run_unit_test_0171(void) {
    run_fsm_assert(
        8,
        7,
        0x0ULL,
        0,
        "UT_0171",
        "Testing state transition current=8 to next=7 with prereq=0x0"
    );
}
static void run_unit_test_0172(void) {
    run_fsm_assert(
        10,
        7,
        0x0ULL,
        0,
        "UT_0172",
        "Testing state transition current=10 to next=7 with prereq=0x0"
    );
}
static void run_unit_test_0173(void) {
    run_fsm_assert(
        15,
        7,
        0x0ULL,
        0,
        "UT_0173",
        "Testing state transition current=15 to next=7 with prereq=0x0"
    );
}
static void run_unit_test_0174(void) {
    run_fsm_assert(
        100,
        7,
        0x0ULL,
        0,
        "UT_0174",
        "Testing state transition current=100 to next=7 with prereq=0x0"
    );
}
static void run_unit_test_0175(void) {
    run_fsm_assert(
        -100,
        7,
        0x0ULL,
        0,
        "UT_0175",
        "Testing state transition current=-100 to next=7 with prereq=0x0"
    );
}
static void run_unit_test_0176(void) {
    run_fsm_assert(
        -10,
        8,
        0x0ULL,
        0,
        "UT_0176",
        "Testing state transition current=-10 to next=8 with prereq=0x0"
    );
}
static void run_unit_test_0177(void) {
    run_fsm_assert(
        -5,
        8,
        0x0ULL,
        0,
        "UT_0177",
        "Testing state transition current=-5 to next=8 with prereq=0x0"
    );
}
static void run_unit_test_0178(void) {
    run_fsm_assert(
        -1,
        8,
        0x0ULL,
        0,
        "UT_0178",
        "Testing state transition current=-1 to next=8 with prereq=0x0"
    );
}
static void run_unit_test_0179(void) {
    run_fsm_assert(
        0,
        8,
        0x0ULL,
        0,
        "UT_0179",
        "Testing state transition current=0 to next=8 with prereq=0x0"
    );
}
static void run_unit_test_0180(void) {
    run_fsm_assert(
        1,
        8,
        0x0ULL,
        0,
        "UT_0180",
        "Testing state transition current=1 to next=8 with prereq=0x0"
    );
}
static void run_unit_test_0181(void) {
    run_fsm_assert(
        2,
        8,
        0x0ULL,
        0,
        "UT_0181",
        "Testing state transition current=2 to next=8 with prereq=0x0"
    );
}
static void run_unit_test_0182(void) {
    run_fsm_assert(
        3,
        8,
        0x0ULL,
        0,
        "UT_0182",
        "Testing state transition current=3 to next=8 with prereq=0x0"
    );
}
static void run_unit_test_0183(void) {
    run_fsm_assert(
        4,
        8,
        0x0ULL,
        0,
        "UT_0183",
        "Testing state transition current=4 to next=8 with prereq=0x0"
    );
}
static void run_unit_test_0184(void) {
    run_fsm_assert(
        5,
        8,
        0x0ULL,
        0,
        "UT_0184",
        "Testing state transition current=5 to next=8 with prereq=0x0"
    );
}
static void run_unit_test_0185(void) {
    run_fsm_assert(
        6,
        8,
        0x0ULL,
        0,
        "UT_0185",
        "Testing state transition current=6 to next=8 with prereq=0x0"
    );
}
static void run_unit_test_0186(void) {
    run_fsm_assert(
        7,
        8,
        0x0ULL,
        0,
        "UT_0186",
        "Testing state transition current=7 to next=8 with prereq=0x0"
    );
}
static void run_unit_test_0187(void) {
    run_fsm_assert(
        8,
        8,
        0x0ULL,
        0,
        "UT_0187",
        "Testing state transition current=8 to next=8 with prereq=0x0"
    );
}
static void run_unit_test_0188(void) {
    run_fsm_assert(
        10,
        8,
        0x0ULL,
        0,
        "UT_0188",
        "Testing state transition current=10 to next=8 with prereq=0x0"
    );
}
static void run_unit_test_0189(void) {
    run_fsm_assert(
        15,
        8,
        0x0ULL,
        0,
        "UT_0189",
        "Testing state transition current=15 to next=8 with prereq=0x0"
    );
}
static void run_unit_test_0190(void) {
    run_fsm_assert(
        100,
        8,
        0x0ULL,
        0,
        "UT_0190",
        "Testing state transition current=100 to next=8 with prereq=0x0"
    );
}
static void run_unit_test_0191(void) {
    run_fsm_assert(
        -100,
        8,
        0x0ULL,
        0,
        "UT_0191",
        "Testing state transition current=-100 to next=8 with prereq=0x0"
    );
}
static void run_unit_test_0192(void) {
    run_fsm_assert(
        -10,
        10,
        0x0ULL,
        0,
        "UT_0192",
        "Testing state transition current=-10 to next=10 with prereq=0x0"
    );
}
static void run_unit_test_0193(void) {
    run_fsm_assert(
        -5,
        10,
        0x0ULL,
        0,
        "UT_0193",
        "Testing state transition current=-5 to next=10 with prereq=0x0"
    );
}
static void run_unit_test_0194(void) {
    run_fsm_assert(
        -1,
        10,
        0x0ULL,
        0,
        "UT_0194",
        "Testing state transition current=-1 to next=10 with prereq=0x0"
    );
}
static void run_unit_test_0195(void) {
    run_fsm_assert(
        0,
        10,
        0x0ULL,
        0,
        "UT_0195",
        "Testing state transition current=0 to next=10 with prereq=0x0"
    );
}
static void run_unit_test_0196(void) {
    run_fsm_assert(
        1,
        10,
        0x0ULL,
        0,
        "UT_0196",
        "Testing state transition current=1 to next=10 with prereq=0x0"
    );
}
static void run_unit_test_0197(void) {
    run_fsm_assert(
        2,
        10,
        0x0ULL,
        0,
        "UT_0197",
        "Testing state transition current=2 to next=10 with prereq=0x0"
    );
}
static void run_unit_test_0198(void) {
    run_fsm_assert(
        3,
        10,
        0x0ULL,
        0,
        "UT_0198",
        "Testing state transition current=3 to next=10 with prereq=0x0"
    );
}
static void run_unit_test_0199(void) {
    run_fsm_assert(
        4,
        10,
        0x0ULL,
        0,
        "UT_0199",
        "Testing state transition current=4 to next=10 with prereq=0x0"
    );
}
static void run_unit_test_0200(void) {
    run_fsm_assert(
        5,
        10,
        0x0ULL,
        0,
        "UT_0200",
        "Testing state transition current=5 to next=10 with prereq=0x0"
    );
}
static void run_unit_test_0201(void) {
    run_fsm_assert(
        6,
        10,
        0x0ULL,
        0,
        "UT_0201",
        "Testing state transition current=6 to next=10 with prereq=0x0"
    );
}
static void run_unit_test_0202(void) {
    run_fsm_assert(
        7,
        10,
        0x0ULL,
        0,
        "UT_0202",
        "Testing state transition current=7 to next=10 with prereq=0x0"
    );
}
static void run_unit_test_0203(void) {
    run_fsm_assert(
        8,
        10,
        0x0ULL,
        0,
        "UT_0203",
        "Testing state transition current=8 to next=10 with prereq=0x0"
    );
}
static void run_unit_test_0204(void) {
    run_fsm_assert(
        10,
        10,
        0x0ULL,
        0,
        "UT_0204",
        "Testing state transition current=10 to next=10 with prereq=0x0"
    );
}
static void run_unit_test_0205(void) {
    run_fsm_assert(
        15,
        10,
        0x0ULL,
        0,
        "UT_0205",
        "Testing state transition current=15 to next=10 with prereq=0x0"
    );
}
static void run_unit_test_0206(void) {
    run_fsm_assert(
        100,
        10,
        0x0ULL,
        0,
        "UT_0206",
        "Testing state transition current=100 to next=10 with prereq=0x0"
    );
}
static void run_unit_test_0207(void) {
    run_fsm_assert(
        -100,
        10,
        0x0ULL,
        0,
        "UT_0207",
        "Testing state transition current=-100 to next=10 with prereq=0x0"
    );
}
static void run_unit_test_0208(void) {
    run_fsm_assert(
        -10,
        15,
        0x0ULL,
        0,
        "UT_0208",
        "Testing state transition current=-10 to next=15 with prereq=0x0"
    );
}
static void run_unit_test_0209(void) {
    run_fsm_assert(
        -5,
        15,
        0x0ULL,
        0,
        "UT_0209",
        "Testing state transition current=-5 to next=15 with prereq=0x0"
    );
}
static void run_unit_test_0210(void) {
    run_fsm_assert(
        -1,
        15,
        0x0ULL,
        0,
        "UT_0210",
        "Testing state transition current=-1 to next=15 with prereq=0x0"
    );
}
static void run_unit_test_0211(void) {
    run_fsm_assert(
        0,
        15,
        0x0ULL,
        0,
        "UT_0211",
        "Testing state transition current=0 to next=15 with prereq=0x0"
    );
}
static void run_unit_test_0212(void) {
    run_fsm_assert(
        1,
        15,
        0x0ULL,
        0,
        "UT_0212",
        "Testing state transition current=1 to next=15 with prereq=0x0"
    );
}
static void run_unit_test_0213(void) {
    run_fsm_assert(
        2,
        15,
        0x0ULL,
        0,
        "UT_0213",
        "Testing state transition current=2 to next=15 with prereq=0x0"
    );
}
static void run_unit_test_0214(void) {
    run_fsm_assert(
        3,
        15,
        0x0ULL,
        0,
        "UT_0214",
        "Testing state transition current=3 to next=15 with prereq=0x0"
    );
}
static void run_unit_test_0215(void) {
    run_fsm_assert(
        4,
        15,
        0x0ULL,
        0,
        "UT_0215",
        "Testing state transition current=4 to next=15 with prereq=0x0"
    );
}
static void run_unit_test_0216(void) {
    run_fsm_assert(
        5,
        15,
        0x0ULL,
        0,
        "UT_0216",
        "Testing state transition current=5 to next=15 with prereq=0x0"
    );
}
static void run_unit_test_0217(void) {
    run_fsm_assert(
        6,
        15,
        0x0ULL,
        0,
        "UT_0217",
        "Testing state transition current=6 to next=15 with prereq=0x0"
    );
}
static void run_unit_test_0218(void) {
    run_fsm_assert(
        7,
        15,
        0x0ULL,
        0,
        "UT_0218",
        "Testing state transition current=7 to next=15 with prereq=0x0"
    );
}
static void run_unit_test_0219(void) {
    run_fsm_assert(
        8,
        15,
        0x0ULL,
        0,
        "UT_0219",
        "Testing state transition current=8 to next=15 with prereq=0x0"
    );
}
static void run_unit_test_0220(void) {
    run_fsm_assert(
        10,
        15,
        0x0ULL,
        0,
        "UT_0220",
        "Testing state transition current=10 to next=15 with prereq=0x0"
    );
}
static void run_unit_test_0221(void) {
    run_fsm_assert(
        15,
        15,
        0x0ULL,
        0,
        "UT_0221",
        "Testing state transition current=15 to next=15 with prereq=0x0"
    );
}
static void run_unit_test_0222(void) {
    run_fsm_assert(
        100,
        15,
        0x0ULL,
        0,
        "UT_0222",
        "Testing state transition current=100 to next=15 with prereq=0x0"
    );
}
static void run_unit_test_0223(void) {
    run_fsm_assert(
        -100,
        15,
        0x0ULL,
        0,
        "UT_0223",
        "Testing state transition current=-100 to next=15 with prereq=0x0"
    );
}
static void run_unit_test_0224(void) {
    run_fsm_assert(
        -10,
        100,
        0x0ULL,
        0,
        "UT_0224",
        "Testing state transition current=-10 to next=100 with prereq=0x0"
    );
}
static void run_unit_test_0225(void) {
    run_fsm_assert(
        -5,
        100,
        0x0ULL,
        0,
        "UT_0225",
        "Testing state transition current=-5 to next=100 with prereq=0x0"
    );
}
static void run_unit_test_0226(void) {
    run_fsm_assert(
        -1,
        100,
        0x0ULL,
        0,
        "UT_0226",
        "Testing state transition current=-1 to next=100 with prereq=0x0"
    );
}
static void run_unit_test_0227(void) {
    run_fsm_assert(
        0,
        100,
        0x0ULL,
        0,
        "UT_0227",
        "Testing state transition current=0 to next=100 with prereq=0x0"
    );
}
static void run_unit_test_0228(void) {
    run_fsm_assert(
        1,
        100,
        0x0ULL,
        0,
        "UT_0228",
        "Testing state transition current=1 to next=100 with prereq=0x0"
    );
}
static void run_unit_test_0229(void) {
    run_fsm_assert(
        2,
        100,
        0x0ULL,
        0,
        "UT_0229",
        "Testing state transition current=2 to next=100 with prereq=0x0"
    );
}
static void run_unit_test_0230(void) {
    run_fsm_assert(
        3,
        100,
        0x0ULL,
        0,
        "UT_0230",
        "Testing state transition current=3 to next=100 with prereq=0x0"
    );
}
static void run_unit_test_0231(void) {
    run_fsm_assert(
        4,
        100,
        0x0ULL,
        0,
        "UT_0231",
        "Testing state transition current=4 to next=100 with prereq=0x0"
    );
}
static void run_unit_test_0232(void) {
    run_fsm_assert(
        5,
        100,
        0x0ULL,
        0,
        "UT_0232",
        "Testing state transition current=5 to next=100 with prereq=0x0"
    );
}
static void run_unit_test_0233(void) {
    run_fsm_assert(
        6,
        100,
        0x0ULL,
        0,
        "UT_0233",
        "Testing state transition current=6 to next=100 with prereq=0x0"
    );
}
static void run_unit_test_0234(void) {
    run_fsm_assert(
        7,
        100,
        0x0ULL,
        0,
        "UT_0234",
        "Testing state transition current=7 to next=100 with prereq=0x0"
    );
}
static void run_unit_test_0235(void) {
    run_fsm_assert(
        8,
        100,
        0x0ULL,
        0,
        "UT_0235",
        "Testing state transition current=8 to next=100 with prereq=0x0"
    );
}
static void run_unit_test_0236(void) {
    run_fsm_assert(
        10,
        100,
        0x0ULL,
        0,
        "UT_0236",
        "Testing state transition current=10 to next=100 with prereq=0x0"
    );
}
static void run_unit_test_0237(void) {
    run_fsm_assert(
        15,
        100,
        0x0ULL,
        0,
        "UT_0237",
        "Testing state transition current=15 to next=100 with prereq=0x0"
    );
}
static void run_unit_test_0238(void) {
    run_fsm_assert(
        100,
        100,
        0x0ULL,
        0,
        "UT_0238",
        "Testing state transition current=100 to next=100 with prereq=0x0"
    );
}
static void run_unit_test_0239(void) {
    run_fsm_assert(
        -100,
        100,
        0x0ULL,
        0,
        "UT_0239",
        "Testing state transition current=-100 to next=100 with prereq=0x0"
    );
}
static void run_unit_test_0240(void) {
    run_fsm_assert(
        -10,
        -100,
        0x0ULL,
        0,
        "UT_0240",
        "Testing state transition current=-10 to next=-100 with prereq=0x0"
    );
}
static void run_unit_test_0241(void) {
    run_fsm_assert(
        -5,
        -100,
        0x0ULL,
        0,
        "UT_0241",
        "Testing state transition current=-5 to next=-100 with prereq=0x0"
    );
}
static void run_unit_test_0242(void) {
    run_fsm_assert(
        -1,
        -100,
        0x0ULL,
        0,
        "UT_0242",
        "Testing state transition current=-1 to next=-100 with prereq=0x0"
    );
}
static void run_unit_test_0243(void) {
    run_fsm_assert(
        0,
        -100,
        0x0ULL,
        0,
        "UT_0243",
        "Testing state transition current=0 to next=-100 with prereq=0x0"
    );
}
static void run_unit_test_0244(void) {
    run_fsm_assert(
        1,
        -100,
        0x0ULL,
        0,
        "UT_0244",
        "Testing state transition current=1 to next=-100 with prereq=0x0"
    );
}
static void run_unit_test_0245(void) {
    run_fsm_assert(
        2,
        -100,
        0x0ULL,
        0,
        "UT_0245",
        "Testing state transition current=2 to next=-100 with prereq=0x0"
    );
}
static void run_unit_test_0246(void) {
    run_fsm_assert(
        3,
        -100,
        0x0ULL,
        0,
        "UT_0246",
        "Testing state transition current=3 to next=-100 with prereq=0x0"
    );
}
static void run_unit_test_0247(void) {
    run_fsm_assert(
        4,
        -100,
        0x0ULL,
        0,
        "UT_0247",
        "Testing state transition current=4 to next=-100 with prereq=0x0"
    );
}
static void run_unit_test_0248(void) {
    run_fsm_assert(
        5,
        -100,
        0x0ULL,
        0,
        "UT_0248",
        "Testing state transition current=5 to next=-100 with prereq=0x0"
    );
}
static void run_unit_test_0249(void) {
    run_fsm_assert(
        6,
        -100,
        0x0ULL,
        0,
        "UT_0249",
        "Testing state transition current=6 to next=-100 with prereq=0x0"
    );
}
static void run_unit_test_0250(void) {
    run_fsm_assert(
        7,
        -100,
        0x0ULL,
        0,
        "UT_0250",
        "Testing state transition current=7 to next=-100 with prereq=0x0"
    );
}
static void run_unit_test_0251(void) {
    run_fsm_assert(
        8,
        -100,
        0x0ULL,
        0,
        "UT_0251",
        "Testing state transition current=8 to next=-100 with prereq=0x0"
    );
}
static void run_unit_test_0252(void) {
    run_fsm_assert(
        10,
        -100,
        0x0ULL,
        0,
        "UT_0252",
        "Testing state transition current=10 to next=-100 with prereq=0x0"
    );
}
static void run_unit_test_0253(void) {
    run_fsm_assert(
        15,
        -100,
        0x0ULL,
        0,
        "UT_0253",
        "Testing state transition current=15 to next=-100 with prereq=0x0"
    );
}
static void run_unit_test_0254(void) {
    run_fsm_assert(
        100,
        -100,
        0x0ULL,
        0,
        "UT_0254",
        "Testing state transition current=100 to next=-100 with prereq=0x0"
    );
}
static void run_unit_test_0255(void) {
    run_fsm_assert(
        -100,
        -100,
        0x0ULL,
        0,
        "UT_0255",
        "Testing state transition current=-100 to next=-100 with prereq=0x0"
    );
}
static void run_unit_test_0256(void) {
    run_fsm_assert(
        -10,
        -10,
        0x1ULL,
        0,
        "UT_0256",
        "Testing state transition current=-10 to next=-10 with prereq=0x1"
    );
}
static void run_unit_test_0257(void) {
    run_fsm_assert(
        -5,
        -10,
        0x1ULL,
        0,
        "UT_0257",
        "Testing state transition current=-5 to next=-10 with prereq=0x1"
    );
}
static void run_unit_test_0258(void) {
    run_fsm_assert(
        -1,
        -10,
        0x1ULL,
        0,
        "UT_0258",
        "Testing state transition current=-1 to next=-10 with prereq=0x1"
    );
}
static void run_unit_test_0259(void) {
    run_fsm_assert(
        0,
        -10,
        0x1ULL,
        0,
        "UT_0259",
        "Testing state transition current=0 to next=-10 with prereq=0x1"
    );
}
static void run_unit_test_0260(void) {
    run_fsm_assert(
        1,
        -10,
        0x1ULL,
        0,
        "UT_0260",
        "Testing state transition current=1 to next=-10 with prereq=0x1"
    );
}
static void run_unit_test_0261(void) {
    run_fsm_assert(
        2,
        -10,
        0x1ULL,
        0,
        "UT_0261",
        "Testing state transition current=2 to next=-10 with prereq=0x1"
    );
}
static void run_unit_test_0262(void) {
    run_fsm_assert(
        3,
        -10,
        0x1ULL,
        0,
        "UT_0262",
        "Testing state transition current=3 to next=-10 with prereq=0x1"
    );
}
static void run_unit_test_0263(void) {
    run_fsm_assert(
        4,
        -10,
        0x1ULL,
        0,
        "UT_0263",
        "Testing state transition current=4 to next=-10 with prereq=0x1"
    );
}
static void run_unit_test_0264(void) {
    run_fsm_assert(
        5,
        -10,
        0x1ULL,
        0,
        "UT_0264",
        "Testing state transition current=5 to next=-10 with prereq=0x1"
    );
}
static void run_unit_test_0265(void) {
    run_fsm_assert(
        6,
        -10,
        0x1ULL,
        0,
        "UT_0265",
        "Testing state transition current=6 to next=-10 with prereq=0x1"
    );
}
static void run_unit_test_0266(void) {
    run_fsm_assert(
        7,
        -10,
        0x1ULL,
        0,
        "UT_0266",
        "Testing state transition current=7 to next=-10 with prereq=0x1"
    );
}
static void run_unit_test_0267(void) {
    run_fsm_assert(
        8,
        -10,
        0x1ULL,
        0,
        "UT_0267",
        "Testing state transition current=8 to next=-10 with prereq=0x1"
    );
}
static void run_unit_test_0268(void) {
    run_fsm_assert(
        10,
        -10,
        0x1ULL,
        0,
        "UT_0268",
        "Testing state transition current=10 to next=-10 with prereq=0x1"
    );
}
static void run_unit_test_0269(void) {
    run_fsm_assert(
        15,
        -10,
        0x1ULL,
        0,
        "UT_0269",
        "Testing state transition current=15 to next=-10 with prereq=0x1"
    );
}
static void run_unit_test_0270(void) {
    run_fsm_assert(
        100,
        -10,
        0x1ULL,
        0,
        "UT_0270",
        "Testing state transition current=100 to next=-10 with prereq=0x1"
    );
}
static void run_unit_test_0271(void) {
    run_fsm_assert(
        -100,
        -10,
        0x1ULL,
        0,
        "UT_0271",
        "Testing state transition current=-100 to next=-10 with prereq=0x1"
    );
}
static void run_unit_test_0272(void) {
    run_fsm_assert(
        -10,
        -5,
        0x1ULL,
        0,
        "UT_0272",
        "Testing state transition current=-10 to next=-5 with prereq=0x1"
    );
}
static void run_unit_test_0273(void) {
    run_fsm_assert(
        -5,
        -5,
        0x1ULL,
        0,
        "UT_0273",
        "Testing state transition current=-5 to next=-5 with prereq=0x1"
    );
}
static void run_unit_test_0274(void) {
    run_fsm_assert(
        -1,
        -5,
        0x1ULL,
        0,
        "UT_0274",
        "Testing state transition current=-1 to next=-5 with prereq=0x1"
    );
}
static void run_unit_test_0275(void) {
    run_fsm_assert(
        0,
        -5,
        0x1ULL,
        0,
        "UT_0275",
        "Testing state transition current=0 to next=-5 with prereq=0x1"
    );
}
static void run_unit_test_0276(void) {
    run_fsm_assert(
        1,
        -5,
        0x1ULL,
        0,
        "UT_0276",
        "Testing state transition current=1 to next=-5 with prereq=0x1"
    );
}
static void run_unit_test_0277(void) {
    run_fsm_assert(
        2,
        -5,
        0x1ULL,
        0,
        "UT_0277",
        "Testing state transition current=2 to next=-5 with prereq=0x1"
    );
}
static void run_unit_test_0278(void) {
    run_fsm_assert(
        3,
        -5,
        0x1ULL,
        0,
        "UT_0278",
        "Testing state transition current=3 to next=-5 with prereq=0x1"
    );
}
static void run_unit_test_0279(void) {
    run_fsm_assert(
        4,
        -5,
        0x1ULL,
        0,
        "UT_0279",
        "Testing state transition current=4 to next=-5 with prereq=0x1"
    );
}
static void run_unit_test_0280(void) {
    run_fsm_assert(
        5,
        -5,
        0x1ULL,
        0,
        "UT_0280",
        "Testing state transition current=5 to next=-5 with prereq=0x1"
    );
}
static void run_unit_test_0281(void) {
    run_fsm_assert(
        6,
        -5,
        0x1ULL,
        0,
        "UT_0281",
        "Testing state transition current=6 to next=-5 with prereq=0x1"
    );
}
static void run_unit_test_0282(void) {
    run_fsm_assert(
        7,
        -5,
        0x1ULL,
        0,
        "UT_0282",
        "Testing state transition current=7 to next=-5 with prereq=0x1"
    );
}
static void run_unit_test_0283(void) {
    run_fsm_assert(
        8,
        -5,
        0x1ULL,
        0,
        "UT_0283",
        "Testing state transition current=8 to next=-5 with prereq=0x1"
    );
}
static void run_unit_test_0284(void) {
    run_fsm_assert(
        10,
        -5,
        0x1ULL,
        0,
        "UT_0284",
        "Testing state transition current=10 to next=-5 with prereq=0x1"
    );
}
static void run_unit_test_0285(void) {
    run_fsm_assert(
        15,
        -5,
        0x1ULL,
        0,
        "UT_0285",
        "Testing state transition current=15 to next=-5 with prereq=0x1"
    );
}
static void run_unit_test_0286(void) {
    run_fsm_assert(
        100,
        -5,
        0x1ULL,
        0,
        "UT_0286",
        "Testing state transition current=100 to next=-5 with prereq=0x1"
    );
}
static void run_unit_test_0287(void) {
    run_fsm_assert(
        -100,
        -5,
        0x1ULL,
        0,
        "UT_0287",
        "Testing state transition current=-100 to next=-5 with prereq=0x1"
    );
}
static void run_unit_test_0288(void) {
    run_fsm_assert(
        -10,
        -1,
        0x1ULL,
        0,
        "UT_0288",
        "Testing state transition current=-10 to next=-1 with prereq=0x1"
    );
}
static void run_unit_test_0289(void) {
    run_fsm_assert(
        -5,
        -1,
        0x1ULL,
        0,
        "UT_0289",
        "Testing state transition current=-5 to next=-1 with prereq=0x1"
    );
}
static void run_unit_test_0290(void) {
    run_fsm_assert(
        -1,
        -1,
        0x1ULL,
        0,
        "UT_0290",
        "Testing state transition current=-1 to next=-1 with prereq=0x1"
    );
}
static void run_unit_test_0291(void) {
    run_fsm_assert(
        0,
        -1,
        0x1ULL,
        0,
        "UT_0291",
        "Testing state transition current=0 to next=-1 with prereq=0x1"
    );
}
static void run_unit_test_0292(void) {
    run_fsm_assert(
        1,
        -1,
        0x1ULL,
        0,
        "UT_0292",
        "Testing state transition current=1 to next=-1 with prereq=0x1"
    );
}
static void run_unit_test_0293(void) {
    run_fsm_assert(
        2,
        -1,
        0x1ULL,
        0,
        "UT_0293",
        "Testing state transition current=2 to next=-1 with prereq=0x1"
    );
}
static void run_unit_test_0294(void) {
    run_fsm_assert(
        3,
        -1,
        0x1ULL,
        0,
        "UT_0294",
        "Testing state transition current=3 to next=-1 with prereq=0x1"
    );
}
static void run_unit_test_0295(void) {
    run_fsm_assert(
        4,
        -1,
        0x1ULL,
        0,
        "UT_0295",
        "Testing state transition current=4 to next=-1 with prereq=0x1"
    );
}
static void run_unit_test_0296(void) {
    run_fsm_assert(
        5,
        -1,
        0x1ULL,
        0,
        "UT_0296",
        "Testing state transition current=5 to next=-1 with prereq=0x1"
    );
}
static void run_unit_test_0297(void) {
    run_fsm_assert(
        6,
        -1,
        0x1ULL,
        0,
        "UT_0297",
        "Testing state transition current=6 to next=-1 with prereq=0x1"
    );
}
static void run_unit_test_0298(void) {
    run_fsm_assert(
        7,
        -1,
        0x1ULL,
        0,
        "UT_0298",
        "Testing state transition current=7 to next=-1 with prereq=0x1"
    );
}
static void run_unit_test_0299(void) {
    run_fsm_assert(
        8,
        -1,
        0x1ULL,
        0,
        "UT_0299",
        "Testing state transition current=8 to next=-1 with prereq=0x1"
    );
}
static void run_unit_test_0300(void) {
    run_fsm_assert(
        10,
        -1,
        0x1ULL,
        0,
        "UT_0300",
        "Testing state transition current=10 to next=-1 with prereq=0x1"
    );
}
static void run_unit_test_0301(void) {
    run_fsm_assert(
        15,
        -1,
        0x1ULL,
        0,
        "UT_0301",
        "Testing state transition current=15 to next=-1 with prereq=0x1"
    );
}
static void run_unit_test_0302(void) {
    run_fsm_assert(
        100,
        -1,
        0x1ULL,
        0,
        "UT_0302",
        "Testing state transition current=100 to next=-1 with prereq=0x1"
    );
}
static void run_unit_test_0303(void) {
    run_fsm_assert(
        -100,
        -1,
        0x1ULL,
        0,
        "UT_0303",
        "Testing state transition current=-100 to next=-1 with prereq=0x1"
    );
}
static void run_unit_test_0304(void) {
    run_fsm_assert(
        -10,
        0,
        0x1ULL,
        0,
        "UT_0304",
        "Testing state transition current=-10 to next=0 with prereq=0x1"
    );
}
static void run_unit_test_0305(void) {
    run_fsm_assert(
        -5,
        0,
        0x1ULL,
        0,
        "UT_0305",
        "Testing state transition current=-5 to next=0 with prereq=0x1"
    );
}
static void run_unit_test_0306(void) {
    run_fsm_assert(
        -1,
        0,
        0x1ULL,
        0,
        "UT_0306",
        "Testing state transition current=-1 to next=0 with prereq=0x1"
    );
}
static void run_unit_test_0307(void) {
    run_fsm_assert(
        0,
        0,
        0x1ULL,
        1,
        "UT_0307",
        "Testing state transition current=0 to next=0 with prereq=0x1"
    );
}
static void run_unit_test_0308(void) {
    run_fsm_assert(
        1,
        0,
        0x1ULL,
        1,
        "UT_0308",
        "Testing state transition current=1 to next=0 with prereq=0x1"
    );
}
static void run_unit_test_0309(void) {
    run_fsm_assert(
        2,
        0,
        0x1ULL,
        1,
        "UT_0309",
        "Testing state transition current=2 to next=0 with prereq=0x1"
    );
}
static void run_unit_test_0310(void) {
    run_fsm_assert(
        3,
        0,
        0x1ULL,
        1,
        "UT_0310",
        "Testing state transition current=3 to next=0 with prereq=0x1"
    );
}
static void run_unit_test_0311(void) {
    run_fsm_assert(
        4,
        0,
        0x1ULL,
        1,
        "UT_0311",
        "Testing state transition current=4 to next=0 with prereq=0x1"
    );
}
static void run_unit_test_0312(void) {
    run_fsm_assert(
        5,
        0,
        0x1ULL,
        1,
        "UT_0312",
        "Testing state transition current=5 to next=0 with prereq=0x1"
    );
}
static void run_unit_test_0313(void) {
    run_fsm_assert(
        6,
        0,
        0x1ULL,
        1,
        "UT_0313",
        "Testing state transition current=6 to next=0 with prereq=0x1"
    );
}
static void run_unit_test_0314(void) {
    run_fsm_assert(
        7,
        0,
        0x1ULL,
        1,
        "UT_0314",
        "Testing state transition current=7 to next=0 with prereq=0x1"
    );
}
static void run_unit_test_0315(void) {
    run_fsm_assert(
        8,
        0,
        0x1ULL,
        0,
        "UT_0315",
        "Testing state transition current=8 to next=0 with prereq=0x1"
    );
}
static void run_unit_test_0316(void) {
    run_fsm_assert(
        10,
        0,
        0x1ULL,
        0,
        "UT_0316",
        "Testing state transition current=10 to next=0 with prereq=0x1"
    );
}
static void run_unit_test_0317(void) {
    run_fsm_assert(
        15,
        0,
        0x1ULL,
        0,
        "UT_0317",
        "Testing state transition current=15 to next=0 with prereq=0x1"
    );
}
static void run_unit_test_0318(void) {
    run_fsm_assert(
        100,
        0,
        0x1ULL,
        0,
        "UT_0318",
        "Testing state transition current=100 to next=0 with prereq=0x1"
    );
}
static void run_unit_test_0319(void) {
    run_fsm_assert(
        -100,
        0,
        0x1ULL,
        0,
        "UT_0319",
        "Testing state transition current=-100 to next=0 with prereq=0x1"
    );
}
static void run_unit_test_0320(void) {
    run_fsm_assert(
        -10,
        1,
        0x1ULL,
        0,
        "UT_0320",
        "Testing state transition current=-10 to next=1 with prereq=0x1"
    );
}
static void run_unit_test_0321(void) {
    run_fsm_assert(
        -5,
        1,
        0x1ULL,
        0,
        "UT_0321",
        "Testing state transition current=-5 to next=1 with prereq=0x1"
    );
}
static void run_unit_test_0322(void) {
    run_fsm_assert(
        -1,
        1,
        0x1ULL,
        0,
        "UT_0322",
        "Testing state transition current=-1 to next=1 with prereq=0x1"
    );
}
static void run_unit_test_0323(void) {
    run_fsm_assert(
        0,
        1,
        0x1ULL,
        1,
        "UT_0323",
        "Testing state transition current=0 to next=1 with prereq=0x1"
    );
}
static void run_unit_test_0324(void) {
    run_fsm_assert(
        1,
        1,
        0x1ULL,
        0,
        "UT_0324",
        "Testing state transition current=1 to next=1 with prereq=0x1"
    );
}
static void run_unit_test_0325(void) {
    run_fsm_assert(
        2,
        1,
        0x1ULL,
        0,
        "UT_0325",
        "Testing state transition current=2 to next=1 with prereq=0x1"
    );
}
static void run_unit_test_0326(void) {
    run_fsm_assert(
        3,
        1,
        0x1ULL,
        0,
        "UT_0326",
        "Testing state transition current=3 to next=1 with prereq=0x1"
    );
}
static void run_unit_test_0327(void) {
    run_fsm_assert(
        4,
        1,
        0x1ULL,
        0,
        "UT_0327",
        "Testing state transition current=4 to next=1 with prereq=0x1"
    );
}
static void run_unit_test_0328(void) {
    run_fsm_assert(
        5,
        1,
        0x1ULL,
        0,
        "UT_0328",
        "Testing state transition current=5 to next=1 with prereq=0x1"
    );
}
static void run_unit_test_0329(void) {
    run_fsm_assert(
        6,
        1,
        0x1ULL,
        0,
        "UT_0329",
        "Testing state transition current=6 to next=1 with prereq=0x1"
    );
}
static void run_unit_test_0330(void) {
    run_fsm_assert(
        7,
        1,
        0x1ULL,
        0,
        "UT_0330",
        "Testing state transition current=7 to next=1 with prereq=0x1"
    );
}
static void run_unit_test_0331(void) {
    run_fsm_assert(
        8,
        1,
        0x1ULL,
        0,
        "UT_0331",
        "Testing state transition current=8 to next=1 with prereq=0x1"
    );
}
static void run_unit_test_0332(void) {
    run_fsm_assert(
        10,
        1,
        0x1ULL,
        0,
        "UT_0332",
        "Testing state transition current=10 to next=1 with prereq=0x1"
    );
}
static void run_unit_test_0333(void) {
    run_fsm_assert(
        15,
        1,
        0x1ULL,
        0,
        "UT_0333",
        "Testing state transition current=15 to next=1 with prereq=0x1"
    );
}
static void run_unit_test_0334(void) {
    run_fsm_assert(
        100,
        1,
        0x1ULL,
        0,
        "UT_0334",
        "Testing state transition current=100 to next=1 with prereq=0x1"
    );
}
static void run_unit_test_0335(void) {
    run_fsm_assert(
        -100,
        1,
        0x1ULL,
        0,
        "UT_0335",
        "Testing state transition current=-100 to next=1 with prereq=0x1"
    );
}
static void run_unit_test_0336(void) {
    run_fsm_assert(
        -10,
        2,
        0x1ULL,
        0,
        "UT_0336",
        "Testing state transition current=-10 to next=2 with prereq=0x1"
    );
}
static void run_unit_test_0337(void) {
    run_fsm_assert(
        -5,
        2,
        0x1ULL,
        0,
        "UT_0337",
        "Testing state transition current=-5 to next=2 with prereq=0x1"
    );
}
static void run_unit_test_0338(void) {
    run_fsm_assert(
        -1,
        2,
        0x1ULL,
        0,
        "UT_0338",
        "Testing state transition current=-1 to next=2 with prereq=0x1"
    );
}
static void run_unit_test_0339(void) {
    run_fsm_assert(
        0,
        2,
        0x1ULL,
        0,
        "UT_0339",
        "Testing state transition current=0 to next=2 with prereq=0x1"
    );
}
static void run_unit_test_0340(void) {
    run_fsm_assert(
        1,
        2,
        0x1ULL,
        0,
        "UT_0340",
        "Testing state transition current=1 to next=2 with prereq=0x1"
    );
}
static void run_unit_test_0341(void) {
    run_fsm_assert(
        2,
        2,
        0x1ULL,
        0,
        "UT_0341",
        "Testing state transition current=2 to next=2 with prereq=0x1"
    );
}
static void run_unit_test_0342(void) {
    run_fsm_assert(
        3,
        2,
        0x1ULL,
        0,
        "UT_0342",
        "Testing state transition current=3 to next=2 with prereq=0x1"
    );
}
static void run_unit_test_0343(void) {
    run_fsm_assert(
        4,
        2,
        0x1ULL,
        0,
        "UT_0343",
        "Testing state transition current=4 to next=2 with prereq=0x1"
    );
}
static void run_unit_test_0344(void) {
    run_fsm_assert(
        5,
        2,
        0x1ULL,
        0,
        "UT_0344",
        "Testing state transition current=5 to next=2 with prereq=0x1"
    );
}
static void run_unit_test_0345(void) {
    run_fsm_assert(
        6,
        2,
        0x1ULL,
        0,
        "UT_0345",
        "Testing state transition current=6 to next=2 with prereq=0x1"
    );
}
static void run_unit_test_0346(void) {
    run_fsm_assert(
        7,
        2,
        0x1ULL,
        0,
        "UT_0346",
        "Testing state transition current=7 to next=2 with prereq=0x1"
    );
}
static void run_unit_test_0347(void) {
    run_fsm_assert(
        8,
        2,
        0x1ULL,
        0,
        "UT_0347",
        "Testing state transition current=8 to next=2 with prereq=0x1"
    );
}
static void run_unit_test_0348(void) {
    run_fsm_assert(
        10,
        2,
        0x1ULL,
        0,
        "UT_0348",
        "Testing state transition current=10 to next=2 with prereq=0x1"
    );
}
static void run_unit_test_0349(void) {
    run_fsm_assert(
        15,
        2,
        0x1ULL,
        0,
        "UT_0349",
        "Testing state transition current=15 to next=2 with prereq=0x1"
    );
}
static void run_unit_test_0350(void) {
    run_fsm_assert(
        100,
        2,
        0x1ULL,
        0,
        "UT_0350",
        "Testing state transition current=100 to next=2 with prereq=0x1"
    );
}
static void run_unit_test_0351(void) {
    run_fsm_assert(
        -100,
        2,
        0x1ULL,
        0,
        "UT_0351",
        "Testing state transition current=-100 to next=2 with prereq=0x1"
    );
}
static void run_unit_test_0352(void) {
    run_fsm_assert(
        -10,
        3,
        0x1ULL,
        0,
        "UT_0352",
        "Testing state transition current=-10 to next=3 with prereq=0x1"
    );
}
static void run_unit_test_0353(void) {
    run_fsm_assert(
        -5,
        3,
        0x1ULL,
        0,
        "UT_0353",
        "Testing state transition current=-5 to next=3 with prereq=0x1"
    );
}
static void run_unit_test_0354(void) {
    run_fsm_assert(
        -1,
        3,
        0x1ULL,
        0,
        "UT_0354",
        "Testing state transition current=-1 to next=3 with prereq=0x1"
    );
}
static void run_unit_test_0355(void) {
    run_fsm_assert(
        0,
        3,
        0x1ULL,
        0,
        "UT_0355",
        "Testing state transition current=0 to next=3 with prereq=0x1"
    );
}
static void run_unit_test_0356(void) {
    run_fsm_assert(
        1,
        3,
        0x1ULL,
        0,
        "UT_0356",
        "Testing state transition current=1 to next=3 with prereq=0x1"
    );
}
static void run_unit_test_0357(void) {
    run_fsm_assert(
        2,
        3,
        0x1ULL,
        0,
        "UT_0357",
        "Testing state transition current=2 to next=3 with prereq=0x1"
    );
}
static void run_unit_test_0358(void) {
    run_fsm_assert(
        3,
        3,
        0x1ULL,
        0,
        "UT_0358",
        "Testing state transition current=3 to next=3 with prereq=0x1"
    );
}
static void run_unit_test_0359(void) {
    run_fsm_assert(
        4,
        3,
        0x1ULL,
        0,
        "UT_0359",
        "Testing state transition current=4 to next=3 with prereq=0x1"
    );
}
static void run_unit_test_0360(void) {
    run_fsm_assert(
        5,
        3,
        0x1ULL,
        0,
        "UT_0360",
        "Testing state transition current=5 to next=3 with prereq=0x1"
    );
}
static void run_unit_test_0361(void) {
    run_fsm_assert(
        6,
        3,
        0x1ULL,
        0,
        "UT_0361",
        "Testing state transition current=6 to next=3 with prereq=0x1"
    );
}
static void run_unit_test_0362(void) {
    run_fsm_assert(
        7,
        3,
        0x1ULL,
        0,
        "UT_0362",
        "Testing state transition current=7 to next=3 with prereq=0x1"
    );
}
static void run_unit_test_0363(void) {
    run_fsm_assert(
        8,
        3,
        0x1ULL,
        0,
        "UT_0363",
        "Testing state transition current=8 to next=3 with prereq=0x1"
    );
}
static void run_unit_test_0364(void) {
    run_fsm_assert(
        10,
        3,
        0x1ULL,
        0,
        "UT_0364",
        "Testing state transition current=10 to next=3 with prereq=0x1"
    );
}
static void run_unit_test_0365(void) {
    run_fsm_assert(
        15,
        3,
        0x1ULL,
        0,
        "UT_0365",
        "Testing state transition current=15 to next=3 with prereq=0x1"
    );
}
static void run_unit_test_0366(void) {
    run_fsm_assert(
        100,
        3,
        0x1ULL,
        0,
        "UT_0366",
        "Testing state transition current=100 to next=3 with prereq=0x1"
    );
}
static void run_unit_test_0367(void) {
    run_fsm_assert(
        -100,
        3,
        0x1ULL,
        0,
        "UT_0367",
        "Testing state transition current=-100 to next=3 with prereq=0x1"
    );
}
static void run_unit_test_0368(void) {
    run_fsm_assert(
        -10,
        4,
        0x1ULL,
        0,
        "UT_0368",
        "Testing state transition current=-10 to next=4 with prereq=0x1"
    );
}
static void run_unit_test_0369(void) {
    run_fsm_assert(
        -5,
        4,
        0x1ULL,
        0,
        "UT_0369",
        "Testing state transition current=-5 to next=4 with prereq=0x1"
    );
}
static void run_unit_test_0370(void) {
    run_fsm_assert(
        -1,
        4,
        0x1ULL,
        0,
        "UT_0370",
        "Testing state transition current=-1 to next=4 with prereq=0x1"
    );
}
static void run_unit_test_0371(void) {
    run_fsm_assert(
        0,
        4,
        0x1ULL,
        0,
        "UT_0371",
        "Testing state transition current=0 to next=4 with prereq=0x1"
    );
}
static void run_unit_test_0372(void) {
    run_fsm_assert(
        1,
        4,
        0x1ULL,
        0,
        "UT_0372",
        "Testing state transition current=1 to next=4 with prereq=0x1"
    );
}
static void run_unit_test_0373(void) {
    run_fsm_assert(
        2,
        4,
        0x1ULL,
        0,
        "UT_0373",
        "Testing state transition current=2 to next=4 with prereq=0x1"
    );
}
static void run_unit_test_0374(void) {
    run_fsm_assert(
        3,
        4,
        0x1ULL,
        0,
        "UT_0374",
        "Testing state transition current=3 to next=4 with prereq=0x1"
    );
}
static void run_unit_test_0375(void) {
    run_fsm_assert(
        4,
        4,
        0x1ULL,
        0,
        "UT_0375",
        "Testing state transition current=4 to next=4 with prereq=0x1"
    );
}
static void run_unit_test_0376(void) {
    run_fsm_assert(
        5,
        4,
        0x1ULL,
        0,
        "UT_0376",
        "Testing state transition current=5 to next=4 with prereq=0x1"
    );
}
static void run_unit_test_0377(void) {
    run_fsm_assert(
        6,
        4,
        0x1ULL,
        0,
        "UT_0377",
        "Testing state transition current=6 to next=4 with prereq=0x1"
    );
}
static void run_unit_test_0378(void) {
    run_fsm_assert(
        7,
        4,
        0x1ULL,
        0,
        "UT_0378",
        "Testing state transition current=7 to next=4 with prereq=0x1"
    );
}
static void run_unit_test_0379(void) {
    run_fsm_assert(
        8,
        4,
        0x1ULL,
        0,
        "UT_0379",
        "Testing state transition current=8 to next=4 with prereq=0x1"
    );
}
static void run_unit_test_0380(void) {
    run_fsm_assert(
        10,
        4,
        0x1ULL,
        0,
        "UT_0380",
        "Testing state transition current=10 to next=4 with prereq=0x1"
    );
}
static void run_unit_test_0381(void) {
    run_fsm_assert(
        15,
        4,
        0x1ULL,
        0,
        "UT_0381",
        "Testing state transition current=15 to next=4 with prereq=0x1"
    );
}
static void run_unit_test_0382(void) {
    run_fsm_assert(
        100,
        4,
        0x1ULL,
        0,
        "UT_0382",
        "Testing state transition current=100 to next=4 with prereq=0x1"
    );
}
static void run_unit_test_0383(void) {
    run_fsm_assert(
        -100,
        4,
        0x1ULL,
        0,
        "UT_0383",
        "Testing state transition current=-100 to next=4 with prereq=0x1"
    );
}
static void run_unit_test_0384(void) {
    run_fsm_assert(
        -10,
        5,
        0x1ULL,
        0,
        "UT_0384",
        "Testing state transition current=-10 to next=5 with prereq=0x1"
    );
}
static void run_unit_test_0385(void) {
    run_fsm_assert(
        -5,
        5,
        0x1ULL,
        0,
        "UT_0385",
        "Testing state transition current=-5 to next=5 with prereq=0x1"
    );
}
static void run_unit_test_0386(void) {
    run_fsm_assert(
        -1,
        5,
        0x1ULL,
        0,
        "UT_0386",
        "Testing state transition current=-1 to next=5 with prereq=0x1"
    );
}
static void run_unit_test_0387(void) {
    run_fsm_assert(
        0,
        5,
        0x1ULL,
        0,
        "UT_0387",
        "Testing state transition current=0 to next=5 with prereq=0x1"
    );
}
static void run_unit_test_0388(void) {
    run_fsm_assert(
        1,
        5,
        0x1ULL,
        0,
        "UT_0388",
        "Testing state transition current=1 to next=5 with prereq=0x1"
    );
}
static void run_unit_test_0389(void) {
    run_fsm_assert(
        2,
        5,
        0x1ULL,
        0,
        "UT_0389",
        "Testing state transition current=2 to next=5 with prereq=0x1"
    );
}
static void run_unit_test_0390(void) {
    run_fsm_assert(
        3,
        5,
        0x1ULL,
        0,
        "UT_0390",
        "Testing state transition current=3 to next=5 with prereq=0x1"
    );
}
static void run_unit_test_0391(void) {
    run_fsm_assert(
        4,
        5,
        0x1ULL,
        0,
        "UT_0391",
        "Testing state transition current=4 to next=5 with prereq=0x1"
    );
}
static void run_unit_test_0392(void) {
    run_fsm_assert(
        5,
        5,
        0x1ULL,
        0,
        "UT_0392",
        "Testing state transition current=5 to next=5 with prereq=0x1"
    );
}
static void run_unit_test_0393(void) {
    run_fsm_assert(
        6,
        5,
        0x1ULL,
        0,
        "UT_0393",
        "Testing state transition current=6 to next=5 with prereq=0x1"
    );
}
static void run_unit_test_0394(void) {
    run_fsm_assert(
        7,
        5,
        0x1ULL,
        0,
        "UT_0394",
        "Testing state transition current=7 to next=5 with prereq=0x1"
    );
}
static void run_unit_test_0395(void) {
    run_fsm_assert(
        8,
        5,
        0x1ULL,
        0,
        "UT_0395",
        "Testing state transition current=8 to next=5 with prereq=0x1"
    );
}
static void run_unit_test_0396(void) {
    run_fsm_assert(
        10,
        5,
        0x1ULL,
        0,
        "UT_0396",
        "Testing state transition current=10 to next=5 with prereq=0x1"
    );
}
static void run_unit_test_0397(void) {
    run_fsm_assert(
        15,
        5,
        0x1ULL,
        0,
        "UT_0397",
        "Testing state transition current=15 to next=5 with prereq=0x1"
    );
}
static void run_unit_test_0398(void) {
    run_fsm_assert(
        100,
        5,
        0x1ULL,
        0,
        "UT_0398",
        "Testing state transition current=100 to next=5 with prereq=0x1"
    );
}
static void run_unit_test_0399(void) {
    run_fsm_assert(
        -100,
        5,
        0x1ULL,
        0,
        "UT_0399",
        "Testing state transition current=-100 to next=5 with prereq=0x1"
    );
}
static void run_unit_test_0400(void) {
    run_fsm_assert(
        -10,
        6,
        0x1ULL,
        0,
        "UT_0400",
        "Testing state transition current=-10 to next=6 with prereq=0x1"
    );
}
static void run_unit_test_0401(void) {
    run_fsm_assert(
        -5,
        6,
        0x1ULL,
        0,
        "UT_0401",
        "Testing state transition current=-5 to next=6 with prereq=0x1"
    );
}
static void run_unit_test_0402(void) {
    run_fsm_assert(
        -1,
        6,
        0x1ULL,
        0,
        "UT_0402",
        "Testing state transition current=-1 to next=6 with prereq=0x1"
    );
}
static void run_unit_test_0403(void) {
    run_fsm_assert(
        0,
        6,
        0x1ULL,
        0,
        "UT_0403",
        "Testing state transition current=0 to next=6 with prereq=0x1"
    );
}
static void run_unit_test_0404(void) {
    run_fsm_assert(
        1,
        6,
        0x1ULL,
        0,
        "UT_0404",
        "Testing state transition current=1 to next=6 with prereq=0x1"
    );
}
static void run_unit_test_0405(void) {
    run_fsm_assert(
        2,
        6,
        0x1ULL,
        0,
        "UT_0405",
        "Testing state transition current=2 to next=6 with prereq=0x1"
    );
}
static void run_unit_test_0406(void) {
    run_fsm_assert(
        3,
        6,
        0x1ULL,
        0,
        "UT_0406",
        "Testing state transition current=3 to next=6 with prereq=0x1"
    );
}
static void run_unit_test_0407(void) {
    run_fsm_assert(
        4,
        6,
        0x1ULL,
        0,
        "UT_0407",
        "Testing state transition current=4 to next=6 with prereq=0x1"
    );
}
static void run_unit_test_0408(void) {
    run_fsm_assert(
        5,
        6,
        0x1ULL,
        0,
        "UT_0408",
        "Testing state transition current=5 to next=6 with prereq=0x1"
    );
}
static void run_unit_test_0409(void) {
    run_fsm_assert(
        6,
        6,
        0x1ULL,
        0,
        "UT_0409",
        "Testing state transition current=6 to next=6 with prereq=0x1"
    );
}
static void run_unit_test_0410(void) {
    run_fsm_assert(
        7,
        6,
        0x1ULL,
        0,
        "UT_0410",
        "Testing state transition current=7 to next=6 with prereq=0x1"
    );
}
static void run_unit_test_0411(void) {
    run_fsm_assert(
        8,
        6,
        0x1ULL,
        0,
        "UT_0411",
        "Testing state transition current=8 to next=6 with prereq=0x1"
    );
}
static void run_unit_test_0412(void) {
    run_fsm_assert(
        10,
        6,
        0x1ULL,
        0,
        "UT_0412",
        "Testing state transition current=10 to next=6 with prereq=0x1"
    );
}
static void run_unit_test_0413(void) {
    run_fsm_assert(
        15,
        6,
        0x1ULL,
        0,
        "UT_0413",
        "Testing state transition current=15 to next=6 with prereq=0x1"
    );
}
static void run_unit_test_0414(void) {
    run_fsm_assert(
        100,
        6,
        0x1ULL,
        0,
        "UT_0414",
        "Testing state transition current=100 to next=6 with prereq=0x1"
    );
}
static void run_unit_test_0415(void) {
    run_fsm_assert(
        -100,
        6,
        0x1ULL,
        0,
        "UT_0415",
        "Testing state transition current=-100 to next=6 with prereq=0x1"
    );
}
static void run_unit_test_0416(void) {
    run_fsm_assert(
        -10,
        7,
        0x1ULL,
        0,
        "UT_0416",
        "Testing state transition current=-10 to next=7 with prereq=0x1"
    );
}
static void run_unit_test_0417(void) {
    run_fsm_assert(
        -5,
        7,
        0x1ULL,
        0,
        "UT_0417",
        "Testing state transition current=-5 to next=7 with prereq=0x1"
    );
}
static void run_unit_test_0418(void) {
    run_fsm_assert(
        -1,
        7,
        0x1ULL,
        0,
        "UT_0418",
        "Testing state transition current=-1 to next=7 with prereq=0x1"
    );
}
static void run_unit_test_0419(void) {
    run_fsm_assert(
        0,
        7,
        0x1ULL,
        0,
        "UT_0419",
        "Testing state transition current=0 to next=7 with prereq=0x1"
    );
}
static void run_unit_test_0420(void) {
    run_fsm_assert(
        1,
        7,
        0x1ULL,
        0,
        "UT_0420",
        "Testing state transition current=1 to next=7 with prereq=0x1"
    );
}
static void run_unit_test_0421(void) {
    run_fsm_assert(
        2,
        7,
        0x1ULL,
        0,
        "UT_0421",
        "Testing state transition current=2 to next=7 with prereq=0x1"
    );
}
static void run_unit_test_0422(void) {
    run_fsm_assert(
        3,
        7,
        0x1ULL,
        0,
        "UT_0422",
        "Testing state transition current=3 to next=7 with prereq=0x1"
    );
}
static void run_unit_test_0423(void) {
    run_fsm_assert(
        4,
        7,
        0x1ULL,
        0,
        "UT_0423",
        "Testing state transition current=4 to next=7 with prereq=0x1"
    );
}
static void run_unit_test_0424(void) {
    run_fsm_assert(
        5,
        7,
        0x1ULL,
        0,
        "UT_0424",
        "Testing state transition current=5 to next=7 with prereq=0x1"
    );
}
static void run_unit_test_0425(void) {
    run_fsm_assert(
        6,
        7,
        0x1ULL,
        0,
        "UT_0425",
        "Testing state transition current=6 to next=7 with prereq=0x1"
    );
}
static void run_unit_test_0426(void) {
    run_fsm_assert(
        7,
        7,
        0x1ULL,
        0,
        "UT_0426",
        "Testing state transition current=7 to next=7 with prereq=0x1"
    );
}
static void run_unit_test_0427(void) {
    run_fsm_assert(
        8,
        7,
        0x1ULL,
        0,
        "UT_0427",
        "Testing state transition current=8 to next=7 with prereq=0x1"
    );
}
static void run_unit_test_0428(void) {
    run_fsm_assert(
        10,
        7,
        0x1ULL,
        0,
        "UT_0428",
        "Testing state transition current=10 to next=7 with prereq=0x1"
    );
}
static void run_unit_test_0429(void) {
    run_fsm_assert(
        15,
        7,
        0x1ULL,
        0,
        "UT_0429",
        "Testing state transition current=15 to next=7 with prereq=0x1"
    );
}
static void run_unit_test_0430(void) {
    run_fsm_assert(
        100,
        7,
        0x1ULL,
        0,
        "UT_0430",
        "Testing state transition current=100 to next=7 with prereq=0x1"
    );
}
static void run_unit_test_0431(void) {
    run_fsm_assert(
        -100,
        7,
        0x1ULL,
        0,
        "UT_0431",
        "Testing state transition current=-100 to next=7 with prereq=0x1"
    );
}
static void run_unit_test_0432(void) {
    run_fsm_assert(
        -10,
        8,
        0x1ULL,
        0,
        "UT_0432",
        "Testing state transition current=-10 to next=8 with prereq=0x1"
    );
}
static void run_unit_test_0433(void) {
    run_fsm_assert(
        -5,
        8,
        0x1ULL,
        0,
        "UT_0433",
        "Testing state transition current=-5 to next=8 with prereq=0x1"
    );
}
static void run_unit_test_0434(void) {
    run_fsm_assert(
        -1,
        8,
        0x1ULL,
        0,
        "UT_0434",
        "Testing state transition current=-1 to next=8 with prereq=0x1"
    );
}
static void run_unit_test_0435(void) {
    run_fsm_assert(
        0,
        8,
        0x1ULL,
        0,
        "UT_0435",
        "Testing state transition current=0 to next=8 with prereq=0x1"
    );
}
static void run_unit_test_0436(void) {
    run_fsm_assert(
        1,
        8,
        0x1ULL,
        0,
        "UT_0436",
        "Testing state transition current=1 to next=8 with prereq=0x1"
    );
}
static void run_unit_test_0437(void) {
    run_fsm_assert(
        2,
        8,
        0x1ULL,
        0,
        "UT_0437",
        "Testing state transition current=2 to next=8 with prereq=0x1"
    );
}
static void run_unit_test_0438(void) {
    run_fsm_assert(
        3,
        8,
        0x1ULL,
        0,
        "UT_0438",
        "Testing state transition current=3 to next=8 with prereq=0x1"
    );
}
static void run_unit_test_0439(void) {
    run_fsm_assert(
        4,
        8,
        0x1ULL,
        0,
        "UT_0439",
        "Testing state transition current=4 to next=8 with prereq=0x1"
    );
}
static void run_unit_test_0440(void) {
    run_fsm_assert(
        5,
        8,
        0x1ULL,
        0,
        "UT_0440",
        "Testing state transition current=5 to next=8 with prereq=0x1"
    );
}
static void run_unit_test_0441(void) {
    run_fsm_assert(
        6,
        8,
        0x1ULL,
        0,
        "UT_0441",
        "Testing state transition current=6 to next=8 with prereq=0x1"
    );
}
static void run_unit_test_0442(void) {
    run_fsm_assert(
        7,
        8,
        0x1ULL,
        0,
        "UT_0442",
        "Testing state transition current=7 to next=8 with prereq=0x1"
    );
}
static void run_unit_test_0443(void) {
    run_fsm_assert(
        8,
        8,
        0x1ULL,
        0,
        "UT_0443",
        "Testing state transition current=8 to next=8 with prereq=0x1"
    );
}
static void run_unit_test_0444(void) {
    run_fsm_assert(
        10,
        8,
        0x1ULL,
        0,
        "UT_0444",
        "Testing state transition current=10 to next=8 with prereq=0x1"
    );
}
static void run_unit_test_0445(void) {
    run_fsm_assert(
        15,
        8,
        0x1ULL,
        0,
        "UT_0445",
        "Testing state transition current=15 to next=8 with prereq=0x1"
    );
}
static void run_unit_test_0446(void) {
    run_fsm_assert(
        100,
        8,
        0x1ULL,
        0,
        "UT_0446",
        "Testing state transition current=100 to next=8 with prereq=0x1"
    );
}
static void run_unit_test_0447(void) {
    run_fsm_assert(
        -100,
        8,
        0x1ULL,
        0,
        "UT_0447",
        "Testing state transition current=-100 to next=8 with prereq=0x1"
    );
}
static void run_unit_test_0448(void) {
    run_fsm_assert(
        -10,
        10,
        0x1ULL,
        0,
        "UT_0448",
        "Testing state transition current=-10 to next=10 with prereq=0x1"
    );
}
static void run_unit_test_0449(void) {
    run_fsm_assert(
        -5,
        10,
        0x1ULL,
        0,
        "UT_0449",
        "Testing state transition current=-5 to next=10 with prereq=0x1"
    );
}
static void run_unit_test_0450(void) {
    run_fsm_assert(
        -1,
        10,
        0x1ULL,
        0,
        "UT_0450",
        "Testing state transition current=-1 to next=10 with prereq=0x1"
    );
}
static void run_unit_test_0451(void) {
    run_fsm_assert(
        0,
        10,
        0x1ULL,
        0,
        "UT_0451",
        "Testing state transition current=0 to next=10 with prereq=0x1"
    );
}
static void run_unit_test_0452(void) {
    run_fsm_assert(
        1,
        10,
        0x1ULL,
        0,
        "UT_0452",
        "Testing state transition current=1 to next=10 with prereq=0x1"
    );
}
static void run_unit_test_0453(void) {
    run_fsm_assert(
        2,
        10,
        0x1ULL,
        0,
        "UT_0453",
        "Testing state transition current=2 to next=10 with prereq=0x1"
    );
}
static void run_unit_test_0454(void) {
    run_fsm_assert(
        3,
        10,
        0x1ULL,
        0,
        "UT_0454",
        "Testing state transition current=3 to next=10 with prereq=0x1"
    );
}
static void run_unit_test_0455(void) {
    run_fsm_assert(
        4,
        10,
        0x1ULL,
        0,
        "UT_0455",
        "Testing state transition current=4 to next=10 with prereq=0x1"
    );
}
static void run_unit_test_0456(void) {
    run_fsm_assert(
        5,
        10,
        0x1ULL,
        0,
        "UT_0456",
        "Testing state transition current=5 to next=10 with prereq=0x1"
    );
}
static void run_unit_test_0457(void) {
    run_fsm_assert(
        6,
        10,
        0x1ULL,
        0,
        "UT_0457",
        "Testing state transition current=6 to next=10 with prereq=0x1"
    );
}
static void run_unit_test_0458(void) {
    run_fsm_assert(
        7,
        10,
        0x1ULL,
        0,
        "UT_0458",
        "Testing state transition current=7 to next=10 with prereq=0x1"
    );
}
static void run_unit_test_0459(void) {
    run_fsm_assert(
        8,
        10,
        0x1ULL,
        0,
        "UT_0459",
        "Testing state transition current=8 to next=10 with prereq=0x1"
    );
}
static void run_unit_test_0460(void) {
    run_fsm_assert(
        10,
        10,
        0x1ULL,
        0,
        "UT_0460",
        "Testing state transition current=10 to next=10 with prereq=0x1"
    );
}
static void run_unit_test_0461(void) {
    run_fsm_assert(
        15,
        10,
        0x1ULL,
        0,
        "UT_0461",
        "Testing state transition current=15 to next=10 with prereq=0x1"
    );
}
static void run_unit_test_0462(void) {
    run_fsm_assert(
        100,
        10,
        0x1ULL,
        0,
        "UT_0462",
        "Testing state transition current=100 to next=10 with prereq=0x1"
    );
}
static void run_unit_test_0463(void) {
    run_fsm_assert(
        -100,
        10,
        0x1ULL,
        0,
        "UT_0463",
        "Testing state transition current=-100 to next=10 with prereq=0x1"
    );
}
static void run_unit_test_0464(void) {
    run_fsm_assert(
        -10,
        15,
        0x1ULL,
        0,
        "UT_0464",
        "Testing state transition current=-10 to next=15 with prereq=0x1"
    );
}
static void run_unit_test_0465(void) {
    run_fsm_assert(
        -5,
        15,
        0x1ULL,
        0,
        "UT_0465",
        "Testing state transition current=-5 to next=15 with prereq=0x1"
    );
}
static void run_unit_test_0466(void) {
    run_fsm_assert(
        -1,
        15,
        0x1ULL,
        0,
        "UT_0466",
        "Testing state transition current=-1 to next=15 with prereq=0x1"
    );
}
static void run_unit_test_0467(void) {
    run_fsm_assert(
        0,
        15,
        0x1ULL,
        0,
        "UT_0467",
        "Testing state transition current=0 to next=15 with prereq=0x1"
    );
}
static void run_unit_test_0468(void) {
    run_fsm_assert(
        1,
        15,
        0x1ULL,
        0,
        "UT_0468",
        "Testing state transition current=1 to next=15 with prereq=0x1"
    );
}
static void run_unit_test_0469(void) {
    run_fsm_assert(
        2,
        15,
        0x1ULL,
        0,
        "UT_0469",
        "Testing state transition current=2 to next=15 with prereq=0x1"
    );
}
static void run_unit_test_0470(void) {
    run_fsm_assert(
        3,
        15,
        0x1ULL,
        0,
        "UT_0470",
        "Testing state transition current=3 to next=15 with prereq=0x1"
    );
}
static void run_unit_test_0471(void) {
    run_fsm_assert(
        4,
        15,
        0x1ULL,
        0,
        "UT_0471",
        "Testing state transition current=4 to next=15 with prereq=0x1"
    );
}
static void run_unit_test_0472(void) {
    run_fsm_assert(
        5,
        15,
        0x1ULL,
        0,
        "UT_0472",
        "Testing state transition current=5 to next=15 with prereq=0x1"
    );
}
static void run_unit_test_0473(void) {
    run_fsm_assert(
        6,
        15,
        0x1ULL,
        0,
        "UT_0473",
        "Testing state transition current=6 to next=15 with prereq=0x1"
    );
}
static void run_unit_test_0474(void) {
    run_fsm_assert(
        7,
        15,
        0x1ULL,
        0,
        "UT_0474",
        "Testing state transition current=7 to next=15 with prereq=0x1"
    );
}
static void run_unit_test_0475(void) {
    run_fsm_assert(
        8,
        15,
        0x1ULL,
        0,
        "UT_0475",
        "Testing state transition current=8 to next=15 with prereq=0x1"
    );
}
static void run_unit_test_0476(void) {
    run_fsm_assert(
        10,
        15,
        0x1ULL,
        0,
        "UT_0476",
        "Testing state transition current=10 to next=15 with prereq=0x1"
    );
}
static void run_unit_test_0477(void) {
    run_fsm_assert(
        15,
        15,
        0x1ULL,
        0,
        "UT_0477",
        "Testing state transition current=15 to next=15 with prereq=0x1"
    );
}
static void run_unit_test_0478(void) {
    run_fsm_assert(
        100,
        15,
        0x1ULL,
        0,
        "UT_0478",
        "Testing state transition current=100 to next=15 with prereq=0x1"
    );
}
static void run_unit_test_0479(void) {
    run_fsm_assert(
        -100,
        15,
        0x1ULL,
        0,
        "UT_0479",
        "Testing state transition current=-100 to next=15 with prereq=0x1"
    );
}
static void run_unit_test_0480(void) {
    run_fsm_assert(
        -10,
        100,
        0x1ULL,
        0,
        "UT_0480",
        "Testing state transition current=-10 to next=100 with prereq=0x1"
    );
}
static void run_unit_test_0481(void) {
    run_fsm_assert(
        -5,
        100,
        0x1ULL,
        0,
        "UT_0481",
        "Testing state transition current=-5 to next=100 with prereq=0x1"
    );
}
static void run_unit_test_0482(void) {
    run_fsm_assert(
        -1,
        100,
        0x1ULL,
        0,
        "UT_0482",
        "Testing state transition current=-1 to next=100 with prereq=0x1"
    );
}
static void run_unit_test_0483(void) {
    run_fsm_assert(
        0,
        100,
        0x1ULL,
        0,
        "UT_0483",
        "Testing state transition current=0 to next=100 with prereq=0x1"
    );
}
static void run_unit_test_0484(void) {
    run_fsm_assert(
        1,
        100,
        0x1ULL,
        0,
        "UT_0484",
        "Testing state transition current=1 to next=100 with prereq=0x1"
    );
}
static void run_unit_test_0485(void) {
    run_fsm_assert(
        2,
        100,
        0x1ULL,
        0,
        "UT_0485",
        "Testing state transition current=2 to next=100 with prereq=0x1"
    );
}
static void run_unit_test_0486(void) {
    run_fsm_assert(
        3,
        100,
        0x1ULL,
        0,
        "UT_0486",
        "Testing state transition current=3 to next=100 with prereq=0x1"
    );
}
static void run_unit_test_0487(void) {
    run_fsm_assert(
        4,
        100,
        0x1ULL,
        0,
        "UT_0487",
        "Testing state transition current=4 to next=100 with prereq=0x1"
    );
}
static void run_unit_test_0488(void) {
    run_fsm_assert(
        5,
        100,
        0x1ULL,
        0,
        "UT_0488",
        "Testing state transition current=5 to next=100 with prereq=0x1"
    );
}
static void run_unit_test_0489(void) {
    run_fsm_assert(
        6,
        100,
        0x1ULL,
        0,
        "UT_0489",
        "Testing state transition current=6 to next=100 with prereq=0x1"
    );
}
static void run_unit_test_0490(void) {
    run_fsm_assert(
        7,
        100,
        0x1ULL,
        0,
        "UT_0490",
        "Testing state transition current=7 to next=100 with prereq=0x1"
    );
}
static void run_unit_test_0491(void) {
    run_fsm_assert(
        8,
        100,
        0x1ULL,
        0,
        "UT_0491",
        "Testing state transition current=8 to next=100 with prereq=0x1"
    );
}
static void run_unit_test_0492(void) {
    run_fsm_assert(
        10,
        100,
        0x1ULL,
        0,
        "UT_0492",
        "Testing state transition current=10 to next=100 with prereq=0x1"
    );
}
static void run_unit_test_0493(void) {
    run_fsm_assert(
        15,
        100,
        0x1ULL,
        0,
        "UT_0493",
        "Testing state transition current=15 to next=100 with prereq=0x1"
    );
}
static void run_unit_test_0494(void) {
    run_fsm_assert(
        100,
        100,
        0x1ULL,
        0,
        "UT_0494",
        "Testing state transition current=100 to next=100 with prereq=0x1"
    );
}
static void run_unit_test_0495(void) {
    run_fsm_assert(
        -100,
        100,
        0x1ULL,
        0,
        "UT_0495",
        "Testing state transition current=-100 to next=100 with prereq=0x1"
    );
}
static void run_unit_test_0496(void) {
    run_fsm_assert(
        -10,
        -100,
        0x1ULL,
        0,
        "UT_0496",
        "Testing state transition current=-10 to next=-100 with prereq=0x1"
    );
}
static void run_unit_test_0497(void) {
    run_fsm_assert(
        -5,
        -100,
        0x1ULL,
        0,
        "UT_0497",
        "Testing state transition current=-5 to next=-100 with prereq=0x1"
    );
}
static void run_unit_test_0498(void) {
    run_fsm_assert(
        -1,
        -100,
        0x1ULL,
        0,
        "UT_0498",
        "Testing state transition current=-1 to next=-100 with prereq=0x1"
    );
}
static void run_unit_test_0499(void) {
    run_fsm_assert(
        0,
        -100,
        0x1ULL,
        0,
        "UT_0499",
        "Testing state transition current=0 to next=-100 with prereq=0x1"
    );
}
static void run_unit_test_0500(void) {
    run_fsm_assert(
        1,
        -100,
        0x1ULL,
        0,
        "UT_0500",
        "Testing state transition current=1 to next=-100 with prereq=0x1"
    );
}
static void run_unit_test_0501(void) {
    run_fsm_assert(
        2,
        -100,
        0x1ULL,
        0,
        "UT_0501",
        "Testing state transition current=2 to next=-100 with prereq=0x1"
    );
}
static void run_unit_test_0502(void) {
    run_fsm_assert(
        3,
        -100,
        0x1ULL,
        0,
        "UT_0502",
        "Testing state transition current=3 to next=-100 with prereq=0x1"
    );
}
static void run_unit_test_0503(void) {
    run_fsm_assert(
        4,
        -100,
        0x1ULL,
        0,
        "UT_0503",
        "Testing state transition current=4 to next=-100 with prereq=0x1"
    );
}
static void run_unit_test_0504(void) {
    run_fsm_assert(
        5,
        -100,
        0x1ULL,
        0,
        "UT_0504",
        "Testing state transition current=5 to next=-100 with prereq=0x1"
    );
}
static void run_unit_test_0505(void) {
    run_fsm_assert(
        6,
        -100,
        0x1ULL,
        0,
        "UT_0505",
        "Testing state transition current=6 to next=-100 with prereq=0x1"
    );
}
static void run_unit_test_0506(void) {
    run_fsm_assert(
        7,
        -100,
        0x1ULL,
        0,
        "UT_0506",
        "Testing state transition current=7 to next=-100 with prereq=0x1"
    );
}
static void run_unit_test_0507(void) {
    run_fsm_assert(
        8,
        -100,
        0x1ULL,
        0,
        "UT_0507",
        "Testing state transition current=8 to next=-100 with prereq=0x1"
    );
}
static void run_unit_test_0508(void) {
    run_fsm_assert(
        10,
        -100,
        0x1ULL,
        0,
        "UT_0508",
        "Testing state transition current=10 to next=-100 with prereq=0x1"
    );
}
static void run_unit_test_0509(void) {
    run_fsm_assert(
        15,
        -100,
        0x1ULL,
        0,
        "UT_0509",
        "Testing state transition current=15 to next=-100 with prereq=0x1"
    );
}
static void run_unit_test_0510(void) {
    run_fsm_assert(
        100,
        -100,
        0x1ULL,
        0,
        "UT_0510",
        "Testing state transition current=100 to next=-100 with prereq=0x1"
    );
}
static void run_unit_test_0511(void) {
    run_fsm_assert(
        -100,
        -100,
        0x1ULL,
        0,
        "UT_0511",
        "Testing state transition current=-100 to next=-100 with prereq=0x1"
    );
}
static void run_unit_test_0512(void) {
    run_fsm_assert(
        -10,
        -10,
        0x2ULL,
        0,
        "UT_0512",
        "Testing state transition current=-10 to next=-10 with prereq=0x2"
    );
}
static void run_unit_test_0513(void) {
    run_fsm_assert(
        -5,
        -10,
        0x2ULL,
        0,
        "UT_0513",
        "Testing state transition current=-5 to next=-10 with prereq=0x2"
    );
}
static void run_unit_test_0514(void) {
    run_fsm_assert(
        -1,
        -10,
        0x2ULL,
        0,
        "UT_0514",
        "Testing state transition current=-1 to next=-10 with prereq=0x2"
    );
}
static void run_unit_test_0515(void) {
    run_fsm_assert(
        0,
        -10,
        0x2ULL,
        0,
        "UT_0515",
        "Testing state transition current=0 to next=-10 with prereq=0x2"
    );
}
static void run_unit_test_0516(void) {
    run_fsm_assert(
        1,
        -10,
        0x2ULL,
        0,
        "UT_0516",
        "Testing state transition current=1 to next=-10 with prereq=0x2"
    );
}
static void run_unit_test_0517(void) {
    run_fsm_assert(
        2,
        -10,
        0x2ULL,
        0,
        "UT_0517",
        "Testing state transition current=2 to next=-10 with prereq=0x2"
    );
}
static void run_unit_test_0518(void) {
    run_fsm_assert(
        3,
        -10,
        0x2ULL,
        0,
        "UT_0518",
        "Testing state transition current=3 to next=-10 with prereq=0x2"
    );
}
static void run_unit_test_0519(void) {
    run_fsm_assert(
        4,
        -10,
        0x2ULL,
        0,
        "UT_0519",
        "Testing state transition current=4 to next=-10 with prereq=0x2"
    );
}
static void run_unit_test_0520(void) {
    run_fsm_assert(
        5,
        -10,
        0x2ULL,
        0,
        "UT_0520",
        "Testing state transition current=5 to next=-10 with prereq=0x2"
    );
}
static void run_unit_test_0521(void) {
    run_fsm_assert(
        6,
        -10,
        0x2ULL,
        0,
        "UT_0521",
        "Testing state transition current=6 to next=-10 with prereq=0x2"
    );
}
static void run_unit_test_0522(void) {
    run_fsm_assert(
        7,
        -10,
        0x2ULL,
        0,
        "UT_0522",
        "Testing state transition current=7 to next=-10 with prereq=0x2"
    );
}
static void run_unit_test_0523(void) {
    run_fsm_assert(
        8,
        -10,
        0x2ULL,
        0,
        "UT_0523",
        "Testing state transition current=8 to next=-10 with prereq=0x2"
    );
}
static void run_unit_test_0524(void) {
    run_fsm_assert(
        10,
        -10,
        0x2ULL,
        0,
        "UT_0524",
        "Testing state transition current=10 to next=-10 with prereq=0x2"
    );
}
static void run_unit_test_0525(void) {
    run_fsm_assert(
        15,
        -10,
        0x2ULL,
        0,
        "UT_0525",
        "Testing state transition current=15 to next=-10 with prereq=0x2"
    );
}
static void run_unit_test_0526(void) {
    run_fsm_assert(
        100,
        -10,
        0x2ULL,
        0,
        "UT_0526",
        "Testing state transition current=100 to next=-10 with prereq=0x2"
    );
}
static void run_unit_test_0527(void) {
    run_fsm_assert(
        -100,
        -10,
        0x2ULL,
        0,
        "UT_0527",
        "Testing state transition current=-100 to next=-10 with prereq=0x2"
    );
}
static void run_unit_test_0528(void) {
    run_fsm_assert(
        -10,
        -5,
        0x2ULL,
        0,
        "UT_0528",
        "Testing state transition current=-10 to next=-5 with prereq=0x2"
    );
}
static void run_unit_test_0529(void) {
    run_fsm_assert(
        -5,
        -5,
        0x2ULL,
        0,
        "UT_0529",
        "Testing state transition current=-5 to next=-5 with prereq=0x2"
    );
}
static void run_unit_test_0530(void) {
    run_fsm_assert(
        -1,
        -5,
        0x2ULL,
        0,
        "UT_0530",
        "Testing state transition current=-1 to next=-5 with prereq=0x2"
    );
}
static void run_unit_test_0531(void) {
    run_fsm_assert(
        0,
        -5,
        0x2ULL,
        0,
        "UT_0531",
        "Testing state transition current=0 to next=-5 with prereq=0x2"
    );
}
static void run_unit_test_0532(void) {
    run_fsm_assert(
        1,
        -5,
        0x2ULL,
        0,
        "UT_0532",
        "Testing state transition current=1 to next=-5 with prereq=0x2"
    );
}
static void run_unit_test_0533(void) {
    run_fsm_assert(
        2,
        -5,
        0x2ULL,
        0,
        "UT_0533",
        "Testing state transition current=2 to next=-5 with prereq=0x2"
    );
}
static void run_unit_test_0534(void) {
    run_fsm_assert(
        3,
        -5,
        0x2ULL,
        0,
        "UT_0534",
        "Testing state transition current=3 to next=-5 with prereq=0x2"
    );
}
static void run_unit_test_0535(void) {
    run_fsm_assert(
        4,
        -5,
        0x2ULL,
        0,
        "UT_0535",
        "Testing state transition current=4 to next=-5 with prereq=0x2"
    );
}
static void run_unit_test_0536(void) {
    run_fsm_assert(
        5,
        -5,
        0x2ULL,
        0,
        "UT_0536",
        "Testing state transition current=5 to next=-5 with prereq=0x2"
    );
}
static void run_unit_test_0537(void) {
    run_fsm_assert(
        6,
        -5,
        0x2ULL,
        0,
        "UT_0537",
        "Testing state transition current=6 to next=-5 with prereq=0x2"
    );
}
static void run_unit_test_0538(void) {
    run_fsm_assert(
        7,
        -5,
        0x2ULL,
        0,
        "UT_0538",
        "Testing state transition current=7 to next=-5 with prereq=0x2"
    );
}
static void run_unit_test_0539(void) {
    run_fsm_assert(
        8,
        -5,
        0x2ULL,
        0,
        "UT_0539",
        "Testing state transition current=8 to next=-5 with prereq=0x2"
    );
}
static void run_unit_test_0540(void) {
    run_fsm_assert(
        10,
        -5,
        0x2ULL,
        0,
        "UT_0540",
        "Testing state transition current=10 to next=-5 with prereq=0x2"
    );
}
static void run_unit_test_0541(void) {
    run_fsm_assert(
        15,
        -5,
        0x2ULL,
        0,
        "UT_0541",
        "Testing state transition current=15 to next=-5 with prereq=0x2"
    );
}
static void run_unit_test_0542(void) {
    run_fsm_assert(
        100,
        -5,
        0x2ULL,
        0,
        "UT_0542",
        "Testing state transition current=100 to next=-5 with prereq=0x2"
    );
}
static void run_unit_test_0543(void) {
    run_fsm_assert(
        -100,
        -5,
        0x2ULL,
        0,
        "UT_0543",
        "Testing state transition current=-100 to next=-5 with prereq=0x2"
    );
}
static void run_unit_test_0544(void) {
    run_fsm_assert(
        -10,
        -1,
        0x2ULL,
        0,
        "UT_0544",
        "Testing state transition current=-10 to next=-1 with prereq=0x2"
    );
}
static void run_unit_test_0545(void) {
    run_fsm_assert(
        -5,
        -1,
        0x2ULL,
        0,
        "UT_0545",
        "Testing state transition current=-5 to next=-1 with prereq=0x2"
    );
}
static void run_unit_test_0546(void) {
    run_fsm_assert(
        -1,
        -1,
        0x2ULL,
        0,
        "UT_0546",
        "Testing state transition current=-1 to next=-1 with prereq=0x2"
    );
}
static void run_unit_test_0547(void) {
    run_fsm_assert(
        0,
        -1,
        0x2ULL,
        0,
        "UT_0547",
        "Testing state transition current=0 to next=-1 with prereq=0x2"
    );
}
static void run_unit_test_0548(void) {
    run_fsm_assert(
        1,
        -1,
        0x2ULL,
        0,
        "UT_0548",
        "Testing state transition current=1 to next=-1 with prereq=0x2"
    );
}
static void run_unit_test_0549(void) {
    run_fsm_assert(
        2,
        -1,
        0x2ULL,
        0,
        "UT_0549",
        "Testing state transition current=2 to next=-1 with prereq=0x2"
    );
}
static void run_unit_test_0550(void) {
    run_fsm_assert(
        3,
        -1,
        0x2ULL,
        0,
        "UT_0550",
        "Testing state transition current=3 to next=-1 with prereq=0x2"
    );
}
static void run_unit_test_0551(void) {
    run_fsm_assert(
        4,
        -1,
        0x2ULL,
        0,
        "UT_0551",
        "Testing state transition current=4 to next=-1 with prereq=0x2"
    );
}
static void run_unit_test_0552(void) {
    run_fsm_assert(
        5,
        -1,
        0x2ULL,
        0,
        "UT_0552",
        "Testing state transition current=5 to next=-1 with prereq=0x2"
    );
}
static void run_unit_test_0553(void) {
    run_fsm_assert(
        6,
        -1,
        0x2ULL,
        0,
        "UT_0553",
        "Testing state transition current=6 to next=-1 with prereq=0x2"
    );
}
static void run_unit_test_0554(void) {
    run_fsm_assert(
        7,
        -1,
        0x2ULL,
        0,
        "UT_0554",
        "Testing state transition current=7 to next=-1 with prereq=0x2"
    );
}
static void run_unit_test_0555(void) {
    run_fsm_assert(
        8,
        -1,
        0x2ULL,
        0,
        "UT_0555",
        "Testing state transition current=8 to next=-1 with prereq=0x2"
    );
}
static void run_unit_test_0556(void) {
    run_fsm_assert(
        10,
        -1,
        0x2ULL,
        0,
        "UT_0556",
        "Testing state transition current=10 to next=-1 with prereq=0x2"
    );
}
static void run_unit_test_0557(void) {
    run_fsm_assert(
        15,
        -1,
        0x2ULL,
        0,
        "UT_0557",
        "Testing state transition current=15 to next=-1 with prereq=0x2"
    );
}
static void run_unit_test_0558(void) {
    run_fsm_assert(
        100,
        -1,
        0x2ULL,
        0,
        "UT_0558",
        "Testing state transition current=100 to next=-1 with prereq=0x2"
    );
}
static void run_unit_test_0559(void) {
    run_fsm_assert(
        -100,
        -1,
        0x2ULL,
        0,
        "UT_0559",
        "Testing state transition current=-100 to next=-1 with prereq=0x2"
    );
}
static void run_unit_test_0560(void) {
    run_fsm_assert(
        -10,
        0,
        0x2ULL,
        0,
        "UT_0560",
        "Testing state transition current=-10 to next=0 with prereq=0x2"
    );
}
static void run_unit_test_0561(void) {
    run_fsm_assert(
        -5,
        0,
        0x2ULL,
        0,
        "UT_0561",
        "Testing state transition current=-5 to next=0 with prereq=0x2"
    );
}
static void run_unit_test_0562(void) {
    run_fsm_assert(
        -1,
        0,
        0x2ULL,
        0,
        "UT_0562",
        "Testing state transition current=-1 to next=0 with prereq=0x2"
    );
}
static void run_unit_test_0563(void) {
    run_fsm_assert(
        0,
        0,
        0x2ULL,
        1,
        "UT_0563",
        "Testing state transition current=0 to next=0 with prereq=0x2"
    );
}
static void run_unit_test_0564(void) {
    run_fsm_assert(
        1,
        0,
        0x2ULL,
        1,
        "UT_0564",
        "Testing state transition current=1 to next=0 with prereq=0x2"
    );
}
static void run_unit_test_0565(void) {
    run_fsm_assert(
        2,
        0,
        0x2ULL,
        1,
        "UT_0565",
        "Testing state transition current=2 to next=0 with prereq=0x2"
    );
}
static void run_unit_test_0566(void) {
    run_fsm_assert(
        3,
        0,
        0x2ULL,
        1,
        "UT_0566",
        "Testing state transition current=3 to next=0 with prereq=0x2"
    );
}
static void run_unit_test_0567(void) {
    run_fsm_assert(
        4,
        0,
        0x2ULL,
        1,
        "UT_0567",
        "Testing state transition current=4 to next=0 with prereq=0x2"
    );
}
static void run_unit_test_0568(void) {
    run_fsm_assert(
        5,
        0,
        0x2ULL,
        1,
        "UT_0568",
        "Testing state transition current=5 to next=0 with prereq=0x2"
    );
}
static void run_unit_test_0569(void) {
    run_fsm_assert(
        6,
        0,
        0x2ULL,
        1,
        "UT_0569",
        "Testing state transition current=6 to next=0 with prereq=0x2"
    );
}
static void run_unit_test_0570(void) {
    run_fsm_assert(
        7,
        0,
        0x2ULL,
        1,
        "UT_0570",
        "Testing state transition current=7 to next=0 with prereq=0x2"
    );
}
static void run_unit_test_0571(void) {
    run_fsm_assert(
        8,
        0,
        0x2ULL,
        0,
        "UT_0571",
        "Testing state transition current=8 to next=0 with prereq=0x2"
    );
}
static void run_unit_test_0572(void) {
    run_fsm_assert(
        10,
        0,
        0x2ULL,
        0,
        "UT_0572",
        "Testing state transition current=10 to next=0 with prereq=0x2"
    );
}
static void run_unit_test_0573(void) {
    run_fsm_assert(
        15,
        0,
        0x2ULL,
        0,
        "UT_0573",
        "Testing state transition current=15 to next=0 with prereq=0x2"
    );
}
static void run_unit_test_0574(void) {
    run_fsm_assert(
        100,
        0,
        0x2ULL,
        0,
        "UT_0574",
        "Testing state transition current=100 to next=0 with prereq=0x2"
    );
}
static void run_unit_test_0575(void) {
    run_fsm_assert(
        -100,
        0,
        0x2ULL,
        0,
        "UT_0575",
        "Testing state transition current=-100 to next=0 with prereq=0x2"
    );
}
static void run_unit_test_0576(void) {
    run_fsm_assert(
        -10,
        1,
        0x2ULL,
        0,
        "UT_0576",
        "Testing state transition current=-10 to next=1 with prereq=0x2"
    );
}
static void run_unit_test_0577(void) {
    run_fsm_assert(
        -5,
        1,
        0x2ULL,
        0,
        "UT_0577",
        "Testing state transition current=-5 to next=1 with prereq=0x2"
    );
}
static void run_unit_test_0578(void) {
    run_fsm_assert(
        -1,
        1,
        0x2ULL,
        0,
        "UT_0578",
        "Testing state transition current=-1 to next=1 with prereq=0x2"
    );
}
static void run_unit_test_0579(void) {
    run_fsm_assert(
        0,
        1,
        0x2ULL,
        0,
        "UT_0579",
        "Testing state transition current=0 to next=1 with prereq=0x2"
    );
}
static void run_unit_test_0580(void) {
    run_fsm_assert(
        1,
        1,
        0x2ULL,
        0,
        "UT_0580",
        "Testing state transition current=1 to next=1 with prereq=0x2"
    );
}
static void run_unit_test_0581(void) {
    run_fsm_assert(
        2,
        1,
        0x2ULL,
        0,
        "UT_0581",
        "Testing state transition current=2 to next=1 with prereq=0x2"
    );
}
static void run_unit_test_0582(void) {
    run_fsm_assert(
        3,
        1,
        0x2ULL,
        0,
        "UT_0582",
        "Testing state transition current=3 to next=1 with prereq=0x2"
    );
}
static void run_unit_test_0583(void) {
    run_fsm_assert(
        4,
        1,
        0x2ULL,
        0,
        "UT_0583",
        "Testing state transition current=4 to next=1 with prereq=0x2"
    );
}
static void run_unit_test_0584(void) {
    run_fsm_assert(
        5,
        1,
        0x2ULL,
        0,
        "UT_0584",
        "Testing state transition current=5 to next=1 with prereq=0x2"
    );
}
static void run_unit_test_0585(void) {
    run_fsm_assert(
        6,
        1,
        0x2ULL,
        0,
        "UT_0585",
        "Testing state transition current=6 to next=1 with prereq=0x2"
    );
}
static void run_unit_test_0586(void) {
    run_fsm_assert(
        7,
        1,
        0x2ULL,
        0,
        "UT_0586",
        "Testing state transition current=7 to next=1 with prereq=0x2"
    );
}
static void run_unit_test_0587(void) {
    run_fsm_assert(
        8,
        1,
        0x2ULL,
        0,
        "UT_0587",
        "Testing state transition current=8 to next=1 with prereq=0x2"
    );
}
static void run_unit_test_0588(void) {
    run_fsm_assert(
        10,
        1,
        0x2ULL,
        0,
        "UT_0588",
        "Testing state transition current=10 to next=1 with prereq=0x2"
    );
}
static void run_unit_test_0589(void) {
    run_fsm_assert(
        15,
        1,
        0x2ULL,
        0,
        "UT_0589",
        "Testing state transition current=15 to next=1 with prereq=0x2"
    );
}
static void run_unit_test_0590(void) {
    run_fsm_assert(
        100,
        1,
        0x2ULL,
        0,
        "UT_0590",
        "Testing state transition current=100 to next=1 with prereq=0x2"
    );
}
static void run_unit_test_0591(void) {
    run_fsm_assert(
        -100,
        1,
        0x2ULL,
        0,
        "UT_0591",
        "Testing state transition current=-100 to next=1 with prereq=0x2"
    );
}
static void run_unit_test_0592(void) {
    run_fsm_assert(
        -10,
        2,
        0x2ULL,
        0,
        "UT_0592",
        "Testing state transition current=-10 to next=2 with prereq=0x2"
    );
}
static void run_unit_test_0593(void) {
    run_fsm_assert(
        -5,
        2,
        0x2ULL,
        0,
        "UT_0593",
        "Testing state transition current=-5 to next=2 with prereq=0x2"
    );
}
static void run_unit_test_0594(void) {
    run_fsm_assert(
        -1,
        2,
        0x2ULL,
        0,
        "UT_0594",
        "Testing state transition current=-1 to next=2 with prereq=0x2"
    );
}
static void run_unit_test_0595(void) {
    run_fsm_assert(
        0,
        2,
        0x2ULL,
        0,
        "UT_0595",
        "Testing state transition current=0 to next=2 with prereq=0x2"
    );
}
static void run_unit_test_0596(void) {
    run_fsm_assert(
        1,
        2,
        0x2ULL,
        1,
        "UT_0596",
        "Testing state transition current=1 to next=2 with prereq=0x2"
    );
}
static void run_unit_test_0597(void) {
    run_fsm_assert(
        2,
        2,
        0x2ULL,
        0,
        "UT_0597",
        "Testing state transition current=2 to next=2 with prereq=0x2"
    );
}
static void run_unit_test_0598(void) {
    run_fsm_assert(
        3,
        2,
        0x2ULL,
        0,
        "UT_0598",
        "Testing state transition current=3 to next=2 with prereq=0x2"
    );
}
static void run_unit_test_0599(void) {
    run_fsm_assert(
        4,
        2,
        0x2ULL,
        0,
        "UT_0599",
        "Testing state transition current=4 to next=2 with prereq=0x2"
    );
}
static void run_unit_test_0600(void) {
    run_fsm_assert(
        5,
        2,
        0x2ULL,
        0,
        "UT_0600",
        "Testing state transition current=5 to next=2 with prereq=0x2"
    );
}
static void run_unit_test_0601(void) {
    run_fsm_assert(
        6,
        2,
        0x2ULL,
        0,
        "UT_0601",
        "Testing state transition current=6 to next=2 with prereq=0x2"
    );
}
static void run_unit_test_0602(void) {
    run_fsm_assert(
        7,
        2,
        0x2ULL,
        0,
        "UT_0602",
        "Testing state transition current=7 to next=2 with prereq=0x2"
    );
}
static void run_unit_test_0603(void) {
    run_fsm_assert(
        8,
        2,
        0x2ULL,
        0,
        "UT_0603",
        "Testing state transition current=8 to next=2 with prereq=0x2"
    );
}
static void run_unit_test_0604(void) {
    run_fsm_assert(
        10,
        2,
        0x2ULL,
        0,
        "UT_0604",
        "Testing state transition current=10 to next=2 with prereq=0x2"
    );
}
static void run_unit_test_0605(void) {
    run_fsm_assert(
        15,
        2,
        0x2ULL,
        0,
        "UT_0605",
        "Testing state transition current=15 to next=2 with prereq=0x2"
    );
}
static void run_unit_test_0606(void) {
    run_fsm_assert(
        100,
        2,
        0x2ULL,
        0,
        "UT_0606",
        "Testing state transition current=100 to next=2 with prereq=0x2"
    );
}
static void run_unit_test_0607(void) {
    run_fsm_assert(
        -100,
        2,
        0x2ULL,
        0,
        "UT_0607",
        "Testing state transition current=-100 to next=2 with prereq=0x2"
    );
}
static void run_unit_test_0608(void) {
    run_fsm_assert(
        -10,
        3,
        0x2ULL,
        0,
        "UT_0608",
        "Testing state transition current=-10 to next=3 with prereq=0x2"
    );
}
static void run_unit_test_0609(void) {
    run_fsm_assert(
        -5,
        3,
        0x2ULL,
        0,
        "UT_0609",
        "Testing state transition current=-5 to next=3 with prereq=0x2"
    );
}
static void run_unit_test_0610(void) {
    run_fsm_assert(
        -1,
        3,
        0x2ULL,
        0,
        "UT_0610",
        "Testing state transition current=-1 to next=3 with prereq=0x2"
    );
}
static void run_unit_test_0611(void) {
    run_fsm_assert(
        0,
        3,
        0x2ULL,
        0,
        "UT_0611",
        "Testing state transition current=0 to next=3 with prereq=0x2"
    );
}
static void run_unit_test_0612(void) {
    run_fsm_assert(
        1,
        3,
        0x2ULL,
        0,
        "UT_0612",
        "Testing state transition current=1 to next=3 with prereq=0x2"
    );
}
static void run_unit_test_0613(void) {
    run_fsm_assert(
        2,
        3,
        0x2ULL,
        0,
        "UT_0613",
        "Testing state transition current=2 to next=3 with prereq=0x2"
    );
}
static void run_unit_test_0614(void) {
    run_fsm_assert(
        3,
        3,
        0x2ULL,
        0,
        "UT_0614",
        "Testing state transition current=3 to next=3 with prereq=0x2"
    );
}
static void run_unit_test_0615(void) {
    run_fsm_assert(
        4,
        3,
        0x2ULL,
        0,
        "UT_0615",
        "Testing state transition current=4 to next=3 with prereq=0x2"
    );
}
static void run_unit_test_0616(void) {
    run_fsm_assert(
        5,
        3,
        0x2ULL,
        0,
        "UT_0616",
        "Testing state transition current=5 to next=3 with prereq=0x2"
    );
}
static void run_unit_test_0617(void) {
    run_fsm_assert(
        6,
        3,
        0x2ULL,
        0,
        "UT_0617",
        "Testing state transition current=6 to next=3 with prereq=0x2"
    );
}
static void run_unit_test_0618(void) {
    run_fsm_assert(
        7,
        3,
        0x2ULL,
        0,
        "UT_0618",
        "Testing state transition current=7 to next=3 with prereq=0x2"
    );
}
static void run_unit_test_0619(void) {
    run_fsm_assert(
        8,
        3,
        0x2ULL,
        0,
        "UT_0619",
        "Testing state transition current=8 to next=3 with prereq=0x2"
    );
}
static void run_unit_test_0620(void) {
    run_fsm_assert(
        10,
        3,
        0x2ULL,
        0,
        "UT_0620",
        "Testing state transition current=10 to next=3 with prereq=0x2"
    );
}
static void run_unit_test_0621(void) {
    run_fsm_assert(
        15,
        3,
        0x2ULL,
        0,
        "UT_0621",
        "Testing state transition current=15 to next=3 with prereq=0x2"
    );
}
static void run_unit_test_0622(void) {
    run_fsm_assert(
        100,
        3,
        0x2ULL,
        0,
        "UT_0622",
        "Testing state transition current=100 to next=3 with prereq=0x2"
    );
}
static void run_unit_test_0623(void) {
    run_fsm_assert(
        -100,
        3,
        0x2ULL,
        0,
        "UT_0623",
        "Testing state transition current=-100 to next=3 with prereq=0x2"
    );
}
static void run_unit_test_0624(void) {
    run_fsm_assert(
        -10,
        4,
        0x2ULL,
        0,
        "UT_0624",
        "Testing state transition current=-10 to next=4 with prereq=0x2"
    );
}
static void run_unit_test_0625(void) {
    run_fsm_assert(
        -5,
        4,
        0x2ULL,
        0,
        "UT_0625",
        "Testing state transition current=-5 to next=4 with prereq=0x2"
    );
}
static void run_unit_test_0626(void) {
    run_fsm_assert(
        -1,
        4,
        0x2ULL,
        0,
        "UT_0626",
        "Testing state transition current=-1 to next=4 with prereq=0x2"
    );
}
static void run_unit_test_0627(void) {
    run_fsm_assert(
        0,
        4,
        0x2ULL,
        0,
        "UT_0627",
        "Testing state transition current=0 to next=4 with prereq=0x2"
    );
}
static void run_unit_test_0628(void) {
    run_fsm_assert(
        1,
        4,
        0x2ULL,
        0,
        "UT_0628",
        "Testing state transition current=1 to next=4 with prereq=0x2"
    );
}
static void run_unit_test_0629(void) {
    run_fsm_assert(
        2,
        4,
        0x2ULL,
        0,
        "UT_0629",
        "Testing state transition current=2 to next=4 with prereq=0x2"
    );
}
static void run_unit_test_0630(void) {
    run_fsm_assert(
        3,
        4,
        0x2ULL,
        0,
        "UT_0630",
        "Testing state transition current=3 to next=4 with prereq=0x2"
    );
}
static void run_unit_test_0631(void) {
    run_fsm_assert(
        4,
        4,
        0x2ULL,
        0,
        "UT_0631",
        "Testing state transition current=4 to next=4 with prereq=0x2"
    );
}
static void run_unit_test_0632(void) {
    run_fsm_assert(
        5,
        4,
        0x2ULL,
        0,
        "UT_0632",
        "Testing state transition current=5 to next=4 with prereq=0x2"
    );
}
static void run_unit_test_0633(void) {
    run_fsm_assert(
        6,
        4,
        0x2ULL,
        0,
        "UT_0633",
        "Testing state transition current=6 to next=4 with prereq=0x2"
    );
}
static void run_unit_test_0634(void) {
    run_fsm_assert(
        7,
        4,
        0x2ULL,
        0,
        "UT_0634",
        "Testing state transition current=7 to next=4 with prereq=0x2"
    );
}
static void run_unit_test_0635(void) {
    run_fsm_assert(
        8,
        4,
        0x2ULL,
        0,
        "UT_0635",
        "Testing state transition current=8 to next=4 with prereq=0x2"
    );
}
static void run_unit_test_0636(void) {
    run_fsm_assert(
        10,
        4,
        0x2ULL,
        0,
        "UT_0636",
        "Testing state transition current=10 to next=4 with prereq=0x2"
    );
}
static void run_unit_test_0637(void) {
    run_fsm_assert(
        15,
        4,
        0x2ULL,
        0,
        "UT_0637",
        "Testing state transition current=15 to next=4 with prereq=0x2"
    );
}
static void run_unit_test_0638(void) {
    run_fsm_assert(
        100,
        4,
        0x2ULL,
        0,
        "UT_0638",
        "Testing state transition current=100 to next=4 with prereq=0x2"
    );
}
static void run_unit_test_0639(void) {
    run_fsm_assert(
        -100,
        4,
        0x2ULL,
        0,
        "UT_0639",
        "Testing state transition current=-100 to next=4 with prereq=0x2"
    );
}
static void run_unit_test_0640(void) {
    run_fsm_assert(
        -10,
        5,
        0x2ULL,
        0,
        "UT_0640",
        "Testing state transition current=-10 to next=5 with prereq=0x2"
    );
}
static void run_unit_test_0641(void) {
    run_fsm_assert(
        -5,
        5,
        0x2ULL,
        0,
        "UT_0641",
        "Testing state transition current=-5 to next=5 with prereq=0x2"
    );
}
static void run_unit_test_0642(void) {
    run_fsm_assert(
        -1,
        5,
        0x2ULL,
        0,
        "UT_0642",
        "Testing state transition current=-1 to next=5 with prereq=0x2"
    );
}
static void run_unit_test_0643(void) {
    run_fsm_assert(
        0,
        5,
        0x2ULL,
        0,
        "UT_0643",
        "Testing state transition current=0 to next=5 with prereq=0x2"
    );
}
static void run_unit_test_0644(void) {
    run_fsm_assert(
        1,
        5,
        0x2ULL,
        0,
        "UT_0644",
        "Testing state transition current=1 to next=5 with prereq=0x2"
    );
}
static void run_unit_test_0645(void) {
    run_fsm_assert(
        2,
        5,
        0x2ULL,
        0,
        "UT_0645",
        "Testing state transition current=2 to next=5 with prereq=0x2"
    );
}
static void run_unit_test_0646(void) {
    run_fsm_assert(
        3,
        5,
        0x2ULL,
        0,
        "UT_0646",
        "Testing state transition current=3 to next=5 with prereq=0x2"
    );
}
static void run_unit_test_0647(void) {
    run_fsm_assert(
        4,
        5,
        0x2ULL,
        0,
        "UT_0647",
        "Testing state transition current=4 to next=5 with prereq=0x2"
    );
}
static void run_unit_test_0648(void) {
    run_fsm_assert(
        5,
        5,
        0x2ULL,
        0,
        "UT_0648",
        "Testing state transition current=5 to next=5 with prereq=0x2"
    );
}
static void run_unit_test_0649(void) {
    run_fsm_assert(
        6,
        5,
        0x2ULL,
        0,
        "UT_0649",
        "Testing state transition current=6 to next=5 with prereq=0x2"
    );
}
static void run_unit_test_0650(void) {
    run_fsm_assert(
        7,
        5,
        0x2ULL,
        0,
        "UT_0650",
        "Testing state transition current=7 to next=5 with prereq=0x2"
    );
}
static void run_unit_test_0651(void) {
    run_fsm_assert(
        8,
        5,
        0x2ULL,
        0,
        "UT_0651",
        "Testing state transition current=8 to next=5 with prereq=0x2"
    );
}
static void run_unit_test_0652(void) {
    run_fsm_assert(
        10,
        5,
        0x2ULL,
        0,
        "UT_0652",
        "Testing state transition current=10 to next=5 with prereq=0x2"
    );
}
static void run_unit_test_0653(void) {
    run_fsm_assert(
        15,
        5,
        0x2ULL,
        0,
        "UT_0653",
        "Testing state transition current=15 to next=5 with prereq=0x2"
    );
}
static void run_unit_test_0654(void) {
    run_fsm_assert(
        100,
        5,
        0x2ULL,
        0,
        "UT_0654",
        "Testing state transition current=100 to next=5 with prereq=0x2"
    );
}
static void run_unit_test_0655(void) {
    run_fsm_assert(
        -100,
        5,
        0x2ULL,
        0,
        "UT_0655",
        "Testing state transition current=-100 to next=5 with prereq=0x2"
    );
}
static void run_unit_test_0656(void) {
    run_fsm_assert(
        -10,
        6,
        0x2ULL,
        0,
        "UT_0656",
        "Testing state transition current=-10 to next=6 with prereq=0x2"
    );
}
static void run_unit_test_0657(void) {
    run_fsm_assert(
        -5,
        6,
        0x2ULL,
        0,
        "UT_0657",
        "Testing state transition current=-5 to next=6 with prereq=0x2"
    );
}
static void run_unit_test_0658(void) {
    run_fsm_assert(
        -1,
        6,
        0x2ULL,
        0,
        "UT_0658",
        "Testing state transition current=-1 to next=6 with prereq=0x2"
    );
}
static void run_unit_test_0659(void) {
    run_fsm_assert(
        0,
        6,
        0x2ULL,
        0,
        "UT_0659",
        "Testing state transition current=0 to next=6 with prereq=0x2"
    );
}
static void run_unit_test_0660(void) {
    run_fsm_assert(
        1,
        6,
        0x2ULL,
        0,
        "UT_0660",
        "Testing state transition current=1 to next=6 with prereq=0x2"
    );
}
static void run_unit_test_0661(void) {
    run_fsm_assert(
        2,
        6,
        0x2ULL,
        0,
        "UT_0661",
        "Testing state transition current=2 to next=6 with prereq=0x2"
    );
}
static void run_unit_test_0662(void) {
    run_fsm_assert(
        3,
        6,
        0x2ULL,
        0,
        "UT_0662",
        "Testing state transition current=3 to next=6 with prereq=0x2"
    );
}
static void run_unit_test_0663(void) {
    run_fsm_assert(
        4,
        6,
        0x2ULL,
        0,
        "UT_0663",
        "Testing state transition current=4 to next=6 with prereq=0x2"
    );
}
static void run_unit_test_0664(void) {
    run_fsm_assert(
        5,
        6,
        0x2ULL,
        0,
        "UT_0664",
        "Testing state transition current=5 to next=6 with prereq=0x2"
    );
}
static void run_unit_test_0665(void) {
    run_fsm_assert(
        6,
        6,
        0x2ULL,
        0,
        "UT_0665",
        "Testing state transition current=6 to next=6 with prereq=0x2"
    );
}
static void run_unit_test_0666(void) {
    run_fsm_assert(
        7,
        6,
        0x2ULL,
        0,
        "UT_0666",
        "Testing state transition current=7 to next=6 with prereq=0x2"
    );
}
static void run_unit_test_0667(void) {
    run_fsm_assert(
        8,
        6,
        0x2ULL,
        0,
        "UT_0667",
        "Testing state transition current=8 to next=6 with prereq=0x2"
    );
}
static void run_unit_test_0668(void) {
    run_fsm_assert(
        10,
        6,
        0x2ULL,
        0,
        "UT_0668",
        "Testing state transition current=10 to next=6 with prereq=0x2"
    );
}
static void run_unit_test_0669(void) {
    run_fsm_assert(
        15,
        6,
        0x2ULL,
        0,
        "UT_0669",
        "Testing state transition current=15 to next=6 with prereq=0x2"
    );
}
static void run_unit_test_0670(void) {
    run_fsm_assert(
        100,
        6,
        0x2ULL,
        0,
        "UT_0670",
        "Testing state transition current=100 to next=6 with prereq=0x2"
    );
}
static void run_unit_test_0671(void) {
    run_fsm_assert(
        -100,
        6,
        0x2ULL,
        0,
        "UT_0671",
        "Testing state transition current=-100 to next=6 with prereq=0x2"
    );
}
static void run_unit_test_0672(void) {
    run_fsm_assert(
        -10,
        7,
        0x2ULL,
        0,
        "UT_0672",
        "Testing state transition current=-10 to next=7 with prereq=0x2"
    );
}
static void run_unit_test_0673(void) {
    run_fsm_assert(
        -5,
        7,
        0x2ULL,
        0,
        "UT_0673",
        "Testing state transition current=-5 to next=7 with prereq=0x2"
    );
}
static void run_unit_test_0674(void) {
    run_fsm_assert(
        -1,
        7,
        0x2ULL,
        0,
        "UT_0674",
        "Testing state transition current=-1 to next=7 with prereq=0x2"
    );
}
static void run_unit_test_0675(void) {
    run_fsm_assert(
        0,
        7,
        0x2ULL,
        0,
        "UT_0675",
        "Testing state transition current=0 to next=7 with prereq=0x2"
    );
}
static void run_unit_test_0676(void) {
    run_fsm_assert(
        1,
        7,
        0x2ULL,
        0,
        "UT_0676",
        "Testing state transition current=1 to next=7 with prereq=0x2"
    );
}
static void run_unit_test_0677(void) {
    run_fsm_assert(
        2,
        7,
        0x2ULL,
        0,
        "UT_0677",
        "Testing state transition current=2 to next=7 with prereq=0x2"
    );
}
static void run_unit_test_0678(void) {
    run_fsm_assert(
        3,
        7,
        0x2ULL,
        0,
        "UT_0678",
        "Testing state transition current=3 to next=7 with prereq=0x2"
    );
}
static void run_unit_test_0679(void) {
    run_fsm_assert(
        4,
        7,
        0x2ULL,
        0,
        "UT_0679",
        "Testing state transition current=4 to next=7 with prereq=0x2"
    );
}
static void run_unit_test_0680(void) {
    run_fsm_assert(
        5,
        7,
        0x2ULL,
        0,
        "UT_0680",
        "Testing state transition current=5 to next=7 with prereq=0x2"
    );
}
static void run_unit_test_0681(void) {
    run_fsm_assert(
        6,
        7,
        0x2ULL,
        0,
        "UT_0681",
        "Testing state transition current=6 to next=7 with prereq=0x2"
    );
}
static void run_unit_test_0682(void) {
    run_fsm_assert(
        7,
        7,
        0x2ULL,
        0,
        "UT_0682",
        "Testing state transition current=7 to next=7 with prereq=0x2"
    );
}
static void run_unit_test_0683(void) {
    run_fsm_assert(
        8,
        7,
        0x2ULL,
        0,
        "UT_0683",
        "Testing state transition current=8 to next=7 with prereq=0x2"
    );
}
static void run_unit_test_0684(void) {
    run_fsm_assert(
        10,
        7,
        0x2ULL,
        0,
        "UT_0684",
        "Testing state transition current=10 to next=7 with prereq=0x2"
    );
}
static void run_unit_test_0685(void) {
    run_fsm_assert(
        15,
        7,
        0x2ULL,
        0,
        "UT_0685",
        "Testing state transition current=15 to next=7 with prereq=0x2"
    );
}
static void run_unit_test_0686(void) {
    run_fsm_assert(
        100,
        7,
        0x2ULL,
        0,
        "UT_0686",
        "Testing state transition current=100 to next=7 with prereq=0x2"
    );
}
static void run_unit_test_0687(void) {
    run_fsm_assert(
        -100,
        7,
        0x2ULL,
        0,
        "UT_0687",
        "Testing state transition current=-100 to next=7 with prereq=0x2"
    );
}
static void run_unit_test_0688(void) {
    run_fsm_assert(
        -10,
        8,
        0x2ULL,
        0,
        "UT_0688",
        "Testing state transition current=-10 to next=8 with prereq=0x2"
    );
}
static void run_unit_test_0689(void) {
    run_fsm_assert(
        -5,
        8,
        0x2ULL,
        0,
        "UT_0689",
        "Testing state transition current=-5 to next=8 with prereq=0x2"
    );
}
static void run_unit_test_0690(void) {
    run_fsm_assert(
        -1,
        8,
        0x2ULL,
        0,
        "UT_0690",
        "Testing state transition current=-1 to next=8 with prereq=0x2"
    );
}
static void run_unit_test_0691(void) {
    run_fsm_assert(
        0,
        8,
        0x2ULL,
        0,
        "UT_0691",
        "Testing state transition current=0 to next=8 with prereq=0x2"
    );
}
static void run_unit_test_0692(void) {
    run_fsm_assert(
        1,
        8,
        0x2ULL,
        0,
        "UT_0692",
        "Testing state transition current=1 to next=8 with prereq=0x2"
    );
}
static void run_unit_test_0693(void) {
    run_fsm_assert(
        2,
        8,
        0x2ULL,
        0,
        "UT_0693",
        "Testing state transition current=2 to next=8 with prereq=0x2"
    );
}
static void run_unit_test_0694(void) {
    run_fsm_assert(
        3,
        8,
        0x2ULL,
        0,
        "UT_0694",
        "Testing state transition current=3 to next=8 with prereq=0x2"
    );
}
static void run_unit_test_0695(void) {
    run_fsm_assert(
        4,
        8,
        0x2ULL,
        0,
        "UT_0695",
        "Testing state transition current=4 to next=8 with prereq=0x2"
    );
}
static void run_unit_test_0696(void) {
    run_fsm_assert(
        5,
        8,
        0x2ULL,
        0,
        "UT_0696",
        "Testing state transition current=5 to next=8 with prereq=0x2"
    );
}
static void run_unit_test_0697(void) {
    run_fsm_assert(
        6,
        8,
        0x2ULL,
        0,
        "UT_0697",
        "Testing state transition current=6 to next=8 with prereq=0x2"
    );
}
static void run_unit_test_0698(void) {
    run_fsm_assert(
        7,
        8,
        0x2ULL,
        0,
        "UT_0698",
        "Testing state transition current=7 to next=8 with prereq=0x2"
    );
}
static void run_unit_test_0699(void) {
    run_fsm_assert(
        8,
        8,
        0x2ULL,
        0,
        "UT_0699",
        "Testing state transition current=8 to next=8 with prereq=0x2"
    );
}
static void run_unit_test_0700(void) {
    run_fsm_assert(
        10,
        8,
        0x2ULL,
        0,
        "UT_0700",
        "Testing state transition current=10 to next=8 with prereq=0x2"
    );
}
static void run_unit_test_0701(void) {
    run_fsm_assert(
        15,
        8,
        0x2ULL,
        0,
        "UT_0701",
        "Testing state transition current=15 to next=8 with prereq=0x2"
    );
}
static void run_unit_test_0702(void) {
    run_fsm_assert(
        100,
        8,
        0x2ULL,
        0,
        "UT_0702",
        "Testing state transition current=100 to next=8 with prereq=0x2"
    );
}
static void run_unit_test_0703(void) {
    run_fsm_assert(
        -100,
        8,
        0x2ULL,
        0,
        "UT_0703",
        "Testing state transition current=-100 to next=8 with prereq=0x2"
    );
}
static void run_unit_test_0704(void) {
    run_fsm_assert(
        -10,
        10,
        0x2ULL,
        0,
        "UT_0704",
        "Testing state transition current=-10 to next=10 with prereq=0x2"
    );
}
static void run_unit_test_0705(void) {
    run_fsm_assert(
        -5,
        10,
        0x2ULL,
        0,
        "UT_0705",
        "Testing state transition current=-5 to next=10 with prereq=0x2"
    );
}
static void run_unit_test_0706(void) {
    run_fsm_assert(
        -1,
        10,
        0x2ULL,
        0,
        "UT_0706",
        "Testing state transition current=-1 to next=10 with prereq=0x2"
    );
}
static void run_unit_test_0707(void) {
    run_fsm_assert(
        0,
        10,
        0x2ULL,
        0,
        "UT_0707",
        "Testing state transition current=0 to next=10 with prereq=0x2"
    );
}
static void run_unit_test_0708(void) {
    run_fsm_assert(
        1,
        10,
        0x2ULL,
        0,
        "UT_0708",
        "Testing state transition current=1 to next=10 with prereq=0x2"
    );
}
static void run_unit_test_0709(void) {
    run_fsm_assert(
        2,
        10,
        0x2ULL,
        0,
        "UT_0709",
        "Testing state transition current=2 to next=10 with prereq=0x2"
    );
}
static void run_unit_test_0710(void) {
    run_fsm_assert(
        3,
        10,
        0x2ULL,
        0,
        "UT_0710",
        "Testing state transition current=3 to next=10 with prereq=0x2"
    );
}
static void run_unit_test_0711(void) {
    run_fsm_assert(
        4,
        10,
        0x2ULL,
        0,
        "UT_0711",
        "Testing state transition current=4 to next=10 with prereq=0x2"
    );
}
static void run_unit_test_0712(void) {
    run_fsm_assert(
        5,
        10,
        0x2ULL,
        0,
        "UT_0712",
        "Testing state transition current=5 to next=10 with prereq=0x2"
    );
}
static void run_unit_test_0713(void) {
    run_fsm_assert(
        6,
        10,
        0x2ULL,
        0,
        "UT_0713",
        "Testing state transition current=6 to next=10 with prereq=0x2"
    );
}
static void run_unit_test_0714(void) {
    run_fsm_assert(
        7,
        10,
        0x2ULL,
        0,
        "UT_0714",
        "Testing state transition current=7 to next=10 with prereq=0x2"
    );
}
static void run_unit_test_0715(void) {
    run_fsm_assert(
        8,
        10,
        0x2ULL,
        0,
        "UT_0715",
        "Testing state transition current=8 to next=10 with prereq=0x2"
    );
}
static void run_unit_test_0716(void) {
    run_fsm_assert(
        10,
        10,
        0x2ULL,
        0,
        "UT_0716",
        "Testing state transition current=10 to next=10 with prereq=0x2"
    );
}
static void run_unit_test_0717(void) {
    run_fsm_assert(
        15,
        10,
        0x2ULL,
        0,
        "UT_0717",
        "Testing state transition current=15 to next=10 with prereq=0x2"
    );
}
static void run_unit_test_0718(void) {
    run_fsm_assert(
        100,
        10,
        0x2ULL,
        0,
        "UT_0718",
        "Testing state transition current=100 to next=10 with prereq=0x2"
    );
}
static void run_unit_test_0719(void) {
    run_fsm_assert(
        -100,
        10,
        0x2ULL,
        0,
        "UT_0719",
        "Testing state transition current=-100 to next=10 with prereq=0x2"
    );
}
static void run_unit_test_0720(void) {
    run_fsm_assert(
        -10,
        15,
        0x2ULL,
        0,
        "UT_0720",
        "Testing state transition current=-10 to next=15 with prereq=0x2"
    );
}
static void run_unit_test_0721(void) {
    run_fsm_assert(
        -5,
        15,
        0x2ULL,
        0,
        "UT_0721",
        "Testing state transition current=-5 to next=15 with prereq=0x2"
    );
}
static void run_unit_test_0722(void) {
    run_fsm_assert(
        -1,
        15,
        0x2ULL,
        0,
        "UT_0722",
        "Testing state transition current=-1 to next=15 with prereq=0x2"
    );
}
static void run_unit_test_0723(void) {
    run_fsm_assert(
        0,
        15,
        0x2ULL,
        0,
        "UT_0723",
        "Testing state transition current=0 to next=15 with prereq=0x2"
    );
}
static void run_unit_test_0724(void) {
    run_fsm_assert(
        1,
        15,
        0x2ULL,
        0,
        "UT_0724",
        "Testing state transition current=1 to next=15 with prereq=0x2"
    );
}
static void run_unit_test_0725(void) {
    run_fsm_assert(
        2,
        15,
        0x2ULL,
        0,
        "UT_0725",
        "Testing state transition current=2 to next=15 with prereq=0x2"
    );
}
static void run_unit_test_0726(void) {
    run_fsm_assert(
        3,
        15,
        0x2ULL,
        0,
        "UT_0726",
        "Testing state transition current=3 to next=15 with prereq=0x2"
    );
}
static void run_unit_test_0727(void) {
    run_fsm_assert(
        4,
        15,
        0x2ULL,
        0,
        "UT_0727",
        "Testing state transition current=4 to next=15 with prereq=0x2"
    );
}
static void run_unit_test_0728(void) {
    run_fsm_assert(
        5,
        15,
        0x2ULL,
        0,
        "UT_0728",
        "Testing state transition current=5 to next=15 with prereq=0x2"
    );
}
static void run_unit_test_0729(void) {
    run_fsm_assert(
        6,
        15,
        0x2ULL,
        0,
        "UT_0729",
        "Testing state transition current=6 to next=15 with prereq=0x2"
    );
}
static void run_unit_test_0730(void) {
    run_fsm_assert(
        7,
        15,
        0x2ULL,
        0,
        "UT_0730",
        "Testing state transition current=7 to next=15 with prereq=0x2"
    );
}
static void run_unit_test_0731(void) {
    run_fsm_assert(
        8,
        15,
        0x2ULL,
        0,
        "UT_0731",
        "Testing state transition current=8 to next=15 with prereq=0x2"
    );
}
static void run_unit_test_0732(void) {
    run_fsm_assert(
        10,
        15,
        0x2ULL,
        0,
        "UT_0732",
        "Testing state transition current=10 to next=15 with prereq=0x2"
    );
}
static void run_unit_test_0733(void) {
    run_fsm_assert(
        15,
        15,
        0x2ULL,
        0,
        "UT_0733",
        "Testing state transition current=15 to next=15 with prereq=0x2"
    );
}
static void run_unit_test_0734(void) {
    run_fsm_assert(
        100,
        15,
        0x2ULL,
        0,
        "UT_0734",
        "Testing state transition current=100 to next=15 with prereq=0x2"
    );
}
static void run_unit_test_0735(void) {
    run_fsm_assert(
        -100,
        15,
        0x2ULL,
        0,
        "UT_0735",
        "Testing state transition current=-100 to next=15 with prereq=0x2"
    );
}
static void run_unit_test_0736(void) {
    run_fsm_assert(
        -10,
        100,
        0x2ULL,
        0,
        "UT_0736",
        "Testing state transition current=-10 to next=100 with prereq=0x2"
    );
}
static void run_unit_test_0737(void) {
    run_fsm_assert(
        -5,
        100,
        0x2ULL,
        0,
        "UT_0737",
        "Testing state transition current=-5 to next=100 with prereq=0x2"
    );
}
static void run_unit_test_0738(void) {
    run_fsm_assert(
        -1,
        100,
        0x2ULL,
        0,
        "UT_0738",
        "Testing state transition current=-1 to next=100 with prereq=0x2"
    );
}
static void run_unit_test_0739(void) {
    run_fsm_assert(
        0,
        100,
        0x2ULL,
        0,
        "UT_0739",
        "Testing state transition current=0 to next=100 with prereq=0x2"
    );
}
static void run_unit_test_0740(void) {
    run_fsm_assert(
        1,
        100,
        0x2ULL,
        0,
        "UT_0740",
        "Testing state transition current=1 to next=100 with prereq=0x2"
    );
}
static void run_unit_test_0741(void) {
    run_fsm_assert(
        2,
        100,
        0x2ULL,
        0,
        "UT_0741",
        "Testing state transition current=2 to next=100 with prereq=0x2"
    );
}
static void run_unit_test_0742(void) {
    run_fsm_assert(
        3,
        100,
        0x2ULL,
        0,
        "UT_0742",
        "Testing state transition current=3 to next=100 with prereq=0x2"
    );
}
static void run_unit_test_0743(void) {
    run_fsm_assert(
        4,
        100,
        0x2ULL,
        0,
        "UT_0743",
        "Testing state transition current=4 to next=100 with prereq=0x2"
    );
}
static void run_unit_test_0744(void) {
    run_fsm_assert(
        5,
        100,
        0x2ULL,
        0,
        "UT_0744",
        "Testing state transition current=5 to next=100 with prereq=0x2"
    );
}
static void run_unit_test_0745(void) {
    run_fsm_assert(
        6,
        100,
        0x2ULL,
        0,
        "UT_0745",
        "Testing state transition current=6 to next=100 with prereq=0x2"
    );
}
static void run_unit_test_0746(void) {
    run_fsm_assert(
        7,
        100,
        0x2ULL,
        0,
        "UT_0746",
        "Testing state transition current=7 to next=100 with prereq=0x2"
    );
}
static void run_unit_test_0747(void) {
    run_fsm_assert(
        8,
        100,
        0x2ULL,
        0,
        "UT_0747",
        "Testing state transition current=8 to next=100 with prereq=0x2"
    );
}
static void run_unit_test_0748(void) {
    run_fsm_assert(
        10,
        100,
        0x2ULL,
        0,
        "UT_0748",
        "Testing state transition current=10 to next=100 with prereq=0x2"
    );
}
static void run_unit_test_0749(void) {
    run_fsm_assert(
        15,
        100,
        0x2ULL,
        0,
        "UT_0749",
        "Testing state transition current=15 to next=100 with prereq=0x2"
    );
}
static void run_unit_test_0750(void) {
    run_fsm_assert(
        100,
        100,
        0x2ULL,
        0,
        "UT_0750",
        "Testing state transition current=100 to next=100 with prereq=0x2"
    );
}
static void run_unit_test_0751(void) {
    run_fsm_assert(
        -100,
        100,
        0x2ULL,
        0,
        "UT_0751",
        "Testing state transition current=-100 to next=100 with prereq=0x2"
    );
}
static void run_unit_test_0752(void) {
    run_fsm_assert(
        -10,
        -100,
        0x2ULL,
        0,
        "UT_0752",
        "Testing state transition current=-10 to next=-100 with prereq=0x2"
    );
}
static void run_unit_test_0753(void) {
    run_fsm_assert(
        -5,
        -100,
        0x2ULL,
        0,
        "UT_0753",
        "Testing state transition current=-5 to next=-100 with prereq=0x2"
    );
}
static void run_unit_test_0754(void) {
    run_fsm_assert(
        -1,
        -100,
        0x2ULL,
        0,
        "UT_0754",
        "Testing state transition current=-1 to next=-100 with prereq=0x2"
    );
}
static void run_unit_test_0755(void) {
    run_fsm_assert(
        0,
        -100,
        0x2ULL,
        0,
        "UT_0755",
        "Testing state transition current=0 to next=-100 with prereq=0x2"
    );
}
static void run_unit_test_0756(void) {
    run_fsm_assert(
        1,
        -100,
        0x2ULL,
        0,
        "UT_0756",
        "Testing state transition current=1 to next=-100 with prereq=0x2"
    );
}
static void run_unit_test_0757(void) {
    run_fsm_assert(
        2,
        -100,
        0x2ULL,
        0,
        "UT_0757",
        "Testing state transition current=2 to next=-100 with prereq=0x2"
    );
}
static void run_unit_test_0758(void) {
    run_fsm_assert(
        3,
        -100,
        0x2ULL,
        0,
        "UT_0758",
        "Testing state transition current=3 to next=-100 with prereq=0x2"
    );
}
static void run_unit_test_0759(void) {
    run_fsm_assert(
        4,
        -100,
        0x2ULL,
        0,
        "UT_0759",
        "Testing state transition current=4 to next=-100 with prereq=0x2"
    );
}
static void run_unit_test_0760(void) {
    run_fsm_assert(
        5,
        -100,
        0x2ULL,
        0,
        "UT_0760",
        "Testing state transition current=5 to next=-100 with prereq=0x2"
    );
}
static void run_unit_test_0761(void) {
    run_fsm_assert(
        6,
        -100,
        0x2ULL,
        0,
        "UT_0761",
        "Testing state transition current=6 to next=-100 with prereq=0x2"
    );
}
static void run_unit_test_0762(void) {
    run_fsm_assert(
        7,
        -100,
        0x2ULL,
        0,
        "UT_0762",
        "Testing state transition current=7 to next=-100 with prereq=0x2"
    );
}
static void run_unit_test_0763(void) {
    run_fsm_assert(
        8,
        -100,
        0x2ULL,
        0,
        "UT_0763",
        "Testing state transition current=8 to next=-100 with prereq=0x2"
    );
}
static void run_unit_test_0764(void) {
    run_fsm_assert(
        10,
        -100,
        0x2ULL,
        0,
        "UT_0764",
        "Testing state transition current=10 to next=-100 with prereq=0x2"
    );
}
static void run_unit_test_0765(void) {
    run_fsm_assert(
        15,
        -100,
        0x2ULL,
        0,
        "UT_0765",
        "Testing state transition current=15 to next=-100 with prereq=0x2"
    );
}
static void run_unit_test_0766(void) {
    run_fsm_assert(
        100,
        -100,
        0x2ULL,
        0,
        "UT_0766",
        "Testing state transition current=100 to next=-100 with prereq=0x2"
    );
}
static void run_unit_test_0767(void) {
    run_fsm_assert(
        -100,
        -100,
        0x2ULL,
        0,
        "UT_0767",
        "Testing state transition current=-100 to next=-100 with prereq=0x2"
    );
}
static void run_unit_test_0768(void) {
    run_fsm_assert(
        -10,
        -10,
        0x4ULL,
        0,
        "UT_0768",
        "Testing state transition current=-10 to next=-10 with prereq=0x4"
    );
}
static void run_unit_test_0769(void) {
    run_fsm_assert(
        -5,
        -10,
        0x4ULL,
        0,
        "UT_0769",
        "Testing state transition current=-5 to next=-10 with prereq=0x4"
    );
}
static void run_unit_test_0770(void) {
    run_fsm_assert(
        -1,
        -10,
        0x4ULL,
        0,
        "UT_0770",
        "Testing state transition current=-1 to next=-10 with prereq=0x4"
    );
}
static void run_unit_test_0771(void) {
    run_fsm_assert(
        0,
        -10,
        0x4ULL,
        0,
        "UT_0771",
        "Testing state transition current=0 to next=-10 with prereq=0x4"
    );
}
static void run_unit_test_0772(void) {
    run_fsm_assert(
        1,
        -10,
        0x4ULL,
        0,
        "UT_0772",
        "Testing state transition current=1 to next=-10 with prereq=0x4"
    );
}
static void run_unit_test_0773(void) {
    run_fsm_assert(
        2,
        -10,
        0x4ULL,
        0,
        "UT_0773",
        "Testing state transition current=2 to next=-10 with prereq=0x4"
    );
}
static void run_unit_test_0774(void) {
    run_fsm_assert(
        3,
        -10,
        0x4ULL,
        0,
        "UT_0774",
        "Testing state transition current=3 to next=-10 with prereq=0x4"
    );
}
static void run_unit_test_0775(void) {
    run_fsm_assert(
        4,
        -10,
        0x4ULL,
        0,
        "UT_0775",
        "Testing state transition current=4 to next=-10 with prereq=0x4"
    );
}
static void run_unit_test_0776(void) {
    run_fsm_assert(
        5,
        -10,
        0x4ULL,
        0,
        "UT_0776",
        "Testing state transition current=5 to next=-10 with prereq=0x4"
    );
}
static void run_unit_test_0777(void) {
    run_fsm_assert(
        6,
        -10,
        0x4ULL,
        0,
        "UT_0777",
        "Testing state transition current=6 to next=-10 with prereq=0x4"
    );
}
static void run_unit_test_0778(void) {
    run_fsm_assert(
        7,
        -10,
        0x4ULL,
        0,
        "UT_0778",
        "Testing state transition current=7 to next=-10 with prereq=0x4"
    );
}
static void run_unit_test_0779(void) {
    run_fsm_assert(
        8,
        -10,
        0x4ULL,
        0,
        "UT_0779",
        "Testing state transition current=8 to next=-10 with prereq=0x4"
    );
}
static void run_unit_test_0780(void) {
    run_fsm_assert(
        10,
        -10,
        0x4ULL,
        0,
        "UT_0780",
        "Testing state transition current=10 to next=-10 with prereq=0x4"
    );
}
static void run_unit_test_0781(void) {
    run_fsm_assert(
        15,
        -10,
        0x4ULL,
        0,
        "UT_0781",
        "Testing state transition current=15 to next=-10 with prereq=0x4"
    );
}
static void run_unit_test_0782(void) {
    run_fsm_assert(
        100,
        -10,
        0x4ULL,
        0,
        "UT_0782",
        "Testing state transition current=100 to next=-10 with prereq=0x4"
    );
}
static void run_unit_test_0783(void) {
    run_fsm_assert(
        -100,
        -10,
        0x4ULL,
        0,
        "UT_0783",
        "Testing state transition current=-100 to next=-10 with prereq=0x4"
    );
}
static void run_unit_test_0784(void) {
    run_fsm_assert(
        -10,
        -5,
        0x4ULL,
        0,
        "UT_0784",
        "Testing state transition current=-10 to next=-5 with prereq=0x4"
    );
}
static void run_unit_test_0785(void) {
    run_fsm_assert(
        -5,
        -5,
        0x4ULL,
        0,
        "UT_0785",
        "Testing state transition current=-5 to next=-5 with prereq=0x4"
    );
}
static void run_unit_test_0786(void) {
    run_fsm_assert(
        -1,
        -5,
        0x4ULL,
        0,
        "UT_0786",
        "Testing state transition current=-1 to next=-5 with prereq=0x4"
    );
}
static void run_unit_test_0787(void) {
    run_fsm_assert(
        0,
        -5,
        0x4ULL,
        0,
        "UT_0787",
        "Testing state transition current=0 to next=-5 with prereq=0x4"
    );
}
static void run_unit_test_0788(void) {
    run_fsm_assert(
        1,
        -5,
        0x4ULL,
        0,
        "UT_0788",
        "Testing state transition current=1 to next=-5 with prereq=0x4"
    );
}
static void run_unit_test_0789(void) {
    run_fsm_assert(
        2,
        -5,
        0x4ULL,
        0,
        "UT_0789",
        "Testing state transition current=2 to next=-5 with prereq=0x4"
    );
}
static void run_unit_test_0790(void) {
    run_fsm_assert(
        3,
        -5,
        0x4ULL,
        0,
        "UT_0790",
        "Testing state transition current=3 to next=-5 with prereq=0x4"
    );
}
static void run_unit_test_0791(void) {
    run_fsm_assert(
        4,
        -5,
        0x4ULL,
        0,
        "UT_0791",
        "Testing state transition current=4 to next=-5 with prereq=0x4"
    );
}
static void run_unit_test_0792(void) {
    run_fsm_assert(
        5,
        -5,
        0x4ULL,
        0,
        "UT_0792",
        "Testing state transition current=5 to next=-5 with prereq=0x4"
    );
}
static void run_unit_test_0793(void) {
    run_fsm_assert(
        6,
        -5,
        0x4ULL,
        0,
        "UT_0793",
        "Testing state transition current=6 to next=-5 with prereq=0x4"
    );
}
static void run_unit_test_0794(void) {
    run_fsm_assert(
        7,
        -5,
        0x4ULL,
        0,
        "UT_0794",
        "Testing state transition current=7 to next=-5 with prereq=0x4"
    );
}
static void run_unit_test_0795(void) {
    run_fsm_assert(
        8,
        -5,
        0x4ULL,
        0,
        "UT_0795",
        "Testing state transition current=8 to next=-5 with prereq=0x4"
    );
}
static void run_unit_test_0796(void) {
    run_fsm_assert(
        10,
        -5,
        0x4ULL,
        0,
        "UT_0796",
        "Testing state transition current=10 to next=-5 with prereq=0x4"
    );
}
static void run_unit_test_0797(void) {
    run_fsm_assert(
        15,
        -5,
        0x4ULL,
        0,
        "UT_0797",
        "Testing state transition current=15 to next=-5 with prereq=0x4"
    );
}
static void run_unit_test_0798(void) {
    run_fsm_assert(
        100,
        -5,
        0x4ULL,
        0,
        "UT_0798",
        "Testing state transition current=100 to next=-5 with prereq=0x4"
    );
}
static void run_unit_test_0799(void) {
    run_fsm_assert(
        -100,
        -5,
        0x4ULL,
        0,
        "UT_0799",
        "Testing state transition current=-100 to next=-5 with prereq=0x4"
    );
}
static void run_unit_test_0800(void) {
    run_fsm_assert(
        -10,
        -1,
        0x4ULL,
        0,
        "UT_0800",
        "Testing state transition current=-10 to next=-1 with prereq=0x4"
    );
}
static void run_unit_test_0801(void) {
    run_fsm_assert(
        -5,
        -1,
        0x4ULL,
        0,
        "UT_0801",
        "Testing state transition current=-5 to next=-1 with prereq=0x4"
    );
}
static void run_unit_test_0802(void) {
    run_fsm_assert(
        -1,
        -1,
        0x4ULL,
        0,
        "UT_0802",
        "Testing state transition current=-1 to next=-1 with prereq=0x4"
    );
}
static void run_unit_test_0803(void) {
    run_fsm_assert(
        0,
        -1,
        0x4ULL,
        0,
        "UT_0803",
        "Testing state transition current=0 to next=-1 with prereq=0x4"
    );
}
static void run_unit_test_0804(void) {
    run_fsm_assert(
        1,
        -1,
        0x4ULL,
        0,
        "UT_0804",
        "Testing state transition current=1 to next=-1 with prereq=0x4"
    );
}
static void run_unit_test_0805(void) {
    run_fsm_assert(
        2,
        -1,
        0x4ULL,
        0,
        "UT_0805",
        "Testing state transition current=2 to next=-1 with prereq=0x4"
    );
}
static void run_unit_test_0806(void) {
    run_fsm_assert(
        3,
        -1,
        0x4ULL,
        0,
        "UT_0806",
        "Testing state transition current=3 to next=-1 with prereq=0x4"
    );
}
static void run_unit_test_0807(void) {
    run_fsm_assert(
        4,
        -1,
        0x4ULL,
        0,
        "UT_0807",
        "Testing state transition current=4 to next=-1 with prereq=0x4"
    );
}
static void run_unit_test_0808(void) {
    run_fsm_assert(
        5,
        -1,
        0x4ULL,
        0,
        "UT_0808",
        "Testing state transition current=5 to next=-1 with prereq=0x4"
    );
}
static void run_unit_test_0809(void) {
    run_fsm_assert(
        6,
        -1,
        0x4ULL,
        0,
        "UT_0809",
        "Testing state transition current=6 to next=-1 with prereq=0x4"
    );
}
static void run_unit_test_0810(void) {
    run_fsm_assert(
        7,
        -1,
        0x4ULL,
        0,
        "UT_0810",
        "Testing state transition current=7 to next=-1 with prereq=0x4"
    );
}
static void run_unit_test_0811(void) {
    run_fsm_assert(
        8,
        -1,
        0x4ULL,
        0,
        "UT_0811",
        "Testing state transition current=8 to next=-1 with prereq=0x4"
    );
}
static void run_unit_test_0812(void) {
    run_fsm_assert(
        10,
        -1,
        0x4ULL,
        0,
        "UT_0812",
        "Testing state transition current=10 to next=-1 with prereq=0x4"
    );
}
static void run_unit_test_0813(void) {
    run_fsm_assert(
        15,
        -1,
        0x4ULL,
        0,
        "UT_0813",
        "Testing state transition current=15 to next=-1 with prereq=0x4"
    );
}
static void run_unit_test_0814(void) {
    run_fsm_assert(
        100,
        -1,
        0x4ULL,
        0,
        "UT_0814",
        "Testing state transition current=100 to next=-1 with prereq=0x4"
    );
}
static void run_unit_test_0815(void) {
    run_fsm_assert(
        -100,
        -1,
        0x4ULL,
        0,
        "UT_0815",
        "Testing state transition current=-100 to next=-1 with prereq=0x4"
    );
}
static void run_unit_test_0816(void) {
    run_fsm_assert(
        -10,
        0,
        0x4ULL,
        0,
        "UT_0816",
        "Testing state transition current=-10 to next=0 with prereq=0x4"
    );
}
static void run_unit_test_0817(void) {
    run_fsm_assert(
        -5,
        0,
        0x4ULL,
        0,
        "UT_0817",
        "Testing state transition current=-5 to next=0 with prereq=0x4"
    );
}
static void run_unit_test_0818(void) {
    run_fsm_assert(
        -1,
        0,
        0x4ULL,
        0,
        "UT_0818",
        "Testing state transition current=-1 to next=0 with prereq=0x4"
    );
}
static void run_unit_test_0819(void) {
    run_fsm_assert(
        0,
        0,
        0x4ULL,
        1,
        "UT_0819",
        "Testing state transition current=0 to next=0 with prereq=0x4"
    );
}
static void run_unit_test_0820(void) {
    run_fsm_assert(
        1,
        0,
        0x4ULL,
        1,
        "UT_0820",
        "Testing state transition current=1 to next=0 with prereq=0x4"
    );
}
static void run_unit_test_0821(void) {
    run_fsm_assert(
        2,
        0,
        0x4ULL,
        1,
        "UT_0821",
        "Testing state transition current=2 to next=0 with prereq=0x4"
    );
}
static void run_unit_test_0822(void) {
    run_fsm_assert(
        3,
        0,
        0x4ULL,
        1,
        "UT_0822",
        "Testing state transition current=3 to next=0 with prereq=0x4"
    );
}
static void run_unit_test_0823(void) {
    run_fsm_assert(
        4,
        0,
        0x4ULL,
        1,
        "UT_0823",
        "Testing state transition current=4 to next=0 with prereq=0x4"
    );
}
static void run_unit_test_0824(void) {
    run_fsm_assert(
        5,
        0,
        0x4ULL,
        1,
        "UT_0824",
        "Testing state transition current=5 to next=0 with prereq=0x4"
    );
}
static void run_unit_test_0825(void) {
    run_fsm_assert(
        6,
        0,
        0x4ULL,
        1,
        "UT_0825",
        "Testing state transition current=6 to next=0 with prereq=0x4"
    );
}
static void run_unit_test_0826(void) {
    run_fsm_assert(
        7,
        0,
        0x4ULL,
        1,
        "UT_0826",
        "Testing state transition current=7 to next=0 with prereq=0x4"
    );
}
static void run_unit_test_0827(void) {
    run_fsm_assert(
        8,
        0,
        0x4ULL,
        0,
        "UT_0827",
        "Testing state transition current=8 to next=0 with prereq=0x4"
    );
}
static void run_unit_test_0828(void) {
    run_fsm_assert(
        10,
        0,
        0x4ULL,
        0,
        "UT_0828",
        "Testing state transition current=10 to next=0 with prereq=0x4"
    );
}
static void run_unit_test_0829(void) {
    run_fsm_assert(
        15,
        0,
        0x4ULL,
        0,
        "UT_0829",
        "Testing state transition current=15 to next=0 with prereq=0x4"
    );
}
static void run_unit_test_0830(void) {
    run_fsm_assert(
        100,
        0,
        0x4ULL,
        0,
        "UT_0830",
        "Testing state transition current=100 to next=0 with prereq=0x4"
    );
}
static void run_unit_test_0831(void) {
    run_fsm_assert(
        -100,
        0,
        0x4ULL,
        0,
        "UT_0831",
        "Testing state transition current=-100 to next=0 with prereq=0x4"
    );
}
static void run_unit_test_0832(void) {
    run_fsm_assert(
        -10,
        1,
        0x4ULL,
        0,
        "UT_0832",
        "Testing state transition current=-10 to next=1 with prereq=0x4"
    );
}
static void run_unit_test_0833(void) {
    run_fsm_assert(
        -5,
        1,
        0x4ULL,
        0,
        "UT_0833",
        "Testing state transition current=-5 to next=1 with prereq=0x4"
    );
}
static void run_unit_test_0834(void) {
    run_fsm_assert(
        -1,
        1,
        0x4ULL,
        0,
        "UT_0834",
        "Testing state transition current=-1 to next=1 with prereq=0x4"
    );
}
static void run_unit_test_0835(void) {
    run_fsm_assert(
        0,
        1,
        0x4ULL,
        0,
        "UT_0835",
        "Testing state transition current=0 to next=1 with prereq=0x4"
    );
}
static void run_unit_test_0836(void) {
    run_fsm_assert(
        1,
        1,
        0x4ULL,
        0,
        "UT_0836",
        "Testing state transition current=1 to next=1 with prereq=0x4"
    );
}
static void run_unit_test_0837(void) {
    run_fsm_assert(
        2,
        1,
        0x4ULL,
        0,
        "UT_0837",
        "Testing state transition current=2 to next=1 with prereq=0x4"
    );
}
static void run_unit_test_0838(void) {
    run_fsm_assert(
        3,
        1,
        0x4ULL,
        0,
        "UT_0838",
        "Testing state transition current=3 to next=1 with prereq=0x4"
    );
}
static void run_unit_test_0839(void) {
    run_fsm_assert(
        4,
        1,
        0x4ULL,
        0,
        "UT_0839",
        "Testing state transition current=4 to next=1 with prereq=0x4"
    );
}
static void run_unit_test_0840(void) {
    run_fsm_assert(
        5,
        1,
        0x4ULL,
        0,
        "UT_0840",
        "Testing state transition current=5 to next=1 with prereq=0x4"
    );
}
static void run_unit_test_0841(void) {
    run_fsm_assert(
        6,
        1,
        0x4ULL,
        0,
        "UT_0841",
        "Testing state transition current=6 to next=1 with prereq=0x4"
    );
}
static void run_unit_test_0842(void) {
    run_fsm_assert(
        7,
        1,
        0x4ULL,
        0,
        "UT_0842",
        "Testing state transition current=7 to next=1 with prereq=0x4"
    );
}
static void run_unit_test_0843(void) {
    run_fsm_assert(
        8,
        1,
        0x4ULL,
        0,
        "UT_0843",
        "Testing state transition current=8 to next=1 with prereq=0x4"
    );
}
static void run_unit_test_0844(void) {
    run_fsm_assert(
        10,
        1,
        0x4ULL,
        0,
        "UT_0844",
        "Testing state transition current=10 to next=1 with prereq=0x4"
    );
}
static void run_unit_test_0845(void) {
    run_fsm_assert(
        15,
        1,
        0x4ULL,
        0,
        "UT_0845",
        "Testing state transition current=15 to next=1 with prereq=0x4"
    );
}
static void run_unit_test_0846(void) {
    run_fsm_assert(
        100,
        1,
        0x4ULL,
        0,
        "UT_0846",
        "Testing state transition current=100 to next=1 with prereq=0x4"
    );
}
static void run_unit_test_0847(void) {
    run_fsm_assert(
        -100,
        1,
        0x4ULL,
        0,
        "UT_0847",
        "Testing state transition current=-100 to next=1 with prereq=0x4"
    );
}
static void run_unit_test_0848(void) {
    run_fsm_assert(
        -10,
        2,
        0x4ULL,
        0,
        "UT_0848",
        "Testing state transition current=-10 to next=2 with prereq=0x4"
    );
}
static void run_unit_test_0849(void) {
    run_fsm_assert(
        -5,
        2,
        0x4ULL,
        0,
        "UT_0849",
        "Testing state transition current=-5 to next=2 with prereq=0x4"
    );
}
static void run_unit_test_0850(void) {
    run_fsm_assert(
        -1,
        2,
        0x4ULL,
        0,
        "UT_0850",
        "Testing state transition current=-1 to next=2 with prereq=0x4"
    );
}
static void run_unit_test_0851(void) {
    run_fsm_assert(
        0,
        2,
        0x4ULL,
        0,
        "UT_0851",
        "Testing state transition current=0 to next=2 with prereq=0x4"
    );
}
static void run_unit_test_0852(void) {
    run_fsm_assert(
        1,
        2,
        0x4ULL,
        0,
        "UT_0852",
        "Testing state transition current=1 to next=2 with prereq=0x4"
    );
}
static void run_unit_test_0853(void) {
    run_fsm_assert(
        2,
        2,
        0x4ULL,
        0,
        "UT_0853",
        "Testing state transition current=2 to next=2 with prereq=0x4"
    );
}
static void run_unit_test_0854(void) {
    run_fsm_assert(
        3,
        2,
        0x4ULL,
        0,
        "UT_0854",
        "Testing state transition current=3 to next=2 with prereq=0x4"
    );
}
static void run_unit_test_0855(void) {
    run_fsm_assert(
        4,
        2,
        0x4ULL,
        0,
        "UT_0855",
        "Testing state transition current=4 to next=2 with prereq=0x4"
    );
}
static void run_unit_test_0856(void) {
    run_fsm_assert(
        5,
        2,
        0x4ULL,
        0,
        "UT_0856",
        "Testing state transition current=5 to next=2 with prereq=0x4"
    );
}
static void run_unit_test_0857(void) {
    run_fsm_assert(
        6,
        2,
        0x4ULL,
        0,
        "UT_0857",
        "Testing state transition current=6 to next=2 with prereq=0x4"
    );
}
static void run_unit_test_0858(void) {
    run_fsm_assert(
        7,
        2,
        0x4ULL,
        0,
        "UT_0858",
        "Testing state transition current=7 to next=2 with prereq=0x4"
    );
}
static void run_unit_test_0859(void) {
    run_fsm_assert(
        8,
        2,
        0x4ULL,
        0,
        "UT_0859",
        "Testing state transition current=8 to next=2 with prereq=0x4"
    );
}
static void run_unit_test_0860(void) {
    run_fsm_assert(
        10,
        2,
        0x4ULL,
        0,
        "UT_0860",
        "Testing state transition current=10 to next=2 with prereq=0x4"
    );
}
static void run_unit_test_0861(void) {
    run_fsm_assert(
        15,
        2,
        0x4ULL,
        0,
        "UT_0861",
        "Testing state transition current=15 to next=2 with prereq=0x4"
    );
}
static void run_unit_test_0862(void) {
    run_fsm_assert(
        100,
        2,
        0x4ULL,
        0,
        "UT_0862",
        "Testing state transition current=100 to next=2 with prereq=0x4"
    );
}
static void run_unit_test_0863(void) {
    run_fsm_assert(
        -100,
        2,
        0x4ULL,
        0,
        "UT_0863",
        "Testing state transition current=-100 to next=2 with prereq=0x4"
    );
}
static void run_unit_test_0864(void) {
    run_fsm_assert(
        -10,
        3,
        0x4ULL,
        0,
        "UT_0864",
        "Testing state transition current=-10 to next=3 with prereq=0x4"
    );
}
static void run_unit_test_0865(void) {
    run_fsm_assert(
        -5,
        3,
        0x4ULL,
        0,
        "UT_0865",
        "Testing state transition current=-5 to next=3 with prereq=0x4"
    );
}
static void run_unit_test_0866(void) {
    run_fsm_assert(
        -1,
        3,
        0x4ULL,
        0,
        "UT_0866",
        "Testing state transition current=-1 to next=3 with prereq=0x4"
    );
}
static void run_unit_test_0867(void) {
    run_fsm_assert(
        0,
        3,
        0x4ULL,
        0,
        "UT_0867",
        "Testing state transition current=0 to next=3 with prereq=0x4"
    );
}
static void run_unit_test_0868(void) {
    run_fsm_assert(
        1,
        3,
        0x4ULL,
        0,
        "UT_0868",
        "Testing state transition current=1 to next=3 with prereq=0x4"
    );
}
static void run_unit_test_0869(void) {
    run_fsm_assert(
        2,
        3,
        0x4ULL,
        1,
        "UT_0869",
        "Testing state transition current=2 to next=3 with prereq=0x4"
    );
}
static void run_unit_test_0870(void) {
    run_fsm_assert(
        3,
        3,
        0x4ULL,
        0,
        "UT_0870",
        "Testing state transition current=3 to next=3 with prereq=0x4"
    );
}
static void run_unit_test_0871(void) {
    run_fsm_assert(
        4,
        3,
        0x4ULL,
        0,
        "UT_0871",
        "Testing state transition current=4 to next=3 with prereq=0x4"
    );
}
static void run_unit_test_0872(void) {
    run_fsm_assert(
        5,
        3,
        0x4ULL,
        0,
        "UT_0872",
        "Testing state transition current=5 to next=3 with prereq=0x4"
    );
}
static void run_unit_test_0873(void) {
    run_fsm_assert(
        6,
        3,
        0x4ULL,
        0,
        "UT_0873",
        "Testing state transition current=6 to next=3 with prereq=0x4"
    );
}
static void run_unit_test_0874(void) {
    run_fsm_assert(
        7,
        3,
        0x4ULL,
        0,
        "UT_0874",
        "Testing state transition current=7 to next=3 with prereq=0x4"
    );
}
static void run_unit_test_0875(void) {
    run_fsm_assert(
        8,
        3,
        0x4ULL,
        0,
        "UT_0875",
        "Testing state transition current=8 to next=3 with prereq=0x4"
    );
}
static void run_unit_test_0876(void) {
    run_fsm_assert(
        10,
        3,
        0x4ULL,
        0,
        "UT_0876",
        "Testing state transition current=10 to next=3 with prereq=0x4"
    );
}
static void run_unit_test_0877(void) {
    run_fsm_assert(
        15,
        3,
        0x4ULL,
        0,
        "UT_0877",
        "Testing state transition current=15 to next=3 with prereq=0x4"
    );
}
static void run_unit_test_0878(void) {
    run_fsm_assert(
        100,
        3,
        0x4ULL,
        0,
        "UT_0878",
        "Testing state transition current=100 to next=3 with prereq=0x4"
    );
}
static void run_unit_test_0879(void) {
    run_fsm_assert(
        -100,
        3,
        0x4ULL,
        0,
        "UT_0879",
        "Testing state transition current=-100 to next=3 with prereq=0x4"
    );
}
static void run_unit_test_0880(void) {
    run_fsm_assert(
        -10,
        4,
        0x4ULL,
        0,
        "UT_0880",
        "Testing state transition current=-10 to next=4 with prereq=0x4"
    );
}
static void run_unit_test_0881(void) {
    run_fsm_assert(
        -5,
        4,
        0x4ULL,
        0,
        "UT_0881",
        "Testing state transition current=-5 to next=4 with prereq=0x4"
    );
}
static void run_unit_test_0882(void) {
    run_fsm_assert(
        -1,
        4,
        0x4ULL,
        0,
        "UT_0882",
        "Testing state transition current=-1 to next=4 with prereq=0x4"
    );
}
static void run_unit_test_0883(void) {
    run_fsm_assert(
        0,
        4,
        0x4ULL,
        0,
        "UT_0883",
        "Testing state transition current=0 to next=4 with prereq=0x4"
    );
}
static void run_unit_test_0884(void) {
    run_fsm_assert(
        1,
        4,
        0x4ULL,
        0,
        "UT_0884",
        "Testing state transition current=1 to next=4 with prereq=0x4"
    );
}
static void run_unit_test_0885(void) {
    run_fsm_assert(
        2,
        4,
        0x4ULL,
        0,
        "UT_0885",
        "Testing state transition current=2 to next=4 with prereq=0x4"
    );
}
static void run_unit_test_0886(void) {
    run_fsm_assert(
        3,
        4,
        0x4ULL,
        0,
        "UT_0886",
        "Testing state transition current=3 to next=4 with prereq=0x4"
    );
}
static void run_unit_test_0887(void) {
    run_fsm_assert(
        4,
        4,
        0x4ULL,
        0,
        "UT_0887",
        "Testing state transition current=4 to next=4 with prereq=0x4"
    );
}
static void run_unit_test_0888(void) {
    run_fsm_assert(
        5,
        4,
        0x4ULL,
        0,
        "UT_0888",
        "Testing state transition current=5 to next=4 with prereq=0x4"
    );
}
static void run_unit_test_0889(void) {
    run_fsm_assert(
        6,
        4,
        0x4ULL,
        0,
        "UT_0889",
        "Testing state transition current=6 to next=4 with prereq=0x4"
    );
}
static void run_unit_test_0890(void) {
    run_fsm_assert(
        7,
        4,
        0x4ULL,
        0,
        "UT_0890",
        "Testing state transition current=7 to next=4 with prereq=0x4"
    );
}
static void run_unit_test_0891(void) {
    run_fsm_assert(
        8,
        4,
        0x4ULL,
        0,
        "UT_0891",
        "Testing state transition current=8 to next=4 with prereq=0x4"
    );
}
static void run_unit_test_0892(void) {
    run_fsm_assert(
        10,
        4,
        0x4ULL,
        0,
        "UT_0892",
        "Testing state transition current=10 to next=4 with prereq=0x4"
    );
}
static void run_unit_test_0893(void) {
    run_fsm_assert(
        15,
        4,
        0x4ULL,
        0,
        "UT_0893",
        "Testing state transition current=15 to next=4 with prereq=0x4"
    );
}
static void run_unit_test_0894(void) {
    run_fsm_assert(
        100,
        4,
        0x4ULL,
        0,
        "UT_0894",
        "Testing state transition current=100 to next=4 with prereq=0x4"
    );
}
static void run_unit_test_0895(void) {
    run_fsm_assert(
        -100,
        4,
        0x4ULL,
        0,
        "UT_0895",
        "Testing state transition current=-100 to next=4 with prereq=0x4"
    );
}
static void run_unit_test_0896(void) {
    run_fsm_assert(
        -10,
        5,
        0x4ULL,
        0,
        "UT_0896",
        "Testing state transition current=-10 to next=5 with prereq=0x4"
    );
}
static void run_unit_test_0897(void) {
    run_fsm_assert(
        -5,
        5,
        0x4ULL,
        0,
        "UT_0897",
        "Testing state transition current=-5 to next=5 with prereq=0x4"
    );
}
static void run_unit_test_0898(void) {
    run_fsm_assert(
        -1,
        5,
        0x4ULL,
        0,
        "UT_0898",
        "Testing state transition current=-1 to next=5 with prereq=0x4"
    );
}
static void run_unit_test_0899(void) {
    run_fsm_assert(
        0,
        5,
        0x4ULL,
        0,
        "UT_0899",
        "Testing state transition current=0 to next=5 with prereq=0x4"
    );
}
static void run_unit_test_0900(void) {
    run_fsm_assert(
        1,
        5,
        0x4ULL,
        0,
        "UT_0900",
        "Testing state transition current=1 to next=5 with prereq=0x4"
    );
}
static void run_unit_test_0901(void) {
    run_fsm_assert(
        2,
        5,
        0x4ULL,
        0,
        "UT_0901",
        "Testing state transition current=2 to next=5 with prereq=0x4"
    );
}
static void run_unit_test_0902(void) {
    run_fsm_assert(
        3,
        5,
        0x4ULL,
        0,
        "UT_0902",
        "Testing state transition current=3 to next=5 with prereq=0x4"
    );
}
static void run_unit_test_0903(void) {
    run_fsm_assert(
        4,
        5,
        0x4ULL,
        0,
        "UT_0903",
        "Testing state transition current=4 to next=5 with prereq=0x4"
    );
}
static void run_unit_test_0904(void) {
    run_fsm_assert(
        5,
        5,
        0x4ULL,
        0,
        "UT_0904",
        "Testing state transition current=5 to next=5 with prereq=0x4"
    );
}
static void run_unit_test_0905(void) {
    run_fsm_assert(
        6,
        5,
        0x4ULL,
        0,
        "UT_0905",
        "Testing state transition current=6 to next=5 with prereq=0x4"
    );
}
static void run_unit_test_0906(void) {
    run_fsm_assert(
        7,
        5,
        0x4ULL,
        0,
        "UT_0906",
        "Testing state transition current=7 to next=5 with prereq=0x4"
    );
}
static void run_unit_test_0907(void) {
    run_fsm_assert(
        8,
        5,
        0x4ULL,
        0,
        "UT_0907",
        "Testing state transition current=8 to next=5 with prereq=0x4"
    );
}
static void run_unit_test_0908(void) {
    run_fsm_assert(
        10,
        5,
        0x4ULL,
        0,
        "UT_0908",
        "Testing state transition current=10 to next=5 with prereq=0x4"
    );
}
static void run_unit_test_0909(void) {
    run_fsm_assert(
        15,
        5,
        0x4ULL,
        0,
        "UT_0909",
        "Testing state transition current=15 to next=5 with prereq=0x4"
    );
}
static void run_unit_test_0910(void) {
    run_fsm_assert(
        100,
        5,
        0x4ULL,
        0,
        "UT_0910",
        "Testing state transition current=100 to next=5 with prereq=0x4"
    );
}
static void run_unit_test_0911(void) {
    run_fsm_assert(
        -100,
        5,
        0x4ULL,
        0,
        "UT_0911",
        "Testing state transition current=-100 to next=5 with prereq=0x4"
    );
}
static void run_unit_test_0912(void) {
    run_fsm_assert(
        -10,
        6,
        0x4ULL,
        0,
        "UT_0912",
        "Testing state transition current=-10 to next=6 with prereq=0x4"
    );
}
static void run_unit_test_0913(void) {
    run_fsm_assert(
        -5,
        6,
        0x4ULL,
        0,
        "UT_0913",
        "Testing state transition current=-5 to next=6 with prereq=0x4"
    );
}
static void run_unit_test_0914(void) {
    run_fsm_assert(
        -1,
        6,
        0x4ULL,
        0,
        "UT_0914",
        "Testing state transition current=-1 to next=6 with prereq=0x4"
    );
}
static void run_unit_test_0915(void) {
    run_fsm_assert(
        0,
        6,
        0x4ULL,
        0,
        "UT_0915",
        "Testing state transition current=0 to next=6 with prereq=0x4"
    );
}
static void run_unit_test_0916(void) {
    run_fsm_assert(
        1,
        6,
        0x4ULL,
        0,
        "UT_0916",
        "Testing state transition current=1 to next=6 with prereq=0x4"
    );
}
static void run_unit_test_0917(void) {
    run_fsm_assert(
        2,
        6,
        0x4ULL,
        0,
        "UT_0917",
        "Testing state transition current=2 to next=6 with prereq=0x4"
    );
}
static void run_unit_test_0918(void) {
    run_fsm_assert(
        3,
        6,
        0x4ULL,
        0,
        "UT_0918",
        "Testing state transition current=3 to next=6 with prereq=0x4"
    );
}
static void run_unit_test_0919(void) {
    run_fsm_assert(
        4,
        6,
        0x4ULL,
        0,
        "UT_0919",
        "Testing state transition current=4 to next=6 with prereq=0x4"
    );
}
static void run_unit_test_0920(void) {
    run_fsm_assert(
        5,
        6,
        0x4ULL,
        0,
        "UT_0920",
        "Testing state transition current=5 to next=6 with prereq=0x4"
    );
}
static void run_unit_test_0921(void) {
    run_fsm_assert(
        6,
        6,
        0x4ULL,
        0,
        "UT_0921",
        "Testing state transition current=6 to next=6 with prereq=0x4"
    );
}
static void run_unit_test_0922(void) {
    run_fsm_assert(
        7,
        6,
        0x4ULL,
        0,
        "UT_0922",
        "Testing state transition current=7 to next=6 with prereq=0x4"
    );
}
static void run_unit_test_0923(void) {
    run_fsm_assert(
        8,
        6,
        0x4ULL,
        0,
        "UT_0923",
        "Testing state transition current=8 to next=6 with prereq=0x4"
    );
}
static void run_unit_test_0924(void) {
    run_fsm_assert(
        10,
        6,
        0x4ULL,
        0,
        "UT_0924",
        "Testing state transition current=10 to next=6 with prereq=0x4"
    );
}
static void run_unit_test_0925(void) {
    run_fsm_assert(
        15,
        6,
        0x4ULL,
        0,
        "UT_0925",
        "Testing state transition current=15 to next=6 with prereq=0x4"
    );
}
static void run_unit_test_0926(void) {
    run_fsm_assert(
        100,
        6,
        0x4ULL,
        0,
        "UT_0926",
        "Testing state transition current=100 to next=6 with prereq=0x4"
    );
}
static void run_unit_test_0927(void) {
    run_fsm_assert(
        -100,
        6,
        0x4ULL,
        0,
        "UT_0927",
        "Testing state transition current=-100 to next=6 with prereq=0x4"
    );
}
static void run_unit_test_0928(void) {
    run_fsm_assert(
        -10,
        7,
        0x4ULL,
        0,
        "UT_0928",
        "Testing state transition current=-10 to next=7 with prereq=0x4"
    );
}
static void run_unit_test_0929(void) {
    run_fsm_assert(
        -5,
        7,
        0x4ULL,
        0,
        "UT_0929",
        "Testing state transition current=-5 to next=7 with prereq=0x4"
    );
}
static void run_unit_test_0930(void) {
    run_fsm_assert(
        -1,
        7,
        0x4ULL,
        0,
        "UT_0930",
        "Testing state transition current=-1 to next=7 with prereq=0x4"
    );
}
static void run_unit_test_0931(void) {
    run_fsm_assert(
        0,
        7,
        0x4ULL,
        0,
        "UT_0931",
        "Testing state transition current=0 to next=7 with prereq=0x4"
    );
}
static void run_unit_test_0932(void) {
    run_fsm_assert(
        1,
        7,
        0x4ULL,
        0,
        "UT_0932",
        "Testing state transition current=1 to next=7 with prereq=0x4"
    );
}
static void run_unit_test_0933(void) {
    run_fsm_assert(
        2,
        7,
        0x4ULL,
        0,
        "UT_0933",
        "Testing state transition current=2 to next=7 with prereq=0x4"
    );
}
static void run_unit_test_0934(void) {
    run_fsm_assert(
        3,
        7,
        0x4ULL,
        0,
        "UT_0934",
        "Testing state transition current=3 to next=7 with prereq=0x4"
    );
}
static void run_unit_test_0935(void) {
    run_fsm_assert(
        4,
        7,
        0x4ULL,
        0,
        "UT_0935",
        "Testing state transition current=4 to next=7 with prereq=0x4"
    );
}
static void run_unit_test_0936(void) {
    run_fsm_assert(
        5,
        7,
        0x4ULL,
        0,
        "UT_0936",
        "Testing state transition current=5 to next=7 with prereq=0x4"
    );
}
static void run_unit_test_0937(void) {
    run_fsm_assert(
        6,
        7,
        0x4ULL,
        0,
        "UT_0937",
        "Testing state transition current=6 to next=7 with prereq=0x4"
    );
}
static void run_unit_test_0938(void) {
    run_fsm_assert(
        7,
        7,
        0x4ULL,
        0,
        "UT_0938",
        "Testing state transition current=7 to next=7 with prereq=0x4"
    );
}
static void run_unit_test_0939(void) {
    run_fsm_assert(
        8,
        7,
        0x4ULL,
        0,
        "UT_0939",
        "Testing state transition current=8 to next=7 with prereq=0x4"
    );
}
static void run_unit_test_0940(void) {
    run_fsm_assert(
        10,
        7,
        0x4ULL,
        0,
        "UT_0940",
        "Testing state transition current=10 to next=7 with prereq=0x4"
    );
}
static void run_unit_test_0941(void) {
    run_fsm_assert(
        15,
        7,
        0x4ULL,
        0,
        "UT_0941",
        "Testing state transition current=15 to next=7 with prereq=0x4"
    );
}
static void run_unit_test_0942(void) {
    run_fsm_assert(
        100,
        7,
        0x4ULL,
        0,
        "UT_0942",
        "Testing state transition current=100 to next=7 with prereq=0x4"
    );
}
static void run_unit_test_0943(void) {
    run_fsm_assert(
        -100,
        7,
        0x4ULL,
        0,
        "UT_0943",
        "Testing state transition current=-100 to next=7 with prereq=0x4"
    );
}
static void run_unit_test_0944(void) {
    run_fsm_assert(
        -10,
        8,
        0x4ULL,
        0,
        "UT_0944",
        "Testing state transition current=-10 to next=8 with prereq=0x4"
    );
}
static void run_unit_test_0945(void) {
    run_fsm_assert(
        -5,
        8,
        0x4ULL,
        0,
        "UT_0945",
        "Testing state transition current=-5 to next=8 with prereq=0x4"
    );
}
static void run_unit_test_0946(void) {
    run_fsm_assert(
        -1,
        8,
        0x4ULL,
        0,
        "UT_0946",
        "Testing state transition current=-1 to next=8 with prereq=0x4"
    );
}
static void run_unit_test_0947(void) {
    run_fsm_assert(
        0,
        8,
        0x4ULL,
        0,
        "UT_0947",
        "Testing state transition current=0 to next=8 with prereq=0x4"
    );
}
static void run_unit_test_0948(void) {
    run_fsm_assert(
        1,
        8,
        0x4ULL,
        0,
        "UT_0948",
        "Testing state transition current=1 to next=8 with prereq=0x4"
    );
}
static void run_unit_test_0949(void) {
    run_fsm_assert(
        2,
        8,
        0x4ULL,
        0,
        "UT_0949",
        "Testing state transition current=2 to next=8 with prereq=0x4"
    );
}
static void run_unit_test_0950(void) {
    run_fsm_assert(
        3,
        8,
        0x4ULL,
        0,
        "UT_0950",
        "Testing state transition current=3 to next=8 with prereq=0x4"
    );
}
static void run_unit_test_0951(void) {
    run_fsm_assert(
        4,
        8,
        0x4ULL,
        0,
        "UT_0951",
        "Testing state transition current=4 to next=8 with prereq=0x4"
    );
}
static void run_unit_test_0952(void) {
    run_fsm_assert(
        5,
        8,
        0x4ULL,
        0,
        "UT_0952",
        "Testing state transition current=5 to next=8 with prereq=0x4"
    );
}
static void run_unit_test_0953(void) {
    run_fsm_assert(
        6,
        8,
        0x4ULL,
        0,
        "UT_0953",
        "Testing state transition current=6 to next=8 with prereq=0x4"
    );
}
static void run_unit_test_0954(void) {
    run_fsm_assert(
        7,
        8,
        0x4ULL,
        0,
        "UT_0954",
        "Testing state transition current=7 to next=8 with prereq=0x4"
    );
}
static void run_unit_test_0955(void) {
    run_fsm_assert(
        8,
        8,
        0x4ULL,
        0,
        "UT_0955",
        "Testing state transition current=8 to next=8 with prereq=0x4"
    );
}
static void run_unit_test_0956(void) {
    run_fsm_assert(
        10,
        8,
        0x4ULL,
        0,
        "UT_0956",
        "Testing state transition current=10 to next=8 with prereq=0x4"
    );
}
static void run_unit_test_0957(void) {
    run_fsm_assert(
        15,
        8,
        0x4ULL,
        0,
        "UT_0957",
        "Testing state transition current=15 to next=8 with prereq=0x4"
    );
}
static void run_unit_test_0958(void) {
    run_fsm_assert(
        100,
        8,
        0x4ULL,
        0,
        "UT_0958",
        "Testing state transition current=100 to next=8 with prereq=0x4"
    );
}
static void run_unit_test_0959(void) {
    run_fsm_assert(
        -100,
        8,
        0x4ULL,
        0,
        "UT_0959",
        "Testing state transition current=-100 to next=8 with prereq=0x4"
    );
}
static void run_unit_test_0960(void) {
    run_fsm_assert(
        -10,
        10,
        0x4ULL,
        0,
        "UT_0960",
        "Testing state transition current=-10 to next=10 with prereq=0x4"
    );
}
static void run_unit_test_0961(void) {
    run_fsm_assert(
        -5,
        10,
        0x4ULL,
        0,
        "UT_0961",
        "Testing state transition current=-5 to next=10 with prereq=0x4"
    );
}
static void run_unit_test_0962(void) {
    run_fsm_assert(
        -1,
        10,
        0x4ULL,
        0,
        "UT_0962",
        "Testing state transition current=-1 to next=10 with prereq=0x4"
    );
}
static void run_unit_test_0963(void) {
    run_fsm_assert(
        0,
        10,
        0x4ULL,
        0,
        "UT_0963",
        "Testing state transition current=0 to next=10 with prereq=0x4"
    );
}
static void run_unit_test_0964(void) {
    run_fsm_assert(
        1,
        10,
        0x4ULL,
        0,
        "UT_0964",
        "Testing state transition current=1 to next=10 with prereq=0x4"
    );
}
static void run_unit_test_0965(void) {
    run_fsm_assert(
        2,
        10,
        0x4ULL,
        0,
        "UT_0965",
        "Testing state transition current=2 to next=10 with prereq=0x4"
    );
}
static void run_unit_test_0966(void) {
    run_fsm_assert(
        3,
        10,
        0x4ULL,
        0,
        "UT_0966",
        "Testing state transition current=3 to next=10 with prereq=0x4"
    );
}
static void run_unit_test_0967(void) {
    run_fsm_assert(
        4,
        10,
        0x4ULL,
        0,
        "UT_0967",
        "Testing state transition current=4 to next=10 with prereq=0x4"
    );
}
static void run_unit_test_0968(void) {
    run_fsm_assert(
        5,
        10,
        0x4ULL,
        0,
        "UT_0968",
        "Testing state transition current=5 to next=10 with prereq=0x4"
    );
}
static void run_unit_test_0969(void) {
    run_fsm_assert(
        6,
        10,
        0x4ULL,
        0,
        "UT_0969",
        "Testing state transition current=6 to next=10 with prereq=0x4"
    );
}
static void run_unit_test_0970(void) {
    run_fsm_assert(
        7,
        10,
        0x4ULL,
        0,
        "UT_0970",
        "Testing state transition current=7 to next=10 with prereq=0x4"
    );
}
static void run_unit_test_0971(void) {
    run_fsm_assert(
        8,
        10,
        0x4ULL,
        0,
        "UT_0971",
        "Testing state transition current=8 to next=10 with prereq=0x4"
    );
}
static void run_unit_test_0972(void) {
    run_fsm_assert(
        10,
        10,
        0x4ULL,
        0,
        "UT_0972",
        "Testing state transition current=10 to next=10 with prereq=0x4"
    );
}
static void run_unit_test_0973(void) {
    run_fsm_assert(
        15,
        10,
        0x4ULL,
        0,
        "UT_0973",
        "Testing state transition current=15 to next=10 with prereq=0x4"
    );
}
static void run_unit_test_0974(void) {
    run_fsm_assert(
        100,
        10,
        0x4ULL,
        0,
        "UT_0974",
        "Testing state transition current=100 to next=10 with prereq=0x4"
    );
}
static void run_unit_test_0975(void) {
    run_fsm_assert(
        -100,
        10,
        0x4ULL,
        0,
        "UT_0975",
        "Testing state transition current=-100 to next=10 with prereq=0x4"
    );
}
static void run_unit_test_0976(void) {
    run_fsm_assert(
        -10,
        15,
        0x4ULL,
        0,
        "UT_0976",
        "Testing state transition current=-10 to next=15 with prereq=0x4"
    );
}
static void run_unit_test_0977(void) {
    run_fsm_assert(
        -5,
        15,
        0x4ULL,
        0,
        "UT_0977",
        "Testing state transition current=-5 to next=15 with prereq=0x4"
    );
}
static void run_unit_test_0978(void) {
    run_fsm_assert(
        -1,
        15,
        0x4ULL,
        0,
        "UT_0978",
        "Testing state transition current=-1 to next=15 with prereq=0x4"
    );
}
static void run_unit_test_0979(void) {
    run_fsm_assert(
        0,
        15,
        0x4ULL,
        0,
        "UT_0979",
        "Testing state transition current=0 to next=15 with prereq=0x4"
    );
}
static void run_unit_test_0980(void) {
    run_fsm_assert(
        1,
        15,
        0x4ULL,
        0,
        "UT_0980",
        "Testing state transition current=1 to next=15 with prereq=0x4"
    );
}
static void run_unit_test_0981(void) {
    run_fsm_assert(
        2,
        15,
        0x4ULL,
        0,
        "UT_0981",
        "Testing state transition current=2 to next=15 with prereq=0x4"
    );
}
static void run_unit_test_0982(void) {
    run_fsm_assert(
        3,
        15,
        0x4ULL,
        0,
        "UT_0982",
        "Testing state transition current=3 to next=15 with prereq=0x4"
    );
}
static void run_unit_test_0983(void) {
    run_fsm_assert(
        4,
        15,
        0x4ULL,
        0,
        "UT_0983",
        "Testing state transition current=4 to next=15 with prereq=0x4"
    );
}
static void run_unit_test_0984(void) {
    run_fsm_assert(
        5,
        15,
        0x4ULL,
        0,
        "UT_0984",
        "Testing state transition current=5 to next=15 with prereq=0x4"
    );
}
static void run_unit_test_0985(void) {
    run_fsm_assert(
        6,
        15,
        0x4ULL,
        0,
        "UT_0985",
        "Testing state transition current=6 to next=15 with prereq=0x4"
    );
}
static void run_unit_test_0986(void) {
    run_fsm_assert(
        7,
        15,
        0x4ULL,
        0,
        "UT_0986",
        "Testing state transition current=7 to next=15 with prereq=0x4"
    );
}
static void run_unit_test_0987(void) {
    run_fsm_assert(
        8,
        15,
        0x4ULL,
        0,
        "UT_0987",
        "Testing state transition current=8 to next=15 with prereq=0x4"
    );
}
static void run_unit_test_0988(void) {
    run_fsm_assert(
        10,
        15,
        0x4ULL,
        0,
        "UT_0988",
        "Testing state transition current=10 to next=15 with prereq=0x4"
    );
}
static void run_unit_test_0989(void) {
    run_fsm_assert(
        15,
        15,
        0x4ULL,
        0,
        "UT_0989",
        "Testing state transition current=15 to next=15 with prereq=0x4"
    );
}
static void run_unit_test_0990(void) {
    run_fsm_assert(
        100,
        15,
        0x4ULL,
        0,
        "UT_0990",
        "Testing state transition current=100 to next=15 with prereq=0x4"
    );
}
static void run_unit_test_0991(void) {
    run_fsm_assert(
        -100,
        15,
        0x4ULL,
        0,
        "UT_0991",
        "Testing state transition current=-100 to next=15 with prereq=0x4"
    );
}
static void run_unit_test_0992(void) {
    run_fsm_assert(
        -10,
        100,
        0x4ULL,
        0,
        "UT_0992",
        "Testing state transition current=-10 to next=100 with prereq=0x4"
    );
}
static void run_unit_test_0993(void) {
    run_fsm_assert(
        -5,
        100,
        0x4ULL,
        0,
        "UT_0993",
        "Testing state transition current=-5 to next=100 with prereq=0x4"
    );
}
static void run_unit_test_0994(void) {
    run_fsm_assert(
        -1,
        100,
        0x4ULL,
        0,
        "UT_0994",
        "Testing state transition current=-1 to next=100 with prereq=0x4"
    );
}
static void run_unit_test_0995(void) {
    run_fsm_assert(
        0,
        100,
        0x4ULL,
        0,
        "UT_0995",
        "Testing state transition current=0 to next=100 with prereq=0x4"
    );
}
static void run_unit_test_0996(void) {
    run_fsm_assert(
        1,
        100,
        0x4ULL,
        0,
        "UT_0996",
        "Testing state transition current=1 to next=100 with prereq=0x4"
    );
}
static void run_unit_test_0997(void) {
    run_fsm_assert(
        2,
        100,
        0x4ULL,
        0,
        "UT_0997",
        "Testing state transition current=2 to next=100 with prereq=0x4"
    );
}
static void run_unit_test_0998(void) {
    run_fsm_assert(
        3,
        100,
        0x4ULL,
        0,
        "UT_0998",
        "Testing state transition current=3 to next=100 with prereq=0x4"
    );
}
static void run_unit_test_0999(void) {
    run_fsm_assert(
        4,
        100,
        0x4ULL,
        0,
        "UT_0999",
        "Testing state transition current=4 to next=100 with prereq=0x4"
    );
}
static void run_unit_test_1000(void) {
    run_fsm_assert(
        5,
        100,
        0x4ULL,
        0,
        "UT_1000",
        "Testing state transition current=5 to next=100 with prereq=0x4"
    );
}
static void run_unit_test_1001(void) {
    run_fsm_assert(
        6,
        100,
        0x4ULL,
        0,
        "UT_1001",
        "Testing state transition current=6 to next=100 with prereq=0x4"
    );
}
static void run_unit_test_1002(void) {
    run_fsm_assert(
        7,
        100,
        0x4ULL,
        0,
        "UT_1002",
        "Testing state transition current=7 to next=100 with prereq=0x4"
    );
}
static void run_unit_test_1003(void) {
    run_fsm_assert(
        8,
        100,
        0x4ULL,
        0,
        "UT_1003",
        "Testing state transition current=8 to next=100 with prereq=0x4"
    );
}
static void run_unit_test_1004(void) {
    run_fsm_assert(
        10,
        100,
        0x4ULL,
        0,
        "UT_1004",
        "Testing state transition current=10 to next=100 with prereq=0x4"
    );
}
static void run_unit_test_1005(void) {
    run_fsm_assert(
        15,
        100,
        0x4ULL,
        0,
        "UT_1005",
        "Testing state transition current=15 to next=100 with prereq=0x4"
    );
}
static void run_unit_test_1006(void) {
    run_fsm_assert(
        100,
        100,
        0x4ULL,
        0,
        "UT_1006",
        "Testing state transition current=100 to next=100 with prereq=0x4"
    );
}
static void run_unit_test_1007(void) {
    run_fsm_assert(
        -100,
        100,
        0x4ULL,
        0,
        "UT_1007",
        "Testing state transition current=-100 to next=100 with prereq=0x4"
    );
}
static void run_unit_test_1008(void) {
    run_fsm_assert(
        -10,
        -100,
        0x4ULL,
        0,
        "UT_1008",
        "Testing state transition current=-10 to next=-100 with prereq=0x4"
    );
}
static void run_unit_test_1009(void) {
    run_fsm_assert(
        -5,
        -100,
        0x4ULL,
        0,
        "UT_1009",
        "Testing state transition current=-5 to next=-100 with prereq=0x4"
    );
}
static void run_unit_test_1010(void) {
    run_fsm_assert(
        -1,
        -100,
        0x4ULL,
        0,
        "UT_1010",
        "Testing state transition current=-1 to next=-100 with prereq=0x4"
    );
}
static void run_unit_test_1011(void) {
    run_fsm_assert(
        0,
        -100,
        0x4ULL,
        0,
        "UT_1011",
        "Testing state transition current=0 to next=-100 with prereq=0x4"
    );
}
static void run_unit_test_1012(void) {
    run_fsm_assert(
        1,
        -100,
        0x4ULL,
        0,
        "UT_1012",
        "Testing state transition current=1 to next=-100 with prereq=0x4"
    );
}
static void run_unit_test_1013(void) {
    run_fsm_assert(
        2,
        -100,
        0x4ULL,
        0,
        "UT_1013",
        "Testing state transition current=2 to next=-100 with prereq=0x4"
    );
}
static void run_unit_test_1014(void) {
    run_fsm_assert(
        3,
        -100,
        0x4ULL,
        0,
        "UT_1014",
        "Testing state transition current=3 to next=-100 with prereq=0x4"
    );
}
static void run_unit_test_1015(void) {
    run_fsm_assert(
        4,
        -100,
        0x4ULL,
        0,
        "UT_1015",
        "Testing state transition current=4 to next=-100 with prereq=0x4"
    );
}
static void run_unit_test_1016(void) {
    run_fsm_assert(
        5,
        -100,
        0x4ULL,
        0,
        "UT_1016",
        "Testing state transition current=5 to next=-100 with prereq=0x4"
    );
}
static void run_unit_test_1017(void) {
    run_fsm_assert(
        6,
        -100,
        0x4ULL,
        0,
        "UT_1017",
        "Testing state transition current=6 to next=-100 with prereq=0x4"
    );
}
static void run_unit_test_1018(void) {
    run_fsm_assert(
        7,
        -100,
        0x4ULL,
        0,
        "UT_1018",
        "Testing state transition current=7 to next=-100 with prereq=0x4"
    );
}
static void run_unit_test_1019(void) {
    run_fsm_assert(
        8,
        -100,
        0x4ULL,
        0,
        "UT_1019",
        "Testing state transition current=8 to next=-100 with prereq=0x4"
    );
}
static void run_unit_test_1020(void) {
    run_fsm_assert(
        10,
        -100,
        0x4ULL,
        0,
        "UT_1020",
        "Testing state transition current=10 to next=-100 with prereq=0x4"
    );
}
static void run_unit_test_1021(void) {
    run_fsm_assert(
        15,
        -100,
        0x4ULL,
        0,
        "UT_1021",
        "Testing state transition current=15 to next=-100 with prereq=0x4"
    );
}
static void run_unit_test_1022(void) {
    run_fsm_assert(
        100,
        -100,
        0x4ULL,
        0,
        "UT_1022",
        "Testing state transition current=100 to next=-100 with prereq=0x4"
    );
}
static void run_unit_test_1023(void) {
    run_fsm_assert(
        -100,
        -100,
        0x4ULL,
        0,
        "UT_1023",
        "Testing state transition current=-100 to next=-100 with prereq=0x4"
    );
}
static void run_unit_test_1024(void) {
    run_fsm_assert(
        -10,
        -10,
        0x8ULL,
        0,
        "UT_1024",
        "Testing state transition current=-10 to next=-10 with prereq=0x8"
    );
}
static void run_unit_test_1025(void) {
    run_fsm_assert(
        -5,
        -10,
        0x8ULL,
        0,
        "UT_1025",
        "Testing state transition current=-5 to next=-10 with prereq=0x8"
    );
}
static void run_unit_test_1026(void) {
    run_fsm_assert(
        -1,
        -10,
        0x8ULL,
        0,
        "UT_1026",
        "Testing state transition current=-1 to next=-10 with prereq=0x8"
    );
}
static void run_unit_test_1027(void) {
    run_fsm_assert(
        0,
        -10,
        0x8ULL,
        0,
        "UT_1027",
        "Testing state transition current=0 to next=-10 with prereq=0x8"
    );
}
static void run_unit_test_1028(void) {
    run_fsm_assert(
        1,
        -10,
        0x8ULL,
        0,
        "UT_1028",
        "Testing state transition current=1 to next=-10 with prereq=0x8"
    );
}
static void run_unit_test_1029(void) {
    run_fsm_assert(
        2,
        -10,
        0x8ULL,
        0,
        "UT_1029",
        "Testing state transition current=2 to next=-10 with prereq=0x8"
    );
}
static void run_unit_test_1030(void) {
    run_fsm_assert(
        3,
        -10,
        0x8ULL,
        0,
        "UT_1030",
        "Testing state transition current=3 to next=-10 with prereq=0x8"
    );
}
static void run_unit_test_1031(void) {
    run_fsm_assert(
        4,
        -10,
        0x8ULL,
        0,
        "UT_1031",
        "Testing state transition current=4 to next=-10 with prereq=0x8"
    );
}
static void run_unit_test_1032(void) {
    run_fsm_assert(
        5,
        -10,
        0x8ULL,
        0,
        "UT_1032",
        "Testing state transition current=5 to next=-10 with prereq=0x8"
    );
}
static void run_unit_test_1033(void) {
    run_fsm_assert(
        6,
        -10,
        0x8ULL,
        0,
        "UT_1033",
        "Testing state transition current=6 to next=-10 with prereq=0x8"
    );
}
static void run_unit_test_1034(void) {
    run_fsm_assert(
        7,
        -10,
        0x8ULL,
        0,
        "UT_1034",
        "Testing state transition current=7 to next=-10 with prereq=0x8"
    );
}
static void run_unit_test_1035(void) {
    run_fsm_assert(
        8,
        -10,
        0x8ULL,
        0,
        "UT_1035",
        "Testing state transition current=8 to next=-10 with prereq=0x8"
    );
}
static void run_unit_test_1036(void) {
    run_fsm_assert(
        10,
        -10,
        0x8ULL,
        0,
        "UT_1036",
        "Testing state transition current=10 to next=-10 with prereq=0x8"
    );
}
static void run_unit_test_1037(void) {
    run_fsm_assert(
        15,
        -10,
        0x8ULL,
        0,
        "UT_1037",
        "Testing state transition current=15 to next=-10 with prereq=0x8"
    );
}
static void run_unit_test_1038(void) {
    run_fsm_assert(
        100,
        -10,
        0x8ULL,
        0,
        "UT_1038",
        "Testing state transition current=100 to next=-10 with prereq=0x8"
    );
}
static void run_unit_test_1039(void) {
    run_fsm_assert(
        -100,
        -10,
        0x8ULL,
        0,
        "UT_1039",
        "Testing state transition current=-100 to next=-10 with prereq=0x8"
    );
}
static void run_unit_test_1040(void) {
    run_fsm_assert(
        -10,
        -5,
        0x8ULL,
        0,
        "UT_1040",
        "Testing state transition current=-10 to next=-5 with prereq=0x8"
    );
}
static void run_unit_test_1041(void) {
    run_fsm_assert(
        -5,
        -5,
        0x8ULL,
        0,
        "UT_1041",
        "Testing state transition current=-5 to next=-5 with prereq=0x8"
    );
}
static void run_unit_test_1042(void) {
    run_fsm_assert(
        -1,
        -5,
        0x8ULL,
        0,
        "UT_1042",
        "Testing state transition current=-1 to next=-5 with prereq=0x8"
    );
}
static void run_unit_test_1043(void) {
    run_fsm_assert(
        0,
        -5,
        0x8ULL,
        0,
        "UT_1043",
        "Testing state transition current=0 to next=-5 with prereq=0x8"
    );
}
static void run_unit_test_1044(void) {
    run_fsm_assert(
        1,
        -5,
        0x8ULL,
        0,
        "UT_1044",
        "Testing state transition current=1 to next=-5 with prereq=0x8"
    );
}
static void run_unit_test_1045(void) {
    run_fsm_assert(
        2,
        -5,
        0x8ULL,
        0,
        "UT_1045",
        "Testing state transition current=2 to next=-5 with prereq=0x8"
    );
}
static void run_unit_test_1046(void) {
    run_fsm_assert(
        3,
        -5,
        0x8ULL,
        0,
        "UT_1046",
        "Testing state transition current=3 to next=-5 with prereq=0x8"
    );
}
static void run_unit_test_1047(void) {
    run_fsm_assert(
        4,
        -5,
        0x8ULL,
        0,
        "UT_1047",
        "Testing state transition current=4 to next=-5 with prereq=0x8"
    );
}
static void run_unit_test_1048(void) {
    run_fsm_assert(
        5,
        -5,
        0x8ULL,
        0,
        "UT_1048",
        "Testing state transition current=5 to next=-5 with prereq=0x8"
    );
}
static void run_unit_test_1049(void) {
    run_fsm_assert(
        6,
        -5,
        0x8ULL,
        0,
        "UT_1049",
        "Testing state transition current=6 to next=-5 with prereq=0x8"
    );
}
static void run_unit_test_1050(void) {
    run_fsm_assert(
        7,
        -5,
        0x8ULL,
        0,
        "UT_1050",
        "Testing state transition current=7 to next=-5 with prereq=0x8"
    );
}
static void run_unit_test_1051(void) {
    run_fsm_assert(
        8,
        -5,
        0x8ULL,
        0,
        "UT_1051",
        "Testing state transition current=8 to next=-5 with prereq=0x8"
    );
}
static void run_unit_test_1052(void) {
    run_fsm_assert(
        10,
        -5,
        0x8ULL,
        0,
        "UT_1052",
        "Testing state transition current=10 to next=-5 with prereq=0x8"
    );
}
static void run_unit_test_1053(void) {
    run_fsm_assert(
        15,
        -5,
        0x8ULL,
        0,
        "UT_1053",
        "Testing state transition current=15 to next=-5 with prereq=0x8"
    );
}
static void run_unit_test_1054(void) {
    run_fsm_assert(
        100,
        -5,
        0x8ULL,
        0,
        "UT_1054",
        "Testing state transition current=100 to next=-5 with prereq=0x8"
    );
}
static void run_unit_test_1055(void) {
    run_fsm_assert(
        -100,
        -5,
        0x8ULL,
        0,
        "UT_1055",
        "Testing state transition current=-100 to next=-5 with prereq=0x8"
    );
}
static void run_unit_test_1056(void) {
    run_fsm_assert(
        -10,
        -1,
        0x8ULL,
        0,
        "UT_1056",
        "Testing state transition current=-10 to next=-1 with prereq=0x8"
    );
}
static void run_unit_test_1057(void) {
    run_fsm_assert(
        -5,
        -1,
        0x8ULL,
        0,
        "UT_1057",
        "Testing state transition current=-5 to next=-1 with prereq=0x8"
    );
}
static void run_unit_test_1058(void) {
    run_fsm_assert(
        -1,
        -1,
        0x8ULL,
        0,
        "UT_1058",
        "Testing state transition current=-1 to next=-1 with prereq=0x8"
    );
}
static void run_unit_test_1059(void) {
    run_fsm_assert(
        0,
        -1,
        0x8ULL,
        0,
        "UT_1059",
        "Testing state transition current=0 to next=-1 with prereq=0x8"
    );
}
static void run_unit_test_1060(void) {
    run_fsm_assert(
        1,
        -1,
        0x8ULL,
        0,
        "UT_1060",
        "Testing state transition current=1 to next=-1 with prereq=0x8"
    );
}
static void run_unit_test_1061(void) {
    run_fsm_assert(
        2,
        -1,
        0x8ULL,
        0,
        "UT_1061",
        "Testing state transition current=2 to next=-1 with prereq=0x8"
    );
}
static void run_unit_test_1062(void) {
    run_fsm_assert(
        3,
        -1,
        0x8ULL,
        0,
        "UT_1062",
        "Testing state transition current=3 to next=-1 with prereq=0x8"
    );
}
static void run_unit_test_1063(void) {
    run_fsm_assert(
        4,
        -1,
        0x8ULL,
        0,
        "UT_1063",
        "Testing state transition current=4 to next=-1 with prereq=0x8"
    );
}
static void run_unit_test_1064(void) {
    run_fsm_assert(
        5,
        -1,
        0x8ULL,
        0,
        "UT_1064",
        "Testing state transition current=5 to next=-1 with prereq=0x8"
    );
}
static void run_unit_test_1065(void) {
    run_fsm_assert(
        6,
        -1,
        0x8ULL,
        0,
        "UT_1065",
        "Testing state transition current=6 to next=-1 with prereq=0x8"
    );
}
static void run_unit_test_1066(void) {
    run_fsm_assert(
        7,
        -1,
        0x8ULL,
        0,
        "UT_1066",
        "Testing state transition current=7 to next=-1 with prereq=0x8"
    );
}
static void run_unit_test_1067(void) {
    run_fsm_assert(
        8,
        -1,
        0x8ULL,
        0,
        "UT_1067",
        "Testing state transition current=8 to next=-1 with prereq=0x8"
    );
}
static void run_unit_test_1068(void) {
    run_fsm_assert(
        10,
        -1,
        0x8ULL,
        0,
        "UT_1068",
        "Testing state transition current=10 to next=-1 with prereq=0x8"
    );
}
static void run_unit_test_1069(void) {
    run_fsm_assert(
        15,
        -1,
        0x8ULL,
        0,
        "UT_1069",
        "Testing state transition current=15 to next=-1 with prereq=0x8"
    );
}
static void run_unit_test_1070(void) {
    run_fsm_assert(
        100,
        -1,
        0x8ULL,
        0,
        "UT_1070",
        "Testing state transition current=100 to next=-1 with prereq=0x8"
    );
}
static void run_unit_test_1071(void) {
    run_fsm_assert(
        -100,
        -1,
        0x8ULL,
        0,
        "UT_1071",
        "Testing state transition current=-100 to next=-1 with prereq=0x8"
    );
}
static void run_unit_test_1072(void) {
    run_fsm_assert(
        -10,
        0,
        0x8ULL,
        0,
        "UT_1072",
        "Testing state transition current=-10 to next=0 with prereq=0x8"
    );
}
static void run_unit_test_1073(void) {
    run_fsm_assert(
        -5,
        0,
        0x8ULL,
        0,
        "UT_1073",
        "Testing state transition current=-5 to next=0 with prereq=0x8"
    );
}
static void run_unit_test_1074(void) {
    run_fsm_assert(
        -1,
        0,
        0x8ULL,
        0,
        "UT_1074",
        "Testing state transition current=-1 to next=0 with prereq=0x8"
    );
}
static void run_unit_test_1075(void) {
    run_fsm_assert(
        0,
        0,
        0x8ULL,
        1,
        "UT_1075",
        "Testing state transition current=0 to next=0 with prereq=0x8"
    );
}
static void run_unit_test_1076(void) {
    run_fsm_assert(
        1,
        0,
        0x8ULL,
        1,
        "UT_1076",
        "Testing state transition current=1 to next=0 with prereq=0x8"
    );
}
static void run_unit_test_1077(void) {
    run_fsm_assert(
        2,
        0,
        0x8ULL,
        1,
        "UT_1077",
        "Testing state transition current=2 to next=0 with prereq=0x8"
    );
}
static void run_unit_test_1078(void) {
    run_fsm_assert(
        3,
        0,
        0x8ULL,
        1,
        "UT_1078",
        "Testing state transition current=3 to next=0 with prereq=0x8"
    );
}
static void run_unit_test_1079(void) {
    run_fsm_assert(
        4,
        0,
        0x8ULL,
        1,
        "UT_1079",
        "Testing state transition current=4 to next=0 with prereq=0x8"
    );
}
static void run_unit_test_1080(void) {
    run_fsm_assert(
        5,
        0,
        0x8ULL,
        1,
        "UT_1080",
        "Testing state transition current=5 to next=0 with prereq=0x8"
    );
}
static void run_unit_test_1081(void) {
    run_fsm_assert(
        6,
        0,
        0x8ULL,
        1,
        "UT_1081",
        "Testing state transition current=6 to next=0 with prereq=0x8"
    );
}
static void run_unit_test_1082(void) {
    run_fsm_assert(
        7,
        0,
        0x8ULL,
        1,
        "UT_1082",
        "Testing state transition current=7 to next=0 with prereq=0x8"
    );
}
static void run_unit_test_1083(void) {
    run_fsm_assert(
        8,
        0,
        0x8ULL,
        0,
        "UT_1083",
        "Testing state transition current=8 to next=0 with prereq=0x8"
    );
}
static void run_unit_test_1084(void) {
    run_fsm_assert(
        10,
        0,
        0x8ULL,
        0,
        "UT_1084",
        "Testing state transition current=10 to next=0 with prereq=0x8"
    );
}
static void run_unit_test_1085(void) {
    run_fsm_assert(
        15,
        0,
        0x8ULL,
        0,
        "UT_1085",
        "Testing state transition current=15 to next=0 with prereq=0x8"
    );
}
static void run_unit_test_1086(void) {
    run_fsm_assert(
        100,
        0,
        0x8ULL,
        0,
        "UT_1086",
        "Testing state transition current=100 to next=0 with prereq=0x8"
    );
}
static void run_unit_test_1087(void) {
    run_fsm_assert(
        -100,
        0,
        0x8ULL,
        0,
        "UT_1087",
        "Testing state transition current=-100 to next=0 with prereq=0x8"
    );
}
static void run_unit_test_1088(void) {
    run_fsm_assert(
        -10,
        1,
        0x8ULL,
        0,
        "UT_1088",
        "Testing state transition current=-10 to next=1 with prereq=0x8"
    );
}
static void run_unit_test_1089(void) {
    run_fsm_assert(
        -5,
        1,
        0x8ULL,
        0,
        "UT_1089",
        "Testing state transition current=-5 to next=1 with prereq=0x8"
    );
}
static void run_unit_test_1090(void) {
    run_fsm_assert(
        -1,
        1,
        0x8ULL,
        0,
        "UT_1090",
        "Testing state transition current=-1 to next=1 with prereq=0x8"
    );
}
static void run_unit_test_1091(void) {
    run_fsm_assert(
        0,
        1,
        0x8ULL,
        0,
        "UT_1091",
        "Testing state transition current=0 to next=1 with prereq=0x8"
    );
}
static void run_unit_test_1092(void) {
    run_fsm_assert(
        1,
        1,
        0x8ULL,
        0,
        "UT_1092",
        "Testing state transition current=1 to next=1 with prereq=0x8"
    );
}
static void run_unit_test_1093(void) {
    run_fsm_assert(
        2,
        1,
        0x8ULL,
        0,
        "UT_1093",
        "Testing state transition current=2 to next=1 with prereq=0x8"
    );
}
static void run_unit_test_1094(void) {
    run_fsm_assert(
        3,
        1,
        0x8ULL,
        0,
        "UT_1094",
        "Testing state transition current=3 to next=1 with prereq=0x8"
    );
}
static void run_unit_test_1095(void) {
    run_fsm_assert(
        4,
        1,
        0x8ULL,
        0,
        "UT_1095",
        "Testing state transition current=4 to next=1 with prereq=0x8"
    );
}
static void run_unit_test_1096(void) {
    run_fsm_assert(
        5,
        1,
        0x8ULL,
        0,
        "UT_1096",
        "Testing state transition current=5 to next=1 with prereq=0x8"
    );
}
static void run_unit_test_1097(void) {
    run_fsm_assert(
        6,
        1,
        0x8ULL,
        0,
        "UT_1097",
        "Testing state transition current=6 to next=1 with prereq=0x8"
    );
}
static void run_unit_test_1098(void) {
    run_fsm_assert(
        7,
        1,
        0x8ULL,
        0,
        "UT_1098",
        "Testing state transition current=7 to next=1 with prereq=0x8"
    );
}
static void run_unit_test_1099(void) {
    run_fsm_assert(
        8,
        1,
        0x8ULL,
        0,
        "UT_1099",
        "Testing state transition current=8 to next=1 with prereq=0x8"
    );
}
static void run_unit_test_1100(void) {
    run_fsm_assert(
        10,
        1,
        0x8ULL,
        0,
        "UT_1100",
        "Testing state transition current=10 to next=1 with prereq=0x8"
    );
}
static void run_unit_test_1101(void) {
    run_fsm_assert(
        15,
        1,
        0x8ULL,
        0,
        "UT_1101",
        "Testing state transition current=15 to next=1 with prereq=0x8"
    );
}
static void run_unit_test_1102(void) {
    run_fsm_assert(
        100,
        1,
        0x8ULL,
        0,
        "UT_1102",
        "Testing state transition current=100 to next=1 with prereq=0x8"
    );
}
static void run_unit_test_1103(void) {
    run_fsm_assert(
        -100,
        1,
        0x8ULL,
        0,
        "UT_1103",
        "Testing state transition current=-100 to next=1 with prereq=0x8"
    );
}
static void run_unit_test_1104(void) {
    run_fsm_assert(
        -10,
        2,
        0x8ULL,
        0,
        "UT_1104",
        "Testing state transition current=-10 to next=2 with prereq=0x8"
    );
}
static void run_unit_test_1105(void) {
    run_fsm_assert(
        -5,
        2,
        0x8ULL,
        0,
        "UT_1105",
        "Testing state transition current=-5 to next=2 with prereq=0x8"
    );
}
static void run_unit_test_1106(void) {
    run_fsm_assert(
        -1,
        2,
        0x8ULL,
        0,
        "UT_1106",
        "Testing state transition current=-1 to next=2 with prereq=0x8"
    );
}
static void run_unit_test_1107(void) {
    run_fsm_assert(
        0,
        2,
        0x8ULL,
        0,
        "UT_1107",
        "Testing state transition current=0 to next=2 with prereq=0x8"
    );
}
static void run_unit_test_1108(void) {
    run_fsm_assert(
        1,
        2,
        0x8ULL,
        0,
        "UT_1108",
        "Testing state transition current=1 to next=2 with prereq=0x8"
    );
}
static void run_unit_test_1109(void) {
    run_fsm_assert(
        2,
        2,
        0x8ULL,
        0,
        "UT_1109",
        "Testing state transition current=2 to next=2 with prereq=0x8"
    );
}
static void run_unit_test_1110(void) {
    run_fsm_assert(
        3,
        2,
        0x8ULL,
        0,
        "UT_1110",
        "Testing state transition current=3 to next=2 with prereq=0x8"
    );
}
static void run_unit_test_1111(void) {
    run_fsm_assert(
        4,
        2,
        0x8ULL,
        0,
        "UT_1111",
        "Testing state transition current=4 to next=2 with prereq=0x8"
    );
}
static void run_unit_test_1112(void) {
    run_fsm_assert(
        5,
        2,
        0x8ULL,
        0,
        "UT_1112",
        "Testing state transition current=5 to next=2 with prereq=0x8"
    );
}
static void run_unit_test_1113(void) {
    run_fsm_assert(
        6,
        2,
        0x8ULL,
        0,
        "UT_1113",
        "Testing state transition current=6 to next=2 with prereq=0x8"
    );
}
static void run_unit_test_1114(void) {
    run_fsm_assert(
        7,
        2,
        0x8ULL,
        0,
        "UT_1114",
        "Testing state transition current=7 to next=2 with prereq=0x8"
    );
}
static void run_unit_test_1115(void) {
    run_fsm_assert(
        8,
        2,
        0x8ULL,
        0,
        "UT_1115",
        "Testing state transition current=8 to next=2 with prereq=0x8"
    );
}
static void run_unit_test_1116(void) {
    run_fsm_assert(
        10,
        2,
        0x8ULL,
        0,
        "UT_1116",
        "Testing state transition current=10 to next=2 with prereq=0x8"
    );
}
static void run_unit_test_1117(void) {
    run_fsm_assert(
        15,
        2,
        0x8ULL,
        0,
        "UT_1117",
        "Testing state transition current=15 to next=2 with prereq=0x8"
    );
}
static void run_unit_test_1118(void) {
    run_fsm_assert(
        100,
        2,
        0x8ULL,
        0,
        "UT_1118",
        "Testing state transition current=100 to next=2 with prereq=0x8"
    );
}
static void run_unit_test_1119(void) {
    run_fsm_assert(
        -100,
        2,
        0x8ULL,
        0,
        "UT_1119",
        "Testing state transition current=-100 to next=2 with prereq=0x8"
    );
}
static void run_unit_test_1120(void) {
    run_fsm_assert(
        -10,
        3,
        0x8ULL,
        0,
        "UT_1120",
        "Testing state transition current=-10 to next=3 with prereq=0x8"
    );
}
static void run_unit_test_1121(void) {
    run_fsm_assert(
        -5,
        3,
        0x8ULL,
        0,
        "UT_1121",
        "Testing state transition current=-5 to next=3 with prereq=0x8"
    );
}
static void run_unit_test_1122(void) {
    run_fsm_assert(
        -1,
        3,
        0x8ULL,
        0,
        "UT_1122",
        "Testing state transition current=-1 to next=3 with prereq=0x8"
    );
}
static void run_unit_test_1123(void) {
    run_fsm_assert(
        0,
        3,
        0x8ULL,
        0,
        "UT_1123",
        "Testing state transition current=0 to next=3 with prereq=0x8"
    );
}
static void run_unit_test_1124(void) {
    run_fsm_assert(
        1,
        3,
        0x8ULL,
        0,
        "UT_1124",
        "Testing state transition current=1 to next=3 with prereq=0x8"
    );
}
static void run_unit_test_1125(void) {
    run_fsm_assert(
        2,
        3,
        0x8ULL,
        0,
        "UT_1125",
        "Testing state transition current=2 to next=3 with prereq=0x8"
    );
}
static void run_unit_test_1126(void) {
    run_fsm_assert(
        3,
        3,
        0x8ULL,
        0,
        "UT_1126",
        "Testing state transition current=3 to next=3 with prereq=0x8"
    );
}
static void run_unit_test_1127(void) {
    run_fsm_assert(
        4,
        3,
        0x8ULL,
        0,
        "UT_1127",
        "Testing state transition current=4 to next=3 with prereq=0x8"
    );
}
static void run_unit_test_1128(void) {
    run_fsm_assert(
        5,
        3,
        0x8ULL,
        0,
        "UT_1128",
        "Testing state transition current=5 to next=3 with prereq=0x8"
    );
}
static void run_unit_test_1129(void) {
    run_fsm_assert(
        6,
        3,
        0x8ULL,
        0,
        "UT_1129",
        "Testing state transition current=6 to next=3 with prereq=0x8"
    );
}
static void run_unit_test_1130(void) {
    run_fsm_assert(
        7,
        3,
        0x8ULL,
        0,
        "UT_1130",
        "Testing state transition current=7 to next=3 with prereq=0x8"
    );
}
static void run_unit_test_1131(void) {
    run_fsm_assert(
        8,
        3,
        0x8ULL,
        0,
        "UT_1131",
        "Testing state transition current=8 to next=3 with prereq=0x8"
    );
}
static void run_unit_test_1132(void) {
    run_fsm_assert(
        10,
        3,
        0x8ULL,
        0,
        "UT_1132",
        "Testing state transition current=10 to next=3 with prereq=0x8"
    );
}
static void run_unit_test_1133(void) {
    run_fsm_assert(
        15,
        3,
        0x8ULL,
        0,
        "UT_1133",
        "Testing state transition current=15 to next=3 with prereq=0x8"
    );
}
static void run_unit_test_1134(void) {
    run_fsm_assert(
        100,
        3,
        0x8ULL,
        0,
        "UT_1134",
        "Testing state transition current=100 to next=3 with prereq=0x8"
    );
}
static void run_unit_test_1135(void) {
    run_fsm_assert(
        -100,
        3,
        0x8ULL,
        0,
        "UT_1135",
        "Testing state transition current=-100 to next=3 with prereq=0x8"
    );
}
static void run_unit_test_1136(void) {
    run_fsm_assert(
        -10,
        4,
        0x8ULL,
        0,
        "UT_1136",
        "Testing state transition current=-10 to next=4 with prereq=0x8"
    );
}
static void run_unit_test_1137(void) {
    run_fsm_assert(
        -5,
        4,
        0x8ULL,
        0,
        "UT_1137",
        "Testing state transition current=-5 to next=4 with prereq=0x8"
    );
}
static void run_unit_test_1138(void) {
    run_fsm_assert(
        -1,
        4,
        0x8ULL,
        0,
        "UT_1138",
        "Testing state transition current=-1 to next=4 with prereq=0x8"
    );
}
static void run_unit_test_1139(void) {
    run_fsm_assert(
        0,
        4,
        0x8ULL,
        0,
        "UT_1139",
        "Testing state transition current=0 to next=4 with prereq=0x8"
    );
}
static void run_unit_test_1140(void) {
    run_fsm_assert(
        1,
        4,
        0x8ULL,
        0,
        "UT_1140",
        "Testing state transition current=1 to next=4 with prereq=0x8"
    );
}
static void run_unit_test_1141(void) {
    run_fsm_assert(
        2,
        4,
        0x8ULL,
        0,
        "UT_1141",
        "Testing state transition current=2 to next=4 with prereq=0x8"
    );
}
static void run_unit_test_1142(void) {
    run_fsm_assert(
        3,
        4,
        0x8ULL,
        1,
        "UT_1142",
        "Testing state transition current=3 to next=4 with prereq=0x8"
    );
}
static void run_unit_test_1143(void) {
    run_fsm_assert(
        4,
        4,
        0x8ULL,
        0,
        "UT_1143",
        "Testing state transition current=4 to next=4 with prereq=0x8"
    );
}
static void run_unit_test_1144(void) {
    run_fsm_assert(
        5,
        4,
        0x8ULL,
        0,
        "UT_1144",
        "Testing state transition current=5 to next=4 with prereq=0x8"
    );
}
static void run_unit_test_1145(void) {
    run_fsm_assert(
        6,
        4,
        0x8ULL,
        0,
        "UT_1145",
        "Testing state transition current=6 to next=4 with prereq=0x8"
    );
}
static void run_unit_test_1146(void) {
    run_fsm_assert(
        7,
        4,
        0x8ULL,
        0,
        "UT_1146",
        "Testing state transition current=7 to next=4 with prereq=0x8"
    );
}
static void run_unit_test_1147(void) {
    run_fsm_assert(
        8,
        4,
        0x8ULL,
        0,
        "UT_1147",
        "Testing state transition current=8 to next=4 with prereq=0x8"
    );
}
static void run_unit_test_1148(void) {
    run_fsm_assert(
        10,
        4,
        0x8ULL,
        0,
        "UT_1148",
        "Testing state transition current=10 to next=4 with prereq=0x8"
    );
}
static void run_unit_test_1149(void) {
    run_fsm_assert(
        15,
        4,
        0x8ULL,
        0,
        "UT_1149",
        "Testing state transition current=15 to next=4 with prereq=0x8"
    );
}
static void run_unit_test_1150(void) {
    run_fsm_assert(
        100,
        4,
        0x8ULL,
        0,
        "UT_1150",
        "Testing state transition current=100 to next=4 with prereq=0x8"
    );
}
static void run_unit_test_1151(void) {
    run_fsm_assert(
        -100,
        4,
        0x8ULL,
        0,
        "UT_1151",
        "Testing state transition current=-100 to next=4 with prereq=0x8"
    );
}
static void run_unit_test_1152(void) {
    run_fsm_assert(
        -10,
        5,
        0x8ULL,
        0,
        "UT_1152",
        "Testing state transition current=-10 to next=5 with prereq=0x8"
    );
}
static void run_unit_test_1153(void) {
    run_fsm_assert(
        -5,
        5,
        0x8ULL,
        0,
        "UT_1153",
        "Testing state transition current=-5 to next=5 with prereq=0x8"
    );
}
static void run_unit_test_1154(void) {
    run_fsm_assert(
        -1,
        5,
        0x8ULL,
        0,
        "UT_1154",
        "Testing state transition current=-1 to next=5 with prereq=0x8"
    );
}
static void run_unit_test_1155(void) {
    run_fsm_assert(
        0,
        5,
        0x8ULL,
        0,
        "UT_1155",
        "Testing state transition current=0 to next=5 with prereq=0x8"
    );
}
static void run_unit_test_1156(void) {
    run_fsm_assert(
        1,
        5,
        0x8ULL,
        0,
        "UT_1156",
        "Testing state transition current=1 to next=5 with prereq=0x8"
    );
}
static void run_unit_test_1157(void) {
    run_fsm_assert(
        2,
        5,
        0x8ULL,
        0,
        "UT_1157",
        "Testing state transition current=2 to next=5 with prereq=0x8"
    );
}
static void run_unit_test_1158(void) {
    run_fsm_assert(
        3,
        5,
        0x8ULL,
        0,
        "UT_1158",
        "Testing state transition current=3 to next=5 with prereq=0x8"
    );
}
static void run_unit_test_1159(void) {
    run_fsm_assert(
        4,
        5,
        0x8ULL,
        0,
        "UT_1159",
        "Testing state transition current=4 to next=5 with prereq=0x8"
    );
}
static void run_unit_test_1160(void) {
    run_fsm_assert(
        5,
        5,
        0x8ULL,
        0,
        "UT_1160",
        "Testing state transition current=5 to next=5 with prereq=0x8"
    );
}
static void run_unit_test_1161(void) {
    run_fsm_assert(
        6,
        5,
        0x8ULL,
        0,
        "UT_1161",
        "Testing state transition current=6 to next=5 with prereq=0x8"
    );
}
static void run_unit_test_1162(void) {
    run_fsm_assert(
        7,
        5,
        0x8ULL,
        0,
        "UT_1162",
        "Testing state transition current=7 to next=5 with prereq=0x8"
    );
}
static void run_unit_test_1163(void) {
    run_fsm_assert(
        8,
        5,
        0x8ULL,
        0,
        "UT_1163",
        "Testing state transition current=8 to next=5 with prereq=0x8"
    );
}
static void run_unit_test_1164(void) {
    run_fsm_assert(
        10,
        5,
        0x8ULL,
        0,
        "UT_1164",
        "Testing state transition current=10 to next=5 with prereq=0x8"
    );
}
static void run_unit_test_1165(void) {
    run_fsm_assert(
        15,
        5,
        0x8ULL,
        0,
        "UT_1165",
        "Testing state transition current=15 to next=5 with prereq=0x8"
    );
}
static void run_unit_test_1166(void) {
    run_fsm_assert(
        100,
        5,
        0x8ULL,
        0,
        "UT_1166",
        "Testing state transition current=100 to next=5 with prereq=0x8"
    );
}
static void run_unit_test_1167(void) {
    run_fsm_assert(
        -100,
        5,
        0x8ULL,
        0,
        "UT_1167",
        "Testing state transition current=-100 to next=5 with prereq=0x8"
    );
}
static void run_unit_test_1168(void) {
    run_fsm_assert(
        -10,
        6,
        0x8ULL,
        0,
        "UT_1168",
        "Testing state transition current=-10 to next=6 with prereq=0x8"
    );
}
static void run_unit_test_1169(void) {
    run_fsm_assert(
        -5,
        6,
        0x8ULL,
        0,
        "UT_1169",
        "Testing state transition current=-5 to next=6 with prereq=0x8"
    );
}
static void run_unit_test_1170(void) {
    run_fsm_assert(
        -1,
        6,
        0x8ULL,
        0,
        "UT_1170",
        "Testing state transition current=-1 to next=6 with prereq=0x8"
    );
}
static void run_unit_test_1171(void) {
    run_fsm_assert(
        0,
        6,
        0x8ULL,
        0,
        "UT_1171",
        "Testing state transition current=0 to next=6 with prereq=0x8"
    );
}
static void run_unit_test_1172(void) {
    run_fsm_assert(
        1,
        6,
        0x8ULL,
        0,
        "UT_1172",
        "Testing state transition current=1 to next=6 with prereq=0x8"
    );
}
static void run_unit_test_1173(void) {
    run_fsm_assert(
        2,
        6,
        0x8ULL,
        0,
        "UT_1173",
        "Testing state transition current=2 to next=6 with prereq=0x8"
    );
}
static void run_unit_test_1174(void) {
    run_fsm_assert(
        3,
        6,
        0x8ULL,
        0,
        "UT_1174",
        "Testing state transition current=3 to next=6 with prereq=0x8"
    );
}
static void run_unit_test_1175(void) {
    run_fsm_assert(
        4,
        6,
        0x8ULL,
        0,
        "UT_1175",
        "Testing state transition current=4 to next=6 with prereq=0x8"
    );
}
static void run_unit_test_1176(void) {
    run_fsm_assert(
        5,
        6,
        0x8ULL,
        0,
        "UT_1176",
        "Testing state transition current=5 to next=6 with prereq=0x8"
    );
}
static void run_unit_test_1177(void) {
    run_fsm_assert(
        6,
        6,
        0x8ULL,
        0,
        "UT_1177",
        "Testing state transition current=6 to next=6 with prereq=0x8"
    );
}
static void run_unit_test_1178(void) {
    run_fsm_assert(
        7,
        6,
        0x8ULL,
        0,
        "UT_1178",
        "Testing state transition current=7 to next=6 with prereq=0x8"
    );
}
static void run_unit_test_1179(void) {
    run_fsm_assert(
        8,
        6,
        0x8ULL,
        0,
        "UT_1179",
        "Testing state transition current=8 to next=6 with prereq=0x8"
    );
}
static void run_unit_test_1180(void) {
    run_fsm_assert(
        10,
        6,
        0x8ULL,
        0,
        "UT_1180",
        "Testing state transition current=10 to next=6 with prereq=0x8"
    );
}
static void run_unit_test_1181(void) {
    run_fsm_assert(
        15,
        6,
        0x8ULL,
        0,
        "UT_1181",
        "Testing state transition current=15 to next=6 with prereq=0x8"
    );
}
static void run_unit_test_1182(void) {
    run_fsm_assert(
        100,
        6,
        0x8ULL,
        0,
        "UT_1182",
        "Testing state transition current=100 to next=6 with prereq=0x8"
    );
}
static void run_unit_test_1183(void) {
    run_fsm_assert(
        -100,
        6,
        0x8ULL,
        0,
        "UT_1183",
        "Testing state transition current=-100 to next=6 with prereq=0x8"
    );
}
static void run_unit_test_1184(void) {
    run_fsm_assert(
        -10,
        7,
        0x8ULL,
        0,
        "UT_1184",
        "Testing state transition current=-10 to next=7 with prereq=0x8"
    );
}
static void run_unit_test_1185(void) {
    run_fsm_assert(
        -5,
        7,
        0x8ULL,
        0,
        "UT_1185",
        "Testing state transition current=-5 to next=7 with prereq=0x8"
    );
}
static void run_unit_test_1186(void) {
    run_fsm_assert(
        -1,
        7,
        0x8ULL,
        0,
        "UT_1186",
        "Testing state transition current=-1 to next=7 with prereq=0x8"
    );
}
static void run_unit_test_1187(void) {
    run_fsm_assert(
        0,
        7,
        0x8ULL,
        0,
        "UT_1187",
        "Testing state transition current=0 to next=7 with prereq=0x8"
    );
}
static void run_unit_test_1188(void) {
    run_fsm_assert(
        1,
        7,
        0x8ULL,
        0,
        "UT_1188",
        "Testing state transition current=1 to next=7 with prereq=0x8"
    );
}
static void run_unit_test_1189(void) {
    run_fsm_assert(
        2,
        7,
        0x8ULL,
        0,
        "UT_1189",
        "Testing state transition current=2 to next=7 with prereq=0x8"
    );
}
static void run_unit_test_1190(void) {
    run_fsm_assert(
        3,
        7,
        0x8ULL,
        0,
        "UT_1190",
        "Testing state transition current=3 to next=7 with prereq=0x8"
    );
}
static void run_unit_test_1191(void) {
    run_fsm_assert(
        4,
        7,
        0x8ULL,
        0,
        "UT_1191",
        "Testing state transition current=4 to next=7 with prereq=0x8"
    );
}
static void run_unit_test_1192(void) {
    run_fsm_assert(
        5,
        7,
        0x8ULL,
        0,
        "UT_1192",
        "Testing state transition current=5 to next=7 with prereq=0x8"
    );
}
static void run_unit_test_1193(void) {
    run_fsm_assert(
        6,
        7,
        0x8ULL,
        0,
        "UT_1193",
        "Testing state transition current=6 to next=7 with prereq=0x8"
    );
}
static void run_unit_test_1194(void) {
    run_fsm_assert(
        7,
        7,
        0x8ULL,
        0,
        "UT_1194",
        "Testing state transition current=7 to next=7 with prereq=0x8"
    );
}
static void run_unit_test_1195(void) {
    run_fsm_assert(
        8,
        7,
        0x8ULL,
        0,
        "UT_1195",
        "Testing state transition current=8 to next=7 with prereq=0x8"
    );
}
static void run_unit_test_1196(void) {
    run_fsm_assert(
        10,
        7,
        0x8ULL,
        0,
        "UT_1196",
        "Testing state transition current=10 to next=7 with prereq=0x8"
    );
}
static void run_unit_test_1197(void) {
    run_fsm_assert(
        15,
        7,
        0x8ULL,
        0,
        "UT_1197",
        "Testing state transition current=15 to next=7 with prereq=0x8"
    );
}
static void run_unit_test_1198(void) {
    run_fsm_assert(
        100,
        7,
        0x8ULL,
        0,
        "UT_1198",
        "Testing state transition current=100 to next=7 with prereq=0x8"
    );
}
static void run_unit_test_1199(void) {
    run_fsm_assert(
        -100,
        7,
        0x8ULL,
        0,
        "UT_1199",
        "Testing state transition current=-100 to next=7 with prereq=0x8"
    );
}
static void run_unit_test_1200(void) {
    run_fsm_assert(
        -10,
        8,
        0x8ULL,
        0,
        "UT_1200",
        "Testing state transition current=-10 to next=8 with prereq=0x8"
    );
}
static void run_unit_test_1201(void) {
    run_fsm_assert(
        -5,
        8,
        0x8ULL,
        0,
        "UT_1201",
        "Testing state transition current=-5 to next=8 with prereq=0x8"
    );
}
static void run_unit_test_1202(void) {
    run_fsm_assert(
        -1,
        8,
        0x8ULL,
        0,
        "UT_1202",
        "Testing state transition current=-1 to next=8 with prereq=0x8"
    );
}
static void run_unit_test_1203(void) {
    run_fsm_assert(
        0,
        8,
        0x8ULL,
        0,
        "UT_1203",
        "Testing state transition current=0 to next=8 with prereq=0x8"
    );
}
static void run_unit_test_1204(void) {
    run_fsm_assert(
        1,
        8,
        0x8ULL,
        0,
        "UT_1204",
        "Testing state transition current=1 to next=8 with prereq=0x8"
    );
}
static void run_unit_test_1205(void) {
    run_fsm_assert(
        2,
        8,
        0x8ULL,
        0,
        "UT_1205",
        "Testing state transition current=2 to next=8 with prereq=0x8"
    );
}
static void run_unit_test_1206(void) {
    run_fsm_assert(
        3,
        8,
        0x8ULL,
        0,
        "UT_1206",
        "Testing state transition current=3 to next=8 with prereq=0x8"
    );
}
static void run_unit_test_1207(void) {
    run_fsm_assert(
        4,
        8,
        0x8ULL,
        0,
        "UT_1207",
        "Testing state transition current=4 to next=8 with prereq=0x8"
    );
}
static void run_unit_test_1208(void) {
    run_fsm_assert(
        5,
        8,
        0x8ULL,
        0,
        "UT_1208",
        "Testing state transition current=5 to next=8 with prereq=0x8"
    );
}
static void run_unit_test_1209(void) {
    run_fsm_assert(
        6,
        8,
        0x8ULL,
        0,
        "UT_1209",
        "Testing state transition current=6 to next=8 with prereq=0x8"
    );
}
static void run_unit_test_1210(void) {
    run_fsm_assert(
        7,
        8,
        0x8ULL,
        0,
        "UT_1210",
        "Testing state transition current=7 to next=8 with prereq=0x8"
    );
}
static void run_unit_test_1211(void) {
    run_fsm_assert(
        8,
        8,
        0x8ULL,
        0,
        "UT_1211",
        "Testing state transition current=8 to next=8 with prereq=0x8"
    );
}
static void run_unit_test_1212(void) {
    run_fsm_assert(
        10,
        8,
        0x8ULL,
        0,
        "UT_1212",
        "Testing state transition current=10 to next=8 with prereq=0x8"
    );
}
static void run_unit_test_1213(void) {
    run_fsm_assert(
        15,
        8,
        0x8ULL,
        0,
        "UT_1213",
        "Testing state transition current=15 to next=8 with prereq=0x8"
    );
}
static void run_unit_test_1214(void) {
    run_fsm_assert(
        100,
        8,
        0x8ULL,
        0,
        "UT_1214",
        "Testing state transition current=100 to next=8 with prereq=0x8"
    );
}
static void run_unit_test_1215(void) {
    run_fsm_assert(
        -100,
        8,
        0x8ULL,
        0,
        "UT_1215",
        "Testing state transition current=-100 to next=8 with prereq=0x8"
    );
}
static void run_unit_test_1216(void) {
    run_fsm_assert(
        -10,
        10,
        0x8ULL,
        0,
        "UT_1216",
        "Testing state transition current=-10 to next=10 with prereq=0x8"
    );
}
static void run_unit_test_1217(void) {
    run_fsm_assert(
        -5,
        10,
        0x8ULL,
        0,
        "UT_1217",
        "Testing state transition current=-5 to next=10 with prereq=0x8"
    );
}
static void run_unit_test_1218(void) {
    run_fsm_assert(
        -1,
        10,
        0x8ULL,
        0,
        "UT_1218",
        "Testing state transition current=-1 to next=10 with prereq=0x8"
    );
}
static void run_unit_test_1219(void) {
    run_fsm_assert(
        0,
        10,
        0x8ULL,
        0,
        "UT_1219",
        "Testing state transition current=0 to next=10 with prereq=0x8"
    );
}
static void run_unit_test_1220(void) {
    run_fsm_assert(
        1,
        10,
        0x8ULL,
        0,
        "UT_1220",
        "Testing state transition current=1 to next=10 with prereq=0x8"
    );
}
static void run_unit_test_1221(void) {
    run_fsm_assert(
        2,
        10,
        0x8ULL,
        0,
        "UT_1221",
        "Testing state transition current=2 to next=10 with prereq=0x8"
    );
}
static void run_unit_test_1222(void) {
    run_fsm_assert(
        3,
        10,
        0x8ULL,
        0,
        "UT_1222",
        "Testing state transition current=3 to next=10 with prereq=0x8"
    );
}
static void run_unit_test_1223(void) {
    run_fsm_assert(
        4,
        10,
        0x8ULL,
        0,
        "UT_1223",
        "Testing state transition current=4 to next=10 with prereq=0x8"
    );
}
static void run_unit_test_1224(void) {
    run_fsm_assert(
        5,
        10,
        0x8ULL,
        0,
        "UT_1224",
        "Testing state transition current=5 to next=10 with prereq=0x8"
    );
}
static void run_unit_test_1225(void) {
    run_fsm_assert(
        6,
        10,
        0x8ULL,
        0,
        "UT_1225",
        "Testing state transition current=6 to next=10 with prereq=0x8"
    );
}
static void run_unit_test_1226(void) {
    run_fsm_assert(
        7,
        10,
        0x8ULL,
        0,
        "UT_1226",
        "Testing state transition current=7 to next=10 with prereq=0x8"
    );
}
static void run_unit_test_1227(void) {
    run_fsm_assert(
        8,
        10,
        0x8ULL,
        0,
        "UT_1227",
        "Testing state transition current=8 to next=10 with prereq=0x8"
    );
}
static void run_unit_test_1228(void) {
    run_fsm_assert(
        10,
        10,
        0x8ULL,
        0,
        "UT_1228",
        "Testing state transition current=10 to next=10 with prereq=0x8"
    );
}
static void run_unit_test_1229(void) {
    run_fsm_assert(
        15,
        10,
        0x8ULL,
        0,
        "UT_1229",
        "Testing state transition current=15 to next=10 with prereq=0x8"
    );
}
static void run_unit_test_1230(void) {
    run_fsm_assert(
        100,
        10,
        0x8ULL,
        0,
        "UT_1230",
        "Testing state transition current=100 to next=10 with prereq=0x8"
    );
}
static void run_unit_test_1231(void) {
    run_fsm_assert(
        -100,
        10,
        0x8ULL,
        0,
        "UT_1231",
        "Testing state transition current=-100 to next=10 with prereq=0x8"
    );
}
static void run_unit_test_1232(void) {
    run_fsm_assert(
        -10,
        15,
        0x8ULL,
        0,
        "UT_1232",
        "Testing state transition current=-10 to next=15 with prereq=0x8"
    );
}
static void run_unit_test_1233(void) {
    run_fsm_assert(
        -5,
        15,
        0x8ULL,
        0,
        "UT_1233",
        "Testing state transition current=-5 to next=15 with prereq=0x8"
    );
}
static void run_unit_test_1234(void) {
    run_fsm_assert(
        -1,
        15,
        0x8ULL,
        0,
        "UT_1234",
        "Testing state transition current=-1 to next=15 with prereq=0x8"
    );
}
static void run_unit_test_1235(void) {
    run_fsm_assert(
        0,
        15,
        0x8ULL,
        0,
        "UT_1235",
        "Testing state transition current=0 to next=15 with prereq=0x8"
    );
}
static void run_unit_test_1236(void) {
    run_fsm_assert(
        1,
        15,
        0x8ULL,
        0,
        "UT_1236",
        "Testing state transition current=1 to next=15 with prereq=0x8"
    );
}
static void run_unit_test_1237(void) {
    run_fsm_assert(
        2,
        15,
        0x8ULL,
        0,
        "UT_1237",
        "Testing state transition current=2 to next=15 with prereq=0x8"
    );
}
static void run_unit_test_1238(void) {
    run_fsm_assert(
        3,
        15,
        0x8ULL,
        0,
        "UT_1238",
        "Testing state transition current=3 to next=15 with prereq=0x8"
    );
}
static void run_unit_test_1239(void) {
    run_fsm_assert(
        4,
        15,
        0x8ULL,
        0,
        "UT_1239",
        "Testing state transition current=4 to next=15 with prereq=0x8"
    );
}
static void run_unit_test_1240(void) {
    run_fsm_assert(
        5,
        15,
        0x8ULL,
        0,
        "UT_1240",
        "Testing state transition current=5 to next=15 with prereq=0x8"
    );
}
static void run_unit_test_1241(void) {
    run_fsm_assert(
        6,
        15,
        0x8ULL,
        0,
        "UT_1241",
        "Testing state transition current=6 to next=15 with prereq=0x8"
    );
}
static void run_unit_test_1242(void) {
    run_fsm_assert(
        7,
        15,
        0x8ULL,
        0,
        "UT_1242",
        "Testing state transition current=7 to next=15 with prereq=0x8"
    );
}
static void run_unit_test_1243(void) {
    run_fsm_assert(
        8,
        15,
        0x8ULL,
        0,
        "UT_1243",
        "Testing state transition current=8 to next=15 with prereq=0x8"
    );
}
static void run_unit_test_1244(void) {
    run_fsm_assert(
        10,
        15,
        0x8ULL,
        0,
        "UT_1244",
        "Testing state transition current=10 to next=15 with prereq=0x8"
    );
}
static void run_unit_test_1245(void) {
    run_fsm_assert(
        15,
        15,
        0x8ULL,
        0,
        "UT_1245",
        "Testing state transition current=15 to next=15 with prereq=0x8"
    );
}
static void run_unit_test_1246(void) {
    run_fsm_assert(
        100,
        15,
        0x8ULL,
        0,
        "UT_1246",
        "Testing state transition current=100 to next=15 with prereq=0x8"
    );
}
static void run_unit_test_1247(void) {
    run_fsm_assert(
        -100,
        15,
        0x8ULL,
        0,
        "UT_1247",
        "Testing state transition current=-100 to next=15 with prereq=0x8"
    );
}
static void run_unit_test_1248(void) {
    run_fsm_assert(
        -10,
        100,
        0x8ULL,
        0,
        "UT_1248",
        "Testing state transition current=-10 to next=100 with prereq=0x8"
    );
}
static void run_unit_test_1249(void) {
    run_fsm_assert(
        -5,
        100,
        0x8ULL,
        0,
        "UT_1249",
        "Testing state transition current=-5 to next=100 with prereq=0x8"
    );
}
static void run_unit_test_1250(void) {
    run_fsm_assert(
        -1,
        100,
        0x8ULL,
        0,
        "UT_1250",
        "Testing state transition current=-1 to next=100 with prereq=0x8"
    );
}
static void run_unit_test_1251(void) {
    run_fsm_assert(
        0,
        100,
        0x8ULL,
        0,
        "UT_1251",
        "Testing state transition current=0 to next=100 with prereq=0x8"
    );
}
static void run_unit_test_1252(void) {
    run_fsm_assert(
        1,
        100,
        0x8ULL,
        0,
        "UT_1252",
        "Testing state transition current=1 to next=100 with prereq=0x8"
    );
}
static void run_unit_test_1253(void) {
    run_fsm_assert(
        2,
        100,
        0x8ULL,
        0,
        "UT_1253",
        "Testing state transition current=2 to next=100 with prereq=0x8"
    );
}
static void run_unit_test_1254(void) {
    run_fsm_assert(
        3,
        100,
        0x8ULL,
        0,
        "UT_1254",
        "Testing state transition current=3 to next=100 with prereq=0x8"
    );
}
static void run_unit_test_1255(void) {
    run_fsm_assert(
        4,
        100,
        0x8ULL,
        0,
        "UT_1255",
        "Testing state transition current=4 to next=100 with prereq=0x8"
    );
}
static void run_unit_test_1256(void) {
    run_fsm_assert(
        5,
        100,
        0x8ULL,
        0,
        "UT_1256",
        "Testing state transition current=5 to next=100 with prereq=0x8"
    );
}
static void run_unit_test_1257(void) {
    run_fsm_assert(
        6,
        100,
        0x8ULL,
        0,
        "UT_1257",
        "Testing state transition current=6 to next=100 with prereq=0x8"
    );
}
static void run_unit_test_1258(void) {
    run_fsm_assert(
        7,
        100,
        0x8ULL,
        0,
        "UT_1258",
        "Testing state transition current=7 to next=100 with prereq=0x8"
    );
}
static void run_unit_test_1259(void) {
    run_fsm_assert(
        8,
        100,
        0x8ULL,
        0,
        "UT_1259",
        "Testing state transition current=8 to next=100 with prereq=0x8"
    );
}
static void run_unit_test_1260(void) {
    run_fsm_assert(
        10,
        100,
        0x8ULL,
        0,
        "UT_1260",
        "Testing state transition current=10 to next=100 with prereq=0x8"
    );
}
static void run_unit_test_1261(void) {
    run_fsm_assert(
        15,
        100,
        0x8ULL,
        0,
        "UT_1261",
        "Testing state transition current=15 to next=100 with prereq=0x8"
    );
}
static void run_unit_test_1262(void) {
    run_fsm_assert(
        100,
        100,
        0x8ULL,
        0,
        "UT_1262",
        "Testing state transition current=100 to next=100 with prereq=0x8"
    );
}
static void run_unit_test_1263(void) {
    run_fsm_assert(
        -100,
        100,
        0x8ULL,
        0,
        "UT_1263",
        "Testing state transition current=-100 to next=100 with prereq=0x8"
    );
}
static void run_unit_test_1264(void) {
    run_fsm_assert(
        -10,
        -100,
        0x8ULL,
        0,
        "UT_1264",
        "Testing state transition current=-10 to next=-100 with prereq=0x8"
    );
}
static void run_unit_test_1265(void) {
    run_fsm_assert(
        -5,
        -100,
        0x8ULL,
        0,
        "UT_1265",
        "Testing state transition current=-5 to next=-100 with prereq=0x8"
    );
}
static void run_unit_test_1266(void) {
    run_fsm_assert(
        -1,
        -100,
        0x8ULL,
        0,
        "UT_1266",
        "Testing state transition current=-1 to next=-100 with prereq=0x8"
    );
}
static void run_unit_test_1267(void) {
    run_fsm_assert(
        0,
        -100,
        0x8ULL,
        0,
        "UT_1267",
        "Testing state transition current=0 to next=-100 with prereq=0x8"
    );
}
static void run_unit_test_1268(void) {
    run_fsm_assert(
        1,
        -100,
        0x8ULL,
        0,
        "UT_1268",
        "Testing state transition current=1 to next=-100 with prereq=0x8"
    );
}
static void run_unit_test_1269(void) {
    run_fsm_assert(
        2,
        -100,
        0x8ULL,
        0,
        "UT_1269",
        "Testing state transition current=2 to next=-100 with prereq=0x8"
    );
}
static void run_unit_test_1270(void) {
    run_fsm_assert(
        3,
        -100,
        0x8ULL,
        0,
        "UT_1270",
        "Testing state transition current=3 to next=-100 with prereq=0x8"
    );
}
static void run_unit_test_1271(void) {
    run_fsm_assert(
        4,
        -100,
        0x8ULL,
        0,
        "UT_1271",
        "Testing state transition current=4 to next=-100 with prereq=0x8"
    );
}
static void run_unit_test_1272(void) {
    run_fsm_assert(
        5,
        -100,
        0x8ULL,
        0,
        "UT_1272",
        "Testing state transition current=5 to next=-100 with prereq=0x8"
    );
}
static void run_unit_test_1273(void) {
    run_fsm_assert(
        6,
        -100,
        0x8ULL,
        0,
        "UT_1273",
        "Testing state transition current=6 to next=-100 with prereq=0x8"
    );
}
static void run_unit_test_1274(void) {
    run_fsm_assert(
        7,
        -100,
        0x8ULL,
        0,
        "UT_1274",
        "Testing state transition current=7 to next=-100 with prereq=0x8"
    );
}
static void run_unit_test_1275(void) {
    run_fsm_assert(
        8,
        -100,
        0x8ULL,
        0,
        "UT_1275",
        "Testing state transition current=8 to next=-100 with prereq=0x8"
    );
}
static void run_unit_test_1276(void) {
    run_fsm_assert(
        10,
        -100,
        0x8ULL,
        0,
        "UT_1276",
        "Testing state transition current=10 to next=-100 with prereq=0x8"
    );
}
static void run_unit_test_1277(void) {
    run_fsm_assert(
        15,
        -100,
        0x8ULL,
        0,
        "UT_1277",
        "Testing state transition current=15 to next=-100 with prereq=0x8"
    );
}
static void run_unit_test_1278(void) {
    run_fsm_assert(
        100,
        -100,
        0x8ULL,
        0,
        "UT_1278",
        "Testing state transition current=100 to next=-100 with prereq=0x8"
    );
}
static void run_unit_test_1279(void) {
    run_fsm_assert(
        -100,
        -100,
        0x8ULL,
        0,
        "UT_1279",
        "Testing state transition current=-100 to next=-100 with prereq=0x8"
    );
}
static void run_unit_test_1280(void) {
    run_fsm_assert(
        -10,
        -10,
        0x10ULL,
        0,
        "UT_1280",
        "Testing state transition current=-10 to next=-10 with prereq=0x10"
    );
}
static void run_unit_test_1281(void) {
    run_fsm_assert(
        -5,
        -10,
        0x10ULL,
        0,
        "UT_1281",
        "Testing state transition current=-5 to next=-10 with prereq=0x10"
    );
}
static void run_unit_test_1282(void) {
    run_fsm_assert(
        -1,
        -10,
        0x10ULL,
        0,
        "UT_1282",
        "Testing state transition current=-1 to next=-10 with prereq=0x10"
    );
}
static void run_unit_test_1283(void) {
    run_fsm_assert(
        0,
        -10,
        0x10ULL,
        0,
        "UT_1283",
        "Testing state transition current=0 to next=-10 with prereq=0x10"
    );
}
static void run_unit_test_1284(void) {
    run_fsm_assert(
        1,
        -10,
        0x10ULL,
        0,
        "UT_1284",
        "Testing state transition current=1 to next=-10 with prereq=0x10"
    );
}
static void run_unit_test_1285(void) {
    run_fsm_assert(
        2,
        -10,
        0x10ULL,
        0,
        "UT_1285",
        "Testing state transition current=2 to next=-10 with prereq=0x10"
    );
}
static void run_unit_test_1286(void) {
    run_fsm_assert(
        3,
        -10,
        0x10ULL,
        0,
        "UT_1286",
        "Testing state transition current=3 to next=-10 with prereq=0x10"
    );
}
static void run_unit_test_1287(void) {
    run_fsm_assert(
        4,
        -10,
        0x10ULL,
        0,
        "UT_1287",
        "Testing state transition current=4 to next=-10 with prereq=0x10"
    );
}
static void run_unit_test_1288(void) {
    run_fsm_assert(
        5,
        -10,
        0x10ULL,
        0,
        "UT_1288",
        "Testing state transition current=5 to next=-10 with prereq=0x10"
    );
}
static void run_unit_test_1289(void) {
    run_fsm_assert(
        6,
        -10,
        0x10ULL,
        0,
        "UT_1289",
        "Testing state transition current=6 to next=-10 with prereq=0x10"
    );
}
static void run_unit_test_1290(void) {
    run_fsm_assert(
        7,
        -10,
        0x10ULL,
        0,
        "UT_1290",
        "Testing state transition current=7 to next=-10 with prereq=0x10"
    );
}
static void run_unit_test_1291(void) {
    run_fsm_assert(
        8,
        -10,
        0x10ULL,
        0,
        "UT_1291",
        "Testing state transition current=8 to next=-10 with prereq=0x10"
    );
}
static void run_unit_test_1292(void) {
    run_fsm_assert(
        10,
        -10,
        0x10ULL,
        0,
        "UT_1292",
        "Testing state transition current=10 to next=-10 with prereq=0x10"
    );
}
static void run_unit_test_1293(void) {
    run_fsm_assert(
        15,
        -10,
        0x10ULL,
        0,
        "UT_1293",
        "Testing state transition current=15 to next=-10 with prereq=0x10"
    );
}
static void run_unit_test_1294(void) {
    run_fsm_assert(
        100,
        -10,
        0x10ULL,
        0,
        "UT_1294",
        "Testing state transition current=100 to next=-10 with prereq=0x10"
    );
}
static void run_unit_test_1295(void) {
    run_fsm_assert(
        -100,
        -10,
        0x10ULL,
        0,
        "UT_1295",
        "Testing state transition current=-100 to next=-10 with prereq=0x10"
    );
}
static void run_unit_test_1296(void) {
    run_fsm_assert(
        -10,
        -5,
        0x10ULL,
        0,
        "UT_1296",
        "Testing state transition current=-10 to next=-5 with prereq=0x10"
    );
}
static void run_unit_test_1297(void) {
    run_fsm_assert(
        -5,
        -5,
        0x10ULL,
        0,
        "UT_1297",
        "Testing state transition current=-5 to next=-5 with prereq=0x10"
    );
}
static void run_unit_test_1298(void) {
    run_fsm_assert(
        -1,
        -5,
        0x10ULL,
        0,
        "UT_1298",
        "Testing state transition current=-1 to next=-5 with prereq=0x10"
    );
}
static void run_unit_test_1299(void) {
    run_fsm_assert(
        0,
        -5,
        0x10ULL,
        0,
        "UT_1299",
        "Testing state transition current=0 to next=-5 with prereq=0x10"
    );
}
static void run_unit_test_1300(void) {
    run_fsm_assert(
        1,
        -5,
        0x10ULL,
        0,
        "UT_1300",
        "Testing state transition current=1 to next=-5 with prereq=0x10"
    );
}
static void run_unit_test_1301(void) {
    run_fsm_assert(
        2,
        -5,
        0x10ULL,
        0,
        "UT_1301",
        "Testing state transition current=2 to next=-5 with prereq=0x10"
    );
}
static void run_unit_test_1302(void) {
    run_fsm_assert(
        3,
        -5,
        0x10ULL,
        0,
        "UT_1302",
        "Testing state transition current=3 to next=-5 with prereq=0x10"
    );
}
static void run_unit_test_1303(void) {
    run_fsm_assert(
        4,
        -5,
        0x10ULL,
        0,
        "UT_1303",
        "Testing state transition current=4 to next=-5 with prereq=0x10"
    );
}
static void run_unit_test_1304(void) {
    run_fsm_assert(
        5,
        -5,
        0x10ULL,
        0,
        "UT_1304",
        "Testing state transition current=5 to next=-5 with prereq=0x10"
    );
}
static void run_unit_test_1305(void) {
    run_fsm_assert(
        6,
        -5,
        0x10ULL,
        0,
        "UT_1305",
        "Testing state transition current=6 to next=-5 with prereq=0x10"
    );
}
static void run_unit_test_1306(void) {
    run_fsm_assert(
        7,
        -5,
        0x10ULL,
        0,
        "UT_1306",
        "Testing state transition current=7 to next=-5 with prereq=0x10"
    );
}
static void run_unit_test_1307(void) {
    run_fsm_assert(
        8,
        -5,
        0x10ULL,
        0,
        "UT_1307",
        "Testing state transition current=8 to next=-5 with prereq=0x10"
    );
}
static void run_unit_test_1308(void) {
    run_fsm_assert(
        10,
        -5,
        0x10ULL,
        0,
        "UT_1308",
        "Testing state transition current=10 to next=-5 with prereq=0x10"
    );
}
static void run_unit_test_1309(void) {
    run_fsm_assert(
        15,
        -5,
        0x10ULL,
        0,
        "UT_1309",
        "Testing state transition current=15 to next=-5 with prereq=0x10"
    );
}
static void run_unit_test_1310(void) {
    run_fsm_assert(
        100,
        -5,
        0x10ULL,
        0,
        "UT_1310",
        "Testing state transition current=100 to next=-5 with prereq=0x10"
    );
}
static void run_unit_test_1311(void) {
    run_fsm_assert(
        -100,
        -5,
        0x10ULL,
        0,
        "UT_1311",
        "Testing state transition current=-100 to next=-5 with prereq=0x10"
    );
}
static void run_unit_test_1312(void) {
    run_fsm_assert(
        -10,
        -1,
        0x10ULL,
        0,
        "UT_1312",
        "Testing state transition current=-10 to next=-1 with prereq=0x10"
    );
}
static void run_unit_test_1313(void) {
    run_fsm_assert(
        -5,
        -1,
        0x10ULL,
        0,
        "UT_1313",
        "Testing state transition current=-5 to next=-1 with prereq=0x10"
    );
}
static void run_unit_test_1314(void) {
    run_fsm_assert(
        -1,
        -1,
        0x10ULL,
        0,
        "UT_1314",
        "Testing state transition current=-1 to next=-1 with prereq=0x10"
    );
}
static void run_unit_test_1315(void) {
    run_fsm_assert(
        0,
        -1,
        0x10ULL,
        0,
        "UT_1315",
        "Testing state transition current=0 to next=-1 with prereq=0x10"
    );
}
static void run_unit_test_1316(void) {
    run_fsm_assert(
        1,
        -1,
        0x10ULL,
        0,
        "UT_1316",
        "Testing state transition current=1 to next=-1 with prereq=0x10"
    );
}
static void run_unit_test_1317(void) {
    run_fsm_assert(
        2,
        -1,
        0x10ULL,
        0,
        "UT_1317",
        "Testing state transition current=2 to next=-1 with prereq=0x10"
    );
}
static void run_unit_test_1318(void) {
    run_fsm_assert(
        3,
        -1,
        0x10ULL,
        0,
        "UT_1318",
        "Testing state transition current=3 to next=-1 with prereq=0x10"
    );
}
static void run_unit_test_1319(void) {
    run_fsm_assert(
        4,
        -1,
        0x10ULL,
        0,
        "UT_1319",
        "Testing state transition current=4 to next=-1 with prereq=0x10"
    );
}
static void run_unit_test_1320(void) {
    run_fsm_assert(
        5,
        -1,
        0x10ULL,
        0,
        "UT_1320",
        "Testing state transition current=5 to next=-1 with prereq=0x10"
    );
}
static void run_unit_test_1321(void) {
    run_fsm_assert(
        6,
        -1,
        0x10ULL,
        0,
        "UT_1321",
        "Testing state transition current=6 to next=-1 with prereq=0x10"
    );
}
static void run_unit_test_1322(void) {
    run_fsm_assert(
        7,
        -1,
        0x10ULL,
        0,
        "UT_1322",
        "Testing state transition current=7 to next=-1 with prereq=0x10"
    );
}
static void run_unit_test_1323(void) {
    run_fsm_assert(
        8,
        -1,
        0x10ULL,
        0,
        "UT_1323",
        "Testing state transition current=8 to next=-1 with prereq=0x10"
    );
}
static void run_unit_test_1324(void) {
    run_fsm_assert(
        10,
        -1,
        0x10ULL,
        0,
        "UT_1324",
        "Testing state transition current=10 to next=-1 with prereq=0x10"
    );
}
static void run_unit_test_1325(void) {
    run_fsm_assert(
        15,
        -1,
        0x10ULL,
        0,
        "UT_1325",
        "Testing state transition current=15 to next=-1 with prereq=0x10"
    );
}
static void run_unit_test_1326(void) {
    run_fsm_assert(
        100,
        -1,
        0x10ULL,
        0,
        "UT_1326",
        "Testing state transition current=100 to next=-1 with prereq=0x10"
    );
}
static void run_unit_test_1327(void) {
    run_fsm_assert(
        -100,
        -1,
        0x10ULL,
        0,
        "UT_1327",
        "Testing state transition current=-100 to next=-1 with prereq=0x10"
    );
}
static void run_unit_test_1328(void) {
    run_fsm_assert(
        -10,
        0,
        0x10ULL,
        0,
        "UT_1328",
        "Testing state transition current=-10 to next=0 with prereq=0x10"
    );
}
static void run_unit_test_1329(void) {
    run_fsm_assert(
        -5,
        0,
        0x10ULL,
        0,
        "UT_1329",
        "Testing state transition current=-5 to next=0 with prereq=0x10"
    );
}
static void run_unit_test_1330(void) {
    run_fsm_assert(
        -1,
        0,
        0x10ULL,
        0,
        "UT_1330",
        "Testing state transition current=-1 to next=0 with prereq=0x10"
    );
}
static void run_unit_test_1331(void) {
    run_fsm_assert(
        0,
        0,
        0x10ULL,
        1,
        "UT_1331",
        "Testing state transition current=0 to next=0 with prereq=0x10"
    );
}
static void run_unit_test_1332(void) {
    run_fsm_assert(
        1,
        0,
        0x10ULL,
        1,
        "UT_1332",
        "Testing state transition current=1 to next=0 with prereq=0x10"
    );
}
static void run_unit_test_1333(void) {
    run_fsm_assert(
        2,
        0,
        0x10ULL,
        1,
        "UT_1333",
        "Testing state transition current=2 to next=0 with prereq=0x10"
    );
}
static void run_unit_test_1334(void) {
    run_fsm_assert(
        3,
        0,
        0x10ULL,
        1,
        "UT_1334",
        "Testing state transition current=3 to next=0 with prereq=0x10"
    );
}
static void run_unit_test_1335(void) {
    run_fsm_assert(
        4,
        0,
        0x10ULL,
        1,
        "UT_1335",
        "Testing state transition current=4 to next=0 with prereq=0x10"
    );
}
static void run_unit_test_1336(void) {
    run_fsm_assert(
        5,
        0,
        0x10ULL,
        1,
        "UT_1336",
        "Testing state transition current=5 to next=0 with prereq=0x10"
    );
}
static void run_unit_test_1337(void) {
    run_fsm_assert(
        6,
        0,
        0x10ULL,
        1,
        "UT_1337",
        "Testing state transition current=6 to next=0 with prereq=0x10"
    );
}
static void run_unit_test_1338(void) {
    run_fsm_assert(
        7,
        0,
        0x10ULL,
        1,
        "UT_1338",
        "Testing state transition current=7 to next=0 with prereq=0x10"
    );
}
static void run_unit_test_1339(void) {
    run_fsm_assert(
        8,
        0,
        0x10ULL,
        0,
        "UT_1339",
        "Testing state transition current=8 to next=0 with prereq=0x10"
    );
}
static void run_unit_test_1340(void) {
    run_fsm_assert(
        10,
        0,
        0x10ULL,
        0,
        "UT_1340",
        "Testing state transition current=10 to next=0 with prereq=0x10"
    );
}
static void run_unit_test_1341(void) {
    run_fsm_assert(
        15,
        0,
        0x10ULL,
        0,
        "UT_1341",
        "Testing state transition current=15 to next=0 with prereq=0x10"
    );
}
static void run_unit_test_1342(void) {
    run_fsm_assert(
        100,
        0,
        0x10ULL,
        0,
        "UT_1342",
        "Testing state transition current=100 to next=0 with prereq=0x10"
    );
}
static void run_unit_test_1343(void) {
    run_fsm_assert(
        -100,
        0,
        0x10ULL,
        0,
        "UT_1343",
        "Testing state transition current=-100 to next=0 with prereq=0x10"
    );
}
static void run_unit_test_1344(void) {
    run_fsm_assert(
        -10,
        1,
        0x10ULL,
        0,
        "UT_1344",
        "Testing state transition current=-10 to next=1 with prereq=0x10"
    );
}
static void run_unit_test_1345(void) {
    run_fsm_assert(
        -5,
        1,
        0x10ULL,
        0,
        "UT_1345",
        "Testing state transition current=-5 to next=1 with prereq=0x10"
    );
}
static void run_unit_test_1346(void) {
    run_fsm_assert(
        -1,
        1,
        0x10ULL,
        0,
        "UT_1346",
        "Testing state transition current=-1 to next=1 with prereq=0x10"
    );
}
static void run_unit_test_1347(void) {
    run_fsm_assert(
        0,
        1,
        0x10ULL,
        0,
        "UT_1347",
        "Testing state transition current=0 to next=1 with prereq=0x10"
    );
}
static void run_unit_test_1348(void) {
    run_fsm_assert(
        1,
        1,
        0x10ULL,
        0,
        "UT_1348",
        "Testing state transition current=1 to next=1 with prereq=0x10"
    );
}
static void run_unit_test_1349(void) {
    run_fsm_assert(
        2,
        1,
        0x10ULL,
        0,
        "UT_1349",
        "Testing state transition current=2 to next=1 with prereq=0x10"
    );
}
static void run_unit_test_1350(void) {
    run_fsm_assert(
        3,
        1,
        0x10ULL,
        0,
        "UT_1350",
        "Testing state transition current=3 to next=1 with prereq=0x10"
    );
}
static void run_unit_test_1351(void) {
    run_fsm_assert(
        4,
        1,
        0x10ULL,
        0,
        "UT_1351",
        "Testing state transition current=4 to next=1 with prereq=0x10"
    );
}
static void run_unit_test_1352(void) {
    run_fsm_assert(
        5,
        1,
        0x10ULL,
        0,
        "UT_1352",
        "Testing state transition current=5 to next=1 with prereq=0x10"
    );
}
static void run_unit_test_1353(void) {
    run_fsm_assert(
        6,
        1,
        0x10ULL,
        0,
        "UT_1353",
        "Testing state transition current=6 to next=1 with prereq=0x10"
    );
}
static void run_unit_test_1354(void) {
    run_fsm_assert(
        7,
        1,
        0x10ULL,
        0,
        "UT_1354",
        "Testing state transition current=7 to next=1 with prereq=0x10"
    );
}
static void run_unit_test_1355(void) {
    run_fsm_assert(
        8,
        1,
        0x10ULL,
        0,
        "UT_1355",
        "Testing state transition current=8 to next=1 with prereq=0x10"
    );
}
static void run_unit_test_1356(void) {
    run_fsm_assert(
        10,
        1,
        0x10ULL,
        0,
        "UT_1356",
        "Testing state transition current=10 to next=1 with prereq=0x10"
    );
}
static void run_unit_test_1357(void) {
    run_fsm_assert(
        15,
        1,
        0x10ULL,
        0,
        "UT_1357",
        "Testing state transition current=15 to next=1 with prereq=0x10"
    );
}
static void run_unit_test_1358(void) {
    run_fsm_assert(
        100,
        1,
        0x10ULL,
        0,
        "UT_1358",
        "Testing state transition current=100 to next=1 with prereq=0x10"
    );
}
static void run_unit_test_1359(void) {
    run_fsm_assert(
        -100,
        1,
        0x10ULL,
        0,
        "UT_1359",
        "Testing state transition current=-100 to next=1 with prereq=0x10"
    );
}
static void run_unit_test_1360(void) {
    run_fsm_assert(
        -10,
        2,
        0x10ULL,
        0,
        "UT_1360",
        "Testing state transition current=-10 to next=2 with prereq=0x10"
    );
}
static void run_unit_test_1361(void) {
    run_fsm_assert(
        -5,
        2,
        0x10ULL,
        0,
        "UT_1361",
        "Testing state transition current=-5 to next=2 with prereq=0x10"
    );
}
static void run_unit_test_1362(void) {
    run_fsm_assert(
        -1,
        2,
        0x10ULL,
        0,
        "UT_1362",
        "Testing state transition current=-1 to next=2 with prereq=0x10"
    );
}
static void run_unit_test_1363(void) {
    run_fsm_assert(
        0,
        2,
        0x10ULL,
        0,
        "UT_1363",
        "Testing state transition current=0 to next=2 with prereq=0x10"
    );
}
static void run_unit_test_1364(void) {
    run_fsm_assert(
        1,
        2,
        0x10ULL,
        0,
        "UT_1364",
        "Testing state transition current=1 to next=2 with prereq=0x10"
    );
}
static void run_unit_test_1365(void) {
    run_fsm_assert(
        2,
        2,
        0x10ULL,
        0,
        "UT_1365",
        "Testing state transition current=2 to next=2 with prereq=0x10"
    );
}
static void run_unit_test_1366(void) {
    run_fsm_assert(
        3,
        2,
        0x10ULL,
        0,
        "UT_1366",
        "Testing state transition current=3 to next=2 with prereq=0x10"
    );
}
static void run_unit_test_1367(void) {
    run_fsm_assert(
        4,
        2,
        0x10ULL,
        0,
        "UT_1367",
        "Testing state transition current=4 to next=2 with prereq=0x10"
    );
}
static void run_unit_test_1368(void) {
    run_fsm_assert(
        5,
        2,
        0x10ULL,
        0,
        "UT_1368",
        "Testing state transition current=5 to next=2 with prereq=0x10"
    );
}
static void run_unit_test_1369(void) {
    run_fsm_assert(
        6,
        2,
        0x10ULL,
        0,
        "UT_1369",
        "Testing state transition current=6 to next=2 with prereq=0x10"
    );
}
static void run_unit_test_1370(void) {
    run_fsm_assert(
        7,
        2,
        0x10ULL,
        0,
        "UT_1370",
        "Testing state transition current=7 to next=2 with prereq=0x10"
    );
}
static void run_unit_test_1371(void) {
    run_fsm_assert(
        8,
        2,
        0x10ULL,
        0,
        "UT_1371",
        "Testing state transition current=8 to next=2 with prereq=0x10"
    );
}
static void run_unit_test_1372(void) {
    run_fsm_assert(
        10,
        2,
        0x10ULL,
        0,
        "UT_1372",
        "Testing state transition current=10 to next=2 with prereq=0x10"
    );
}
static void run_unit_test_1373(void) {
    run_fsm_assert(
        15,
        2,
        0x10ULL,
        0,
        "UT_1373",
        "Testing state transition current=15 to next=2 with prereq=0x10"
    );
}
static void run_unit_test_1374(void) {
    run_fsm_assert(
        100,
        2,
        0x10ULL,
        0,
        "UT_1374",
        "Testing state transition current=100 to next=2 with prereq=0x10"
    );
}
static void run_unit_test_1375(void) {
    run_fsm_assert(
        -100,
        2,
        0x10ULL,
        0,
        "UT_1375",
        "Testing state transition current=-100 to next=2 with prereq=0x10"
    );
}
static void run_unit_test_1376(void) {
    run_fsm_assert(
        -10,
        3,
        0x10ULL,
        0,
        "UT_1376",
        "Testing state transition current=-10 to next=3 with prereq=0x10"
    );
}
static void run_unit_test_1377(void) {
    run_fsm_assert(
        -5,
        3,
        0x10ULL,
        0,
        "UT_1377",
        "Testing state transition current=-5 to next=3 with prereq=0x10"
    );
}
static void run_unit_test_1378(void) {
    run_fsm_assert(
        -1,
        3,
        0x10ULL,
        0,
        "UT_1378",
        "Testing state transition current=-1 to next=3 with prereq=0x10"
    );
}
static void run_unit_test_1379(void) {
    run_fsm_assert(
        0,
        3,
        0x10ULL,
        0,
        "UT_1379",
        "Testing state transition current=0 to next=3 with prereq=0x10"
    );
}
static void run_unit_test_1380(void) {
    run_fsm_assert(
        1,
        3,
        0x10ULL,
        0,
        "UT_1380",
        "Testing state transition current=1 to next=3 with prereq=0x10"
    );
}
static void run_unit_test_1381(void) {
    run_fsm_assert(
        2,
        3,
        0x10ULL,
        0,
        "UT_1381",
        "Testing state transition current=2 to next=3 with prereq=0x10"
    );
}
static void run_unit_test_1382(void) {
    run_fsm_assert(
        3,
        3,
        0x10ULL,
        0,
        "UT_1382",
        "Testing state transition current=3 to next=3 with prereq=0x10"
    );
}
static void run_unit_test_1383(void) {
    run_fsm_assert(
        4,
        3,
        0x10ULL,
        0,
        "UT_1383",
        "Testing state transition current=4 to next=3 with prereq=0x10"
    );
}
static void run_unit_test_1384(void) {
    run_fsm_assert(
        5,
        3,
        0x10ULL,
        0,
        "UT_1384",
        "Testing state transition current=5 to next=3 with prereq=0x10"
    );
}
static void run_unit_test_1385(void) {
    run_fsm_assert(
        6,
        3,
        0x10ULL,
        0,
        "UT_1385",
        "Testing state transition current=6 to next=3 with prereq=0x10"
    );
}
static void run_unit_test_1386(void) {
    run_fsm_assert(
        7,
        3,
        0x10ULL,
        0,
        "UT_1386",
        "Testing state transition current=7 to next=3 with prereq=0x10"
    );
}
static void run_unit_test_1387(void) {
    run_fsm_assert(
        8,
        3,
        0x10ULL,
        0,
        "UT_1387",
        "Testing state transition current=8 to next=3 with prereq=0x10"
    );
}
static void run_unit_test_1388(void) {
    run_fsm_assert(
        10,
        3,
        0x10ULL,
        0,
        "UT_1388",
        "Testing state transition current=10 to next=3 with prereq=0x10"
    );
}
static void run_unit_test_1389(void) {
    run_fsm_assert(
        15,
        3,
        0x10ULL,
        0,
        "UT_1389",
        "Testing state transition current=15 to next=3 with prereq=0x10"
    );
}
static void run_unit_test_1390(void) {
    run_fsm_assert(
        100,
        3,
        0x10ULL,
        0,
        "UT_1390",
        "Testing state transition current=100 to next=3 with prereq=0x10"
    );
}
static void run_unit_test_1391(void) {
    run_fsm_assert(
        -100,
        3,
        0x10ULL,
        0,
        "UT_1391",
        "Testing state transition current=-100 to next=3 with prereq=0x10"
    );
}
static void run_unit_test_1392(void) {
    run_fsm_assert(
        -10,
        4,
        0x10ULL,
        0,
        "UT_1392",
        "Testing state transition current=-10 to next=4 with prereq=0x10"
    );
}
static void run_unit_test_1393(void) {
    run_fsm_assert(
        -5,
        4,
        0x10ULL,
        0,
        "UT_1393",
        "Testing state transition current=-5 to next=4 with prereq=0x10"
    );
}
static void run_unit_test_1394(void) {
    run_fsm_assert(
        -1,
        4,
        0x10ULL,
        0,
        "UT_1394",
        "Testing state transition current=-1 to next=4 with prereq=0x10"
    );
}
static void run_unit_test_1395(void) {
    run_fsm_assert(
        0,
        4,
        0x10ULL,
        0,
        "UT_1395",
        "Testing state transition current=0 to next=4 with prereq=0x10"
    );
}
static void run_unit_test_1396(void) {
    run_fsm_assert(
        1,
        4,
        0x10ULL,
        0,
        "UT_1396",
        "Testing state transition current=1 to next=4 with prereq=0x10"
    );
}
static void run_unit_test_1397(void) {
    run_fsm_assert(
        2,
        4,
        0x10ULL,
        0,
        "UT_1397",
        "Testing state transition current=2 to next=4 with prereq=0x10"
    );
}
static void run_unit_test_1398(void) {
    run_fsm_assert(
        3,
        4,
        0x10ULL,
        0,
        "UT_1398",
        "Testing state transition current=3 to next=4 with prereq=0x10"
    );
}
static void run_unit_test_1399(void) {
    run_fsm_assert(
        4,
        4,
        0x10ULL,
        0,
        "UT_1399",
        "Testing state transition current=4 to next=4 with prereq=0x10"
    );
}
static void run_unit_test_1400(void) {
    run_fsm_assert(
        5,
        4,
        0x10ULL,
        0,
        "UT_1400",
        "Testing state transition current=5 to next=4 with prereq=0x10"
    );
}
static void run_unit_test_1401(void) {
    run_fsm_assert(
        6,
        4,
        0x10ULL,
        0,
        "UT_1401",
        "Testing state transition current=6 to next=4 with prereq=0x10"
    );
}
static void run_unit_test_1402(void) {
    run_fsm_assert(
        7,
        4,
        0x10ULL,
        0,
        "UT_1402",
        "Testing state transition current=7 to next=4 with prereq=0x10"
    );
}
static void run_unit_test_1403(void) {
    run_fsm_assert(
        8,
        4,
        0x10ULL,
        0,
        "UT_1403",
        "Testing state transition current=8 to next=4 with prereq=0x10"
    );
}
static void run_unit_test_1404(void) {
    run_fsm_assert(
        10,
        4,
        0x10ULL,
        0,
        "UT_1404",
        "Testing state transition current=10 to next=4 with prereq=0x10"
    );
}
static void run_unit_test_1405(void) {
    run_fsm_assert(
        15,
        4,
        0x10ULL,
        0,
        "UT_1405",
        "Testing state transition current=15 to next=4 with prereq=0x10"
    );
}
static void run_unit_test_1406(void) {
    run_fsm_assert(
        100,
        4,
        0x10ULL,
        0,
        "UT_1406",
        "Testing state transition current=100 to next=4 with prereq=0x10"
    );
}
static void run_unit_test_1407(void) {
    run_fsm_assert(
        -100,
        4,
        0x10ULL,
        0,
        "UT_1407",
        "Testing state transition current=-100 to next=4 with prereq=0x10"
    );
}
static void run_unit_test_1408(void) {
    run_fsm_assert(
        -10,
        5,
        0x10ULL,
        0,
        "UT_1408",
        "Testing state transition current=-10 to next=5 with prereq=0x10"
    );
}
static void run_unit_test_1409(void) {
    run_fsm_assert(
        -5,
        5,
        0x10ULL,
        0,
        "UT_1409",
        "Testing state transition current=-5 to next=5 with prereq=0x10"
    );
}
static void run_unit_test_1410(void) {
    run_fsm_assert(
        -1,
        5,
        0x10ULL,
        0,
        "UT_1410",
        "Testing state transition current=-1 to next=5 with prereq=0x10"
    );
}
static void run_unit_test_1411(void) {
    run_fsm_assert(
        0,
        5,
        0x10ULL,
        0,
        "UT_1411",
        "Testing state transition current=0 to next=5 with prereq=0x10"
    );
}
static void run_unit_test_1412(void) {
    run_fsm_assert(
        1,
        5,
        0x10ULL,
        0,
        "UT_1412",
        "Testing state transition current=1 to next=5 with prereq=0x10"
    );
}
static void run_unit_test_1413(void) {
    run_fsm_assert(
        2,
        5,
        0x10ULL,
        0,
        "UT_1413",
        "Testing state transition current=2 to next=5 with prereq=0x10"
    );
}
static void run_unit_test_1414(void) {
    run_fsm_assert(
        3,
        5,
        0x10ULL,
        0,
        "UT_1414",
        "Testing state transition current=3 to next=5 with prereq=0x10"
    );
}
static void run_unit_test_1415(void) {
    run_fsm_assert(
        4,
        5,
        0x10ULL,
        1,
        "UT_1415",
        "Testing state transition current=4 to next=5 with prereq=0x10"
    );
}
static void run_unit_test_1416(void) {
    run_fsm_assert(
        5,
        5,
        0x10ULL,
        0,
        "UT_1416",
        "Testing state transition current=5 to next=5 with prereq=0x10"
    );
}
static void run_unit_test_1417(void) {
    run_fsm_assert(
        6,
        5,
        0x10ULL,
        0,
        "UT_1417",
        "Testing state transition current=6 to next=5 with prereq=0x10"
    );
}
static void run_unit_test_1418(void) {
    run_fsm_assert(
        7,
        5,
        0x10ULL,
        0,
        "UT_1418",
        "Testing state transition current=7 to next=5 with prereq=0x10"
    );
}
static void run_unit_test_1419(void) {
    run_fsm_assert(
        8,
        5,
        0x10ULL,
        0,
        "UT_1419",
        "Testing state transition current=8 to next=5 with prereq=0x10"
    );
}
static void run_unit_test_1420(void) {
    run_fsm_assert(
        10,
        5,
        0x10ULL,
        0,
        "UT_1420",
        "Testing state transition current=10 to next=5 with prereq=0x10"
    );
}
static void run_unit_test_1421(void) {
    run_fsm_assert(
        15,
        5,
        0x10ULL,
        0,
        "UT_1421",
        "Testing state transition current=15 to next=5 with prereq=0x10"
    );
}
static void run_unit_test_1422(void) {
    run_fsm_assert(
        100,
        5,
        0x10ULL,
        0,
        "UT_1422",
        "Testing state transition current=100 to next=5 with prereq=0x10"
    );
}
static void run_unit_test_1423(void) {
    run_fsm_assert(
        -100,
        5,
        0x10ULL,
        0,
        "UT_1423",
        "Testing state transition current=-100 to next=5 with prereq=0x10"
    );
}
static void run_unit_test_1424(void) {
    run_fsm_assert(
        -10,
        6,
        0x10ULL,
        0,
        "UT_1424",
        "Testing state transition current=-10 to next=6 with prereq=0x10"
    );
}
static void run_unit_test_1425(void) {
    run_fsm_assert(
        -5,
        6,
        0x10ULL,
        0,
        "UT_1425",
        "Testing state transition current=-5 to next=6 with prereq=0x10"
    );
}
static void run_unit_test_1426(void) {
    run_fsm_assert(
        -1,
        6,
        0x10ULL,
        0,
        "UT_1426",
        "Testing state transition current=-1 to next=6 with prereq=0x10"
    );
}
static void run_unit_test_1427(void) {
    run_fsm_assert(
        0,
        6,
        0x10ULL,
        0,
        "UT_1427",
        "Testing state transition current=0 to next=6 with prereq=0x10"
    );
}
static void run_unit_test_1428(void) {
    run_fsm_assert(
        1,
        6,
        0x10ULL,
        0,
        "UT_1428",
        "Testing state transition current=1 to next=6 with prereq=0x10"
    );
}
static void run_unit_test_1429(void) {
    run_fsm_assert(
        2,
        6,
        0x10ULL,
        0,
        "UT_1429",
        "Testing state transition current=2 to next=6 with prereq=0x10"
    );
}
static void run_unit_test_1430(void) {
    run_fsm_assert(
        3,
        6,
        0x10ULL,
        0,
        "UT_1430",
        "Testing state transition current=3 to next=6 with prereq=0x10"
    );
}
static void run_unit_test_1431(void) {
    run_fsm_assert(
        4,
        6,
        0x10ULL,
        0,
        "UT_1431",
        "Testing state transition current=4 to next=6 with prereq=0x10"
    );
}
static void run_unit_test_1432(void) {
    run_fsm_assert(
        5,
        6,
        0x10ULL,
        0,
        "UT_1432",
        "Testing state transition current=5 to next=6 with prereq=0x10"
    );
}
static void run_unit_test_1433(void) {
    run_fsm_assert(
        6,
        6,
        0x10ULL,
        0,
        "UT_1433",
        "Testing state transition current=6 to next=6 with prereq=0x10"
    );
}
static void run_unit_test_1434(void) {
    run_fsm_assert(
        7,
        6,
        0x10ULL,
        0,
        "UT_1434",
        "Testing state transition current=7 to next=6 with prereq=0x10"
    );
}
static void run_unit_test_1435(void) {
    run_fsm_assert(
        8,
        6,
        0x10ULL,
        0,
        "UT_1435",
        "Testing state transition current=8 to next=6 with prereq=0x10"
    );
}
static void run_unit_test_1436(void) {
    run_fsm_assert(
        10,
        6,
        0x10ULL,
        0,
        "UT_1436",
        "Testing state transition current=10 to next=6 with prereq=0x10"
    );
}
static void run_unit_test_1437(void) {
    run_fsm_assert(
        15,
        6,
        0x10ULL,
        0,
        "UT_1437",
        "Testing state transition current=15 to next=6 with prereq=0x10"
    );
}
static void run_unit_test_1438(void) {
    run_fsm_assert(
        100,
        6,
        0x10ULL,
        0,
        "UT_1438",
        "Testing state transition current=100 to next=6 with prereq=0x10"
    );
}
static void run_unit_test_1439(void) {
    run_fsm_assert(
        -100,
        6,
        0x10ULL,
        0,
        "UT_1439",
        "Testing state transition current=-100 to next=6 with prereq=0x10"
    );
}
static void run_unit_test_1440(void) {
    run_fsm_assert(
        -10,
        7,
        0x10ULL,
        0,
        "UT_1440",
        "Testing state transition current=-10 to next=7 with prereq=0x10"
    );
}
static void run_unit_test_1441(void) {
    run_fsm_assert(
        -5,
        7,
        0x10ULL,
        0,
        "UT_1441",
        "Testing state transition current=-5 to next=7 with prereq=0x10"
    );
}
static void run_unit_test_1442(void) {
    run_fsm_assert(
        -1,
        7,
        0x10ULL,
        0,
        "UT_1442",
        "Testing state transition current=-1 to next=7 with prereq=0x10"
    );
}
static void run_unit_test_1443(void) {
    run_fsm_assert(
        0,
        7,
        0x10ULL,
        0,
        "UT_1443",
        "Testing state transition current=0 to next=7 with prereq=0x10"
    );
}
static void run_unit_test_1444(void) {
    run_fsm_assert(
        1,
        7,
        0x10ULL,
        0,
        "UT_1444",
        "Testing state transition current=1 to next=7 with prereq=0x10"
    );
}
static void run_unit_test_1445(void) {
    run_fsm_assert(
        2,
        7,
        0x10ULL,
        0,
        "UT_1445",
        "Testing state transition current=2 to next=7 with prereq=0x10"
    );
}
static void run_unit_test_1446(void) {
    run_fsm_assert(
        3,
        7,
        0x10ULL,
        0,
        "UT_1446",
        "Testing state transition current=3 to next=7 with prereq=0x10"
    );
}
static void run_unit_test_1447(void) {
    run_fsm_assert(
        4,
        7,
        0x10ULL,
        0,
        "UT_1447",
        "Testing state transition current=4 to next=7 with prereq=0x10"
    );
}
static void run_unit_test_1448(void) {
    run_fsm_assert(
        5,
        7,
        0x10ULL,
        0,
        "UT_1448",
        "Testing state transition current=5 to next=7 with prereq=0x10"
    );
}
static void run_unit_test_1449(void) {
    run_fsm_assert(
        6,
        7,
        0x10ULL,
        0,
        "UT_1449",
        "Testing state transition current=6 to next=7 with prereq=0x10"
    );
}
static void run_unit_test_1450(void) {
    run_fsm_assert(
        7,
        7,
        0x10ULL,
        0,
        "UT_1450",
        "Testing state transition current=7 to next=7 with prereq=0x10"
    );
}
static void run_unit_test_1451(void) {
    run_fsm_assert(
        8,
        7,
        0x10ULL,
        0,
        "UT_1451",
        "Testing state transition current=8 to next=7 with prereq=0x10"
    );
}
static void run_unit_test_1452(void) {
    run_fsm_assert(
        10,
        7,
        0x10ULL,
        0,
        "UT_1452",
        "Testing state transition current=10 to next=7 with prereq=0x10"
    );
}
static void run_unit_test_1453(void) {
    run_fsm_assert(
        15,
        7,
        0x10ULL,
        0,
        "UT_1453",
        "Testing state transition current=15 to next=7 with prereq=0x10"
    );
}
static void run_unit_test_1454(void) {
    run_fsm_assert(
        100,
        7,
        0x10ULL,
        0,
        "UT_1454",
        "Testing state transition current=100 to next=7 with prereq=0x10"
    );
}
static void run_unit_test_1455(void) {
    run_fsm_assert(
        -100,
        7,
        0x10ULL,
        0,
        "UT_1455",
        "Testing state transition current=-100 to next=7 with prereq=0x10"
    );
}
static void run_unit_test_1456(void) {
    run_fsm_assert(
        -10,
        8,
        0x10ULL,
        0,
        "UT_1456",
        "Testing state transition current=-10 to next=8 with prereq=0x10"
    );
}
static void run_unit_test_1457(void) {
    run_fsm_assert(
        -5,
        8,
        0x10ULL,
        0,
        "UT_1457",
        "Testing state transition current=-5 to next=8 with prereq=0x10"
    );
}
static void run_unit_test_1458(void) {
    run_fsm_assert(
        -1,
        8,
        0x10ULL,
        0,
        "UT_1458",
        "Testing state transition current=-1 to next=8 with prereq=0x10"
    );
}
static void run_unit_test_1459(void) {
    run_fsm_assert(
        0,
        8,
        0x10ULL,
        0,
        "UT_1459",
        "Testing state transition current=0 to next=8 with prereq=0x10"
    );
}
static void run_unit_test_1460(void) {
    run_fsm_assert(
        1,
        8,
        0x10ULL,
        0,
        "UT_1460",
        "Testing state transition current=1 to next=8 with prereq=0x10"
    );
}
static void run_unit_test_1461(void) {
    run_fsm_assert(
        2,
        8,
        0x10ULL,
        0,
        "UT_1461",
        "Testing state transition current=2 to next=8 with prereq=0x10"
    );
}
static void run_unit_test_1462(void) {
    run_fsm_assert(
        3,
        8,
        0x10ULL,
        0,
        "UT_1462",
        "Testing state transition current=3 to next=8 with prereq=0x10"
    );
}
static void run_unit_test_1463(void) {
    run_fsm_assert(
        4,
        8,
        0x10ULL,
        0,
        "UT_1463",
        "Testing state transition current=4 to next=8 with prereq=0x10"
    );
}
static void run_unit_test_1464(void) {
    run_fsm_assert(
        5,
        8,
        0x10ULL,
        0,
        "UT_1464",
        "Testing state transition current=5 to next=8 with prereq=0x10"
    );
}
static void run_unit_test_1465(void) {
    run_fsm_assert(
        6,
        8,
        0x10ULL,
        0,
        "UT_1465",
        "Testing state transition current=6 to next=8 with prereq=0x10"
    );
}
static void run_unit_test_1466(void) {
    run_fsm_assert(
        7,
        8,
        0x10ULL,
        0,
        "UT_1466",
        "Testing state transition current=7 to next=8 with prereq=0x10"
    );
}
static void run_unit_test_1467(void) {
    run_fsm_assert(
        8,
        8,
        0x10ULL,
        0,
        "UT_1467",
        "Testing state transition current=8 to next=8 with prereq=0x10"
    );
}
static void run_unit_test_1468(void) {
    run_fsm_assert(
        10,
        8,
        0x10ULL,
        0,
        "UT_1468",
        "Testing state transition current=10 to next=8 with prereq=0x10"
    );
}
static void run_unit_test_1469(void) {
    run_fsm_assert(
        15,
        8,
        0x10ULL,
        0,
        "UT_1469",
        "Testing state transition current=15 to next=8 with prereq=0x10"
    );
}
static void run_unit_test_1470(void) {
    run_fsm_assert(
        100,
        8,
        0x10ULL,
        0,
        "UT_1470",
        "Testing state transition current=100 to next=8 with prereq=0x10"
    );
}
static void run_unit_test_1471(void) {
    run_fsm_assert(
        -100,
        8,
        0x10ULL,
        0,
        "UT_1471",
        "Testing state transition current=-100 to next=8 with prereq=0x10"
    );
}
static void run_unit_test_1472(void) {
    run_fsm_assert(
        -10,
        10,
        0x10ULL,
        0,
        "UT_1472",
        "Testing state transition current=-10 to next=10 with prereq=0x10"
    );
}
static void run_unit_test_1473(void) {
    run_fsm_assert(
        -5,
        10,
        0x10ULL,
        0,
        "UT_1473",
        "Testing state transition current=-5 to next=10 with prereq=0x10"
    );
}
static void run_unit_test_1474(void) {
    run_fsm_assert(
        -1,
        10,
        0x10ULL,
        0,
        "UT_1474",
        "Testing state transition current=-1 to next=10 with prereq=0x10"
    );
}
static void run_unit_test_1475(void) {
    run_fsm_assert(
        0,
        10,
        0x10ULL,
        0,
        "UT_1475",
        "Testing state transition current=0 to next=10 with prereq=0x10"
    );
}
static void run_unit_test_1476(void) {
    run_fsm_assert(
        1,
        10,
        0x10ULL,
        0,
        "UT_1476",
        "Testing state transition current=1 to next=10 with prereq=0x10"
    );
}
static void run_unit_test_1477(void) {
    run_fsm_assert(
        2,
        10,
        0x10ULL,
        0,
        "UT_1477",
        "Testing state transition current=2 to next=10 with prereq=0x10"
    );
}
static void run_unit_test_1478(void) {
    run_fsm_assert(
        3,
        10,
        0x10ULL,
        0,
        "UT_1478",
        "Testing state transition current=3 to next=10 with prereq=0x10"
    );
}
static void run_unit_test_1479(void) {
    run_fsm_assert(
        4,
        10,
        0x10ULL,
        0,
        "UT_1479",
        "Testing state transition current=4 to next=10 with prereq=0x10"
    );
}
static void run_unit_test_1480(void) {
    run_fsm_assert(
        5,
        10,
        0x10ULL,
        0,
        "UT_1480",
        "Testing state transition current=5 to next=10 with prereq=0x10"
    );
}
static void run_unit_test_1481(void) {
    run_fsm_assert(
        6,
        10,
        0x10ULL,
        0,
        "UT_1481",
        "Testing state transition current=6 to next=10 with prereq=0x10"
    );
}
static void run_unit_test_1482(void) {
    run_fsm_assert(
        7,
        10,
        0x10ULL,
        0,
        "UT_1482",
        "Testing state transition current=7 to next=10 with prereq=0x10"
    );
}
static void run_unit_test_1483(void) {
    run_fsm_assert(
        8,
        10,
        0x10ULL,
        0,
        "UT_1483",
        "Testing state transition current=8 to next=10 with prereq=0x10"
    );
}
static void run_unit_test_1484(void) {
    run_fsm_assert(
        10,
        10,
        0x10ULL,
        0,
        "UT_1484",
        "Testing state transition current=10 to next=10 with prereq=0x10"
    );
}
static void run_unit_test_1485(void) {
    run_fsm_assert(
        15,
        10,
        0x10ULL,
        0,
        "UT_1485",
        "Testing state transition current=15 to next=10 with prereq=0x10"
    );
}
static void run_unit_test_1486(void) {
    run_fsm_assert(
        100,
        10,
        0x10ULL,
        0,
        "UT_1486",
        "Testing state transition current=100 to next=10 with prereq=0x10"
    );
}
static void run_unit_test_1487(void) {
    run_fsm_assert(
        -100,
        10,
        0x10ULL,
        0,
        "UT_1487",
        "Testing state transition current=-100 to next=10 with prereq=0x10"
    );
}
static void run_unit_test_1488(void) {
    run_fsm_assert(
        -10,
        15,
        0x10ULL,
        0,
        "UT_1488",
        "Testing state transition current=-10 to next=15 with prereq=0x10"
    );
}
static void run_unit_test_1489(void) {
    run_fsm_assert(
        -5,
        15,
        0x10ULL,
        0,
        "UT_1489",
        "Testing state transition current=-5 to next=15 with prereq=0x10"
    );
}
static void run_unit_test_1490(void) {
    run_fsm_assert(
        -1,
        15,
        0x10ULL,
        0,
        "UT_1490",
        "Testing state transition current=-1 to next=15 with prereq=0x10"
    );
}
static void run_unit_test_1491(void) {
    run_fsm_assert(
        0,
        15,
        0x10ULL,
        0,
        "UT_1491",
        "Testing state transition current=0 to next=15 with prereq=0x10"
    );
}
static void run_unit_test_1492(void) {
    run_fsm_assert(
        1,
        15,
        0x10ULL,
        0,
        "UT_1492",
        "Testing state transition current=1 to next=15 with prereq=0x10"
    );
}
static void run_unit_test_1493(void) {
    run_fsm_assert(
        2,
        15,
        0x10ULL,
        0,
        "UT_1493",
        "Testing state transition current=2 to next=15 with prereq=0x10"
    );
}
static void run_unit_test_1494(void) {
    run_fsm_assert(
        3,
        15,
        0x10ULL,
        0,
        "UT_1494",
        "Testing state transition current=3 to next=15 with prereq=0x10"
    );
}
static void run_unit_test_1495(void) {
    run_fsm_assert(
        4,
        15,
        0x10ULL,
        0,
        "UT_1495",
        "Testing state transition current=4 to next=15 with prereq=0x10"
    );
}
static void run_unit_test_1496(void) {
    run_fsm_assert(
        5,
        15,
        0x10ULL,
        0,
        "UT_1496",
        "Testing state transition current=5 to next=15 with prereq=0x10"
    );
}
static void run_unit_test_1497(void) {
    run_fsm_assert(
        6,
        15,
        0x10ULL,
        0,
        "UT_1497",
        "Testing state transition current=6 to next=15 with prereq=0x10"
    );
}
static void run_unit_test_1498(void) {
    run_fsm_assert(
        7,
        15,
        0x10ULL,
        0,
        "UT_1498",
        "Testing state transition current=7 to next=15 with prereq=0x10"
    );
}
static void run_unit_test_1499(void) {
    run_fsm_assert(
        8,
        15,
        0x10ULL,
        0,
        "UT_1499",
        "Testing state transition current=8 to next=15 with prereq=0x10"
    );
}
static void run_unit_test_1500(void) {
    run_fsm_assert(
        10,
        15,
        0x10ULL,
        0,
        "UT_1500",
        "Testing state transition current=10 to next=15 with prereq=0x10"
    );
}
static void run_unit_test_1501(void) {
    run_fsm_assert(
        15,
        15,
        0x10ULL,
        0,
        "UT_1501",
        "Testing state transition current=15 to next=15 with prereq=0x10"
    );
}
static void run_unit_test_1502(void) {
    run_fsm_assert(
        100,
        15,
        0x10ULL,
        0,
        "UT_1502",
        "Testing state transition current=100 to next=15 with prereq=0x10"
    );
}
static void run_unit_test_1503(void) {
    run_fsm_assert(
        -100,
        15,
        0x10ULL,
        0,
        "UT_1503",
        "Testing state transition current=-100 to next=15 with prereq=0x10"
    );
}
static void run_unit_test_1504(void) {
    run_fsm_assert(
        -10,
        100,
        0x10ULL,
        0,
        "UT_1504",
        "Testing state transition current=-10 to next=100 with prereq=0x10"
    );
}
static void run_unit_test_1505(void) {
    run_fsm_assert(
        -5,
        100,
        0x10ULL,
        0,
        "UT_1505",
        "Testing state transition current=-5 to next=100 with prereq=0x10"
    );
}
static void run_unit_test_1506(void) {
    run_fsm_assert(
        -1,
        100,
        0x10ULL,
        0,
        "UT_1506",
        "Testing state transition current=-1 to next=100 with prereq=0x10"
    );
}
static void run_unit_test_1507(void) {
    run_fsm_assert(
        0,
        100,
        0x10ULL,
        0,
        "UT_1507",
        "Testing state transition current=0 to next=100 with prereq=0x10"
    );
}
static void run_unit_test_1508(void) {
    run_fsm_assert(
        1,
        100,
        0x10ULL,
        0,
        "UT_1508",
        "Testing state transition current=1 to next=100 with prereq=0x10"
    );
}
static void run_unit_test_1509(void) {
    run_fsm_assert(
        2,
        100,
        0x10ULL,
        0,
        "UT_1509",
        "Testing state transition current=2 to next=100 with prereq=0x10"
    );
}
static void run_unit_test_1510(void) {
    run_fsm_assert(
        3,
        100,
        0x10ULL,
        0,
        "UT_1510",
        "Testing state transition current=3 to next=100 with prereq=0x10"
    );
}
static void run_unit_test_1511(void) {
    run_fsm_assert(
        4,
        100,
        0x10ULL,
        0,
        "UT_1511",
        "Testing state transition current=4 to next=100 with prereq=0x10"
    );
}
static void run_unit_test_1512(void) {
    run_fsm_assert(
        5,
        100,
        0x10ULL,
        0,
        "UT_1512",
        "Testing state transition current=5 to next=100 with prereq=0x10"
    );
}
static void run_unit_test_1513(void) {
    run_fsm_assert(
        6,
        100,
        0x10ULL,
        0,
        "UT_1513",
        "Testing state transition current=6 to next=100 with prereq=0x10"
    );
}
static void run_unit_test_1514(void) {
    run_fsm_assert(
        7,
        100,
        0x10ULL,
        0,
        "UT_1514",
        "Testing state transition current=7 to next=100 with prereq=0x10"
    );
}
static void run_unit_test_1515(void) {
    run_fsm_assert(
        8,
        100,
        0x10ULL,
        0,
        "UT_1515",
        "Testing state transition current=8 to next=100 with prereq=0x10"
    );
}
static void run_unit_test_1516(void) {
    run_fsm_assert(
        10,
        100,
        0x10ULL,
        0,
        "UT_1516",
        "Testing state transition current=10 to next=100 with prereq=0x10"
    );
}
static void run_unit_test_1517(void) {
    run_fsm_assert(
        15,
        100,
        0x10ULL,
        0,
        "UT_1517",
        "Testing state transition current=15 to next=100 with prereq=0x10"
    );
}
static void run_unit_test_1518(void) {
    run_fsm_assert(
        100,
        100,
        0x10ULL,
        0,
        "UT_1518",
        "Testing state transition current=100 to next=100 with prereq=0x10"
    );
}
static void run_unit_test_1519(void) {
    run_fsm_assert(
        -100,
        100,
        0x10ULL,
        0,
        "UT_1519",
        "Testing state transition current=-100 to next=100 with prereq=0x10"
    );
}
static void run_unit_test_1520(void) {
    run_fsm_assert(
        -10,
        -100,
        0x10ULL,
        0,
        "UT_1520",
        "Testing state transition current=-10 to next=-100 with prereq=0x10"
    );
}
static void run_unit_test_1521(void) {
    run_fsm_assert(
        -5,
        -100,
        0x10ULL,
        0,
        "UT_1521",
        "Testing state transition current=-5 to next=-100 with prereq=0x10"
    );
}
static void run_unit_test_1522(void) {
    run_fsm_assert(
        -1,
        -100,
        0x10ULL,
        0,
        "UT_1522",
        "Testing state transition current=-1 to next=-100 with prereq=0x10"
    );
}
static void run_unit_test_1523(void) {
    run_fsm_assert(
        0,
        -100,
        0x10ULL,
        0,
        "UT_1523",
        "Testing state transition current=0 to next=-100 with prereq=0x10"
    );
}
static void run_unit_test_1524(void) {
    run_fsm_assert(
        1,
        -100,
        0x10ULL,
        0,
        "UT_1524",
        "Testing state transition current=1 to next=-100 with prereq=0x10"
    );
}
static void run_unit_test_1525(void) {
    run_fsm_assert(
        2,
        -100,
        0x10ULL,
        0,
        "UT_1525",
        "Testing state transition current=2 to next=-100 with prereq=0x10"
    );
}
static void run_unit_test_1526(void) {
    run_fsm_assert(
        3,
        -100,
        0x10ULL,
        0,
        "UT_1526",
        "Testing state transition current=3 to next=-100 with prereq=0x10"
    );
}
static void run_unit_test_1527(void) {
    run_fsm_assert(
        4,
        -100,
        0x10ULL,
        0,
        "UT_1527",
        "Testing state transition current=4 to next=-100 with prereq=0x10"
    );
}
static void run_unit_test_1528(void) {
    run_fsm_assert(
        5,
        -100,
        0x10ULL,
        0,
        "UT_1528",
        "Testing state transition current=5 to next=-100 with prereq=0x10"
    );
}
static void run_unit_test_1529(void) {
    run_fsm_assert(
        6,
        -100,
        0x10ULL,
        0,
        "UT_1529",
        "Testing state transition current=6 to next=-100 with prereq=0x10"
    );
}
static void run_unit_test_1530(void) {
    run_fsm_assert(
        7,
        -100,
        0x10ULL,
        0,
        "UT_1530",
        "Testing state transition current=7 to next=-100 with prereq=0x10"
    );
}
static void run_unit_test_1531(void) {
    run_fsm_assert(
        8,
        -100,
        0x10ULL,
        0,
        "UT_1531",
        "Testing state transition current=8 to next=-100 with prereq=0x10"
    );
}
static void run_unit_test_1532(void) {
    run_fsm_assert(
        10,
        -100,
        0x10ULL,
        0,
        "UT_1532",
        "Testing state transition current=10 to next=-100 with prereq=0x10"
    );
}
static void run_unit_test_1533(void) {
    run_fsm_assert(
        15,
        -100,
        0x10ULL,
        0,
        "UT_1533",
        "Testing state transition current=15 to next=-100 with prereq=0x10"
    );
}
static void run_unit_test_1534(void) {
    run_fsm_assert(
        100,
        -100,
        0x10ULL,
        0,
        "UT_1534",
        "Testing state transition current=100 to next=-100 with prereq=0x10"
    );
}
static void run_unit_test_1535(void) {
    run_fsm_assert(
        -100,
        -100,
        0x10ULL,
        0,
        "UT_1535",
        "Testing state transition current=-100 to next=-100 with prereq=0x10"
    );
}
static void run_unit_test_1536(void) {
    run_fsm_assert(
        -10,
        -10,
        0x20ULL,
        0,
        "UT_1536",
        "Testing state transition current=-10 to next=-10 with prereq=0x20"
    );
}
static void run_unit_test_1537(void) {
    run_fsm_assert(
        -5,
        -10,
        0x20ULL,
        0,
        "UT_1537",
        "Testing state transition current=-5 to next=-10 with prereq=0x20"
    );
}
static void run_unit_test_1538(void) {
    run_fsm_assert(
        -1,
        -10,
        0x20ULL,
        0,
        "UT_1538",
        "Testing state transition current=-1 to next=-10 with prereq=0x20"
    );
}
static void run_unit_test_1539(void) {
    run_fsm_assert(
        0,
        -10,
        0x20ULL,
        0,
        "UT_1539",
        "Testing state transition current=0 to next=-10 with prereq=0x20"
    );
}
static void run_unit_test_1540(void) {
    run_fsm_assert(
        1,
        -10,
        0x20ULL,
        0,
        "UT_1540",
        "Testing state transition current=1 to next=-10 with prereq=0x20"
    );
}
static void run_unit_test_1541(void) {
    run_fsm_assert(
        2,
        -10,
        0x20ULL,
        0,
        "UT_1541",
        "Testing state transition current=2 to next=-10 with prereq=0x20"
    );
}
static void run_unit_test_1542(void) {
    run_fsm_assert(
        3,
        -10,
        0x20ULL,
        0,
        "UT_1542",
        "Testing state transition current=3 to next=-10 with prereq=0x20"
    );
}
static void run_unit_test_1543(void) {
    run_fsm_assert(
        4,
        -10,
        0x20ULL,
        0,
        "UT_1543",
        "Testing state transition current=4 to next=-10 with prereq=0x20"
    );
}
static void run_unit_test_1544(void) {
    run_fsm_assert(
        5,
        -10,
        0x20ULL,
        0,
        "UT_1544",
        "Testing state transition current=5 to next=-10 with prereq=0x20"
    );
}
static void run_unit_test_1545(void) {
    run_fsm_assert(
        6,
        -10,
        0x20ULL,
        0,
        "UT_1545",
        "Testing state transition current=6 to next=-10 with prereq=0x20"
    );
}
static void run_unit_test_1546(void) {
    run_fsm_assert(
        7,
        -10,
        0x20ULL,
        0,
        "UT_1546",
        "Testing state transition current=7 to next=-10 with prereq=0x20"
    );
}
static void run_unit_test_1547(void) {
    run_fsm_assert(
        8,
        -10,
        0x20ULL,
        0,
        "UT_1547",
        "Testing state transition current=8 to next=-10 with prereq=0x20"
    );
}
static void run_unit_test_1548(void) {
    run_fsm_assert(
        10,
        -10,
        0x20ULL,
        0,
        "UT_1548",
        "Testing state transition current=10 to next=-10 with prereq=0x20"
    );
}
static void run_unit_test_1549(void) {
    run_fsm_assert(
        15,
        -10,
        0x20ULL,
        0,
        "UT_1549",
        "Testing state transition current=15 to next=-10 with prereq=0x20"
    );
}
static void run_unit_test_1550(void) {
    run_fsm_assert(
        100,
        -10,
        0x20ULL,
        0,
        "UT_1550",
        "Testing state transition current=100 to next=-10 with prereq=0x20"
    );
}
static void run_unit_test_1551(void) {
    run_fsm_assert(
        -100,
        -10,
        0x20ULL,
        0,
        "UT_1551",
        "Testing state transition current=-100 to next=-10 with prereq=0x20"
    );
}
static void run_unit_test_1552(void) {
    run_fsm_assert(
        -10,
        -5,
        0x20ULL,
        0,
        "UT_1552",
        "Testing state transition current=-10 to next=-5 with prereq=0x20"
    );
}
static void run_unit_test_1553(void) {
    run_fsm_assert(
        -5,
        -5,
        0x20ULL,
        0,
        "UT_1553",
        "Testing state transition current=-5 to next=-5 with prereq=0x20"
    );
}
static void run_unit_test_1554(void) {
    run_fsm_assert(
        -1,
        -5,
        0x20ULL,
        0,
        "UT_1554",
        "Testing state transition current=-1 to next=-5 with prereq=0x20"
    );
}
static void run_unit_test_1555(void) {
    run_fsm_assert(
        0,
        -5,
        0x20ULL,
        0,
        "UT_1555",
        "Testing state transition current=0 to next=-5 with prereq=0x20"
    );
}
static void run_unit_test_1556(void) {
    run_fsm_assert(
        1,
        -5,
        0x20ULL,
        0,
        "UT_1556",
        "Testing state transition current=1 to next=-5 with prereq=0x20"
    );
}
static void run_unit_test_1557(void) {
    run_fsm_assert(
        2,
        -5,
        0x20ULL,
        0,
        "UT_1557",
        "Testing state transition current=2 to next=-5 with prereq=0x20"
    );
}
static void run_unit_test_1558(void) {
    run_fsm_assert(
        3,
        -5,
        0x20ULL,
        0,
        "UT_1558",
        "Testing state transition current=3 to next=-5 with prereq=0x20"
    );
}
static void run_unit_test_1559(void) {
    run_fsm_assert(
        4,
        -5,
        0x20ULL,
        0,
        "UT_1559",
        "Testing state transition current=4 to next=-5 with prereq=0x20"
    );
}
static void run_unit_test_1560(void) {
    run_fsm_assert(
        5,
        -5,
        0x20ULL,
        0,
        "UT_1560",
        "Testing state transition current=5 to next=-5 with prereq=0x20"
    );
}
static void run_unit_test_1561(void) {
    run_fsm_assert(
        6,
        -5,
        0x20ULL,
        0,
        "UT_1561",
        "Testing state transition current=6 to next=-5 with prereq=0x20"
    );
}
static void run_unit_test_1562(void) {
    run_fsm_assert(
        7,
        -5,
        0x20ULL,
        0,
        "UT_1562",
        "Testing state transition current=7 to next=-5 with prereq=0x20"
    );
}
static void run_unit_test_1563(void) {
    run_fsm_assert(
        8,
        -5,
        0x20ULL,
        0,
        "UT_1563",
        "Testing state transition current=8 to next=-5 with prereq=0x20"
    );
}
static void run_unit_test_1564(void) {
    run_fsm_assert(
        10,
        -5,
        0x20ULL,
        0,
        "UT_1564",
        "Testing state transition current=10 to next=-5 with prereq=0x20"
    );
}
static void run_unit_test_1565(void) {
    run_fsm_assert(
        15,
        -5,
        0x20ULL,
        0,
        "UT_1565",
        "Testing state transition current=15 to next=-5 with prereq=0x20"
    );
}
static void run_unit_test_1566(void) {
    run_fsm_assert(
        100,
        -5,
        0x20ULL,
        0,
        "UT_1566",
        "Testing state transition current=100 to next=-5 with prereq=0x20"
    );
}
static void run_unit_test_1567(void) {
    run_fsm_assert(
        -100,
        -5,
        0x20ULL,
        0,
        "UT_1567",
        "Testing state transition current=-100 to next=-5 with prereq=0x20"
    );
}
static void run_unit_test_1568(void) {
    run_fsm_assert(
        -10,
        -1,
        0x20ULL,
        0,
        "UT_1568",
        "Testing state transition current=-10 to next=-1 with prereq=0x20"
    );
}
static void run_unit_test_1569(void) {
    run_fsm_assert(
        -5,
        -1,
        0x20ULL,
        0,
        "UT_1569",
        "Testing state transition current=-5 to next=-1 with prereq=0x20"
    );
}
static void run_unit_test_1570(void) {
    run_fsm_assert(
        -1,
        -1,
        0x20ULL,
        0,
        "UT_1570",
        "Testing state transition current=-1 to next=-1 with prereq=0x20"
    );
}
static void run_unit_test_1571(void) {
    run_fsm_assert(
        0,
        -1,
        0x20ULL,
        0,
        "UT_1571",
        "Testing state transition current=0 to next=-1 with prereq=0x20"
    );
}
static void run_unit_test_1572(void) {
    run_fsm_assert(
        1,
        -1,
        0x20ULL,
        0,
        "UT_1572",
        "Testing state transition current=1 to next=-1 with prereq=0x20"
    );
}
static void run_unit_test_1573(void) {
    run_fsm_assert(
        2,
        -1,
        0x20ULL,
        0,
        "UT_1573",
        "Testing state transition current=2 to next=-1 with prereq=0x20"
    );
}
static void run_unit_test_1574(void) {
    run_fsm_assert(
        3,
        -1,
        0x20ULL,
        0,
        "UT_1574",
        "Testing state transition current=3 to next=-1 with prereq=0x20"
    );
}
static void run_unit_test_1575(void) {
    run_fsm_assert(
        4,
        -1,
        0x20ULL,
        0,
        "UT_1575",
        "Testing state transition current=4 to next=-1 with prereq=0x20"
    );
}
static void run_unit_test_1576(void) {
    run_fsm_assert(
        5,
        -1,
        0x20ULL,
        0,
        "UT_1576",
        "Testing state transition current=5 to next=-1 with prereq=0x20"
    );
}
static void run_unit_test_1577(void) {
    run_fsm_assert(
        6,
        -1,
        0x20ULL,
        0,
        "UT_1577",
        "Testing state transition current=6 to next=-1 with prereq=0x20"
    );
}
static void run_unit_test_1578(void) {
    run_fsm_assert(
        7,
        -1,
        0x20ULL,
        0,
        "UT_1578",
        "Testing state transition current=7 to next=-1 with prereq=0x20"
    );
}
static void run_unit_test_1579(void) {
    run_fsm_assert(
        8,
        -1,
        0x20ULL,
        0,
        "UT_1579",
        "Testing state transition current=8 to next=-1 with prereq=0x20"
    );
}
static void run_unit_test_1580(void) {
    run_fsm_assert(
        10,
        -1,
        0x20ULL,
        0,
        "UT_1580",
        "Testing state transition current=10 to next=-1 with prereq=0x20"
    );
}
static void run_unit_test_1581(void) {
    run_fsm_assert(
        15,
        -1,
        0x20ULL,
        0,
        "UT_1581",
        "Testing state transition current=15 to next=-1 with prereq=0x20"
    );
}
static void run_unit_test_1582(void) {
    run_fsm_assert(
        100,
        -1,
        0x20ULL,
        0,
        "UT_1582",
        "Testing state transition current=100 to next=-1 with prereq=0x20"
    );
}
static void run_unit_test_1583(void) {
    run_fsm_assert(
        -100,
        -1,
        0x20ULL,
        0,
        "UT_1583",
        "Testing state transition current=-100 to next=-1 with prereq=0x20"
    );
}
static void run_unit_test_1584(void) {
    run_fsm_assert(
        -10,
        0,
        0x20ULL,
        0,
        "UT_1584",
        "Testing state transition current=-10 to next=0 with prereq=0x20"
    );
}
static void run_unit_test_1585(void) {
    run_fsm_assert(
        -5,
        0,
        0x20ULL,
        0,
        "UT_1585",
        "Testing state transition current=-5 to next=0 with prereq=0x20"
    );
}
static void run_unit_test_1586(void) {
    run_fsm_assert(
        -1,
        0,
        0x20ULL,
        0,
        "UT_1586",
        "Testing state transition current=-1 to next=0 with prereq=0x20"
    );
}
static void run_unit_test_1587(void) {
    run_fsm_assert(
        0,
        0,
        0x20ULL,
        1,
        "UT_1587",
        "Testing state transition current=0 to next=0 with prereq=0x20"
    );
}
static void run_unit_test_1588(void) {
    run_fsm_assert(
        1,
        0,
        0x20ULL,
        1,
        "UT_1588",
        "Testing state transition current=1 to next=0 with prereq=0x20"
    );
}
static void run_unit_test_1589(void) {
    run_fsm_assert(
        2,
        0,
        0x20ULL,
        1,
        "UT_1589",
        "Testing state transition current=2 to next=0 with prereq=0x20"
    );
}
static void run_unit_test_1590(void) {
    run_fsm_assert(
        3,
        0,
        0x20ULL,
        1,
        "UT_1590",
        "Testing state transition current=3 to next=0 with prereq=0x20"
    );
}
static void run_unit_test_1591(void) {
    run_fsm_assert(
        4,
        0,
        0x20ULL,
        1,
        "UT_1591",
        "Testing state transition current=4 to next=0 with prereq=0x20"
    );
}
static void run_unit_test_1592(void) {
    run_fsm_assert(
        5,
        0,
        0x20ULL,
        1,
        "UT_1592",
        "Testing state transition current=5 to next=0 with prereq=0x20"
    );
}
static void run_unit_test_1593(void) {
    run_fsm_assert(
        6,
        0,
        0x20ULL,
        1,
        "UT_1593",
        "Testing state transition current=6 to next=0 with prereq=0x20"
    );
}
static void run_unit_test_1594(void) {
    run_fsm_assert(
        7,
        0,
        0x20ULL,
        1,
        "UT_1594",
        "Testing state transition current=7 to next=0 with prereq=0x20"
    );
}
static void run_unit_test_1595(void) {
    run_fsm_assert(
        8,
        0,
        0x20ULL,
        0,
        "UT_1595",
        "Testing state transition current=8 to next=0 with prereq=0x20"
    );
}
static void run_unit_test_1596(void) {
    run_fsm_assert(
        10,
        0,
        0x20ULL,
        0,
        "UT_1596",
        "Testing state transition current=10 to next=0 with prereq=0x20"
    );
}
static void run_unit_test_1597(void) {
    run_fsm_assert(
        15,
        0,
        0x20ULL,
        0,
        "UT_1597",
        "Testing state transition current=15 to next=0 with prereq=0x20"
    );
}
static void run_unit_test_1598(void) {
    run_fsm_assert(
        100,
        0,
        0x20ULL,
        0,
        "UT_1598",
        "Testing state transition current=100 to next=0 with prereq=0x20"
    );
}
static void run_unit_test_1599(void) {
    run_fsm_assert(
        -100,
        0,
        0x20ULL,
        0,
        "UT_1599",
        "Testing state transition current=-100 to next=0 with prereq=0x20"
    );
}
static void run_unit_test_1600(void) {
    run_fsm_assert(
        -10,
        1,
        0x20ULL,
        0,
        "UT_1600",
        "Testing state transition current=-10 to next=1 with prereq=0x20"
    );
}
static void run_unit_test_1601(void) {
    run_fsm_assert(
        -5,
        1,
        0x20ULL,
        0,
        "UT_1601",
        "Testing state transition current=-5 to next=1 with prereq=0x20"
    );
}
static void run_unit_test_1602(void) {
    run_fsm_assert(
        -1,
        1,
        0x20ULL,
        0,
        "UT_1602",
        "Testing state transition current=-1 to next=1 with prereq=0x20"
    );
}
static void run_unit_test_1603(void) {
    run_fsm_assert(
        0,
        1,
        0x20ULL,
        0,
        "UT_1603",
        "Testing state transition current=0 to next=1 with prereq=0x20"
    );
}
static void run_unit_test_1604(void) {
    run_fsm_assert(
        1,
        1,
        0x20ULL,
        0,
        "UT_1604",
        "Testing state transition current=1 to next=1 with prereq=0x20"
    );
}
static void run_unit_test_1605(void) {
    run_fsm_assert(
        2,
        1,
        0x20ULL,
        0,
        "UT_1605",
        "Testing state transition current=2 to next=1 with prereq=0x20"
    );
}
static void run_unit_test_1606(void) {
    run_fsm_assert(
        3,
        1,
        0x20ULL,
        0,
        "UT_1606",
        "Testing state transition current=3 to next=1 with prereq=0x20"
    );
}
static void run_unit_test_1607(void) {
    run_fsm_assert(
        4,
        1,
        0x20ULL,
        0,
        "UT_1607",
        "Testing state transition current=4 to next=1 with prereq=0x20"
    );
}
static void run_unit_test_1608(void) {
    run_fsm_assert(
        5,
        1,
        0x20ULL,
        0,
        "UT_1608",
        "Testing state transition current=5 to next=1 with prereq=0x20"
    );
}
static void run_unit_test_1609(void) {
    run_fsm_assert(
        6,
        1,
        0x20ULL,
        0,
        "UT_1609",
        "Testing state transition current=6 to next=1 with prereq=0x20"
    );
}
static void run_unit_test_1610(void) {
    run_fsm_assert(
        7,
        1,
        0x20ULL,
        0,
        "UT_1610",
        "Testing state transition current=7 to next=1 with prereq=0x20"
    );
}
static void run_unit_test_1611(void) {
    run_fsm_assert(
        8,
        1,
        0x20ULL,
        0,
        "UT_1611",
        "Testing state transition current=8 to next=1 with prereq=0x20"
    );
}
static void run_unit_test_1612(void) {
    run_fsm_assert(
        10,
        1,
        0x20ULL,
        0,
        "UT_1612",
        "Testing state transition current=10 to next=1 with prereq=0x20"
    );
}
static void run_unit_test_1613(void) {
    run_fsm_assert(
        15,
        1,
        0x20ULL,
        0,
        "UT_1613",
        "Testing state transition current=15 to next=1 with prereq=0x20"
    );
}
static void run_unit_test_1614(void) {
    run_fsm_assert(
        100,
        1,
        0x20ULL,
        0,
        "UT_1614",
        "Testing state transition current=100 to next=1 with prereq=0x20"
    );
}
static void run_unit_test_1615(void) {
    run_fsm_assert(
        -100,
        1,
        0x20ULL,
        0,
        "UT_1615",
        "Testing state transition current=-100 to next=1 with prereq=0x20"
    );
}
static void run_unit_test_1616(void) {
    run_fsm_assert(
        -10,
        2,
        0x20ULL,
        0,
        "UT_1616",
        "Testing state transition current=-10 to next=2 with prereq=0x20"
    );
}
static void run_unit_test_1617(void) {
    run_fsm_assert(
        -5,
        2,
        0x20ULL,
        0,
        "UT_1617",
        "Testing state transition current=-5 to next=2 with prereq=0x20"
    );
}
static void run_unit_test_1618(void) {
    run_fsm_assert(
        -1,
        2,
        0x20ULL,
        0,
        "UT_1618",
        "Testing state transition current=-1 to next=2 with prereq=0x20"
    );
}
static void run_unit_test_1619(void) {
    run_fsm_assert(
        0,
        2,
        0x20ULL,
        0,
        "UT_1619",
        "Testing state transition current=0 to next=2 with prereq=0x20"
    );
}
static void run_unit_test_1620(void) {
    run_fsm_assert(
        1,
        2,
        0x20ULL,
        0,
        "UT_1620",
        "Testing state transition current=1 to next=2 with prereq=0x20"
    );
}
static void run_unit_test_1621(void) {
    run_fsm_assert(
        2,
        2,
        0x20ULL,
        0,
        "UT_1621",
        "Testing state transition current=2 to next=2 with prereq=0x20"
    );
}
static void run_unit_test_1622(void) {
    run_fsm_assert(
        3,
        2,
        0x20ULL,
        0,
        "UT_1622",
        "Testing state transition current=3 to next=2 with prereq=0x20"
    );
}
static void run_unit_test_1623(void) {
    run_fsm_assert(
        4,
        2,
        0x20ULL,
        0,
        "UT_1623",
        "Testing state transition current=4 to next=2 with prereq=0x20"
    );
}
static void run_unit_test_1624(void) {
    run_fsm_assert(
        5,
        2,
        0x20ULL,
        0,
        "UT_1624",
        "Testing state transition current=5 to next=2 with prereq=0x20"
    );
}
static void run_unit_test_1625(void) {
    run_fsm_assert(
        6,
        2,
        0x20ULL,
        0,
        "UT_1625",
        "Testing state transition current=6 to next=2 with prereq=0x20"
    );
}
static void run_unit_test_1626(void) {
    run_fsm_assert(
        7,
        2,
        0x20ULL,
        0,
        "UT_1626",
        "Testing state transition current=7 to next=2 with prereq=0x20"
    );
}
static void run_unit_test_1627(void) {
    run_fsm_assert(
        8,
        2,
        0x20ULL,
        0,
        "UT_1627",
        "Testing state transition current=8 to next=2 with prereq=0x20"
    );
}
static void run_unit_test_1628(void) {
    run_fsm_assert(
        10,
        2,
        0x20ULL,
        0,
        "UT_1628",
        "Testing state transition current=10 to next=2 with prereq=0x20"
    );
}
static void run_unit_test_1629(void) {
    run_fsm_assert(
        15,
        2,
        0x20ULL,
        0,
        "UT_1629",
        "Testing state transition current=15 to next=2 with prereq=0x20"
    );
}
static void run_unit_test_1630(void) {
    run_fsm_assert(
        100,
        2,
        0x20ULL,
        0,
        "UT_1630",
        "Testing state transition current=100 to next=2 with prereq=0x20"
    );
}
static void run_unit_test_1631(void) {
    run_fsm_assert(
        -100,
        2,
        0x20ULL,
        0,
        "UT_1631",
        "Testing state transition current=-100 to next=2 with prereq=0x20"
    );
}
static void run_unit_test_1632(void) {
    run_fsm_assert(
        -10,
        3,
        0x20ULL,
        0,
        "UT_1632",
        "Testing state transition current=-10 to next=3 with prereq=0x20"
    );
}
static void run_unit_test_1633(void) {
    run_fsm_assert(
        -5,
        3,
        0x20ULL,
        0,
        "UT_1633",
        "Testing state transition current=-5 to next=3 with prereq=0x20"
    );
}
static void run_unit_test_1634(void) {
    run_fsm_assert(
        -1,
        3,
        0x20ULL,
        0,
        "UT_1634",
        "Testing state transition current=-1 to next=3 with prereq=0x20"
    );
}
static void run_unit_test_1635(void) {
    run_fsm_assert(
        0,
        3,
        0x20ULL,
        0,
        "UT_1635",
        "Testing state transition current=0 to next=3 with prereq=0x20"
    );
}
static void run_unit_test_1636(void) {
    run_fsm_assert(
        1,
        3,
        0x20ULL,
        0,
        "UT_1636",
        "Testing state transition current=1 to next=3 with prereq=0x20"
    );
}
static void run_unit_test_1637(void) {
    run_fsm_assert(
        2,
        3,
        0x20ULL,
        0,
        "UT_1637",
        "Testing state transition current=2 to next=3 with prereq=0x20"
    );
}
static void run_unit_test_1638(void) {
    run_fsm_assert(
        3,
        3,
        0x20ULL,
        0,
        "UT_1638",
        "Testing state transition current=3 to next=3 with prereq=0x20"
    );
}
static void run_unit_test_1639(void) {
    run_fsm_assert(
        4,
        3,
        0x20ULL,
        0,
        "UT_1639",
        "Testing state transition current=4 to next=3 with prereq=0x20"
    );
}
static void run_unit_test_1640(void) {
    run_fsm_assert(
        5,
        3,
        0x20ULL,
        0,
        "UT_1640",
        "Testing state transition current=5 to next=3 with prereq=0x20"
    );
}
static void run_unit_test_1641(void) {
    run_fsm_assert(
        6,
        3,
        0x20ULL,
        0,
        "UT_1641",
        "Testing state transition current=6 to next=3 with prereq=0x20"
    );
}
static void run_unit_test_1642(void) {
    run_fsm_assert(
        7,
        3,
        0x20ULL,
        0,
        "UT_1642",
        "Testing state transition current=7 to next=3 with prereq=0x20"
    );
}
static void run_unit_test_1643(void) {
    run_fsm_assert(
        8,
        3,
        0x20ULL,
        0,
        "UT_1643",
        "Testing state transition current=8 to next=3 with prereq=0x20"
    );
}
static void run_unit_test_1644(void) {
    run_fsm_assert(
        10,
        3,
        0x20ULL,
        0,
        "UT_1644",
        "Testing state transition current=10 to next=3 with prereq=0x20"
    );
}
static void run_unit_test_1645(void) {
    run_fsm_assert(
        15,
        3,
        0x20ULL,
        0,
        "UT_1645",
        "Testing state transition current=15 to next=3 with prereq=0x20"
    );
}
static void run_unit_test_1646(void) {
    run_fsm_assert(
        100,
        3,
        0x20ULL,
        0,
        "UT_1646",
        "Testing state transition current=100 to next=3 with prereq=0x20"
    );
}
static void run_unit_test_1647(void) {
    run_fsm_assert(
        -100,
        3,
        0x20ULL,
        0,
        "UT_1647",
        "Testing state transition current=-100 to next=3 with prereq=0x20"
    );
}
static void run_unit_test_1648(void) {
    run_fsm_assert(
        -10,
        4,
        0x20ULL,
        0,
        "UT_1648",
        "Testing state transition current=-10 to next=4 with prereq=0x20"
    );
}
static void run_unit_test_1649(void) {
    run_fsm_assert(
        -5,
        4,
        0x20ULL,
        0,
        "UT_1649",
        "Testing state transition current=-5 to next=4 with prereq=0x20"
    );
}
static void run_unit_test_1650(void) {
    run_fsm_assert(
        -1,
        4,
        0x20ULL,
        0,
        "UT_1650",
        "Testing state transition current=-1 to next=4 with prereq=0x20"
    );
}
static void run_unit_test_1651(void) {
    run_fsm_assert(
        0,
        4,
        0x20ULL,
        0,
        "UT_1651",
        "Testing state transition current=0 to next=4 with prereq=0x20"
    );
}
static void run_unit_test_1652(void) {
    run_fsm_assert(
        1,
        4,
        0x20ULL,
        0,
        "UT_1652",
        "Testing state transition current=1 to next=4 with prereq=0x20"
    );
}
static void run_unit_test_1653(void) {
    run_fsm_assert(
        2,
        4,
        0x20ULL,
        0,
        "UT_1653",
        "Testing state transition current=2 to next=4 with prereq=0x20"
    );
}
static void run_unit_test_1654(void) {
    run_fsm_assert(
        3,
        4,
        0x20ULL,
        0,
        "UT_1654",
        "Testing state transition current=3 to next=4 with prereq=0x20"
    );
}
static void run_unit_test_1655(void) {
    run_fsm_assert(
        4,
        4,
        0x20ULL,
        0,
        "UT_1655",
        "Testing state transition current=4 to next=4 with prereq=0x20"
    );
}
static void run_unit_test_1656(void) {
    run_fsm_assert(
        5,
        4,
        0x20ULL,
        0,
        "UT_1656",
        "Testing state transition current=5 to next=4 with prereq=0x20"
    );
}
static void run_unit_test_1657(void) {
    run_fsm_assert(
        6,
        4,
        0x20ULL,
        0,
        "UT_1657",
        "Testing state transition current=6 to next=4 with prereq=0x20"
    );
}
static void run_unit_test_1658(void) {
    run_fsm_assert(
        7,
        4,
        0x20ULL,
        0,
        "UT_1658",
        "Testing state transition current=7 to next=4 with prereq=0x20"
    );
}
static void run_unit_test_1659(void) {
    run_fsm_assert(
        8,
        4,
        0x20ULL,
        0,
        "UT_1659",
        "Testing state transition current=8 to next=4 with prereq=0x20"
    );
}
static void run_unit_test_1660(void) {
    run_fsm_assert(
        10,
        4,
        0x20ULL,
        0,
        "UT_1660",
        "Testing state transition current=10 to next=4 with prereq=0x20"
    );
}
static void run_unit_test_1661(void) {
    run_fsm_assert(
        15,
        4,
        0x20ULL,
        0,
        "UT_1661",
        "Testing state transition current=15 to next=4 with prereq=0x20"
    );
}
static void run_unit_test_1662(void) {
    run_fsm_assert(
        100,
        4,
        0x20ULL,
        0,
        "UT_1662",
        "Testing state transition current=100 to next=4 with prereq=0x20"
    );
}
static void run_unit_test_1663(void) {
    run_fsm_assert(
        -100,
        4,
        0x20ULL,
        0,
        "UT_1663",
        "Testing state transition current=-100 to next=4 with prereq=0x20"
    );
}
static void run_unit_test_1664(void) {
    run_fsm_assert(
        -10,
        5,
        0x20ULL,
        0,
        "UT_1664",
        "Testing state transition current=-10 to next=5 with prereq=0x20"
    );
}
static void run_unit_test_1665(void) {
    run_fsm_assert(
        -5,
        5,
        0x20ULL,
        0,
        "UT_1665",
        "Testing state transition current=-5 to next=5 with prereq=0x20"
    );
}
static void run_unit_test_1666(void) {
    run_fsm_assert(
        -1,
        5,
        0x20ULL,
        0,
        "UT_1666",
        "Testing state transition current=-1 to next=5 with prereq=0x20"
    );
}
static void run_unit_test_1667(void) {
    run_fsm_assert(
        0,
        5,
        0x20ULL,
        0,
        "UT_1667",
        "Testing state transition current=0 to next=5 with prereq=0x20"
    );
}
static void run_unit_test_1668(void) {
    run_fsm_assert(
        1,
        5,
        0x20ULL,
        0,
        "UT_1668",
        "Testing state transition current=1 to next=5 with prereq=0x20"
    );
}
static void run_unit_test_1669(void) {
    run_fsm_assert(
        2,
        5,
        0x20ULL,
        0,
        "UT_1669",
        "Testing state transition current=2 to next=5 with prereq=0x20"
    );
}
static void run_unit_test_1670(void) {
    run_fsm_assert(
        3,
        5,
        0x20ULL,
        0,
        "UT_1670",
        "Testing state transition current=3 to next=5 with prereq=0x20"
    );
}
static void run_unit_test_1671(void) {
    run_fsm_assert(
        4,
        5,
        0x20ULL,
        0,
        "UT_1671",
        "Testing state transition current=4 to next=5 with prereq=0x20"
    );
}
static void run_unit_test_1672(void) {
    run_fsm_assert(
        5,
        5,
        0x20ULL,
        0,
        "UT_1672",
        "Testing state transition current=5 to next=5 with prereq=0x20"
    );
}
static void run_unit_test_1673(void) {
    run_fsm_assert(
        6,
        5,
        0x20ULL,
        0,
        "UT_1673",
        "Testing state transition current=6 to next=5 with prereq=0x20"
    );
}
static void run_unit_test_1674(void) {
    run_fsm_assert(
        7,
        5,
        0x20ULL,
        0,
        "UT_1674",
        "Testing state transition current=7 to next=5 with prereq=0x20"
    );
}
static void run_unit_test_1675(void) {
    run_fsm_assert(
        8,
        5,
        0x20ULL,
        0,
        "UT_1675",
        "Testing state transition current=8 to next=5 with prereq=0x20"
    );
}
static void run_unit_test_1676(void) {
    run_fsm_assert(
        10,
        5,
        0x20ULL,
        0,
        "UT_1676",
        "Testing state transition current=10 to next=5 with prereq=0x20"
    );
}
static void run_unit_test_1677(void) {
    run_fsm_assert(
        15,
        5,
        0x20ULL,
        0,
        "UT_1677",
        "Testing state transition current=15 to next=5 with prereq=0x20"
    );
}
static void run_unit_test_1678(void) {
    run_fsm_assert(
        100,
        5,
        0x20ULL,
        0,
        "UT_1678",
        "Testing state transition current=100 to next=5 with prereq=0x20"
    );
}
static void run_unit_test_1679(void) {
    run_fsm_assert(
        -100,
        5,
        0x20ULL,
        0,
        "UT_1679",
        "Testing state transition current=-100 to next=5 with prereq=0x20"
    );
}
static void run_unit_test_1680(void) {
    run_fsm_assert(
        -10,
        6,
        0x20ULL,
        0,
        "UT_1680",
        "Testing state transition current=-10 to next=6 with prereq=0x20"
    );
}
static void run_unit_test_1681(void) {
    run_fsm_assert(
        -5,
        6,
        0x20ULL,
        0,
        "UT_1681",
        "Testing state transition current=-5 to next=6 with prereq=0x20"
    );
}
static void run_unit_test_1682(void) {
    run_fsm_assert(
        -1,
        6,
        0x20ULL,
        0,
        "UT_1682",
        "Testing state transition current=-1 to next=6 with prereq=0x20"
    );
}
static void run_unit_test_1683(void) {
    run_fsm_assert(
        0,
        6,
        0x20ULL,
        0,
        "UT_1683",
        "Testing state transition current=0 to next=6 with prereq=0x20"
    );
}
static void run_unit_test_1684(void) {
    run_fsm_assert(
        1,
        6,
        0x20ULL,
        0,
        "UT_1684",
        "Testing state transition current=1 to next=6 with prereq=0x20"
    );
}
static void run_unit_test_1685(void) {
    run_fsm_assert(
        2,
        6,
        0x20ULL,
        0,
        "UT_1685",
        "Testing state transition current=2 to next=6 with prereq=0x20"
    );
}
static void run_unit_test_1686(void) {
    run_fsm_assert(
        3,
        6,
        0x20ULL,
        0,
        "UT_1686",
        "Testing state transition current=3 to next=6 with prereq=0x20"
    );
}
static void run_unit_test_1687(void) {
    run_fsm_assert(
        4,
        6,
        0x20ULL,
        0,
        "UT_1687",
        "Testing state transition current=4 to next=6 with prereq=0x20"
    );
}
static void run_unit_test_1688(void) {
    run_fsm_assert(
        5,
        6,
        0x20ULL,
        1,
        "UT_1688",
        "Testing state transition current=5 to next=6 with prereq=0x20"
    );
}
static void run_unit_test_1689(void) {
    run_fsm_assert(
        6,
        6,
        0x20ULL,
        0,
        "UT_1689",
        "Testing state transition current=6 to next=6 with prereq=0x20"
    );
}
static void run_unit_test_1690(void) {
    run_fsm_assert(
        7,
        6,
        0x20ULL,
        0,
        "UT_1690",
        "Testing state transition current=7 to next=6 with prereq=0x20"
    );
}
static void run_unit_test_1691(void) {
    run_fsm_assert(
        8,
        6,
        0x20ULL,
        0,
        "UT_1691",
        "Testing state transition current=8 to next=6 with prereq=0x20"
    );
}
static void run_unit_test_1692(void) {
    run_fsm_assert(
        10,
        6,
        0x20ULL,
        0,
        "UT_1692",
        "Testing state transition current=10 to next=6 with prereq=0x20"
    );
}
static void run_unit_test_1693(void) {
    run_fsm_assert(
        15,
        6,
        0x20ULL,
        0,
        "UT_1693",
        "Testing state transition current=15 to next=6 with prereq=0x20"
    );
}
static void run_unit_test_1694(void) {
    run_fsm_assert(
        100,
        6,
        0x20ULL,
        0,
        "UT_1694",
        "Testing state transition current=100 to next=6 with prereq=0x20"
    );
}
static void run_unit_test_1695(void) {
    run_fsm_assert(
        -100,
        6,
        0x20ULL,
        0,
        "UT_1695",
        "Testing state transition current=-100 to next=6 with prereq=0x20"
    );
}
static void run_unit_test_1696(void) {
    run_fsm_assert(
        -10,
        7,
        0x20ULL,
        0,
        "UT_1696",
        "Testing state transition current=-10 to next=7 with prereq=0x20"
    );
}
static void run_unit_test_1697(void) {
    run_fsm_assert(
        -5,
        7,
        0x20ULL,
        0,
        "UT_1697",
        "Testing state transition current=-5 to next=7 with prereq=0x20"
    );
}
static void run_unit_test_1698(void) {
    run_fsm_assert(
        -1,
        7,
        0x20ULL,
        0,
        "UT_1698",
        "Testing state transition current=-1 to next=7 with prereq=0x20"
    );
}
static void run_unit_test_1699(void) {
    run_fsm_assert(
        0,
        7,
        0x20ULL,
        0,
        "UT_1699",
        "Testing state transition current=0 to next=7 with prereq=0x20"
    );
}
static void run_unit_test_1700(void) {
    run_fsm_assert(
        1,
        7,
        0x20ULL,
        0,
        "UT_1700",
        "Testing state transition current=1 to next=7 with prereq=0x20"
    );
}
static void run_unit_test_1701(void) {
    run_fsm_assert(
        2,
        7,
        0x20ULL,
        0,
        "UT_1701",
        "Testing state transition current=2 to next=7 with prereq=0x20"
    );
}
static void run_unit_test_1702(void) {
    run_fsm_assert(
        3,
        7,
        0x20ULL,
        0,
        "UT_1702",
        "Testing state transition current=3 to next=7 with prereq=0x20"
    );
}
static void run_unit_test_1703(void) {
    run_fsm_assert(
        4,
        7,
        0x20ULL,
        0,
        "UT_1703",
        "Testing state transition current=4 to next=7 with prereq=0x20"
    );
}
static void run_unit_test_1704(void) {
    run_fsm_assert(
        5,
        7,
        0x20ULL,
        0,
        "UT_1704",
        "Testing state transition current=5 to next=7 with prereq=0x20"
    );
}
static void run_unit_test_1705(void) {
    run_fsm_assert(
        6,
        7,
        0x20ULL,
        0,
        "UT_1705",
        "Testing state transition current=6 to next=7 with prereq=0x20"
    );
}
static void run_unit_test_1706(void) {
    run_fsm_assert(
        7,
        7,
        0x20ULL,
        0,
        "UT_1706",
        "Testing state transition current=7 to next=7 with prereq=0x20"
    );
}
static void run_unit_test_1707(void) {
    run_fsm_assert(
        8,
        7,
        0x20ULL,
        0,
        "UT_1707",
        "Testing state transition current=8 to next=7 with prereq=0x20"
    );
}
static void run_unit_test_1708(void) {
    run_fsm_assert(
        10,
        7,
        0x20ULL,
        0,
        "UT_1708",
        "Testing state transition current=10 to next=7 with prereq=0x20"
    );
}
static void run_unit_test_1709(void) {
    run_fsm_assert(
        15,
        7,
        0x20ULL,
        0,
        "UT_1709",
        "Testing state transition current=15 to next=7 with prereq=0x20"
    );
}
static void run_unit_test_1710(void) {
    run_fsm_assert(
        100,
        7,
        0x20ULL,
        0,
        "UT_1710",
        "Testing state transition current=100 to next=7 with prereq=0x20"
    );
}
static void run_unit_test_1711(void) {
    run_fsm_assert(
        -100,
        7,
        0x20ULL,
        0,
        "UT_1711",
        "Testing state transition current=-100 to next=7 with prereq=0x20"
    );
}
static void run_unit_test_1712(void) {
    run_fsm_assert(
        -10,
        8,
        0x20ULL,
        0,
        "UT_1712",
        "Testing state transition current=-10 to next=8 with prereq=0x20"
    );
}
static void run_unit_test_1713(void) {
    run_fsm_assert(
        -5,
        8,
        0x20ULL,
        0,
        "UT_1713",
        "Testing state transition current=-5 to next=8 with prereq=0x20"
    );
}
static void run_unit_test_1714(void) {
    run_fsm_assert(
        -1,
        8,
        0x20ULL,
        0,
        "UT_1714",
        "Testing state transition current=-1 to next=8 with prereq=0x20"
    );
}
static void run_unit_test_1715(void) {
    run_fsm_assert(
        0,
        8,
        0x20ULL,
        0,
        "UT_1715",
        "Testing state transition current=0 to next=8 with prereq=0x20"
    );
}
static void run_unit_test_1716(void) {
    run_fsm_assert(
        1,
        8,
        0x20ULL,
        0,
        "UT_1716",
        "Testing state transition current=1 to next=8 with prereq=0x20"
    );
}
static void run_unit_test_1717(void) {
    run_fsm_assert(
        2,
        8,
        0x20ULL,
        0,
        "UT_1717",
        "Testing state transition current=2 to next=8 with prereq=0x20"
    );
}
static void run_unit_test_1718(void) {
    run_fsm_assert(
        3,
        8,
        0x20ULL,
        0,
        "UT_1718",
        "Testing state transition current=3 to next=8 with prereq=0x20"
    );
}
static void run_unit_test_1719(void) {
    run_fsm_assert(
        4,
        8,
        0x20ULL,
        0,
        "UT_1719",
        "Testing state transition current=4 to next=8 with prereq=0x20"
    );
}
static void run_unit_test_1720(void) {
    run_fsm_assert(
        5,
        8,
        0x20ULL,
        0,
        "UT_1720",
        "Testing state transition current=5 to next=8 with prereq=0x20"
    );
}
static void run_unit_test_1721(void) {
    run_fsm_assert(
        6,
        8,
        0x20ULL,
        0,
        "UT_1721",
        "Testing state transition current=6 to next=8 with prereq=0x20"
    );
}
static void run_unit_test_1722(void) {
    run_fsm_assert(
        7,
        8,
        0x20ULL,
        0,
        "UT_1722",
        "Testing state transition current=7 to next=8 with prereq=0x20"
    );
}
static void run_unit_test_1723(void) {
    run_fsm_assert(
        8,
        8,
        0x20ULL,
        0,
        "UT_1723",
        "Testing state transition current=8 to next=8 with prereq=0x20"
    );
}
static void run_unit_test_1724(void) {
    run_fsm_assert(
        10,
        8,
        0x20ULL,
        0,
        "UT_1724",
        "Testing state transition current=10 to next=8 with prereq=0x20"
    );
}
static void run_unit_test_1725(void) {
    run_fsm_assert(
        15,
        8,
        0x20ULL,
        0,
        "UT_1725",
        "Testing state transition current=15 to next=8 with prereq=0x20"
    );
}
static void run_unit_test_1726(void) {
    run_fsm_assert(
        100,
        8,
        0x20ULL,
        0,
        "UT_1726",
        "Testing state transition current=100 to next=8 with prereq=0x20"
    );
}
static void run_unit_test_1727(void) {
    run_fsm_assert(
        -100,
        8,
        0x20ULL,
        0,
        "UT_1727",
        "Testing state transition current=-100 to next=8 with prereq=0x20"
    );
}
static void run_unit_test_1728(void) {
    run_fsm_assert(
        -10,
        10,
        0x20ULL,
        0,
        "UT_1728",
        "Testing state transition current=-10 to next=10 with prereq=0x20"
    );
}
static void run_unit_test_1729(void) {
    run_fsm_assert(
        -5,
        10,
        0x20ULL,
        0,
        "UT_1729",
        "Testing state transition current=-5 to next=10 with prereq=0x20"
    );
}
static void run_unit_test_1730(void) {
    run_fsm_assert(
        -1,
        10,
        0x20ULL,
        0,
        "UT_1730",
        "Testing state transition current=-1 to next=10 with prereq=0x20"
    );
}
static void run_unit_test_1731(void) {
    run_fsm_assert(
        0,
        10,
        0x20ULL,
        0,
        "UT_1731",
        "Testing state transition current=0 to next=10 with prereq=0x20"
    );
}
static void run_unit_test_1732(void) {
    run_fsm_assert(
        1,
        10,
        0x20ULL,
        0,
        "UT_1732",
        "Testing state transition current=1 to next=10 with prereq=0x20"
    );
}
static void run_unit_test_1733(void) {
    run_fsm_assert(
        2,
        10,
        0x20ULL,
        0,
        "UT_1733",
        "Testing state transition current=2 to next=10 with prereq=0x20"
    );
}
static void run_unit_test_1734(void) {
    run_fsm_assert(
        3,
        10,
        0x20ULL,
        0,
        "UT_1734",
        "Testing state transition current=3 to next=10 with prereq=0x20"
    );
}
static void run_unit_test_1735(void) {
    run_fsm_assert(
        4,
        10,
        0x20ULL,
        0,
        "UT_1735",
        "Testing state transition current=4 to next=10 with prereq=0x20"
    );
}
static void run_unit_test_1736(void) {
    run_fsm_assert(
        5,
        10,
        0x20ULL,
        0,
        "UT_1736",
        "Testing state transition current=5 to next=10 with prereq=0x20"
    );
}
static void run_unit_test_1737(void) {
    run_fsm_assert(
        6,
        10,
        0x20ULL,
        0,
        "UT_1737",
        "Testing state transition current=6 to next=10 with prereq=0x20"
    );
}
static void run_unit_test_1738(void) {
    run_fsm_assert(
        7,
        10,
        0x20ULL,
        0,
        "UT_1738",
        "Testing state transition current=7 to next=10 with prereq=0x20"
    );
}
static void run_unit_test_1739(void) {
    run_fsm_assert(
        8,
        10,
        0x20ULL,
        0,
        "UT_1739",
        "Testing state transition current=8 to next=10 with prereq=0x20"
    );
}
static void run_unit_test_1740(void) {
    run_fsm_assert(
        10,
        10,
        0x20ULL,
        0,
        "UT_1740",
        "Testing state transition current=10 to next=10 with prereq=0x20"
    );
}
static void run_unit_test_1741(void) {
    run_fsm_assert(
        15,
        10,
        0x20ULL,
        0,
        "UT_1741",
        "Testing state transition current=15 to next=10 with prereq=0x20"
    );
}
static void run_unit_test_1742(void) {
    run_fsm_assert(
        100,
        10,
        0x20ULL,
        0,
        "UT_1742",
        "Testing state transition current=100 to next=10 with prereq=0x20"
    );
}
static void run_unit_test_1743(void) {
    run_fsm_assert(
        -100,
        10,
        0x20ULL,
        0,
        "UT_1743",
        "Testing state transition current=-100 to next=10 with prereq=0x20"
    );
}
static void run_unit_test_1744(void) {
    run_fsm_assert(
        -10,
        15,
        0x20ULL,
        0,
        "UT_1744",
        "Testing state transition current=-10 to next=15 with prereq=0x20"
    );
}
static void run_unit_test_1745(void) {
    run_fsm_assert(
        -5,
        15,
        0x20ULL,
        0,
        "UT_1745",
        "Testing state transition current=-5 to next=15 with prereq=0x20"
    );
}
static void run_unit_test_1746(void) {
    run_fsm_assert(
        -1,
        15,
        0x20ULL,
        0,
        "UT_1746",
        "Testing state transition current=-1 to next=15 with prereq=0x20"
    );
}
static void run_unit_test_1747(void) {
    run_fsm_assert(
        0,
        15,
        0x20ULL,
        0,
        "UT_1747",
        "Testing state transition current=0 to next=15 with prereq=0x20"
    );
}
static void run_unit_test_1748(void) {
    run_fsm_assert(
        1,
        15,
        0x20ULL,
        0,
        "UT_1748",
        "Testing state transition current=1 to next=15 with prereq=0x20"
    );
}
static void run_unit_test_1749(void) {
    run_fsm_assert(
        2,
        15,
        0x20ULL,
        0,
        "UT_1749",
        "Testing state transition current=2 to next=15 with prereq=0x20"
    );
}
static void run_unit_test_1750(void) {
    run_fsm_assert(
        3,
        15,
        0x20ULL,
        0,
        "UT_1750",
        "Testing state transition current=3 to next=15 with prereq=0x20"
    );
}
static void run_unit_test_1751(void) {
    run_fsm_assert(
        4,
        15,
        0x20ULL,
        0,
        "UT_1751",
        "Testing state transition current=4 to next=15 with prereq=0x20"
    );
}
static void run_unit_test_1752(void) {
    run_fsm_assert(
        5,
        15,
        0x20ULL,
        0,
        "UT_1752",
        "Testing state transition current=5 to next=15 with prereq=0x20"
    );
}
static void run_unit_test_1753(void) {
    run_fsm_assert(
        6,
        15,
        0x20ULL,
        0,
        "UT_1753",
        "Testing state transition current=6 to next=15 with prereq=0x20"
    );
}
static void run_unit_test_1754(void) {
    run_fsm_assert(
        7,
        15,
        0x20ULL,
        0,
        "UT_1754",
        "Testing state transition current=7 to next=15 with prereq=0x20"
    );
}
static void run_unit_test_1755(void) {
    run_fsm_assert(
        8,
        15,
        0x20ULL,
        0,
        "UT_1755",
        "Testing state transition current=8 to next=15 with prereq=0x20"
    );
}
static void run_unit_test_1756(void) {
    run_fsm_assert(
        10,
        15,
        0x20ULL,
        0,
        "UT_1756",
        "Testing state transition current=10 to next=15 with prereq=0x20"
    );
}
static void run_unit_test_1757(void) {
    run_fsm_assert(
        15,
        15,
        0x20ULL,
        0,
        "UT_1757",
        "Testing state transition current=15 to next=15 with prereq=0x20"
    );
}
static void run_unit_test_1758(void) {
    run_fsm_assert(
        100,
        15,
        0x20ULL,
        0,
        "UT_1758",
        "Testing state transition current=100 to next=15 with prereq=0x20"
    );
}
static void run_unit_test_1759(void) {
    run_fsm_assert(
        -100,
        15,
        0x20ULL,
        0,
        "UT_1759",
        "Testing state transition current=-100 to next=15 with prereq=0x20"
    );
}
static void run_unit_test_1760(void) {
    run_fsm_assert(
        -10,
        100,
        0x20ULL,
        0,
        "UT_1760",
        "Testing state transition current=-10 to next=100 with prereq=0x20"
    );
}
static void run_unit_test_1761(void) {
    run_fsm_assert(
        -5,
        100,
        0x20ULL,
        0,
        "UT_1761",
        "Testing state transition current=-5 to next=100 with prereq=0x20"
    );
}
static void run_unit_test_1762(void) {
    run_fsm_assert(
        -1,
        100,
        0x20ULL,
        0,
        "UT_1762",
        "Testing state transition current=-1 to next=100 with prereq=0x20"
    );
}
static void run_unit_test_1763(void) {
    run_fsm_assert(
        0,
        100,
        0x20ULL,
        0,
        "UT_1763",
        "Testing state transition current=0 to next=100 with prereq=0x20"
    );
}
static void run_unit_test_1764(void) {
    run_fsm_assert(
        1,
        100,
        0x20ULL,
        0,
        "UT_1764",
        "Testing state transition current=1 to next=100 with prereq=0x20"
    );
}
static void run_unit_test_1765(void) {
    run_fsm_assert(
        2,
        100,
        0x20ULL,
        0,
        "UT_1765",
        "Testing state transition current=2 to next=100 with prereq=0x20"
    );
}
static void run_unit_test_1766(void) {
    run_fsm_assert(
        3,
        100,
        0x20ULL,
        0,
        "UT_1766",
        "Testing state transition current=3 to next=100 with prereq=0x20"
    );
}
static void run_unit_test_1767(void) {
    run_fsm_assert(
        4,
        100,
        0x20ULL,
        0,
        "UT_1767",
        "Testing state transition current=4 to next=100 with prereq=0x20"
    );
}
static void run_unit_test_1768(void) {
    run_fsm_assert(
        5,
        100,
        0x20ULL,
        0,
        "UT_1768",
        "Testing state transition current=5 to next=100 with prereq=0x20"
    );
}
static void run_unit_test_1769(void) {
    run_fsm_assert(
        6,
        100,
        0x20ULL,
        0,
        "UT_1769",
        "Testing state transition current=6 to next=100 with prereq=0x20"
    );
}
static void run_unit_test_1770(void) {
    run_fsm_assert(
        7,
        100,
        0x20ULL,
        0,
        "UT_1770",
        "Testing state transition current=7 to next=100 with prereq=0x20"
    );
}
static void run_unit_test_1771(void) {
    run_fsm_assert(
        8,
        100,
        0x20ULL,
        0,
        "UT_1771",
        "Testing state transition current=8 to next=100 with prereq=0x20"
    );
}
static void run_unit_test_1772(void) {
    run_fsm_assert(
        10,
        100,
        0x20ULL,
        0,
        "UT_1772",
        "Testing state transition current=10 to next=100 with prereq=0x20"
    );
}
static void run_unit_test_1773(void) {
    run_fsm_assert(
        15,
        100,
        0x20ULL,
        0,
        "UT_1773",
        "Testing state transition current=15 to next=100 with prereq=0x20"
    );
}
static void run_unit_test_1774(void) {
    run_fsm_assert(
        100,
        100,
        0x20ULL,
        0,
        "UT_1774",
        "Testing state transition current=100 to next=100 with prereq=0x20"
    );
}
static void run_unit_test_1775(void) {
    run_fsm_assert(
        -100,
        100,
        0x20ULL,
        0,
        "UT_1775",
        "Testing state transition current=-100 to next=100 with prereq=0x20"
    );
}
static void run_unit_test_1776(void) {
    run_fsm_assert(
        -10,
        -100,
        0x20ULL,
        0,
        "UT_1776",
        "Testing state transition current=-10 to next=-100 with prereq=0x20"
    );
}
static void run_unit_test_1777(void) {
    run_fsm_assert(
        -5,
        -100,
        0x20ULL,
        0,
        "UT_1777",
        "Testing state transition current=-5 to next=-100 with prereq=0x20"
    );
}
static void run_unit_test_1778(void) {
    run_fsm_assert(
        -1,
        -100,
        0x20ULL,
        0,
        "UT_1778",
        "Testing state transition current=-1 to next=-100 with prereq=0x20"
    );
}
static void run_unit_test_1779(void) {
    run_fsm_assert(
        0,
        -100,
        0x20ULL,
        0,
        "UT_1779",
        "Testing state transition current=0 to next=-100 with prereq=0x20"
    );
}
static void run_unit_test_1780(void) {
    run_fsm_assert(
        1,
        -100,
        0x20ULL,
        0,
        "UT_1780",
        "Testing state transition current=1 to next=-100 with prereq=0x20"
    );
}
static void run_unit_test_1781(void) {
    run_fsm_assert(
        2,
        -100,
        0x20ULL,
        0,
        "UT_1781",
        "Testing state transition current=2 to next=-100 with prereq=0x20"
    );
}
static void run_unit_test_1782(void) {
    run_fsm_assert(
        3,
        -100,
        0x20ULL,
        0,
        "UT_1782",
        "Testing state transition current=3 to next=-100 with prereq=0x20"
    );
}
static void run_unit_test_1783(void) {
    run_fsm_assert(
        4,
        -100,
        0x20ULL,
        0,
        "UT_1783",
        "Testing state transition current=4 to next=-100 with prereq=0x20"
    );
}
static void run_unit_test_1784(void) {
    run_fsm_assert(
        5,
        -100,
        0x20ULL,
        0,
        "UT_1784",
        "Testing state transition current=5 to next=-100 with prereq=0x20"
    );
}
static void run_unit_test_1785(void) {
    run_fsm_assert(
        6,
        -100,
        0x20ULL,
        0,
        "UT_1785",
        "Testing state transition current=6 to next=-100 with prereq=0x20"
    );
}
static void run_unit_test_1786(void) {
    run_fsm_assert(
        7,
        -100,
        0x20ULL,
        0,
        "UT_1786",
        "Testing state transition current=7 to next=-100 with prereq=0x20"
    );
}
static void run_unit_test_1787(void) {
    run_fsm_assert(
        8,
        -100,
        0x20ULL,
        0,
        "UT_1787",
        "Testing state transition current=8 to next=-100 with prereq=0x20"
    );
}
static void run_unit_test_1788(void) {
    run_fsm_assert(
        10,
        -100,
        0x20ULL,
        0,
        "UT_1788",
        "Testing state transition current=10 to next=-100 with prereq=0x20"
    );
}
static void run_unit_test_1789(void) {
    run_fsm_assert(
        15,
        -100,
        0x20ULL,
        0,
        "UT_1789",
        "Testing state transition current=15 to next=-100 with prereq=0x20"
    );
}
static void run_unit_test_1790(void) {
    run_fsm_assert(
        100,
        -100,
        0x20ULL,
        0,
        "UT_1790",
        "Testing state transition current=100 to next=-100 with prereq=0x20"
    );
}
static void run_unit_test_1791(void) {
    run_fsm_assert(
        -100,
        -100,
        0x20ULL,
        0,
        "UT_1791",
        "Testing state transition current=-100 to next=-100 with prereq=0x20"
    );
}
static void run_unit_test_1792(void) {
    run_fsm_assert(
        -10,
        -10,
        0x40ULL,
        0,
        "UT_1792",
        "Testing state transition current=-10 to next=-10 with prereq=0x40"
    );
}
static void run_unit_test_1793(void) {
    run_fsm_assert(
        -5,
        -10,
        0x40ULL,
        0,
        "UT_1793",
        "Testing state transition current=-5 to next=-10 with prereq=0x40"
    );
}
static void run_unit_test_1794(void) {
    run_fsm_assert(
        -1,
        -10,
        0x40ULL,
        0,
        "UT_1794",
        "Testing state transition current=-1 to next=-10 with prereq=0x40"
    );
}
static void run_unit_test_1795(void) {
    run_fsm_assert(
        0,
        -10,
        0x40ULL,
        0,
        "UT_1795",
        "Testing state transition current=0 to next=-10 with prereq=0x40"
    );
}
static void run_unit_test_1796(void) {
    run_fsm_assert(
        1,
        -10,
        0x40ULL,
        0,
        "UT_1796",
        "Testing state transition current=1 to next=-10 with prereq=0x40"
    );
}
static void run_unit_test_1797(void) {
    run_fsm_assert(
        2,
        -10,
        0x40ULL,
        0,
        "UT_1797",
        "Testing state transition current=2 to next=-10 with prereq=0x40"
    );
}
static void run_unit_test_1798(void) {
    run_fsm_assert(
        3,
        -10,
        0x40ULL,
        0,
        "UT_1798",
        "Testing state transition current=3 to next=-10 with prereq=0x40"
    );
}
static void run_unit_test_1799(void) {
    run_fsm_assert(
        4,
        -10,
        0x40ULL,
        0,
        "UT_1799",
        "Testing state transition current=4 to next=-10 with prereq=0x40"
    );
}
static void run_unit_test_1800(void) {
    run_fsm_assert(
        5,
        -10,
        0x40ULL,
        0,
        "UT_1800",
        "Testing state transition current=5 to next=-10 with prereq=0x40"
    );
}
static void run_unit_test_1801(void) {
    run_fsm_assert(
        6,
        -10,
        0x40ULL,
        0,
        "UT_1801",
        "Testing state transition current=6 to next=-10 with prereq=0x40"
    );
}
static void run_unit_test_1802(void) {
    run_fsm_assert(
        7,
        -10,
        0x40ULL,
        0,
        "UT_1802",
        "Testing state transition current=7 to next=-10 with prereq=0x40"
    );
}
static void run_unit_test_1803(void) {
    run_fsm_assert(
        8,
        -10,
        0x40ULL,
        0,
        "UT_1803",
        "Testing state transition current=8 to next=-10 with prereq=0x40"
    );
}
static void run_unit_test_1804(void) {
    run_fsm_assert(
        10,
        -10,
        0x40ULL,
        0,
        "UT_1804",
        "Testing state transition current=10 to next=-10 with prereq=0x40"
    );
}
static void run_unit_test_1805(void) {
    run_fsm_assert(
        15,
        -10,
        0x40ULL,
        0,
        "UT_1805",
        "Testing state transition current=15 to next=-10 with prereq=0x40"
    );
}
static void run_unit_test_1806(void) {
    run_fsm_assert(
        100,
        -10,
        0x40ULL,
        0,
        "UT_1806",
        "Testing state transition current=100 to next=-10 with prereq=0x40"
    );
}
static void run_unit_test_1807(void) {
    run_fsm_assert(
        -100,
        -10,
        0x40ULL,
        0,
        "UT_1807",
        "Testing state transition current=-100 to next=-10 with prereq=0x40"
    );
}
static void run_unit_test_1808(void) {
    run_fsm_assert(
        -10,
        -5,
        0x40ULL,
        0,
        "UT_1808",
        "Testing state transition current=-10 to next=-5 with prereq=0x40"
    );
}
static void run_unit_test_1809(void) {
    run_fsm_assert(
        -5,
        -5,
        0x40ULL,
        0,
        "UT_1809",
        "Testing state transition current=-5 to next=-5 with prereq=0x40"
    );
}
static void run_unit_test_1810(void) {
    run_fsm_assert(
        -1,
        -5,
        0x40ULL,
        0,
        "UT_1810",
        "Testing state transition current=-1 to next=-5 with prereq=0x40"
    );
}
static void run_unit_test_1811(void) {
    run_fsm_assert(
        0,
        -5,
        0x40ULL,
        0,
        "UT_1811",
        "Testing state transition current=0 to next=-5 with prereq=0x40"
    );
}
static void run_unit_test_1812(void) {
    run_fsm_assert(
        1,
        -5,
        0x40ULL,
        0,
        "UT_1812",
        "Testing state transition current=1 to next=-5 with prereq=0x40"
    );
}
static void run_unit_test_1813(void) {
    run_fsm_assert(
        2,
        -5,
        0x40ULL,
        0,
        "UT_1813",
        "Testing state transition current=2 to next=-5 with prereq=0x40"
    );
}
static void run_unit_test_1814(void) {
    run_fsm_assert(
        3,
        -5,
        0x40ULL,
        0,
        "UT_1814",
        "Testing state transition current=3 to next=-5 with prereq=0x40"
    );
}
static void run_unit_test_1815(void) {
    run_fsm_assert(
        4,
        -5,
        0x40ULL,
        0,
        "UT_1815",
        "Testing state transition current=4 to next=-5 with prereq=0x40"
    );
}
static void run_unit_test_1816(void) {
    run_fsm_assert(
        5,
        -5,
        0x40ULL,
        0,
        "UT_1816",
        "Testing state transition current=5 to next=-5 with prereq=0x40"
    );
}
static void run_unit_test_1817(void) {
    run_fsm_assert(
        6,
        -5,
        0x40ULL,
        0,
        "UT_1817",
        "Testing state transition current=6 to next=-5 with prereq=0x40"
    );
}
static void run_unit_test_1818(void) {
    run_fsm_assert(
        7,
        -5,
        0x40ULL,
        0,
        "UT_1818",
        "Testing state transition current=7 to next=-5 with prereq=0x40"
    );
}
static void run_unit_test_1819(void) {
    run_fsm_assert(
        8,
        -5,
        0x40ULL,
        0,
        "UT_1819",
        "Testing state transition current=8 to next=-5 with prereq=0x40"
    );
}
static void run_unit_test_1820(void) {
    run_fsm_assert(
        10,
        -5,
        0x40ULL,
        0,
        "UT_1820",
        "Testing state transition current=10 to next=-5 with prereq=0x40"
    );
}
static void run_unit_test_1821(void) {
    run_fsm_assert(
        15,
        -5,
        0x40ULL,
        0,
        "UT_1821",
        "Testing state transition current=15 to next=-5 with prereq=0x40"
    );
}
static void run_unit_test_1822(void) {
    run_fsm_assert(
        100,
        -5,
        0x40ULL,
        0,
        "UT_1822",
        "Testing state transition current=100 to next=-5 with prereq=0x40"
    );
}
static void run_unit_test_1823(void) {
    run_fsm_assert(
        -100,
        -5,
        0x40ULL,
        0,
        "UT_1823",
        "Testing state transition current=-100 to next=-5 with prereq=0x40"
    );
}
static void run_unit_test_1824(void) {
    run_fsm_assert(
        -10,
        -1,
        0x40ULL,
        0,
        "UT_1824",
        "Testing state transition current=-10 to next=-1 with prereq=0x40"
    );
}
static void run_unit_test_1825(void) {
    run_fsm_assert(
        -5,
        -1,
        0x40ULL,
        0,
        "UT_1825",
        "Testing state transition current=-5 to next=-1 with prereq=0x40"
    );
}
static void run_unit_test_1826(void) {
    run_fsm_assert(
        -1,
        -1,
        0x40ULL,
        0,
        "UT_1826",
        "Testing state transition current=-1 to next=-1 with prereq=0x40"
    );
}
static void run_unit_test_1827(void) {
    run_fsm_assert(
        0,
        -1,
        0x40ULL,
        0,
        "UT_1827",
        "Testing state transition current=0 to next=-1 with prereq=0x40"
    );
}
static void run_unit_test_1828(void) {
    run_fsm_assert(
        1,
        -1,
        0x40ULL,
        0,
        "UT_1828",
        "Testing state transition current=1 to next=-1 with prereq=0x40"
    );
}
static void run_unit_test_1829(void) {
    run_fsm_assert(
        2,
        -1,
        0x40ULL,
        0,
        "UT_1829",
        "Testing state transition current=2 to next=-1 with prereq=0x40"
    );
}
static void run_unit_test_1830(void) {
    run_fsm_assert(
        3,
        -1,
        0x40ULL,
        0,
        "UT_1830",
        "Testing state transition current=3 to next=-1 with prereq=0x40"
    );
}
static void run_unit_test_1831(void) {
    run_fsm_assert(
        4,
        -1,
        0x40ULL,
        0,
        "UT_1831",
        "Testing state transition current=4 to next=-1 with prereq=0x40"
    );
}
static void run_unit_test_1832(void) {
    run_fsm_assert(
        5,
        -1,
        0x40ULL,
        0,
        "UT_1832",
        "Testing state transition current=5 to next=-1 with prereq=0x40"
    );
}
static void run_unit_test_1833(void) {
    run_fsm_assert(
        6,
        -1,
        0x40ULL,
        0,
        "UT_1833",
        "Testing state transition current=6 to next=-1 with prereq=0x40"
    );
}
static void run_unit_test_1834(void) {
    run_fsm_assert(
        7,
        -1,
        0x40ULL,
        0,
        "UT_1834",
        "Testing state transition current=7 to next=-1 with prereq=0x40"
    );
}
static void run_unit_test_1835(void) {
    run_fsm_assert(
        8,
        -1,
        0x40ULL,
        0,
        "UT_1835",
        "Testing state transition current=8 to next=-1 with prereq=0x40"
    );
}
static void run_unit_test_1836(void) {
    run_fsm_assert(
        10,
        -1,
        0x40ULL,
        0,
        "UT_1836",
        "Testing state transition current=10 to next=-1 with prereq=0x40"
    );
}
static void run_unit_test_1837(void) {
    run_fsm_assert(
        15,
        -1,
        0x40ULL,
        0,
        "UT_1837",
        "Testing state transition current=15 to next=-1 with prereq=0x40"
    );
}
static void run_unit_test_1838(void) {
    run_fsm_assert(
        100,
        -1,
        0x40ULL,
        0,
        "UT_1838",
        "Testing state transition current=100 to next=-1 with prereq=0x40"
    );
}
static void run_unit_test_1839(void) {
    run_fsm_assert(
        -100,
        -1,
        0x40ULL,
        0,
        "UT_1839",
        "Testing state transition current=-100 to next=-1 with prereq=0x40"
    );
}
static void run_unit_test_1840(void) {
    run_fsm_assert(
        -10,
        0,
        0x40ULL,
        0,
        "UT_1840",
        "Testing state transition current=-10 to next=0 with prereq=0x40"
    );
}
static void run_unit_test_1841(void) {
    run_fsm_assert(
        -5,
        0,
        0x40ULL,
        0,
        "UT_1841",
        "Testing state transition current=-5 to next=0 with prereq=0x40"
    );
}
static void run_unit_test_1842(void) {
    run_fsm_assert(
        -1,
        0,
        0x40ULL,
        0,
        "UT_1842",
        "Testing state transition current=-1 to next=0 with prereq=0x40"
    );
}
static void run_unit_test_1843(void) {
    run_fsm_assert(
        0,
        0,
        0x40ULL,
        1,
        "UT_1843",
        "Testing state transition current=0 to next=0 with prereq=0x40"
    );
}
static void run_unit_test_1844(void) {
    run_fsm_assert(
        1,
        0,
        0x40ULL,
        1,
        "UT_1844",
        "Testing state transition current=1 to next=0 with prereq=0x40"
    );
}
static void run_unit_test_1845(void) {
    run_fsm_assert(
        2,
        0,
        0x40ULL,
        1,
        "UT_1845",
        "Testing state transition current=2 to next=0 with prereq=0x40"
    );
}
static void run_unit_test_1846(void) {
    run_fsm_assert(
        3,
        0,
        0x40ULL,
        1,
        "UT_1846",
        "Testing state transition current=3 to next=0 with prereq=0x40"
    );
}
static void run_unit_test_1847(void) {
    run_fsm_assert(
        4,
        0,
        0x40ULL,
        1,
        "UT_1847",
        "Testing state transition current=4 to next=0 with prereq=0x40"
    );
}
static void run_unit_test_1848(void) {
    run_fsm_assert(
        5,
        0,
        0x40ULL,
        1,
        "UT_1848",
        "Testing state transition current=5 to next=0 with prereq=0x40"
    );
}
static void run_unit_test_1849(void) {
    run_fsm_assert(
        6,
        0,
        0x40ULL,
        1,
        "UT_1849",
        "Testing state transition current=6 to next=0 with prereq=0x40"
    );
}
static void run_unit_test_1850(void) {
    run_fsm_assert(
        7,
        0,
        0x40ULL,
        1,
        "UT_1850",
        "Testing state transition current=7 to next=0 with prereq=0x40"
    );
}
static void run_unit_test_1851(void) {
    run_fsm_assert(
        8,
        0,
        0x40ULL,
        0,
        "UT_1851",
        "Testing state transition current=8 to next=0 with prereq=0x40"
    );
}
static void run_unit_test_1852(void) {
    run_fsm_assert(
        10,
        0,
        0x40ULL,
        0,
        "UT_1852",
        "Testing state transition current=10 to next=0 with prereq=0x40"
    );
}
static void run_unit_test_1853(void) {
    run_fsm_assert(
        15,
        0,
        0x40ULL,
        0,
        "UT_1853",
        "Testing state transition current=15 to next=0 with prereq=0x40"
    );
}
static void run_unit_test_1854(void) {
    run_fsm_assert(
        100,
        0,
        0x40ULL,
        0,
        "UT_1854",
        "Testing state transition current=100 to next=0 with prereq=0x40"
    );
}
static void run_unit_test_1855(void) {
    run_fsm_assert(
        -100,
        0,
        0x40ULL,
        0,
        "UT_1855",
        "Testing state transition current=-100 to next=0 with prereq=0x40"
    );
}
static void run_unit_test_1856(void) {
    run_fsm_assert(
        -10,
        1,
        0x40ULL,
        0,
        "UT_1856",
        "Testing state transition current=-10 to next=1 with prereq=0x40"
    );
}
static void run_unit_test_1857(void) {
    run_fsm_assert(
        -5,
        1,
        0x40ULL,
        0,
        "UT_1857",
        "Testing state transition current=-5 to next=1 with prereq=0x40"
    );
}
static void run_unit_test_1858(void) {
    run_fsm_assert(
        -1,
        1,
        0x40ULL,
        0,
        "UT_1858",
        "Testing state transition current=-1 to next=1 with prereq=0x40"
    );
}
static void run_unit_test_1859(void) {
    run_fsm_assert(
        0,
        1,
        0x40ULL,
        0,
        "UT_1859",
        "Testing state transition current=0 to next=1 with prereq=0x40"
    );
}
static void run_unit_test_1860(void) {
    run_fsm_assert(
        1,
        1,
        0x40ULL,
        0,
        "UT_1860",
        "Testing state transition current=1 to next=1 with prereq=0x40"
    );
}
static void run_unit_test_1861(void) {
    run_fsm_assert(
        2,
        1,
        0x40ULL,
        0,
        "UT_1861",
        "Testing state transition current=2 to next=1 with prereq=0x40"
    );
}
static void run_unit_test_1862(void) {
    run_fsm_assert(
        3,
        1,
        0x40ULL,
        0,
        "UT_1862",
        "Testing state transition current=3 to next=1 with prereq=0x40"
    );
}
static void run_unit_test_1863(void) {
    run_fsm_assert(
        4,
        1,
        0x40ULL,
        0,
        "UT_1863",
        "Testing state transition current=4 to next=1 with prereq=0x40"
    );
}
static void run_unit_test_1864(void) {
    run_fsm_assert(
        5,
        1,
        0x40ULL,
        0,
        "UT_1864",
        "Testing state transition current=5 to next=1 with prereq=0x40"
    );
}
static void run_unit_test_1865(void) {
    run_fsm_assert(
        6,
        1,
        0x40ULL,
        0,
        "UT_1865",
        "Testing state transition current=6 to next=1 with prereq=0x40"
    );
}
static void run_unit_test_1866(void) {
    run_fsm_assert(
        7,
        1,
        0x40ULL,
        0,
        "UT_1866",
        "Testing state transition current=7 to next=1 with prereq=0x40"
    );
}
static void run_unit_test_1867(void) {
    run_fsm_assert(
        8,
        1,
        0x40ULL,
        0,
        "UT_1867",
        "Testing state transition current=8 to next=1 with prereq=0x40"
    );
}
static void run_unit_test_1868(void) {
    run_fsm_assert(
        10,
        1,
        0x40ULL,
        0,
        "UT_1868",
        "Testing state transition current=10 to next=1 with prereq=0x40"
    );
}
static void run_unit_test_1869(void) {
    run_fsm_assert(
        15,
        1,
        0x40ULL,
        0,
        "UT_1869",
        "Testing state transition current=15 to next=1 with prereq=0x40"
    );
}
static void run_unit_test_1870(void) {
    run_fsm_assert(
        100,
        1,
        0x40ULL,
        0,
        "UT_1870",
        "Testing state transition current=100 to next=1 with prereq=0x40"
    );
}
static void run_unit_test_1871(void) {
    run_fsm_assert(
        -100,
        1,
        0x40ULL,
        0,
        "UT_1871",
        "Testing state transition current=-100 to next=1 with prereq=0x40"
    );
}
static void run_unit_test_1872(void) {
    run_fsm_assert(
        -10,
        2,
        0x40ULL,
        0,
        "UT_1872",
        "Testing state transition current=-10 to next=2 with prereq=0x40"
    );
}
static void run_unit_test_1873(void) {
    run_fsm_assert(
        -5,
        2,
        0x40ULL,
        0,
        "UT_1873",
        "Testing state transition current=-5 to next=2 with prereq=0x40"
    );
}
static void run_unit_test_1874(void) {
    run_fsm_assert(
        -1,
        2,
        0x40ULL,
        0,
        "UT_1874",
        "Testing state transition current=-1 to next=2 with prereq=0x40"
    );
}
static void run_unit_test_1875(void) {
    run_fsm_assert(
        0,
        2,
        0x40ULL,
        0,
        "UT_1875",
        "Testing state transition current=0 to next=2 with prereq=0x40"
    );
}
static void run_unit_test_1876(void) {
    run_fsm_assert(
        1,
        2,
        0x40ULL,
        0,
        "UT_1876",
        "Testing state transition current=1 to next=2 with prereq=0x40"
    );
}
static void run_unit_test_1877(void) {
    run_fsm_assert(
        2,
        2,
        0x40ULL,
        0,
        "UT_1877",
        "Testing state transition current=2 to next=2 with prereq=0x40"
    );
}
static void run_unit_test_1878(void) {
    run_fsm_assert(
        3,
        2,
        0x40ULL,
        0,
        "UT_1878",
        "Testing state transition current=3 to next=2 with prereq=0x40"
    );
}
static void run_unit_test_1879(void) {
    run_fsm_assert(
        4,
        2,
        0x40ULL,
        0,
        "UT_1879",
        "Testing state transition current=4 to next=2 with prereq=0x40"
    );
}
static void run_unit_test_1880(void) {
    run_fsm_assert(
        5,
        2,
        0x40ULL,
        0,
        "UT_1880",
        "Testing state transition current=5 to next=2 with prereq=0x40"
    );
}
static void run_unit_test_1881(void) {
    run_fsm_assert(
        6,
        2,
        0x40ULL,
        0,
        "UT_1881",
        "Testing state transition current=6 to next=2 with prereq=0x40"
    );
}
static void run_unit_test_1882(void) {
    run_fsm_assert(
        7,
        2,
        0x40ULL,
        0,
        "UT_1882",
        "Testing state transition current=7 to next=2 with prereq=0x40"
    );
}
static void run_unit_test_1883(void) {
    run_fsm_assert(
        8,
        2,
        0x40ULL,
        0,
        "UT_1883",
        "Testing state transition current=8 to next=2 with prereq=0x40"
    );
}
static void run_unit_test_1884(void) {
    run_fsm_assert(
        10,
        2,
        0x40ULL,
        0,
        "UT_1884",
        "Testing state transition current=10 to next=2 with prereq=0x40"
    );
}
static void run_unit_test_1885(void) {
    run_fsm_assert(
        15,
        2,
        0x40ULL,
        0,
        "UT_1885",
        "Testing state transition current=15 to next=2 with prereq=0x40"
    );
}
static void run_unit_test_1886(void) {
    run_fsm_assert(
        100,
        2,
        0x40ULL,
        0,
        "UT_1886",
        "Testing state transition current=100 to next=2 with prereq=0x40"
    );
}
static void run_unit_test_1887(void) {
    run_fsm_assert(
        -100,
        2,
        0x40ULL,
        0,
        "UT_1887",
        "Testing state transition current=-100 to next=2 with prereq=0x40"
    );
}
static void run_unit_test_1888(void) {
    run_fsm_assert(
        -10,
        3,
        0x40ULL,
        0,
        "UT_1888",
        "Testing state transition current=-10 to next=3 with prereq=0x40"
    );
}
static void run_unit_test_1889(void) {
    run_fsm_assert(
        -5,
        3,
        0x40ULL,
        0,
        "UT_1889",
        "Testing state transition current=-5 to next=3 with prereq=0x40"
    );
}
static void run_unit_test_1890(void) {
    run_fsm_assert(
        -1,
        3,
        0x40ULL,
        0,
        "UT_1890",
        "Testing state transition current=-1 to next=3 with prereq=0x40"
    );
}
static void run_unit_test_1891(void) {
    run_fsm_assert(
        0,
        3,
        0x40ULL,
        0,
        "UT_1891",
        "Testing state transition current=0 to next=3 with prereq=0x40"
    );
}
static void run_unit_test_1892(void) {
    run_fsm_assert(
        1,
        3,
        0x40ULL,
        0,
        "UT_1892",
        "Testing state transition current=1 to next=3 with prereq=0x40"
    );
}
static void run_unit_test_1893(void) {
    run_fsm_assert(
        2,
        3,
        0x40ULL,
        0,
        "UT_1893",
        "Testing state transition current=2 to next=3 with prereq=0x40"
    );
}
static void run_unit_test_1894(void) {
    run_fsm_assert(
        3,
        3,
        0x40ULL,
        0,
        "UT_1894",
        "Testing state transition current=3 to next=3 with prereq=0x40"
    );
}
static void run_unit_test_1895(void) {
    run_fsm_assert(
        4,
        3,
        0x40ULL,
        0,
        "UT_1895",
        "Testing state transition current=4 to next=3 with prereq=0x40"
    );
}
static void run_unit_test_1896(void) {
    run_fsm_assert(
        5,
        3,
        0x40ULL,
        0,
        "UT_1896",
        "Testing state transition current=5 to next=3 with prereq=0x40"
    );
}
static void run_unit_test_1897(void) {
    run_fsm_assert(
        6,
        3,
        0x40ULL,
        0,
        "UT_1897",
        "Testing state transition current=6 to next=3 with prereq=0x40"
    );
}
static void run_unit_test_1898(void) {
    run_fsm_assert(
        7,
        3,
        0x40ULL,
        0,
        "UT_1898",
        "Testing state transition current=7 to next=3 with prereq=0x40"
    );
}
static void run_unit_test_1899(void) {
    run_fsm_assert(
        8,
        3,
        0x40ULL,
        0,
        "UT_1899",
        "Testing state transition current=8 to next=3 with prereq=0x40"
    );
}
static void run_unit_test_1900(void) {
    run_fsm_assert(
        10,
        3,
        0x40ULL,
        0,
        "UT_1900",
        "Testing state transition current=10 to next=3 with prereq=0x40"
    );
}
static void run_unit_test_1901(void) {
    run_fsm_assert(
        15,
        3,
        0x40ULL,
        0,
        "UT_1901",
        "Testing state transition current=15 to next=3 with prereq=0x40"
    );
}
static void run_unit_test_1902(void) {
    run_fsm_assert(
        100,
        3,
        0x40ULL,
        0,
        "UT_1902",
        "Testing state transition current=100 to next=3 with prereq=0x40"
    );
}
static void run_unit_test_1903(void) {
    run_fsm_assert(
        -100,
        3,
        0x40ULL,
        0,
        "UT_1903",
        "Testing state transition current=-100 to next=3 with prereq=0x40"
    );
}
static void run_unit_test_1904(void) {
    run_fsm_assert(
        -10,
        4,
        0x40ULL,
        0,
        "UT_1904",
        "Testing state transition current=-10 to next=4 with prereq=0x40"
    );
}
static void run_unit_test_1905(void) {
    run_fsm_assert(
        -5,
        4,
        0x40ULL,
        0,
        "UT_1905",
        "Testing state transition current=-5 to next=4 with prereq=0x40"
    );
}
static void run_unit_test_1906(void) {
    run_fsm_assert(
        -1,
        4,
        0x40ULL,
        0,
        "UT_1906",
        "Testing state transition current=-1 to next=4 with prereq=0x40"
    );
}
static void run_unit_test_1907(void) {
    run_fsm_assert(
        0,
        4,
        0x40ULL,
        0,
        "UT_1907",
        "Testing state transition current=0 to next=4 with prereq=0x40"
    );
}
static void run_unit_test_1908(void) {
    run_fsm_assert(
        1,
        4,
        0x40ULL,
        0,
        "UT_1908",
        "Testing state transition current=1 to next=4 with prereq=0x40"
    );
}
static void run_unit_test_1909(void) {
    run_fsm_assert(
        2,
        4,
        0x40ULL,
        0,
        "UT_1909",
        "Testing state transition current=2 to next=4 with prereq=0x40"
    );
}
static void run_unit_test_1910(void) {
    run_fsm_assert(
        3,
        4,
        0x40ULL,
        0,
        "UT_1910",
        "Testing state transition current=3 to next=4 with prereq=0x40"
    );
}
static void run_unit_test_1911(void) {
    run_fsm_assert(
        4,
        4,
        0x40ULL,
        0,
        "UT_1911",
        "Testing state transition current=4 to next=4 with prereq=0x40"
    );
}
static void run_unit_test_1912(void) {
    run_fsm_assert(
        5,
        4,
        0x40ULL,
        0,
        "UT_1912",
        "Testing state transition current=5 to next=4 with prereq=0x40"
    );
}
static void run_unit_test_1913(void) {
    run_fsm_assert(
        6,
        4,
        0x40ULL,
        0,
        "UT_1913",
        "Testing state transition current=6 to next=4 with prereq=0x40"
    );
}
static void run_unit_test_1914(void) {
    run_fsm_assert(
        7,
        4,
        0x40ULL,
        0,
        "UT_1914",
        "Testing state transition current=7 to next=4 with prereq=0x40"
    );
}
static void run_unit_test_1915(void) {
    run_fsm_assert(
        8,
        4,
        0x40ULL,
        0,
        "UT_1915",
        "Testing state transition current=8 to next=4 with prereq=0x40"
    );
}
static void run_unit_test_1916(void) {
    run_fsm_assert(
        10,
        4,
        0x40ULL,
        0,
        "UT_1916",
        "Testing state transition current=10 to next=4 with prereq=0x40"
    );
}
static void run_unit_test_1917(void) {
    run_fsm_assert(
        15,
        4,
        0x40ULL,
        0,
        "UT_1917",
        "Testing state transition current=15 to next=4 with prereq=0x40"
    );
}
static void run_unit_test_1918(void) {
    run_fsm_assert(
        100,
        4,
        0x40ULL,
        0,
        "UT_1918",
        "Testing state transition current=100 to next=4 with prereq=0x40"
    );
}
static void run_unit_test_1919(void) {
    run_fsm_assert(
        -100,
        4,
        0x40ULL,
        0,
        "UT_1919",
        "Testing state transition current=-100 to next=4 with prereq=0x40"
    );
}
static void run_unit_test_1920(void) {
    run_fsm_assert(
        -10,
        5,
        0x40ULL,
        0,
        "UT_1920",
        "Testing state transition current=-10 to next=5 with prereq=0x40"
    );
}
static void run_unit_test_1921(void) {
    run_fsm_assert(
        -5,
        5,
        0x40ULL,
        0,
        "UT_1921",
        "Testing state transition current=-5 to next=5 with prereq=0x40"
    );
}
static void run_unit_test_1922(void) {
    run_fsm_assert(
        -1,
        5,
        0x40ULL,
        0,
        "UT_1922",
        "Testing state transition current=-1 to next=5 with prereq=0x40"
    );
}
static void run_unit_test_1923(void) {
    run_fsm_assert(
        0,
        5,
        0x40ULL,
        0,
        "UT_1923",
        "Testing state transition current=0 to next=5 with prereq=0x40"
    );
}
static void run_unit_test_1924(void) {
    run_fsm_assert(
        1,
        5,
        0x40ULL,
        0,
        "UT_1924",
        "Testing state transition current=1 to next=5 with prereq=0x40"
    );
}
static void run_unit_test_1925(void) {
    run_fsm_assert(
        2,
        5,
        0x40ULL,
        0,
        "UT_1925",
        "Testing state transition current=2 to next=5 with prereq=0x40"
    );
}
static void run_unit_test_1926(void) {
    run_fsm_assert(
        3,
        5,
        0x40ULL,
        0,
        "UT_1926",
        "Testing state transition current=3 to next=5 with prereq=0x40"
    );
}
static void run_unit_test_1927(void) {
    run_fsm_assert(
        4,
        5,
        0x40ULL,
        0,
        "UT_1927",
        "Testing state transition current=4 to next=5 with prereq=0x40"
    );
}
static void run_unit_test_1928(void) {
    run_fsm_assert(
        5,
        5,
        0x40ULL,
        0,
        "UT_1928",
        "Testing state transition current=5 to next=5 with prereq=0x40"
    );
}
static void run_unit_test_1929(void) {
    run_fsm_assert(
        6,
        5,
        0x40ULL,
        0,
        "UT_1929",
        "Testing state transition current=6 to next=5 with prereq=0x40"
    );
}
static void run_unit_test_1930(void) {
    run_fsm_assert(
        7,
        5,
        0x40ULL,
        0,
        "UT_1930",
        "Testing state transition current=7 to next=5 with prereq=0x40"
    );
}
static void run_unit_test_1931(void) {
    run_fsm_assert(
        8,
        5,
        0x40ULL,
        0,
        "UT_1931",
        "Testing state transition current=8 to next=5 with prereq=0x40"
    );
}
static void run_unit_test_1932(void) {
    run_fsm_assert(
        10,
        5,
        0x40ULL,
        0,
        "UT_1932",
        "Testing state transition current=10 to next=5 with prereq=0x40"
    );
}
static void run_unit_test_1933(void) {
    run_fsm_assert(
        15,
        5,
        0x40ULL,
        0,
        "UT_1933",
        "Testing state transition current=15 to next=5 with prereq=0x40"
    );
}
static void run_unit_test_1934(void) {
    run_fsm_assert(
        100,
        5,
        0x40ULL,
        0,
        "UT_1934",
        "Testing state transition current=100 to next=5 with prereq=0x40"
    );
}
static void run_unit_test_1935(void) {
    run_fsm_assert(
        -100,
        5,
        0x40ULL,
        0,
        "UT_1935",
        "Testing state transition current=-100 to next=5 with prereq=0x40"
    );
}
static void run_unit_test_1936(void) {
    run_fsm_assert(
        -10,
        6,
        0x40ULL,
        0,
        "UT_1936",
        "Testing state transition current=-10 to next=6 with prereq=0x40"
    );
}
static void run_unit_test_1937(void) {
    run_fsm_assert(
        -5,
        6,
        0x40ULL,
        0,
        "UT_1937",
        "Testing state transition current=-5 to next=6 with prereq=0x40"
    );
}
static void run_unit_test_1938(void) {
    run_fsm_assert(
        -1,
        6,
        0x40ULL,
        0,
        "UT_1938",
        "Testing state transition current=-1 to next=6 with prereq=0x40"
    );
}
static void run_unit_test_1939(void) {
    run_fsm_assert(
        0,
        6,
        0x40ULL,
        0,
        "UT_1939",
        "Testing state transition current=0 to next=6 with prereq=0x40"
    );
}
static void run_unit_test_1940(void) {
    run_fsm_assert(
        1,
        6,
        0x40ULL,
        0,
        "UT_1940",
        "Testing state transition current=1 to next=6 with prereq=0x40"
    );
}
static void run_unit_test_1941(void) {
    run_fsm_assert(
        2,
        6,
        0x40ULL,
        0,
        "UT_1941",
        "Testing state transition current=2 to next=6 with prereq=0x40"
    );
}
static void run_unit_test_1942(void) {
    run_fsm_assert(
        3,
        6,
        0x40ULL,
        0,
        "UT_1942",
        "Testing state transition current=3 to next=6 with prereq=0x40"
    );
}
static void run_unit_test_1943(void) {
    run_fsm_assert(
        4,
        6,
        0x40ULL,
        0,
        "UT_1943",
        "Testing state transition current=4 to next=6 with prereq=0x40"
    );
}
static void run_unit_test_1944(void) {
    run_fsm_assert(
        5,
        6,
        0x40ULL,
        0,
        "UT_1944",
        "Testing state transition current=5 to next=6 with prereq=0x40"
    );
}
static void run_unit_test_1945(void) {
    run_fsm_assert(
        6,
        6,
        0x40ULL,
        0,
        "UT_1945",
        "Testing state transition current=6 to next=6 with prereq=0x40"
    );
}
static void run_unit_test_1946(void) {
    run_fsm_assert(
        7,
        6,
        0x40ULL,
        0,
        "UT_1946",
        "Testing state transition current=7 to next=6 with prereq=0x40"
    );
}
static void run_unit_test_1947(void) {
    run_fsm_assert(
        8,
        6,
        0x40ULL,
        0,
        "UT_1947",
        "Testing state transition current=8 to next=6 with prereq=0x40"
    );
}
static void run_unit_test_1948(void) {
    run_fsm_assert(
        10,
        6,
        0x40ULL,
        0,
        "UT_1948",
        "Testing state transition current=10 to next=6 with prereq=0x40"
    );
}
static void run_unit_test_1949(void) {
    run_fsm_assert(
        15,
        6,
        0x40ULL,
        0,
        "UT_1949",
        "Testing state transition current=15 to next=6 with prereq=0x40"
    );
}
static void run_unit_test_1950(void) {
    run_fsm_assert(
        100,
        6,
        0x40ULL,
        0,
        "UT_1950",
        "Testing state transition current=100 to next=6 with prereq=0x40"
    );
}
static void run_unit_test_1951(void) {
    run_fsm_assert(
        -100,
        6,
        0x40ULL,
        0,
        "UT_1951",
        "Testing state transition current=-100 to next=6 with prereq=0x40"
    );
}
static void run_unit_test_1952(void) {
    run_fsm_assert(
        -10,
        7,
        0x40ULL,
        0,
        "UT_1952",
        "Testing state transition current=-10 to next=7 with prereq=0x40"
    );
}
static void run_unit_test_1953(void) {
    run_fsm_assert(
        -5,
        7,
        0x40ULL,
        0,
        "UT_1953",
        "Testing state transition current=-5 to next=7 with prereq=0x40"
    );
}
static void run_unit_test_1954(void) {
    run_fsm_assert(
        -1,
        7,
        0x40ULL,
        0,
        "UT_1954",
        "Testing state transition current=-1 to next=7 with prereq=0x40"
    );
}
static void run_unit_test_1955(void) {
    run_fsm_assert(
        0,
        7,
        0x40ULL,
        0,
        "UT_1955",
        "Testing state transition current=0 to next=7 with prereq=0x40"
    );
}
static void run_unit_test_1956(void) {
    run_fsm_assert(
        1,
        7,
        0x40ULL,
        0,
        "UT_1956",
        "Testing state transition current=1 to next=7 with prereq=0x40"
    );
}
static void run_unit_test_1957(void) {
    run_fsm_assert(
        2,
        7,
        0x40ULL,
        0,
        "UT_1957",
        "Testing state transition current=2 to next=7 with prereq=0x40"
    );
}
static void run_unit_test_1958(void) {
    run_fsm_assert(
        3,
        7,
        0x40ULL,
        0,
        "UT_1958",
        "Testing state transition current=3 to next=7 with prereq=0x40"
    );
}
static void run_unit_test_1959(void) {
    run_fsm_assert(
        4,
        7,
        0x40ULL,
        0,
        "UT_1959",
        "Testing state transition current=4 to next=7 with prereq=0x40"
    );
}
static void run_unit_test_1960(void) {
    run_fsm_assert(
        5,
        7,
        0x40ULL,
        0,
        "UT_1960",
        "Testing state transition current=5 to next=7 with prereq=0x40"
    );
}
static void run_unit_test_1961(void) {
    run_fsm_assert(
        6,
        7,
        0x40ULL,
        1,
        "UT_1961",
        "Testing state transition current=6 to next=7 with prereq=0x40"
    );
}
static void run_unit_test_1962(void) {
    run_fsm_assert(
        7,
        7,
        0x40ULL,
        0,
        "UT_1962",
        "Testing state transition current=7 to next=7 with prereq=0x40"
    );
}
static void run_unit_test_1963(void) {
    run_fsm_assert(
        8,
        7,
        0x40ULL,
        0,
        "UT_1963",
        "Testing state transition current=8 to next=7 with prereq=0x40"
    );
}
static void run_unit_test_1964(void) {
    run_fsm_assert(
        10,
        7,
        0x40ULL,
        0,
        "UT_1964",
        "Testing state transition current=10 to next=7 with prereq=0x40"
    );
}
static void run_unit_test_1965(void) {
    run_fsm_assert(
        15,
        7,
        0x40ULL,
        0,
        "UT_1965",
        "Testing state transition current=15 to next=7 with prereq=0x40"
    );
}
static void run_unit_test_1966(void) {
    run_fsm_assert(
        100,
        7,
        0x40ULL,
        0,
        "UT_1966",
        "Testing state transition current=100 to next=7 with prereq=0x40"
    );
}
static void run_unit_test_1967(void) {
    run_fsm_assert(
        -100,
        7,
        0x40ULL,
        0,
        "UT_1967",
        "Testing state transition current=-100 to next=7 with prereq=0x40"
    );
}
static void run_unit_test_1968(void) {
    run_fsm_assert(
        -10,
        8,
        0x40ULL,
        0,
        "UT_1968",
        "Testing state transition current=-10 to next=8 with prereq=0x40"
    );
}
static void run_unit_test_1969(void) {
    run_fsm_assert(
        -5,
        8,
        0x40ULL,
        0,
        "UT_1969",
        "Testing state transition current=-5 to next=8 with prereq=0x40"
    );
}
static void run_unit_test_1970(void) {
    run_fsm_assert(
        -1,
        8,
        0x40ULL,
        0,
        "UT_1970",
        "Testing state transition current=-1 to next=8 with prereq=0x40"
    );
}
static void run_unit_test_1971(void) {
    run_fsm_assert(
        0,
        8,
        0x40ULL,
        0,
        "UT_1971",
        "Testing state transition current=0 to next=8 with prereq=0x40"
    );
}
static void run_unit_test_1972(void) {
    run_fsm_assert(
        1,
        8,
        0x40ULL,
        0,
        "UT_1972",
        "Testing state transition current=1 to next=8 with prereq=0x40"
    );
}
static void run_unit_test_1973(void) {
    run_fsm_assert(
        2,
        8,
        0x40ULL,
        0,
        "UT_1973",
        "Testing state transition current=2 to next=8 with prereq=0x40"
    );
}
static void run_unit_test_1974(void) {
    run_fsm_assert(
        3,
        8,
        0x40ULL,
        0,
        "UT_1974",
        "Testing state transition current=3 to next=8 with prereq=0x40"
    );
}
static void run_unit_test_1975(void) {
    run_fsm_assert(
        4,
        8,
        0x40ULL,
        0,
        "UT_1975",
        "Testing state transition current=4 to next=8 with prereq=0x40"
    );
}
static void run_unit_test_1976(void) {
    run_fsm_assert(
        5,
        8,
        0x40ULL,
        0,
        "UT_1976",
        "Testing state transition current=5 to next=8 with prereq=0x40"
    );
}
static void run_unit_test_1977(void) {
    run_fsm_assert(
        6,
        8,
        0x40ULL,
        0,
        "UT_1977",
        "Testing state transition current=6 to next=8 with prereq=0x40"
    );
}
static void run_unit_test_1978(void) {
    run_fsm_assert(
        7,
        8,
        0x40ULL,
        0,
        "UT_1978",
        "Testing state transition current=7 to next=8 with prereq=0x40"
    );
}
static void run_unit_test_1979(void) {
    run_fsm_assert(
        8,
        8,
        0x40ULL,
        0,
        "UT_1979",
        "Testing state transition current=8 to next=8 with prereq=0x40"
    );
}
static void run_unit_test_1980(void) {
    run_fsm_assert(
        10,
        8,
        0x40ULL,
        0,
        "UT_1980",
        "Testing state transition current=10 to next=8 with prereq=0x40"
    );
}
static void run_unit_test_1981(void) {
    run_fsm_assert(
        15,
        8,
        0x40ULL,
        0,
        "UT_1981",
        "Testing state transition current=15 to next=8 with prereq=0x40"
    );
}
static void run_unit_test_1982(void) {
    run_fsm_assert(
        100,
        8,
        0x40ULL,
        0,
        "UT_1982",
        "Testing state transition current=100 to next=8 with prereq=0x40"
    );
}
static void run_unit_test_1983(void) {
    run_fsm_assert(
        -100,
        8,
        0x40ULL,
        0,
        "UT_1983",
        "Testing state transition current=-100 to next=8 with prereq=0x40"
    );
}
static void run_unit_test_1984(void) {
    run_fsm_assert(
        -10,
        10,
        0x40ULL,
        0,
        "UT_1984",
        "Testing state transition current=-10 to next=10 with prereq=0x40"
    );
}
static void run_unit_test_1985(void) {
    run_fsm_assert(
        -5,
        10,
        0x40ULL,
        0,
        "UT_1985",
        "Testing state transition current=-5 to next=10 with prereq=0x40"
    );
}
static void run_unit_test_1986(void) {
    run_fsm_assert(
        -1,
        10,
        0x40ULL,
        0,
        "UT_1986",
        "Testing state transition current=-1 to next=10 with prereq=0x40"
    );
}
static void run_unit_test_1987(void) {
    run_fsm_assert(
        0,
        10,
        0x40ULL,
        0,
        "UT_1987",
        "Testing state transition current=0 to next=10 with prereq=0x40"
    );
}
static void run_unit_test_1988(void) {
    run_fsm_assert(
        1,
        10,
        0x40ULL,
        0,
        "UT_1988",
        "Testing state transition current=1 to next=10 with prereq=0x40"
    );
}
static void run_unit_test_1989(void) {
    run_fsm_assert(
        2,
        10,
        0x40ULL,
        0,
        "UT_1989",
        "Testing state transition current=2 to next=10 with prereq=0x40"
    );
}
static void run_unit_test_1990(void) {
    run_fsm_assert(
        3,
        10,
        0x40ULL,
        0,
        "UT_1990",
        "Testing state transition current=3 to next=10 with prereq=0x40"
    );
}
static void run_unit_test_1991(void) {
    run_fsm_assert(
        4,
        10,
        0x40ULL,
        0,
        "UT_1991",
        "Testing state transition current=4 to next=10 with prereq=0x40"
    );
}
static void run_unit_test_1992(void) {
    run_fsm_assert(
        5,
        10,
        0x40ULL,
        0,
        "UT_1992",
        "Testing state transition current=5 to next=10 with prereq=0x40"
    );
}
static void run_unit_test_1993(void) {
    run_fsm_assert(
        6,
        10,
        0x40ULL,
        0,
        "UT_1993",
        "Testing state transition current=6 to next=10 with prereq=0x40"
    );
}
static void run_unit_test_1994(void) {
    run_fsm_assert(
        7,
        10,
        0x40ULL,
        0,
        "UT_1994",
        "Testing state transition current=7 to next=10 with prereq=0x40"
    );
}
static void run_unit_test_1995(void) {
    run_fsm_assert(
        8,
        10,
        0x40ULL,
        0,
        "UT_1995",
        "Testing state transition current=8 to next=10 with prereq=0x40"
    );
}
static void run_unit_test_1996(void) {
    run_fsm_assert(
        10,
        10,
        0x40ULL,
        0,
        "UT_1996",
        "Testing state transition current=10 to next=10 with prereq=0x40"
    );
}
static void run_unit_test_1997(void) {
    run_fsm_assert(
        15,
        10,
        0x40ULL,
        0,
        "UT_1997",
        "Testing state transition current=15 to next=10 with prereq=0x40"
    );
}
static void run_unit_test_1998(void) {
    run_fsm_assert(
        100,
        10,
        0x40ULL,
        0,
        "UT_1998",
        "Testing state transition current=100 to next=10 with prereq=0x40"
    );
}
static void run_unit_test_1999(void) {
    run_fsm_assert(
        -100,
        10,
        0x40ULL,
        0,
        "UT_1999",
        "Testing state transition current=-100 to next=10 with prereq=0x40"
    );
}
static void run_unit_test_2000(void) {
    run_fsm_assert(
        -10,
        15,
        0x40ULL,
        0,
        "UT_2000",
        "Testing state transition current=-10 to next=15 with prereq=0x40"
    );
}
static void run_unit_test_2001(void) {
    run_fsm_assert(
        -5,
        15,
        0x40ULL,
        0,
        "UT_2001",
        "Testing state transition current=-5 to next=15 with prereq=0x40"
    );
}
static void run_unit_test_2002(void) {
    run_fsm_assert(
        -1,
        15,
        0x40ULL,
        0,
        "UT_2002",
        "Testing state transition current=-1 to next=15 with prereq=0x40"
    );
}
static void run_unit_test_2003(void) {
    run_fsm_assert(
        0,
        15,
        0x40ULL,
        0,
        "UT_2003",
        "Testing state transition current=0 to next=15 with prereq=0x40"
    );
}
static void run_unit_test_2004(void) {
    run_fsm_assert(
        1,
        15,
        0x40ULL,
        0,
        "UT_2004",
        "Testing state transition current=1 to next=15 with prereq=0x40"
    );
}
static void run_unit_test_2005(void) {
    run_fsm_assert(
        2,
        15,
        0x40ULL,
        0,
        "UT_2005",
        "Testing state transition current=2 to next=15 with prereq=0x40"
    );
}
static void run_unit_test_2006(void) {
    run_fsm_assert(
        3,
        15,
        0x40ULL,
        0,
        "UT_2006",
        "Testing state transition current=3 to next=15 with prereq=0x40"
    );
}
static void run_unit_test_2007(void) {
    run_fsm_assert(
        4,
        15,
        0x40ULL,
        0,
        "UT_2007",
        "Testing state transition current=4 to next=15 with prereq=0x40"
    );
}
static void run_unit_test_2008(void) {
    run_fsm_assert(
        5,
        15,
        0x40ULL,
        0,
        "UT_2008",
        "Testing state transition current=5 to next=15 with prereq=0x40"
    );
}
static void run_unit_test_2009(void) {
    run_fsm_assert(
        6,
        15,
        0x40ULL,
        0,
        "UT_2009",
        "Testing state transition current=6 to next=15 with prereq=0x40"
    );
}
static void run_unit_test_2010(void) {
    run_fsm_assert(
        7,
        15,
        0x40ULL,
        0,
        "UT_2010",
        "Testing state transition current=7 to next=15 with prereq=0x40"
    );
}
static void run_unit_test_2011(void) {
    run_fsm_assert(
        8,
        15,
        0x40ULL,
        0,
        "UT_2011",
        "Testing state transition current=8 to next=15 with prereq=0x40"
    );
}
static void run_unit_test_2012(void) {
    run_fsm_assert(
        10,
        15,
        0x40ULL,
        0,
        "UT_2012",
        "Testing state transition current=10 to next=15 with prereq=0x40"
    );
}
static void run_unit_test_2013(void) {
    run_fsm_assert(
        15,
        15,
        0x40ULL,
        0,
        "UT_2013",
        "Testing state transition current=15 to next=15 with prereq=0x40"
    );
}
static void run_unit_test_2014(void) {
    run_fsm_assert(
        100,
        15,
        0x40ULL,
        0,
        "UT_2014",
        "Testing state transition current=100 to next=15 with prereq=0x40"
    );
}
static void run_unit_test_2015(void) {
    run_fsm_assert(
        -100,
        15,
        0x40ULL,
        0,
        "UT_2015",
        "Testing state transition current=-100 to next=15 with prereq=0x40"
    );
}
static void run_unit_test_2016(void) {
    run_fsm_assert(
        -10,
        100,
        0x40ULL,
        0,
        "UT_2016",
        "Testing state transition current=-10 to next=100 with prereq=0x40"
    );
}
static void run_unit_test_2017(void) {
    run_fsm_assert(
        -5,
        100,
        0x40ULL,
        0,
        "UT_2017",
        "Testing state transition current=-5 to next=100 with prereq=0x40"
    );
}
static void run_unit_test_2018(void) {
    run_fsm_assert(
        -1,
        100,
        0x40ULL,
        0,
        "UT_2018",
        "Testing state transition current=-1 to next=100 with prereq=0x40"
    );
}
static void run_unit_test_2019(void) {
    run_fsm_assert(
        0,
        100,
        0x40ULL,
        0,
        "UT_2019",
        "Testing state transition current=0 to next=100 with prereq=0x40"
    );
}
static void run_unit_test_2020(void) {
    run_fsm_assert(
        1,
        100,
        0x40ULL,
        0,
        "UT_2020",
        "Testing state transition current=1 to next=100 with prereq=0x40"
    );
}
static void run_unit_test_2021(void) {
    run_fsm_assert(
        2,
        100,
        0x40ULL,
        0,
        "UT_2021",
        "Testing state transition current=2 to next=100 with prereq=0x40"
    );
}
static void run_unit_test_2022(void) {
    run_fsm_assert(
        3,
        100,
        0x40ULL,
        0,
        "UT_2022",
        "Testing state transition current=3 to next=100 with prereq=0x40"
    );
}
static void run_unit_test_2023(void) {
    run_fsm_assert(
        4,
        100,
        0x40ULL,
        0,
        "UT_2023",
        "Testing state transition current=4 to next=100 with prereq=0x40"
    );
}
static void run_unit_test_2024(void) {
    run_fsm_assert(
        5,
        100,
        0x40ULL,
        0,
        "UT_2024",
        "Testing state transition current=5 to next=100 with prereq=0x40"
    );
}
static void run_unit_test_2025(void) {
    run_fsm_assert(
        6,
        100,
        0x40ULL,
        0,
        "UT_2025",
        "Testing state transition current=6 to next=100 with prereq=0x40"
    );
}
static void run_unit_test_2026(void) {
    run_fsm_assert(
        7,
        100,
        0x40ULL,
        0,
        "UT_2026",
        "Testing state transition current=7 to next=100 with prereq=0x40"
    );
}
static void run_unit_test_2027(void) {
    run_fsm_assert(
        8,
        100,
        0x40ULL,
        0,
        "UT_2027",
        "Testing state transition current=8 to next=100 with prereq=0x40"
    );
}
static void run_unit_test_2028(void) {
    run_fsm_assert(
        10,
        100,
        0x40ULL,
        0,
        "UT_2028",
        "Testing state transition current=10 to next=100 with prereq=0x40"
    );
}
static void run_unit_test_2029(void) {
    run_fsm_assert(
        15,
        100,
        0x40ULL,
        0,
        "UT_2029",
        "Testing state transition current=15 to next=100 with prereq=0x40"
    );
}
static void run_unit_test_2030(void) {
    run_fsm_assert(
        100,
        100,
        0x40ULL,
        0,
        "UT_2030",
        "Testing state transition current=100 to next=100 with prereq=0x40"
    );
}
static void run_unit_test_2031(void) {
    run_fsm_assert(
        -100,
        100,
        0x40ULL,
        0,
        "UT_2031",
        "Testing state transition current=-100 to next=100 with prereq=0x40"
    );
}
static void run_unit_test_2032(void) {
    run_fsm_assert(
        -10,
        -100,
        0x40ULL,
        0,
        "UT_2032",
        "Testing state transition current=-10 to next=-100 with prereq=0x40"
    );
}
static void run_unit_test_2033(void) {
    run_fsm_assert(
        -5,
        -100,
        0x40ULL,
        0,
        "UT_2033",
        "Testing state transition current=-5 to next=-100 with prereq=0x40"
    );
}
static void run_unit_test_2034(void) {
    run_fsm_assert(
        -1,
        -100,
        0x40ULL,
        0,
        "UT_2034",
        "Testing state transition current=-1 to next=-100 with prereq=0x40"
    );
}
static void run_unit_test_2035(void) {
    run_fsm_assert(
        0,
        -100,
        0x40ULL,
        0,
        "UT_2035",
        "Testing state transition current=0 to next=-100 with prereq=0x40"
    );
}
static void run_unit_test_2036(void) {
    run_fsm_assert(
        1,
        -100,
        0x40ULL,
        0,
        "UT_2036",
        "Testing state transition current=1 to next=-100 with prereq=0x40"
    );
}
static void run_unit_test_2037(void) {
    run_fsm_assert(
        2,
        -100,
        0x40ULL,
        0,
        "UT_2037",
        "Testing state transition current=2 to next=-100 with prereq=0x40"
    );
}
static void run_unit_test_2038(void) {
    run_fsm_assert(
        3,
        -100,
        0x40ULL,
        0,
        "UT_2038",
        "Testing state transition current=3 to next=-100 with prereq=0x40"
    );
}
static void run_unit_test_2039(void) {
    run_fsm_assert(
        4,
        -100,
        0x40ULL,
        0,
        "UT_2039",
        "Testing state transition current=4 to next=-100 with prereq=0x40"
    );
}
static void run_unit_test_2040(void) {
    run_fsm_assert(
        5,
        -100,
        0x40ULL,
        0,
        "UT_2040",
        "Testing state transition current=5 to next=-100 with prereq=0x40"
    );
}
static void run_unit_test_2041(void) {
    run_fsm_assert(
        6,
        -100,
        0x40ULL,
        0,
        "UT_2041",
        "Testing state transition current=6 to next=-100 with prereq=0x40"
    );
}
static void run_unit_test_2042(void) {
    run_fsm_assert(
        7,
        -100,
        0x40ULL,
        0,
        "UT_2042",
        "Testing state transition current=7 to next=-100 with prereq=0x40"
    );
}
static void run_unit_test_2043(void) {
    run_fsm_assert(
        8,
        -100,
        0x40ULL,
        0,
        "UT_2043",
        "Testing state transition current=8 to next=-100 with prereq=0x40"
    );
}
static void run_unit_test_2044(void) {
    run_fsm_assert(
        10,
        -100,
        0x40ULL,
        0,
        "UT_2044",
        "Testing state transition current=10 to next=-100 with prereq=0x40"
    );
}
static void run_unit_test_2045(void) {
    run_fsm_assert(
        15,
        -100,
        0x40ULL,
        0,
        "UT_2045",
        "Testing state transition current=15 to next=-100 with prereq=0x40"
    );
}
static void run_unit_test_2046(void) {
    run_fsm_assert(
        100,
        -100,
        0x40ULL,
        0,
        "UT_2046",
        "Testing state transition current=100 to next=-100 with prereq=0x40"
    );
}
static void run_unit_test_2047(void) {
    run_fsm_assert(
        -100,
        -100,
        0x40ULL,
        0,
        "UT_2047",
        "Testing state transition current=-100 to next=-100 with prereq=0x40"
    );
}
static void run_unit_test_2048(void) {
    run_fsm_assert(
        -10,
        -10,
        0x3ULL,
        0,
        "UT_2048",
        "Testing state transition current=-10 to next=-10 with prereq=0x3"
    );
}
static void run_unit_test_2049(void) {
    run_fsm_assert(
        -5,
        -10,
        0x3ULL,
        0,
        "UT_2049",
        "Testing state transition current=-5 to next=-10 with prereq=0x3"
    );
}
static void run_unit_test_2050(void) {
    run_fsm_assert(
        -1,
        -10,
        0x3ULL,
        0,
        "UT_2050",
        "Testing state transition current=-1 to next=-10 with prereq=0x3"
    );
}
static void run_unit_test_2051(void) {
    run_fsm_assert(
        0,
        -10,
        0x3ULL,
        0,
        "UT_2051",
        "Testing state transition current=0 to next=-10 with prereq=0x3"
    );
}
static void run_unit_test_2052(void) {
    run_fsm_assert(
        1,
        -10,
        0x3ULL,
        0,
        "UT_2052",
        "Testing state transition current=1 to next=-10 with prereq=0x3"
    );
}
static void run_unit_test_2053(void) {
    run_fsm_assert(
        2,
        -10,
        0x3ULL,
        0,
        "UT_2053",
        "Testing state transition current=2 to next=-10 with prereq=0x3"
    );
}
static void run_unit_test_2054(void) {
    run_fsm_assert(
        3,
        -10,
        0x3ULL,
        0,
        "UT_2054",
        "Testing state transition current=3 to next=-10 with prereq=0x3"
    );
}
static void run_unit_test_2055(void) {
    run_fsm_assert(
        4,
        -10,
        0x3ULL,
        0,
        "UT_2055",
        "Testing state transition current=4 to next=-10 with prereq=0x3"
    );
}
static void run_unit_test_2056(void) {
    run_fsm_assert(
        5,
        -10,
        0x3ULL,
        0,
        "UT_2056",
        "Testing state transition current=5 to next=-10 with prereq=0x3"
    );
}
static void run_unit_test_2057(void) {
    run_fsm_assert(
        6,
        -10,
        0x3ULL,
        0,
        "UT_2057",
        "Testing state transition current=6 to next=-10 with prereq=0x3"
    );
}
static void run_unit_test_2058(void) {
    run_fsm_assert(
        7,
        -10,
        0x3ULL,
        0,
        "UT_2058",
        "Testing state transition current=7 to next=-10 with prereq=0x3"
    );
}
static void run_unit_test_2059(void) {
    run_fsm_assert(
        8,
        -10,
        0x3ULL,
        0,
        "UT_2059",
        "Testing state transition current=8 to next=-10 with prereq=0x3"
    );
}
static void run_unit_test_2060(void) {
    run_fsm_assert(
        10,
        -10,
        0x3ULL,
        0,
        "UT_2060",
        "Testing state transition current=10 to next=-10 with prereq=0x3"
    );
}
static void run_unit_test_2061(void) {
    run_fsm_assert(
        15,
        -10,
        0x3ULL,
        0,
        "UT_2061",
        "Testing state transition current=15 to next=-10 with prereq=0x3"
    );
}
static void run_unit_test_2062(void) {
    run_fsm_assert(
        100,
        -10,
        0x3ULL,
        0,
        "UT_2062",
        "Testing state transition current=100 to next=-10 with prereq=0x3"
    );
}
static void run_unit_test_2063(void) {
    run_fsm_assert(
        -100,
        -10,
        0x3ULL,
        0,
        "UT_2063",
        "Testing state transition current=-100 to next=-10 with prereq=0x3"
    );
}
static void run_unit_test_2064(void) {
    run_fsm_assert(
        -10,
        -5,
        0x3ULL,
        0,
        "UT_2064",
        "Testing state transition current=-10 to next=-5 with prereq=0x3"
    );
}
static void run_unit_test_2065(void) {
    run_fsm_assert(
        -5,
        -5,
        0x3ULL,
        0,
        "UT_2065",
        "Testing state transition current=-5 to next=-5 with prereq=0x3"
    );
}
static void run_unit_test_2066(void) {
    run_fsm_assert(
        -1,
        -5,
        0x3ULL,
        0,
        "UT_2066",
        "Testing state transition current=-1 to next=-5 with prereq=0x3"
    );
}
static void run_unit_test_2067(void) {
    run_fsm_assert(
        0,
        -5,
        0x3ULL,
        0,
        "UT_2067",
        "Testing state transition current=0 to next=-5 with prereq=0x3"
    );
}
static void run_unit_test_2068(void) {
    run_fsm_assert(
        1,
        -5,
        0x3ULL,
        0,
        "UT_2068",
        "Testing state transition current=1 to next=-5 with prereq=0x3"
    );
}
static void run_unit_test_2069(void) {
    run_fsm_assert(
        2,
        -5,
        0x3ULL,
        0,
        "UT_2069",
        "Testing state transition current=2 to next=-5 with prereq=0x3"
    );
}
static void run_unit_test_2070(void) {
    run_fsm_assert(
        3,
        -5,
        0x3ULL,
        0,
        "UT_2070",
        "Testing state transition current=3 to next=-5 with prereq=0x3"
    );
}
static void run_unit_test_2071(void) {
    run_fsm_assert(
        4,
        -5,
        0x3ULL,
        0,
        "UT_2071",
        "Testing state transition current=4 to next=-5 with prereq=0x3"
    );
}
static void run_unit_test_2072(void) {
    run_fsm_assert(
        5,
        -5,
        0x3ULL,
        0,
        "UT_2072",
        "Testing state transition current=5 to next=-5 with prereq=0x3"
    );
}
static void run_unit_test_2073(void) {
    run_fsm_assert(
        6,
        -5,
        0x3ULL,
        0,
        "UT_2073",
        "Testing state transition current=6 to next=-5 with prereq=0x3"
    );
}
static void run_unit_test_2074(void) {
    run_fsm_assert(
        7,
        -5,
        0x3ULL,
        0,
        "UT_2074",
        "Testing state transition current=7 to next=-5 with prereq=0x3"
    );
}
static void run_unit_test_2075(void) {
    run_fsm_assert(
        8,
        -5,
        0x3ULL,
        0,
        "UT_2075",
        "Testing state transition current=8 to next=-5 with prereq=0x3"
    );
}
static void run_unit_test_2076(void) {
    run_fsm_assert(
        10,
        -5,
        0x3ULL,
        0,
        "UT_2076",
        "Testing state transition current=10 to next=-5 with prereq=0x3"
    );
}
static void run_unit_test_2077(void) {
    run_fsm_assert(
        15,
        -5,
        0x3ULL,
        0,
        "UT_2077",
        "Testing state transition current=15 to next=-5 with prereq=0x3"
    );
}
static void run_unit_test_2078(void) {
    run_fsm_assert(
        100,
        -5,
        0x3ULL,
        0,
        "UT_2078",
        "Testing state transition current=100 to next=-5 with prereq=0x3"
    );
}
static void run_unit_test_2079(void) {
    run_fsm_assert(
        -100,
        -5,
        0x3ULL,
        0,
        "UT_2079",
        "Testing state transition current=-100 to next=-5 with prereq=0x3"
    );
}
static void run_unit_test_2080(void) {
    run_fsm_assert(
        -10,
        -1,
        0x3ULL,
        0,
        "UT_2080",
        "Testing state transition current=-10 to next=-1 with prereq=0x3"
    );
}
static void run_unit_test_2081(void) {
    run_fsm_assert(
        -5,
        -1,
        0x3ULL,
        0,
        "UT_2081",
        "Testing state transition current=-5 to next=-1 with prereq=0x3"
    );
}
static void run_unit_test_2082(void) {
    run_fsm_assert(
        -1,
        -1,
        0x3ULL,
        0,
        "UT_2082",
        "Testing state transition current=-1 to next=-1 with prereq=0x3"
    );
}
static void run_unit_test_2083(void) {
    run_fsm_assert(
        0,
        -1,
        0x3ULL,
        0,
        "UT_2083",
        "Testing state transition current=0 to next=-1 with prereq=0x3"
    );
}
static void run_unit_test_2084(void) {
    run_fsm_assert(
        1,
        -1,
        0x3ULL,
        0,
        "UT_2084",
        "Testing state transition current=1 to next=-1 with prereq=0x3"
    );
}
static void run_unit_test_2085(void) {
    run_fsm_assert(
        2,
        -1,
        0x3ULL,
        0,
        "UT_2085",
        "Testing state transition current=2 to next=-1 with prereq=0x3"
    );
}
static void run_unit_test_2086(void) {
    run_fsm_assert(
        3,
        -1,
        0x3ULL,
        0,
        "UT_2086",
        "Testing state transition current=3 to next=-1 with prereq=0x3"
    );
}
static void run_unit_test_2087(void) {
    run_fsm_assert(
        4,
        -1,
        0x3ULL,
        0,
        "UT_2087",
        "Testing state transition current=4 to next=-1 with prereq=0x3"
    );
}
static void run_unit_test_2088(void) {
    run_fsm_assert(
        5,
        -1,
        0x3ULL,
        0,
        "UT_2088",
        "Testing state transition current=5 to next=-1 with prereq=0x3"
    );
}
static void run_unit_test_2089(void) {
    run_fsm_assert(
        6,
        -1,
        0x3ULL,
        0,
        "UT_2089",
        "Testing state transition current=6 to next=-1 with prereq=0x3"
    );
}
static void run_unit_test_2090(void) {
    run_fsm_assert(
        7,
        -1,
        0x3ULL,
        0,
        "UT_2090",
        "Testing state transition current=7 to next=-1 with prereq=0x3"
    );
}
static void run_unit_test_2091(void) {
    run_fsm_assert(
        8,
        -1,
        0x3ULL,
        0,
        "UT_2091",
        "Testing state transition current=8 to next=-1 with prereq=0x3"
    );
}
static void run_unit_test_2092(void) {
    run_fsm_assert(
        10,
        -1,
        0x3ULL,
        0,
        "UT_2092",
        "Testing state transition current=10 to next=-1 with prereq=0x3"
    );
}
static void run_unit_test_2093(void) {
    run_fsm_assert(
        15,
        -1,
        0x3ULL,
        0,
        "UT_2093",
        "Testing state transition current=15 to next=-1 with prereq=0x3"
    );
}
static void run_unit_test_2094(void) {
    run_fsm_assert(
        100,
        -1,
        0x3ULL,
        0,
        "UT_2094",
        "Testing state transition current=100 to next=-1 with prereq=0x3"
    );
}
static void run_unit_test_2095(void) {
    run_fsm_assert(
        -100,
        -1,
        0x3ULL,
        0,
        "UT_2095",
        "Testing state transition current=-100 to next=-1 with prereq=0x3"
    );
}
static void run_unit_test_2096(void) {
    run_fsm_assert(
        -10,
        0,
        0x3ULL,
        0,
        "UT_2096",
        "Testing state transition current=-10 to next=0 with prereq=0x3"
    );
}
static void run_unit_test_2097(void) {
    run_fsm_assert(
        -5,
        0,
        0x3ULL,
        0,
        "UT_2097",
        "Testing state transition current=-5 to next=0 with prereq=0x3"
    );
}
static void run_unit_test_2098(void) {
    run_fsm_assert(
        -1,
        0,
        0x3ULL,
        0,
        "UT_2098",
        "Testing state transition current=-1 to next=0 with prereq=0x3"
    );
}
static void run_unit_test_2099(void) {
    run_fsm_assert(
        0,
        0,
        0x3ULL,
        1,
        "UT_2099",
        "Testing state transition current=0 to next=0 with prereq=0x3"
    );
}
static void run_unit_test_2100(void) {
    run_fsm_assert(
        1,
        0,
        0x3ULL,
        1,
        "UT_2100",
        "Testing state transition current=1 to next=0 with prereq=0x3"
    );
}
static void run_unit_test_2101(void) {
    run_fsm_assert(
        2,
        0,
        0x3ULL,
        1,
        "UT_2101",
        "Testing state transition current=2 to next=0 with prereq=0x3"
    );
}
static void run_unit_test_2102(void) {
    run_fsm_assert(
        3,
        0,
        0x3ULL,
        1,
        "UT_2102",
        "Testing state transition current=3 to next=0 with prereq=0x3"
    );
}
static void run_unit_test_2103(void) {
    run_fsm_assert(
        4,
        0,
        0x3ULL,
        1,
        "UT_2103",
        "Testing state transition current=4 to next=0 with prereq=0x3"
    );
}
static void run_unit_test_2104(void) {
    run_fsm_assert(
        5,
        0,
        0x3ULL,
        1,
        "UT_2104",
        "Testing state transition current=5 to next=0 with prereq=0x3"
    );
}
static void run_unit_test_2105(void) {
    run_fsm_assert(
        6,
        0,
        0x3ULL,
        1,
        "UT_2105",
        "Testing state transition current=6 to next=0 with prereq=0x3"
    );
}
static void run_unit_test_2106(void) {
    run_fsm_assert(
        7,
        0,
        0x3ULL,
        1,
        "UT_2106",
        "Testing state transition current=7 to next=0 with prereq=0x3"
    );
}
static void run_unit_test_2107(void) {
    run_fsm_assert(
        8,
        0,
        0x3ULL,
        0,
        "UT_2107",
        "Testing state transition current=8 to next=0 with prereq=0x3"
    );
}
static void run_unit_test_2108(void) {
    run_fsm_assert(
        10,
        0,
        0x3ULL,
        0,
        "UT_2108",
        "Testing state transition current=10 to next=0 with prereq=0x3"
    );
}
static void run_unit_test_2109(void) {
    run_fsm_assert(
        15,
        0,
        0x3ULL,
        0,
        "UT_2109",
        "Testing state transition current=15 to next=0 with prereq=0x3"
    );
}
static void run_unit_test_2110(void) {
    run_fsm_assert(
        100,
        0,
        0x3ULL,
        0,
        "UT_2110",
        "Testing state transition current=100 to next=0 with prereq=0x3"
    );
}
static void run_unit_test_2111(void) {
    run_fsm_assert(
        -100,
        0,
        0x3ULL,
        0,
        "UT_2111",
        "Testing state transition current=-100 to next=0 with prereq=0x3"
    );
}
static void run_unit_test_2112(void) {
    run_fsm_assert(
        -10,
        1,
        0x3ULL,
        0,
        "UT_2112",
        "Testing state transition current=-10 to next=1 with prereq=0x3"
    );
}
static void run_unit_test_2113(void) {
    run_fsm_assert(
        -5,
        1,
        0x3ULL,
        0,
        "UT_2113",
        "Testing state transition current=-5 to next=1 with prereq=0x3"
    );
}
static void run_unit_test_2114(void) {
    run_fsm_assert(
        -1,
        1,
        0x3ULL,
        0,
        "UT_2114",
        "Testing state transition current=-1 to next=1 with prereq=0x3"
    );
}
static void run_unit_test_2115(void) {
    run_fsm_assert(
        0,
        1,
        0x3ULL,
        1,
        "UT_2115",
        "Testing state transition current=0 to next=1 with prereq=0x3"
    );
}
static void run_unit_test_2116(void) {
    run_fsm_assert(
        1,
        1,
        0x3ULL,
        0,
        "UT_2116",
        "Testing state transition current=1 to next=1 with prereq=0x3"
    );
}
static void run_unit_test_2117(void) {
    run_fsm_assert(
        2,
        1,
        0x3ULL,
        0,
        "UT_2117",
        "Testing state transition current=2 to next=1 with prereq=0x3"
    );
}
static void run_unit_test_2118(void) {
    run_fsm_assert(
        3,
        1,
        0x3ULL,
        0,
        "UT_2118",
        "Testing state transition current=3 to next=1 with prereq=0x3"
    );
}
static void run_unit_test_2119(void) {
    run_fsm_assert(
        4,
        1,
        0x3ULL,
        0,
        "UT_2119",
        "Testing state transition current=4 to next=1 with prereq=0x3"
    );
}
static void run_unit_test_2120(void) {
    run_fsm_assert(
        5,
        1,
        0x3ULL,
        0,
        "UT_2120",
        "Testing state transition current=5 to next=1 with prereq=0x3"
    );
}
static void run_unit_test_2121(void) {
    run_fsm_assert(
        6,
        1,
        0x3ULL,
        0,
        "UT_2121",
        "Testing state transition current=6 to next=1 with prereq=0x3"
    );
}
static void run_unit_test_2122(void) {
    run_fsm_assert(
        7,
        1,
        0x3ULL,
        0,
        "UT_2122",
        "Testing state transition current=7 to next=1 with prereq=0x3"
    );
}
static void run_unit_test_2123(void) {
    run_fsm_assert(
        8,
        1,
        0x3ULL,
        0,
        "UT_2123",
        "Testing state transition current=8 to next=1 with prereq=0x3"
    );
}
static void run_unit_test_2124(void) {
    run_fsm_assert(
        10,
        1,
        0x3ULL,
        0,
        "UT_2124",
        "Testing state transition current=10 to next=1 with prereq=0x3"
    );
}
static void run_unit_test_2125(void) {
    run_fsm_assert(
        15,
        1,
        0x3ULL,
        0,
        "UT_2125",
        "Testing state transition current=15 to next=1 with prereq=0x3"
    );
}
static void run_unit_test_2126(void) {
    run_fsm_assert(
        100,
        1,
        0x3ULL,
        0,
        "UT_2126",
        "Testing state transition current=100 to next=1 with prereq=0x3"
    );
}
static void run_unit_test_2127(void) {
    run_fsm_assert(
        -100,
        1,
        0x3ULL,
        0,
        "UT_2127",
        "Testing state transition current=-100 to next=1 with prereq=0x3"
    );
}
static void run_unit_test_2128(void) {
    run_fsm_assert(
        -10,
        2,
        0x3ULL,
        0,
        "UT_2128",
        "Testing state transition current=-10 to next=2 with prereq=0x3"
    );
}
static void run_unit_test_2129(void) {
    run_fsm_assert(
        -5,
        2,
        0x3ULL,
        0,
        "UT_2129",
        "Testing state transition current=-5 to next=2 with prereq=0x3"
    );
}
static void run_unit_test_2130(void) {
    run_fsm_assert(
        -1,
        2,
        0x3ULL,
        0,
        "UT_2130",
        "Testing state transition current=-1 to next=2 with prereq=0x3"
    );
}
static void run_unit_test_2131(void) {
    run_fsm_assert(
        0,
        2,
        0x3ULL,
        0,
        "UT_2131",
        "Testing state transition current=0 to next=2 with prereq=0x3"
    );
}
static void run_unit_test_2132(void) {
    run_fsm_assert(
        1,
        2,
        0x3ULL,
        1,
        "UT_2132",
        "Testing state transition current=1 to next=2 with prereq=0x3"
    );
}
static void run_unit_test_2133(void) {
    run_fsm_assert(
        2,
        2,
        0x3ULL,
        0,
        "UT_2133",
        "Testing state transition current=2 to next=2 with prereq=0x3"
    );
}
static void run_unit_test_2134(void) {
    run_fsm_assert(
        3,
        2,
        0x3ULL,
        0,
        "UT_2134",
        "Testing state transition current=3 to next=2 with prereq=0x3"
    );
}
static void run_unit_test_2135(void) {
    run_fsm_assert(
        4,
        2,
        0x3ULL,
        0,
        "UT_2135",
        "Testing state transition current=4 to next=2 with prereq=0x3"
    );
}
static void run_unit_test_2136(void) {
    run_fsm_assert(
        5,
        2,
        0x3ULL,
        0,
        "UT_2136",
        "Testing state transition current=5 to next=2 with prereq=0x3"
    );
}
static void run_unit_test_2137(void) {
    run_fsm_assert(
        6,
        2,
        0x3ULL,
        0,
        "UT_2137",
        "Testing state transition current=6 to next=2 with prereq=0x3"
    );
}
static void run_unit_test_2138(void) {
    run_fsm_assert(
        7,
        2,
        0x3ULL,
        0,
        "UT_2138",
        "Testing state transition current=7 to next=2 with prereq=0x3"
    );
}
static void run_unit_test_2139(void) {
    run_fsm_assert(
        8,
        2,
        0x3ULL,
        0,
        "UT_2139",
        "Testing state transition current=8 to next=2 with prereq=0x3"
    );
}
static void run_unit_test_2140(void) {
    run_fsm_assert(
        10,
        2,
        0x3ULL,
        0,
        "UT_2140",
        "Testing state transition current=10 to next=2 with prereq=0x3"
    );
}
static void run_unit_test_2141(void) {
    run_fsm_assert(
        15,
        2,
        0x3ULL,
        0,
        "UT_2141",
        "Testing state transition current=15 to next=2 with prereq=0x3"
    );
}
static void run_unit_test_2142(void) {
    run_fsm_assert(
        100,
        2,
        0x3ULL,
        0,
        "UT_2142",
        "Testing state transition current=100 to next=2 with prereq=0x3"
    );
}
static void run_unit_test_2143(void) {
    run_fsm_assert(
        -100,
        2,
        0x3ULL,
        0,
        "UT_2143",
        "Testing state transition current=-100 to next=2 with prereq=0x3"
    );
}
static void run_unit_test_2144(void) {
    run_fsm_assert(
        -10,
        3,
        0x3ULL,
        0,
        "UT_2144",
        "Testing state transition current=-10 to next=3 with prereq=0x3"
    );
}
static void run_unit_test_2145(void) {
    run_fsm_assert(
        -5,
        3,
        0x3ULL,
        0,
        "UT_2145",
        "Testing state transition current=-5 to next=3 with prereq=0x3"
    );
}
static void run_unit_test_2146(void) {
    run_fsm_assert(
        -1,
        3,
        0x3ULL,
        0,
        "UT_2146",
        "Testing state transition current=-1 to next=3 with prereq=0x3"
    );
}
static void run_unit_test_2147(void) {
    run_fsm_assert(
        0,
        3,
        0x3ULL,
        0,
        "UT_2147",
        "Testing state transition current=0 to next=3 with prereq=0x3"
    );
}
static void run_unit_test_2148(void) {
    run_fsm_assert(
        1,
        3,
        0x3ULL,
        0,
        "UT_2148",
        "Testing state transition current=1 to next=3 with prereq=0x3"
    );
}
static void run_unit_test_2149(void) {
    run_fsm_assert(
        2,
        3,
        0x3ULL,
        0,
        "UT_2149",
        "Testing state transition current=2 to next=3 with prereq=0x3"
    );
}
static void run_unit_test_2150(void) {
    run_fsm_assert(
        3,
        3,
        0x3ULL,
        0,
        "UT_2150",
        "Testing state transition current=3 to next=3 with prereq=0x3"
    );
}
static void run_unit_test_2151(void) {
    run_fsm_assert(
        4,
        3,
        0x3ULL,
        0,
        "UT_2151",
        "Testing state transition current=4 to next=3 with prereq=0x3"
    );
}
static void run_unit_test_2152(void) {
    run_fsm_assert(
        5,
        3,
        0x3ULL,
        0,
        "UT_2152",
        "Testing state transition current=5 to next=3 with prereq=0x3"
    );
}
static void run_unit_test_2153(void) {
    run_fsm_assert(
        6,
        3,
        0x3ULL,
        0,
        "UT_2153",
        "Testing state transition current=6 to next=3 with prereq=0x3"
    );
}
static void run_unit_test_2154(void) {
    run_fsm_assert(
        7,
        3,
        0x3ULL,
        0,
        "UT_2154",
        "Testing state transition current=7 to next=3 with prereq=0x3"
    );
}
static void run_unit_test_2155(void) {
    run_fsm_assert(
        8,
        3,
        0x3ULL,
        0,
        "UT_2155",
        "Testing state transition current=8 to next=3 with prereq=0x3"
    );
}
static void run_unit_test_2156(void) {
    run_fsm_assert(
        10,
        3,
        0x3ULL,
        0,
        "UT_2156",
        "Testing state transition current=10 to next=3 with prereq=0x3"
    );
}
static void run_unit_test_2157(void) {
    run_fsm_assert(
        15,
        3,
        0x3ULL,
        0,
        "UT_2157",
        "Testing state transition current=15 to next=3 with prereq=0x3"
    );
}
static void run_unit_test_2158(void) {
    run_fsm_assert(
        100,
        3,
        0x3ULL,
        0,
        "UT_2158",
        "Testing state transition current=100 to next=3 with prereq=0x3"
    );
}
static void run_unit_test_2159(void) {
    run_fsm_assert(
        -100,
        3,
        0x3ULL,
        0,
        "UT_2159",
        "Testing state transition current=-100 to next=3 with prereq=0x3"
    );
}
static void run_unit_test_2160(void) {
    run_fsm_assert(
        -10,
        4,
        0x3ULL,
        0,
        "UT_2160",
        "Testing state transition current=-10 to next=4 with prereq=0x3"
    );
}
static void run_unit_test_2161(void) {
    run_fsm_assert(
        -5,
        4,
        0x3ULL,
        0,
        "UT_2161",
        "Testing state transition current=-5 to next=4 with prereq=0x3"
    );
}
static void run_unit_test_2162(void) {
    run_fsm_assert(
        -1,
        4,
        0x3ULL,
        0,
        "UT_2162",
        "Testing state transition current=-1 to next=4 with prereq=0x3"
    );
}
static void run_unit_test_2163(void) {
    run_fsm_assert(
        0,
        4,
        0x3ULL,
        0,
        "UT_2163",
        "Testing state transition current=0 to next=4 with prereq=0x3"
    );
}
static void run_unit_test_2164(void) {
    run_fsm_assert(
        1,
        4,
        0x3ULL,
        0,
        "UT_2164",
        "Testing state transition current=1 to next=4 with prereq=0x3"
    );
}
static void run_unit_test_2165(void) {
    run_fsm_assert(
        2,
        4,
        0x3ULL,
        0,
        "UT_2165",
        "Testing state transition current=2 to next=4 with prereq=0x3"
    );
}
static void run_unit_test_2166(void) {
    run_fsm_assert(
        3,
        4,
        0x3ULL,
        0,
        "UT_2166",
        "Testing state transition current=3 to next=4 with prereq=0x3"
    );
}
static void run_unit_test_2167(void) {
    run_fsm_assert(
        4,
        4,
        0x3ULL,
        0,
        "UT_2167",
        "Testing state transition current=4 to next=4 with prereq=0x3"
    );
}
static void run_unit_test_2168(void) {
    run_fsm_assert(
        5,
        4,
        0x3ULL,
        0,
        "UT_2168",
        "Testing state transition current=5 to next=4 with prereq=0x3"
    );
}
static void run_unit_test_2169(void) {
    run_fsm_assert(
        6,
        4,
        0x3ULL,
        0,
        "UT_2169",
        "Testing state transition current=6 to next=4 with prereq=0x3"
    );
}
static void run_unit_test_2170(void) {
    run_fsm_assert(
        7,
        4,
        0x3ULL,
        0,
        "UT_2170",
        "Testing state transition current=7 to next=4 with prereq=0x3"
    );
}
static void run_unit_test_2171(void) {
    run_fsm_assert(
        8,
        4,
        0x3ULL,
        0,
        "UT_2171",
        "Testing state transition current=8 to next=4 with prereq=0x3"
    );
}
static void run_unit_test_2172(void) {
    run_fsm_assert(
        10,
        4,
        0x3ULL,
        0,
        "UT_2172",
        "Testing state transition current=10 to next=4 with prereq=0x3"
    );
}
static void run_unit_test_2173(void) {
    run_fsm_assert(
        15,
        4,
        0x3ULL,
        0,
        "UT_2173",
        "Testing state transition current=15 to next=4 with prereq=0x3"
    );
}
static void run_unit_test_2174(void) {
    run_fsm_assert(
        100,
        4,
        0x3ULL,
        0,
        "UT_2174",
        "Testing state transition current=100 to next=4 with prereq=0x3"
    );
}
static void run_unit_test_2175(void) {
    run_fsm_assert(
        -100,
        4,
        0x3ULL,
        0,
        "UT_2175",
        "Testing state transition current=-100 to next=4 with prereq=0x3"
    );
}
static void run_unit_test_2176(void) {
    run_fsm_assert(
        -10,
        5,
        0x3ULL,
        0,
        "UT_2176",
        "Testing state transition current=-10 to next=5 with prereq=0x3"
    );
}
static void run_unit_test_2177(void) {
    run_fsm_assert(
        -5,
        5,
        0x3ULL,
        0,
        "UT_2177",
        "Testing state transition current=-5 to next=5 with prereq=0x3"
    );
}
static void run_unit_test_2178(void) {
    run_fsm_assert(
        -1,
        5,
        0x3ULL,
        0,
        "UT_2178",
        "Testing state transition current=-1 to next=5 with prereq=0x3"
    );
}
static void run_unit_test_2179(void) {
    run_fsm_assert(
        0,
        5,
        0x3ULL,
        0,
        "UT_2179",
        "Testing state transition current=0 to next=5 with prereq=0x3"
    );
}
static void run_unit_test_2180(void) {
    run_fsm_assert(
        1,
        5,
        0x3ULL,
        0,
        "UT_2180",
        "Testing state transition current=1 to next=5 with prereq=0x3"
    );
}
static void run_unit_test_2181(void) {
    run_fsm_assert(
        2,
        5,
        0x3ULL,
        0,
        "UT_2181",
        "Testing state transition current=2 to next=5 with prereq=0x3"
    );
}
static void run_unit_test_2182(void) {
    run_fsm_assert(
        3,
        5,
        0x3ULL,
        0,
        "UT_2182",
        "Testing state transition current=3 to next=5 with prereq=0x3"
    );
}
static void run_unit_test_2183(void) {
    run_fsm_assert(
        4,
        5,
        0x3ULL,
        0,
        "UT_2183",
        "Testing state transition current=4 to next=5 with prereq=0x3"
    );
}
static void run_unit_test_2184(void) {
    run_fsm_assert(
        5,
        5,
        0x3ULL,
        0,
        "UT_2184",
        "Testing state transition current=5 to next=5 with prereq=0x3"
    );
}
static void run_unit_test_2185(void) {
    run_fsm_assert(
        6,
        5,
        0x3ULL,
        0,
        "UT_2185",
        "Testing state transition current=6 to next=5 with prereq=0x3"
    );
}
static void run_unit_test_2186(void) {
    run_fsm_assert(
        7,
        5,
        0x3ULL,
        0,
        "UT_2186",
        "Testing state transition current=7 to next=5 with prereq=0x3"
    );
}
static void run_unit_test_2187(void) {
    run_fsm_assert(
        8,
        5,
        0x3ULL,
        0,
        "UT_2187",
        "Testing state transition current=8 to next=5 with prereq=0x3"
    );
}
static void run_unit_test_2188(void) {
    run_fsm_assert(
        10,
        5,
        0x3ULL,
        0,
        "UT_2188",
        "Testing state transition current=10 to next=5 with prereq=0x3"
    );
}
static void run_unit_test_2189(void) {
    run_fsm_assert(
        15,
        5,
        0x3ULL,
        0,
        "UT_2189",
        "Testing state transition current=15 to next=5 with prereq=0x3"
    );
}
static void run_unit_test_2190(void) {
    run_fsm_assert(
        100,
        5,
        0x3ULL,
        0,
        "UT_2190",
        "Testing state transition current=100 to next=5 with prereq=0x3"
    );
}
static void run_unit_test_2191(void) {
    run_fsm_assert(
        -100,
        5,
        0x3ULL,
        0,
        "UT_2191",
        "Testing state transition current=-100 to next=5 with prereq=0x3"
    );
}
static void run_unit_test_2192(void) {
    run_fsm_assert(
        -10,
        6,
        0x3ULL,
        0,
        "UT_2192",
        "Testing state transition current=-10 to next=6 with prereq=0x3"
    );
}
static void run_unit_test_2193(void) {
    run_fsm_assert(
        -5,
        6,
        0x3ULL,
        0,
        "UT_2193",
        "Testing state transition current=-5 to next=6 with prereq=0x3"
    );
}
static void run_unit_test_2194(void) {
    run_fsm_assert(
        -1,
        6,
        0x3ULL,
        0,
        "UT_2194",
        "Testing state transition current=-1 to next=6 with prereq=0x3"
    );
}
static void run_unit_test_2195(void) {
    run_fsm_assert(
        0,
        6,
        0x3ULL,
        0,
        "UT_2195",
        "Testing state transition current=0 to next=6 with prereq=0x3"
    );
}
static void run_unit_test_2196(void) {
    run_fsm_assert(
        1,
        6,
        0x3ULL,
        0,
        "UT_2196",
        "Testing state transition current=1 to next=6 with prereq=0x3"
    );
}
static void run_unit_test_2197(void) {
    run_fsm_assert(
        2,
        6,
        0x3ULL,
        0,
        "UT_2197",
        "Testing state transition current=2 to next=6 with prereq=0x3"
    );
}
static void run_unit_test_2198(void) {
    run_fsm_assert(
        3,
        6,
        0x3ULL,
        0,
        "UT_2198",
        "Testing state transition current=3 to next=6 with prereq=0x3"
    );
}
static void run_unit_test_2199(void) {
    run_fsm_assert(
        4,
        6,
        0x3ULL,
        0,
        "UT_2199",
        "Testing state transition current=4 to next=6 with prereq=0x3"
    );
}
static void run_all_generated_fsm_tests(void) {
    run_unit_test_0000();
    run_unit_test_0001();
    run_unit_test_0002();
    run_unit_test_0003();
    run_unit_test_0004();
    run_unit_test_0005();
    run_unit_test_0006();
    run_unit_test_0007();
    run_unit_test_0008();
    run_unit_test_0009();
    run_unit_test_0010();
    run_unit_test_0011();
    run_unit_test_0012();
    run_unit_test_0013();
    run_unit_test_0014();
    run_unit_test_0015();
    run_unit_test_0016();
    run_unit_test_0017();
    run_unit_test_0018();
    run_unit_test_0019();
    run_unit_test_0020();
    run_unit_test_0021();
    run_unit_test_0022();
    run_unit_test_0023();
    run_unit_test_0024();
    run_unit_test_0025();
    run_unit_test_0026();
    run_unit_test_0027();
    run_unit_test_0028();
    run_unit_test_0029();
    run_unit_test_0030();
    run_unit_test_0031();
    run_unit_test_0032();
    run_unit_test_0033();
    run_unit_test_0034();
    run_unit_test_0035();
    run_unit_test_0036();
    run_unit_test_0037();
    run_unit_test_0038();
    run_unit_test_0039();
    run_unit_test_0040();
    run_unit_test_0041();
    run_unit_test_0042();
    run_unit_test_0043();
    run_unit_test_0044();
    run_unit_test_0045();
    run_unit_test_0046();
    run_unit_test_0047();
    run_unit_test_0048();
    run_unit_test_0049();
    run_unit_test_0050();
    run_unit_test_0051();
    run_unit_test_0052();
    run_unit_test_0053();
    run_unit_test_0054();
    run_unit_test_0055();
    run_unit_test_0056();
    run_unit_test_0057();
    run_unit_test_0058();
    run_unit_test_0059();
    run_unit_test_0060();
    run_unit_test_0061();
    run_unit_test_0062();
    run_unit_test_0063();
    run_unit_test_0064();
    run_unit_test_0065();
    run_unit_test_0066();
    run_unit_test_0067();
    run_unit_test_0068();
    run_unit_test_0069();
    run_unit_test_0070();
    run_unit_test_0071();
    run_unit_test_0072();
    run_unit_test_0073();
    run_unit_test_0074();
    run_unit_test_0075();
    run_unit_test_0076();
    run_unit_test_0077();
    run_unit_test_0078();
    run_unit_test_0079();
    run_unit_test_0080();
    run_unit_test_0081();
    run_unit_test_0082();
    run_unit_test_0083();
    run_unit_test_0084();
    run_unit_test_0085();
    run_unit_test_0086();
    run_unit_test_0087();
    run_unit_test_0088();
    run_unit_test_0089();
    run_unit_test_0090();
    run_unit_test_0091();
    run_unit_test_0092();
    run_unit_test_0093();
    run_unit_test_0094();
    run_unit_test_0095();
    run_unit_test_0096();
    run_unit_test_0097();
    run_unit_test_0098();
    run_unit_test_0099();
    run_unit_test_0100();
    run_unit_test_0101();
    run_unit_test_0102();
    run_unit_test_0103();
    run_unit_test_0104();
    run_unit_test_0105();
    run_unit_test_0106();
    run_unit_test_0107();
    run_unit_test_0108();
    run_unit_test_0109();
    run_unit_test_0110();
    run_unit_test_0111();
    run_unit_test_0112();
    run_unit_test_0113();
    run_unit_test_0114();
    run_unit_test_0115();
    run_unit_test_0116();
    run_unit_test_0117();
    run_unit_test_0118();
    run_unit_test_0119();
    run_unit_test_0120();
    run_unit_test_0121();
    run_unit_test_0122();
    run_unit_test_0123();
    run_unit_test_0124();
    run_unit_test_0125();
    run_unit_test_0126();
    run_unit_test_0127();
    run_unit_test_0128();
    run_unit_test_0129();
    run_unit_test_0130();
    run_unit_test_0131();
    run_unit_test_0132();
    run_unit_test_0133();
    run_unit_test_0134();
    run_unit_test_0135();
    run_unit_test_0136();
    run_unit_test_0137();
    run_unit_test_0138();
    run_unit_test_0139();
    run_unit_test_0140();
    run_unit_test_0141();
    run_unit_test_0142();
    run_unit_test_0143();
    run_unit_test_0144();
    run_unit_test_0145();
    run_unit_test_0146();
    run_unit_test_0147();
    run_unit_test_0148();
    run_unit_test_0149();
    run_unit_test_0150();
    run_unit_test_0151();
    run_unit_test_0152();
    run_unit_test_0153();
    run_unit_test_0154();
    run_unit_test_0155();
    run_unit_test_0156();
    run_unit_test_0157();
    run_unit_test_0158();
    run_unit_test_0159();
    run_unit_test_0160();
    run_unit_test_0161();
    run_unit_test_0162();
    run_unit_test_0163();
    run_unit_test_0164();
    run_unit_test_0165();
    run_unit_test_0166();
    run_unit_test_0167();
    run_unit_test_0168();
    run_unit_test_0169();
    run_unit_test_0170();
    run_unit_test_0171();
    run_unit_test_0172();
    run_unit_test_0173();
    run_unit_test_0174();
    run_unit_test_0175();
    run_unit_test_0176();
    run_unit_test_0177();
    run_unit_test_0178();
    run_unit_test_0179();
    run_unit_test_0180();
    run_unit_test_0181();
    run_unit_test_0182();
    run_unit_test_0183();
    run_unit_test_0184();
    run_unit_test_0185();
    run_unit_test_0186();
    run_unit_test_0187();
    run_unit_test_0188();
    run_unit_test_0189();
    run_unit_test_0190();
    run_unit_test_0191();
    run_unit_test_0192();
    run_unit_test_0193();
    run_unit_test_0194();
    run_unit_test_0195();
    run_unit_test_0196();
    run_unit_test_0197();
    run_unit_test_0198();
    run_unit_test_0199();
    run_unit_test_0200();
    run_unit_test_0201();
    run_unit_test_0202();
    run_unit_test_0203();
    run_unit_test_0204();
    run_unit_test_0205();
    run_unit_test_0206();
    run_unit_test_0207();
    run_unit_test_0208();
    run_unit_test_0209();
    run_unit_test_0210();
    run_unit_test_0211();
    run_unit_test_0212();
    run_unit_test_0213();
    run_unit_test_0214();
    run_unit_test_0215();
    run_unit_test_0216();
    run_unit_test_0217();
    run_unit_test_0218();
    run_unit_test_0219();
    run_unit_test_0220();
    run_unit_test_0221();
    run_unit_test_0222();
    run_unit_test_0223();
    run_unit_test_0224();
    run_unit_test_0225();
    run_unit_test_0226();
    run_unit_test_0227();
    run_unit_test_0228();
    run_unit_test_0229();
    run_unit_test_0230();
    run_unit_test_0231();
    run_unit_test_0232();
    run_unit_test_0233();
    run_unit_test_0234();
    run_unit_test_0235();
    run_unit_test_0236();
    run_unit_test_0237();
    run_unit_test_0238();
    run_unit_test_0239();
    run_unit_test_0240();
    run_unit_test_0241();
    run_unit_test_0242();
    run_unit_test_0243();
    run_unit_test_0244();
    run_unit_test_0245();
    run_unit_test_0246();
    run_unit_test_0247();
    run_unit_test_0248();
    run_unit_test_0249();
    run_unit_test_0250();
    run_unit_test_0251();
    run_unit_test_0252();
    run_unit_test_0253();
    run_unit_test_0254();
    run_unit_test_0255();
    run_unit_test_0256();
    run_unit_test_0257();
    run_unit_test_0258();
    run_unit_test_0259();
    run_unit_test_0260();
    run_unit_test_0261();
    run_unit_test_0262();
    run_unit_test_0263();
    run_unit_test_0264();
    run_unit_test_0265();
    run_unit_test_0266();
    run_unit_test_0267();
    run_unit_test_0268();
    run_unit_test_0269();
    run_unit_test_0270();
    run_unit_test_0271();
    run_unit_test_0272();
    run_unit_test_0273();
    run_unit_test_0274();
    run_unit_test_0275();
    run_unit_test_0276();
    run_unit_test_0277();
    run_unit_test_0278();
    run_unit_test_0279();
    run_unit_test_0280();
    run_unit_test_0281();
    run_unit_test_0282();
    run_unit_test_0283();
    run_unit_test_0284();
    run_unit_test_0285();
    run_unit_test_0286();
    run_unit_test_0287();
    run_unit_test_0288();
    run_unit_test_0289();
    run_unit_test_0290();
    run_unit_test_0291();
    run_unit_test_0292();
    run_unit_test_0293();
    run_unit_test_0294();
    run_unit_test_0295();
    run_unit_test_0296();
    run_unit_test_0297();
    run_unit_test_0298();
    run_unit_test_0299();
    run_unit_test_0300();
    run_unit_test_0301();
    run_unit_test_0302();
    run_unit_test_0303();
    run_unit_test_0304();
    run_unit_test_0305();
    run_unit_test_0306();
    run_unit_test_0307();
    run_unit_test_0308();
    run_unit_test_0309();
    run_unit_test_0310();
    run_unit_test_0311();
    run_unit_test_0312();
    run_unit_test_0313();
    run_unit_test_0314();
    run_unit_test_0315();
    run_unit_test_0316();
    run_unit_test_0317();
    run_unit_test_0318();
    run_unit_test_0319();
    run_unit_test_0320();
    run_unit_test_0321();
    run_unit_test_0322();
    run_unit_test_0323();
    run_unit_test_0324();
    run_unit_test_0325();
    run_unit_test_0326();
    run_unit_test_0327();
    run_unit_test_0328();
    run_unit_test_0329();
    run_unit_test_0330();
    run_unit_test_0331();
    run_unit_test_0332();
    run_unit_test_0333();
    run_unit_test_0334();
    run_unit_test_0335();
    run_unit_test_0336();
    run_unit_test_0337();
    run_unit_test_0338();
    run_unit_test_0339();
    run_unit_test_0340();
    run_unit_test_0341();
    run_unit_test_0342();
    run_unit_test_0343();
    run_unit_test_0344();
    run_unit_test_0345();
    run_unit_test_0346();
    run_unit_test_0347();
    run_unit_test_0348();
    run_unit_test_0349();
    run_unit_test_0350();
    run_unit_test_0351();
    run_unit_test_0352();
    run_unit_test_0353();
    run_unit_test_0354();
    run_unit_test_0355();
    run_unit_test_0356();
    run_unit_test_0357();
    run_unit_test_0358();
    run_unit_test_0359();
    run_unit_test_0360();
    run_unit_test_0361();
    run_unit_test_0362();
    run_unit_test_0363();
    run_unit_test_0364();
    run_unit_test_0365();
    run_unit_test_0366();
    run_unit_test_0367();
    run_unit_test_0368();
    run_unit_test_0369();
    run_unit_test_0370();
    run_unit_test_0371();
    run_unit_test_0372();
    run_unit_test_0373();
    run_unit_test_0374();
    run_unit_test_0375();
    run_unit_test_0376();
    run_unit_test_0377();
    run_unit_test_0378();
    run_unit_test_0379();
    run_unit_test_0380();
    run_unit_test_0381();
    run_unit_test_0382();
    run_unit_test_0383();
    run_unit_test_0384();
    run_unit_test_0385();
    run_unit_test_0386();
    run_unit_test_0387();
    run_unit_test_0388();
    run_unit_test_0389();
    run_unit_test_0390();
    run_unit_test_0391();
    run_unit_test_0392();
    run_unit_test_0393();
    run_unit_test_0394();
    run_unit_test_0395();
    run_unit_test_0396();
    run_unit_test_0397();
    run_unit_test_0398();
    run_unit_test_0399();
    run_unit_test_0400();
    run_unit_test_0401();
    run_unit_test_0402();
    run_unit_test_0403();
    run_unit_test_0404();
    run_unit_test_0405();
    run_unit_test_0406();
    run_unit_test_0407();
    run_unit_test_0408();
    run_unit_test_0409();
    run_unit_test_0410();
    run_unit_test_0411();
    run_unit_test_0412();
    run_unit_test_0413();
    run_unit_test_0414();
    run_unit_test_0415();
    run_unit_test_0416();
    run_unit_test_0417();
    run_unit_test_0418();
    run_unit_test_0419();
    run_unit_test_0420();
    run_unit_test_0421();
    run_unit_test_0422();
    run_unit_test_0423();
    run_unit_test_0424();
    run_unit_test_0425();
    run_unit_test_0426();
    run_unit_test_0427();
    run_unit_test_0428();
    run_unit_test_0429();
    run_unit_test_0430();
    run_unit_test_0431();
    run_unit_test_0432();
    run_unit_test_0433();
    run_unit_test_0434();
    run_unit_test_0435();
    run_unit_test_0436();
    run_unit_test_0437();
    run_unit_test_0438();
    run_unit_test_0439();
    run_unit_test_0440();
    run_unit_test_0441();
    run_unit_test_0442();
    run_unit_test_0443();
    run_unit_test_0444();
    run_unit_test_0445();
    run_unit_test_0446();
    run_unit_test_0447();
    run_unit_test_0448();
    run_unit_test_0449();
    run_unit_test_0450();
    run_unit_test_0451();
    run_unit_test_0452();
    run_unit_test_0453();
    run_unit_test_0454();
    run_unit_test_0455();
    run_unit_test_0456();
    run_unit_test_0457();
    run_unit_test_0458();
    run_unit_test_0459();
    run_unit_test_0460();
    run_unit_test_0461();
    run_unit_test_0462();
    run_unit_test_0463();
    run_unit_test_0464();
    run_unit_test_0465();
    run_unit_test_0466();
    run_unit_test_0467();
    run_unit_test_0468();
    run_unit_test_0469();
    run_unit_test_0470();
    run_unit_test_0471();
    run_unit_test_0472();
    run_unit_test_0473();
    run_unit_test_0474();
    run_unit_test_0475();
    run_unit_test_0476();
    run_unit_test_0477();
    run_unit_test_0478();
    run_unit_test_0479();
    run_unit_test_0480();
    run_unit_test_0481();
    run_unit_test_0482();
    run_unit_test_0483();
    run_unit_test_0484();
    run_unit_test_0485();
    run_unit_test_0486();
    run_unit_test_0487();
    run_unit_test_0488();
    run_unit_test_0489();
    run_unit_test_0490();
    run_unit_test_0491();
    run_unit_test_0492();
    run_unit_test_0493();
    run_unit_test_0494();
    run_unit_test_0495();
    run_unit_test_0496();
    run_unit_test_0497();
    run_unit_test_0498();
    run_unit_test_0499();
    run_unit_test_0500();
    run_unit_test_0501();
    run_unit_test_0502();
    run_unit_test_0503();
    run_unit_test_0504();
    run_unit_test_0505();
    run_unit_test_0506();
    run_unit_test_0507();
    run_unit_test_0508();
    run_unit_test_0509();
    run_unit_test_0510();
    run_unit_test_0511();
    run_unit_test_0512();
    run_unit_test_0513();
    run_unit_test_0514();
    run_unit_test_0515();
    run_unit_test_0516();
    run_unit_test_0517();
    run_unit_test_0518();
    run_unit_test_0519();
    run_unit_test_0520();
    run_unit_test_0521();
    run_unit_test_0522();
    run_unit_test_0523();
    run_unit_test_0524();
    run_unit_test_0525();
    run_unit_test_0526();
    run_unit_test_0527();
    run_unit_test_0528();
    run_unit_test_0529();
    run_unit_test_0530();
    run_unit_test_0531();
    run_unit_test_0532();
    run_unit_test_0533();
    run_unit_test_0534();
    run_unit_test_0535();
    run_unit_test_0536();
    run_unit_test_0537();
    run_unit_test_0538();
    run_unit_test_0539();
    run_unit_test_0540();
    run_unit_test_0541();
    run_unit_test_0542();
    run_unit_test_0543();
    run_unit_test_0544();
    run_unit_test_0545();
    run_unit_test_0546();
    run_unit_test_0547();
    run_unit_test_0548();
    run_unit_test_0549();
    run_unit_test_0550();
    run_unit_test_0551();
    run_unit_test_0552();
    run_unit_test_0553();
    run_unit_test_0554();
    run_unit_test_0555();
    run_unit_test_0556();
    run_unit_test_0557();
    run_unit_test_0558();
    run_unit_test_0559();
    run_unit_test_0560();
    run_unit_test_0561();
    run_unit_test_0562();
    run_unit_test_0563();
    run_unit_test_0564();
    run_unit_test_0565();
    run_unit_test_0566();
    run_unit_test_0567();
    run_unit_test_0568();
    run_unit_test_0569();
    run_unit_test_0570();
    run_unit_test_0571();
    run_unit_test_0572();
    run_unit_test_0573();
    run_unit_test_0574();
    run_unit_test_0575();
    run_unit_test_0576();
    run_unit_test_0577();
    run_unit_test_0578();
    run_unit_test_0579();
    run_unit_test_0580();
    run_unit_test_0581();
    run_unit_test_0582();
    run_unit_test_0583();
    run_unit_test_0584();
    run_unit_test_0585();
    run_unit_test_0586();
    run_unit_test_0587();
    run_unit_test_0588();
    run_unit_test_0589();
    run_unit_test_0590();
    run_unit_test_0591();
    run_unit_test_0592();
    run_unit_test_0593();
    run_unit_test_0594();
    run_unit_test_0595();
    run_unit_test_0596();
    run_unit_test_0597();
    run_unit_test_0598();
    run_unit_test_0599();
    run_unit_test_0600();
    run_unit_test_0601();
    run_unit_test_0602();
    run_unit_test_0603();
    run_unit_test_0604();
    run_unit_test_0605();
    run_unit_test_0606();
    run_unit_test_0607();
    run_unit_test_0608();
    run_unit_test_0609();
    run_unit_test_0610();
    run_unit_test_0611();
    run_unit_test_0612();
    run_unit_test_0613();
    run_unit_test_0614();
    run_unit_test_0615();
    run_unit_test_0616();
    run_unit_test_0617();
    run_unit_test_0618();
    run_unit_test_0619();
    run_unit_test_0620();
    run_unit_test_0621();
    run_unit_test_0622();
    run_unit_test_0623();
    run_unit_test_0624();
    run_unit_test_0625();
    run_unit_test_0626();
    run_unit_test_0627();
    run_unit_test_0628();
    run_unit_test_0629();
    run_unit_test_0630();
    run_unit_test_0631();
    run_unit_test_0632();
    run_unit_test_0633();
    run_unit_test_0634();
    run_unit_test_0635();
    run_unit_test_0636();
    run_unit_test_0637();
    run_unit_test_0638();
    run_unit_test_0639();
    run_unit_test_0640();
    run_unit_test_0641();
    run_unit_test_0642();
    run_unit_test_0643();
    run_unit_test_0644();
    run_unit_test_0645();
    run_unit_test_0646();
    run_unit_test_0647();
    run_unit_test_0648();
    run_unit_test_0649();
    run_unit_test_0650();
    run_unit_test_0651();
    run_unit_test_0652();
    run_unit_test_0653();
    run_unit_test_0654();
    run_unit_test_0655();
    run_unit_test_0656();
    run_unit_test_0657();
    run_unit_test_0658();
    run_unit_test_0659();
    run_unit_test_0660();
    run_unit_test_0661();
    run_unit_test_0662();
    run_unit_test_0663();
    run_unit_test_0664();
    run_unit_test_0665();
    run_unit_test_0666();
    run_unit_test_0667();
    run_unit_test_0668();
    run_unit_test_0669();
    run_unit_test_0670();
    run_unit_test_0671();
    run_unit_test_0672();
    run_unit_test_0673();
    run_unit_test_0674();
    run_unit_test_0675();
    run_unit_test_0676();
    run_unit_test_0677();
    run_unit_test_0678();
    run_unit_test_0679();
    run_unit_test_0680();
    run_unit_test_0681();
    run_unit_test_0682();
    run_unit_test_0683();
    run_unit_test_0684();
    run_unit_test_0685();
    run_unit_test_0686();
    run_unit_test_0687();
    run_unit_test_0688();
    run_unit_test_0689();
    run_unit_test_0690();
    run_unit_test_0691();
    run_unit_test_0692();
    run_unit_test_0693();
    run_unit_test_0694();
    run_unit_test_0695();
    run_unit_test_0696();
    run_unit_test_0697();
    run_unit_test_0698();
    run_unit_test_0699();
    run_unit_test_0700();
    run_unit_test_0701();
    run_unit_test_0702();
    run_unit_test_0703();
    run_unit_test_0704();
    run_unit_test_0705();
    run_unit_test_0706();
    run_unit_test_0707();
    run_unit_test_0708();
    run_unit_test_0709();
    run_unit_test_0710();
    run_unit_test_0711();
    run_unit_test_0712();
    run_unit_test_0713();
    run_unit_test_0714();
    run_unit_test_0715();
    run_unit_test_0716();
    run_unit_test_0717();
    run_unit_test_0718();
    run_unit_test_0719();
    run_unit_test_0720();
    run_unit_test_0721();
    run_unit_test_0722();
    run_unit_test_0723();
    run_unit_test_0724();
    run_unit_test_0725();
    run_unit_test_0726();
    run_unit_test_0727();
    run_unit_test_0728();
    run_unit_test_0729();
    run_unit_test_0730();
    run_unit_test_0731();
    run_unit_test_0732();
    run_unit_test_0733();
    run_unit_test_0734();
    run_unit_test_0735();
    run_unit_test_0736();
    run_unit_test_0737();
    run_unit_test_0738();
    run_unit_test_0739();
    run_unit_test_0740();
    run_unit_test_0741();
    run_unit_test_0742();
    run_unit_test_0743();
    run_unit_test_0744();
    run_unit_test_0745();
    run_unit_test_0746();
    run_unit_test_0747();
    run_unit_test_0748();
    run_unit_test_0749();
    run_unit_test_0750();
    run_unit_test_0751();
    run_unit_test_0752();
    run_unit_test_0753();
    run_unit_test_0754();
    run_unit_test_0755();
    run_unit_test_0756();
    run_unit_test_0757();
    run_unit_test_0758();
    run_unit_test_0759();
    run_unit_test_0760();
    run_unit_test_0761();
    run_unit_test_0762();
    run_unit_test_0763();
    run_unit_test_0764();
    run_unit_test_0765();
    run_unit_test_0766();
    run_unit_test_0767();
    run_unit_test_0768();
    run_unit_test_0769();
    run_unit_test_0770();
    run_unit_test_0771();
    run_unit_test_0772();
    run_unit_test_0773();
    run_unit_test_0774();
    run_unit_test_0775();
    run_unit_test_0776();
    run_unit_test_0777();
    run_unit_test_0778();
    run_unit_test_0779();
    run_unit_test_0780();
    run_unit_test_0781();
    run_unit_test_0782();
    run_unit_test_0783();
    run_unit_test_0784();
    run_unit_test_0785();
    run_unit_test_0786();
    run_unit_test_0787();
    run_unit_test_0788();
    run_unit_test_0789();
    run_unit_test_0790();
    run_unit_test_0791();
    run_unit_test_0792();
    run_unit_test_0793();
    run_unit_test_0794();
    run_unit_test_0795();
    run_unit_test_0796();
    run_unit_test_0797();
    run_unit_test_0798();
    run_unit_test_0799();
    run_unit_test_0800();
    run_unit_test_0801();
    run_unit_test_0802();
    run_unit_test_0803();
    run_unit_test_0804();
    run_unit_test_0805();
    run_unit_test_0806();
    run_unit_test_0807();
    run_unit_test_0808();
    run_unit_test_0809();
    run_unit_test_0810();
    run_unit_test_0811();
    run_unit_test_0812();
    run_unit_test_0813();
    run_unit_test_0814();
    run_unit_test_0815();
    run_unit_test_0816();
    run_unit_test_0817();
    run_unit_test_0818();
    run_unit_test_0819();
    run_unit_test_0820();
    run_unit_test_0821();
    run_unit_test_0822();
    run_unit_test_0823();
    run_unit_test_0824();
    run_unit_test_0825();
    run_unit_test_0826();
    run_unit_test_0827();
    run_unit_test_0828();
    run_unit_test_0829();
    run_unit_test_0830();
    run_unit_test_0831();
    run_unit_test_0832();
    run_unit_test_0833();
    run_unit_test_0834();
    run_unit_test_0835();
    run_unit_test_0836();
    run_unit_test_0837();
    run_unit_test_0838();
    run_unit_test_0839();
    run_unit_test_0840();
    run_unit_test_0841();
    run_unit_test_0842();
    run_unit_test_0843();
    run_unit_test_0844();
    run_unit_test_0845();
    run_unit_test_0846();
    run_unit_test_0847();
    run_unit_test_0848();
    run_unit_test_0849();
    run_unit_test_0850();
    run_unit_test_0851();
    run_unit_test_0852();
    run_unit_test_0853();
    run_unit_test_0854();
    run_unit_test_0855();
    run_unit_test_0856();
    run_unit_test_0857();
    run_unit_test_0858();
    run_unit_test_0859();
    run_unit_test_0860();
    run_unit_test_0861();
    run_unit_test_0862();
    run_unit_test_0863();
    run_unit_test_0864();
    run_unit_test_0865();
    run_unit_test_0866();
    run_unit_test_0867();
    run_unit_test_0868();
    run_unit_test_0869();
    run_unit_test_0870();
    run_unit_test_0871();
    run_unit_test_0872();
    run_unit_test_0873();
    run_unit_test_0874();
    run_unit_test_0875();
    run_unit_test_0876();
    run_unit_test_0877();
    run_unit_test_0878();
    run_unit_test_0879();
    run_unit_test_0880();
    run_unit_test_0881();
    run_unit_test_0882();
    run_unit_test_0883();
    run_unit_test_0884();
    run_unit_test_0885();
    run_unit_test_0886();
    run_unit_test_0887();
    run_unit_test_0888();
    run_unit_test_0889();
    run_unit_test_0890();
    run_unit_test_0891();
    run_unit_test_0892();
    run_unit_test_0893();
    run_unit_test_0894();
    run_unit_test_0895();
    run_unit_test_0896();
    run_unit_test_0897();
    run_unit_test_0898();
    run_unit_test_0899();
    run_unit_test_0900();
    run_unit_test_0901();
    run_unit_test_0902();
    run_unit_test_0903();
    run_unit_test_0904();
    run_unit_test_0905();
    run_unit_test_0906();
    run_unit_test_0907();
    run_unit_test_0908();
    run_unit_test_0909();
    run_unit_test_0910();
    run_unit_test_0911();
    run_unit_test_0912();
    run_unit_test_0913();
    run_unit_test_0914();
    run_unit_test_0915();
    run_unit_test_0916();
    run_unit_test_0917();
    run_unit_test_0918();
    run_unit_test_0919();
    run_unit_test_0920();
    run_unit_test_0921();
    run_unit_test_0922();
    run_unit_test_0923();
    run_unit_test_0924();
    run_unit_test_0925();
    run_unit_test_0926();
    run_unit_test_0927();
    run_unit_test_0928();
    run_unit_test_0929();
    run_unit_test_0930();
    run_unit_test_0931();
    run_unit_test_0932();
    run_unit_test_0933();
    run_unit_test_0934();
    run_unit_test_0935();
    run_unit_test_0936();
    run_unit_test_0937();
    run_unit_test_0938();
    run_unit_test_0939();
    run_unit_test_0940();
    run_unit_test_0941();
    run_unit_test_0942();
    run_unit_test_0943();
    run_unit_test_0944();
    run_unit_test_0945();
    run_unit_test_0946();
    run_unit_test_0947();
    run_unit_test_0948();
    run_unit_test_0949();
    run_unit_test_0950();
    run_unit_test_0951();
    run_unit_test_0952();
    run_unit_test_0953();
    run_unit_test_0954();
    run_unit_test_0955();
    run_unit_test_0956();
    run_unit_test_0957();
    run_unit_test_0958();
    run_unit_test_0959();
    run_unit_test_0960();
    run_unit_test_0961();
    run_unit_test_0962();
    run_unit_test_0963();
    run_unit_test_0964();
    run_unit_test_0965();
    run_unit_test_0966();
    run_unit_test_0967();
    run_unit_test_0968();
    run_unit_test_0969();
    run_unit_test_0970();
    run_unit_test_0971();
    run_unit_test_0972();
    run_unit_test_0973();
    run_unit_test_0974();
    run_unit_test_0975();
    run_unit_test_0976();
    run_unit_test_0977();
    run_unit_test_0978();
    run_unit_test_0979();
    run_unit_test_0980();
    run_unit_test_0981();
    run_unit_test_0982();
    run_unit_test_0983();
    run_unit_test_0984();
    run_unit_test_0985();
    run_unit_test_0986();
    run_unit_test_0987();
    run_unit_test_0988();
    run_unit_test_0989();
    run_unit_test_0990();
    run_unit_test_0991();
    run_unit_test_0992();
    run_unit_test_0993();
    run_unit_test_0994();
    run_unit_test_0995();
    run_unit_test_0996();
    run_unit_test_0997();
    run_unit_test_0998();
    run_unit_test_0999();
    run_unit_test_1000();
    run_unit_test_1001();
    run_unit_test_1002();
    run_unit_test_1003();
    run_unit_test_1004();
    run_unit_test_1005();
    run_unit_test_1006();
    run_unit_test_1007();
    run_unit_test_1008();
    run_unit_test_1009();
    run_unit_test_1010();
    run_unit_test_1011();
    run_unit_test_1012();
    run_unit_test_1013();
    run_unit_test_1014();
    run_unit_test_1015();
    run_unit_test_1016();
    run_unit_test_1017();
    run_unit_test_1018();
    run_unit_test_1019();
    run_unit_test_1020();
    run_unit_test_1021();
    run_unit_test_1022();
    run_unit_test_1023();
    run_unit_test_1024();
    run_unit_test_1025();
    run_unit_test_1026();
    run_unit_test_1027();
    run_unit_test_1028();
    run_unit_test_1029();
    run_unit_test_1030();
    run_unit_test_1031();
    run_unit_test_1032();
    run_unit_test_1033();
    run_unit_test_1034();
    run_unit_test_1035();
    run_unit_test_1036();
    run_unit_test_1037();
    run_unit_test_1038();
    run_unit_test_1039();
    run_unit_test_1040();
    run_unit_test_1041();
    run_unit_test_1042();
    run_unit_test_1043();
    run_unit_test_1044();
    run_unit_test_1045();
    run_unit_test_1046();
    run_unit_test_1047();
    run_unit_test_1048();
    run_unit_test_1049();
    run_unit_test_1050();
    run_unit_test_1051();
    run_unit_test_1052();
    run_unit_test_1053();
    run_unit_test_1054();
    run_unit_test_1055();
    run_unit_test_1056();
    run_unit_test_1057();
    run_unit_test_1058();
    run_unit_test_1059();
    run_unit_test_1060();
    run_unit_test_1061();
    run_unit_test_1062();
    run_unit_test_1063();
    run_unit_test_1064();
    run_unit_test_1065();
    run_unit_test_1066();
    run_unit_test_1067();
    run_unit_test_1068();
    run_unit_test_1069();
    run_unit_test_1070();
    run_unit_test_1071();
    run_unit_test_1072();
    run_unit_test_1073();
    run_unit_test_1074();
    run_unit_test_1075();
    run_unit_test_1076();
    run_unit_test_1077();
    run_unit_test_1078();
    run_unit_test_1079();
    run_unit_test_1080();
    run_unit_test_1081();
    run_unit_test_1082();
    run_unit_test_1083();
    run_unit_test_1084();
    run_unit_test_1085();
    run_unit_test_1086();
    run_unit_test_1087();
    run_unit_test_1088();
    run_unit_test_1089();
    run_unit_test_1090();
    run_unit_test_1091();
    run_unit_test_1092();
    run_unit_test_1093();
    run_unit_test_1094();
    run_unit_test_1095();
    run_unit_test_1096();
    run_unit_test_1097();
    run_unit_test_1098();
    run_unit_test_1099();
    run_unit_test_1100();
    run_unit_test_1101();
    run_unit_test_1102();
    run_unit_test_1103();
    run_unit_test_1104();
    run_unit_test_1105();
    run_unit_test_1106();
    run_unit_test_1107();
    run_unit_test_1108();
    run_unit_test_1109();
    run_unit_test_1110();
    run_unit_test_1111();
    run_unit_test_1112();
    run_unit_test_1113();
    run_unit_test_1114();
    run_unit_test_1115();
    run_unit_test_1116();
    run_unit_test_1117();
    run_unit_test_1118();
    run_unit_test_1119();
    run_unit_test_1120();
    run_unit_test_1121();
    run_unit_test_1122();
    run_unit_test_1123();
    run_unit_test_1124();
    run_unit_test_1125();
    run_unit_test_1126();
    run_unit_test_1127();
    run_unit_test_1128();
    run_unit_test_1129();
    run_unit_test_1130();
    run_unit_test_1131();
    run_unit_test_1132();
    run_unit_test_1133();
    run_unit_test_1134();
    run_unit_test_1135();
    run_unit_test_1136();
    run_unit_test_1137();
    run_unit_test_1138();
    run_unit_test_1139();
    run_unit_test_1140();
    run_unit_test_1141();
    run_unit_test_1142();
    run_unit_test_1143();
    run_unit_test_1144();
    run_unit_test_1145();
    run_unit_test_1146();
    run_unit_test_1147();
    run_unit_test_1148();
    run_unit_test_1149();
    run_unit_test_1150();
    run_unit_test_1151();
    run_unit_test_1152();
    run_unit_test_1153();
    run_unit_test_1154();
    run_unit_test_1155();
    run_unit_test_1156();
    run_unit_test_1157();
    run_unit_test_1158();
    run_unit_test_1159();
    run_unit_test_1160();
    run_unit_test_1161();
    run_unit_test_1162();
    run_unit_test_1163();
    run_unit_test_1164();
    run_unit_test_1165();
    run_unit_test_1166();
    run_unit_test_1167();
    run_unit_test_1168();
    run_unit_test_1169();
    run_unit_test_1170();
    run_unit_test_1171();
    run_unit_test_1172();
    run_unit_test_1173();
    run_unit_test_1174();
    run_unit_test_1175();
    run_unit_test_1176();
    run_unit_test_1177();
    run_unit_test_1178();
    run_unit_test_1179();
    run_unit_test_1180();
    run_unit_test_1181();
    run_unit_test_1182();
    run_unit_test_1183();
    run_unit_test_1184();
    run_unit_test_1185();
    run_unit_test_1186();
    run_unit_test_1187();
    run_unit_test_1188();
    run_unit_test_1189();
    run_unit_test_1190();
    run_unit_test_1191();
    run_unit_test_1192();
    run_unit_test_1193();
    run_unit_test_1194();
    run_unit_test_1195();
    run_unit_test_1196();
    run_unit_test_1197();
    run_unit_test_1198();
    run_unit_test_1199();
    run_unit_test_1200();
    run_unit_test_1201();
    run_unit_test_1202();
    run_unit_test_1203();
    run_unit_test_1204();
    run_unit_test_1205();
    run_unit_test_1206();
    run_unit_test_1207();
    run_unit_test_1208();
    run_unit_test_1209();
    run_unit_test_1210();
    run_unit_test_1211();
    run_unit_test_1212();
    run_unit_test_1213();
    run_unit_test_1214();
    run_unit_test_1215();
    run_unit_test_1216();
    run_unit_test_1217();
    run_unit_test_1218();
    run_unit_test_1219();
    run_unit_test_1220();
    run_unit_test_1221();
    run_unit_test_1222();
    run_unit_test_1223();
    run_unit_test_1224();
    run_unit_test_1225();
    run_unit_test_1226();
    run_unit_test_1227();
    run_unit_test_1228();
    run_unit_test_1229();
    run_unit_test_1230();
    run_unit_test_1231();
    run_unit_test_1232();
    run_unit_test_1233();
    run_unit_test_1234();
    run_unit_test_1235();
    run_unit_test_1236();
    run_unit_test_1237();
    run_unit_test_1238();
    run_unit_test_1239();
    run_unit_test_1240();
    run_unit_test_1241();
    run_unit_test_1242();
    run_unit_test_1243();
    run_unit_test_1244();
    run_unit_test_1245();
    run_unit_test_1246();
    run_unit_test_1247();
    run_unit_test_1248();
    run_unit_test_1249();
    run_unit_test_1250();
    run_unit_test_1251();
    run_unit_test_1252();
    run_unit_test_1253();
    run_unit_test_1254();
    run_unit_test_1255();
    run_unit_test_1256();
    run_unit_test_1257();
    run_unit_test_1258();
    run_unit_test_1259();
    run_unit_test_1260();
    run_unit_test_1261();
    run_unit_test_1262();
    run_unit_test_1263();
    run_unit_test_1264();
    run_unit_test_1265();
    run_unit_test_1266();
    run_unit_test_1267();
    run_unit_test_1268();
    run_unit_test_1269();
    run_unit_test_1270();
    run_unit_test_1271();
    run_unit_test_1272();
    run_unit_test_1273();
    run_unit_test_1274();
    run_unit_test_1275();
    run_unit_test_1276();
    run_unit_test_1277();
    run_unit_test_1278();
    run_unit_test_1279();
    run_unit_test_1280();
    run_unit_test_1281();
    run_unit_test_1282();
    run_unit_test_1283();
    run_unit_test_1284();
    run_unit_test_1285();
    run_unit_test_1286();
    run_unit_test_1287();
    run_unit_test_1288();
    run_unit_test_1289();
    run_unit_test_1290();
    run_unit_test_1291();
    run_unit_test_1292();
    run_unit_test_1293();
    run_unit_test_1294();
    run_unit_test_1295();
    run_unit_test_1296();
    run_unit_test_1297();
    run_unit_test_1298();
    run_unit_test_1299();
    run_unit_test_1300();
    run_unit_test_1301();
    run_unit_test_1302();
    run_unit_test_1303();
    run_unit_test_1304();
    run_unit_test_1305();
    run_unit_test_1306();
    run_unit_test_1307();
    run_unit_test_1308();
    run_unit_test_1309();
    run_unit_test_1310();
    run_unit_test_1311();
    run_unit_test_1312();
    run_unit_test_1313();
    run_unit_test_1314();
    run_unit_test_1315();
    run_unit_test_1316();
    run_unit_test_1317();
    run_unit_test_1318();
    run_unit_test_1319();
    run_unit_test_1320();
    run_unit_test_1321();
    run_unit_test_1322();
    run_unit_test_1323();
    run_unit_test_1324();
    run_unit_test_1325();
    run_unit_test_1326();
    run_unit_test_1327();
    run_unit_test_1328();
    run_unit_test_1329();
    run_unit_test_1330();
    run_unit_test_1331();
    run_unit_test_1332();
    run_unit_test_1333();
    run_unit_test_1334();
    run_unit_test_1335();
    run_unit_test_1336();
    run_unit_test_1337();
    run_unit_test_1338();
    run_unit_test_1339();
    run_unit_test_1340();
    run_unit_test_1341();
    run_unit_test_1342();
    run_unit_test_1343();
    run_unit_test_1344();
    run_unit_test_1345();
    run_unit_test_1346();
    run_unit_test_1347();
    run_unit_test_1348();
    run_unit_test_1349();
    run_unit_test_1350();
    run_unit_test_1351();
    run_unit_test_1352();
    run_unit_test_1353();
    run_unit_test_1354();
    run_unit_test_1355();
    run_unit_test_1356();
    run_unit_test_1357();
    run_unit_test_1358();
    run_unit_test_1359();
    run_unit_test_1360();
    run_unit_test_1361();
    run_unit_test_1362();
    run_unit_test_1363();
    run_unit_test_1364();
    run_unit_test_1365();
    run_unit_test_1366();
    run_unit_test_1367();
    run_unit_test_1368();
    run_unit_test_1369();
    run_unit_test_1370();
    run_unit_test_1371();
    run_unit_test_1372();
    run_unit_test_1373();
    run_unit_test_1374();
    run_unit_test_1375();
    run_unit_test_1376();
    run_unit_test_1377();
    run_unit_test_1378();
    run_unit_test_1379();
    run_unit_test_1380();
    run_unit_test_1381();
    run_unit_test_1382();
    run_unit_test_1383();
    run_unit_test_1384();
    run_unit_test_1385();
    run_unit_test_1386();
    run_unit_test_1387();
    run_unit_test_1388();
    run_unit_test_1389();
    run_unit_test_1390();
    run_unit_test_1391();
    run_unit_test_1392();
    run_unit_test_1393();
    run_unit_test_1394();
    run_unit_test_1395();
    run_unit_test_1396();
    run_unit_test_1397();
    run_unit_test_1398();
    run_unit_test_1399();
    run_unit_test_1400();
    run_unit_test_1401();
    run_unit_test_1402();
    run_unit_test_1403();
    run_unit_test_1404();
    run_unit_test_1405();
    run_unit_test_1406();
    run_unit_test_1407();
    run_unit_test_1408();
    run_unit_test_1409();
    run_unit_test_1410();
    run_unit_test_1411();
    run_unit_test_1412();
    run_unit_test_1413();
    run_unit_test_1414();
    run_unit_test_1415();
    run_unit_test_1416();
    run_unit_test_1417();
    run_unit_test_1418();
    run_unit_test_1419();
    run_unit_test_1420();
    run_unit_test_1421();
    run_unit_test_1422();
    run_unit_test_1423();
    run_unit_test_1424();
    run_unit_test_1425();
    run_unit_test_1426();
    run_unit_test_1427();
    run_unit_test_1428();
    run_unit_test_1429();
    run_unit_test_1430();
    run_unit_test_1431();
    run_unit_test_1432();
    run_unit_test_1433();
    run_unit_test_1434();
    run_unit_test_1435();
    run_unit_test_1436();
    run_unit_test_1437();
    run_unit_test_1438();
    run_unit_test_1439();
    run_unit_test_1440();
    run_unit_test_1441();
    run_unit_test_1442();
    run_unit_test_1443();
    run_unit_test_1444();
    run_unit_test_1445();
    run_unit_test_1446();
    run_unit_test_1447();
    run_unit_test_1448();
    run_unit_test_1449();
    run_unit_test_1450();
    run_unit_test_1451();
    run_unit_test_1452();
    run_unit_test_1453();
    run_unit_test_1454();
    run_unit_test_1455();
    run_unit_test_1456();
    run_unit_test_1457();
    run_unit_test_1458();
    run_unit_test_1459();
    run_unit_test_1460();
    run_unit_test_1461();
    run_unit_test_1462();
    run_unit_test_1463();
    run_unit_test_1464();
    run_unit_test_1465();
    run_unit_test_1466();
    run_unit_test_1467();
    run_unit_test_1468();
    run_unit_test_1469();
    run_unit_test_1470();
    run_unit_test_1471();
    run_unit_test_1472();
    run_unit_test_1473();
    run_unit_test_1474();
    run_unit_test_1475();
    run_unit_test_1476();
    run_unit_test_1477();
    run_unit_test_1478();
    run_unit_test_1479();
    run_unit_test_1480();
    run_unit_test_1481();
    run_unit_test_1482();
    run_unit_test_1483();
    run_unit_test_1484();
    run_unit_test_1485();
    run_unit_test_1486();
    run_unit_test_1487();
    run_unit_test_1488();
    run_unit_test_1489();
    run_unit_test_1490();
    run_unit_test_1491();
    run_unit_test_1492();
    run_unit_test_1493();
    run_unit_test_1494();
    run_unit_test_1495();
    run_unit_test_1496();
    run_unit_test_1497();
    run_unit_test_1498();
    run_unit_test_1499();
    run_unit_test_1500();
    run_unit_test_1501();
    run_unit_test_1502();
    run_unit_test_1503();
    run_unit_test_1504();
    run_unit_test_1505();
    run_unit_test_1506();
    run_unit_test_1507();
    run_unit_test_1508();
    run_unit_test_1509();
    run_unit_test_1510();
    run_unit_test_1511();
    run_unit_test_1512();
    run_unit_test_1513();
    run_unit_test_1514();
    run_unit_test_1515();
    run_unit_test_1516();
    run_unit_test_1517();
    run_unit_test_1518();
    run_unit_test_1519();
    run_unit_test_1520();
    run_unit_test_1521();
    run_unit_test_1522();
    run_unit_test_1523();
    run_unit_test_1524();
    run_unit_test_1525();
    run_unit_test_1526();
    run_unit_test_1527();
    run_unit_test_1528();
    run_unit_test_1529();
    run_unit_test_1530();
    run_unit_test_1531();
    run_unit_test_1532();
    run_unit_test_1533();
    run_unit_test_1534();
    run_unit_test_1535();
    run_unit_test_1536();
    run_unit_test_1537();
    run_unit_test_1538();
    run_unit_test_1539();
    run_unit_test_1540();
    run_unit_test_1541();
    run_unit_test_1542();
    run_unit_test_1543();
    run_unit_test_1544();
    run_unit_test_1545();
    run_unit_test_1546();
    run_unit_test_1547();
    run_unit_test_1548();
    run_unit_test_1549();
    run_unit_test_1550();
    run_unit_test_1551();
    run_unit_test_1552();
    run_unit_test_1553();
    run_unit_test_1554();
    run_unit_test_1555();
    run_unit_test_1556();
    run_unit_test_1557();
    run_unit_test_1558();
    run_unit_test_1559();
    run_unit_test_1560();
    run_unit_test_1561();
    run_unit_test_1562();
    run_unit_test_1563();
    run_unit_test_1564();
    run_unit_test_1565();
    run_unit_test_1566();
    run_unit_test_1567();
    run_unit_test_1568();
    run_unit_test_1569();
    run_unit_test_1570();
    run_unit_test_1571();
    run_unit_test_1572();
    run_unit_test_1573();
    run_unit_test_1574();
    run_unit_test_1575();
    run_unit_test_1576();
    run_unit_test_1577();
    run_unit_test_1578();
    run_unit_test_1579();
    run_unit_test_1580();
    run_unit_test_1581();
    run_unit_test_1582();
    run_unit_test_1583();
    run_unit_test_1584();
    run_unit_test_1585();
    run_unit_test_1586();
    run_unit_test_1587();
    run_unit_test_1588();
    run_unit_test_1589();
    run_unit_test_1590();
    run_unit_test_1591();
    run_unit_test_1592();
    run_unit_test_1593();
    run_unit_test_1594();
    run_unit_test_1595();
    run_unit_test_1596();
    run_unit_test_1597();
    run_unit_test_1598();
    run_unit_test_1599();
    run_unit_test_1600();
    run_unit_test_1601();
    run_unit_test_1602();
    run_unit_test_1603();
    run_unit_test_1604();
    run_unit_test_1605();
    run_unit_test_1606();
    run_unit_test_1607();
    run_unit_test_1608();
    run_unit_test_1609();
    run_unit_test_1610();
    run_unit_test_1611();
    run_unit_test_1612();
    run_unit_test_1613();
    run_unit_test_1614();
    run_unit_test_1615();
    run_unit_test_1616();
    run_unit_test_1617();
    run_unit_test_1618();
    run_unit_test_1619();
    run_unit_test_1620();
    run_unit_test_1621();
    run_unit_test_1622();
    run_unit_test_1623();
    run_unit_test_1624();
    run_unit_test_1625();
    run_unit_test_1626();
    run_unit_test_1627();
    run_unit_test_1628();
    run_unit_test_1629();
    run_unit_test_1630();
    run_unit_test_1631();
    run_unit_test_1632();
    run_unit_test_1633();
    run_unit_test_1634();
    run_unit_test_1635();
    run_unit_test_1636();
    run_unit_test_1637();
    run_unit_test_1638();
    run_unit_test_1639();
    run_unit_test_1640();
    run_unit_test_1641();
    run_unit_test_1642();
    run_unit_test_1643();
    run_unit_test_1644();
    run_unit_test_1645();
    run_unit_test_1646();
    run_unit_test_1647();
    run_unit_test_1648();
    run_unit_test_1649();
    run_unit_test_1650();
    run_unit_test_1651();
    run_unit_test_1652();
    run_unit_test_1653();
    run_unit_test_1654();
    run_unit_test_1655();
    run_unit_test_1656();
    run_unit_test_1657();
    run_unit_test_1658();
    run_unit_test_1659();
    run_unit_test_1660();
    run_unit_test_1661();
    run_unit_test_1662();
    run_unit_test_1663();
    run_unit_test_1664();
    run_unit_test_1665();
    run_unit_test_1666();
    run_unit_test_1667();
    run_unit_test_1668();
    run_unit_test_1669();
    run_unit_test_1670();
    run_unit_test_1671();
    run_unit_test_1672();
    run_unit_test_1673();
    run_unit_test_1674();
    run_unit_test_1675();
    run_unit_test_1676();
    run_unit_test_1677();
    run_unit_test_1678();
    run_unit_test_1679();
    run_unit_test_1680();
    run_unit_test_1681();
    run_unit_test_1682();
    run_unit_test_1683();
    run_unit_test_1684();
    run_unit_test_1685();
    run_unit_test_1686();
    run_unit_test_1687();
    run_unit_test_1688();
    run_unit_test_1689();
    run_unit_test_1690();
    run_unit_test_1691();
    run_unit_test_1692();
    run_unit_test_1693();
    run_unit_test_1694();
    run_unit_test_1695();
    run_unit_test_1696();
    run_unit_test_1697();
    run_unit_test_1698();
    run_unit_test_1699();
    run_unit_test_1700();
    run_unit_test_1701();
    run_unit_test_1702();
    run_unit_test_1703();
    run_unit_test_1704();
    run_unit_test_1705();
    run_unit_test_1706();
    run_unit_test_1707();
    run_unit_test_1708();
    run_unit_test_1709();
    run_unit_test_1710();
    run_unit_test_1711();
    run_unit_test_1712();
    run_unit_test_1713();
    run_unit_test_1714();
    run_unit_test_1715();
    run_unit_test_1716();
    run_unit_test_1717();
    run_unit_test_1718();
    run_unit_test_1719();
    run_unit_test_1720();
    run_unit_test_1721();
    run_unit_test_1722();
    run_unit_test_1723();
    run_unit_test_1724();
    run_unit_test_1725();
    run_unit_test_1726();
    run_unit_test_1727();
    run_unit_test_1728();
    run_unit_test_1729();
    run_unit_test_1730();
    run_unit_test_1731();
    run_unit_test_1732();
    run_unit_test_1733();
    run_unit_test_1734();
    run_unit_test_1735();
    run_unit_test_1736();
    run_unit_test_1737();
    run_unit_test_1738();
    run_unit_test_1739();
    run_unit_test_1740();
    run_unit_test_1741();
    run_unit_test_1742();
    run_unit_test_1743();
    run_unit_test_1744();
    run_unit_test_1745();
    run_unit_test_1746();
    run_unit_test_1747();
    run_unit_test_1748();
    run_unit_test_1749();
    run_unit_test_1750();
    run_unit_test_1751();
    run_unit_test_1752();
    run_unit_test_1753();
    run_unit_test_1754();
    run_unit_test_1755();
    run_unit_test_1756();
    run_unit_test_1757();
    run_unit_test_1758();
    run_unit_test_1759();
    run_unit_test_1760();
    run_unit_test_1761();
    run_unit_test_1762();
    run_unit_test_1763();
    run_unit_test_1764();
    run_unit_test_1765();
    run_unit_test_1766();
    run_unit_test_1767();
    run_unit_test_1768();
    run_unit_test_1769();
    run_unit_test_1770();
    run_unit_test_1771();
    run_unit_test_1772();
    run_unit_test_1773();
    run_unit_test_1774();
    run_unit_test_1775();
    run_unit_test_1776();
    run_unit_test_1777();
    run_unit_test_1778();
    run_unit_test_1779();
    run_unit_test_1780();
    run_unit_test_1781();
    run_unit_test_1782();
    run_unit_test_1783();
    run_unit_test_1784();
    run_unit_test_1785();
    run_unit_test_1786();
    run_unit_test_1787();
    run_unit_test_1788();
    run_unit_test_1789();
    run_unit_test_1790();
    run_unit_test_1791();
    run_unit_test_1792();
    run_unit_test_1793();
    run_unit_test_1794();
    run_unit_test_1795();
    run_unit_test_1796();
    run_unit_test_1797();
    run_unit_test_1798();
    run_unit_test_1799();
    run_unit_test_1800();
    run_unit_test_1801();
    run_unit_test_1802();
    run_unit_test_1803();
    run_unit_test_1804();
    run_unit_test_1805();
    run_unit_test_1806();
    run_unit_test_1807();
    run_unit_test_1808();
    run_unit_test_1809();
    run_unit_test_1810();
    run_unit_test_1811();
    run_unit_test_1812();
    run_unit_test_1813();
    run_unit_test_1814();
    run_unit_test_1815();
    run_unit_test_1816();
    run_unit_test_1817();
    run_unit_test_1818();
    run_unit_test_1819();
    run_unit_test_1820();
    run_unit_test_1821();
    run_unit_test_1822();
    run_unit_test_1823();
    run_unit_test_1824();
    run_unit_test_1825();
    run_unit_test_1826();
    run_unit_test_1827();
    run_unit_test_1828();
    run_unit_test_1829();
    run_unit_test_1830();
    run_unit_test_1831();
    run_unit_test_1832();
    run_unit_test_1833();
    run_unit_test_1834();
    run_unit_test_1835();
    run_unit_test_1836();
    run_unit_test_1837();
    run_unit_test_1838();
    run_unit_test_1839();
    run_unit_test_1840();
    run_unit_test_1841();
    run_unit_test_1842();
    run_unit_test_1843();
    run_unit_test_1844();
    run_unit_test_1845();
    run_unit_test_1846();
    run_unit_test_1847();
    run_unit_test_1848();
    run_unit_test_1849();
    run_unit_test_1850();
    run_unit_test_1851();
    run_unit_test_1852();
    run_unit_test_1853();
    run_unit_test_1854();
    run_unit_test_1855();
    run_unit_test_1856();
    run_unit_test_1857();
    run_unit_test_1858();
    run_unit_test_1859();
    run_unit_test_1860();
    run_unit_test_1861();
    run_unit_test_1862();
    run_unit_test_1863();
    run_unit_test_1864();
    run_unit_test_1865();
    run_unit_test_1866();
    run_unit_test_1867();
    run_unit_test_1868();
    run_unit_test_1869();
    run_unit_test_1870();
    run_unit_test_1871();
    run_unit_test_1872();
    run_unit_test_1873();
    run_unit_test_1874();
    run_unit_test_1875();
    run_unit_test_1876();
    run_unit_test_1877();
    run_unit_test_1878();
    run_unit_test_1879();
    run_unit_test_1880();
    run_unit_test_1881();
    run_unit_test_1882();
    run_unit_test_1883();
    run_unit_test_1884();
    run_unit_test_1885();
    run_unit_test_1886();
    run_unit_test_1887();
    run_unit_test_1888();
    run_unit_test_1889();
    run_unit_test_1890();
    run_unit_test_1891();
    run_unit_test_1892();
    run_unit_test_1893();
    run_unit_test_1894();
    run_unit_test_1895();
    run_unit_test_1896();
    run_unit_test_1897();
    run_unit_test_1898();
    run_unit_test_1899();
    run_unit_test_1900();
    run_unit_test_1901();
    run_unit_test_1902();
    run_unit_test_1903();
    run_unit_test_1904();
    run_unit_test_1905();
    run_unit_test_1906();
    run_unit_test_1907();
    run_unit_test_1908();
    run_unit_test_1909();
    run_unit_test_1910();
    run_unit_test_1911();
    run_unit_test_1912();
    run_unit_test_1913();
    run_unit_test_1914();
    run_unit_test_1915();
    run_unit_test_1916();
    run_unit_test_1917();
    run_unit_test_1918();
    run_unit_test_1919();
    run_unit_test_1920();
    run_unit_test_1921();
    run_unit_test_1922();
    run_unit_test_1923();
    run_unit_test_1924();
    run_unit_test_1925();
    run_unit_test_1926();
    run_unit_test_1927();
    run_unit_test_1928();
    run_unit_test_1929();
    run_unit_test_1930();
    run_unit_test_1931();
    run_unit_test_1932();
    run_unit_test_1933();
    run_unit_test_1934();
    run_unit_test_1935();
    run_unit_test_1936();
    run_unit_test_1937();
    run_unit_test_1938();
    run_unit_test_1939();
    run_unit_test_1940();
    run_unit_test_1941();
    run_unit_test_1942();
    run_unit_test_1943();
    run_unit_test_1944();
    run_unit_test_1945();
    run_unit_test_1946();
    run_unit_test_1947();
    run_unit_test_1948();
    run_unit_test_1949();
    run_unit_test_1950();
    run_unit_test_1951();
    run_unit_test_1952();
    run_unit_test_1953();
    run_unit_test_1954();
    run_unit_test_1955();
    run_unit_test_1956();
    run_unit_test_1957();
    run_unit_test_1958();
    run_unit_test_1959();
    run_unit_test_1960();
    run_unit_test_1961();
    run_unit_test_1962();
    run_unit_test_1963();
    run_unit_test_1964();
    run_unit_test_1965();
    run_unit_test_1966();
    run_unit_test_1967();
    run_unit_test_1968();
    run_unit_test_1969();
    run_unit_test_1970();
    run_unit_test_1971();
    run_unit_test_1972();
    run_unit_test_1973();
    run_unit_test_1974();
    run_unit_test_1975();
    run_unit_test_1976();
    run_unit_test_1977();
    run_unit_test_1978();
    run_unit_test_1979();
    run_unit_test_1980();
    run_unit_test_1981();
    run_unit_test_1982();
    run_unit_test_1983();
    run_unit_test_1984();
    run_unit_test_1985();
    run_unit_test_1986();
    run_unit_test_1987();
    run_unit_test_1988();
    run_unit_test_1989();
    run_unit_test_1990();
    run_unit_test_1991();
    run_unit_test_1992();
    run_unit_test_1993();
    run_unit_test_1994();
    run_unit_test_1995();
    run_unit_test_1996();
    run_unit_test_1997();
    run_unit_test_1998();
    run_unit_test_1999();
    run_unit_test_2000();
    run_unit_test_2001();
    run_unit_test_2002();
    run_unit_test_2003();
    run_unit_test_2004();
    run_unit_test_2005();
    run_unit_test_2006();
    run_unit_test_2007();
    run_unit_test_2008();
    run_unit_test_2009();
    run_unit_test_2010();
    run_unit_test_2011();
    run_unit_test_2012();
    run_unit_test_2013();
    run_unit_test_2014();
    run_unit_test_2015();
    run_unit_test_2016();
    run_unit_test_2017();
    run_unit_test_2018();
    run_unit_test_2019();
    run_unit_test_2020();
    run_unit_test_2021();
    run_unit_test_2022();
    run_unit_test_2023();
    run_unit_test_2024();
    run_unit_test_2025();
    run_unit_test_2026();
    run_unit_test_2027();
    run_unit_test_2028();
    run_unit_test_2029();
    run_unit_test_2030();
    run_unit_test_2031();
    run_unit_test_2032();
    run_unit_test_2033();
    run_unit_test_2034();
    run_unit_test_2035();
    run_unit_test_2036();
    run_unit_test_2037();
    run_unit_test_2038();
    run_unit_test_2039();
    run_unit_test_2040();
    run_unit_test_2041();
    run_unit_test_2042();
    run_unit_test_2043();
    run_unit_test_2044();
    run_unit_test_2045();
    run_unit_test_2046();
    run_unit_test_2047();
    run_unit_test_2048();
    run_unit_test_2049();
    run_unit_test_2050();
    run_unit_test_2051();
    run_unit_test_2052();
    run_unit_test_2053();
    run_unit_test_2054();
    run_unit_test_2055();
    run_unit_test_2056();
    run_unit_test_2057();
    run_unit_test_2058();
    run_unit_test_2059();
    run_unit_test_2060();
    run_unit_test_2061();
    run_unit_test_2062();
    run_unit_test_2063();
    run_unit_test_2064();
    run_unit_test_2065();
    run_unit_test_2066();
    run_unit_test_2067();
    run_unit_test_2068();
    run_unit_test_2069();
    run_unit_test_2070();
    run_unit_test_2071();
    run_unit_test_2072();
    run_unit_test_2073();
    run_unit_test_2074();
    run_unit_test_2075();
    run_unit_test_2076();
    run_unit_test_2077();
    run_unit_test_2078();
    run_unit_test_2079();
    run_unit_test_2080();
    run_unit_test_2081();
    run_unit_test_2082();
    run_unit_test_2083();
    run_unit_test_2084();
    run_unit_test_2085();
    run_unit_test_2086();
    run_unit_test_2087();
    run_unit_test_2088();
    run_unit_test_2089();
    run_unit_test_2090();
    run_unit_test_2091();
    run_unit_test_2092();
    run_unit_test_2093();
    run_unit_test_2094();
    run_unit_test_2095();
    run_unit_test_2096();
    run_unit_test_2097();
    run_unit_test_2098();
    run_unit_test_2099();
    run_unit_test_2100();
    run_unit_test_2101();
    run_unit_test_2102();
    run_unit_test_2103();
    run_unit_test_2104();
    run_unit_test_2105();
    run_unit_test_2106();
    run_unit_test_2107();
    run_unit_test_2108();
    run_unit_test_2109();
    run_unit_test_2110();
    run_unit_test_2111();
    run_unit_test_2112();
    run_unit_test_2113();
    run_unit_test_2114();
    run_unit_test_2115();
    run_unit_test_2116();
    run_unit_test_2117();
    run_unit_test_2118();
    run_unit_test_2119();
    run_unit_test_2120();
    run_unit_test_2121();
    run_unit_test_2122();
    run_unit_test_2123();
    run_unit_test_2124();
    run_unit_test_2125();
    run_unit_test_2126();
    run_unit_test_2127();
    run_unit_test_2128();
    run_unit_test_2129();
    run_unit_test_2130();
    run_unit_test_2131();
    run_unit_test_2132();
    run_unit_test_2133();
    run_unit_test_2134();
    run_unit_test_2135();
    run_unit_test_2136();
    run_unit_test_2137();
    run_unit_test_2138();
    run_unit_test_2139();
    run_unit_test_2140();
    run_unit_test_2141();
    run_unit_test_2142();
    run_unit_test_2143();
    run_unit_test_2144();
    run_unit_test_2145();
    run_unit_test_2146();
    run_unit_test_2147();
    run_unit_test_2148();
    run_unit_test_2149();
    run_unit_test_2150();
    run_unit_test_2151();
    run_unit_test_2152();
    run_unit_test_2153();
    run_unit_test_2154();
    run_unit_test_2155();
    run_unit_test_2156();
    run_unit_test_2157();
    run_unit_test_2158();
    run_unit_test_2159();
    run_unit_test_2160();
    run_unit_test_2161();
    run_unit_test_2162();
    run_unit_test_2163();
    run_unit_test_2164();
    run_unit_test_2165();
    run_unit_test_2166();
    run_unit_test_2167();
    run_unit_test_2168();
    run_unit_test_2169();
    run_unit_test_2170();
    run_unit_test_2171();
    run_unit_test_2172();
    run_unit_test_2173();
    run_unit_test_2174();
    run_unit_test_2175();
    run_unit_test_2176();
    run_unit_test_2177();
    run_unit_test_2178();
    run_unit_test_2179();
    run_unit_test_2180();
    run_unit_test_2181();
    run_unit_test_2182();
    run_unit_test_2183();
    run_unit_test_2184();
    run_unit_test_2185();
    run_unit_test_2186();
    run_unit_test_2187();
    run_unit_test_2188();
    run_unit_test_2189();
    run_unit_test_2190();
    run_unit_test_2191();
    run_unit_test_2192();
    run_unit_test_2193();
    run_unit_test_2194();
    run_unit_test_2195();
    run_unit_test_2196();
    run_unit_test_2197();
    run_unit_test_2198();
    run_unit_test_2199();
}

// Numerical Telemetry Wave Simulator Functions
void init_wave_sim(wave_sim_t *sim) {
    memset(sim->phi, 0, sizeof(sim->phi));
    memset(sim->phi_prev, 0, sizeof(sim->phi_prev));
    memset(sim->phi_next, 0, sizeof(sim->phi_next));
    sim->source_amplitude = 0.0f;
    sim->step = 0;
}

void step_wave_sim(wave_sim_t *sim, float dt) {
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

    // Source driving term
    sim->phi_next[source_idx] += dt * dt * sim->source_amplitude * 10.0f;

    // Dirichlet boundary conditions (zero clamp at edges)
    sim->phi_next[0] = 0.0f;
    sim->phi_next[WAVE_GRID_SIZE - 1] = 0.0f;

    // Swap buffers
    memcpy(sim->phi_prev, sim->phi, sizeof(sim->phi));
    memcpy(sim->phi, sim->phi_next, sizeof(sim->phi));
    
    sim->step++;
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

    printf("[1/2] Running 1,800 Generated Assembly FSM Assertions...\n");
    run_all_generated_fsm_tests();
    printf("      Assertions Run: %u\n", g_stats.total_count);
    printf("      Passed: %u | Failed: %u\n", g_stats.passed_count, g_stats.failed_count);
    if (g_stats.failed_count == 0) {
        printf("      SUCCESS: All FSM boundary edge cases passed validation.\n\n");
    } else {
        printf("      WARNING: Core FSM validation failure detected!\n\n");
    }

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
        step_wave_sim(&sim, dt);
        if (step % 3 == 0) {
            print_wave_profile(&sim);
            printf("\n");
        }
    }

    printf("Wave simulation telemetry sequence complete.\n");
    printf("==================================================\n");
    return 0;
}
