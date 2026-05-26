@echo off
REM =============================================================
REM PHASR Primordial Sin (Boot Attestation) — Windows Build Script
REM Toolchain: MSVC cl.exe + ml64.exe (MASM)
REM =============================================================
setlocal enabledelayedexpansion

echo ==================================================
echo Building PHASR: Primordial Sin Engine (MSVC x64)
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

echo [2/3] Assembling Primordial Sin (MASM x64)...
ml64 /c /Cx primordial_engine.asm
if %errorlevel% neq 0 (
    echo [ERROR] Assembly failed!
    exit /b 1
)

echo [3/3] Compiling C++ Simulation Driver and Linking...
cl /EHsc /O2 /W4 /WX /GS /Fe:primordial_engine.exe primordial_driver.cpp primordial_engine.obj
if %errorlevel% neq 0 (
    echo [ERROR] Compilation failed!
    exit /b 1
)

echo ==================================================
echo Build Success! Executing Primordial Sin Suite...
echo ==================================================
echo.
primordial_engine.exe

endlocal
