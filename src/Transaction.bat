::Transaction class, used to represent financial transactions of an amount of money sent from a sender to a receiver.
call class %*
%class%

:public-process
    REM Sets status to in progress if the amount being sent is greater than 60
    call getattr self amount
    if %attr% GTR 60 set %self%.status=IN_PROGRESS
exit /b

:public-__dict__
	call super %*
exit /b

:public-construct sender receiver amount
    call super %*
    set %self%.status=SUBMITTED
    set %self%.sender=%~3
    set %self%.receiver=%~4

    call util/strip_zeros number %~5
    set /a %self%.amount=%number%
exit /b
