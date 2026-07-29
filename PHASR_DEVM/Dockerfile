# ==============================================================================
# PHASR (DEVM) - Universal Global Container
# Architecture Target: x86_64 (Linux / macOS / Windows)
# Note: Apple Silicon (M1/M2/M3) Macs will run this natively via Docker Rosetta 2
# ==============================================================================

# STAGE 1: Build Environment (Ubuntu Base)
FROM ubuntu:22.04 AS builder

# Prevent interactive prompts during apt installations
ENV DEBIAN_FRONTEND=noninteractive

# Install LLVM/Clang (for the C Engine), NASM (for the Hardware Modules), and Node (for the UI)
RUN apt-get update && apt-get install -y \
    clang \
    nasm \
    nodejs \
    npm \
    make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/phasr

# Copy the entire DEVM Architecture into the container
COPY . .

# Assemble the Hardware Physics Modules into Linux ELF64 objects
# (This ensures the x86_64 assembly we wrote works on Linux/Docker)
RUN nasm -f elf64 "Model/Module2_DataAnalyser/UnrolledScanner.asm" -o "Module2.o"
RUN nasm -f elf64 "Model/Module3_AnomalyAnalyser/EntropyScanner.asm" -o "Module3.o"
RUN nasm -f elf64 "Model/Module4_SecurityMath/TaintTracker.asm" -o "Module4.o"
RUN nasm -f elf64 "Model/Module5_TemporalPhysics/TemporalScanner.asm" -o "Module5.o"

# Compile the Bare-Metal C Engine and CLI Wrapper
RUN clang Engine.c -o Engine
RUN clang CLI/cli.c -o phasr

# Install Frontend dependencies
WORKDIR /opt/phasr/Frontend
# RUN npm install -g serve  # Installed globally in Stage 2

# STAGE 2: Lightweight Production Image
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y nodejs npm && rm -rf /var/lib/apt/lists/*
RUN npm install -g serve

WORKDIR /opt/phasr

# Pull the compiled engine and the frontend from the Builder stage
COPY --from=builder /opt/phasr/Engine /opt/phasr/Engine
COPY --from=builder /opt/phasr/phasr /opt/phasr/phasr
COPY --from=builder /opt/phasr/phasr.yaml /opt/phasr/phasr.yaml
COPY --from=builder /opt/phasr/Frontend /opt/phasr/Frontend

# Make the CLI accessible globally inside the container
RUN ln -s /opt/phasr/phasr /usr/local/bin/phasr

# The default command when a developer runs the container
ENTRYPOINT ["phasr"]
CMD ["help"]
