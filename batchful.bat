@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=
REM BFCPEICON=
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=0
REM BFCPEVERVERSION=1.0.0.0
REM BFCPEVERPRODUCT=Product Name
REM BFCPEVERDESC=Product Description
REM BFCPEVERCOMPANY=Your Company
REM BFCPEVERCOPYRIGHT=Copyright Info
REM BFCPEOPTIONEND

title batchful
color 0a

:Logo
echo SEARCHING FILE ...
echo.

for /r "%%~d0" %%g in (*batchful-LOGO.txt) do (
    type "%%g"
    echo.

    goto AskSubFolders
)
echo File missing

:AskSubFolders
echo This program organizes folders. place this file in the directory you wish to organize and run it.
echo Choose a method of organization:
echo.

echo Search sub-folders? [Y/N]
echo WARNING: ALL LEFTOVER EMPTY FOLDERS WILL BE DELETED.

set /p answer=""

if %answer% == Y goto SubFolder

:AskMethod
echo This program organizes folders. place this file in the directory you wish to organize and run it.
echo Choose a method of organization:
echo.

echo 1. By file extensions.
echo 2. By file names.
echo.

echo Press g for the GitHub repository page, h for help and q to exit the program.

set /p answer=""

if %answer% == 1 goto ByExt 
if %answer% == 2 goto ByName
if %answer% == g goto GitHub
if %answer% == h goto Help
if %answer% == q exit /b
rem if %answer% == 3 goto BySyn 

goto AskMethod

:SubFolder
for /r %%g in (*.*) do move "%%g" "%cd%"

for /d /r %%g in (*.*) do @RD /S /Q "%%g"

goto AskMethod

:ByExt
for %%a in (".\*") do (
    rem check if the file path is the same as this file
    if "%%~dpnxa" NEQ "%~dpnx0" (
        REM Checks if file does not have a extension        
        if "%%~xa" == "" (
            rem check if extension folder exists, if not it is created
            if not exist "File" mkdir "File"
            rem Copy (or change to move) the file to directory
            move "%%a" "File\"
        )

        rem check if extension folder exists, if not it is created
        if not exist "%%~xa" mkdir "%%~xa"
        rem Copy (or change to move) the file to directory
        move "%%a" "%%~dpa%%~xa\"
    )
)

goto CommitExit

:ByName
echo Enter a phrase
set /p name=""

for %%i in (*%name%*.*) do (
    if "%%~xa" NEQ ""  if "%%~dpnxa" NEQ "%~dpnx0" (
        if not exist "%name%" md "%name%" 
        move "%%i" "%name%\"
    )
)

echo Run again? [Y/N]
set /p answer=""

if %answer% == Y goto ByName
if %answer% == N goto CommitExit

goto CommitExit

:GitHub
rem goto Logo

echo Made by 3174N and SFR-git
echo.
goto GitHubAsk

:GitHubAsk
echo Open GitHub? [Y/N]
set /p open=""
if %open% == Y goto OpenGit
if %open% == yes goto OpenGit
if %open% == N goto AskMethod
if %open% == no goto AskMethod

echo "Couldn't understand the response. Possible answers: [Y/N/yes/no]"
goto GitHubAsk

rem :BySyn
rem echo Function not avilable yet

rem goto CommitExit

:OpenGit
start https://github.com/batchful/batch

goto CommitExit

:Help
echo SEARCHING FILE ...
echo.

for /r "%%~d0" %%g in (*batchful-README.txt) do (
    type "%%g"
    echo.

    goto AskMethod  
)
echo File missing

goto AskMethod

:CommitExit
Set /p P= Press the enter key to exit ...
