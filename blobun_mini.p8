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

 -- parse the level data
 parse_levels()

 -- initialize the save data
 init_config()

 -- decompress the game's sound effects
 decompress_sfx(1)
 
 -- send us to the intro
 --unpack_intro()
 --unpack_title()
 unpack_level(1, 1)
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
 if (g_time < 0) stop("game has been running for too long. take a break!")
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
 g_sss_menu_world = mid(1, _ws.world, count(g_levels) - 1)
 g_sss_menu_stage = mid(1, _ws.stage, count(g_levels[g_sss_menu_world]))
 g_title_scroll   = 0
end

-- this function opens up the game to a given level
function unpack_level(_world, _stage)
 finalize_game_mode(2, update_gameplay, draw_gameplay)

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
 ]]
 g_puzz_zapper_turn, g_redraw_zappers, g_level_time, g_level_started, g_new_dir, g_player_blink, g_slime_trail_anim = 0, true, 0, false, -1, 5, 0

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
e872ffffff0ffffff0df906a24d5a3fd80f69f3e29f946cb64204815e5acbc58000a425b48079e5aff427c1c7d6e9b69fecce861987d6727c37bc097c9283ea9
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
b8788cf221e522f7071756e59787c7217019fb8b03cf321ab0fb0f2f9c521249e16fcab53e74bf696e70e94d29523f8cf3c534ce1a44e26d721f3ac544efff2c
e9e51bff878ffffffffffffffff74710b004ffffff051fffffffff1100d6b2ffffff0ffffff0df7040fc93a8c2577aff73113994666bc466233999ca399856bc
4c2b56269d231bf95930293e2d7af44ef85c33dfb82fff70c1c3a4c7e97c1f71514871c817171f48190715e16f8024ef1ef4e9444e0e4e5a44e29acd2f193242
61e2ac3cf10640c2c0c541c7c2cbcb983110a11715e23cf71e4ef711ef741152ef4f80f583053016c1c8b342c2c112cf002c111328fc6cdcf7c90a6f748392ff
485874c521c5f4afd2fd7abc7f53b3f852e9877fcbf6e86bbf677b772e9ce78c3f3cf0f3cf19f36ef8427ecf06fb4e7872edcec3aa9c5fc6f51369c19727d5f4
ebbf81b6feb3e90ded72f4e2ded72f48ab5cdf4e93a68b2d3e89e77c87e0ef2e8cc154b4ca5ad21961ac37c85a48693652ea323fc6e8323f1756a61102ee6642
661a90e95c11a1e84619d212f66227b6a4ae945d3250cf63538c8a2e84c19f3cf2e7913e6dd2574a9b21fc20233f762148356c11e84d7cf0e89c4ff0298b8f94
2cf69c08f13c199bce2bf2c367466cd6838051cf89448abef1ea4c1cf1270742e3699340d84111cfa901694e2d72a79c3679c1ab368db990f52a0934070fb540
88c794f88e51e0e7b361a3e12431bcc39280210cf694014c6e78c4d11b9323174c6ed9c32de78583e95e704c24237cc3e897cf9b134ee7a22dd39b35784c39b7
511e17f1bb3dbcd1746fb0198529c8849849fb830c01e02c090cc11680811680786812131a1930c10938fbce859974ead1216a67ea5903d8c12166676a59033b
77bbc17c6e836c174aea4d39b774836ce2e81bb832c7c10bbc77cc675e6748764e8075e1ff8d399bc1f46e2fc31e2fd398bc55f2bffb83e17ff4ee3c5c1797e2
9bc579dfffb0d7c1f97e2b67f2f4eec396f947f4e0866070830c10e0070830c1485c24d17ce87e9e2e8f91c162c31a5872c31e90d2c3140218729c8126399194
2b08687c6c41838f5043c31e9071868090dc454ae8443943616b783c3bc4d1247361485a48d08d08d0850163468f3d14e3958de0e39f13c121e007083049b200
f56e856e26c4ed5819de0fce0ab294524242c31a48212121a48fb905ee5938f12c323a1e807136c8d012c8ff5d07c447ae3b50b1f40161c0685016140121a148
f9942e91e89934ec921b190f056c821a480d0f0fb355268366e89afc667c10270868501a4680912468098c10add87227068366e856e24ae3d86948b80703c03c
03c03e39f7c801b179e5a71417a2d3805630a580912468091e1e0390c79b159ce729b4e2e858762a348c0341a5861a32112981144f9e198c29d5c5c5a75832c3
1e90f4872c31e90fc8589e858729d3af31ffffac779d5e874eff7259b20ac5105ea08271369b2f83074ab9f10f50c1c10e927c7f7c87ef81fcf13e9f3431e054
3c142933c378383e060f30e87c9af7802e36786d42f0244ba5e84dc15aa3b62243c31d2d743edc71528651e2ef85c30c3680cf10458c3c3097834b252421d862
18d3a2a9867a168274283aa21d81f41b5c42271d8d90299b4eac6f848552178be9df074236f4c1219c2f1707944a99ff107131c3c8384c0109442a81b0b95ecd
2294ec56298b94cee0b4c798329c1165946869d29d715042bf587dacff24ef42dcbeaa42c798f1834ef70237ddcf3a868b8f524e1f78f583643142a1140e78ff
103dff58c5c8f2766f48ece0645287cf1e71610ff729ff58e13c2cf1706a56e817484a211e916fbcf0e32709bd740bcf0ebc9370f4d761db2cb934853c17c293
e09ec64318f5eff5c9cf6e83c99081c3fe0f487241c278b2b0a49425492981aa809ca8a55e1eacc31e1e29b87cac1448c9120d3b42139be87c62c12b61c39fc5
279dffd2fa1f11e7029fe79b812c097a7097eeef1cb745c057e546ecd3702b0f302bcf29c7fb4694832494ae80b80ee0fb48f52cf23f7cf22f7c4444e07d8036
319830f9f1692c3e89cf12ff0ff0f3dcef0f80c190421907a9001e24080148f18fb8f38f922e11850b09442c73809004601210043cf21e79071f398881630958
485821c012c181240c11e702cf00e2efa062650216163c84808784808f32cb49790f37031b3001121610f4161ea2c2cf01e3e1e36cdc3c1884f10c2190b01612
041a12041a1e1071f702cf21ac519e32094486221401e0054830c0c348f93cf212c519e720840a9848d052063490801ac81fb190fbc0f9432e10c24342c11408
24a020412803ac8fb821e70eb0d4ef87019629401610120280801010f70fb1f30ff8cf34561c083046823091acf1e8fb8f38f78ff850109a052254821699f180
f301e702cf088cf344e4c087a0610f434ce09b9ff8b9fb2fcbfb4ae73e4e0bf1ce02cebc3d4025a180a021a180a021a1039368fdd14b9ce98d3c544efff4839d
818fd4f8577d1bd67048d85e07585694cd3942994a904294629423942907ad8287d17c8e1b8c1905952c8f109b05690042c312c280b0b07583803a021e9c4d46
08c4e0c842e20c1452d8136c8136c8136c8136c8136ff7a42fc206987481e1071134808100000004200d0701641cb0e729026dcc3c998a9423942972c4294a22
9cf490cf6440701a2802daeea8f78809ff1a10ff301c116880e8e16396ab422d960425861a5861a58610ff39441c10e06940f4cf2943ff3fcc2c2cf794a22d00
9410556243f842b02542199b29895a914294629423942945a08d0d0243439c398721fd39e156932d4d31802a9121e90161485819c485c642487242c805225644
e57052312296c8381805649136c8136c8136f383a16c3109050708381a94db1e9019c23042c8400212121e164149174807c267c8d198c4383d03089a5c123112
7088548c4809741905e0efb83ea4d1161bb3a597defff358f7de3e79cf0fd3427e6390954429d424eb8096212d424a948be19f95e2e1b078d54ce0fc5c5cf0cf
31e90ff3d1e1ea094580706801eb103647832cff39781820808792f681f70735ef748052cb8cf110e0e1e5a48132cf0c5c149f731f1fb8c7197879b9501e6e78
0248f731f0f34e1f24619fd832421ff702cf899fb9b3c8f18f3058f18f3a08f1c7f4eb63793df1f92f3c329cd7a4ef870c1c12768283839f79b8742c1c5c7edb
8b8f18f72c31ef7a3c3c51e1e3e1ef0e72ef7dc3cf0cfff3e05ef048ffb01efff123ef5e2ea0fb071f08ff962e706cf7c342cff081f368fb9b3c8f18f3058f18
f3058f1c1fccf2fb4d7cdfcc9b36e7170ce8db909f17134e0ead6683097eaa0f743fececfef890e88d595e79d3c0bfe71b833c68f7715bf3215fb856936468eb
fb469d17e9468ef2fb429df27cf246022d0f7c11f52e2f1f10420446ec069b61b324c272d40713938003d781fb8c14089590191100bc5a68bf1b42b8452252b4
4ad696e79032d51d6a936e809380bc583e02cc2e83802919e077187191ee0129c12850c7cfd2ff3162908f2aa1974e8520f06cce8c1fb876e10e856c15560948
136178036455813c69e24815e85268bc545c4269aabef16b0a906e1610840371b70021cc8d3009022f76c3dc331022163cfb529c187e8a486932524b4f821a59
daa7d19bfd7f92f4fcf1ef8b793775c55f58724157695e872cf3cf3cf24cac59e34ac59d34ac3995274836e70b8b297e11174e9b6612c0b726175816f6c2eb03
49c5170ea6421075322e0c546e8486d146e09a724d1800428bc3c110428bc3c110428974493ef00f70c1fb0fd41c4d092934905028c1241e014e01a07022ff0f
f79e3fd476209769c559f78fff83ef1e7983e706c1bcc08453972c81b874714c3161f85229c3161f8622ff80ef09fd6e1921d2f8e29365e484009d19745200b3
e8a94006dc27cf1b4cf1b4e8f342e8f169932bc1dcf0f3469748367cf069b21addf2fa5eb48e62fb44e7942fb06e84374e0bbc97d5f6ece1d4c23b42d729bea8
c3bbf8ef16f7c8ef13cf13cf3d70dd51b83be71a78df72b07081fff0e7a96bd582202800ce886cf19935a99138cf022cf080f308f1d61844ab42fb4271939840
c119b52cf042cd4a2bd1781e0970a75ceff0c5a04839d2c9c25f2b08f620d508522cff68182dd2e2b6d3c52d82e29e8eb27943f53598ff905e0e842f74e8cf29
32ff48b97841b469ffb03e602404ffffff0de310842eefffff1000000002000000000000000000000008ffb0d42f1f31d0f1ff319b8f79b8b4e09fb838fb9306
ff8dfff393a8e11e7c2c31e7738c17002b46ffffff0ff7aef40821436579cdaefbe19c4d574aaa97c3e237d79aa24e12fc4fa594b96e136e8f655aea37fab5d5
f34ef0fb8abef94fe36787e5f38f34e9999c3333976662fccc4e899dce236c0cea094c80b0910b0136c66c8dc24d62ff3a6ef83f7159c137817e1db56e2f784a
179a5a1f8a4ed9bd836f8c2d87c16137817c1d9cc5e09cf3179f7c2f4c5e19c71f8f427caf461d624eaafbedf3e793d67edfbcebf12e973979f673e21e2076e2
fd4ee93c15675f6c4e9581f62dc6d8c28b6f162e103f5c787eec3d277887fcf7e79dbf7cf297e2e2be3ff83a9f7af0f3070b0e70c1fdf3fcd8b80ff832e708f1
6e783e6e19cf28f388215109ef0884e6c9483d2e60fecf13c9c3297edf5c9f8369c1b32fc3def0bb8fce90f75f793e8363f4e3b1f7cc6248f493f794d2b0e236
34e013855225f0d9f36ef99f70cf209f369e7d888d5f707ec9fc1b57938b33fb0ebd633f89db8df3770c8f5e0cf37f6bdabfef9835ce51044cc89f1ea462c6ff
c8df3100e0cdb57b577d20269c1ec3c1bd6dabadcf3d42bc9fa9777e5ef8bf2f982846e56ed4c9f0e1c18c5fb4cf114176aa0f34eb40f3000279b71b5c93f6ef
17de2bcf0ee1f2f56df6fe1762907bdf0a2987e783fc6b48932ad174291f303d948a6f860487dadf78629116c421b6b2d1f13d863a946489e42492f97df3e8d5
93e873fe1bbad6e9e1c527e7e707d1fc1d07c10c3ea3d5df728b0c30e9de8787e78f383ae2f9bea529bb2e1aea367c17d3c6346df4b21c70e407d6978f3e86cf
17d5b7a97e2f87eab398bcedb067337d642c3493e01f4eace794ebc2e6122c69f7ee83040c36cf23ff08160fd5f86b942fd9aedb89f762fcc3b66da7e8e57421
1799c3d3837248b16fdf34e051f47b539369977780f2196a22f9722884e1848fe019f1c37878c6768324e57f2798fef85e1a6fbcf21b90f1626772211031fef2
bd6b777dd1122b222cb2114e783c2ff484d14cab8df026f23c9e019366e706c14c979ab2f48b293e795e16cb48f3801c403f7cc98985e5127f37e6bd1b7fa8db
6278878ad6198ced70731bc0fec5003b6d19cf2e0fa8cf137ee8d27d6acf3ed4ef137a0f71287e07df2bc078f5003fb872763fd5772f7cb18d518a0f09fe2bcf
28eea901f30e8cb1f9db98b3ec3d3b3274f07ad7fc57f7d34e93c5df1eef7266c29f76e2faf16f64354484326462e27111d044843f4cc7944c5e62b866888464
4cc85e7977f6793c79ef0fd1e9e7d77f8df18329a7932f4e97bb398cb98339cc1bdf1227a4ef04c6b98884439cf0e8de419f542722e9d631bf7285293c6bf88d
74f7b8d6f3c17de475fd4f85e97ef8ba9f788cd7bce0dc5998c2f5c5ef8b6b7229302e49cb454485ec8bc62b84209f2293611169f12e299c919c30119498880d
f1279ce374e9b87eabea3e98febef3fdbdcf12df32115cc2ef8c1b3f8d4dc9ed9f5a288f70fa8f58c963f916a6244411b0e6956b7cc363f387401f70e953ff87
675db1fc1b7eb4a9727d16ff484a62efa0f707edfb4c77bc51bc9170908fdc91e702f78819f529cb1c40cf748f8c598b5674c6737842c0e785ddd7a75c159e12
b38ccbfbc677fff167bdfff980fffffb11effff732cfffff648fffffd80fffffb11effff732cfffff648fffffd80fffffb11effff732cfffff648fffffd80fff
ffb11600b966ffffff0ff7aef40412386e57d9bfac621119d26c4b7ca2a972f8bc4fbc14cc57ee1f8abeac3e557dd9f1cf1aeaf52ff8f7ec3c5ff4e3f86e13fa
9bef94df1aeaf525f38acf31df1e457df3dfa7934ef938989bef9c37ddd87e8df3e7932b9f74ef191360601299700b91363362fb87c6c1c9272f48b0127df3bf
2db667df0717a4c3702d451ab057a0118dcf23fb82ffcce79b4294446e938529a2461a6244063b9913976d3ff9e9b36bf5e9344bfbc52ae00814031e666f060e
bc583caad98c254762834181403164ca81839fc7c860191ea7d50ecf835ff37c5fe9f46ff89be23ff05ffc351c50e562ccf2c06ef1e2ff0e4ef0fbc57579dec3
e2d3ff87e9d694cff739c6bd6bd6bd622222222222222f4abd12fc27542ff4cf098b39c21fb48ab39cd94ef8bcd112ede263d598df12f5c9160ce792200ef87f
83b5196f27203f42ec42fa1f52a1aef13bf3e96e05744202229c67838b89d12cf20000e78ff7cbe8554a42de17787f98bf161f640684bd67f5380e9c44469de1
301ef1bc1c3cf239837c0326462360f38b5e7178875e0c1ff0f6c39e38c2e1202e362622e8f1c1ef008c1705fcebb5ce834bf7cc0085e4e84f3185a80e1fcdea
729945bf20aeb01175e79da29c91b84276883029c91f562422988e6332ccd7e57edf3c4785c527a4e2ea75e3264c54e226427fdf3c3bc3bd99ad5e1e85637b4e
ac17c57529327d6b3c196eacf237017c5bee79e194ed83d19d67c9169beb3eaf5ecd99830cf367c8c35aae387240ed400742e53e07b6e0936fe23942b1e87437
33e70934c8f1830c309a838f6ed55ac7294fa599c1161f83e8c17cf16be4298d479752cbea30e0bc66fa3c5f9481ff8461067484461112e28c1a8451b3cf09d6
1f42e8582ff899c3ece1bf3824244d294aedc4e94cd4c1c65140e5978c8b2ef95add1f2e70c4311d739aa68c4c0c8f56c06296eb354e393e88d42f3c154f79c1
2a603c0e78307c575cf24002e372575477a8c336e2c7757e112454c008b1f88f0a879afe5707d4fab2c4873f9f14cdffcc2e329bcf2fef1a1f837c5a9e1c79f7
63b0d373f0ffb1e6b3de071de3f54c88bff8c76eaef1bde0c267462f3c4cf33ff8747a3dac2f429d297cf19d29f1c19d44674cd9677c6be11ff5ad98c7bd37c6
7ce98f9e83e8df2d7c19cf0f47ba7422b98d270ce78c8f88b28f50bf08f32a23a390946fb84c2e8442f895e1422498b28a83e21c6a69dda69b2b81c2338e1e31
2b8bd9bcdab570707c267462d98f36f749dbe85a2b9f078a46f3ae5affa09306d7ec350bcf2f95372cef8c6700bf707c8899b5f57c19ac2f4a9e297c19d215fa
debd6fd517f37c1bb6bd3f4cf7fc17cead6fe6fe3bd1fd71b42e702294edeabc850b9ad2f2c29132eaf00bf06611766f9367c2429d921b83685cc690c8012eab
00b706611bca264e1f7832d3615bdabbed0f5a273fcc1bf5280c3177a9f1a19f3ead5d77bd744c5bf1c1bb2a49cf011fb4a28764eb02074ead56fcf298f7a339
fc27464c329340b7e90f0cdfbc374ed33f4f242f34ec8e6e837403f388952fb4eb919f83ef836932d50fe76b72954eaadef80f149be70f944aab3e2714037c0e
7c8a6e5b26f46b776bf785ea0db4d16ede175847b487ed74371b384a2b1c2f3037199484842f8561d4be19b6f8178329db19385e5697895caf500994848c3169
de4bd6bda9f607d8c3843fb0ce383e08cce12bd633b52ea4e9856b7404c3fbc11fc58e1f7094477c2296372af3c13f8d17d6d2d3241f2ec3ab42cf3bc3c24287
cca194f8d07c1b88c2b5c801bf329632ceb07cd7c1decbf4cf016994b90ffcbde6bd6438f7e793e8df05d0e71ad80d508b7d67bd63ad0af0c17c1bf322dc6316
4c5fda327c1bd6fd3807c7bb9c7bdf0fd6b30dedf6bbf38607f1d6f6a123c6e794e87e86393a2844eb3619c2bd32026f42df042c17fade293f47c5d42cf3f6ad
d6bf12a70ee7e96f982cdfc3de2a1ce88feac57c124b54f483a7c44a9d224887f71dfef87fee9f846bbeef7e2d8e77401c99f54e9517c67df2378916658d64a4
5ef76a4e01961e797e6bcf1e8d9fd5a8833b89e704274c3b4895cd4e0780919df97bde79d67983ab55c67e16ba8defc56e8e6051747b30421f8940cf0678f16e
f083e0bdf2bc4eae6b88b298f10fc059cf227c2b9d129cf2646ef9d17adead68bead60f4209489f74239369d2399bca901fcafdf0f7c33c76ef8bebcdea8f3c1
293cf12297814c8a7f99e3fc37c5988fe0f57df7a9b1e57d59c3eaf7c5e41f079b5ecf7c5e1cbc3edb7a93eabeb80b3adf5271574bd7e70ecb2794883e27c10f
78d3d1715fdb46c45a17577b6e7933390fad52e877c74cb7e8f4b77485f78c1b81b536ffffff0ff7aef408a419b23cd567fe05137537874d575e279abebc5e2d
c3e4fa9bee455d3f34eed92fcf1dea2fcf1662fccc4e9999c3333976662fccc4e9999c333393666336c6679d56c818d56c8ccefffdcdfe3f3c1faf1ed36787f7
9d2fb4ce94298b4c6fb4c5b95e98d2944c7e71b57cbbd2b852942ef11bdb9b5dd94c7846d09ff1cf7bef1bf3c1dbfaf1ead3f7cd2cdf6bdf8e383e6cf198777c
7d6796f08937bf81cdf4bd058d3ef069c93e7097f9c97dbf3cecb6b7ef6e8ff29c3f7c85faebbc1f48bf796bfb0d707cb1426b7e786bf09e0ee7adef041ec7ad
ef21d0403fbc32c2d7276b7c44affa48ef7f427d3f8cb7c5dc274e2ee3bde8e14a5299b393e86bf74a51cc9b581c7d6bc3c3262cb99c7a271fd1fc67c6bffbc5
d729e34f7837395a972a95a2713e63df326b4e1d3672b117ad674c69cc69f729db95e8527eb29e573319b6befc4d7ed8f3a1f7421c194daee8c67f37983e9942
__map__
de674e0c91c924f14fe61fc029599aff07f5b8b3a7e14c8e2cbfccf2105f1259af81d9fe89ed3944635bd57ccc55e99d789f11f33157fc92c72322d2feaefde35964b1c5972d8c25771e47e624bbe6ba7479275db69b398ee417f1cb8e55bfac632adf755dfb65dbcf48b432662272278ee4f821f1e6057ffcf0875fe87cc3b1
1f7ec83ff02c07c43289b9087250879bcd012497d49dfd1dea0f2e70f10f8f0476488e497f310ff3de732e976e7f5cfc423d4bf28ec00f8ed40f2226525ba6eba48eec6fd7e1951ed178e48cbdeffc93fc719ff37de211abd8e3b25f3281a8d76935d7651ef3ced64c882462c496f98b637fecd8b163f78ec53fcdb3eed9b167
c7e29a1fee3872fcb23cf5ed1f7df61e89270346f28f1d788db10123f9c50e30c6068cb101636cc0c8757c3ff4ecc7a7b2f9a23ffcf0cbf111fed8f187efb9edfbe5935b0a8117643ee39d777e390efec05ee49503027ec181134f7765d39f7c3d2a57f31c9eafb7e7f3cb4bfc20b9f48763a77f1284e3cdee23b69c76396d96
98f561e7f00f6cd86b56f3c7d1acedfc71fe71ec3afe388e7b91c60f599e799f1d479c4f8f77fbbe977fe6c1953c71fd0ff887ff3f94cfffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f8401d063
fffffff07fea4f80ef14326597badc1ec9548ea86570d4ccf5a4aa76e5b1a689d932380e33cf976b975c673b5f5c6f3b8deb6da771dded34ae1fda695c7fb4d3b87e69a771fdd31e8ec3f18bf9632a83641ebb4ca62a04e1314666b319300166c00c9801336066d879fd725e97d73ff937ff886bd7f24b9350e911dfd8327cfb
8e8bc3ec5a647d5c2a554763213db20cfb3fdd0fb7c7f3cb79f4f9c799fce2fd47b87ea1cfe99f7fba6d4db4c72fe397e587876ff14fe29a2bc0eb4845daff89031cc39b4b42a2cf9526d1fa381212767bae6e5bfff9856e8e5f1844124772f5694a23ff3b39f0e6827f127d1c07a19ee9037f3c935f8ec833b97025f2ff488f
6e5b9fedd8b66d2222edff407078bc397e585c47ec8aa7eba8b3fc805f240857960326ae5918572406c0fbf4a8c8fa3f1082fd20a9c5dbd8b577dd8b38cb89a309e69f3c4363d7fae9ec3d420476bcfc6277f7c7766c6bff356078f3489c67ecdb731cbb10b71cc9e2c3fedadb6e5b8fedd8d6e9967e477ca47573b81ffe2f72
fd507dee95d4926bf98824b2f8b0f9c7932709e662c8991fba6d5bd23f32ffec785d4fb7adfd9fc86c579f3e7daac76a8b25ff10cb9c4d16549f708523dec499b988237379fefae13ab6add7b5675bfbafe1b876edfae5891e62c9b73c39d85c43bd4fb85c6f58def8289b238fe7c8d3f67fa038ae35fd125d63f349306f2432
a7631e09c9fe39e20dfbc1fbf0e8fa872667586cc77b77fd9fd8a58e3d3daa5b2dd972308df8eac2a63b22d7f1a54bdee42093ef893f2e2c8945fe27e0f8a16ddbfaa5b5e45a2ee249fcf1b0598ee1b8dcc7b13fc42dbae5842d6d82dff2b5dbd67b3bb6b5ffcad80fc77a5d5bdfc515ff401c09715eaecbfd241287b167fe49
fc91f8e7f2cf75789bfd0f64b23fac6dea58be17ee5fce2fca0fb8ee1f7ef0dd7fb8ba79373bb11badfe5021fa09ff07f2a26bfe596dcbb6c31f4b5cc9d7a7f95b0eafe3f0cb15c7f1fc7172fcf3c72ffb47771d9fe6dab66f7f78eef3fd05e7f9a679ebe9711ccde5b8ae1c598e2ed976ac9cd9c8a1e27fc4448f1dafcf9d3f
2efef1a97d3b67edb11ec773f6979ecf796e93624ead4b7e38bf5defcea9a7bbaa6fff78be779bfe4f980c95c495a6213fb83cdfbea9a353fda7d7737ddba41ce271ccf0b93cdfbed91cdd337d773dd7b74dff278cf99c72921f72321ef73f3fdcdbbae797b6477ff9637ff4f8e187bbdb76fe13dffd4f8eaae0beaeefdb8e69
8e69f65ffa7d5fb76ddbb6adffdaa5ceef8f5f12619ee911fbc9f1ff37c3ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f230cc081ff97ffbeffff6d77870720304050002131415131475707122232425262728292a2b2c21200132333435363738393
a3b3c303142434445464748494a4b4c404172707152535455565758595a5b5c5151126364666768696a6b6c6e6d6f6d6d2d4f3d705182848588898a8b898a7b7c7d8e8c8d7e7376878e83f49922449922499a3c773f5f1fdd8f3bd7fb8fe377ffcf24f9224499224c94f7ffdf6df8f7ffefaefcf7ffffe3ff83ffc2f7efbe5ff
f13ff9bffc6ffe3fffa3ffd3ffeafff53ffbbffdeffe7f7ffcf6fffc1ffe1fff97ffcfffe9fff57ffbfffd1fff9fffd7ffeffff9fffd7fffff07922449922449feffc1ff5ff8ff0fff7fe2ff5ffcff8dfffff1ff47feffc9ff5ff9ff2fff7fe6ffdffcff9ddf7ef9ff0bffffe7ff0ffdffa3ffbfd4fffff4ffa7feffd5ffdffa
ff5fff7fecff9ffdf0db0fff7fedffbffdffb9ff7ff7fff7feffdfff1f7cfeff61ae9f7e3cfeffdeffdffbff8bff7fef8824bb7fecff7ffcff93ff7ff0ff5ffe1ffaff37fbfdffcfff43ffffcdff1ffdffa7ff7ff5fcefffbffeffd9ff7f9b244992244962ff7ff7fffffeffe173fffff8ff2fffffe79ffc6f7ff0d7ff44fe27
fffdffe9ff7ffdffb7932449922449feff131fa1fffffff0ffe93f102a3596db7f48fcffff15e1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff
46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23ecc8f47025f6ac9ab492fa7f25bbbeefdcf61dddbbedd8bd1f76ee8ffdd0efed1f3fec9cfb5dbe9de7f5fc71f97f3fc9b53dbff8c31fdf768ab7dbb1edde766c13e9b65fb67569137d7e207eb0ebfd438e371efdc3c1e38f208fefe69cd386fde175
fce10dce3c3f4c5c9abce68f38f63cb7f48fa47f78e7971fbcfb25679e3ccb1f831dfbe4128f5d386ff9e1d975d7cefc020e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

