@echo off
echo The following Maven command installs your Maven-built Java application
echo into the local Maven repository.

:: Use 'call' so the script continues after Maven finishes
call mvn jar:jar install:install help:evaluate -Dexpression=project.name

echo Extracting project name and version...

:: Windows way to capture command output into a variable
for /f "usebackq delims=" %%i in (`mvn -q -DforceStdout help:evaluate -Dexpression=project.name`) do set "NAME=%%i"
for /f "usebackq delims=" %%i in (`mvn -q -DforceStdout help:evaluate -Dexpression=project.version`) do set "VERSION=%%i"

echo The following command runs your Java application:
:: Use %variable% syntax and backslashes for Windows
java -jar target\%NAME%-%VERSION%.jar
