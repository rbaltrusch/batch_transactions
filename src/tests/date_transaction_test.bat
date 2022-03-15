call new DateTransaction transaction construct "a" "b" 10
call getattr transaction "date"
call assert "%attr%" EQU "%date%" "Date of object should be %date% but is %attr% %transaction%"
