@echo off

echo The following Maven command installs your Maven-built Java application
echo into the local Maven repository, which will ultimately be stored in
echo Jenkins's local Maven repository.

:: Use 'call' to ensure Maven returns control to the script
call mvn jar:jar install:install help:evaluate -Dexpression=project.name

echo The following command extracts the value of the name element
echo within project of your Java/Maven project's "pom.xml" file.

:: Capture the project name into a variable
for /f "delims=" %%i in ('mvn -q -DforceStdout help:evaluate -Dexpression=project.name') do set "NAME=%%i"

echo The following command behaves similarly to the previous one but
echo extracts the value of the version element instead.

:: Capture the project version into a variable
for /f "delims=" %%i in ('mvn -q -DforceStdout help:evaluate -Dexpression=project.version') do set "VERSION=%%i"

echo The following command runs and outputs the execution of your Java
echo application (which Jenkins built using Maven) to the Jenkins UI.

:: Run the JAR using Windows backslash path and percent-sign variables
java -jar target\%NAME%-%VERSION%.jar
