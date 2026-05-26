# =============================================================
# PHASR Primordial Sin (Boot Attestation) — Cross-Platform Makefile
# =============================================================

CXX = g++
CXXFLAGS = -O3 -Wall -Wextra -std=c++11
LDFLAGS = 

TARGET = primordial_engine
SRC_DRV = primordial_driver.cpp
SRC_ASM = primordial_engine_linux_x64.s

UNAME_S := $(shell uname -s)
UNAME_M := $(shell uname -m)

# Check architecture for raw x86-64 assembly support
ifeq ($(UNAME_S),Linux)
    ifeq ($(UNAME_M),x86_64)
        USE_ASM = 1
    endif
endif

all: $(TARGET)

$(TARGET): $(SRC_DRV)
ifeq ($(USE_ASM),1)
	@echo "Detected Linux x86-64. Assembling and building with raw assembly..."
	as --64 -o primordial_engine.o $(SRC_ASM)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SRC_DRV) primordial_engine.o $(LDFLAGS)
else
	@echo "Detected non-x86-64 or non-Linux host. Building with C++ fallback engine..."
	$(CXX) $(CXXFLAGS) -DNO_ASM -o $(TARGET) $(SRC_DRV) $(LDFLAGS)
endif

fallback: $(SRC_DRV)
	@echo "Forcing build with C++ fallback engine..."
	$(CXX) $(CXXFLAGS) -DNO_ASM -o $(TARGET) $(SRC_DRV) $(LDFLAGS)

clean:
	rm -f $(TARGET) *.o

.PHONY: all clean fallback
