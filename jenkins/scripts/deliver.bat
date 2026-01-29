@echo off
echo The following Maven command installs your Maven-built Java application
echo into the local Maven repository.

:: Use 'call' to ensure Maven returns control to the script
call mvn jar:jar install:install help:evaluate -Dexpression=project.name -q -DforceStdout

echo Extracting project name and version...

:: Use -q and -DforceStdout to get ONLY the clean text
for /f "usebackq delims=" %%i in (`mvn -q -DforceStdout help:evaluate -Dexpression=project.name`) do set "NAME=%%i"
for /f "usebackq delims=" %%i in (`mvn -q -DforceStdout help:evaluate -Dexpression=project.version`) do set "VERSION=%%i"

echo The following command runs your Java application:
:: Use the %NAME% syntax for Windows variables
java -jar target\%NAME%-%VERSION%.jar
