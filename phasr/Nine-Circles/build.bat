@echo off
REM =============================================================
REM PHASR Nine-Circles Reachability Engine — Windows Build Script
REM Toolchain: MSVC cl.exe (compiling C++ fallback)
REM
REM For Linux or ARM64 targets, use the Makefile:
REM   make              — auto-detect architecture and build
REM   make PLATFORM=arm64 — force ARM64 build with assembly
REM =============================================================
setlocal enabledelayedexpansion

echo ==================================================
echo Building PHASR Phase 2: Reachability Engine (MSVC)
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

echo [2/2] Compiling C++ Telemetry Simulation and linking (Fallback engine)...
cl /EHsc /W4 /WX /GS /Fe:reachability_engine.exe reachability_engine.cpp
if %errorlevel% neq 0 (
    echo [ERROR] Compilation failed!
    exit /b 1
)

echo ==================================================
echo Build Success! Executing Nine-Circles Reachability Suite...
echo ==================================================
echo.
reachability_engine.exe

endlocal
