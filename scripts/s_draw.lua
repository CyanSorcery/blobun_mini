
function draw_gameplay()
 --[[
	notes about sprite flags
	1: puzzle floor
	2: slime trail
	4: lava/water tiles
	8: ice tiles

	128: drawn in tilemap flip mode
 ]]
 
 -- get ready to update the sprite sheet
 poke(0x5f55,0x0)
 -- update the coin sprites
 if (g_redraw_coin) redraw_coin_blocks()

 -- update conveyer belts? otherwise, redraw lava
 if (g_even_frame) then redraw_conveyers() else redraw_waterlava() end

 redraw_slimetrail()

 if (g_redraw_zappers) redraw_floor_zappers()

 -- stop updating the sprite sheet
 poke(0x5f55,0x60)

 cls(3)
 -- set our camera position
 camera(g_cam_x, g_cam_y)
 -- get ready to draw the map, using white as the transparent color
 palt(0b0000000100000000)
 -- draw the puzzle floor
 map(0, 0, 0, 0, 32, 32, 1)
 -- now draw the map again, with flipped tiles only
 do_tile_mirror()
 map(0, 0, -7, 0, 32, 32, 128)
 do_tile_mirror()
 -- draw the arrows (if any)
 draw_arrows()
 -- draw lava/water/ice
 palt(0b0100000000000000)
 map(0, 0, 0, 0, 32, 32, 12)
 palt()
 -- draw the slime trail
 map(0, 0, 0, 0, 32, 32, 2)

 -- draw objects
 draw_objects()
 draw_particles()
 
 -- get ready to draw the status bar at the top
 camera(0, 0)
 

 -- cpu
 print(flr((stat(1)) * 100).."%", 72, 122, 7)
 -- mem
 print(flr(stat(0)).."/2048kb", 88, 122, 7)

 local _bott_msg_y = lerp(127, 115, g_bottom_msg_anim)
 
 -- darken areas of the screen
 poke(0x5F54, 0x60)
 pal({0,0,0,1,1,1,5,5,2,5,5,1,1,1,2,5})
 sspr(0, 0, 128, 9, 0, 0)
 if (g_bottom_msg_anim > 0) sspr(0, _bott_msg_y, 128, 16, 0, _bott_msg_y)
 pal()
 poke(0x5F54, 0x00)
 --draw_wavy_text("s"..tostr(g_level_index)..": "..g_level_name, 2, 2, 11, 1.3)
 print("s"..tostr(g_level_index)..": "..g_level_name, 2, 2, 7)
 -- draw slimebar
 --rectfill(95, 0, 127, 8, 0)
 rect(96, 1, 126, 7, 7)
 fillp(g_fillp_diag[ceil(g_fillp_anim)])
 rectfill(124 - max(1, (g_level_touched / g_level_tiles) * 26), 3, 124, 5, 59)
 fillp(0)

 -- did we win or lose?
 if (g_level_win or g_level_lose) then
  draw_wavy_text(g_level_win and "stage clear!" or "❎ undo", g_level_win and 42 or 50, _bott_msg_y + 5, 7, 1.3)
 end

 -- stage transition?
 local _anim = g_intro_anim * g_outro_anim
 if (_anim < 1) then
  local _w = 64 * cos(_anim >> 2)
  rectfill(0, 0, _w, 127, 1)
  rectfill(127 - _w, 0, 127, 127, 1)
 end
end

function do_tile_mirror()
 -- riley note: need to move the camera, then move it back
 poke(0x5f55,0x0)
 camera(0, 0)
 local _dx, _dy
 for i=0,34 do
  _dx, _dy = (i << 3) % 128, (flr(i / 16) << 4) + 8
  sspr(_dx, _dy, 8, 16, _dx, _dy, 8, 16, true)
 end
 camera(g_cam_x, g_cam_y)
 poke(0x5f55,0x60)
end

function redraw_floor_zappers()
 -- color order is cmy, plate/highlight, off/wait/on. use center colors to recolor
 local _pal = {
  1, 5, 5, 13, 13, 6,
  1, 2, 2, 8, 8, 9,
  1, 4, 2, 4, 4, 9
  }
 local _o0, _o1, _o2
 for i=0,2 do
  _o0 = (i * 6)
  _o1, _o2 = _o0 + 3, _o0 + (((i + g_puzz_zapper_turn) % 3) << 1)
  pal(_pal[_o1], _pal[_o2 + 1])
  pal(_pal[_o1 + 1], _pal[_o2 + 2])
  spr(156 + i, 104 + (i << 3), 8, 1, 2)
 end
 pal()

 g_redraw_zappers = false
end

function redraw_coin_blocks()
 local _col1, _col2, _ypos
 for i=0,1 do
  _col1, _col2 = 4, 5
  if (g_puzz_coins > i) _col1, _col2 = 9, 4
  _ypos = 17 - (i * 3)
  for _x=0,8,8 do
   line(72 + _x, _ypos, 76 + _x, _ypos, _col1)
   line(72 + _x, _ypos - 1, 75 + _x, _ypos - 1, _col1)
   _ypos +=1
   _col1 = _col2
  end
 end
 g_redraw_coin = false
