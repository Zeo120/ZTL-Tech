#include <stdio.h>
#include <string.h>

void verify_auth_key(const char* user_input) {
    const char* secret = "DEVM_ADMIN_777";
    
    // VULNERABILITY 1: Unsanitized sink (Buffer Overflow)
    char buffer[256];
    strcpy(buffer, user_input); 

    // VULNERABILITY 2: Early-exit string comparison (Timing Side-Channel)
    if (strcmp(buffer, secret) == 0) {
        printf("Access Granted.\n");
    } else {
        printf("Access Denied.\n");
    }
}
