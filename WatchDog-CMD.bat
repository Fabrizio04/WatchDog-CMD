@echo off
mode 79,10
title WatchDog-CMD by Fabrizio Amorelli
color C0
SETLOCAL EnableExtensions

::secondi per controllo watchdog
set timewatch=5

::secondi ritardo avvio
set timestart=60

::processo
set process="notepad.exe"

::percorso completo
set myPath="C:\Windows\System32\notepad.exe"

::riavvio in caso di blocco
set kill=s

::avvio WatchDog
cls
echo Avvio WatchDog-CMD...
timeout /T %timestart% >nul

cls
echo.
echo __          __   _       _     _____                      _____ __  __ _____  
echo \ \        / /  ^| ^|     ^| ^|   ^|  __ \                    / ____^|  \/  ^|  __ \ 
echo  \ \  /\  / /_ _^| ^|_ ___^| ^|__ ^| ^|  ^| ^| ___   __ _ ______^| ^|    ^| \  / ^| ^|  ^| ^|
echo   \ \/  \/ / _` ^| __/ __^| '_ \^| ^|  ^| ^|/ _ \ / _` ^|______^| ^|    ^| ^|\/^| ^| ^|  ^| ^|
echo    \  /\  / (_^| ^| ^|^| (__^| ^| ^| ^| ^|__^| ^| (_) ^| (_^| ^|      ^| ^|____^| ^|  ^| ^| ^|__^| ^|
echo     \/  \/ \__,_^|\__\___^|_^| ^|_^|_____/ \___/ \__, ^|       \_____^|_^|  ^|_^|_____/ 
echo                                              __/ ^|                            
echo                                             ^|___/                             

:watchdog
timeout /t %timewatch% >nul

:: parte per controllo in caso di blocco
tasklist /fi "status eq not responding" /nh | find %process% >NUL
if %errorlevel% == 0 (
if "%kill%" == "s" goto termina
)

:: controllo se esiste il processo
TASKLIST | FINDSTR /I %process% >nul
if %errorlevel% == 1 (
  goto avvia
) else (
  goto watchdog
)

:avvia
start "" %myPath%
goto watchdog

:termina
taskkill /f /im %process% >nul
goto avvia