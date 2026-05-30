@echo off
echo ===================================================
echo  Gal's Smart Shipping - GitHub Auto-Updater
echo ===================================================

echo [1/3] Adding all changed files...
git add .

echo [2/3] Committing changes...
set /p commit_msg="Enter your commit message (or press Enter for default): "
if "%commit_msg%"=="" set commit_msg=Auto-update from batch script

git commit -m "%commit_msg%"

echo [3/3] Pushing to GitHub...
git push

echo ===================================================
echo  Done! Your code is safe in the cloud.
echo ===================================================
pause