@echo off
echo Minifying...
..\shrinko\shrinko8.exe -f lua -F lua -m --no-minify-rename scripts\s_config.lua min\s_config.lua
..\shrinko\shrinko8.exe -f lua -F lua -m --no-minify-rename scripts\s_gameplay.lua min\s_gameplay.lua
..\shrinko\shrinko8.exe -f lua -F lua -m --no-minify-rename scripts\s_menu.lua min\s_menu.lua
..\shrinko\shrinko8.exe -f lua -F lua -m --no-minify-rename scripts\s_nongame.lua min\s_nongame.lua
..\shrinko\shrinko8.exe -f lua -F lua -m --no-minify-rename scripts\s_particles.lua min\s_particles.lua
..\shrinko\shrinko8.exe -f lua -F lua -m --no-minify-rename scripts\s_player.lua min\s_player.lua
..\shrinko\shrinko8.exe -f lua -F lua -m --no-minify-rename scripts\s_px9.lua min\s_px9.lua
..\shrinko\shrinko8.exe -f lua -F lua -m --no-minify-rename scripts\s_util.lua min\s_util.lua
echo Minification done