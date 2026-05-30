@echo off
REM =============================================================
REM PHASR Abaddons-Chasm Chaos Verifier — Windows Build Script
REM Toolchain: MSVC cl.exe
REM
REM For Linux targets, use the Makefile:
REM   make              — compile and build
REM =============================================================
setlocal enabledelayedexpansion

echo ==================================================
echo Building PHASR Phase 4: Chaos Verifier (MSVC)
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

echo [2/2] Compiling C++ Chaos Verifier Engine and linking...
cl /EHsc /W4 /WX /GS /Fe:chaos_verifier.exe chaos_verifier.cpp
if %errorlevel% neq 0 (
    echo [ERROR] Compilation failed!
    exit /b 1
)

echo ==================================================
echo Build Success! Executing Abaddons-Chasm Chaos Suite...
echo ==================================================
echo.
chaos_verifier.exe

endlocal
