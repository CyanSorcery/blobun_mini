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
 memcpy(0x8000, 0x0, 0x4300)
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
 ]]
 g_pal_dark, g_pal_zappers, g_pal_stage_bg = str_to_table("0001115525511125",16), str_to_table("155dd6122889142449",6), str_to_table("1c1d437369", 5)

 -- parse the level data
 parse_levels()

 -- initialize the save data
 init_config()

 -- decompress the game's sound effects
 decompress_sfx(1)
 
 -- send us to the intro
 --unpack_intro()
 --unpack_title()
 unpack_level(1, 2)
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
function set_game_mode(_mode, _world_target, _level_target)
 g_game_mode_target = _mode
 g_puzz_world_target = _world_target
 g_puzz_level_target = _level_target
 -- get rid of any menus
 for _pane in all(g_menu) do
  _pane.m_anim_incr = -0.25
 end
 for i=1,5 do menuitem(i) end
 -- stop music
 music(-1)
end
function finalize_game_mode(_mode, _func_update, _func_draw)
 g_func_update = _func_update
 g_func_draw = _func_draw
 pal()
end

function _update()
 -- run fillp animation
 g_fillp_anim += 0.2
 g_fillp_anim %= 4
 -- update wavy factor
 g_wavy_anim += 0.035
 g_wavy_anim %= 1

 g_even_frame = g_even_frame == false

 -- run the update function
 g_func_update()

 g_intro_anim = min(g_intro_anim + 0.1, 1)
 if g_game_mode_target != nil then
  g_outro_anim = max(g_outro_anim - 0.1)
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
 if g_play_sfx != nil then
  if (setting_get(5)) sfx((g_play_sfx >> 10) & 0x3f, 3, (g_play_sfx >> 5) & 0x1f, g_play_sfx & 0x1f)
  g_play_sfx = nil
 end
 
 
 g_time = time()
 -- if time rolls over, stop the game since timers will break
 if (g_time < 0) stop"game has been running for too long. take a break!"
end

function _draw()
 -- run the draw function
 g_func_draw()
 
 -- draw menus (if we have em)
 for i,_pane in pairs(g_menu) do _pane:m_draw(i) end

 -- draw transition?
 local _anim = g_intro_anim * g_outro_anim
 if _anim < 1 then
  local _w = 64 * cos(_anim >> 2)
  rectfill(0, 0, _w, 127, 1)
  rectfill(127 - _w, 0, 127, 127, 1)
 end
 
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
 finalize_game_mode(3, update_intro, draw_intro)
 g_intro_countdown = 90
end

 -- this function puts us on the title screen
function unpack_title()
 unpack_nongameplay(-1)
 finalize_game_mode(0, update_title, draw_title)

 -- animation for title screen background scrolling
 g_title_scroll   = 0
end

function unpack_stage_select()
 unpack_nongameplay(-1)
 finalize_game_mode(1, update_stage_select, draw_stage_select)
 -- set the world/stage select variables
 local _ws = last_worldstage_get()
 g_sss_menu_world, g_sss_menu_world_tgt = mid(1, _ws.world, count(g_levels))
 g_sss_menu_stage = mid(1, _ws.stage, count(g_levels[g_sss_menu_world]))
 g_title_scroll, g_sss_anim_factor, g_sss_anim_incr   = 0, 0, 0.125
 g_sss_colors = str_to_table("13b224cd02415d6d2494", 4)
end

