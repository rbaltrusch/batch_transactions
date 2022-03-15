::DateTransaction class.
::Inherits from the Transaction class to add a date attribute to each instance in the constructor.

set __super__=Transaction
call class %*
%class%

:public-__dict__
	call super %*
exit /b

:public-construct sender receiver amount
    call super %*
    set %self%.date=%date%
exit /b
