@echo off
title Windows 7 Transformation
echo Starting Windows 7 Transformation...
pause

:: Check for admin rights
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo This script requires administrator rights. Please run as administrator.
    pause
    exit /b
)

:: Download Windows 7 theme
echo Downloading Windows 7 theme...
powershell -command "(New-Object Net.WebClient).DownloadFile('http://example.com/windows7.theme', '%SystemRoot%\Resources\Themes\windows7.theme')"

:: Apply Windows 7 theme
echo Applying Windows 7 theme...
start "" "%SystemRoot%\Resources\Themes\windows7.theme"

:: Change taskbar to small icons
echo Changing taskbar settings...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons /t REG_DWORD /d 1 /f

:: Set taskbar color to Windows 7 blue
echo Setting taskbar color...
powershell -command "& {Start-Process 'powershell' -ArgumentList 'reg add HKCU\Software\Microsoft\Windows\DWM /v AccentColor /t REG_DWORD /d 0xD9E7F0 /f' -Verb RunAs}"

:: Apply new settings
echo Applying new settings...
taskkill /f /im explorer.exe
start explorer.exe

echo Windows 7 Transformation complete.
pause
exit
