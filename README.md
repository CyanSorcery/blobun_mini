# Blobun Mini
This is the source code to the game Blobun Mini, which you can find here:

https://cyansorcery.itch.io/blobun-mini

https://store.steampowered.com/app/3827340/Blobun_Mini/

If you simply want to play the game, it is *highly* recommended that you just
go play the game at the links above, rather than trying to play it from here,
as there's quite a bit of setup you'll have to go through to get it running.

## IMPORTANT
This project should **not** be used as the basis for your own pico8 project,
nor should it be used as a reference. It's full of cursed code and many decisions
were made to save tokens in order to cram it all in there, rather than being good
or efficient code practice. Keep that in mind when looking at this project!

Again, **do not use this project as a reference for creating your own pico8 games.**
This game is filled with many advanced techniques that most people should not
bother with, especially if you're a beginner.

## Where To Start
Our main project file is in `blobun_mini.p8`. All subscripts are in `scripts`,
and all game data like music and graphics are in `res`. During development, we
ran out of characters, so we had to start minifying parts of the script. These
can be found in `scriptsmin`, and `blobun_mini.p8` also includes some of them.

Note: Our development environment for this game was in Windows.

## Running The Game
During development, we had shrinko8 downloaded to a directory above this one,
so outside of the project folder. You can find shrinko8 here:

https://github.com/thisismypassport/shrinko8

To run the game, run `run_game.bat`. This will also update all the minified files
contained in `scriptsmin`, as well as all the compressed data (see below.) If you
want to run a minified version of the cart, use `run_mini.bat` instead. This will
update `blobun_mini.min.p8`.

## Asset Compression
This game uses px9 compression, which you can find here:

https://www.lexaloffle.com/bbs/?tid=34058

The compression script can be found in `do_compression.bat`, which calls on
`compress_assets.p8` to compress them in pico8. The resulting data is stored
inside the main `blobun_mini.p8` file. All of the assets in their uncompressed
form are located in `res`.

### Music and Sound Effects
Music is stored in individual cartridges, which all start with `m_`. The first
32 sfx and music patterns are compressed.

Sound Effects are stored in `sfx.p8` and are loaded into the last 32 sfx and
music patterns. We weren't sure how much sound effect data we would need, but it
turned out we actually didn't need that much.

### Graphics
Graphics are stored in png files and cartridges, starting with `s_`. The compression script will update the cartridge with the graphics from the png file before compressing
it. Therefore, the graphics data really doesn't matter - the cartridge is mainly used
to store all the sprite flags.

Note: `s_game_with_extras.png` shows the sprites that are replaced at runtime. However,
these are not stored in the rom as they're not used and thus can be replaced with
black squares for space.

### Level Data
The converted level data and cart name are stored in `r_levels.lua`. Please see
the section on Worldpak Conversion for more information.

### Misc Files
- `r_sfx.lua` was used as a sound effects lookup table, but isn't needed in
the final version, as we just put the numbers directly into the code. It still
contains the script we used to compress the number references.
- `map_lut.p8` contains a lookup table for all the possible metatiles in the game.
You can open that cartridge and import `s_game.png` to see it. These are loaded into
the rightmost part of the pico8 map in-game, and are copied from to make up the
main playfield. Please see the section on Worldpak Conversion for more.
- `s_stage_bg.p8` contains all the stage backgrounds, swapped out depending on
which world you're in.

## Worldpak Conversion
put about the level editor supporting it one day, doing conversions etc

### Level Format

### Map Lookup Table

### Supported Puzzle Elements

## Misc Notes
- To save tokens, there's pretty much no direct tables in the game. Instead, they're
strings which are converted to tables at runtime.

## Credits
- PICO-8 - Lexaloffle Games
- Awe Mono, Hope Gold fonts - Eeve Somepx
- PX9 Data Compression - zep
- 8-BIT Sound Effects¹ - Beep Yeah!

¹Sound effects manually recreated by Roxy.

## License
The game source code is available for download, and is released under
CC4-BY-NC-SA. All other program(s), code, sound effects, music, characters,
graphics, and puzzles (unless otherwise noted) are  Copyright 2024-2025
CyanSorcery All Rights Reserved.