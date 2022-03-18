call util/strip_zeros number 000123
call assert %number% EQU 123 "number should equal 123 but equals %number%"
