/*
 * PHASR FSM Transition Validator — Pure C Portable Fallback
 *
 * Implements the same logic as fsm_validator_linux_x64.s and
 * fsm_validator_linux_arm64.s but in portable ISO C99.
 * Used as a fallback when no platform-specific assembly is available,
 * or for cross-compilation verification.
 *
 * Compile: cc -O2 -std=c99 -c fsm_validator_fallback.c
 */

#include <stdint.h>

/*
 * FSM State Constants (mirrored from phase_fsm.c)
 */
#define FSM_STATE_MIN  0
#define FSM_STATE_MAX  7

/*
 * Prerequisite bitmask constants
 * bit N must be set in prerequisites for transition to state (N+1)
 */
#define PREREQ_BIT(n)  (UINT64_C(1) << (n))

/*
 * validate_transition
 *
 * Returns:
 *   1  — transition ALLOWED (states valid, sequential, prerequisites met)
 *   0  — transition BLOCKED (out-of-bounds state, non-sequential, or
 *          prerequisites not satisfied)
 *
 * Edge cases handled:
 *   - current_state < 0 or > 7  → BLOCKED
 *   - next_state < 0 or > 7     → BLOCKED
 *   - next_state == 0 (reset)   → ALLOWED unconditionally
 *   - next_state != current_state + 1 → BLOCKED (no leapfrogs)
 *   - prerequisite bit (next_state-1) not set → BLOCKED
 */
int validate_transition(int current_state, int next_state, uint64_t prerequisites)
{
    /* Bounds check current_state */
    if (current_state < FSM_STATE_MIN || current_state > FSM_STATE_MAX)
        return 0;

    /* Bounds check next_state */
    if (next_state < FSM_STATE_MIN || next_state > FSM_STATE_MAX)
        return 0;

    /* Reset transition: any state -> state 0 is always valid */
    if (next_state == 0)
        return 1;

    /* Sequential progression check: must advance exactly one step */
    if (next_state != current_state + 1)
        return 0;

    /* Prerequisite check: bit (next_state - 1) must be set */
    if (!(prerequisites & PREREQ_BIT((unsigned)(next_state - 1))))
        return 0;

    return 1;
}
