::runs batest.bat in the batest folder. Used for a Github Actions Workflow.
@echo off
setlocal
::Temporarily add objectbatch to path
set path=%~dp0../objectbatch/objectbatch;%path%

::change here so assert.bat is on path
cd %~dp0../batest/batest
call batest -v -n -t ..\..\src
exit /b %errorlevel%
