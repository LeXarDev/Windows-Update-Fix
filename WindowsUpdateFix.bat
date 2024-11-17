@echo off
title Windows Update Fix Tool
echo.
echo    ##       ######## ##     ##    ###    ########  ########  ######## ##     ## 
echo    ##       ##        ##   ##    ## ##   ##     ## ##     ## ##       ##     ## 
echo    ##       ##         ## ##    ##   ##  ##     ## ##     ## ##       ##     ## 
echo    ##       ######      ###    ##     ## ########  ##     ## ######   ##     ## 
echo    ##       ##         ## ##   ######### ##   ##   ##     ## ##        ##   ##  
echo    ##       ##        ##   ##  ##     ## ##    ##  ##     ## ##         ## ##   
echo    ######## ######## ##     ## ##     ## ##     ## ########  ########    ###   
echo                         Hello , ( Windows Update Fix )
echo.

echo Starting Windows Update Fix Script...

:: Stop Windows Update services
echo Stopping Windows Update services...
net stop wuauserv >nul 2>&1
net stop cryptSvc >nul 2>&1
net stop bits >nul 2>&1
net stop msiserver >nul 2>&1

:: Delete temporary update files
echo Deleting temporary update files...
del /f /s /q %windir%\SoftwareDistribution\*.* >nul 2>&1
del /f /s /q %windir%\System32\catroot2\*.* >nul 2>&1

:: Resetting SoftwareDistribution and Catroot2 folders
echo Resetting update folders...
rd /s /q %windir%\SoftwareDistribution >nul 2>&1
rd /s /q %windir%\System32\catroot2 >nul 2>&1

:: Restart Windows Update services
echo Restarting Windows Update services...
net start wuauserv >nul 2>&1
net start cryptSvc >nul 2>&1
net start bits >nul 2>&1
net start msiserver >nul 2>&1

:: Inform the user
echo.
echo Windows Update fix completed successfully.

:: Ask if user wants to restart Windows
echo Do you want to restart Windows now? (Y/N)
choice /C YN /M "Select Yes (Y) or No (N)"
if errorlevel 2 goto NoRestart
if errorlevel 1 goto Restart

:Restart
echo Restarting Windows...
shutdown /r /f /t 0
exit

:NoRestart
echo Windows will not be restarted.
echo Press any key to exit...
pause >nul
exit
