@echo off
REM =============================================================
REM PHASR Lucifer's Blessing (Game Theory) — Windows Build Script
REM Toolchain: MSVC cl.exe + ml64.exe (MASM)
REM =============================================================
setlocal enabledelayedexpansion

echo ==================================================
echo Building PHASR: Lucifer's Blessing Engine (MSVC x64)
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

echo [2/3] Assembling Lucifer's Blessing (MASM x64)...
ml64 /c /Cx lucifer_engine.asm
if %errorlevel% neq 0 (
    echo [ERROR] Assembly failed!
    exit /b 1
)

echo [3/3] Compiling C++ Simulation Driver and Linking...
cl /EHsc /O2 /W4 /WX /GS /guard:cf /Fe:lucifer_engine.exe lucifer_driver.cpp lucifer_engine.obj /link /guard:cf
if %errorlevel% neq 0 (
    echo [ERROR] Compilation failed!
    exit /b 1
)

echo ==================================================
echo Build Success! Executing Lucifer's Blessing Suite...
echo ==================================================
echo.
lucifer_engine.exe

endlocal
