@echo off
REM =============================================================
REM PHASR Phase-5 Consensus Auditor — Windows Build Script
REM Toolchain: MSVC cl.exe
REM
REM For Linux targets, use the Makefile:
REM   make              — compile and build
REM =============================================================
setlocal enabledelayedexpansion

echo ==================================================
echo Building PHASR Phase 5: Consensus Auditor (MSVC)
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

echo [2/2] Compiling C Consensus Auditor Engine and linking...
cl /W4 /WX /GS /Fe:consensus_auditor.exe consensus_auditor.c
if %errorlevel% neq 0 (
    echo [ERROR] Compilation failed!
    exit /b 1
)

echo ==================================================
echo Build Success! Executing Phase-5 Consensus Suite...
echo ==================================================
echo.
consensus_auditor.exe

endlocal