end

function redraw_conveyers()
 -- east
 sspr(12, 56, 1, 15, 0, 56)
 sspr(4, 56, 8, 15, 5, 56)
 sspr(0, 56, 1, 15, 4, 56)
 
 -- north (uses bottom right of sprite sheet, on arrows)
 sspr(17, 59, 15, 1, 112, 127)
 sspr(17, 60, 15, 8, 17, 59)
 sspr(112, 127, 15, 1, 17, 67)
 
 -- west
 sspr(36, 56, 1, 15, 0, 56)
 sspr(37, 56, 8, 15, 36, 56)
 sspr(0, 56, 1, 15, 44, 56)
 
 -- south
 sspr(49, 67, 15, 1, 112, 127)
 sspr(49, 59, 15, 8, 49, 60)
 sspr(112, 127, 15, 1, 49, 59)
 
 -- cleanup
 line(112, 127, 127, 127, 7)
 line(0, 56, 0, 71, 0)
end

function redraw_waterlava()
 local _sw, _col, _x, _tst1, _tst2 = g_shimmer_water, 0, 0, false, false
 -- tc and tl
 for i=0,10 do
  _x, _tst1, _tst2 = 21 + i, _sw & (1 << i) > 0, _sw & (8 << i) > 0
  -- water
  sset(_x, 98, _tst1 and 7 or 12)
  sset(_x, 96, _tst2 and 7 or 0)
  -- lava
  sset(_x, 92, _tst1 and 9 or 4)
  sset(_x, 90, _sw & (32 << i) > 0 and 10 or 9)
  sset(_x, 88, _tst2 and 10 or 0)
 end
 -- tr
 for i=0,4 do
  _x, _tst1, _tst2 = 8+i, _sw & (16 << i) > 0, _sw & (64 << i) > 0
  -- water
  sset(_x, 98, _tst1 and 7 or 12)
  sset(_x, 96, _tst2 and 7 or 0)
  -- lava
  sset(_x, 90, _tst1 and 10 or 9)
  sset(_x, 88, _tst2 and 10 or 0)
 end
 -- other edges
 for i=0,7 do
  -- reuse variables from earlier to save tokens
  _x,_tst1, _tst2 = 103-i,95-i,88+i
  _col = _sw & (1 << i) > 0 and 7 or 12
  sset(_x, 101, _col)
  sset(50, 103 - i, _col)
  sset(78, 96 + i, _col)

  _col = _sw & (1 << i) > 0 and 9 or 4
  sset(_x, 91, _col)
  sset(52, _tst1, _col)
  sset(76, _tst2, _col)
  _col = _sw & (4 << i) > 0 and 9 or 10
  sset(_x, 93, _col)
  sset(50, _tst1, _col)
  sset(78, _tst2, _col)
 end
 
 -- update animations
 g_shimmer_water = g_shimmer_water >>< 1
end


function draw_arrows()
 -- fetch the arrows
 local _arrow_list = g_arrow_list
 local _arrow_count = count(_arrow_list)
 local _arrow, _dir
 -- draw each one
 for i=1,_arrow_count do
  _arrow = _arrow_list[i]
  _dir = _arrow.dir
  spr(_dir % 2 == 0 and 254 or 255, _arrow.x, _arrow.y, 1, 1, cos(_dir >> 2) < 0, sin(_dir >> 2) >= 0)
 end

end

function draw_objects()
 -- fetch the object list
 local _obj_list = g_object_list
 local _obj_count = count(_obj_list)
 local _obj, _type, _key_spr, _x,  _y, _sx, _sy, _modx

 -- process each of the objects
 for i=1,_obj_count do
  _obj = _obj_list[i]
  _type = _obj.type

  -- reset this
  _key_spr = 0

  -- are we drawing stephanie?
  if (_type == 0) then
   if (g_puzz_use_portal == false) player_draw(_obj)
  elseif (_type == 16) then
    spr(_obj.spr, _obj.x + 4, _obj.y + (sin(_obj.anim) * 2), 1, 2)
  else
   
   -- do we draw a key?
   _key_spr = _obj.spr
   -- skip octogems that aren't the current one?
   if (_type >= 8 and _type <= 15 and _type - 8 != g_puzz_octogems) _key_spr = 0

   if (_key_spr != 0) then
    _x, _y, _sx, _sy, _modx = _obj.x, _obj.y + (sin(_obj.anim) * 2), (_key_spr % 16) << 3, flr(_key_spr / 16) << 3, ceil(sin(_obj.spin * 0.5) * -8)
    if (_modx <= 3) rectfill(_x + 7, _y + 1, _x + 9, _y + 14, 7)
    sspr(_sx, _sy, 8, 16, _x + 9 - _modx, _y, _modx, 16)
    sspr(_sx, _sy, 8, 16, _x + 8, _y, _modx, 16, true)
   end
  end

 end
end

function draw_wavy_text(_str, _x, _y, _col, _px)
 local _len = #_str
 for i=1,_len do
  _x = print(sub(_str, i, i), _x, _y + (sin(g_wavy_anim + (i / 10)) * _px), _col)
 end
end