# PHASR Satan's Recursion Makefile
# Supports: Linux x86-64, Linux ARM64
# Windows: use build.bat with MSVC

CXX      ?= g++
CXXFLAGS := -O0 -Wall -Wextra -Werror -std=c++20
LDFLAGS  := -lm
TARGET   := satan_recursion

# Auto-detect platform
UNAME_M := $(shell uname -m 2>/dev/null || echo unknown)

# Wildcards for source chunks
CPP_CHUNKS := $(wildcard satan_chunk_*.cpp)
OBJ_CHUNKS := $(CPP_CHUNKS:.cpp=.o)

ifeq ($(PLATFORM),arm64)
    ASM_SRC := $(wildcard satan_chunk_*_arm64.s)
    ASM_OBJ := $(ASM_SRC:.s=.o)
    AS      := as
    ASFLAGS :=
    CXXFLAGS += -D__aarch64__
else ifeq ($(PLATFORM),x64)
    ASM_SRC := $(wildcard satan_chunk_*_x64.s)
    ASM_OBJ := $(ASM_SRC:.s=.o)
    AS      := as
    ASFLAGS := --64
    CXXFLAGS += -D__x86_64__ -D__linux__
else ifeq ($(UNAME_M),aarch64)
    ASM_SRC := $(wildcard satan_chunk_*_arm64.s)
    ASM_OBJ := $(ASM_SRC:.s=.o)
    AS      := as
    ASFLAGS :=
    CXXFLAGS += -D__aarch64__
else ifeq ($(UNAME_M),arm64)
    ASM_SRC := $(wildcard satan_chunk_*_arm64.s)
    ASM_OBJ := $(ASM_SRC:.s=.o)
    AS      := as
    ASFLAGS :=
    CXXFLAGS += -D__aarch64__
else ifeq ($(UNAME_M),x86_64)
    ASM_SRC := $(wildcard satan_chunk_*_x64.s)
    ASM_OBJ := $(ASM_SRC:.s=.o)
    AS      := as
    ASFLAGS := --64
    CXXFLAGS += -D__x86_64__ -D__linux__
else
    $(warning Unknown architecture $(UNAME_M) — compiling C++ fallback engine)
    FALLBACK := 1
endif

# Clean up C++ objects that might be created during fallback or driver builds
ALL_OBJS := satan_recursion.o $(OBJ_CHUNKS)

ifndef FALLBACK

all: $(TARGET)

%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(TARGET): $(ALL_OBJS) $(ASM_OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)
	echo "[OK] Built $(TARGET) using assembly engine chunks"

else

all: fallback

fallback: $(ALL_OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET)_fallback $^ $(LDFLAGS)
	echo "[OK] Built $(TARGET)_fallback using C++ fallback engine"

endif

clean:
	rm -f *.o $(TARGET) $(TARGET)_fallback

test: all
	@if [ -f ./$(TARGET) ]; then ./$(TARGET); else ./$(TARGET)_fallback; fi

.PHONY: all fallback clean test
