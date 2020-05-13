title THE (ULTIMATE) ORGANIZER
color 0a
@echo off

echo This programs orgenizes folders, place this file in the folder you want to orgenize and run it.
echo Witch way you want to orgenize this folder?

echo 1. By file extensions.
echo 2. By file names.
echo 3. Coming soon.
echo 4. Exit program.

set /p answer=""

if %answer% == 1 goto ByExt 
if %answer% == 2 goto ByName
if %answer% == 3 goto BySyn else goto CommitExit

exit /b

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

goto CommitExit

:BySyn
echo Function not avilable yet

goto CommitExit

:CommitExit
pause >nul| set /p Press any key to exit ...
