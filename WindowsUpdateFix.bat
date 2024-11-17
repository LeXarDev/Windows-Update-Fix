@echo off
title Windows Update fix
echo.
echo.
echo.
echo    ##       ######## ##     ##    ###    ########  ########  ######## ##     ## 
echo    ##       ##        ##   ##    ## ##   ##     ## ##     ## ##       ##     ## 
echo    ##       ##         ## ##    ##   ##  ##     ## ##     ## ##       ##     ## 
echo    ##       ######      ###    ##     ## ########  ##     ## ######   ##     ## 
echo    ##       ##         ## ##   ######### ##   ##   ##     ## ##        ##   ##  
echo    ##       ##        ##   ##  ##     ## ##    ##  ##     ## ##         ## ##   
echo    ######## ######## ##     ## ##     ## ##     ## ########  ########    ###   
echo.
echo                             Windows Update fix v0.0.1     
echo.

@echo off
echo Resetting Windows Update Components...

:: Stop Windows Update Services
net stop wuauserv /y
net stop bits /y
net stop cryptsvc /y

:: Delete SoftwareDistribution Folder
ren %systemroot%\SoftwareDistribution SoftwareDistribution.old

:: Delete Catroot2 Folder
ren %systemroot%\System32\catroot2 Catroot2.old

:: Restart Windows Update Services
net start wuauserv
net start bits
net start cryptsvc

:: Flush DNS Resolver Cache
ipconfig /flushdns

:: Prompt for restart confirmation
set /p "choice=Restart computer now? (y/n): "

if %choice%==y (
  echo Restarting Computer...
  shutdown /r /t 0
) else (
  echo Restart skipped.
)
