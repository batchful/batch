title batchful
color 0a
@echo off

goto Logo
goto Ask

:Logo
:::   _             _         _       __         _ 
:::  | |__    __ _ | |_  ___ | |__   / _| _   _ | |
:::  | '_ \  / _` || __|/ __|| '_ \ | |_ | | | || |
:::  | |_) || (_| || |_| (__ | | | ||  _|| |_| || |
:::  |_.__/  \__,_| \__|\___||_| |_||_|   \__,_||_|
:::
:::

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

:Ask
echo This program organizes folders. place this file in the directory you wish to organize and run it.
echo Choose a method of organization:

echo 1. By file extensions.
echo 2. By file names.
echo.

echo Press g for the GitHub repository page and q to exit the program.

set /p answer=""

if %answer% == 1 goto ByExt 
if %answer% == 2 goto ByName
if %answer% == g goto GitHub
if %answer% == q exit /b
rem if %answer% == 3 goto BySyn 

goto Ask

:ByExt
rem For each file in your folder
for %%a in (".\*") do (
    rem check if the file has an extension and if it is not our script
    if "%%~xa" NEQ ""  if "%%~dpnxa" NEQ "%~dpnx0" (
        rem check if extension forlder exists, if not it is created
        if not exist "%%~xa" mkdir "%%~xa"
        rem Copy (or change to move) the file to directory
        move "%%a" "%%~dpa%%~xa\"
    )
)

goto CommitExit

:ByName
for %%i in (*) do (
    if not "%%~ni" == "organize" (
        if not exist "%%~ni" md "%%~ni" 
        move "%%~i" "%%~ni"
    )
)

:GitHub
goto Logo

echo Made by 3174N and SFR-git
echo.
goto GitHubAsk

:GitHubAsk
echo Open GitHub? [Y/N]
set /p open = ""
if /I %open% == Y goto OpenGit
if /I %open% == yes goto OpenGit
if /I %open% == N goto Ask
if /I %open% == no goto Ask
else goto GitHubRe

:GitHubRe
echo "Couldn't understand the response. Possible answers: [Y/n/yes/no]"
goto GitHubAsk

rem :BySyn
rem echo Function not avilable yet

goto CommitExit

:OpenGit
start https://github.com/3174N/batchful.git

goto CommitExit

:CommitExit
pause >nul| set /p Press any key to exit ...
