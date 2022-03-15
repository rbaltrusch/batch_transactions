::runs batest.bat in the batest folder. Used for a Github Actions Workflow.
::Note that batest does not and cannot return errorlevel if a test failed (windows bug)
::Instead, this is solved by echoing out the number of failed tests and redirecting this.

@echo off
setlocal
set testdir=..\..\src
set tempfile=__batestresult__

::Temporarily add objectbatch to path
set path=%~dp0../objectbatch/objectbatch;%path%

::change here so assert.bat is on path
cd %~dp0../batest/batest
call batest %testdir% > %tempfile%

::call batest again in verbose mode to print all messages
call batest -v -n %testdir%
echo.

pushd %testdir%
type test_report.html
popd

echo.
set /p ERRORLEVEL= < %tempfile%
del %tempfile%
echo %ERRORLEVEL% error(s) occured.
exit /b %ERRORLEVEL%
