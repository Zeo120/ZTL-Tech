@echo off
echo ===================================================
echo   ZTL Tech - Git Version Control Initializer
echo ===================================================
echo.

:: Check if git is installed
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed or not added to your system PATH.
    echo Please install Git from https://git-scm.com/ and try again.
    echo.
    pause
    exit /b
)

:: Initialize repository
echo [1/3] Initializing new Git repository...
git init
if %errorlevel% neq 0 (
    echo [ERROR] Failed to initialize Git repository.
    pause
    exit /b
)
echo.

:: Stage all files
echo [2/3] Staging all files (including .gitignore)...
git add .
if %errorlevel% neq 0 (
    echo [ERROR] Failed to stage files.
    pause
    exit /b
)
echo.

:: Create initial commit
echo [3/3] Creating initial commit...
git commit -m "Initial commit: Complete premium landing page refactoring, monochrome dark theme, and brand modernization"
if %errorlevel% neq 0 (
    echo [ERROR] Failed to create initial commit.
    echo Make sure you have configured your git user identity:
    echo   git config --global user.email "you@example.com"
    echo   git config --global user.name "Your Name"
    pause
    exit /b
)
echo.

echo ===================================================
echo   SUCCESS! Git version control is set up.
echo ===================================================
echo.
pause
