@echo off
setlocal enabledelayedexpansion

::Temporarily add objectbatch to path to use the objectbatch OOP framework
set path=../objectbatch/objectbatch;%path%

echo -----------------------------------------------------------

::A number of receivers from which a random receiver may be picked using randomchoice.bat
set receivers[1]="carling"
set receivers[2]="joking"
set receivers[3]="loking"
set receivers[4]="koking"
set receivers[5]="eorlking"
set receivers[6]="poki"
set receivers[7]="goki"
set receivers[8]="woki"
set receivers[9]="lowkey"

del serialized.txt

::Instantiate a number of transactions in a for-loop
set /a counter=0
for %%s in ("carl","simon","paul","john","jake","robert") do (
    REM determine transaction class based on counter
    set /a result=!counter! %% 2
    if !result! EQU 0 ( set class=Transaction ) else ( set class=DateTransaction )
    set /a counter=!counter!+1

    ::determine input arguments
    set sender=%%s
    call util/randomchoice receivers receiver
    set amount=!random:~1,2!

    ::instantiate new transaction and append it to array
    call new !class! transaction construct !sender! !receiver! !amount!
    set array=!array!,!transaction!

    REM IMPORTANT: save instantiated object to file, because objects otherwise start to disappear
    REM when instantiating more than 2 objects. Not sure why this is the case, but this seems like a batchfile language bug.
    REM Saving to file allows us to later retrieve the data for all objects by loading the file
    call save serialized.txt !transaction!
)

REM load all instantiated objects from file, then delete the file.
call load serialized.txt delete

::process all transactions inside the TransactionManager class.
::Note that the TransactionManager.process_transactions method is static and thus does not need to be called using an instance object.
call TransactionManager static process_transactions %array%
call load %TRANSACTION_MANAGER_OUTPUT_FILE% delete

::Print out the state of the transactions
for %%t in (%array%) do (
    set transaction=%%t
    call # transaction __dict__
    echo.
)
