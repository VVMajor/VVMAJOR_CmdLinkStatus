@echo off

rem (c)2015 Volodymyr Maiorov, Kyiv, Ukraine
rem https://github.com/VVMajor/VVMAJOR_CmdLinkStatus

rem cls
rem set ip=%1

set ip=www.ukrtelecom.ua

set file= %windir%\Media\Windows Menu Command.wav
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
rem start /min sound.vbs

:loop
ping -n 3 127.0.0.1 > nul
ping -n 1 %ip% | find "TTL"

if errorlevel 1 goto :alarm
echo ok
goto :loop

:alarm
echo alarm
start /min sound.vbs
goto :loop