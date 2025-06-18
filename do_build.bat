@echo off
call do_compression.bat
echo Minifying cart...
..\shrinko\shrinko8.exe -f bin -F p8 -M --title "blobun mini" --title "by cyansorcery" blobun_mini.p8 blobun_mini.bin
echo Done. Exporting desktop binary...
start /wait pico8.exe blobun_mini.min.p8 -export "-e readme.txt blobun_mini.bin"
echo Exporting HTML
start /wait pico8.exe blobun_mini.min.p8 -export "blobun_mini_html/blobun_mini.html"