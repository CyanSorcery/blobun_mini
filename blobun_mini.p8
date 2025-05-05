pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function _init()
 -- debug functions (remove later)
 --#include scripts/s_debug.lua

 -- ashe note: this just looks nicer
 cls(1)
 print("loading...", 1, 122, 13)
 flip()

 -- move compressed data to the general use space, then clear everything
 memcpy(0x8000, 0x0, 0x4300)
 memset(0x0, 0, 0x4300)

 -- figure out what kind of compressed data we have
 g_px9_sprites, g_px9_spr_flags, g_px9_music, g_px9_map, g_px9_sfx = {}, {}, {}, {}, {}
 -- offset of the currently loaded data (so we don't reload it if not necessary)
 g_px9_ind_sprites, g_px9_ind_music = 0, 0

 local _offset, _data = 0x8000, peek2(0x8000)
 -- note: this table matches the type order
 local _t = {g_px9_sprites, g_px9_spr_flags, g_px9_music, g_px9_map, g_px9_sfx}
 while _data != 0 do
  -- figure our what type of data we have, offset, and length
  add(_t[(_data >> 13)&0x7], _offset+2)
  -- move forward and see what the next data is
  _offset += 2 + (_data&0x1fff)
  _data = peek2(_offset)
 end

 -- tile lut
 #include res/r_tile_lut.lua
 -- camera position
 g_cam_x, g_cam_y = 0, -8
 -- levels
 #include res/r_levels.lua
 -- sound effects
 #include res/r_sfx.lua

 -- if we're to play a sound effect this frame, this is the data for it
 g_play_sfx = nil

 g_fillp_diag = {0xc936, 0x6c93, 0x36c9, 0x936c}
 g_fillp_anim, g_wavy_anim = 0, 0

 g_player_blink = 5

 g_even_frame = false

 -- objects/hint arrows that are in the playfield
 g_object_list, g_arrow_list = {}, {}

 -- current level
 g_level_index = 1
 -- for level select
 g_level_select = g_level_index
 -- when we're to load a new puzzle, this is set
 g_level_target = nil
 -- what game mode we start with
 g_game_mode = nil
 -- when we're to load a new gameplay mode, this is set
 g_game_mode_target = 0
 -- current level name
 g_level_name = "Unset"
 -- current level size
 g_level_width, g_level_height = 1, 1

 -- how many tiles the level has/been touched
 g_level_tiles, g_level_touched = 0, 0
 -- used for input buffering
 g_new_dir = -1
 -- used to detect when sprint has just been pressed
 g_btn4_held = false
 -- when the player has won, this is set
 g_level_win = false
 -- when the player has lost, this is set
 g_level_lose = false

 -- how many puzzle coins/octogems the player has
 g_puzz_coins, g_puzz_octogems = 0, 0
 -- if the player is on a conveyer/portal this turn
 g_puzz_on_convey, g_puzz_use_portal = false, false
 -- what turn the floor zappers are on. 012 = cmy
 g_puzz_zapper_turn, g_redraw_zappers = 0, true

 -- we need to redraw the coins blocks?
 g_redraw_coin = false

 -- table for objects we need to delete
 g_obj_delete = {}

 -- lookup table for water/lava shimmer
 g_shimmer_water = 0b1111000111110000.1110000111111000

 -- slime trail animation
 g_slime_trail_anim = 0

 -- undo queue
 g_undo_queue = {}

 -- when animating the bottom message, this is incremented
 g_bottom_msg_anim = 0

 -- particle table
 g_particles = {}
 
 -- intro and exit animations for coming and going in stages
 g_intro_anim, g_outro_anim = 0, 0

 -- animation for title screen background scrolling
 g_title_scroll   = 0
 
 -- this holds any menus that are on screen right now
 g_menu = {}

 -- decompress the game's sound effects
 decompress_sfx(1)
 
 -- send us to the intro
 unpack_intro()
 
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
function set_game_mode(_mode, _level_target)
 g_game_mode_target = _mode
 g_level_target = _level_target
 -- get rid of any menus
 for _pane in all(g_menu) do
  _pane.m_anim_incr = -0.25
 end
 for i=1,5 do menuitem(i) end
 -- stop music
 music(-1)
end

function _update()
 -- run fillp animation
 g_fillp_anim += 0.2
 g_fillp_anim %= 4
 -- update wavy factor
 g_wavy_anim += 0.035
 g_wavy_anim %= 1

 g_even_frame = g_even_frame == false

 g_slime_trail_anim += 0.075
 g_slime_trail_anim %= 1

 -- title
 if (g_game_mode == 0) then
  update_title()
 -- gameplay
 elseif (g_game_mode == 2) then
  update_gameplay()
 end

 g_intro_anim = min(g_intro_anim + 0.1, 1)
 if (g_game_mode_target != nil) then
  g_outro_anim = max(g_outro_anim - 0.1)
  if (g_outro_anim == 0) then
   if (g_game_mode_target == 0) then unpack_title()
   elseif (g_game_mode_target == 2 and g_level_target != nil) then unpack_level(g_level_target)
   end
   -- reset everything
   g_intro_anim, g_outro_anim, g_game_mode_target, g_level_target = 0, 1
  end
 end
 
 -- process menus (if we have em)
 for i,_pane in pairs(g_menu) do _pane:m_step(i) end

 -- play a sound effect this frame?
 if (g_play_sfx != nil) then
  sfx((g_play_sfx >> 10) & 0x3f, 3, (g_play_sfx >> 5) & 0x1f, g_play_sfx & 0x1f)
  g_play_sfx = nil
 end

end

function _draw()
 -- title
 if (g_game_mode == 0) then
  draw_title()
  -- gameplay
 elseif (g_game_mode == 2) then

  draw_gameplay()
 end
 
 -- draw menus (if we have em)
 for i,_pane in pairs(g_menu) do _pane:m_draw(i) end

 -- draw transition?
 local _anim = g_intro_anim * g_outro_anim
 if (_anim < 1) then
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

-- this function puts us on the intro screen
function unpack_intro()
 music(-1)
 decompress_sprites(1)
 g_game_mode = 3
end

 -- this function puts us on the title screen
function unpack_title()
 --decompress_music(1)
 -- tmp, just stop the music
 music(-1)
 -- decompress the sprite and map data needed here
 decompress_map(1, 0, 0)
 decompress_sprites(1)

 g_game_mode = 0
end

-- this function opens up the game to a given level
function unpack_level(_index)

 g_game_mode = 2

 -- make sure sprites and the appropriate music are decompressed
 decompress_sprites(2)
 decompress_music(1)
 music(0, 0, 7)

 -- clear the map to be ready for incoming data
 memset(0x2000, 0, 0x1000)
 -- reset the drawlist for the incoming elements
 g_object_list, g_arrow_list, g_undo_queue = {}, {}, {}
 g_level_tiles, g_level_touched, g_bottom_msg_anim, g_puzz_coins, g_puzz_octogems = 0, 0, 0, 0, 0
 g_redraw_coin, g_btn4_held, g_level_win, g_level_lose = true, false, false, false
 g_puzz_zapper_turn, g_redraw_zappers, g_particles = 0, true, {}
 -- clamp this output
 _index = mid(1, _index, count(g_levels))
 -- store the level index
 g_level_index, g_level_select = _index, _index

 -- add menuitems for this
 
 menuitem(1, "restart puzzle",
 function()
  g_level_target = g_level_index
 end
 )
 menuitem(2, "skip puzzle",
  function()
  g_level_target = g_level_index + 1
  end
 )
 menuitem(3, "go to title",
  function()
   set_game_mode(0)
  end 
 )
 
 -- debug function
 menuitem(4, "goto stage "..tostr(g_level_select),
  function(b)
   if (b&2 > 0) g_level_select += 1
   if (b&1 > 0) g_level_select -= 1
   g_level_select = mid(1, g_level_select, count(g_levels))
   menuitem(nil, "goto stage "..tostr(g_level_select))
   if (b&32) then
    g_level_target = g_level_select
    return false
   end
   return true
  end
 )

 -- get the level data
 local _data = g_levels[_index]
 -- find out how long the title is
 local _title_len = tonum(sub(_data, 1, 1), 0x1)
 -- store the level name
 g_level_name = sub(_data, 2, 1 + _title_len)
 -- store the stage width
 local _level_width = tonum(sub(_data, 2 + _title_len, 2 + _title_len), 0x1)
 g_level_width = _level_width
 -- get ready to parse the level data
 local _level_data = {}
 -- how long is our level data?
 local _offset = 3 + _title_len
 -- ashe note: we shouldn't need the 0x here, but for whatever reason it wont work without it
 local _data_len = tonum("0x"..sub(_data, _offset, _offset + 1, 0x1))
 g_level_height = (_data_len / g_level_width) >> 1
 -- read the data
 -- coco note: since we have to add 2 to the offset to get past the
 -- data length bytes, go ahead and save a call here by chaining it into the loop
 local _tile, _x, _y, _mod = 0, 1, 1, 0
 -- convert the level width to grid tile space, offset by one
 _level_width = (_level_width << 1) + 1
 for i=1,_data_len do
  _offset += 2
  _tile = tonum(sub(_data, _offset, _offset + 1), 0x1)
  _level_data[i] = _tile
  _mod = ((_x + _y) % 4 == 2) and 1 or 0
  -- now, read this out onto the playfield
  if (_tile > 0) then
   put_mirrored_tile(_x, _y, 16 + _mod)
  end
  -- move ahead in the tileset, moving to the next row as needed
  _x += 2
  if (_x >= _level_width) then
   _x = 1
   _y += 2
  end

 end
 local _level_arrlen = count(_level_data)

 -- do the autotiling around the perimeter of the level
 local _mtl, _mtc, _mtr, _mcl, _mcc, _mcr, _mbl, _mbc, _mbr, _xl, _xr, _yb = 0

 for _xc=0,31 do
  -- set our left and right x, without going into the work area
  _xl, _xr = _xc - 1, min(_xc + 1, 31)
  -- re-initialize the top and center rows (assume they're 0)
  _mtl, _mtc, _mtr, _mcl, _mcc, _mcr = 0, 0, 0, 0, 0, 0
  for _yc=0,31 do
   -- get the bottom row, without going into the work area
   _yb = min(_yc + 1, 31)
   _mbl, _mbc, _mbr = mget(_xl, _yb), mget(_xc, _yb), mget(_xr, _yb)

   -- don't do this unless the center tile is 0 since
   -- we can know in advance we wont put a tile on the puzzle floor
   if (_mcc == 0) then
   -- figure out what each tile is gonna be
    _tile = calc_autotile(_mtl, _mtc, _mtr, _mcl, _mcc, _mcr, _mbl, _mbc, _mbr)
    -- place the tile into the work area?
    if (_tile > 0 and _tile < 15) mset(_xc + 32, _yc, _tile)
   end

   -- store these for the next row
   _mtl, _mtc, _mtr = _mcl, _mcc, _mcr
   _mcl, _mcc, _mcr = _mbl, _mbc, _mbr
  end
 end
 -- finally, copy the output data from the work area to the play area,
 -- while also clearing the work area for later usage
 for _dx = 0,31 do
  for _dy = 0,31 do
   -- copy the boundary from the work area over
   _tile = mget(_dx + 32, _dy)
   if (_tile > 0) mset(_dx, _dy, _tile)
   -- clear the work area
   mset(_dx + 32, _dy, 0)
  end
 end
 -- in the top right of the work area, mark all tiles as solid
 for _dx=48,64 do
  for _dy=0,16 do
   mset(_dx, _dy, 0)
  end
 end
 -- now, unpack the level data into the top left screen of the work area so we can read it easily
 -- get the level width data that we stored earlier
 _level_width = g_level_width
 _x, _y = 0, 0
 for _tile in all(_level_data) do
  mset(_x + 32, _y, _tile)
  -- place a floor tile + allow collision here?
  -- note: 0 off means cant pass, 1 means can pass, 2 means slimed
  if (_tile != 0) then
   -- place free tile, may be overwritten below though
   mset(_x + 48, _y, 1)
   place_puzz_tile(_x, _y, _tile)
   g_level_tiles += 1
  end

  -- do we need to add objects to the object list?
  if (_tile == 33) player_create(_x, _y)
  -- puzzle keys
  for j=0,4 do
   if (_tile == 2 | (j << 5)) add(g_object_list, create_obj_key(_x, _y, j + 1, 83 + j))
  end
  
  -- state keys
  for j=0,2 do
   if (_tile == 8 | (j << 5)) add(g_object_list, create_obj_key(_x, _y, 5 + j, 230 + j))
  end

  -- arrows
  for j=0,3 do
   if (_tile == 17 | (j << 5)) add_hint_arrow(_x, _y, j)
  end

  -- octogem
  for j=0,7 do
   if (_tile == 15 | (j << 5)) add(g_object_list, create_obj_octogem(_x, _y, 8 + j))
  end

  -- generic key
  if (_tile == 44) add(g_object_list, create_obj_gen_key(_x, _y))

  _x += 1
  if (_x >= _level_width) then
   _y += 1
   _x = 0
  end
 end

 -- perform water/lava autotile
 calc_lava_water()

 -- slime where stephanie is at and record the first undo step
 player_end_move(g_object_list[1])
end

-- this places the graphical representation of the given tile
function place_puzz_tile(_x, _y, _tile_id)
 -- find the top left corner of the tile to place. if 0, do nothing
 local _offset = (_tile_id << 1) - 1
 local _tile_tl = tonum("0x"..sub(g_tile_lut, _offset, _offset+1))

 -- do we place a tile?
 if (_tile_tl != 0) then
  -- offset for cracked floors
  if (_tile_tl == 124 and (_x + _y) % 2 == 0) _tile_tl += 2
  -- figure out the map coordinates
  local _map_x, _map_y = (_x << 1) + 1, (_y << 1) + 1
  if (_tile_tl == 191 or _tile_tl == 207) then
   put_1x4_tile(_map_x, _map_y, _tile_tl)
  elseif (_tile_tl < 83) then
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

function calc_lava_water()
 -- note: this is similar to a function earlier in the code, see that for comments
 local _t = {176, 192}
 local _id, _id_m, _tile, _mtl, _mtc, _mtr, _mcl, _mcc, _mcr, _mbl, _mbc, _mbr, _xl, _xr, _yb = 0
 local _w, _h = (g_level_width << 1) + 1, (g_level_height << 1) + 1
 for _id in all(_t) do
  _id_m = _id + 15
  for _x=0,_w do
   _xl, _xr = _x - 1, min(_x + 1, _w)
   _mtl, _mtc, _mtr, _mcl, _mcc, _mcr = 1, 1, 1, 1, 1, 1
   for _y=0,_h do
    _yb = min(_y + 1, _h)
    _mbl, _mbc, _mbr = (num_in_range(mget(_xl, _yb), _id, _id_m)) and 0 or 1,
       (num_in_range(mget(_x, _yb), _id, _id_m)) and 0 or 1,
       (num_in_range(mget(_xr, _yb), _id, _id_m)) and 0 or 1
    if (_mcc == 0) then
     _tile = calc_autotile(_mtl, _mtc, _mtr, _mcl, _mcc, _mcr, _mbl, _mbc, _mbr)
     -- place tile, optionally placing grid marker
     if (_tile > 0) mset(_x, _y, (_x % 2 == 0 and _y % 2 == 0 and _tile == 15) and _id or _id + _tile)

    end
    _mtl, _mtc, _mtr = _mcl, _mcc, _mcr
    _mcl, _mcc, _mcr = _mbl, _mbc, _mbr
   end
  end
 end
end

function calc_autotile(_mtl, _mtc, _mtr, _mcl, _mcc, _mcr, _mbl, _mbc, _mbr)
 return (_mbl + _mbc + _mcl + _mcc == 0 and 1 or 0)
  | (_mbr + _mbc + _mcr + _mcc == 0 and 2 or 0)
  | (_mtr + _mtc + _mcr + _mcc == 0 and 4 or 0)
  | (_mtl + _mtc + _mcl + _mcc == 0 and 8 or 0)
end

-->8
-- for creating and processing objects

-- object table
-- 0: stephanie
-- 1: heart key
-- 2: diamond key
-- 3: triangle key
-- 4: coin key
-- 5: normal state
-- 6: fire state
-- 7: ice state
-- 8-15: octogems
-- 16: generic key

function proc_objects()
 foreach(g_object_list, function(_obj) _obj:onstep() end)

 for _del in all(g_obj_delete) do
  for _obj in all(g_object_list) do
   if (_obj.pos == _del) then
    del(g_object_list, _obj)
    break
   end
  end
  del(g_obj_delete, _del)
 end
 
end

-- this adds a hint arrow on the floor
-- 0: right, 1: up, 2: left, 3: down
function add_hint_arrow(_x, _y, _dir)
 add(g_arrow_list, {
  dir=_dir,
  x=(_x << 4) + 12,
  y=(_y << 4) + 12
 })
end

-- this creates keys we can grab
function create_obj_key(_x, _y, _key, _spr)
 return {
    type=_key,
    iskey=true,
    x=(_x << 4) + 8,
    y=(_y << 4) + 5,
    pos=(_x << 4) | _y, -- positional key
    spr=_spr, -- our key sprite
    anim=rnd(1), -- animation offset
    spin=rnd(1), -- for rotating
    onstep = function(self)
     self.anim += 0.02
     self.anim %= 1
     self.spin += 0.035
     self.spin %= 1
    end,
    ondraw = draw_floating_key
 }
end

function create_obj_octogem(_x, _y, _key)
 local _obj = create_obj_key(_x, _y, _key, 87)
 _obj.ondraw = function(self)
  -- only draw this octogem if it's the current one
  if (self.type - 8 == g_puzz_octogems) draw_floating_key(self)
 end
 return _obj
end

function create_obj_gen_key(_x, _y)
 local _obj = create_obj_key(_x, _y, 16, 159)
 _obj.ondraw = function(self)
  spr(self.spr, self.x + 4, self.y + (sin(self.anim) * 2), 1, 2)
 end
 return _obj
end

function draw_floating_key(self)
 local _x, _y, _sx, _sy, _modx = self.x, self.y + (sin(self.anim) * 2), (self.spr % 16) << 3, flr(self.spr / 16) << 3, ceil(sin(self.spin * 0.5) * -8)
 if (_modx <= 3) rectfill(_x + 7, _y + 1, _x + 9, _y + 14, 7)
 sspr(_sx, _sy, 8, 16, _x + 9 - _modx, _y, _modx, 16)
 sspr(_sx, _sy, 8, 16, _x + 8, _y, _modx, 16, true)
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

__gfx__
4852ffffff0ffffff0df906a28d5a3fd8e471f3e29f946cb64204815e5acbc7921a2ffae5aff427c1c7d6e9b69fecce861987d6727c37bc097c9283ea9c0f4e8
f18b446cff3becfe0c8b6b1bfeb9e97ef0f34cc87d3ea7f87f4df3ed4597be783274c5f19ce87cbe3769ff90f74cbc1b01e9f90f62f53edbf47c11a7627fef8d
721b97561f4a74297423beff84e79321fcf005f07cf78467cf07ca9467d3fd7a19c299cf146093c2b3437767ce9d488cffb0c1375c27df2b448e9c7fce9499d4
b0e16510b4e9ce0f3cbdc67bd52f8dff92a523d8c2f02ce8293c87368dc83fed1bc311b67e8f1ab33a93ea893c1972533cff44257de836c28cf127d1207cd74e
87e9c275697819c17ecf1f740a2b837df1a7ef3ffc796eba83ab42f79d5e7933d21283f8f8ba9c28e77f39439a845876e1b8700425a94a36bc314c59ccff7e8c
6374ae02c27800d329a9290a0163ce834023b09c1a991708ffd0239ce2112d8ba94327c597e9521dfe3702a94e844ce5f04e29ce3762f38ce4f03a5ab76df79b
4bb343b74a164e267994a78c38a322752d046849c442b942139c7fb4e8cf32f794217ce8321e809443a2f54852a5de722e80ca09431122cf199f79b4e9c4e8f5
22c5fb0bd49034b9453744d456bab13317940ce51b4db3fee76bb42bf4ce799d555b4e938d1467cac57f2c5fe137cf0fc657d5cbfe7385aea82ef6ea4e2e0fc1
9f562e2e9d87c19da2e8322f7d0fb6a7c1c1cf3679be2271d5e9991fd1b40a0946b34ef789d1378449f99785ab00cac38c5be7ef62cfff100fd25e2f789f52dd
391929344cf906490fb1ff7001d2b829e2c2a1f7ca3594483913a12482f71ff3801e3e847e85c677b32c149f146c312c10e3e7f08fbab4266972293ad098cd0e
1b27c4c8070f0f7780f7d129d2239be894c02f04ec4e1780013cdc1cfe6b46754ea42aab4a9d275c6604b0f0a1d94093a9cc91acfc102183807525948936bcaf
888429d2911b5698caabd51111229c7c8fbd813946bdc594c52d4619442d4a9c01121536421803d54e11190b46229248fb5629d6161e8ac295293854e14446b8
804e1bc1bd83694288c14448ff3842852f7c14b29c8a2211c14a6429854e11932e01107858066e021ef70298c5c0463e17c0223384224c5942803843c12a2131
098cff9a467c2c0c5bb027dcb80467633f42a8812f96808342cff4872e865222fa852e974942b210546a98b06840c5cff481103c61280bc4439e221d0e1b8c7d
eae804b70cac653b052cff2a9e8462097a90789de0593432c0c836744250e21981188e6c331fff8c0d90b0f3c396c298dc093cc44a7d2318c5e9b1f0a388cff6
0094a7c817544c223d3643c7bd62c240c87f07404c60ef7001c8d2318c3d326397a02139083ea4e71124612e0c34c08ffd80a9c6e60e217ca9ee3989c46bd332
188329d27c20c119dae84452dffb86a6b32a11842124a3d954a194a1de4e1ad888d5246101a18dff7858121611984529944e9c19d53aab7219642f42647d8788
c80ffb01989c09c42a2be69e399a5885e84242521708c2a858f8fff02224321239c55b8f1484790361625e81a1e8019ffb457428c3ad68c5cf545d8d52fe1198
d425298ff55ce704878fd854e5e6e494291ff7e04e70b78b5e00fb22270ffb9a0f21298f12c70e6032c1cd18478ffd03e1e1ef00f272fb1f6834eff411c7c3c9
cf4c1cf8a76248b81ffb80f39cf3c3cf589bfb6444211111024e11122ff2fb958f98b68f303679cfecff640f0f0f708f0c941bcb48504e90dcf0a29021948fff
8df3c9c871c1c3370c81597ce2bff93f70f307fca293401d64c0132840c8fff38c9124868014891efffe54012cfffbf0d0fffff101030860020a101ef5fbc5ed
f74ff17d56ff9cfff388cf54376ff2a1ef2acffc9173713e6ea01e6e2efff101e0e5648387911e0e5efff40f31f0f31f0f31ffffffffbebf75ff57cfffffffff
fffffffbdf00a004ffffff05cffffffff720d6b2ffffff0ffffff0df7040fc93a8c2577aff73113994666bc466233999ca399856bc4c2b56269d231bf9593029
3e2d7af44ef85c33dfb82fff70c1c3a4c7e97c1f71514871c817171f48190715e16f8024ef1ef4e9444e0e4e5a44e29acd2f19324261e2ac3cf10640c2c0c541
c7c2cbcb983110a11715e23cf71e4ef711ef741152ef4f80f583053016c1c8b342c2c112cf002c111328fc6cdcf7c90a6f748392ff485874c521c5f4afd2fd7a
bc7f53b3f852e9877fcbf6e86bbf677b772e9ce78c3f3cf0f3cf19f36ef8427ecf06fb4e7872edcec3aa9c5fc6f51369c19727d5f4ebbf81b6feb3e90ded72f4
e2ded72f48ab5cdf4e93a68b2d3e89e77c87e0ef2e8cc154b4ca5ad21961ac37c85a48693652ea323fc6e8323f1756a61102ee6642661a90e95c11a1e84619d2
12f66227b6a4ae945d3250cf63538c8a2e84c19f3cf2e7913e6dd2574a9b21fc20233f762148356c11e84d7cf0e89c4ff0298b8f942cf69c08f13c199bce2bf2
c367466cd6838051cf89448abef1ea4c1cf1270742e3699340d84111cfa901694e2d72a79c3679c1ab368db990f52a0934070fb54088c794f88e51e0e7b361a3
e12431bcc39280210cf694014c6e78c4d11b9323174c6ed9c32de78583e95e704c24237cc3e897cf9b134ee7a22dd39b35784c39b7511e17f1bb3dbcd1746fb0
198529c8849849fb830c01e02c090cc11680811680786812131a1930c10938fbce859974ead1216a67ea5903d8c12166676a59033b77bbc17c6e836c174aea4d
39b774836ce2e81bb832c7c10bbc77cc675e6748764e8075e1ff8d399bc1f46e2fc31e2fd398bc55f2bffb83e17ff4ee3c5c1797e29bc579dfffb0d7c1f97e2b
67f2f4eec396f947f4e0866070830c10e0070830c1485c24d17ce87e9e2e8f91c162c31a5872c31e90d2c3140218729c81263991942b08687c6c41838f5043c3
1e9071868090dc454ae8443943616b783c3bc4d1247361485a48d08d08d0850163468f3d14e3958de0e39f13c121e007083049b200f56e856e26c4ed5819de0f
ce0ab294524242c31a48212121a48fb905ee5938f12c323a1e807136c8d012c8ff5d07c447ae3b50b1f40161c0685016140121a148f9942e91e89934ec921b19
0f056c821a480d0f0fb355268366e89afc667c10270868501a4680912468098c10add87227068366e856e24ae3d86948b80703c03c03c03e39f7c801b179e5a7
1417a2d3805630a580912468091e1e0390c79b159ce729b4e2e858762a348c0341a5861a32112981144f9e198c29d5c5c5a75832c31e90f4872c31e90fc8589e
858729d3af31ffffac779d5e874eff7259b20ac5105ea08271369b2f83074ab9f10f50c1c10e927c7f7c87ef81fcf13e9f3431e0543c142933c378383e060f30
e87c9af7802e36786d42f0244ba5e84dc15aa3b62243c31d2d743edc71528651e2ef85c30c3680cf10458c3c3097834b252421d86218d3a2a9867a168274283a
a21d81f41b5c42271d8d90299b4eac6f848552178be9df074236f4c1219c2f1707944a99ff107131c3c8384c0109442a81b0b95ecd2294ec56298b94cee0b4c7
98329c1165946869d29d715042bf587dacff24ef42dcbeaa42c798f1834ef70237ddcf3a868b8f524e1f78f583643142a1140e78ff103dff58c5c8f2766f48ec
e0645287cf1e71610ff729ff58e13c2cf1706a56e817484a211e916fbcf0e32709bd740bcf0ebc9370f4d761db2cb934853c17c293e09ec64318f5eff5c9cf6e
83c99081c3fe0f487241c278b2b0a49425492981aa809ca8a55e1eacc31e1e29b87cac1448c9120d3b42139be87c62c12b61c39fc5279dffd2fa1f11e7029fe7
9b812c097a7097eeef1cb745c057e546ecd3702b0f302bcf29c7fb4694832494ae80b80ee0fb48f52cf23f7cf22f7c4444e07d8036319830f9f1692c3e89cf12
ff0ff0f3dcef0f80c190421907a9001e24080148f18fb8f38f922e11850b09442c73809004601210043cf21e79071f398881630958485821c012c181240c11e7
02cf00e2efa062650216163c84808784808f32cb49790f37031b3001121610f4161ea2c2cf01e3e1e36cdc3c1884f10c2190b01612041a12041a1e1071f702cf
21ac519e32094486221401e0054830c0c348f93cf212c519e720840a9848d052063490801ac81fb190fbc0f9432e10c24342c1140824a020412803ac8fb821e7
0eb0d4ef87019629401610120280801010f70fb1f30ff8cf34561c083046823091acf1e8fb8f38f78ff850109a052254821699f180f301e702cf088cf344e4c0
87a0610f434ce09b9ff8b9fb2fcbfb4ae73e4e0bf1ce02cebc3d4025a180a021a180a021a1039368fdd14b9ce98d3c544efff4839d818fd4f8577d1bd67048d8
5e07585694cd3942994a904294629423942907ad8287d17c8e1b8c1905952c8f109b05690042c312c280b0b07583803a021e9c4d4608c4e0c842e20c1452d813
6c8136c8136c8136c8136ff7a42fc206987481e1071134808100000004200d0701641cb0e729026dcc3c998a9423942972c4294a229cf490cf6440701a2802da
eea8f78809ff1a10ff301c116880e8e16396ab422d960425861a5861a58610ff39441c10e06940f4cf2943ff3fcc2c2cf794a22d009410556243f842b0254219
9b29895a914294629423942945a08d0d0243439c398721fd39e156932d4d31802a9121e90161485819c485c642487242c805225644e57052312296c838180564
9136c8136c8136f383a16c3109050708381a94db1e9019c23042c8400212121e164149174807c267c8d198c4383d03089a5c1231127088548c4809741905e0ef
b83ea4d1161bb3a597defff358f7de3e79cf0fd3427e6390954429d424eb8096212d424a948be19f95e2e1b078d54ce0fc5c5cf0cf31e90ff3d1e1ea09458070
6801eb103647832cff39781820808792f681f70735ef748052cb8cf110e0e1e5a48132cf0c5c149f731f1fb8c7197879b9501e6e780248f731f0f34e1f24619f
d832421ff702cf899fb9b3c8f18f3058f18f3a08f1c7f4eb63793df1f92f3c329cd7a4ef870c1c12768283839f79b8742c1c5c7edb8b8f18f72c31ef7a3c3c51
e1e3e1ef0e72ef7dc3cf0cfff3e05ef048ffb01efff123ef5e2ea0fb071f08ff962e706cf7c342cff081f368fb9b3c8f18f3058f18f3058f1c1fccf2fb4d7cdf
cc9b36e7170ce8db909f17134e0ead6683097eaa0f743fececfef890e88d595e79d3c0bfe71b833c68f7715bf3215fb856936468ebfb469d17e9468ef2fb429d
f27cf246022d0f7c11f52e2f1f10420446ec069b61b324c272d40713938003d781fb8c14089590191100bc5a68bf1b42b8452252b44ad696e79032d51d6a936e
809380bc583e02cc2e83802919e077187191ee0129c12850c7cfd2ff3162908f2aa1974e8520f06cce8c1fb876e10e856c15560948136178036455813c69e248
15e85268bc545c4269aabef16b0a906e1610840371b70021cc8d3009022f76c3dc331022163cfb529c187e8a486932524b4f821a59daa7d19bfd7f92f4fcf1ef
8b793775c55f58724157695e872cf3cf3cf24cac59e34ac59d34ac3995274836e70b8b297e11174e9b6612c0b726175816f6c2eb0349c5170ea6421075322e0c
546e8486d146e09a724d1800428bc3c110428bc3c110428974493ef00f70c1fb0fd41c4d092934905028c1241e014e01a07022ff0ff79e3fd476209769c559f7
8fff83ef1e7983e706c1bcc08453972c81b874714c3161f85229c3161f8622ff80ef09fd6e1921d2f8e29365e484009d19745200b3e8a94006dc27cf1b4cf1b4
e8f342e8f169932bc1dcf0f3469748367cf069b21addf2fa5eb48e62fb44e7942fb06e84374e0bbc97d5f6ece1d4c23b42d729bea8c3bbf8ef16f7c8ef13cf13
cf3d70dd51b83be71a78df72b07081fff0e7a96bd582202800ce886cf19935a99138cf022cf080f308f1d61844ab42fb4271939840c119b52cf042cd4a2bd178
1e0970a75ceff0c5a04839d2c9c25f2b08f620d508522cff68182dd2e2b6d3c52d82e29e8eb27943f53598ff905e0e842f74e8cf2932ff48b97841b469ffb03e
602404ffffff0de310842eefffff1000000002000000000000000000000008ffb0d42f1f31d0f1ff319b8f79b8b4e09fb838fb9306ff8dfff393a8e11e7c2c31
e7738c17002b46ffffff0ff7aef40821436579cdaefbe19c4d574aaa97c3e237d79aa24e12fc4fa594b96e136e8f655aea37fab5d5f34ef0fb8abef94fe36787
e5f38f34e9999c3333976662fccc4e899dce236c0cea094c80b0910b0136c66c8dc24d62ff3a6ef83f7159c137817e1db56e2f784a179a5a1f8a4ed9bd836f8c
2d87c16137817c1d9cc5e09cf3179f7c2f4c5e19c71f8f427caf461d624eaafbedf3e793d67edfbcebf12e973979f673e21e2076e2fd4ee93c15675f6c4e9581
f62dc6d8c28b6f162e103f5c787eec3d277887fcf7e79dbf7cf297e2e2be3ff83a9f7af0f3070b0e70c1fdf3fcd8b80ff832e708f16e783e6e19cf28f3882151
09ef0884e6c9483d2e60fecf13c9c3297edf5c9f8369c1b32fc3def0bb8fce90f75f793e8363f4e3b1f7cc6248f493f794d2b0e23634e013855225f0d9f36ef9
9f70cf209f369e7d888d5f707ec9fc1b57938b33fb0ebd633f89db8df3770c8f5e0cf37f6bdabfef9835ce51044cc89f1ea462c6ffc8df3100e0cdb57b577d20
269c1ec3c1bd6dabadcf3d42bc9fa9777e5ef8bf2f982846e56ed4c9f0e1c18c5fb4cf114176aa0f34eb40f3000279b71b5c93f6ef17de2bcf0ee1f2f56df6fe
1762907bdf0a2987e783fc6b48932ad174291f303d948a6f860487dadf78629116c421b6b2d1f13d863a946489e42492f97df3e8d593e873fe1bbad6e9e1c527
e7e707d1fc1d07c10c3ea3d5df728b0c30e9de8787e78f383ae2f9bea529bb2e1aea367c17d3c6346df4b21c70e407d6978f3e86cf17d5b7a97e2f87eab398bc
edb067337d642c3493e01f4eace794ebc2e6122c69f7ee83040c36cf23ff08160fd5f86b942fd9aedb89f762fcc3b66da7e8e574211799c3d3837248b16fdf34
e051f47b539369977780f2196a22f9722884e1848fe019f1c37878c6768324e57f2798fef85e1a6fbcf21b90f1626772211031fef2bd6b777dd1122b222cb211
4e783c2ff484d14cab8df026f23c9e019366e706c14c979ab2f48b293e795e16cb48f3801c403f7cc98985e5127f37e6bd1b7fa8db6278878ad6198ced70731b
c0fec5003b6d19cf2e0fa8cf137ee8d27d6acf3ed4ef137a0f71287e07df2bc078f5003fb872763fd5772f7cb18d518a0f09fe2bcf28eea901f30e8cb1f9db98
b3ec3d3b3274f07ad7fc57f7d34e93c5df1eef7266c29f76e2faf16f64354484326462e27111d044843f4cc7944c5e62b8668884644cc85e7977f6793c79ef0f
d1e9e7d77f8df18329a7932f4e97bb398cb98339cc1bdf1227a4ef04c6b98884439cf0e8de419f542722e9d631bf7285293c6bf88d74f7b8d6f3c17de475fd4f
85e97ef8ba9f788cd7bce0dc5998c2f5c5ef8b6b7229302e49cb454485ec8bc62b84209f2293611169f12e299c919c30119498880df1279ce374e9b87eabea3e
98febef3fdbdcf12df32115cc2ef8c1b3f8d4dc9ed9f5a288f70fa8f58c963f916a6244411b0e6956b7cc363f387401f70e953ff87675db1fc1b7eb4a9727d16
ff484a62efa0f707edfb4c77bc51bc9170908fdc91e702f78819f529cb1c40cf748f8c598b5674c6737842c0e785ddd7a75c159e12b38ccbfbc677fff167bdff
f980fffffb11effff732cfffff648fffffd80fffffb11effff732cfffff648fffffd80fffffb11effff732cfffff648fffffd80fffffb11600b966ffffff0ff7
aef40412386e57d9bfac621119d26c4b7ca2a972f8bc4fbc14cc57ee1f8abeac3e557dd9f1cf1aeaf52ff8f7ec3c5ff4e3f86e13fa9bef94df1aeaf525f38acf
31df1e457df3dfa7934ef938989bef9c37ddd87e8df3e7932b9f74ef191360601299700b91363362fb87c6c1c9272f48b0127df3bf2db667df0717a4c3702d45
1ab057a0118dcf23fb82ffcce79b4294446e938529a2461a6244063b9913976d3ff9e9b36bf5e9344bfbc52ae00814031e666f060ebc583caad98c2547628341
81403164ca81839fc7c860191ea7d50ecf835ff37c5fe9f46ff89be23ff05ffc351c50e562ccf2c06ef1e2ff0e4ef0fbc57579dec3e2d3ff87e9d694cff739c6
bd6bd6bd622222222222222f4abd12fc27542ff4cf098b39c21fb48ab39cd94ef8bcd112ede263d598df12f5c9160ce792200ef87f83b5196f27203f42ec42fa
1f52a1aef13bf3e96e05744202229c67838b89d12cf20000e78ff7cbe8554a42de17787f98bf161f640684bd67f5380e9c44469de1301ef1bc1c3cf239837c03
26462360f38b5e7178875e0c1ff0f6c39e38c2e1202e362622e8f1c1ef008c1705fcebb5ce834bf7cc0085e4e84f3185a80e1fcdea729945bf20aeb01175e79d
a29c91b84276883029c91f562422988e6332ccd7e57edf3c4785c527a4e2ea75e3264c54e226427fdf3c3bc3bd99ad5e1e85637b4eac17c57529327d6b3c196e
acf237017c5bee79e194ed83d19d67c9169beb3eaf5ecd99830cf367c8c35aae387240ed400742e53e07b6e0936fe23942b1e8743733e70934c8f1830c309a83
8f6ed55ac7294fa599c1161f83e8c17cf16be4298d479752cbea30e0bc66fa3c5f9481ff8461067484461112e28c1a8451b3cf09d61f42e8582ff899c3ece1bf
3824244d294aedc4e94cd4c1c65140e5978c8b2ef95add1f2e70c4311d739aa68c4c0c8f56c06296eb354e393e88d42f3c154f79c12a603c0e78307c575cf240
02e372575477a8c336e2c7757e112454c008b1f88f0a879afe5707d4fab2c4873f9f14cdffcc2e329bcf2fef1a1f837c5a9e1c79f763b0d373f0ffb1e6b3de07
1de3f54c88bff8c76eaef1bde0c267462f3c4cf33ff8747a3dac2f429d297cf19d29f1c19d44674cd9677c6be11ff5ad98c7bd37c67ce98f9e83e8df2d7c19cf
0f47ba7422b98d270ce78c8f88b28f50bf08f32a23a390946fb84c2e8442f895e1422498b28a83e21c6a69dda69b2b81c2338e1e312b8bd9bcdab570707c2674
62d98f36f749dbe85a2b9f078a46f3ae5affa09306d7ec350bcf2f95372cef8c6700bf707c8899b5f57c19ac2f4a9e297c19d215fadebd6fd517f37c1bb6bd3f
4cf7fc17cead6fe6fe3bd1fd71b42e702294edeabc850b9ad2f2c29132eaf00bf06611766f9367c2429d921b83685cc690c8012eab00b706611bca264e1f7832
d3615bdabbed0f5a273fcc1bf5280c3177a9f1a19f3ead5d77bd744c5bf1c1bb2a49cf011fb4a28764eb02074ead56fcf298f7a339fc27464c329340b7e90f0c
dfbc374ed33f4f242f34ec8e6e837403f388952fb4eb919f83ef836932d50fe76b72954eaadef80f149be70f944aab3e2714037c0e7c8a6e5b26f46b776bf785
ea0db4d16ede175847b487ed74371b384a2b1c2f3037199484842f8561d4be19b6f8178329db19385e5697895caf500994848c3169de4bd6bda9f607d8c3843f
b0ce383e08cce12bd633b52ea4e9856b7404c3fbc11fc58e1f7094477c2296372af3c13f8d17d6d2d3241f2ec3ab42cf3bc3c24287cca194f8d07c1b88c2b5c8
01bf329632ceb07cd7c1decbf4cf016994b90ffcbde6bd6438f7e793e8df05d0e71ad80d508b7d67bd63ad0af0c17c1bf322dc63164c5fda327c1bd6fd3807c7
bb9c7bdf0fd6b30dedf6bbf38607f1d6f6a123c6e794e87e86393a2844eb3619c2bd32026f42df042c17fade293f47c5d42cf3f6add6bf12a70ee7e96f982cdf
c3de2a1ce88feac57c124b54f483a7c44a9d224887f71dfef87fee9f846bbeef7e2d8e77401c99f54e9517c67df2378916658d64a45ef76a4e01961e797e6bcf
1e8d9fd5a8833b89e704274c3b4895cd4e0780919df97bde79d67983ab55c67e16ba8defc56e8e6051747b30421f8940cf0678f16ef083e0bdf2bc4eae6b88b2
98f10fc059cf227c2b9d129cf2646ef9d17adead68bead60f4209489f74239369d2399bca901fcafdf0f7c33c76ef8bebcdea8f3c1293cf12297814c8a7f99e3
fc37c5988fe0f57df7a9b1e57d59c3eaf7c5e41f079b5ecf7c5e1cbc3edb7a93eabeb80b3adf5271574bd7e70ecb2794883e27c10f78d3d1715fdb46c45a1757
7b6e7933390fad52e877c74cb7e8f4b77485f78c1b810d36ffffff0ff7aef408fe41235679abcde19c45e88a56074dcc5f4aaa675e1b6a989d2383e033fc79b6
79c576b3f5c5f6b3d8bed67a17ddde43eaf1ad96c5f74b3d8be7967a17df3de1e83c1fb89f36a23846e1bbc46aa2401e1364663b910310660cc089103306668d
97df27e5797df39f73ff88b67d2fb439059e11fd8d23c7bfe8b83ccea546d7c5a255743612d32bc0bff3ddf07b7c3fbc974f9f7c99cf2edf748be71afc9ef9f7
abd6d44b7cf23e795e7878f61ff42ea9b20cbe8454adff9830c13cb9b4242afc59621daf83212167b7eae6b5ff9f58e6e8f581442174275f96a432ffb3930f6e
28f721d7c1701ae99e30f7c339f5e88c339b07522fff84f8e6b5f9de8d6bd62222deff040787cb93e785c574cea87abe8a3bcf08f5428075693062ea95817542
600cbf4f8a8caff30128df029a5cbd8d5b77ddb883bc983a906ef9c334367daf9eced3244067cbcf26777f7c67c6b6ff5306873f84c976cebd37c1bb017bc19c
2e3cefadbde6b5f8de8d6d9e69e774c74a57378bf1eff227df05d7ee594d29b69f88422b8f0b9f7c3972906e268c99f1abd6b52df323ffce87d5f47bdadff98c
c675f9e3d7aa7ca6b852ff01bcc9d46145f9075832ed4c999b88323797efaf1ea36bda7d5b76b5bffa1e8b67deaf5e98e1269c7bc3938dc534dbf48bc5f685ed
8f82b932f87e8c3d6ff70a83ea53df21d5363f9403f642237a36e1909cef932ed0bf1cbf0f8eaf78627685c67cb777dff98d5ae8d3d3aab5d29d2703d88fae2c
6ab3227d1f5ab4ed4e0239fe98f3e2c29854ef720e8f1ad6bdaf5a5b4ea5e22e94cf1f0b95e81e8bcd7c1bf34cd2ab5e48d2d628fd2f5bbd6db7b36b5bffac8d
f07ca7d5b5fd5c51ff04c19017e5eabcdf4221781b76ef94cf198f7e2ffc5787b9dff0462bf3cad6ae85eb71eef5ecf2acf08beef1e70fddf78bab9773b31bb1
daef0512af90ff702f2ab6ef95d6bc6b3cf1b4c59c7d7a9fb5e0fa3e0fbc517c1fcf1727cf3f7cf2bf7477d1f96ead6bf6f787ee3fdf507e9f6a97be9e17c1dc
5e8beac195e8e29d67cac99d8c1a2ef74c44f8d1fafcd9f3e2ef1f9ad7b376de1be17c376f79e9fc97e63926e4dab4e783fbd5feec9a7abbaaf6ff87eb77b9ef
f489c0594c596a12f38bc3fdeb9a3a35df7a7d37d7bd4ac12e17cc0f9bc3fdeb9dc1dd33d777d37d7bd4ff72c89fc92729f12723e17ff3f3cdbdab7e796b74f7
__map__
f9637ff4f8e187bbdb76fe13dffd4f8eaae0beaeefdb8e698e69f65ffa7d5fb76ddbb6adffdaa5ceef8f5f12619ee911fbc9f1ff37c3ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f230c1581ff971faeffbf66bfe3018201a100914c289539bd0e0a
8946a492e9844aa956ac002c269bd16ab61b2ea7dbf18041e19058341e9149e592098fcba151e9945ab55eb159ed961b098bc764f3199d56afd9fe93244992244992397a3c571fdf8f3ddffb87eb7ff3c72fff244992244992fcf4d76ffffdf8e7affffefcf7efff83ffc3ffe2b75ffe1fff93ffcbffe6fff33ffa3ffdaffe5f
ffb3ffdbffeefff7c76fffcfffe1fff17ff9fffc9ffe5fffb7ffdffff1fff97ffdfffe9fffdffff7ff7f204992244992e4ff1ffcff85fffff0ff27feffc5ffdff8ff1fff7fe4ff9ffcff95fffff2ff67feffcdffdff9ed97ffbff0ff7ffeffd0ff3ffaff4bfdff4fff7feaff5ffdffadfffff5ffc7feffd90fbf39ffffff041f
a1fffffff0ffe93f102a3596db7f48fcffff15e1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ff
ffdf08ffffbf11feff7f23ecc8f47025f6ac9ab492fa7f25bbbeefdcf61dddbbedd8bd1f76ee8ffdd0efed1f3fec9cfb5dbe9de7f5fc71f97f3fc9b53dbff8c31fdf768ab7dbb1edde766c13e9b65fb67569137d7e207eb0ebfd438e371efdc3c1e38f208fefe69cd386fde175fce10dce3c3f4c5c9abce68f38f63cb7f48fa4
7f78e7971fbcfb25679e3ccb1f831dfbe4128f5d386ff9e1d975d7cefc020e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

