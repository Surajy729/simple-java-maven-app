@echo off
setlocal enabledelayedexpansion

echo ===== TROUBLESHOOTING START =====
echo Current Directory: %cd%
dir target
echo ===============================

echo Extracting project name and version...

:: You MUST have the '=' after -Dexpression
for /f "tokens=*" %%i in ('mvn -q -DforceStdout -Dmaven.test.skip^=true help:evaluate -Dexpression^=project.name') do set "NAME=%%i"
for /f "tokens=*" %%i in ('mvn -q -DforceStdout -Dmaven.test.skip^=true help:evaluate -Dexpression^=project.version') do set "VERSION=%%i"

echo.
echo Verified NAME: !NAME!
echo Verified VERSION: !VERSION!
echo.

echo The following command runs your Java application:
:: Use ! for delayed expansion to access the variables set above
java -jar target\!NAME!-!VERSION!.jar

endlocal
