@echo off
REM =============================================================
REM PHASR Phase-1 FSM Validator — Windows Build Script
REM Toolchain: MSVC cl.exe + ml64.exe (MASM)
REM
REM For Linux x86-64 or ARM64, use the Makefile instead:
REM   Linux x86-64 : make PLATFORM=x64
REM   Linux ARM64  : make PLATFORM=arm64
REM   Pure C       : make fallback
REM
REM Platform-specific assembly files:
REM   Windows x64 : fsm_validator.asm          (MASM, RCX/RDX/R8 ABI)
REM   Linux x64   : fsm_validator_linux_x64.s  (GAS, RDI/RSI/RDX ABI)
REM   Linux ARM64 : fsm_validator_linux_arm64.s (GAS, x0/x1/x2 ABI)
REM   C fallback  : fsm_validator_fallback.c    (portable ISO C99)
REM =============================================================
setlocal enabledelayedexpansion

echo ==================================================
echo Building PHASR Phase 1: Temporal Validator (MSVC x64)
echo ==================================================

:: Locate vcvars64.bat to set up MSVC environment variables
set "VCVARS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\18\BuildTools\VC\Auxiliary\Build\vcvars64.bat"

if not exist "!VCVARS_PATH!" (
    echo [ERROR] MSVC vcvars64.bat not found at: !VCVARS_PATH!
    echo Please verify Visual Studio Build Tools installation.
    exit /b 1
)

echo [1/3] Initializing MSVC build environment...
call "!VCVARS_PATH!" > nul

echo [2/3] Assembling FSM Validator (MASM x64)...
ml64 /c /Cx fsm_validator.asm
if %errorlevel% neq 0 (
    echo [ERROR] Assembly failed!
    exit /b 1
)

echo [3/3] Compiling C Telemetry Simulation and Linking...
cl /O2 /W4 /WX /GS /guard:cf /Fe:phase_fsm.exe phase_fsm.c fsm_validator.obj /link /guard:cf
if %errorlevel% neq 0 (
    echo [ERROR] Compilation failed!
    exit /b 1
)


echo ==================================================
echo Build Success! Executing Phase-1 Validator...
echo ==================================================
echo.
phase_fsm.exe

endlocal
