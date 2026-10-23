@echo off
cd /d "%~dp0"
set "PATH=C:\Program Files\Git\cmd;%PATH%"

if exist ".git" (
  echo Already initialized. Nothing to do.
  pause
  exit /b
)

where git >nul 2>nul
if errorlevel 1 (
  echo Git was NOT found.
  echo Please install Git for Windows first:
  echo   https://git-scm.com/download/win
  echo Then double-click this file again.
  pause
  exit /b
)

echo.
echo Make sure you already created an EMPTY PUBLIC repository on GitHub.
echo Then paste its URL below, for example:
echo   https://github.com/yourname/diary.git
echo.
set /p REPO=Repo URL: 

git init
git remote add origin %REPO%
git add -A
git commit -m "first commit"
git branch -M main
git push -u origin main

echo.
echo If you see push success above, go enable GitHub Pages in the repo Settings.
pause