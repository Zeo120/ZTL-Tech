# PHASR Phase-2 Hierarchy Reachability Engine Makefile
# Supports: Linux x86-64, Linux ARM64 (AArch64)
# Windows: use build.bat with MSVC

CXX      ?= g++
CXXFLAGS := -O2 -Wall -Wextra -Werror -std=c++11
LDFLAGS  := -lm
TARGET   := reachability_engine

# Auto-detect platform
UNAME_M := $(shell uname -m 2>/dev/null || echo unknown)

ifeq ($(PLATFORM),arm64)
    ASM_SRC := reachability_arm64.s
    ASM_OBJ := reachability_arm64.o
    AS      := as
    ASFLAGS :=
    CXXFLAGS += -D__aarch64__
else ifeq ($(PLATFORM),x64)
    ASM_SRC := reachability_linux_x64.s
    ASM_OBJ := reachability_linux_x64.o
    AS      := as
    ASFLAGS := --64
    CXXFLAGS += -D__x86_64__ -D__linux__
else ifeq ($(UNAME_M),aarch64)
    ASM_SRC := reachability_arm64.s
    ASM_OBJ := reachability_arm64.o
    AS      := as
    ASFLAGS :=
    CXXFLAGS += -D__aarch64__
else ifeq ($(UNAME_M),arm64)
    ASM_SRC := reachability_arm64.s
    ASM_OBJ := reachability_arm64.o
    AS      := as
    ASFLAGS :=
    CXXFLAGS += -D__aarch64__
else ifeq ($(UNAME_M),x86_64)
    ASM_SRC := reachability_linux_x64.s
    ASM_OBJ := reachability_linux_x64.o
    AS      := as
    ASFLAGS := --64
    CXXFLAGS += -D__x86_64__ -D__linux__
else
    $(warning Unknown architecture $(UNAME_M) — compiling C++ fallback engine)
    FALLBACK := 1
endif

ifndef FALLBACK

all: $(TARGET)

$(ASM_OBJ): $(ASM_SRC)
	$(AS) $(ASFLAGS) -o $@ $<

reachability_engine.o: reachability_engine.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(TARGET): reachability_engine.o $(ASM_OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)
	echo "[OK] Built $(TARGET) using $(ASM_SRC) assembly engine"

else

all: fallback

fallback:
	$(CXX) $(CXXFLAGS) -o $(TARGET)_fallback reachability_engine.cpp $(LDFLAGS)
	echo "[OK] Built $(TARGET)_fallback using C++ fallback engine"

endif

clean:
	rm -f *.o $(TARGET) $(TARGET)_fallback

test: all
	@if [ -f ./$(TARGET) ]; then ./$(TARGET); else ./$(TARGET)_fallback; fi

.PHONY: all fallback clean test
