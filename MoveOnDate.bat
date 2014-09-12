for /f "tokens=1-4 delims=/ " %%i in ('date /t') do (
      set mm=%%j
      set dd=%%k
      set yy=%%l
)
set TodayDir="c:\Documents %mm%-%dd%-%yy%"
c:
cd\
md %TodayDir%
cd "\Today Documents"
move *.* %TodayDir%
cd\
