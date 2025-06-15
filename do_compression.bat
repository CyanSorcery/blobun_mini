@echo off
echo Running level conversion...
call minipak_gen.exe -i "C:\Users\spark\AppData\Local\Blobun\worldpak\usermade\pak_cyansorcery_pico8wp.json" -o "D:\Dropbox\Homebase\pico8\blobun_mini\res\r_levels.lua" -m "D:\Dropbox\Homebase\pico8\blobun_mini\res\map_lut.p8"
echo Performing compression routine...
start /wait pico8.exe -x compress_assets.p8
echo Minifying lua files...
set files=s_config s_gameplay s_menu s_nongame s_particles s_player s_px9 s_util s_objects
(for %%f in (%files%) do (
 ..\shrinko\shrinko8.exe -f lua -F lua -M --no-minify-rename scripts\%%f.lua scriptsmin\%%f.lua 
))
echo Done.