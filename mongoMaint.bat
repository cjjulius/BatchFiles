cd C:\mongodb\bin\
SET Count=0

C:\usr\lib\sendmail.exe -t < C:\mongodb\Maint\mongoMaintPROD_Start.txt

:startprod
mongo MongoServer:27017/SomeDB --authenticationDatabase admin -u MaintUser -p MaintUserPW C:\mongodb\Maint\mongoMaintPROD.js

SET /A Count = Count + 1

if %Count% GTR 30 goto endprod
TIMEOUT 15
goto startprod

:endprod

TIMEOUT 15

C:\usr\lib\sendmail.exe -t < C:\mongodb\Maint\mongoMaintPROD_Stop.txt
