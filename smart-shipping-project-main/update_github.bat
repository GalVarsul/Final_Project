@echo off
echo ===================================================
echo  Gal's Smart Shipping - GitHub Auto-Updater
echo ===================================================

echo [1/4] Adding all changed files...
git add .

echo [2/4] Committing changes...
set /p commit_msg="Enter your commit message (or press Enter for default): "
if "%commit_msg%"=="" set commit_msg=Auto-update from batch script
git commit -m "%commit_msg%"

echo [3/4] Pulling latest changes from GitHub (just in case)...
git pull origin main --rebase

echo [4/4] Pushing to GitHub...
git push -u origin main

echo ===================================================
echo  Done! Your code is safe in the cloud.
echo ===================================================
pause