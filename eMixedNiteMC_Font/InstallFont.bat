@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
echo Installation of eMixedNiteMC Font ...
echo.
echo.
echo Click install in the newest open window and close it.
TIMEOUT /T 5 /NOBREAK >nul
echo.
echo Waiting for user...
Lato-Edited-Uppercase.ttf
echo.
echo Adding eMixedNiteMC Font to the regedit...
TIMEOUT /T 3 /NOBREAK >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Lato-Edited-Uppercase (TrueType)" /t REG_SZ /d Lato-Edited-Uppercase.ttf /f
echo.
echo All done!
TIMEOUT /T 5 /NOBREAK >nul