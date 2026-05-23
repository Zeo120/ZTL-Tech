# PHASR Phase-3 Telemetry Collector Makefile
# Supports: Linux x86-64, Linux ARM64
# Windows: use build.bat with MSVC

CC       ?= gcc
CFLAGS   := -O2 -Wall -Wextra -Werror -std=c99
LDFLAGS  := -lm
TARGET   := telemetry_collector

# Auto-detect platform
UNAME_M := $(shell uname -m 2>/dev/null || echo unknown)

ifeq ($(PLATFORM),arm64)
    ASM_SRC := telemetry_arm64.s
    ASM_OBJ := telemetry_arm64.o
    AS      := as
    ASFLAGS :=
    CFLAGS  += -D__aarch64__
else ifeq ($(PLATFORM),x64)
    ASM_SRC := telemetry_linux_x64.s
    ASM_OBJ := telemetry_linux_x64.o
    AS      := as
    ASFLAGS := --64
    CFLAGS  += -D__x86_64__ -D__linux__
else ifeq ($(UNAME_M),aarch64)
    ASM_SRC := telemetry_arm64.s
    ASM_OBJ := telemetry_arm64.o
    AS      := as
    ASFLAGS :=
    CFLAGS  += -D__aarch64__
else ifeq ($(UNAME_M),arm64)
    ASM_SRC := telemetry_arm64.s
    ASM_OBJ := telemetry_arm64.o
    AS      := as
    ASFLAGS :=
    CFLAGS  += -D__aarch64__
else ifeq ($(UNAME_M),x86_64)
    ASM_SRC := telemetry_linux_x64.s
    ASM_OBJ := telemetry_linux_x64.o
    AS      := as
    ASFLAGS := --64
    CFLAGS  += -D__x86_64__ -D__linux__
else
    $(warning Unknown architecture $(UNAME_M) — compiling C fallback engine)
    FALLBACK := 1
endif

ifndef FALLBACK

all: $(TARGET)

$(ASM_OBJ): $(ASM_SRC)
	$(AS) $(ASFLAGS) -o $@ $<

telemetry_collector.o: telemetry_collector.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(TARGET): telemetry_collector.o $(ASM_OBJ)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)
	echo "[OK] Built $(TARGET) using $(ASM_SRC) assembly engine"

else

all: fallback

fallback:
	$(CC) $(CFLAGS) -o $(TARGET)_fallback telemetry_collector.c $(LDFLAGS)
	echo "[OK] Built $(TARGET)_fallback using C fallback engine"

endif

clean:
	rm -f *.o $(TARGET) $(TARGET)_fallback

test: all
	@if [ -f ./$(TARGET) ]; then ./$(TARGET); else ./$(TARGET)_fallback; fi

.PHONY: all fallback clean test
