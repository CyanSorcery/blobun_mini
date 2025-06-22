# Blobun Mini
This is the source code to the game Blobun Mini, which you can find here:

https://cyansorcery.itch.io/blobun-mini

https://store.steampowered.com/app/3827340/Blobun_Mini/

If you simply want to play the game, it is *highly* recommended that you just go play the game at the links above, rather than trying to play it from here, as there's quite a bit of setup you'll have to go through to get it running.

## IMPORTANT
This project should **not** be used as the basis for your own pico8 project, nor should it be used as a reference. It's full of cursed code and many decisions were made to save tokens in order to cram it all in there, rather than being good or efficient code practice. Keep that in mind when looking at this project!

Again, **do not use this project as a reference for creating your own pico8 games.**
This game is filled with many advanced techniques that most people should not
bother with, especially if you're a beginner.

## Where To Start
Our main project file is in `blobun_mini.p8`. All subscripts are in `scripts`, and all game data like music and graphics are in `res`. During development, we ran out of characters, so we had to start minifying parts of the script. These can be found in `scriptsmin`, and `blobun_mini.p8` also includes some of them.

Note: Our development environment for this game was in Windows.

## Running The Game
During development, we had shrinko8 downloaded to a directory above this one, so outside of the project folder. You can find shrinko8 here:

https://github.com/thisismypassport/shrinko8

To run the game, run `run_game.bat`. This will also update all the minified files contained in `scriptsmin`, as well as all the compressed data (see below.) If you want to run a minified version of the cart, use `run_mini.bat` instead. This will update `blobun_mini.min.p8`.

## Asset Compression
This game uses px9 compression, which you can find here:

https://www.lexaloffle.com/bbs/?tid=34058

The compression script can be found in `do_compression.bat`, which calls on `compress_assets.p8` to compress them in pico8. The resulting data is stored inside the main `blobun_mini.p8` file. All of the assets in their uncompressed form are located in `res`.

### Music and Sound Effects
Music is stored in individual cartridges, which all start with `m_`. The first 32 sfx and music patterns are compressed.

Sound Effects are stored in `sfx.p8` and are loaded into the last 32 sfx and music patterns. We weren't sure how much sound effect data we would need, but it turned out we actually didn't need that much.

### Graphics
Graphics are stored in png files and cartridges, starting with `s_`. The compression script will update the cartridge with the graphics from the png file before compressing it. Therefore, the graphics data really doesn't matter - the cartridge is mainly used to store all the sprite flags.

Note: `s_game_with_extras.png` shows the sprites that are replaced at runtime. However, these are not stored in the rom as they're not used and thus can be replaced with black squares for space.

### Level Data
The converted level data and cart name are stored in `r_levels.lua`. Please see the section on Worldpak Conversion for more information.

### Misc Files
- `r_sfx.lua` was used as a sound effects lookup table, but isn't needed in the final version, as we just put the numbers directly into the code. It still contains the script we used to compress the number references.
- `map_lut.p8` contains a lookup table for all the possible metatiles in the game. You can open that cartridge and import `s_game.png` to see it. These are loaded into the rightmost part of the pico8 map in-game, and are copied from to make up the main playfield. Please see the section on the Map Lookup Table for more. **Please do not modify this file!**
- `s_stage_bg.p8` contains all the stage backgrounds, swapped out depending on which world you're in.

## Worldpak Conversion
Worldpak conversion is currently done by using `minipak_gen.exe`. Originally we had a PHP file that did it, but to learn C# (and also to make a standalone executable that doesn't require PHP) we rewrote it in C#. Eventually, we'd like Blobun to be able to do the level conversion instead, but that's not how it works now.

You may need the .NET runtime to run this program, but Windows should already have it. It'll let you know if you don't have the correct runtime.

All level data is converted from Blobun Worldpak JSON files. You'll need Blobun (*not* Blobun Mini) to create new levels, if you want to do that. However, the game is tightly packed, so be sure to make your levels on the smaller side, or they wont fit.

