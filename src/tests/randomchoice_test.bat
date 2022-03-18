::Instantiate array of 10 elements, pick a random one, then assert that the picked element is in array

for /L %%i in (0 1 10) do set array[%%i]=%%i%%i
call util/randomchoice array element

setlocal enabledelayedexpansion
set passed=false
for /L %%i in (0 1 10) do (
    if %%i%%i EQU !element! (
        set passed=true
    )
)
endlocal & set passed=%passed%

call assert %passed% EQU true "Element should be chosen from the array but is equal to %element%"
