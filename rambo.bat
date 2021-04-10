@echo off

if [%1] EQU [] (
    echo Rambo thinks that you're messing with him.
    exit /b 1
)
if NOT EXIST "%~f1" (
    echo Rambo thinks that "%~f1" does not exist, sorry.
    exit /b 1
)

echo ^<?xml version="1.0" encoding="UTF-8"?^> > rambo.wsb
echo ^<Configuration^> >> rambo.wsb
echo   ^<vGPU^>true^</vGPU^> >> rambo.wsb
echo   ^<Networking^>true^</Networking^> >> rambo.wsb
echo   ^<ProtectedClient^>false^</ProtectedClient^> >> rambo.wsb
echo   ^<MappedFolders^> >> rambo.wsb
echo     ^<MappedFolder^> >> rambo.wsb
echo       ^<HostFolder^>%~dp1^</HostFolder^> >> rambo.wsb
echo       ^<SandboxFolder^>%~dp1^</SandboxFolder^> >> rambo.wsb
echo       ^<ReadOnly^>true^</ReadOnly^> >> rambo.wsb
echo     ^</MappedFolder^> >> rambo.wsb
echo    ^</MappedFolders^> >> rambo.wsb
echo    ^<LogonCommand^> >> rambo.wsb
echo      ^<Command^>%~dp1rambo_launch.bat "%~f1"^</Command^> >> rambo.wsb
echo    ^</LogonCommand^> >> rambo.wsb
echo ^</Configuration^> >> rambo.wsb

echo @echo off > rambo_launch.bat
echo start "rambo_launch" /D "%~dp1 " "%~f1" >> rambo_launch.bat

start /w "Rambo" rambo.wsb

del rambo.wsb
del rambo_launch.bat