@ECHO OFF
SET norm=1.0
SET warn=2.0
SET crit=3.0
FOR /F "skip=1 usebackq tokens=1-20 delims= " %%a IN ("S:\Some_Dir\MongoStats.txt") DO SET value=%%m
FOR /F "tokens=1-2 delims=:" %%a IN ("%value%") DO SET value=%%b
ECHO DB Time in Global Lock

if defined value (Goto Normal) ELSE (set state=3)
goto State

:Normal
if %value% GEQ 00 (if %value% LEQ %norm% (set state=0))
if %value% GTR %norm% goto Warning
echo NORMAL
if %value% LEQ %norm% Goto State
goto DONE

:Warning
if %value% GTR %norm% (if %value% LEQ %warn% (set state=1))
if %value% GTR %warn% goto Critical
echo WARNING
if %value% LEQ %warn% Goto State
goto DONE

:Critical
if %value% GTR %warn% set state=2
echo CRITICAL
if %value% GTR %warn% goto State
goto DONE

:State
echo %value%^|State=%state%
REM @exit %state%

:DONE
