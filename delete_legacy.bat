@echo off
title ZTL Tech Workspace Cleanup
echo ===================================================
echo   DELETING LEGACY REDUNDANT WORKSPACE FILES
echo ===================================================
echo.

if exist "paradigm.html" (
    del /f "paradigm.html"
    echo [SUCCESS] Removed legacy "paradigm.html" from root directory.
) else (
    echo [INFO] Legacy "paradigm.html" already deleted.
)

echo.
echo ===================================================
echo   CLEANUP COMPLETED SUCCESSFULLY!
echo ===================================================
echo.
pause
