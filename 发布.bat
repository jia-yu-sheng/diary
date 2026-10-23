@echo off
cd /d "%~dp0"
set "PATH=C:\Program Files\Git\cmd;%PATH%"

if not exist ".git" (
  echo Not initialized yet. Run the init .bat file first.
  pause
  exit /b
)

git add -A
git diff --cached --quiet
if errorlevel 1 (
  git commit -m "update diary"
) else (
  echo No changes to publish.
)
git push

echo.
echo Publish done. Visitors can refresh the page to see the latest.
pause