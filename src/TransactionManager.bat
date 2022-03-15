set TRANSACTION_MANAGER_OUTPUT_FILE=__transaction_manager_output__
call class %*
%class%

:public-process_transactions transactions
    setlocal enabledelayedexpansion
        set /a counter=0
        for  %%t in (%*) do (
            REM ignore the first two arguments (class and method name) and loop through rest
            if !counter! GTR 1 (
                echo.

                REM Sets the status of the current transaction to in progress
                REM if the amount being sent is greater than 60
                if !%%t.amount! GTR 60 set %%t.status=IN_PROGRESS

                REM Save state of current object to file
                call save __transaction_manager_output__ %%t
            )
            set /a counter=!counter!+1
        )
    endlocal
exit /b
