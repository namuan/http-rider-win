REM @echo off

setlocal

REM ......................setup variables......................
if [%1]==[] (
    SET ARCH=64
) else (
    SET ARCH=%1
)

if ["%ARCH%"]==["64"] (
    SET BINARCH=x64
    SET PYPATH=C:\Python36-x64
)

REM ......................get latest version number......................
for /f "delims=" %%a in ('%PYPATH%\python.exe version.py') do @set APPVER=%%a

REM ......................cleanup previous build scraps......................
rd /s /q build
rd /s /q dist
if not exist "..\..\bin\" ( mkdir ..\..\bin\ ) else ( del /q ..\..\bin\*.* )

REM ......................run pyinstaller......................
"%PYPATH%\scripts\pyinstaller.exe" --clean httprider.win%ARCH%.spec

if exist "dist\httprider.exe" (
    REM ......................add metadata to built Windows binary......................
    .\verpatch.exe dist\httprider.exe /va %APPVER%.0 /pv %APPVER%.0 /s desc "HttpRider" /s name "HttpRider" /s copyright "(c) 2019 DR" /s product "HttpRider %BINARCH%" /s company "deskriders.dev"
)

endlocal