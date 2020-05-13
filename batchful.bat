title batchful
color 0a
@echo off

:Ask
echo   _             _         _       __         _ 
echo  | |__    __ _ | |_  ___ | |__   / _| _   _ | |
echo  | '_ \  / _` || __|/ __|| '_ \ | |_ | | | || |
echo  | |_) || (_| || |_| (__ | | | ||  _|| |_| || |
echo  |_.__/  \__,_| \__|\___||_| |_||_|   \__,_||_|
echo
echo
echo This program organizes folders. place this file in the directory you wish to organize and run it.
echo Choose a method of organization:

echo 1. By file extensions.
echo 2. By file names.
echo 
echo
echo Press g for the GitHub repository page and q to exit the program.

set /p answer=""

if %answer% == 1 goto ByExt 
if %answer% == 2 goto ByName
if %answer% == g goto exit /b
if %answer% == q goto exit /b
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
echo Made by 3174N with help from SFR-git
echo
echo GitHub repo link: https://github.com/3174N/batchful/
goto Ask

rem :BySyn
rem echo Function not avilable yet

goto CommitExit

:CommitExit
pause >nul| set /p Press any key to exit ...
