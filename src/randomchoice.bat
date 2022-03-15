::Chooses a random element from an array at least 10 elements long
::
::Example:
::set array[0]=1
::set array[1]=2
::...
::call randomchoice array element
::echo %element%

@echo off
setlocal enabledelayedexpansion
set value=!%~1[%random:~1,1%]!
endlocal & set %~2=%value%
