call new Transaction transaction construct "a" "b" 10

call getattr transaction sender
call assert %attr% EQU a "Sender should be a but is %attr%" || exit /b %errorlevel%

call getattr transaction receiver
call assert %attr% EQU b "Receiver should be b but is %attr%" || exit /b %errorlevel%

call getattr transaction amount
call assert %attr% EQU 10 "Amount should be 10 but is %attr%" || exit /b %errorlevel%
