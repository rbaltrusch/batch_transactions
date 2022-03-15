set amount=10
call new Transaction transaction construct "a" "b" %amount%
call TransactionManager static process_transactions %transaction%
call load %TRANSACTION_MANAGER_OUTPUT_FILE% delete
call getattr transaction status
call assert "%attr%" EQU "SUBMITTED" "State should still be SUBMITTED for transactions with amount below 60!"
if errorlevel 1 exit /b %errorlevel%

set amount=70
call new Transaction transaction construct "a" "b" %amount%
call TransactionManager static process_transactions %transaction%
call load %TRANSACTION_MANAGER_OUTPUT_FILE% delete
call getattr transaction status
call assert "%attr%" EQU "IN_PROGRESS" "State should be IN_PROGRESS for transactions with amount above 60!"
