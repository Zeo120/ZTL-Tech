# PHASR Phase-3 Telemetry Collector Makefile
# Supports: Linux x86-64, Linux ARM64
# Windows: use build.bat with MSVC

CC       ?= gcc
CFLAGS   := -O2 -Wall -Wextra -Werror -std=c99
LDFLAGS  := -lm
TARGET   := telemetry_collector

all: $(TARGET)

$(TARGET): telemetry_collector.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)
	echo "[OK] Built $(TARGET) successfully"

clean:
	rm -f $(TARGET)

test: all
	./$(TARGET)

.PHONY: all clean test