**NOTE:** At the time of writing, the pico8-specific level editor is not available. We'll be releasing it in a future update. So, it's not currently recommended to try to make your own levels!

`minipak_gen.exe` takes two arguments, with an optional third one.

- `-i` The input file. This is a Worldpak JSON created by Blobun's level editor.
- `-o` Where you want the file saved once it's been converted.
- `-m` Where to save the map lookup table. This was used during development and will be no use to you, so don't worry about it. See above about the `map_lut.p8` file this generates. Since the lookup tables are baked into the program, you can't change what this outputs.

The source code for the level converter is available here:

https://github.com/CyanSorcery/wp_convert_net

### Level Format
All level data is stored in `res/r_levels.lua`. There's three variables that are set, which are:

- `g_cart_name`: Taken from the Worldpak ID that you convert. This allows each level pack to have its own save data. When read by the game, this is pre-pended with `"cs_blobun_"` to group them together.
- `g_w_req`: How many levels are required to clear each world, as a hex value (max 15)
- `g_levels`: A multidimensional table. The first dimension is what world these stages belong to (limited to between 1 and 5) and contains a table of strings which represent the level data itself (limited to 16 levels per world.)

The level string format is as follows:

- **Stage Name**: 1 character for the string length, minus 1. Then, the name itself. So, for the first stage "tadpole", this is 7 characters - 1, which results in 6 being stored. This value should *never* be empty, and the level converter will put "unset" if it is.
- **Stage Author**: Same format as Stage Name.
- **Stage Width** (1 char, hex): Stage width, minus 1. Possible values are from 0 through 15, to represent stages between 1 and 16 tiles of width. The stage height is limited by 15 tiles, but is calculated from the stage width and the amount of data is in there, so isn't stored.
- **Save Slot** (2 char, dec): Save slot, which should be between 0 and 59. These come from Blobun's `stage_id` field, though it requires the special pico8 level editor to modify. It may not work with levels which were not specifically made for pico8.
- **Stage Target Time** (8 char, dec): The target time to beat, in the format `SSS.MMMM` where S is the amount of seconds, and M is the amount of milliseconds. Internally, 0.0011 is added to the time on conversion to prevent decimal precision issues.
- **Stage Dev Time** (8 char, dec): Same format as Stage Target Time.
- **Hints**: The first character indicates how many hints there are (from 0 to 15), and after that are the hint values (if any.) For each hint, this is the format:
  - Direction (1 char, hex): The direction this arrow should point. 0 = right, 1 = up, 2 = left, 3 = down.
  - X position (1 char, hex): The X position of the hint, from 0 through 15.
  - Y Position (1 char, hex): The Y position of the hint, from 0 through 14.
- **Objects**: First, there's a 2 character hex value which indicates how many objects are in the stage (max 255). Each object *generally* follows the structure below, and is comprised of 5 characters each:
  - ID (1 char, hex): The ID of the object that's to be spawned here (see below).
  - X position (1 char, hex): X spawn position of the object, from 0 through 15.
  - Y position (1 char, hex): Y spawn position from 0 through 14.
  - Sprite/Misc (2 char, hex): What sprite this object should draw. Behavior can change depending on the sprite ID. The usage of these two characters change for some objects.
- **Tile Count** (2 char, hex): How many tiles are in this stage. Note, this is NOT copied from the Worldpak JSON. Instead, it's calculated by the converter to account for stuff like the Slime Trap, which requires 2 moves to cover with slime.
- **Tile Data**: Everything after this is assumed to be level data. There is no indicator of how much should be there. See the section on the Map Lookup Table for more information. Each tile is 2 characters hex, filled in from top left to bottom right, and represents which tile we should copy from the map lookup table.

When the level data is loaded into the game, it is first converted to an internal minipak format (see `convert_stages()` in `blobun_mini.p8` for this function) for speed and efficiency.

