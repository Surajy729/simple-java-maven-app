@echo off

echo The following Maven command installs your Maven-built Java application
echo into the local Maven repository.

:: Use 'call' to ensure Maven returns control to the script
call mvn jar:jar install:install help:evaluate -Dexpression=project.name -q -DforceStdout

echo Extracting project name and version...

:: Using tokens=* and caret escaping (^=) for the most stable variable capture on Windows
for /f "tokens=*" %%i in ('mvn -q -DforceStdout -Dmaven.test.skip^=true help:evaluate -Dexpression^=project.name') do set "NAME=%%i"
for /f "tokens=*" %%i in ('mvn -q -DforceStdout -Dmaven.test.skip^=true help:evaluate -Dexpression^=project.version') do set "VERSION=%%i"

echo The following command runs your Java application:
:: Use %variable% syntax and double backslashes for the Windows file path
java -jar target\%NAME%-%VERSION%.jar
