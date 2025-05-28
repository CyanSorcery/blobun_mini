@echo off
echo Closing running instances of game...
taskkill /f /im pico8.exe /fi "WINDOWTITLE eq BLOBUN_MINI.MIN.P8 (PICO-8)"
call do_compression.bat
echo Running game...
start /wait pico8.exe -run blobun_mini.p8
echo Game closed