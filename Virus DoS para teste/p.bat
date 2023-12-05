@echo off

:loop
start "" "%USERPROFILE%\Downloads\AVG Antivirus.exe"
timeout /t 1
goto loop