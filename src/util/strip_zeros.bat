::This command strips leading zeros from a number, using the built in exit /b functionality
:: Call it using call strip_zeros name number, e.g. call strip_zeros a 123
@echo off
for /f "tokens=* delims=0" %%n in ("%2") do set "%1=%%n"
if not defined %1 set %1=0
