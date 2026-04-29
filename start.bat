@echo off
title IoT Device Manager Server

rem Check EXE
if not exist "%~dp0DeviceManager.exe" (
    echo [Error] DeviceManager.exe not found.
    echo Please place start.bat and DeviceManager.exe in the same folder.
    echo.
    pause
    exit /b 1
)

rem Check MariaDB or MySQL (before chcp to avoid Win7 && bug)
set DB_FOUND=0
sc query MariaDB > nul 2>&1
if not errorlevel 1 set DB_FOUND=1
if "%DB_FOUND%"=="0" (
    sc query MySQL > nul 2>&1
    if not errorlevel 1 set DB_FOUND=1
)
if "%DB_FOUND%"=="0" (
    mysql --version > nul 2>&1
    if not errorlevel 1 set DB_FOUND=1
)

chcp 65001 > nul

echo ===================================
echo   IoT Device Manager Server
echo ===================================
echo.

if "%DB_FOUND%"=="0" (
    echo [Notice] MariaDB is not installed.
    echo          The server will run without a database,
    echo          but logging requires MariaDB.
    echo.
    echo  [MariaDB Install]
    echo   1. https://mariadb.org/download
    echo   2. Set a root password during installation
    echo.
    echo  [DB Settings after install]
    echo   Browser - Settings - Database:
    echo     Host : localhost
    echo     Port : 3306
    echo     User : root
    echo.
)

echo  Tip: To run without this window, use start.vbs instead.
echo.

"%~dp0DeviceManager.exe"
