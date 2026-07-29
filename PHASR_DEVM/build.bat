@echo off
echo =======================================================
echo  PHASR (DEVM) - Local Windows Build Script (Bare-Metal)
echo =======================================================

echo.
echo [1] Compiling the Main Engine (Engine.c)...
clang Engine.c -o Engine.exe
if %ERRORLEVEL% NEQ 0 (
    echo [FATAL] Engine compilation failed. Please ensure LLVM/Clang is installed.
    exit /b %ERRORLEVEL%
)
echo [OK] Engine.exe generated.

echo.
echo [2] Compiling the CLI Wrapper (cli.c)...
clang CLI\cli.c -o phasr.exe
if %ERRORLEVEL% NEQ 0 (
    echo [FATAL] CLI compilation failed.
    exit /b %ERRORLEVEL%
)
echo [OK] phasr.exe generated.

echo.
echo [3] Assembling Hardware Modules...
echo (Requires 'nasm' installed and added to Windows PATH to compile the raw .asm files)
:: nasm -f win64 Model\Module2_DataAnalyser\UnrolledScanner.asm -o Module2.exe
:: nasm -f win64 Model\Module3_AnomalyAnalyser\EntropyScanner.asm -o Module3.exe
:: nasm -f win64 Model\Module4_SecurityMath\TaintTracker.asm -o Module4.exe
:: nasm -f win64 Model\Module5_TemporalPhysics\TemporalScanner.asm -o Module5.exe

echo.
echo =======================================================
echo [✓] DEVM BUILD COMPLETE
echo =======================================================
echo.
echo To run the system locally, execute:
echo   .\phasr.exe help
echo.
