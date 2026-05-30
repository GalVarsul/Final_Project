@echo off
echo ===================================================
echo  Welcome to Gal & Osher's Smart Shipping System!
echo ===================================================

echo [1/4] Installing Backend dependencies...
pip install fastapi uvicorn sqlalchemy psycopg2-binary substrate-interface geopy httpx joblib scikit-learn pandas numpy apscheduler

echo [2/4] Installing Frontend dependencies...
call npm install

echo [3/4] Starting the Backend server...
set DEMO_MODE=true
start "Smart Shipping Backend" cmd /c "python -m uvicorn Backend.main:app --reload"

echo [4/4] Starting the Frontend application...
start "Smart Shipping Frontend" cmd /c "npx expo start --web --clear"

echo ===================================================
echo  System is starting! Server and App windows opened.
echo  You can safely close this window.
echo ===================================================
pause