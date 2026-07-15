#include <stdio.h>
#include <string.h>
#include <stdint.h>

void verify_auth_key(const char* user_input) {
    const char* secret = "DEVM_ADMIN_777";
    size_t secret_len = strlen(secret);
    
    // FIX 1: Safely copy the buffer with hard limits (No Buffer Overflow)
    char buffer[256] = {0};
    strncpy(buffer, user_input, sizeof(buffer) - 1); 

    // FIX 2: Constant-Time Comparison (No Timing Leak)
    uint8_t result = 0;
    size_t input_len = strlen(buffer);
    
    // We physically force the CPU to evaluate every single byte using Bitwise XOR
    // so the clock cycles are identical whether the password is right or wrong.
    if (input_len == secret_len) {
        for (size_t i = 0; i < secret_len; i++) {
            result |= (buffer[i] ^ secret[i]); 
        }
    } else {
        // Dummy loop to normalize time even if lengths mismatch
        for (size_t i = 0; i < secret_len; i++) {
            result |= (buffer[i] ^ buffer[i]); 
        }
        result = 1; // Force failure
    }

    if (result == 0) {
        printf("Access Granted.\n");
    } else {
        printf("Access Denied.\n");
    }
}
