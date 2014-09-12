REM delold.bat
REM usage: delold MM-DD-YYY
for /f "tokens=*" %%a IN ('xcopy *.* /d:%1 /L /I null') do if exist %%~nxa echo %%~nxa >> FILES_TO_KEEP.TXT
for /f "tokens=*" %%a IN ('xcopy *.* /L /I /EXCLUDE:FILES_TO_KEEP.TXT null') do if exist "%%~nxa" del "%%~nxa"
