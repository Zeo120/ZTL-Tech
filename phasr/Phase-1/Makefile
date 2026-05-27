# PHASR Phase-1 FSM Validator — Cross-Platform Makefile
# Supports: Linux x86-64, Linux ARM64 (AArch64)
# Windows: use build.bat with MSVC + ml64.exe instead
#
# Usage:
#   make              — auto-detect platform and build
#   make PLATFORM=x64  — force Linux x86-64
#   make PLATFORM=arm64 — force ARM64
#   make fallback     — build with pure C fallback (no assembly)
#   make clean        — remove build artifacts

CC      ?= gcc
CFLAGS  := -O2 -Wall -Wextra -Werror -std=c99 -fstack-protector-strong
LDFLAGS := -lm
TARGET  := phase_fsm

# Auto-detect platform if not forced
UNAME_M := $(shell uname -m 2>/dev/null || echo unknown)

ifeq ($(PLATFORM),x64)
    ASM_SRC    := fsm_validator_linux_x64.s
    ASM_OBJ    := fsm_validator_linux_x64.o
    AS         := as
    ASFLAGS    := --64
elseif ($(PLATFORM),arm64)
    ASM_SRC    := fsm_validator_linux_arm64.s
    ASM_OBJ    := fsm_validator_linux_arm64.o
    AS         := as
    ASFLAGS    :=
else ifeq ($(UNAME_M),x86_64)
    ASM_SRC    := fsm_validator_linux_x64.s
    ASM_OBJ    := fsm_validator_linux_x64.o
    AS         := as
    ASFLAGS    := --64
else ifeq ($(UNAME_M),aarch64)
    ASM_SRC    := fsm_validator_linux_arm64.s
    ASM_OBJ    := fsm_validator_linux_arm64.o
    AS         := as
    ASFLAGS    :=
else
    $(warning Unknown architecture $(UNAME_M) — falling back to pure C)
    FALLBACK   := 1
endif

ifndef FALLBACK

all: $(TARGET)

$(ASM_OBJ): $(ASM_SRC)
	$(AS) $(ASFLAGS) -o $@ $<

phase_fsm.o: phase_fsm.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(TARGET): phase_fsm.o $(ASM_OBJ)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)
	echo "[OK] Built $(TARGET) using $(ASM_SRC)"

else

all: fallback

endif

fallback:
	$(CC) $(CFLAGS) -DFSM_C_FALLBACK -o $(TARGET)_fallback \
	    phase_fsm.c $(LDFLAGS)
	echo "[OK] Built $(TARGET)_fallback using pure C fallback"

clean:
	rm -f *.o $(TARGET) $(TARGET)_fallback

test: all
	./$(TARGET)

.PHONY: all fallback clean test
