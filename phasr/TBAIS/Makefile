# ============================================================
# PHASR TBAIS — Turing-Based Attacker Invalidation System
# Build System  |  Targets: x86-64 Linux + ARM64 Linux
#
# Usage:
#   make x64       — build x86-64 binary (requires NASM + ld)
#   make arm64     — build ARM64 binary  (requires aarch64-linux-gnu-as + ld)
#   make all       — build both
#   make run-x64   — build and run x86-64 (Linux x86-64 host only)
#   make clean     — remove build artifacts
# ============================================================

NASM        := nasm
AS_ARM64    := aarch64-linux-gnu-as
LD_X64      := ld
LD_ARM64    := aarch64-linux-gnu-ld

SRC_X64     := tbais_x64.asm
SRC_ARM64   := tbais_arm64.s

OBJ_X64     := tbais_x64.o
OBJ_ARM64   := tbais_arm64.o

BIN_X64     := tbais_x64
BIN_ARM64   := tbais_arm64

# ---- Default: build both -----------------------------------
.PHONY: all
all: x64 arm64

# ---- x86-64 Linux (NASM ELF64) ----------------------------
.PHONY: x64
x64: $(BIN_X64)

$(BIN_X64): $(OBJ_X64)
	$(LD_X64) $< -o $@
	@echo "[TBAIS x64] Linked: $@"

$(OBJ_X64): $(SRC_X64)
	$(NASM) -f elf64 $< -o $@
	@echo "[TBAIS x64] Assembled: $@"

# ---- ARM64 Linux (GAS ELF64) ------------------------------
.PHONY: arm64
arm64: $(BIN_ARM64)

$(BIN_ARM64): $(OBJ_ARM64)
	$(LD_ARM64) $< -o $@
	@echo "[TBAIS arm64] Linked: $@"

$(OBJ_ARM64): $(SRC_ARM64)
	$(AS_ARM64) $< -o $@
	@echo "[TBAIS arm64] Assembled: $@"

# ---- Run (host must be x86-64 Linux) ----------------------
.PHONY: run-x64
run-x64: $(BIN_X64)
	@echo ""
	@echo "==== Running TBAIS x86-64 DFA Engine ===="
	./$(BIN_X64)

# ---- Run ARM64 via QEMU -----------------------------------
.PHONY: run-arm64
run-arm64: $(BIN_ARM64)
	@echo ""
	@echo "==== Running TBAIS ARM64 DFA Engine (QEMU) ===="
	qemu-aarch64 -L /usr/aarch64-linux-gnu ./$(BIN_ARM64)

# ---- Clean ------------------------------------------------
.PHONY: clean
clean:
	rm -f $(OBJ_X64) $(OBJ_ARM64) $(BIN_X64) $(BIN_ARM64)
	@echo "[TBAIS] Clean complete."

# ---- Info --------------------------------------------------
.PHONY: info
info:
	@echo "PHASR TBAIS Assembly Build"
	@echo "  x86-64 source : $(SRC_X64)"
	@echo "  ARM64  source : $(SRC_ARM64)"
	@echo "  Assembler x64 : $(NASM)"
	@echo "  Assembler a64 : $(AS_ARM64)"
	@echo ""
	@echo "  Install deps (Debian/Ubuntu):"
	@echo "    sudo apt install nasm binutils-aarch64-linux-gnu qemu-user"
