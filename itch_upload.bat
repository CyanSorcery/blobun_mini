@echo off
echo Uploading to Itch
butler push blobun_mini.bin/blobun_mini_windows.zip cyansorcery/blobun-mini:windows
butler push blobun_mini.bin/blobun_mini_osx.zip cyansorcery/blobun-mini:osx
butler push blobun_mini.bin/blobun_mini_linux.zip cyansorcery/blobun-mini:linux
butler push blobun_mini.bin/blobun_mini_raspi.zip cyansorcery/blobun-mini:raspi
butler push blobun_mini.p8.png cyansorcery/blobun-mini:pico8
butler push blobun_mini_html cyansorcery/blobun-mini:html
echo Done