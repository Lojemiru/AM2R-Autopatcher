cd "%~dp0"

REM ren assets\data.win game.droid

java -jar apktool.jar -f d AM2RWrapper.apk 
xcopy assets AM2RWrapper\assets\ /E /H
del AM2RWrapper\assets\AM2R.exe
del AM2RWrapper\assets\data.win
del AM2RWrapper\assets\modifiers.ini
del AM2RWrapper\assets\explanations.txt
del AM2RWrapper\assets\D3DX9_43.dll
RMDIR AM2RWrapper\assets\mods /s /q
java -jar apktool.jar b AM2RWrapper -o AM2RWrapper.apk


RMDIR AM2RWrapper /s /q

ECHO.
ECHO Signing Android APK...
java -jar uber-apk-signer.jar -a AM2RWrapper.apk

del AM2RWrapper.apk
