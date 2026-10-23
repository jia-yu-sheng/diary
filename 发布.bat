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

echo.
echo Pushing to GitHub...
git push -u origin main > "%TEMP%\diary_push.log" 2>&1
set PUSHERR=%errorlevel%
echo ---- push output ----
type "%TEMP%\diary_push.log"
echo ---------------------
echo.
if %PUSHERR% EQU 0 (
  echo ====== PUSH OK ======
  echo Wait about 1 minute, then hard-refresh with Ctrl+F5.
) else (
  echo ====== PUSH FAILED. Error code: %PUSHERR% ======
  echo Keep this window open. The error is shown above.
)
pause