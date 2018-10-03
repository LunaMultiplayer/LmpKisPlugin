::You must keep this file in the solution folder for it to work. 
::Make sure to pass the solution configuration when calling it (either Debug or Release)

::Set the directories in the setdirectories.bat file if you want a different folder than Kerbal Space Program
::EXAMPLE:
SET KSPPATH=C:\Program Files (x86)\Steam\steamapps\common\Kerbal Space Program
SET KSPPATH2=C:\Users\Malte\Desktop\Kerbal Space Program
call "%~dp0\SetDirectories.bat"

IF DEFINED KSPPATH (ECHO KSPPATH is defined) ELSE (SET KSPPATH=C:\Kerbal Space Program)
IF DEFINED KSPPATH2 (ECHO KSPPATH2 is defined)
::%1
SET SOLUTIONCONFIGURATION=Debug

del "%KSPPATH%\GameData\LunaMultiplayer\Plugins\LmpKisPlugin.*" /Q /F
IF DEFINED KSPPATH2 (del "%KSPPATH2%\GameData\LunaMultiplayer\Plugins\LmpKisPlugin.*" /Q /F)

mkdir "%KSPPATH%\GameData\LunaMultiplayer\PartSync\KIS"
IF DEFINED KSPPATH2 (mkdir "%KSPPATH2%\GameData\LunaMultiplayer\PartSync\KIS")

del "%KSPPATH%\GameData\LunaMultiplayer\PartSync\KIS\*.*" /Q /F
IF DEFINED KSPPATH2 (del "%KSPPATH2%\GameData\LunaMultiplayer\PartSync\KIS\*.*" /Q /F)

"%~dp0..\External\pdb2mdb\pdb2mdb.exe" "%~dp0..\LmpKisPlugin\bin\%SOLUTIONCONFIGURATION%\LmpKisPlugin.dll"

xcopy /Y "%~dp0..\LmpKisPlugin\bin\%SOLUTIONCONFIGURATION%\LmpKisPlugin.*" "%KSPPATH%\GameData\LunaMultiplayer\Plugins"
IF DEFINED KSPPATH2 (xcopy /Y "%~dp0..\LmpKisPlugin\bin\%SOLUTIONCONFIGURATION%\LmpKisPlugin.*" "%KSPPATH2%\GameData\LunaMultiplayer\Plugins")

xcopy /Y /S "%~dp0..\LmpKisPlugin\XML\*.*" "%KSPPATH%\GameData\LunaMultiplayer\PartSync\"
IF DEFINED KSPPATH2 (xcopy /Y /S "%~dp0..\LmpKisPlugin\XML\*.*" "%KSPPATH2%\GameData\LunaMultiplayer\PartSync\")
