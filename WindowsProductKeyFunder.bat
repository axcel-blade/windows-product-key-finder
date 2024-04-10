@echo off
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:\"=\""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------
::ENTER YOUR CODE BELOW:
title Windows Product Key Finder

echo _ _ _ _ _  _ ___  ____ _ _ _ ____    ___  ____ ____ ___  _  _ ____ ___    _  _ ____ _   _    ____ _ _  _ ___  ____ ____
echo | | | | |\ | |  \ |  | | | | [__     |__] |__/ |  | |  \ |  | |     |     |_/  |___  \_/     |___ | |\ | |  \ |___ |__/
echo |_|_| | | \| |__/ |__| |_|_| ___]    |    |  \ |__| |__/ |__| |___  |     | \_ |___   |      |    | | \| |__/ |___ |  \

wmic path softwarelicensingservice get OA3xOriginalProductKey

pause