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
    uint32_t c_curr = (uint32_t)current_state;
    uint32_t c_next = (uint32_t)next_state;

    /* Bounds check: 0 <= state <= 7
     * For any x, ~((x | (7 - x)) >> 31) & 1 yields 1 if 0 <= x <= 7, and 0 otherwise.
     */
    uint32_t curr_ok = ~((c_curr | (7 - c_curr)) >> 31) & 1;
    uint32_t next_ok = ~((c_next | (7 - c_next)) >> 31) & 1;
    uint32_t bounds_ok = curr_ok & next_ok;

    /* Reset transition: any state -> state 0 is always allowed.
     * x | -x has the sign bit set for any non-zero x, and 0 for x == 0.
     */
    uint32_t is_reset = ~((c_next | -c_next) >> 31) & 1;

    /* Sequential progression check: next_state must be current_state + 1 */
    uint32_t diff = c_next - (c_curr + 1);
    uint32_t is_sequential = ~((diff | -diff) >> 31) & 1;

    /* Prerequisite check: bit (next_state - 1) must be set */
    uint32_t bit_index = (c_next - 1) & 63;
    uint32_t prereq_ok = (uint32_t)((prerequisites >> bit_index) & 1);

    /* Allowed: bounds are ok AND (is reset OR (is sequential AND prerequisites are met)) */
    uint32_t allowed = bounds_ok & (is_reset | (is_sequential & prereq_ok));

    return (int)allowed;
}
