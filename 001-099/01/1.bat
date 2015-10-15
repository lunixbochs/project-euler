@echo off
set /A Sum=0
:repeat
set /A I=I+1
if %I%==1000 goto end
SET /A Mod1=%I% %% 5
SET /A Mod2=%I% %% 3
if %Mod1%==0 goto add
if %Mod2%==0 goto add
goto repeat
:add
SET /A Sum=Sum + I
goto repeat
:end
echo %Sum%
