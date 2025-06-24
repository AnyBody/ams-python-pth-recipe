REM Set 
set "ANYBODY_PATH_PYTHONHOME=%CONDA_PREFIX%"


REM CODE for removing entry in the PATH variable
REM We may want to use this if we need to add ANYBODY to the path. 
REM Currently we just rely on ANYBODY beeing diretly in the BIN folder
REM which is already on PATH.

@REM ::Turn off command display and allows environmental variables to be overridden for the current session
@REM @echo off & setlocal

@REM ::Creates a unique file to use for the 'for loop'
@REM set "TMPFILE="%temp%\tmp%RANDOM%%RANDOM%.txt""

@REM ::Duplicate PATH into OLDPATH
@REM set "OLDPATH=%PATH%"

@REM ::Declare label for the 'goto' command
@REM :Loop

@REM ::Extract the first text token with the default delimiter of semicolon
@REM for /f "tokens=1 delims=;" %%G in ("%OLDPATH%") do (

@REM REM Copy text token to TMPFILE unless what we want to remove is found
@REM <NUL set /p="%%G" | find /i "StRiNgThAtMaTcHeSwHaTtOrEmOvE" >NUL 2>&1 || <NUL set /p="%%G;" >>%TMPFILE%

@REM REM Remove text token from OLDPATH
@REM set "OLDPATH=%OLDPATH:*;=%"
@REM )

@REM ::Repeat loop until OLDPATH no longer has any delimiters, and then add any remaining value to TMPFILE
@REM echo %OLDPATH% | findstr /C:";" >NUL && (goto :Loop) || <NUL set /p="%OLDPATH%" >>%TMPFILE%

@REM ::Set the path to TMPFILE
@REM for /f "usebackq delims=" %%G in (%TMPFILE%) do (set "PATH=%%G")

@REM ::Clean-up
@REM del %TMPFILE% >NUL 2>&1

@REM ::An echo and pause just for debug purposes
@REM echo %PATH%
@REM pause