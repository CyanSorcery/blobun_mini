
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
 if (g_updt_coin) redraw_coin_blocks()


 -- stop updating the sprite sheet
 poke(0x5f55,0x60)

 
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
 foreach(g_o_list, function(_obj) _obj:ondraw() end)

 draw_particles()
 
 -- get ready to draw the status bar at the top
 camera(0, 0)
 
 -- cpu
 --?flr((stat(1)) * 100).."%", 72, 122, 7
 -- mem
 --?flr(stat(0)).."/2048kb", 88, 122, 7

 local _show_timers = setting_get(1)
 local _bott_msg_y, _left_top_bar = lerp(127, 115, g_bottom_msg_anim), _show_timers and 0 or 87
 
 -- darken areas of the screen
 poke(0x5F54, 0x60)
 pal(g_pal_dark[1])
 sspr(_left_top_bar, 0, 128, 9, _left_top_bar, 0)
 if (g_bottom_msg_anim > 0) sspr(0, _bott_msg_y, 128, 16, 0, _bott_msg_y)
 pal()
 poke(0x5F54, 0x00)
 -- time below goal time?
 local _col = g_p_time <= g_p_fst.l_goaltime and 7 or 13
 -- time below dev time?
 if (g_level_win and g_p_time <= g_p_fst.l_devtime) _col = 10
 -- if the player has beaten this stage or not
 local _curr_time = dget(g_p_fst.l_saveslot)
 spr(_curr_time < 599.995 and 147 or 146, 88, 0)
 --show timer and "new time?"
 if _show_timers then
  ?format_time(g_p_time), 2, 2, _col
  if (g_new_time) draw_wavy_text("new time!", 32, 2, _col, 1.3)
  -- player has minimum time?
  if (_curr_time <= g_p_fst.l_goaltime) ?"⧗", 81, 2, 9
  -- player has dev time?
  if (_curr_time <= g_p_fst.l_devtime) ?"♥", 75, 2, 14
 end

 -- draw slimebar
 rect(96, 1, 126, 7, 7)
 fillp(g_fillp_diag[ceil(g_fillp_anim)])
 rectfill(124 - max(1, (g_s_touched / g_s_tiles) * 26), 3, 124, 5, 59)
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


function redraw_coin_blocks()
 local _col1, _col2, _ypos
 for i=0,1 do
  _col1, _col2 = 4, 5
  if (g_p_coins > i) _col1, _col2 = 9, 4
  _ypos = 17 - (i * 3)
  for _x=0,8,8 do
   line(72 + _x, _ypos, 76 + _x, _ypos, _col1)
   line(72 + _x, _ypos - 1, 75 + _x, _ypos - 1, _col1)
   _ypos +=1
   _col1 = _col2
  end
 end
 g_updt_coin = false
end




function draw_arrows()
 local _dir
 for _arrow in all(g_a_list) do
  _dir = _arrow.dir
  spr(_dir % 2 == 0 and 254 or 255, _arrow.x, _arrow.y, 1, 1, cos(_dir >> 2) < 0, sin(_dir >> 2) >= 0)
 end

end

function update_gameplay()
 local _is_go = g_intro_anim * g_outro_anim == 1

 -- show pause menu?
 if g_s_intro_cd <= 45 and _is_go then
  if (btn(6)) poke(0x5f30,1)
  if ((g_btn4_press and g_level_win or btn(6)) and count(g_menu) == 0) menu_create_puzz()
 end

 g_bottom_msg_anim = mid(0, (g_level_win or g_level_lose) and g_bottom_msg_anim + .2 or g_bottom_msg_anim - .2, 1)
 
 
 -- process objects, but only if the stage animation is done
 if (_is_go) proc_objects() proc_particles()
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
 foreach(g_o_list, function(_obj) _obj:onstep() end)

 for _del in all(g_o_del) do
  for _obj in all(g_o_list) do
   if (_obj.pos == _del) del(g_o_list, _obj) break
  end
  del(g_o_del, _del)
 end
 
end

-- this adds a hint arrow on the floor
-- 0: right, 1: up, 2: left, 3: down
function add_hint_arrow(_x, _y, _dir)
 add(g_a_list, {
  dir=_dir,
  x=(_x << 4) + 12,
  y=(_y << 4) + 12
 })
end
