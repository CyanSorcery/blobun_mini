pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function _init()
 -- debug functions (remove later)
 --#include scripts/s_debug.lua

 -- ashe note: this just looks nicer
 cls(1)
 ?"loading...", 1, 122, 13
 flip()

 -- move compressed data to the general use space, then clear everything
 memcpy(0x8000, 0, 0x4300)
 memset(0x0, 0, 0x4300)

 -- figure out what kind of compressed data we have
 -- note: this has to match the data group offsets
 g_px9_data = {{},{},{},{},{}}
 -- offset of the currently loaded data (so we don't reload it if not necessary)
 g_px9_ind_sprites, g_px9_ind_music = 0, 0

 local _offset, _data = 0x8000, %0x8000
 -- note: this table matches the type order
 while _data != 0 do
  -- figure our what type of data we have, offset, and length
  add(g_px9_data[(_data >> 13)&0x7], _offset+2)
  -- move forward and see what the next data is
  _offset += 2 + (_data&0x1fff)
  _data = %_offset
 end

 -- tile lut
 #include res/r_tile_lut.lua
 -- levels
 #include res/r_levels.lua
 -- sound effects
 #include res/r_sfx.lua

 -- different fillp patterns
 g_fillp_diag, g_fillp_transition = {0xc936, 0x6c93, 0x36c9, 0x936c}, {0x8001.8, 0xa5a5.8, 0xedb7.8, 0xffff.8}

 --[[
   g_fillp_anim - fillp animation factor
   g_wavy_anim - wavy text anim factor
   g_even_frame - if it's an even or odd frame
   g_time - how long the game has been running
   g_intro_anim, g_outro_anim - intro/outro animations for changing game states
   g_menu - list of menus that are active
 ]]
 g_fillp_anim, g_wavy_anim, g_even_frame, g_time, g_intro_anim, g_outro_anim, g_menu = 0, 0, false, time(), 0, 1, {}
 --[[
   g_play_sfx - sound effect to play this frame
   g_puzz_world_target - when loading a new puzzle, these are set
   g_puzz_level_target - related to above
   g_game_mode_target - what game mode we're gonna use
   g_func_update - the update function for the current game mode
   g_func_draw - the draw function for the current game mode
 ]]
 g_play_sfx, g_puzz_world_target, g_puzz_level_target, g_game_mode_target, g_func_update, g_func_draw = nil
 --[[
  g_pal_dark - used for darkening the screen
  g_pal_zappers - color order is cmy, plate/highlight, off/wait/on. use center colors to recolor
  g_pal_stage_bg - palette used for drawing stage backgrounds
  g_pal_stage_trans - used for stage transitions
 ]]
 g_pal_dark, g_pal_zappers, g_pal_stage_bg, g_pal_stage_trans = str2tbl("0001115525511125",16), str2tbl("155dd6122889142449",6), str2tbl("1c1d437369", 5), str2tbl("3c26915154", 5)

 -- parse the level data
 parse_levels()

 -- initialize the save data
 init_config()

 -- decompress the game's sound effects
 decompress_sfx(1)
 
 -- send us to the intro
 --unpack_intro()
 --unpack_title()
 unpack_level(2, 1)
 --unpack_stage_select()
 
 --cstore(0x0, 0x0, 0x4300, "dummy.p8")

end


 --[[
   gameplay modes
   0: title screen
   1: stage select
   2: gameplay
   3: intro screen
 ]]

-- the second parameter may be nil, that's fine
function set_game_mode(_mode, _world_target, _level_target, _skip_l_intro)
 g_game_mode_target, g_puzz_world_target, g_puzz_level_target, g_skip_l_intro, g_s_intro_cd = _mode, _world_target, _level_target, _skip_l_intro, 0
 menus_remove()
 -- stop music
 music(-1)
end
function finalize_game_mode(_func_update, _func_draw)
 g_func_update, g_func_draw, g_s_intro_cd, g_o_list = _func_update, _func_draw, 0, {}
 pal()
end

function _update()
 
 -- get rid of menus when pressing pause?
 if (count(g_menu) > 0 and btn(6)) poke(0x5f30,1) menus_remove()
 
 -- run fillp animation
 g_fillp_anim += .2
 g_fillp_anim %= 4
 -- update wavy factor
 g_wavy_anim += .035
 g_wavy_anim %= 1

 g_even_frame = g_even_frame == false

 -- run the update function
 g_func_update()
 -- allow to skip stage intro
 if (btnp() & 0x30 > 0 and g_s_intro_cd > 45) g_s_intro_cd = 45
 g_s_intro_cd = max(g_s_intro_cd - 1)
 -- do intro animation?
 if (g_s_intro_cd <= 45) g_intro_anim = min(g_intro_anim + .1, 1)
 
 -- are we going to a different screen?
 if g_game_mode_target != nil then
  g_outro_anim = max(g_outro_anim - .1)
  if g_outro_anim == 0 then
   if g_game_mode_target == 0 then
    unpack_title()
   elseif g_game_mode_target == 1 then
    unpack_stage_select()
   elseif g_game_mode_target == 2 then
    unpack_level(g_puzz_world_target, g_puzz_level_target)
   elseif g_game_mode_target == 3 then
    unpack_intro()
   end
   -- reset everything
   g_intro_anim, g_outro_anim, g_game_mode_target, g_puzz_world_target, g_puzz_level_target = 0, 1
  end
 end
 
 -- process menus (if we have em)
 for i,_pane in pairs(g_menu) do _pane:m_step(i) end

 -- play a sound effect this frame?
 if (g_play_sfx != nil) sfx(g_play_sfx >> 10 & 0x3f, 3, g_play_sfx >> 5 & 0x1f, g_play_sfx & 0x1f) g_play_sfx = nil
 
 g_time = time()
 -- if time rolls over, stop the game since timers will break
 if (g_time < 0) stop"game has been running for too long. take a break!"
end

function _draw()
 -- run the draw function
 g_func_draw()
 
 -- set up for stage transition animation
 local _isgame = g_game_mode_target == 2 or g_game_mode_target == nil and count(g_o_list) > 0
 local _world = _isgame and g_puzz_world_target != nil and g_puzz_world_target or g_p_ind_w or 1
 local _colbg, _colshd = _isgame and g_pal_stage_trans[1][_world] or 1, g_pal_stage_trans[2][_world]

 -- draw transition?
 local _anim = g_intro_anim * g_outro_anim
 if (_anim < 1) local _w = 64 * cos(_anim >> 2) rectfill(0, 0, _w, 127, _colbg) rectfill(127 - _w, 0, 127, 127, _colbg)

 -- draw the stage intro?
 -- ashe note: kinda had to put it here for layering
 if g_s_intro_cd > 0 then
  local _sname, _offset = "stage "..g_p_ind_s, cos((max(abs(g_s_intro_cd-45),35)-35)*sgn(g_s_intro_cd-45)/40)*64-64
  local _o1, _o2 = _offset + 8, _offset + 9
  print(_sname, _offset + 13, 98, _colshd)
  local _x = print(_sname, _offset + 12, 97, 7)
  line(_o2, 105, _o2 + _x, 105, _colshd)
  line(_o1, 104, _o1 + _x, 104, 7)
  ?g_p_fst.l_name, _o2, 108, _colshd
  ?g_p_fst.l_name, _o1, 107, 7
  if (_anim == 0) ?g_p_fst.l_author, _o1, 115, _colshd
 end
 
 -- draw menus (if we have em)
 for i,_pane in pairs(g_menu) do _pane:m_draw(i) end
 
--show sprite table
--palt(0, false)
--spr(0,0,0,16,16)
--palt()

end

-->8

-- this is used for the intro, title, and stage select
function unpack_nongameplay(_mus_id)
 decompress_sprites(1)
 decompress_map(1, 0, 0)
 music(_mus_id)
end

-- this function puts us on the intro screen
function unpack_intro()
 unpack_nongameplay(-1)
 finalize_game_mode(update_intro, draw_intro)
 g_intro_countdown = 90
end

 -- this function puts us on the title screen
function unpack_title()
 unpack_nongameplay(-1)
 finalize_game_mode(update_title, draw_title)

 -- animation for title screen background scrolling
 g_title_scroll   = 0
end

function unpack_stage_select()
 unpack_nongameplay(-1)
 finalize_game_mode(update_stage_select, draw_stage_select)
 -- set the world/stage select variables
 local _ws = last_worldstage_get()
 g_sss_menu_world, g_sss_menu_world_tgt = mid(1, _ws.world, count(g_levels))
 g_sss_menu_stage = mid(1, _ws.stage, count(g_levels[g_sss_menu_world]))
 g_title_scroll, g_sss_anim_factor, g_sss_anim_incr, g_sss_colors = 0, 0, .125, str2tbl("13b224cd02415d6d2494", 4)
end

-- this function opens up the game to a given level
function unpack_level(_world, _stage)
 finalize_game_mode(update_gameplay, draw_gameplay)

 local _need_sprites_update = g_px9_ind_sprites != 2

 -- make sure sprites and the appropriate music are decompressed
 decompress_sprites(2)
 decompress_music(1)
 --music(0, 0, 7)

 -- clear the map to be ready for incoming data
 memset(0x2000, 0, 0x1000)
 -- (re)set all the variables involved with levels
 --[[
   g_o_list - all objects in the stage (player is index 1)
   g_a_list - arrows that are shown on the playfield
   g_u_list - queue of undo steps for this puzzle
   g_p_list - all particles currently in use
   g_o_del - objects to delete this frame
   g_shimmer_water - for animating water/lava
 ]]
 g_o_list, g_a_list, g_u_list, g_p_list, g_o_del, g_shimmer_water = {}, {}, {}, {}, {}, 0b1111000111110000.1110000111111000
 
 --[[
   g_s_tiles - how many tiles in the stage
   g_s_touched - how many tiles the player touched
   g_bottom_msg_anim - incremented to show a message at the bottom of the screen
   g_p_coins - how many coins the player has collected
   g_p_octog - how many octogems the player has
   g_cam_x/y - initial position of the camera (updated before player can see)
 ]]
 g_s_tiles, g_s_touched, g_bottom_msg_anim, g_p_coins, g_p_octog, g_cam_x, g_cam_y = 0, 0, 0, 0, 0, 0, -8
 --[[
   g_updt_coin - when set, update the visuals on coin blocks
   g_btn4_held - used to detect when the button has *just* been pressed
   g_level_win - set when the player has won
   g_level_lose - set when the player has lost. can undo from this state
   g_p_use_conv - player is on a conveyer belt
   g_p_use_port - player is in a floor portal
   g_new_time - player got a new time
   g_s_intro_cd - how long until the stage is playable, or 0 if intro is skipped
   g_btn4_press - player just pressed button
 ]]
 g_updt_coin, g_btn4_held, g_level_win, g_level_lose, g_p_use_conv, g_p_use_port, g_new_time, g_s_intro_cd = true, false, false, false, false, false, false, g_skip_l_intro == true and 0 or 90, false
 --[[
   g_p_zap_turn - which zapper is the active one, in this order: 012 = cmy
   g_updt_zap - when set, update the visuals on the floor zappers
   g_p_time - how much time the player has spent on this stage
   g_p_started - the player has started the puzzle
   g_new_dir - used for input buffering, stores upcoming direction
   g_p_blink - how many frames until the player blinks
   g_slime_trail_anim - animation factor for the player slime trail
   g_stage_bg_anim - animation factor for stage bg
 ]]
 g_p_zap_turn, g_updt_zap, g_p_time, g_p_started, g_new_dir, g_p_blink, g_slime_trail_anim, g_stage_bg_anim = 0, true, 0, false, -1, 5, 0, 0

 -- clamp the world index
 _world = mid(1, _world, count(g_levels))
 -- clamp the stage index
 _stage = mid(1, _stage, count(g_levels[_world]))
 -- store this for later
 last_worldstage_set(_world, _stage)
 --[[
   g_p_ind_w - the current world in play
   g_p_ind_s - the current stage in play
   g_p_fst - the puzzle data object in play
 ]]
 g_p_ind_w, g_p_ind_s, g_p_fst = _world, _stage, g_levels[_world][_stage]

 
 
 if (_need_sprites_update) then
  -- get ready to recolor the puzzle
  poke(0x5f55,0x0)
  local _t = str2tbl("2854ef234924d6d54924", 4)
  for i=1,4 do
    pal(_t[1][i], _t[_world][i])
  end
  -- recolor the puzzle walls
  spr(1, 8, 0, 14, 1)
  -- recolor the puzzle floor
  spr(16, 0, 8, 2, 2)
  -- don't draw on the sprite sheet anymore
  poke(0x5f55,0x60)
 end

 -- get ready to parse the level data
 local _level_data, _data_len, _data, _offset, _level_width = {}, #g_p_fst.l_data, g_p_fst.l_data, 1, g_p_fst.l_width
 -- read the data
 -- coco note: since we have to add 2 to the offset to get past the
 -- data length bytes, go ahead and save a call here by chaining it into the loop
 local _dstile, _dsx, _dsy, _mod = 0, 1, 1, 0
 -- convert the level width to grid tile space, offset by one
 _level_width = (_level_width << 1) + 1
 for i=1,_data_len do
  _offset += 2
  _dstile = tonum(sub(_data, _offset, _offset + 1), 0x1)
  _level_data[i] = _dstile
  _mod = (_dsx + _dsy) % 4 == 2 and 1 or 0
  -- now, read this out onto the playfield
  if (_dstile > 0) put_mirrored_tile(_dsx, _dsy, 16 + _mod)
  -- move ahead in the tileset, moving to the next row as needed
  _dsx += 2
  if (_dsx >= _level_width) _dsx = 1 _dsy += 2

 end
 
 -- do the perimeter autotiling
 proc_autotile(0, 0, 32, function(_tile, _x, _y)
  if (_tile > 0 and _tile < 15) mset(_x + 32, _y, _tile)
 end)

 -- in the top right of the work area, mark all tiles as solid
 for _dx=48,64 do
  for _dy=0,16 do
   mset(_dx, _dy, 0)
  end
 end
 -- now, unpack the level data into the top left screen of the work area so we can read it easily
 _dsx, _dsy = 0, 0
 for _tile in all(_level_data) do
  mset(_dsx + 32, _dsy, _tile)
  -- place a floor tile + allow collision here?
  -- note: 0 off means cant pass, 1 means can pass, 2 means slimed
  -- place free tile here, may be overwritten below
  if (_tile != 0) mset(_dsx + 48, _dsy, 1) place_puzz_tile(_dsx, _dsy, _tile) g_s_tiles += 1

  -- do we need to add objects to the object list?
  if (_tile == 33) player_create(_dsx, _dsy)
  -- puzzle keys
  for j=0,4 do
   if (_tile == 2 | (j << 5)) add(g_o_list, create_obj_key(_dsx, _dsy, j + 1, 83 + j))
  end
  
  -- state keys
  for j=0,2 do
   if (_tile == 8 | (j << 5)) add(g_o_list, create_obj_key(_dsx, _dsy, 5 + j, 230 + j))
  end

  -- arrows
  for j=0,3 do
   if (_tile == 17 | (j << 5)) add_hint_arrow(_dsx, _dsy, j)
  end

  -- octogem
  for j=0,7 do
   if (_tile == 15 | (j << 5)) add(g_o_list, create_obj_key(_dsx, _dsy, 8 + j, 87))
  end

  -- generic key
  if (_tile == 44) add(g_o_list, create_obj_key(_dsx, _dsy, 16, 159))

  _dsx += 1
  if (_dsx >= g_p_fst.l_width) _dsy += 1 _dsx = 0
 end

 -- perform water/lava autotile
 calc_lava_water()

 -- slime where stephanie is at and record the first undo step
 -- but only if lesbians are allowed
 if (setting_get(6)) player_end_move(g_o_list[1])
end

-- this places the graphical representation of the given tile
function place_puzz_tile(_x, _y, _tile_id)
 -- find the top left corner of the tile to place. if 0, do nothing
 local _offset = (_tile_id << 1) - 1
 local _tile_tl = tonum("0x"..sub(g_tile_lut, _offset, _offset+1))

 -- do we place a tile?
 if _tile_tl != 0 then
  -- offset for cracked floors
  if (_tile_tl == 124 and (_x + _y) % 2 == 0) _tile_tl += 2
  -- figure out the map coordinates
  local _map_x, _map_y = (_x << 1) + 1, (_y << 1) + 1
  if _tile_tl == 191 or _tile_tl == 207 then
   put_1x4_tile(_map_x, _map_y, _tile_tl)
  elseif _tile_tl < 83 then
   put_mirrored_tile(_map_x, _map_y, _tile_tl)
  else
   put_x16_tile(_map_x, _map_y, _tile_tl)
  end
  -- block/unblock the playfield? -1: nothing, 0: block, 1: unblock
  local _state, _ele_id = -1, _tile_id & 0x1f
  if (_ele_id == 3 or _ele_id == 10) _state = 0 -- raised rgbc or ice block
  if (_ele_id == 4) _state = 1 -- lowered rgbc
  if (_state >= 0) mset(_x + 48, _y, _state)
 end
end

-- do autotiling on the lava and water
function calc_lava_water()
 for _ti in all({191, 207}) do
  proc_autotile(1, _ti, 64, function(_tile, _x, _y, _id)
   if (_tile > 0) mset(_x + 64, _y, (_x % 2 == 0 and _y % 2 == 0 and _tile == 15) and _id - 15 or _id + _tile - 15)
  end)
 end
end

--[[
   initial: what to initialize the lookup tiles with
   id: the tile id to compare to for a hit
   work_x: the work area to put the completed tiles
   place_func: function to run when we put a tile
]]
function proc_autotile(_initial, _id, _work_x, _place_func)
 local _mtl, _mtc, _mtr, _mcl, _mcc, _mcr, _mbl, _mbc, _mbr, _xl, _xr, _yb, _tile = 0
 local _w, _h = (g_p_fst.l_width << 1) + 1, (g_p_fst.l_height << 1) + 1

 for _xc=0,_w do
  -- set our left and right x, without going into the work area
  _xl, _xr = max(_xc - 1), min(_xc + 1, 31)
  -- re-initialize the top and center rows
  _mtl, _mtc, _mtr, _mcl, _mcc, _mcr = _initial, _initial, _initial, _initial, _initial, _initial
  for _yc=0,_h do
   -- get the bottom row, without going into the work area
   _yb = min(_yc + 1, _h)
   _mbl, _mbc, _mbr = mget(_xl, _yb) == _id and 0 or 1, mget(_xc, _yb) == _id and 0 or 1, mget(_xr, _yb) == _id and 0 or 1

   -- don't do this unless the center tile is 0 since
   -- we can know in advance we wont put a tile
   if _mcc == 0 then
   -- figure out what each tile is gonna be, then run the function on it
    _place_func((_mbl + _mbc + _mcl + _mcc == 0 and 1 or 0)
     | (_mbr + _mbc + _mcr + _mcc == 0 and 2 or 0)
     | (_mtr + _mtc + _mcr + _mcc == 0 and 4 or 0)
     | (_mtl + _mtc + _mcl + _mcc == 0 and 8 or 0), _xc, _yc, _id)
   end

   -- store these for the next row
   _mtl, _mtc, _mtr = _mcl, _mcc, _mcr
   _mcl, _mcc, _mcr = _mbl, _mbc, _mbr
  end
 end
 -- copy the data from the work area
 for _dx = 0,31 do
  for _dy = 0,31 do
   -- copy the boundary from the work area over
   _tile = mget(_dx + _work_x, _dy)
   if (_tile > 0) mset(_dx, _dy, _tile)
   -- clear the work area
   mset(_dx + _work_x, _dy, 0)
  end
 end
end


-- this converts the level table from a bunch of strings to worlds/stages
function parse_levels()
 local _lv, _bytes, _offset, _hints = {}
 local _strs = {"l_name", "l_author"}

 for _w, _wt in ipairs(g_levels) do
  _lv[_w]   = {}
  for _s, _str in ipairs(_wt) do
   -- prep a stage struct
   local _fst = {}
   _offset = 1
   -- get the name and author
   for i=1,2 do
    _bytes = tonum(sub(_str, _offset, _offset), 0x1)
    _fst[_strs[i]] = sub(_str, _offset + 1, _offset + _bytes)
    _offset += _bytes + 1
   end
   -- get the stage save slot
   _fst.l_saveslot = tonum(sub(_str, _offset, _offset + 1))
   -- get the stage goal time and dev time
   _fst.l_goaltime = tonum(sub(_str, _offset + 2, _offset + 9))
   _fst.l_devtime = tonum(sub(_str, _offset + 10, _offset + 17))
   _offset += 18
   -- get the stage width
   _fst.l_width = tonum(sub(_str, _offset, _offset), 0x1)
   _offset += 1
   -- get the stage hints
   _hints = tonum(sub(_str, _offset, _offset), 0x1)
   _bytes = ceil(_hints / 2)
   _fst.l_hintcount, _fst.l_hintstr = _hints, _bytes == 0 and "" or sub(_str, _offset + 1, _offset + _bytes)
   -- get the level data itself
   _fst.l_data = sub(_str, _offset + _bytes - 1)
   -- figure out the height
   _fst.l_height = (#_fst.l_data / _fst.l_width) >> 1
   -- store this level data
   _lv[_w][_s] = _fst
  end
 end
 -- replace the level table with this one
 g_levels = _lv
end

function unpack_hints()
 local _hintcount, _hintstr, _x, _y, _bo, _dir, _offset = g_p_fst.l_hintcount - 1, g_p_fst.l_hintstr, g_o_list[1].startx, g_o_list[1].starty, 0
 -- clear the arrow list
 g_a_list = {}
 -- now, add our hint arrows
 for i=0,_hintcount do
  _offset = 1 + i\2
  _dir = tonum("0x"..sub(_hintstr, _offset, _offset)) >> _bo & 0x3
  add_hint_arrow(_x, _y, _dir)
  _x += cos(_dir >> 2)
  _y += sin(_dir >> 2)
  _bo += 2
  _bo %= 4
 end
 -- close the menu
 menus_remove()
end

-->8
#include scripts/s_nongame.lua
-->8
#include scripts/s_gameplay.lua
-->8
#include scripts/s_util.lua
-->8
#include scripts/s_player.lua
-->8
#include scripts/s_particles.lua
-->8
#include scripts/s_px9.lua
-->8
#include scripts/s_menu.lua
-->8
#include scripts/s_config.lua

__gfx__
15a2ffffff0ffffff0df906a24d5a3fd80f69f3e29f946cb64204815e5acbc58000a425b48079e5aff427c1c7d6e9b69fecce861987d6727c37bc097c9283ea9
c07cc119f1461617287a219ff74dbfd381f5e267fb3d7bfdf1133e6f87fd3ec75f78b355ed8f1e8c11fcd42b0e9e793ff8b57b9367eb2423f71f74cd278480fc
f48387facef87f6d3245c5fee78d521b97561f4a74217d0bd96dcd247d533f344977ff8cf2746af704d7c18fbce84ff8ba32beeef43295a1978c02786a5f5edc
c372e6fc612931d4216f56c98f11c179332f7cf2bc482eaf1ad3310aa50f0be21dc19d1e78bb9d6623c3a94043cf0e28f619099f13ea299e46e148d1754a63f6
65633ec367d2f44cad93e78ee1a93ec8834ac2939f7485bf8665d834c7274ef194d9b3e823bcf027550af386e83ecc2f469780bc1f74d9f740a2b835f783f8bf
db29d9e5bcdf52ffcf3146762a9c9f948dc179f5ec4f1b90e2793ef0eb62b1afdf1f9439a845823e1b871029493c4b1e83e36881226e98ea299c3f3d19d3bc19
a388c23138ee05bc8cf18148d0b3e0103b327863e8c8360f0bf21c1cf48c4293448c1ea64327c593e95b1d3f3544394311b9702fd294df09cb2bf439cea6e797
4a675a6949b44211c5c59ad62955a9919b8d9629e4a883a2b4a18c09299a4442dc1d422dac3294329722613f109f70294c1b3e84243423d88cb4c6986da79883
20b312936801827d722610dc14f1080e3ea4c099c1f3448be66b5a481af42f86ea8a9ac65f70662e1213bb584beb46bb9997c5d3363c76794279ce799d515b40
d38d746747ea771ea7b3fdf27e4d371e9bec583252e2b6c36d8b5e9cdc59c1c7e95e712e2ab1f856ba8e119fb68ff748f14e1bbc571e345a333ebd2182429de0
9ffb64402f49f521ff09b9708c1200b254ea5f5f731eff168729784abb2e40fde86c5e79d674ab664a4e844cf906490fb15d0ba5f222bc702a56559e2c296cf2
bec1c211e46c86801acf54215fc2b1610d84227174a37c26bbbd548382f38c8724830c7c2115a6912d946131e7ae29895e984e87a9844e60f84936664838721b
c446dcf29a948d2af3e12bd2239be89cc02f0cec4e2780013cdc1af6e06e79c29639d29d519b2986ab4a9369b26330a5870d8e468c1d46d3343cf07c977c1674
522be8c148b293439c1e8dad3e111b42d52326bc21955f8d51111229c7c292bca83806e4448462629c6b9b2b9b4a9c22984a943912242a64942016ab8c322216
9c4425120bfab1155989d42bd2c2c15b52b5270b8c3888c611948c36936b17c2940193888094241b297c8938684c2169cf170d669c8a1211c129a19426397c4e
8834c0c161289938402c24b570953276ce29902b1f8360199143116ea4213160b683445a620219f7e8e1a3b081f494f85460ead509b6e3402bfa9972354c09f4
340c161e0e3452bde1e7883a5998cb26987e1569ca40419962e2812107170ce3c4729dd211c0b5802c231d4ab844387c22f74bba320de10b2b5dc2490746a166
39fafdac19112f433e05bd1a2786491817ce884a0c52213201dd876293892e9cf339f7c39c2a3161e7872d9521b91278d622db69904e2fcd870d144e903ea4ef
0e6193d842d36c8b2226199e13a1ebd63161206cb78320263344bc12a6ffcf0f98581b562097af4472f414262107c59cb248c24c3878820f046cb0bb40d463fb
0079836d47f94c462bdea1904c19c693610e88c65742a29e3992fc2f4588c2a139d317440294809e4b619642964b39786322679095048606f9c8f9c759581216
11984527c422f4e9cea15dd39843297213ab6c3446218c4ea43578016d889d09d42a2b6793e9c4d24c2742129298304615c2c7cf19a4e81e8529309322432123
9c55b8f1484790361625e81a1e8019f892c6257423d6af45212f83ad19b8fb8a3c8d52fe1198d425298729c8c644f2ec8ef062c3cf6c22f2737a429d835be895
966bf5324e70b78bde00fb222707214ef9cf1ca90f21294e780f18b1c8070774847878722f78591f0f0f7087939fd873278cb611bc2fecf1b3290e397839f983
8f15fc48071b04e98c519339cf42ff0f0f716e79f3a11194444408097448c243c83838fdc2cf4c53cf181bb4e772a8087c39cc2c5687878f30c70e4a85e62c20
2fc8727ba42844210f9e10acbaff0723e5070fcc503645e1bbce594800c03cfd2f70f307f4b2934017432688114206c4730e8070ffff3833480d01280353c80f
fffa22801ef72103a2801efff942a1ef7725efff052030860020a101eb050f8be2fef3aff8d56ff9c0cf9e2ef9f4e786294019fb86eecf5c1cf543bcf545efd1
a16cdc519073758073f948b9ff9406878070f23b070f232c1cf261e0eff3128cc5cf4c36f39c3cfb6ffac1cb103efffa2737760ffff39fb8212cffff4ef729be
a1dabec37117c46fc99fe1ebe46f37e9cf9e28c5f99fe8f8f0af427f1a0bc435f318e61ff61393276620a9d1721b1f70409228b4e71a8d1bdfcf95ec3b131cf1
27119204227d097a0df9f10c0fbf1e83d08b968782901ee07402f74ae79d2e72ac5bfe8cf027a482b01e1e2e122fb848798cf1c5c59975e1e1f94c144ef2e2c0
ff848e2cf2cbc72794805a78d1be6d8f1deb5a9f18725b469cc32ff07d01b78219b85f84cf8eab45e8befff2ca4cbff9f3e17cfee2c82364821a482364000164
9010040c8480000164825399a7d40094208981940090612940242848585211612161e09529422b80106812784e01965095e909011c10e8427942c12717c42027
51e812c842212129442910c4ef14800124212440f7a84289cf398f321e9003c229448f9872c3c748ff0317b0ef4910129842179840c186020ac1d0438f848191
019424321448483b486019e212424948424850161c0f48160161212124601a12304848485816878fffff60911a4901e000000808000000004971cf50e6246208
1680094c220380909016c24242424a424488c8216c81d424241842012121216287215e84c40944b11a1c79444690b03c004298504280874e0ea48142c2cf7144
2095218f4228420442040294294242c312c4218492120c8c598acf09021849a4285211c280100cff083290190d42942298428c612c1d80b0122d01ed88380448
42a2b0ea0908404e0019321d801744248581b1a16c684848584858090b09034829090903212121e20f780efff9b0eb98750f08ffff00ef464401681a48e22862
22701ac8136c81140c80f0800000000068129098601694294ec7288160000000008194240294210940242424e022b0984249f34802cf016290909019c184a122
2258c2121707489c214ef71324a2f80ef491940147262698f1316222980e321646042121e04c021ec21a144e5e1219c4294221900b48424e8444c02c24219012
380d0a0b09090b03c07684872c86012121658fff74e199380c1c1ffb29ffff32f70ff335400000000acff33336cffe44a6121212125212245ef1e2e2e4e2ef78
bd4b15ea090902b84259fb838396839fff13b5c0a48424840805ef1e8ccb43c5cff132b80229c44211910ef70c8172ff3e52952c0243401698fd9070fff7149d
ffcd5ffff52cf549fff7b12cdc5cfff362c1cbcfff96e72effffffff1e78fb8fffbdcdcfff97e0effffff11c78fff7dc3167097cfffbe0524a0fff7b933cffff
7300cfffd6ec0fffffd048fff3ec10e0efff63b004ffffff051fffffffff110032b2ffffff0ffffff0df7040fc93a8c2577aff73113994666bc466233999ca39
9856bc4c2b56269d231bf95930293e2d7af44ef85c33dfb82fff70c1c3a4c7e97c1f71514871c817171f48190715e16f8024ef1ef4e9444e0e4e5a44e29acd2f
19324261e2ac3cf10640c2c0c541c7c2cbcb983110a11715e23cf71e4ef711ef741152ef4f80f583053016c1c8b342c2c112cf002c111328fc6cdcf7c90a6f74
8392ff485874c521c5f4afd2fd7abc7f53b3f852e9877fcbf6e86bbf677b772e9ce78c3f3cf0f3cf19f36ef8427ecf06fb4e7872edcec3aa9c5fc6f51369c197
27d5f4ebbf81b6feb3e90ded72f4e2ded72f48ab5cdf4e93a68b2d3e89e77c87e0ef2e8cc154b4ca5ad21961ac37c85a48693652ea323fc6e8323f1756a61102
ee6642661a90e95c11a1e84619d212f66227b6a4ae945d3250cf63538c8a2e84c19f3cf2e7913e6dd2574a9b21fc20233f762148356c11e84d7cf0e89c4ff029
8b8f942cf69c08f13c199bce2bf2c367466cd6838051cf89448abef1ea4c1cf1270742e3699340d84111cfa901694e2d72a79c3679c1ab368db990f52a093407
0fb54088c794f88e51e0e7b361a3e12431bcc39280210cf694014c6e78c4d11b9323174c6ed9c32de78583e95e704c24237cc3e897cf9b134ee7a22dd39b3578
4c39b7511e17f1bb3dbcd1746fb0198529c8849849fb830c01e02c090cc11680811680786812131a1930c10938fbce859974ead1216a67ea5903d8c12166676a
59033b77bbc17c6e836c174aea4d39b774836ce2e81bb832c7c10bbc77cc675e6748764e8075e1ff8d399bc1f46e2fc31e2fd398bc55f2bffb83e17ff4ee3c5c
1797e29bc579dfffb0d7c1f97e2b67f2f4eec396f947f4e0866070830c10e0070830c1485c24d17ce87e9e2e8f91c162c31a5872c31e90d2c3140218729c8126
3991942b08687c6c41838f5043c31e9071868090dc454ae8443943616b783c3bc4d1247361485a48d08d08d0850163468f3d14e3958de0e39f13c121e0070830
49b200f56e856e26c4ed5819de0fce0ab294524242c31a48212121a48fb905ee5938f12c323a1e807136c8d012c8ff5d07c447ae3b50b1f40161c06850161401
21a148f9942e91e89934ec921b190f056c821a480d0f0fb355268366e89afc667c10270868501a4680912468098c10add87227068366e856e24ae3d86948b807
03c03c03c03e39f7c801b179e5a71417a2d3805630a580912468091e1e0390c79b159ce729b4e2e858762a348c0341a5861a32112981144f9e198c29d5c5c5a7
5832c31e90f4872c31e90fc8589e858729d3af31ffffac779d5e874eff7259b20ac5105ea08271369b2f83074ab9f10f50c1c10e927c7f7c87ef81fcf13e9f34
31e0543c142933c378383e060f30e87c9af7802e36786d42f0244ba5e84dc15aa3b62243c31d2d743edc71528651e2ef85c30c3680cf10458c3c3097834b2524
21d86218d3a2a9867a168274283aa21d81f41b5c42271d8d90299b4eac6f848552178be9df074236f4c1219c2f1707944a99ff107131c3c8384c0109442a81b0
b95ecd2294ec56298b94cee0b4c798329c1165946869d29d715042bf587dacff24ef42dcbeaa42c798f1834ef70237ddcf3a868b8f524e1f78f583643142a114
0e78ff103dff58c5c8f2766f48ece0645287cf1e71610ff729ff58e13c2cf1706a56e817484a211e916fbcf0e32709bd740bcf0ebc9370f4d761db2cb934853c
17c293e09ec64318f5eff5c9cf6e83c99081c3fe0f487241c278b2b0a49425492981aa809ca8a55e1eacc31e1e29b87cac1448c9120d3b42139be87c62c12b61
c39fc5279dffd2fa1f11e7029fe79b812c097a7097eeef1cb745c057e546ecd3702b0f302bcf29c7fb46948324531e80b80ee0fb48f52cf23f7cf22f7c4444e0
7d8036319830f5ad4c0f3bcf3cf3cf43bf3c32074209442c922048722204802cf02f71f70f354c320b06129848f6012108c0219000a1e790fb48b8f9444c0b18
c242c245281248840b0120e80f301e70079cf51c4ca042c2c6819010514240cf11e5acb48f93898d1088090b087a2c2c55161e780f1f0f13e6e1e044af006984
8580b4408243110a243c328b8f301e7905ea84f1184224319028070822270818742cfc1e7901ea84f310420d442c68210960520248ac81fb190fbc0f9432e10c
24342c1140824a2220412803923ef2a48f18f2439f3e144a942148504808022801010f70fb1f30ff8cf34561c0830461ac0461acf1af71f70ff0ff1b020253a4
4a53a4856e702cf048f180f3022ff019313187a0628c350bacdcf7cdcf597edf525fb17270721d380b48cf29380dc903e06cf32f70f7c6e0e8627c39c5f07119
f78b2433d0ff3d0b0267c6bbe856b306c6c278b2cf74905241cfd490930e8364f84c39059d2c8ff346249036c821a0e00f686872153908889513298b0cfeb070
838036c8fd004297610b4c1110e1071fbd0f0f770c9c71a0e7224ca9978b3c31ef02c813ac5cdc921011c148286a4775cf44821a4815e908ff908302838210d3
678d469ee94463d00fbd631ef7e982830c1c290e9c1fb423ff246c0cf716161efb4251950846087c486e194614e6fbbd828b7108d0d0243439c398721fd39e15
6932dc5e7c8c31e02c828662c2c8480f484811a482322fa252fff71ca16c3109050708381a23f68f393803a0e7064149174807c267c8d1123b0e43c8fd8f20ef
31424938ff2a75ae80b0774baf328ffff11ef5df8f5c7750bfe7840e42bc62bd4809f224a94843909621ef874e769b87c2c16711b3c37171f30ff4872cff4787
8b242512c181248f60c81d1e80fff4e160a0020e5acb16cf1cd49ff112490f22f7408387879216c80f3071705efd4c7cf22f54e1e5e66148b9f12801efd4c3cf
097cb0954e73e8094cff180f366ef6ee03e70ef041e70ef820e70fd39fadc5e4f7c7acf0f8427f929f3e107078c91a0e0e4ef5e2e19078d5c7eeb8b8f18f72c3
1ef7a3c3c51e1e3e1ef0e72ef7dc3cf0cfff3e05ef048ffb01efff123ef5e2ea0fb071f08ff96ae706cf7c342cff081f368fb9b3c8f18f3058f18f3058f1c1fc
cf2fb4dbcdfcc9b36e7170ce8dd909f17134e0ecd6683097eaa0f7437dced3ff890e88d595e79d3c0bfe71b833c68f7715bf3215fb856936468ebfb469d17e94
68ef2fbc46fbc1fb0918843cf174c798bc7c7009001993385ea5ce801bc9431c5c4e020c4f16cf2270106652446400c279a1ee7c29c2259849c219673a9f52c8
4734b96e89324e02c271e83803b83e028464a3cd50e5468b34842780610f1f7bcff489420eb8a64e193690c3813b327c3e997083691745914216c85c12c81551
6c0b5ab0164936981e271513985aaeaf78d2862897850021cc5ce10840336f004288cf91f43fc408848d0ff694270e93a21a5e8490d2d3a48656bae574ee7fd7
ac3d3f78f1ef85ecd5175d71e9054d95693e90ff0ff0fb01b275af092756f092f4669c11e893d2ea4e9744c197ea95803ce985c5168db1b8f2c05275c18ba194
0c5d888307199321a5709934ae9057020090e2f0740090e2f07400906e115e8f30cf107cf2c73503534a4e052418027805834093482c188cf3cff5afc73d9904
e952755ef1eff3e8f78f52e8f1817c233023d4e9036c2e1d501f485c369842f485c3a98cf328f34e7b974a44bc3ab4e859312104674e15900ce83a6210853bc1
f7c21f7c293ef0983e7856e8c27437ff095e11e8d1f385ea4867fbcb69f21ab9cf219f529cf28932dc193ce27e57db93b7431bcc294f94eab22fcee3af78df13
af7c0f7c0ff4f14775c2ecaf58e16ff9c2c106cff38f96ad671a8080200b32a1f746e49666c02f3880f302cf00e74b50219e29cf29c54e42210744e690f30907
39ac67c16834e18e51bff3079201e46b072b4dbc20eb9047106980ffb160a47b8bca5f07943a8b4a3afac52dc7d452ef724938329cf1932fb4e8cf31e6e125c2
95eff2c8b12404ffffff0de310842eefffff1000000002000000000000000000000008ffb0d42f1f31d0f1ff319b8f79b8b4e09fb838fb9306ff8dfff393a8e1
1e7c2c31e7738c17002b46ffffff0ff7aef40821436579cdaefbe19c4d574aaa97c3e237d79aa24e12fc4fa594b96e136e8f655aea37fab5d5f34ef0fb8abef9
4fe36787e5f38f34e9999c3333976662fccc4e899dce236c0cea094c80b0910b0136c66c8dc24d62ff3a6ef83f7159c137817e1db56e2f784a179a5a1f8a4ed9
bd836f8c2d87c16137817c1d9cc5e09cf3179f7c2f4c5e19c71f8f427caf461d624eaafbedf3e793d67edfbcebf12e973979f673e21e2076e2fd4ee93c15675f
6c4e9581f62dc6d8c28b6f162e103f5c787eec3d277887fcf7e79dbf7cf297e2e2be3ff83a9f7af0f3070b0e70c1fdf3fcd8b80ff832e708f16e783e6e19cf28
f388215109ef0884e6c9483d2e60fecf13c9c3297edf5c9f8369c1b32fc3def0bb8fce90f75f793e8363f4e3b1f7cc6248f493f794d2b0e23634e013855225f0
d9f36ef99f70cf209f369e7d888d5f707ec9fc1b57938b33fb0ebd633f89db8df3770c8f5e0cf37f6bdabfef9835ce51044cc89f1ea462c6ffc8df3100e0cdb5
7b577d20269c1ec3c1bd6dabadcf3d42bc9fa9777e5ef8bf2f982846e56ed4c9f0e1c18c5fb4cf114176aa0f34eb40f3000279b71b5c93f6ef17de2bcf0ee1f2
f56df6fe1762907bdf0a2987e783fc6b48932ad174291f303d948a6f860487dadf78629116c421b6b2d1f13d863a946489e42492f97df3e8d593e873fe1bbad6
e9e1c527e7e707d1fc1d07c10c3ea3d5df728b0c30e9de8787e78f383ae2f9bea529bb2e1aea367c17d3c6346df4b21c70e407d6978f3e86cf17d5b7a97e2f87
eab398bcedb067337d642c3493e01f4eace794ebc2e6122c69f7ee83040c36cf23ff08160fd5f86b942fd9aedb89f762fcc3b66da7e8e574211799c3d3837248
b16fdf34e051f47b539369977780f2196a22f9722884e1848fe019f1c37878c6768324e57f2798fef85e1a6fbcf21b90f1626772211031fef2bd6b777dd1122b
222cb2114e783c2ff484d14cab8df026f23c9e019366e706c14c979ab2f48b293e795e16cb48f3801c403f7cc98985e5127f37e6bd1b7fa8db6278878ad6198c
ed70731bc0fec5003b6d19cf2e0fa8cf137ee8d27d6acf3ed4ef137a0f71287e07df2bc078f5003fb872763fd5772f7cb18d518a0f09fe2bcf28eea901f30e8c
b1f9db98b3ec3d3b3274f07ad7fc57f7d34e93c5df1eef7266c29f76e2faf16f64354484326462e27111d044843f4cc7944c5e62b8668884644cc85e7977f679
3c79ef0fd1e9e7d77f8df18329a7932f4e97bb398cb98339cc1bdf1227a4ef04c6b98884439cf0e8de419f542722e9d631bf7285293c6bf88d74f7b8d6f3c17d
e475fd4f85e97ef8ba9f788cd7bce0dc5998c2f5c5ef8b6b7229302e49cb454485ec8bc62b84209f2293611169f12e299c919c30119498880df1279ce374e9b8
7eabea3e98febef3fdbdcf12df32115cc2ef8c1b3f8d4dc9ed9f5a288f70fa8f58c963f916a6244411b0e6956b7cc363f387401f70e953ff87675db1fc1b7eb4
a9727d16ff484a62efa0f707edfb4c77bc51bc9170908fdc91e702f78819f529cb1c40cf748f8c598b5674c6737842c0e785ddd7a75c159e12b38ccbfbc677ff
f167bdfff980fffffb11effff732cfffff648fffffd80fffffb11effff732cfffff648fffffd80fffffb11effff732cfffff648fffffd80fffffb11600b966ff
ffff0ff7aef40412386e57d9bfac621119d26c4b7ca2a972f8bc4fbc14cc57ee1f8abeac3e557dd9f1cf1aeaf52ff8f7ec3c5ff4e3f86e13fa9bef94df1aeaf5
25f38acf31df1e457df3dfa7934ef938989bef9c37ddd87e8df3e7932b9f74ef191360601299700b91363362fb87c6c1c9272f48b0127df3bf2db667df0717a4
c3702d451ab057a0118dcf23fb82ffcce79b4294446e938529a2461a6244063b9913976d3ff9e9b36bf5e9344bfbc52ae00814031e666f060ebc583caad98c25
4762834181403164ca81839fc7c860191ea7d50ecf835ff37c5fe9f46ff89be23ff05ffc351c50e562ccf2c06ef1e2ff0e4ef0fbc57579dec3e2d3ff87e9d694
cff739c6bd6bd6bd622222222222222f4abd12fc27542ff4cf098b39c21fb48ab39cd94ef8bcd112ede263d598df12f5c9160ce792200ef87f83b5196f27203f
42ec42fa1f52a1aef13bf3e96e05744202229c67838b89d12cf20000e78ff7cbe8554a42de17787f98bf161f640684bd67f5380e9c44469de1301ef1bc1c3cf2
39837c0326462360f38b5e7178875e0c1ff0f6c39e38c2e1202e362622e8f1c1ef008c1705fcebb5ce834bf7cc0085e4e84f3185a80e1fcdea729945bf20aeb0
1175e79da29c91b84276883029c91f562422988e6332ccd7e57edf3c4785c527a4e2ea75e3264c54e226427fdf3c3bc3bd99ad5e1e85637b4eac17c57529327d
6b3c196eacf237017c5bee79e194ed83d19d67c9169beb3eaf5ecd99830cf367c8c35aae387240ed400742e53e07b6e0936fe23942b1e8743733e70934c8f183
0c309a838f6ed55ac7294fa599c1161f83e8c17cf16be4298d479752cbea30e0bc66fa3c5f9481ff8461067484461112e28c1a8451b3cf09d61f42e8582ff899
c3ece1bf3824244d294aedc4e94cd4c1c65140e5978c8b2ef95add1f2e70c4311d739aa68c4c0c8f56c06296eb354e393e88d42f3c154f79c12a603c0e78307c
575cf24002e372575477a8c336e2c7757e112454c008b1f88f0a879afe5707d4fab2c4873f9f14cdffcc2e329bcf2fef1a1f837c5a9e1c79f763b0d373f0ffb1
e6b3de071de3f54c88bff8c76eaef1bde0c267462f3c4cf33ff8747a3dac2f429d297cf19d29f1c19d44674cd9677c6be11ff5ad98c7bd37c67ce98f9e83e8df
2d7c19cf0f47ba7422b98d270ce78c8f88b28f50bf08f32a23a390946fb84c2e8442f895e1422498b28a83e21c6a69dda69b2b81c2338e1e312b8bd9bcdab570
707c267462d98f36f749dbe85a2b9f078a46f3ae5affa09306d7ec350bcf2f95372cef8c6700bf707c8899b5f57c19ac2f4a9e297c19d215fadebd6fd517f37c
1bb6bd3f4cf7fc17cead6fe6fe3bd1fd71b42e702294edeabc850b9ad2f2c29132eaf00bf06611766f9367c2429d921b83685cc690c8012eab00b706611bca26
4e1f7832d3615bdabbed0f5a273fcc1bf5280c3177a9f1a19f3ead5d77bd744c5bf1c1bb2a49cf011fb4a28764eb02074ead56fcf298f7a339fc27464c329340
b7e90f0cdfbc374ed33f4f242f34ec8e6e837403f388952fb4eb919f83ef836932d50fe76b72954eaadef80f149be70f944aab3e2714037c0e7c8a6e5b26f46b
776bf785ea0db4d16ede175847b487ed74371b384a2b1c2f3037199484842f8561d4be19b6f8178329db19385e5697895caf500994848c3169de4bd6bda9f607
d8c3843fb0ce383e08cce12bd633b52ea4e9856b7404c3fbc11fc58e1f7094477c2296372af3c13f8d17d6d2d3241f2ec3ab42cf3bc3c24287cca194f8d07c1b
88c2b5c801bf329632ceb07cd7c1decbf4cf016994b90ffcbde6bd6438f7e793e8df05d0e71ad80d508b7d67bd63ad0af0c17c1bf322dc63164c5fda327c1bd6
fd3807c7bb9c7bdf0fd6b30dedf6bbf38607f1d6f6a123c6e794e87e86393a2844eb3619c2bd32026f42df042c17fade293f47c5d42cf3f6add6bf12a70ee7e9
__map__
f689c2fd3ceda2c18ef8ae5cc721b4454f387a4ca4d92284787fd1ef8ff7eef948b6ebfee7d2e87704c1995fe459716cd72f73986156d8464ae57fa6e41069e197e7b6fce1d8f95d8a38b3987e4072c4b38459dce4700819d99fb7ed976d9738ba556ce761abd8fe5ce6e8061547b70324f19804fc60871fe60f380edb2fcbe4
eab6882b891ff00c95fc22c7b2d921c92f46e69f1da7edda86ebda064f0249987f249363d93299cb9a10cffafdf0c7337ce68febcbed8a3f1c92c31f227918c4a8f7993ecf735c89f80e5fd77f9a1b5ed7953cae7f5c4ef170b9e5fcc7e5c1cbe3bda739aeeb8bb0a3fd251775b47d7ee0bc724988e3721cf0873d1d17f5bd64
4ca57175b7e6973393f0da258e777cc47b8e4f7b47587fc8b1185b63fffffff07fea4f804a912bc35d76ef5031577378d475e572a9ebcbe5d23c4eafb9ee54d5f343ee9df2fcd1aef2fc6126cfcce499993c33936766f2cc4c9e99c93333396636636c76d9658c815dc6c8ecffdfdceff3c3f1fae13d76787fd9f24bec4992b8
c4f64b5c9be5892d49c4e7175bc7bb2d8b2549e21fb1bdb9d59dc487640df91ffcb7feb13f1cbdaf1fae3d7fdcc2fdb6fde883e3c61f8977c7d776690f9873fb18dc4fdb50d8e30f969ce307799f9cd7fbc3ce6b7bfee6f82fc9f3c758afbecbf184fb97b6bfd007c71b24b6e787b60fe9e07edafe40e17cdafe120d04f3cb23
2c7d72b6c744faaf84fef724d7f3c87b5ccd72e4e23edb8e1ea425993b398eb67fa415ccb985c1d7b63c3c62c29bc9a772f11dcf766cfbbf5c7d923ef4877393a579a2592a17e336fd23b6e4d163271b71da76c496cc967f92bd598e25e72be97533916bebcfd4e78d3f1a7f24c191d4ea8e6cf77389e39924de674e0c91c924
f14fe61fc029599aff07f5b8b3a7e14c8e2cbfccf2105f1259af81d9fe89ed3944635bd57ccc55e99d789f11f33157fc92c72322d2feaefde35964b1c5972d8c25771e47e624bbe6ba7479275db69b398ee417f1cb8e55bfac632adf755dfb65dbcf48b432662272278ee4f821f1e6057ffcf0875fe87cc3b11f7ec83ff02c07
c43289b9087250879bcd012497d49dfd1dea0f2e70f10f8f0476488e497f310ff3de732e976e7f5cfc423d4bf28ec00f8ed40f2226525ba6eba48eec6fd7e1951ed178e48cbdeffc93fc719ff37de211abd8e3b25f3281a8d76935d7651ef3ced64c882462c496f98b637fecd8b163f78ec53fcdb3eed9b167c7e29a1fee3872
fcb23cf5ed1f7df61e89270346f28f1d788db10123f9c50e30c6068cb101636cc0c8757c3ff4ecc7a7b2f9a23ffcf0cbf111fed8f187efb9edfbe5935b0a8117643ee39d777e390efec05ee49503027ec181134f7765d39f7c3d2a57f31c9eafb7e7f3cb4bfc20b9f48763a77f1284e3cdee23b69c76396d9698f561e7f00f6c
d86b56f3c7d1acedfc71fe71ec3afe388e7b91c60f599e799f1d479c4f8f77fbbe977fe6c1953c71fd0ff887ff3f94cfffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f8401d063fffffff07fea4f
80ef14326597badc1ec9548ea86570d4ccf5a4aa76e5b1a689d932380e33cf976b975c673b5f5c6f3b8deb6da771dded34ae1fda695c7fb4d3b87e69a771fdd31e8ec3f18bf9632a83641ebb4ca62a04e1314666b319300166c00c9801336066d879fd725e97d73ff937ff886bd7f24b9350e911dfd8327cfb8e8bc3ec5a647d
5c2a554763213db20cfb3fdd0fb7c7f3cb79f4f9c799fce2fd47b87ea1cfe99f7fba6d4db4c72fe397e587876ff14fe29a2bc0eb4845daff89031cc39b4b42a2cf9526d1fa381212767bae6e5bfff9856e8e5f1844124772f5694a23ff3b39f0e6827f127d1c07a19ee9037f3c935f8ec833b97025f2ff488f6e5b9fedd8b66d
2222edff407078bc397e585c47ec8aa7eba8b3fc805f240857960326ae5918572406c0fbf4a8c8fa3f1082fd20a9c5dbd8b577dd8b38cb89a309e69f3c4363d7fae9ec3d420476bcfc6277f7c7766c6bff356078f3489c67ecdb731cbb10b71cc9e2c3fedadb6e5b8fedd8d6e9967e477ca47573b81ffe2f72fd507dee95d492
6bf98824b2f8b0f9c7932709e662c8991fba6d5bd23f32ffec785d4fb7adfd9fc86c579f3e7daac76a8b25ff10cb9c4d16549f708523dec499b988237379fefae13ab6add7b5675bfbafe1b876edfae5891e62c9b73c39d85c43bd4fb85c6f58def8289b238fe7c8d3f67fa038ae35fd125d63f349306f2432a7631e09c9fe39
e20dfbc1fbf0e8fa872667586cc77b77fd9fd8a58e3d3daa5b2dd972308df8eac2a63b22d7f1a54bdee42093ef893f2e2c8945fe27e0f8a16ddbfaa5b5e45a2ee249fcf1b0598ee1b8dcc7b13fc42dbae5842d6d82dff2b5dbd67b3bb6b5ffcad80fc77a5d5bdfc515ff401c09715eaecbfd241287b167fe49fc91f8e7f2cf75
789bfd0f64b23fac6dea58be17ee5fce2fca0fb8ee1f7ef0dd7fb8ba79373bb11badfe5021fa09ff07f2a26bfe596dcbb6c31f4b5cc9d7a7f95b0eafe3f0cb15c7f1fc7172fcf3c72ffb47771d9fe6dab66f7f78eef3fd05e7f9a679ebe9711ccde5b8ae1c598e2ed976ac9cd9c8a1e27fc4448f1dafcf9d3f2efef1a97d3b67
edb11ec773f6979ecf796e93624ead4b7e38bf5defcea9a7bbaa6fff78be779bfe4f980c95c495a6213fb83cdfbea9a353fda7d7737ddba41ce271ccf0b93cdfbed91cdd337d773dd7b74dff278cf99c72921f72321ef73f3fdcdbbae797b6477ff9637ff4f8e187bbdb76fe13dffd4f8eaae0beaeefdb8e698e69f65ffa7d5f
b76ddbb6adffdaa5ceef8f5f12619ee911fbc9f1ff37c3ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f230c0183ffd73fbfffff0fb2bbc30310182028383686d4f5756d65ed252e46869098a0a8483655dd05c6a5e5559ea3ab030911192129313941
4951596119bd95ad150e80899199a1a9b1b9c1c9d1d9e1c1040a121a222a323a424a525a621285858b93838a929aa2aab2bac2cad2dae2aa8c08131b23333b434b535b63e3746b7b6b69eaf9eb8acc8d05b40d1424b4fc2d444c545cccd3db636c74e4ebf3030f17878e96f69f244992244992ccd1e3b9fafcf09deffdc31fbf
e49f9ffefa6df9efc7dffca07ffefaefcf57fefefcff89bf7eff1ffcf1d3ffe17ff1ffc8ffe4fff2dfffe6fff33ffa3f254992244992fcaffe5fffb3ffdbffeefff73ffc3ffe2fff9fffd3ffebfff6fff7fe7fff0fff87fff18ffffc9fffd7fe2fffefffc5f77ffc9ffff6c7fffd7fffff07feffc1ff5ff8ff0fff7fe2ff5ffc
ff8dfffff1ff47feffc9ff5f81fc7ffe27f9feffcbfff5e7ffc3fff8ff3ffc5fc2cfbffdf1ff67feffcdffdff9ff3fff7fe8ff1ffdffa5fffff4ffa7feffd5ffdffaff5fff7f4cf3ffcffefdff6b4e7f5fffffe1fffc3ffde3ffc4ffe5ffbffdffb9ff7f972449922449f2fff7feffdfff1ffcff87ff7ff1ff3ffeffc9ff7ff9
ff37ffffe7ff1ffdffa7ff7f1534e7f9ff5fffb7ff87fff3ffe4e93ffcffd9dffef8ff7bfffff6ffeffeffdfff3fdcff7ffcff97fffff3ff9ffeffd7ff7ffbff7fe78fe3ff8fdfcffff8d7ff813a955f7ffbe1ff9ffffff5fffffeffe7fffffdffdfffffff80e7ffff0772fd3ee4fcffff02dfffff1ffcff7fc23fbffff3c379
fc78fcffffc0ffff0ffcffffc2ffff0ffc16ff243fdd3bcfffc32fff93feff7fc3ffe6f727911ffbffff0fffff1ff1ffff07ffff3f71e3e5f8ffff8aff43ffffffe239f667ffff3fe3975fffff7fe3ccffe4cf3ae4fff4bf92e787f89ffdd7fffffaffff1dfffffff1ffff217ffff7ffff23ffff5ff2ffff27499224499224f6
ffff29ffffbff2ffff2d7fefffff5ffeff3fe6ffff677ef2ff97fe0ffeffebffd4fea7fffdff7fcdffffdffcff7f4e9224499224c9ff62ffffbff3ffff3dfffffff3bf74fd4ffdff87ff7f091fa1fffffff0ffe93f102a3596db7f48fcffff15e1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff
1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23ecc8f47025f6ac9ab492fa7f25bbbeefdcf61dddbbedd8bd1f76ee8ffdd0efed1f3fec9cfb5dbe9d
e7f5fc71f97f3fc9b53dbff8c31fdf768ab7dbb1edde766c13e9b65fb67569137d7e207eb0ebfd438e371efdc3c1e38f208fefe69cd386fde175fce10dce3c3f4c5c9abce68f38f63cb7f48fa47f78e7971fbcfb25679e3ccb1f831dfbe4128f5d386ff9e1d975d7cefc020e0000000000000000000000000000000000000000
__sfx__
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000

