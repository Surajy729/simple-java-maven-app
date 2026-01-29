@echo off
setlocal enabledelayedexpansion

echo ===== TROUBLESHOOTING START =====
echo Current Directory: %cd%
echo Listing files in target folder:
dir target
echo ===============================

echo Extracting project name and version...

:: Using Delayed Expansion (!) to ensure variables are populated immediately
for /f "tokens=*" %%i in ('mvn -q -DforceStdout -Dmaven.test.skip^=true help:evaluate -Dexpression^=project.name') do set "NAME=%%i"
for /f "tokens=*" %%i in ('mvn -q -DforceStdout -Dmaven.test.skip^=true help:evaluate -Dexpression^=project.version') do set "VERSION=%%i"

echo.
echo Verified NAME: !NAME!
echo Verified VERSION: !VERSION!
echo.

echo The following command runs your Java application:
:: Using ! instead of % to access the "fresh" variable value
java -jar target\!NAME!-!VERSION!.jar

endlocal
