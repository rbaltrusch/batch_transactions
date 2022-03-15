::Transaction class, used to represent financial transactions of an amount of money sent from a sender to a receiver.
call class %*
%class%

:public-__dict__
	call super %*
exit /b

:public-construct sender receiver amount
    call super %*
    set %self%.status=SUBMITTED
    set %self%.sender=%~3
    set %self%.receiver=%~4

    call strip_zeros number %~5
    set /a %self%.amount=%number%
exit /b