NOTE ABOUT HINTS: Blobun Mini renders hint arrows differently from regular Blobun. Blobun will attempt to follow along the path to show the arrow in the next spot, IE going across ice floors and conveyer belts. However, Blobun Mini doesn't do this, and will instead just show a hint arrow for each step of the way. So, hints across any tiles that move you in any way, such as conveyer belts, ice tiles, floor portals etc will not match between the two versions. Keep this in mind.

### Object IDs
Here is a list of all the objects that can be spawned, as well as specific changes to how they use their spawn data (if any)

0. Player spawn. The Misc field isn't used, and is set to `00`.
1. Heart keys.
2. Diamond keys.
3. Triangle keys.
4. Coins.
5. Octogems. Here, the first character of the Misc field is set to 0, and the second character is the Octogem ID, from 0 through 7.
6. Normal state token.
7. Fire state token.
8. Ice state token.
9. Generic key.
10. (hex `a`) Floor portals. Here, the Misc field has the X and Y position of where this floor portal will send you. No sprite is drawn for this object.
11. (hex `b`) Arrows on the floor that are *not* part of the hint arrows, and are instead part of the puzzle. When the player turns hints on, these disappear. The first character of the Misc field is unused, and the second is the direction the arrow points.

Please note, the object table only covers puzzle elements which have a floating key, or are otherwise interactable in some way. It does NOT include stuff like Heart Toggle Blocks, which are simply stored in the level data itself.

### Map Lookup Table

Originally, we had the game simply read Blobun puzzle IDs and do autotiling and whatnot at runtime. However, this proved to use a lot of tokens (about 1000 in fact) so we decided to pre-calculate all of this. The level converter calculates all the autotiling for water, lava, and the puzzle walls, and the result is `map_lut.p8`. When loading the level, each tile is just the ID of what tile to copy from the lookup tabled (store in the right of the pico8 map data at runtime.) Because we messed up, this data is stored top to bottom, and then left to right. So, you'll find tile ID at position 0,2 instead of 2,0.

### Supported Puzzle Elements

The following is a list of puzzle elements from Blobun that are supported. If you use an unsupported puzzle element, a blank tile will be placed instead, and the puzzle will be unsolvable.

Supported (in no particular order): Floor hints, Heart/Diamond/Triangle keys and their associated blocks, Coins and their associated blocks, Octogems and their blocks, Generic Locks and Keys, Floor Portals (all 4 colors,) Conveyer Belts, Floor Zappers, Cracked Floors, Slime Traps, Normal/Fire/Ice States, Lava, Water, Ice Floors, Ice Blocks.

Each of these puzzle elements was chosen based on how well it could reuse existing code, which is why they're mainly toggle blocks. Things like the laser blocks would have been much too tricky to implement.

NOTE: Eventually, we will release the pico8 version of the Blobun Level Editor we used to create this game, which hides all the unsupported puzzle elements automatically. We'll try to remember to update this readme when we do.

## Misc Notes
- To save tokens, there's pretty much no direct tables in the game. Instead, they're strings of hex values which are converted to tables at runtime. The function `str2tbl` creates a 1 dimensional table, while `str2tbl2d` creates a 2 dimensional table.
- Documentation for the various game states, settings IDs, etc. are generally stored in their associated script files in the comments, so we wont document them again here.

## Credits
- PICO-8 - Lexaloffle Games
- Awe Mono, Hope Gold fonts - Eeve Somepx
- PX9 Data Compression - zep
- 8-BIT Sound Effects¹ - Beep Yeah!

¹Sound effects manually recreated by Roxy.

## License
The game source code (contained in lua and p8 files) is released under CC4-BY-NC-SA. All other program(s), code, sound effects, music, characters, graphics, and puzzles (unless otherwise noted) are Copyright 2024-2025 CyanSorcery All Rights Reserved.