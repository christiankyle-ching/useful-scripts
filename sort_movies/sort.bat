@echo OFF

SET "_root=%~dp0"

@REM Create _INPUT_ and Output Folders
MD _INPUT_
MD _WITH_SUBS_
MD _NO_SUBS_

@REM Move already sorted files back to root
CD _WITH_SUBS_
FOR /D %%i IN (*) DO MOVE "%%i" %_root%\_INPUT_
cd %_root%

@REM Move already sorted files back to root
CD _NO_SUBS_
FOR /D %%i IN (*) DO MOVE "%%i" %_root%\_INPUT_
cd %_root%

@REM Sort Again
CD _INPUT_
FOR /D %%i IN (*) DO (

    @REM Check if there is subtitle inside
    IF EXIST "%%i\*.srt" (
        ECHO Moving [WITH_SUB] "%%i"...
        MOVE "%%i" %_root%\_WITH_SUBS_
    ) ELSE (
        ECHO Moving [NO_SUB] "%%i"...
        MOVE "%%i" %_root%\_NO_SUBS_
    )

)
cd %_root%

GOTO :EOF
