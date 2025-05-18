
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
 if g_even_frame then redraw_conveyers() else redraw_waterlava() end

 redraw_slimetrail()

 if (g_redraw_zappers) redraw_floor_zappers()

 -- stop updating the sprite sheet
 poke(0x5f55,0x60)

 -- set our camera position
 camera(g_cam_x, g_cam_y)
 -- get ready to draw the map, using white as the transparent color
 palt(0b0000000100000000)
 -- clear the background
 _t = {3, 12, 1, 6, 4}
 cls(_t[g_puzz_world_index])
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
 foreach(g_object_list, function(_obj) _obj:ondraw() end)

 draw_particles()
 
 -- get ready to draw the status bar at the top
 camera(0, 0)
 

 -- cpu
?flr((stat(1)) * 100).."%", 72, 122, 7
 -- mem
 ?flr(stat(0)).."/2048kb", 88, 122, 7

 local _show_timers = setting_get(2)
 local _bott_msg_y, _left_top_bar = lerp(127, 115, g_bottom_msg_anim), _show_timers and 0 or 95
 
 -- darken areas of the screen
 poke(0x5F54, 0x60)
 pal(g_pal_dark[1])
 sspr(_left_top_bar, 0, 128, 9, _left_top_bar, 0)
 if (g_bottom_msg_anim > 0) sspr(0, _bott_msg_y, 128, 16, 0, _bott_msg_y)
 pal()
 poke(0x5F54, 0x00)
 if (_show_timers) ?format_time(g_level_time), 2, 2, 7

 -- draw slimebar
 --rectfill(95, 0, 127, 8, 0)
 rect(96, 1, 126, 7, 7)
 fillp(g_fillp_diag[ceil(g_fillp_anim)])
 rectfill(124 - max(1, (g_level_touched / g_level_tiles) * 26), 3, 124, 5, 59)
 fillp()

 -- did we win or lose?
 if g_level_win or g_level_lose then
  draw_wavy_text(g_level_win and "stage clear!" or "❎ undo", g_level_win and 42 or 50, _bott_msg_y + 5, 7, 1.3)
 end
end

function do_tile_mirror()
 -- riley note: need to move the camera, then move it back
 poke(0x5f55,0x0)
 camera(0, 0)
 local _dx, _dy
 for i=0,34 do
  _dx, _dy = (i << 3) % 128, ((i \ 16) << 4) + 8
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
 g_shimmer_water >><= 1
end


function draw_arrows()
 local _dir
 for _arrow in all(g_arrow_list) do
  _dir = _arrow.dir
  spr(_dir % 2 == 0 and 254 or 255, _arrow.x, _arrow.y, 1, 1, cos(_dir >> 2) < 0, sin(_dir >> 2) >= 0)
 end

end

function update_gameplay()

 g_slime_trail_anim += 0.075
 g_slime_trail_anim %= 1

 -- update blinking
 g_player_blink -= 1
 if (g_player_blink <= 0) g_player_blink = 30 + flr(rnd(60))

 g_bottom_msg_anim = mid(0, (g_level_win or g_level_lose) and g_bottom_msg_anim + 0.2 or g_bottom_msg_anim - 0.2, 1)
 
 -- move camera while binding it to the stage edges/centering it
 local _obj, _lw, _lh = g_object_list[1], g_puzz_curr_fst.l_width << 4, g_puzz_curr_fst.l_height << 4
 g_cam_x = (g_puzz_curr_fst.l_width > 8)
    and mid(0, (lerp(_obj.oldx, _obj.x, _obj.anim) << 4) - 48, _lw - 112)
    or (_lw >> 1) - 56

 g_cam_y = (g_puzz_curr_fst.l_height > 7)
    and mid(-8, (lerp(_obj.oldy, _obj.y, _obj.anim) << 4) - 48, _lh - 108)
    or (_lh >> 1) - 60
 
 -- process objects, but only if the stage animation is done
 if g_intro_anim * g_outro_anim == 1 then
  proc_objects()
  proc_particles()
 end
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
   if _obj.pos == _del then
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
 local _obj = {
    type=_key,
    iskey=true,
    x=(_x << 4) + 8,
    y=(_y << 4) + 5,
    pos=(_x << 4) | _y, -- positional key
    spr=_spr, -- our key sprite
    anim=rnd(1), -- animation offset
    spin=rnd(1), -- for rotating
 }
 function _obj:ondraw()
  -- is this a generic key?
  if (self.type == 16) then
   spr(self.spr, self.x + 4, self.y + (sin(self.anim) * 2), 1, 2)
  -- if this is an octogem on the right sequence, or isn't an octogem at all
  elseif (self.type - 8 == g_puzz_octogems or self.type < 8 or self.type > 15) then
   local _x, _y, _sx, _sy, _modx = self.x, self.y + (sin(self.anim) * 2), (self.spr % 16) << 3, (self.spr \ 16) << 3, ceil(sin(self.spin * 0.5) * -8)
   if (_modx <= 3) rectfill(_x + 7, _y + 1, _x + 9, _y + 14, 7)
   sspr(_sx, _sy, 8, 16, _x + 9 - _modx, _y, _modx, 16)
   sspr(_sx, _sy, 8, 16, _x + 8, _y, _modx, 16, true)
  end
 end
 function _obj:onstep()
  self.anim += 0.02
  self.anim %= 1
  self.spin += 0.035
  self.spin %= 1
 end
 return _obj
end