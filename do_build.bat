@echo off
call do_compression.bat
echo Minifying cart...
rem ..\shrinko\shrinko8.exe -f bin -F p8 -M blobun_mini.p8 blobun_mini.bin --pico8-dat "C:\Program Files (x86)\PICO-8\pico8.dat"
..\shrinko\shrinko8.exe -f png -F p8 -M --title "blobun mini" --title "by cyansorcery" blobun_mini.p8 blobun_mini.p8.png
echo Done. Exporting desktop binary...
start /wait pico8.exe blobun_mini.p8.png -export "-e readme.txt blobun_mini.bin"
echo Exporting HTML
start /wait pico8.exe blobun_mini.p8.png -export "blobun_mini_html/index.html"