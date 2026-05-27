# PHASR Lucifer's Blessing (Game Theory) Makefile
# Supports: Linux x86-64 with assembly
# Fallback: Portable C++ fallback on other platforms

CXX      ?= g++
CXXFLAGS := -O2 -Wall -Wextra -Werror -std=c++11
LDFLAGS  := -lm
TARGET   := lucifer_engine

# Auto-detect platform
UNAME_M := $(shell uname -m 2>/dev/null || echo unknown)

ifeq ($(PLATFORM),x64)
    ASM_SRC := lucifer_engine_linux_x64.s
    ASM_OBJ := lucifer_engine_linux_x64.o
    AS      := as
    ASFLAGS := --64
    CXXFLAGS += -D__x86_64__ -D__linux__
else ifeq ($(UNAME_M),x86_64)
    ASM_SRC := lucifer_engine_linux_x64.s
    ASM_OBJ := lucifer_engine_linux_x64.o
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

lucifer_driver.o: lucifer_driver.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(TARGET): lucifer_driver.o $(ASM_OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)
	@echo "[OK] Built $(TARGET) using $(ASM_SRC) assembly engine"

else

all: fallback

fallback:
	$(CXX) $(CXXFLAGS) -DNO_ASM -o $(TARGET)_fallback lucifer_driver.cpp $(LDFLAGS)
	@echo "[OK] Built $(TARGET)_fallback using C++ fallback engine"

endif

clean:
	rm -f *.o $(TARGET) $(TARGET)_fallback

test: all
	@if [ -f ./$(TARGET) ]; then ./$(TARGET); else ./$(TARGET)_fallback; fi

.PHONY: all fallback clean test