-- this function opens up the game to a given level
function unpack_level(_world, _stage)
 finalize_game_mode(2, update_gameplay, draw_gameplay)

 local _need_sprites_update = g_px9_ind_sprites != 2

 -- make sure sprites and the appropriate music are decompressed
 decompress_sprites(2)
 decompress_music(1)
 --music(0, 0, 7)

 -- clear the map to be ready for incoming data
 memset(0x2000, 0, 0x1000)
 -- (re)set all the variables involved with levels
 --[[
   g_object_list - all objects in the stage (player is index 1)
   g_arrow_list - arrows that are shown on the playfield
   g_undo_queue - queue of undo steps for this puzzle
   g_particles - all particles currently in use
   g_obj_delete - objects to delete this frame
   g_shimmer_water - for animating water/lava
 ]]
 g_object_list, g_arrow_list, g_undo_queue, g_particles, g_obj_delete, g_shimmer_water = {}, {}, {}, {}, {}, 0b1111000111110000.1110000111111000
 
 --[[
   g_level_tiles - how many tiles in the stage
   g_level_touched - how many tiles the player touched
   g_bottom_msg_anim - incremented to show a message at the bottom of the screen
   g_puzz_coins - how many coins the player has collected
   g_puzz_octogems - how many octogems the player has
   g_cam_x/y - initial position of the camera (updated before player can see)
 ]]
 g_level_tiles, g_level_touched, g_bottom_msg_anim, g_puzz_coins, g_puzz_octogems, g_cam_x, g_cam_y = 0, 0, 0, 0, 0, 0, -8
 --[[
   g_redraw_coin - when set, update the visuals on coin blocks
   g_btn4_held - used to detect when the button has *just* been pressed
   g_level_win - set when the player has won
   g_level_lose - set when the player has lost. can undo from this state
   g_puzz_on_convey - player is on a conveyer belt
   g_puzz_use_portal - player is in a floor portal
 ]]
 g_redraw_coin, g_btn4_held, g_level_win, g_level_lose, g_puzz_on_convey, g_puzz_use_portal = true, false, false, false, false, false
 --[[
   g_puzz_zapper_turn - which zapper is the active one, in this order: 012 = cmy
   g_redraw_zappers - when set, update the visuals on the floor zappers
   g_level_time - how much time the player has spent on this stage
   g_level_started - the player has started the puzzle
   g_new_dir - used for input buffering, stores upcoming direction
   g_player_blink - how many frames until the player blinks
   g_slime_trail_anim - animation factor for the player slime trail
   g_stage_bg_anim - animation factor for stage bg
 ]]
 g_puzz_zapper_turn, g_redraw_zappers, g_level_time, g_level_started, g_new_dir, g_player_blink, g_slime_trail_anim, g_stage_bg_anim = 0, true, 0, false, -1, 5, 0, 0

 -- clamp the world index
 _world = mid(1, _world, count(g_levels))
 -- clamp the stage index
 _stage = mid(1, _stage, count(g_levels[_world]))
 -- store this for later
 last_worldstage_set(_world, _stage)
 --[[
   g_puzz_world_index - the current world in play
   g_puzz_level_index - the current stage in play
   g_puzz_curr_fst - the puzzle data object in play
 ]]
 g_puzz_world_index, g_puzz_level_index, g_puzz_curr_fst = _world, _stage, g_levels[_world][_stage]

 
 
 if (_need_sprites_update) then
  -- get ready to recolor the puzzle
  poke(0x5f55,0x0)
  local _t = str_to_table("2854ef234924d6d54924", 4)
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

 -- add menuitems for this
 menuitem(1, "restart puzzle", menuitem_puzz_restart)
 menuitem(2, "skip puzzle", menuitem_puzz_skip)
 menuitem(3, "stage select", menuitem_puzz_stage_select)
 menuitem(4, "go to title", menuitem_puzz_goto_title)

 -- get ready to parse the level data
 local _level_data = {}
 local _data_len, _data, _offset, _level_width = #g_puzz_curr_fst.l_data, g_puzz_curr_fst.l_data, 1, g_puzz_curr_fst.l_width
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
  _mod = ((_dsx + _dsy) % 4 == 2) and 1 or 0
  -- now, read this out onto the playfield
  if _dstile > 0 then
   put_mirrored_tile(_dsx, _dsy, 16 + _mod)
  end
  -- move ahead in the tileset, moving to the next row as needed
  _dsx += 2
  if _dsx >= _level_width then
   _dsx = 1
   _dsy += 2
  end

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
 -- get the level width data that we stored earlier
 _dsx, _dsy, _level_width = 0, 0, g_puzz_curr_fst.l_width
 for _tile in all(_level_data) do
  mset(_dsx + 32, _dsy, _tile)
  -- place a floor tile + allow collision here?
  -- note: 0 off means cant pass, 1 means can pass, 2 means slimed
  if _tile != 0 then
   -- place free tile, may be overwritten below though
   mset(_dsx + 48, _dsy, 1)
   place_puzz_tile(_dsx, _dsy, _tile)
   g_level_tiles += 1
  end

  -- do we need to add objects to the object list?
  if (_tile == 33) player_create(_dsx, _dsy)
  -- puzzle keys
  for j=0,4 do
   if (_tile == 2 | (j << 5)) add(g_object_list, create_obj_key(_dsx, _dsy, j + 1, 83 + j))
  end
  
  -- state keys
  for j=0,2 do
   if (_tile == 8 | (j << 5)) add(g_object_list, create_obj_key(_dsx, _dsy, 5 + j, 230 + j))
  end

  -- arrows
  for j=0,3 do
   if (_tile == 17 | (j << 5)) add_hint_arrow(_dsx, _dsy, j)
  end

  -- octogem
  for j=0,7 do
   if (_tile == 15 | (j << 5)) add(g_object_list, create_obj_key(_dsx, _dsy, 8 + j, 87))
  end

  -- generic key
  if (_tile == 44) add(g_object_list, create_obj_key(_dsx, _dsy, 16, 159))

  _dsx += 1
  if _dsx >= _level_width then
   _dsy += 1
   _dsx = 0
  end
 end

 -- perform water/lava autotile
 calc_lava_water()

 -- slime where stephanie is at and record the first undo step
 -- but only if lesbians are allowed
 if (setting_get(6)) player_end_move(g_object_list[1])
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
 local _w, _h = (g_puzz_curr_fst.l_width << 1) + 1, (g_puzz_curr_fst.l_height << 1) + 1

 for _xc=0,_w do
  -- set our left and right x, without going into the work area
  _xl, _xr = max(_xc - 1), min(_xc + 1, 31)
  -- re-initialize the top and center rows
  _mtl, _mtc, _mtr, _mcl, _mcc, _mcr = _initial, _initial, _initial, _initial, _initial, _initial
  for _yc=0,_h do
   -- get the bottom row, without going into the work area
   _yb = min(_yc + 1, _h)
   _mbl, _mbc, _mbr = mget(_xl, _yb) == _id and 0 or 1,
      mget(_xc, _yb) == _id and 0 or 1,
      mget(_xr, _yb) == _id and 0 or 1

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
 local _lv, _bytes, _offset = {}
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
   _bytes = ceil(tonum(sub(_str, _offset, _offset), 0x1) / 2)
   _fst.l_hintcount, _fst.l_hintstr = _bytes, _bytes == 0 and "" or sub(_str, _offset + 1, _offset + _bytes)
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
24a2ffffff0ffffff0df906a24d5a3fd80f69f3e29f946cb64204815e5acbc58000a425b48079e5aff427c1c7d6e9b69fecce861987d6727c37bc097c9283ea9
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
8f15fc48071b04e98c519339cf42ff0f0f716e79f3a11194444408097448c243c83838fdc2cf4c3dfe69f30b4a79cfe4c18087c39cc2af425c3c3cf109532731
2725c02c202f49723594098420e3d30474ac4ff1e4a4a3231c1c337d03645e1bb4e5b4800c056e769f566e49b7a59c12883a1134c8021036e8d0832c3cffec10
cf6c9124868014893c032cf2cffe2cf911480ff3908153480ff742cf79868ffd949fce0ef73c1cf791c00a108086048f241c3ec727dbff83ef1fe39eef3918f3
d5cf3f9cf0d429022f71dcd9fb838fb8669fb8acfb343c8b9b221e6ea01e6e39073ff390c0f01e0e5661e0e564838f5c2c1cff724099b8f987ce72978f7def59
387306cfff55e6eec0efff72f715248ffff9cff427d53a57d97e22e89ce933fd3c7d9ce7ec39f3d509be33fd1f1f14f94ee3416996ae720dd2efd26274ecc404
393e4263ef080254079cf241b36bf9f3b4ed6c40f78c544a0098c534e924f7e7003cfe783e430e6a1e1a4248b3c118cf19af56b8f9827deb32f38c921ac24878
b8788cf221e522f7071756e59787c7217019fb8b03cf321ab0fb0f2f9c521249e16fcab53e74bf696e70e94d29523f8cf3c534ce1a44e26d721f3abe2593eaff
fb0b21fef7ef87c1fbbb03ac811a4821ac811004815240001032120004811a4d46ae031042900626421042858421809021616944858485834694298c22408168
c129344a514697242440708329c529078c5c13908c5583680329848484219460039f70120480948011cf9229062ff42ef848720c0b84211e72e90f0f11ef3c4c
d28f35604842294c5221070a180827430d0e321646044290d8401121ec21a144ab4809052129016148503c31681485848480914868c001212161681e1effffb1
4648252483000000202000000005e50f718b90990068120421b80c024242481b0909090929011223a48136439090502904848484890e944932131421d64860f5
211952c2c03009426109020e1938b216090b0ff5019046940e39802900190018429429090f480394025a480032752a2f34284025a29069440b024000ff30e842
4424394298422902b5807432c24884348732e02011298ac28b242021093044e844324c11901616c68681b12121612161242c242c01a424242c8484848b0cf128
fff7e28f62e51c30efff308f391114816821ab80a988c148236c8136401032c3020000000081684242a1485294293f9026810000000006429018429404218090
909388c2422905ef01280f3489424242442702968888412b484c1c1162b409ff5c809ac328f35642140d989852e7c489884228f84819109484830138483b4860
1979784423942984420c21290932111380b0944248c024382c24242c2c03c9121e903a148484851efff19746e020707cffa4effff8cf1cffc411000000082fff
ccc81ffb319a5848484849488059f78b8b839b8ff1e63d649b242428c22945ef2e0e4a1e4eff7cc6138212901210249f78323f2d071ff7c8c228842319444608
ff1036c9cff8794690380d014852e772c1cfff5056ff377dfff790f715efffd6807371ffff89070f2fff7a9f98ffffffff78f1ef2efff6373fff7e938fffffff
ffffcf00b004ffffff051fffffffff1100b1b2ffffff0ffffff0df7040fc93a8c2577aff73113994666bc466233999ca399856bc4c2b56269d231bf95930293e
2d7af44ef85c33dfb82fff70c1c3a4c7e97c1f71514871c817171f48190715e16f8024ef1ef4e9444e0e4e5a44e29acd2f19324261e2ac3cf10640c2c0c541c7
c2cbcb983110a11715e23cf71e4ef711ef741152ef4f80f583053016c1c8b342c2c112cf002c111328fc6cdcf7c90a6f748392ff485874c521c5f4afd2fd7abc
7f53b3f852e9877fcbf6e86bbf677b772e9ce78c3f3cf0f3cf19f36ef8427ecf06fb4e7872edcec3aa9c5fc6f51369c19727d5f4ebbf81b6feb3e90ded72f4e2
ded72f48ab5cdf4e93a68b2d3e89e77c87e0ef2e8cc154b4ca5ad21961ac37c85a48693652ea323fc6e8323f1756a61102ee6642661a90e95c11a1e84619d212
f66227b6a4ae945d3250cf63538c8a2e84c19f3cf2e7913e6dd2574a9b21fc20233f762148356c11e84d7cf0e89c4ff0298b8f942cf69c08f13c199bce2bf2c3
67466cd6838051cf89448abef1ea4c1cf1270742e3699340d84111cfa901694e2d72a79c3679c1ab368db990f52a0934070fb54088c794f88e51e0e7b361a3e1
2431bcc39280210cf694014c6e78c4d11b9323174c6ed9c32de78583e95e704c24237cc3e897cf9b134ee7a22dd39b35784c39b7511e17f1bb3dbcd1746fb019
8529c8849849fb830c01e02c090cc11680811680786812131a1930c10938fbce859974ead1216a67ea5903d8c12166676a59033b77bbc17c6e836c174aea4d39
b774836ce2e81bb832c7c10bbc77cc675e6748764e8075e1ff8d399bc1f46e2fc31e2fd398bc55f2bffb83e17ff4ee3c5c1797e29bc579dfffb0d7c1f97e2b67
f2f4eec396f947f4e0866070830c10e0070830c1485c24d17ce87e9e2e8f91c162c31a5872c31e90d2c3140218729c81263991942b08687c6c41838f5043c31e
9071868090dc454ae8443943616b783c3bc4d1247361485a48d08d08d0850163468f3d14e3958de0e39f13c121e007083049b200f56e856e26c4ed5819de0fce
0ab294524242c31a48212121a48fb905ee5938f12c323a1e807136c8d012c8ff5d07c447ae3b50b1f40161c0685016140121a148f9942e91e89934ec921b190f
056c821a480d0f0fb355268366e89afc667c10270868501a4680912468098c10add87227068366e856e24ae3d86948b80703c03c03c03e39f7c801b179e5a714
17a2d3805630a580912468091e1e0390c79b159ce729b4e2e858762a348c0341a5861a32112981144f9e198c29d5c5c5a75832c31e90f4872c31e90fc8589e85
8729d3af31ffffac779d5e874eff7259b20ac5105ea08271369b2f83074ab9f10f50c1c10e927c7f7c87ef81fcf13e9f3431e0543c142933c378383e060f30e8
7c9af7802e36786d42f0244ba5e84dc15aa3b62243c31d2d743edc71528651e2ef85c30c3680cf10458c3c3097834b252421d86218d3a2a9867a168274283aa2
1d81f41b5c42271d8d90299b4eac6f848552178be9df074236f4c1219c2f1707944a99ff107131c3c8384c0109442a81b0b95ecd2294ec56298b94cee0b4c798
329c1165946869d29d715042bf587dacff24ef42dcbeaa42c798f1834ef70237ddcf3a868b8f524e1f78f583643142a1140e78ff103dff58c5c8f2766f48ece0
645287cf1e71610ff729ff58e13c2cf1706a56e817484a211e916fbcf0e32709bd740bcf0ebc9370f4d761db2cb934853c17c293e09ec64318f5eff5c9cf6e83
c99081c3fe0f487241c278b2b0a49425492981aa809ca8a55e1eacc31e1e29b87cac1448c9120d3b42139be87c62c12b61c39fc5279dffd2fa1f11e7029fe79b
812c097a7097eeef1cb745c057e546ecd3702b0f302bcf29c7fb46948324531e80b80ee0fb48f52cf23f7cf22f7c4444e07d8036319830f5ad4c0f3bcf3cf3cf
43bf3c32074209442c922048722204802cf02f71f70f354c320b06129848f6012108c0219000a1e790fb48b8f9444c0b18c242c245281248840b0120e80f301e
70079cf51c4ca042c2c6819010514240cf11e5acb48f93898d1088090b087a2c2c55161e780f1f0f13e6e1e044af0069848580b4408243110a243c328b8f301e
7905ea84f1184224319028070822270818742cfc1e7901ea84f310420d442c68210960520248ac81fb190fbc0f9432e10c24342c1140824a2220412803923ef2
a48f18f2439f3e144a942148504808022801010f70fb1f30ff8cf34561c0830461ac0461acf1af71f70ff0ff1b020253a44a53a4856e702cf048f180f3022ff0
19313187a0628c350bacdcf7cdcf597edf525fb17270721d380b48cf29380dc903e06cf32f70ff8383a9c1f4c5f07119f733dc43cffd8f7ce8d67d1bc67048d8
5e0758f383821a4828ffb93e81d321f42456903eff099052c813a482830cf41e944d42022665c842e20fbf2c10e02c813e7e42fc20698740870c5cf63c3cfd10
f1ff08f9801b66e1ee0f48f38036c8271f2ff011c148286a4375cf44821a4815e908f99f94070520a7ce0b9c2dd398c6a10e7bd62cffc315070838521c393e79
46ef58c818ff2c2c2cf794a22b009c00f890dc329c28cde77b1507f200b1a14868629721f42eb72d3ac274a9bcf81972c148150dc48581901e9090324905644e
55a4efff2853c872021a0e00703456ed0f72701641cf0c82823e801e85ce81b324661c9681fb1f50cf72848270ff54fa4d1161ee865f740ffff32cfbaf1fb8fe
a06fdf090c9469d46b9012f548439096212d42cf1f8cfc271f8583ce226787e2e2e70ef90f48ff9e0f07584a248303480fd0813a3c11eff9c3c041040cb4973c
8f38b92ff324821e54ef80070f0f252c811e70e2e0acfb98f8f54eb8c3cbcdc28073f34012cfb9878f12f8712b8cf6c11298ff301e7cccfdcd16cf0cf182cf0c
f150cf0eb72f5b9bc9ef8f49f1e194ee352f7c30e0e093341c1c9cfbc5c321e0bb8fcd7171f30ff4872cff47878b2c3c7c3cf1cf4cffa978f18fff7c1acf180f
f712cfff346cfbc5c51e71e2e10ff3d4df0c8ff87848ff103e7c0f737781f30f70a0f30f70a0f383e99f5e79a79bf99377ccf2e08d1bb312f3e268c1c9bdc070
2fc551ef86ea9db7ef131c11bb2bcf2b7816fdf261768d0ffe2a6f742ae71bc27c8c0d7f79c2b3ec39c0df5e799ce793e712301968f3e88f2179f8f002102237
60bc5b8d1126939628b89c14089e3c8f54e020cca488c80085e253cdf852954a21929522de643fb4819e6863dc13748c1485e2c17016617c1409c8478bb0cb8c
0778094e01c20e3ef69ff903940c715d8c327c2187036674e87c33f007c23e8a23842c81b834813aa2c816b4712c827c213c5e2a2621b45d5ff0b50d403f0b00
4289b8d3009066ce1084019f33e96e9900190b1efd294e0c374524bc1921a5a7490dac65dbe8cdfebf497a7ef0f3cf1bc9bb2eaaf2c31a8a3bc27c31ef1ef1e7
1265ea4f125eace125e9cc2932c137a5c59c3f88832fc53b0168d31b8b2c0b7361f581a4ea8307532908ba11170e2237424be023784d31ae040021c5e1e80021
c5e1e80021cc32ac1f708f30e8f58f6a06a6849c1a482014e01a07802780583019f78ffb4f9f6a3318c3b4eaacf3cff7c1ff0fb4c1f303e8566046a9c316c85c
3ab02e90b87c2194e90b874319f740f78cf63f8498697479c1b2724208ce8c3a2108d174d4200b6693ef852ef8527cf1217cf0bcc195e86eef12bc32c1b3e70b
c590dee797d2f524739f522fb429f50374a93278d5ecbea7376f862699529e39c5754e9dd74ff0bf364ff81ef81ef9e38eea85c95fb0d3cef395830c8ff70f3d
4bde24110140067443ef8cc92dcc814e7011e7048f10cf86b0422d529f529b8c94420e88cd21e7021e6259de83c078c30db26ff70e2502c9c61e469a7950c731
8e20c211ef73c049e61795be1e2964179474f59b4a9fa9a4cff482707429f3274e79c19f72cdc34a852bcff581732404ffffff0de310842eefffff1000000002
000000000000000000000008ffb0d42f1f31d0f1ff319b8f79b8b4e09fb838fb9306ff8dfff393a8e11e7c2c31e7738c17002b46ffffff0ff7aef40821436579
cdaefbe19c4d574aaa97c3e237d79aa24e12fc4fa594b96e136e8f655aea37fab5d5f34ef0fb8abef94fe36787e5f38f34e9999c3333976662fccc4e899dce23
6c0cea094c80b0910b0136c66c8dc24d62ff3a6ef83f7159c137817e1db56e2f784a179a5a1f8a4ed9bd836f8c2d87c16137817c1d9cc5e09cf3179f7c2f4c5e
19c71f8f427caf461d624eaafbedf3e793d67edfbcebf12e973979f673e21e2076e2fd4ee93c15675f6c4e9581f62dc6d8c28b6f162e103f5c787eec3d277887
fcf7e79dbf7cf297e2e2be3ff83a9f7af0f3070b0e70c1fdf3fcd8b80ff832e708f16e783e6e19cf28f388215109ef0884e6c9483d2e60fecf13c9c3297edf5c
9f8369c1b32fc3def0bb8fce90f75f793e8363f4e3b1f7cc6248f493f794d2b0e23634e013855225f0d9f36ef99f70cf209f369e7d888d5f707ec9fc1b57938b
33fb0ebd633f89db8df3770c8f5e0cf37f6bdabfef9835ce51044cc89f1ea462c6ffc8df3100e0cdb57b577d20269c1ec3c1bd6dabadcf3d42bc9fa9777e5ef8
bf2f982846e56ed4c9f0e1c18c5fb4cf114176aa0f34eb40f3000279b71b5c93f6ef17de2bcf0ee1f2f56df6fe1762907bdf0a2987e783fc6b48932ad174291f
303d948a6f860487dadf78629116c421b6b2d1f13d863a946489e42492f97df3e8d593e873fe1bbad6e9e1c527e7e707d1fc1d07c10c3ea3d5df728b0c30e9de
8787e78f383ae2f9bea529bb2e1aea367c17d3c6346df4b21c70e407d6978f3e86cf17d5b7a97e2f87eab398bcedb067337d642c3493e01f4eace794ebc2e612
2c69f7ee83040c36cf23ff08160fd5f86b942fd9aedb89f762fcc3b66da7e8e574211799c3d3837248b16fdf34e051f47b539369977780f2196a22f9722884e1
848fe019f1c37878c6768324e57f2798fef85e1a6fbcf21b90f1626772211031fef2bd6b777dd1122b222cb2114e783c2ff484d14cab8df026f23c9e019366e7
06c14c979ab2f48b293e795e16cb48f3801c403f7cc98985e5127f37e6bd1b7fa8db6278878ad6198ced70731bc0fec5003b6d19cf2e0fa8cf137ee8d27d6acf
3ed4ef137a0f71287e07df2bc078f5003fb872763fd5772f7cb18d518a0f09fe2bcf28eea901f30e8cb1f9db98b3ec3d3b3274f07ad7fc57f7d34e93c5df1eef
7266c29f76e2faf16f64354484326462e27111d044843f4cc7944c5e62b8668884644cc85e7977f6793c79ef0fd1e9e7d77f8df18329a7932f4e97bb398cb983
39cc1bdf1227a4ef04c6b98884439cf0e8de419f542722e9d631bf7285293c6bf88d74f7b8d6f3c17de475fd4f85e97ef8ba9f788cd7bce0dc5998c2f5c5ef8b
6b7229302e49cb454485ec8bc62b84209f2293611169f12e299c919c30119498880df1279ce374e9b87eabea3e98febef3fdbdcf12df32115cc2ef8c1b3f8d4d
c9ed9f5a288f70fa8f58c963f916a6244411b0e6956b7cc363f387401f70e953ff87675db1fc1b7eb4a9727d16ff484a62efa0f707edfb4c77bc51bc9170908f
dc91e702f78819f529cb1c40cf748f8c598b5674c6737842c0e785ddd7a75c159e12b38ccbfbc677fff167bdfff980fffffb11effff732cfffff648fffffd80f
ffffb11effff732cfffff648fffffd80fffffb11effff732cfffff648fffffd80fffffb11600b966ffffff0ff7aef40412386e57d9bfac621119d26c4b7ca2a9
72f8bc4fbc14cc57ee1f8abeac3e557dd9f1cf1aeaf52ff8f7ec3c5ff4e3f86e13fa9bef94df1aeaf525f38acf31df1e457df3dfa7934ef938989bef9c37ddd8
7e8df3e7932b9f74ef191360601299700b91363362fb87c6c1c9272f48b0127df3bf2db667df0717a4c3702d451ab057a0118dcf23fb82ffcce79b4294446e93
8529a2461a6244063b9913976d3ff9e9b36bf5e9344bfbc52ae00814031e666f060ebc583caad98c254762834181403164ca81839fc7c860191ea7d50ecf835f
f37c5fe9f46ff89be23ff05ffc351c50e562ccf2c06ef1e2ff0e4ef0fbc57579dec3e2d3ff87e9d694cff739c6bd6bd6bd622222222222222f4abd12fc27542f
f4cf098b39c21fb48ab39cd94ef8bcd112ede263d598df12f5c9160ce792200ef87f83b5196f27203f42ec42fa1f52a1aef13bf3e96e05744202229c67838b89
d12cf20000e78ff7cbe8554a42de17787f98bf161f640684bd67f5380e9c44469de1301ef1bc1c3cf239837c0326462360f38b5e7178875e0c1ff0f6c39e38c2
e1202e362622e8f1c1ef008c1705fcebb5ce834bf7cc0085e4e84f3185a80e1fcdea729945bf20aeb01175e79da29c91b84276883029c91f562422988e6332cc
d7e57edf3c4785c527a4e2ea75e3264c54e226427fdf3c3bc3bd99ad5e1e85637b4eac17c57529327d6b3c196eacf237017c5bee79e194ed83d19d67c9169beb
3eaf5ecd99830cf367c8c35aae387240ed400742e53e07b6e0936fe23942b1e8743733e70934c8f1830c309a838f6ed55ac7294fa599c1161f83e8c17cf16be4
298d479752cbea30e0bc66fa3c5f9481ff8461067484461112e28c1a8451b3cf09d61f42e8582ff899c3ece1bf3824244d294aedc4e94cd4c1c65140e5978c8b
2ef95add1f2e70c4311d739aa68c4c0c8f56c06296eb354e393e88d42f3c154f79c12a603c0e78307c575cf24002e372575477a8c336e2c7757e112454c008b1
f88f0a879afe5707d4fab2c4873f9f14cdffcc2e329bcf2fef1a1f837c5a9e1c79f763b0d373f0ffb1e6b3de071de3f54c88bff8c76eaef1bde0c267462f3c4c
f33ff8747a3dac2f429d297cf19d29f1c19d44674cd9677c6be11ff5ad98c7bd37c67ce98f9e83e8df2d7c19cf0f47ba7422b98d270ce78c8f88b28f50bf08f3
2a23a390946fb84c2e8442f895e1422498b28a83e21c6a69dda69b2b81c2338e1e312b8bd9bcdab570707c267462d98f36f749dbe85a2b9f078a46f3ae5affa0
9306d7ec350bcf2f95372cef8c6700bf707c8899b5f57c19ac2f4a9e297c19d215fadebd6fd517f37c1bb6bd3f4cf7fc17cead6fe6fe3bd1fd71b42e702294ed
eabc850b9ad2f2c29132eaf00bf06611766f9367c2429d921b83685cc690c8012eab00b706611bca264e1f7832d3615bdabbed0f5a273fcc1bf5280c3177a9f1
a19f3ead5d77bd744c5bf1c1bb2a49cf011fb4a28764eb02074ead56fcf298f7a339fc27464c329340b7e90f0cdfbc374ed33f4f242f34ec8e6e837403f38895
2fb4eb919f83ef836932d50fe76b72954eaadef80f149be70f944aab3e2714037c0e7c8a6e5b26f46b776bf785ea0db4d16ede175847b487ed74371b384a2b1c
2f3037199484842f8561d4be19b6f8178329db19385e5697895caf500994848c3169de4bd6bda9f607d8c3843fb0ce383e08cce12bd633b52ea4e9856b7404c3
fbc11fc58e1f7094477c2296372af3c13f8d17d6d2d3241f2ec3ab42cf3bc3c24287cca194f8d07c1b88c2b5c801bf329632ceb07cd7c1decbf4cf016994b90f
fcbde6bd6438f7e793e8df05d0e71ad80d508b7d67bd63ad0af0c17c1bf322dc63164c5fda327c1bd6fd3807c7bb9c7bdf0fd6b30dedf6bbf38607f1d6f6a123
c6e794e87e86393a2844eb3619c2bd32026f42df042c17fade293f47c5d42cf3f6add6bf12a70ee7e96f982cdfc3de2a1ce88feac57c124b54f483a7c44a9d22
__map__
84787fd1ef8ff7eef948b6ebfee7d2e87704c1995fe459716cd72f73986156d8464ae57fa6e41069e197e7b6fce1d8f95d8a38b3987e4072c4b38459dce4700819d99fb7ed976d9738ba556ce761abd8fe5ce6e8061547b70324f19804fc60871fe60f380edb2fcbe4eab6882b891ff00c95fc22c7b2d921c92f46e69f1da7ed
da86ebda064f0249987f249363d93299cb9a10cffafdf0c7337ce68febcbed8a3f1c92c31f227918c4a8f7993ecf735c89f80e5fd77f9a1b5ed7953cae7f5c4ef170b9e5fcc7e5c1cbe3bda739aeeb8bb0a3fd251775b47d7ee0bc724988e3721cf0873d1d17f5bd644ca57175b7e6973393f0da258e777cc47b8e4f7b47587f
c8b1185b63fffffff07fea4f804a912bc35d76ef5031577378d475e572a9ebcbe5d23c4eafb9ee54d5f343ee9df2fcd1aef2fc6126cfcce499993c33936766f2cc4c9e99c93333396636636c76d9658c815dc6c8ecffdfdceff3c3f1fae13d76787fd9f24bec4992b8c4f64b5c9be5892d49c4e7175bc7bb2d8b2549e21fb1bd
b9d59dc487640df91ffcb7feb13f1cbdaf1fae3d7fdcc2fdb6fde883e3c61f8977c7d776690f9873fb18dc4fdb50d8e30f969ce307799f9cd7fbc3ce6b7bfee6f82fc9f3c758afbecbf184fb97b6bfd007c71b24b6e787b60fe9e07edafe40e17cdafe120d04f3cb232c7d72b6c744faaf84fef724d7f3c87b5ccd72e4e23edb
8e1ea425993b398eb67fa415ccb985c1d7b63c3c62c29bc9a772f11dcf766cfbbf5c7d923ef4877393a579a2592a17e336fd23b6e4d163271b71da76c496cc967f92bd598e25e72be97533916bebcfd4e78d3f1a7f24c191d4ea8e6cf77389e39924de674e0c91c924f14fe61fc029599aff07f5b8b3a7e14c8e2cbfccf2105f
1259af81d9fe89ed3944635bd57ccc55e99d789f11f33157fc92c72322d2feaefde35964b1c5972d8c25771e47e624bbe6ba7479275db69b398ee417f1cb8e55bfac632adf755dfb65dbcf48b432662272278ee4f821f1e6057ffcf0875fe87cc3b11f7ec83ff02c07c43289b9087250879bcd012497d49dfd1dea0f2e70f10f
8f0476488e497f310ff3de732e976e7f5cfc423d4bf28ec00f8ed40f2226525ba6eba48eec6fd7e1951ed178e48cbdeffc93fc719ff37de211abd8e3b25f3281a8d76935d7651ef3ced64c882462c496f98b637fecd8b163f78ec53fcdb3eed9b167c7e29a1fee3872fcb23cf5ed1f7df61e89270346f28f1d788db10123f9c5
0e30c6068cb101636cc0c8757c3ff4ecc7a7b2f9a23ffcf0cbf111fed8f187efb9edfbe5935b0a8117643ee39d777e390efec05ee49503027ec181134f7765d39f7c3d2a57f31c9eafb7e7f3cb4bfc20b9f48763a77f1284e3cdee23b69c76396d9698f561e7f00f6cd86b56f3c7d1acedfc71fe71ec3afe388e7b91c60f599e
799f1d479c4f8f77fbbe977fe6c1953c71fd0ff887ff3f94cfffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f8401d063fffffff07fea4f80ef14326597badc1ec9548ea86570d4ccf5a4aa76e5b1
a689d932380e33cf976b975c673b5f5c6f3b8deb6da771dded34ae1fda695c7fb4d3b87e69a771fdd31e8ec3f18bf9632a83641ebb4ca62a04e1314666b319300166c00c9801336066d879fd725e97d73ff937ff886bd7f24b9350e911dfd8327cfb8e8bc3ec5a647d5c2a554763213db20cfb3fdd0fb7c7f3cb79f4f9c799fc
e2fd47b87ea1cfe99f7fba6d4db4c72fe397e587876ff14fe29a2bc0eb4845daff89031cc39b4b42a2cf9526d1fa381212767bae6e5bfff9856e8e5f1844124772f5694a23ff3b39f0e6827f127d1c07a19ee9037f3c935f8ec833b97025f2ff488f6e5b9fedd8b66d2222edff407078bc397e585c47ec8aa7eba8b3fc805f24
0857960326ae5918572406c0fbf4a8c8fa3f1082fd20a9c5dbd8b577dd8b38cb89a309e69f3c4363d7fae9ec3d420476bcfc6277f7c7766c6bff356078f3489c67ecdb731cbb10b71cc9e2c3fedadb6e5b8fedd8d6e9967e477ca47573b81ffe2f72fd507dee95d4926bf98824b2f8b0f9c7932709e662c8991fba6d5bd23f32
ffec785d4fb7adfd9fc86c579f3e7daac76a8b25ff10cb9c4d16549f708523dec499b988237379fefae13ab6add7b5675bfbafe1b876edfae5891e62c9b73c39d85c43bd4fb85c6f58def8289b238fe7c8d3f67fa038ae35fd125d63f349306f2432a7631e09c9fe39e20dfbc1fbf0e8fa872667586cc77b77fd9fd8a58e3d3d
aa5b2dd972308df8eac2a63b22d7f1a54bdee42093ef893f2e2c8945fe27e0f8a16ddbfaa5b5e45a2ee249fcf1b0598ee1b8dcc7b13fc42dbae5842d6d82dff2b5dbd67b3bb6b5ffcad80fc77a5d5bdfc515ff401c09715eaecbfd241287b167fe49fc91f8e7f2cf75789bfd0f64b23fac6dea58be17ee5fce2fca0fb8ee1f7e
f0dd7fb8ba79373bb11badfe5021fa09ff07f2a26bfe596dcbb6c31f4b5cc9d7a7f95b0eafe3f0cb15c7f1fc7172fcf3c72ffb47771d9fe6dab66f7f78eef3fd05e7f9a679ebe9711ccde5b8ae1c598e2ed976ac9cd9c8a1e27fc4448f1dafcf9d3f2efef1a97d3b67edb11ec773f6979ecf796e93624ead4b7e38bf5defcea9
a7bbaa6fff78be779bfe4f980c95c495a6213fb83cdfbea9a353fda7d7737ddba41ce271ccf0b93cdfbed91cdd337d773dd7b74dff278cf99c72921f72321ef73f3fdcdbbae797b6477ff9637ff4f8e187bbdb76fe13dffd4f8eaae0beaeefdb8e698e69f65ffa7d5fb76ddbb6adffdaa5ceef8f5f12619ee911fbc9f1ff37c3
ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f230c0183ffd73fbfffff0fb2bbc30310182028383686d4f5756d65ed252e46869098a0a8483655dd05c6a5e5559ea3ab0309111921293139414951596119bd95ad150e80899199a1a9b1b9c1c9d1d9e1
c1040a121a222a323a424a525a621285858b93838a929aa2aab2bac2cad2dae2aa8c08131b23333b434b535b63e3746b7b6b69eaf9eb8acc8d05b40d1424b4fc2d444c545cccd3db636c74e4ebf3030f17878e96f69f244992244992ccd1e3b9fafcf09deffdc31fbfe49f9ffefa6df9efc7dffca07ffefaefcf57fefefcff89
bf7eff1ffcf1d3ffe17ff1ffc8ffe4fff2dfffe6fff33ffa3f254992244992fcaffe5fffb3ffdbffeefff73ffc3ffe2fff9fffd3ffebfff6fff7fe7fff0fff87fff18ffffc9fffd7fe2fffefffc5f77ffc9ffff6c7fffd7fffff07feffc1ff5ff8ff0fff7fe2ff5ffcff8dfffff1ff47feffc9ff5f81fc7ffe27f9feffcbfff5
e7ffc3fff8ff3ffc5fc2cfbffdf1ff67feffcdffdff9ff3fff7fe8ff1ffdffa5fffff4ffa7feffd5ffdffaff5fff7f4cf3ffcffefdff6b4e7f5fffffe1fffc3ffde3ffc4ffe5ffbffdffb9ff7f972449922449f2fff7feffdfff1ffcff87ff7ff1ff3ffeffc9ff7ff9ff37ffffe7ff1ffdffa7ff7f1534e7f9ff5fffb7ff87ff
f3ffe4e93ffcffd9dffef8ff7bfffff6ffeffeffdfff3fdcff7ffcff97fffff3ff9ffeffd7ff7ffbff7fe78fe3ff8fdfcffff8d7ff813a955f7ffbe1ff9ffffff5fffffeffe7fffffdffdfffffff80e7ffff0772fd3ee4fcffff02dfffff1ffcff7fc23fbffff3c379fc78fcffffc0ffff0ffcffffc2ffff0ffc16ff243fdd3b
cfffc32fff93feff7fc3ffe6f727911ffbffff0fffff1ff1ffff07ffff3f71e3e5f8ffff8aff43ffffffe239f667ffff3fe3975fffff7fe3ccffe4cf3ae4fff4bf92e787f89ffdd7fffffaffff1dfffffff1ffff217ffff7ffff23ffff5ff2ffff27499224499224f6ffff29ffffbff2ffff2d7fefffff5ffeff3fe6ffff677e
f2ff97fe0ffeffebffd4fea7fffdff7fcdffffdffcff7f4e9224499224c9ff62ffffbff3ffff3dfffffff3bf74fd4ffdff87ff7f091fa1fffffff0ffe93f102a3596db7f48fcffff15e1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fc
ffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23ecc8f47025f6ac9ab492fa7f25bbbeefdcf61dddbbedd8bd1f76ee8ffdd0efed1f3fec9cfb5dbe9de7f5fc71f97f3fc9b53dbff8c31fdf768ab7dbb1edde76
6c13e9b65fb67569137d7e207eb0ebfd438e371efdc3c1e38f208fefe69cd386fde175fce10dce3c3f4c5c9abce68f38f63cb7f48fa47f78e7971fbcfb25679e3ccb1f831dfbe4128f5d386ff9e1d975d7cefc020e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

