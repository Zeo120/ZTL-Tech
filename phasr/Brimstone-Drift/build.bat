@echo off
REM =============================================================
REM PHASR Brimstone-Drift Telemetry Collector — Windows Build Script
REM Toolchain: MSVC cl.exe
REM
REM For Linux targets, use the Makefile:
REM   make              — compile and build
REM =============================================================
setlocal enabledelayedexpansion

echo ==================================================
echo Building PHASR Phase 3: Telemetry Collector (MSVC)
echo ==================================================

:: Locate vcvars64.bat to set up MSVC environment variables
set "VCVARS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\18\BuildTools\VC\Auxiliary\Build\vcvars64.bat"

if not exist "!VCVARS_PATH!" (
    echo [ERROR] MSVC vcvars64.bat not found at: !VCVARS_PATH!
    echo Please verify Visual Studio Build Tools installation.
    exit /b 1
)

echo [1/2] Initializing MSVC build environment...
call "!VCVARS_PATH!" > nul

echo [2/2] Compiling C Telemetry Invariants Engine and linking...
cl /EHsc /W4 /WX /GS /Fe:telemetry_collector.exe telemetry_collector.c
if %errorlevel% neq 0 (
    echo [ERROR] Compilation failed!
    exit /b 1
)

echo ==================================================
echo Build Success! Executing Brimstone-Drift Telemetry Suite...
echo ==================================================
echo.
telemetry_collector.exe

endlocal
