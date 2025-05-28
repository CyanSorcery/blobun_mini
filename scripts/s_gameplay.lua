function gameplay_update()
 local _is_go = g_intro_anim * g_outro_anim == 1

 g_slime_trail_anim += .075
 g_slime_trail_anim %= 1

 g_stage_bg_anim += .015
 g_stage_bg_anim %= 1
 
 -- show pause menu?
 if g_p_intro_cd <= 45 and _is_go then
  if (btn(6)) poke(0x5f30,1)
  if ((g_btn4_press and g_stage_win or btn(6)) and count(g_menu) == 0) menu_create_puzz()
 end

 g_bottom_msg_anim = mid(0, (g_stage_win or g_stage_lose) and g_bottom_msg_anim + .2 or g_bottom_msg_anim - .2, 1)

 -- process objects, but only if the stage animation is done
 if _is_go then
  for _obj in all(g_list_obj) do _obj:onstep() end
  proc_particles()
end

 -- move camera while binding it to the stage edges/centering it
 local _obj, _lw, _lh = g_list_obj[1], g_p_sst.s_width << 4, g_p_sst.s_height << 4
 local _anim = _obj.inportal and cos((1 - _obj.anim) >> 2) or _obj.anim
 g_cam_x = g_p_sst.s_width > 8
    and mid(0, (lerp(_obj.oldx, _obj.x, _anim) << 4) - 48, _lw - 112)
    or (_lw >> 1) - 56

 g_cam_y = g_p_sst.s_height > 7
    and mid(-8, (lerp(_obj.oldy, _obj.y, _anim) << 4) - 48, _lh - 108)
    or (_lh >> 1) - 60

end

function gameplay_draw()

 --[[
	notes about sprite flags
	1: puzzle floor
	2: slime trail
	4: lava/water tiles
	8: ice tiles
    16: player can step on

	128: drawn in tilemap flip mode
 ]]

 -- get ready to update the sprite sheet
 poke(0x5f55,0x0)

 -- what should we redraw?
 if (g_even_frame) redraw_conveyers() else redraw_waterlava()
 if (g_p_updt_zap) redraw_floor_zappers()
 if (g_p_updt_coin) redraw_coin_blocks()

 redraw_slimetrail()

 -- stop updating the sprite sheet
 poke(0x5f55,0x60)

 -- clear the background
 cls(g_pal_stage_bg[1][g_p_i_world])
 pal(7, g_pal_stage_bg[2][g_p_i_world])
 local _startx, _starty = -32+g_bg_scl, -g_bg_scl
 -- disable autoscrolling for worlds 3 and 5
 if (g_p_i_world == 3 or g_p_i_world == 5) _startx, _starty = -g_cam_x/2,-g_cam_y/2
 -- draw the background
 for _x=_startx,128,32 do
  for _y=_starty,128,32 do
   spr(148, _x, _y, 4, 2)
   spr(152, _x, _y + 16, 4, 2)
  end
 end
 
 poke(0x5f54, 0x60)
 -- apply gradient
 -- tmp
 --g_pal_grad = {{0,0,1,1,1,5,5,2,5,5,1,1,1,2,5}, {1,2,1,2,1,13,13,2,4,13,3,3,5,4,13}, {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},{5,4,12,14,13,7,7,8,15,10,11,12,13,14,7},{13,14,11,6,6,7,7,14,10,7,11,6,15,15,7}}
 --for _y=0,127,8 do pal(g_pal_grad[_y\26+1]) sspr(0, _y, 128, 8, 0, _y) end
 pal()
 -- apply funky animation to background to worlds 1 and 2
 if (g_p_i_world <= 2) for _y=0,127 do sspr(0, _y, 128, 1, sin(g_stage_bg_anim + (_y >> 4)) * 1.4, _y) end

 poke(0x5f54, 0x00)

 camera(g_cam_x, g_cam_y)
 -- (debug) draw the whole map
 --map(0,0,0,0,128,32)

 local _s_w, _s_h = g_p_sst.s_width * 2 + 2, g_p_sst.s_height * 2 + 2
-- get ready to draw the map, using white as the transparent color
 palt(0b0000000100000000)
 -- draw the puzzle floor
 map(0, 0, 0, 0, _s_w, _s_h, 1)
 -- now draw the map again, with flipped tiles only
 do_tile_mirror()
 map(0, 0, -7, 0, _s_w, _s_h, 128)
 do_tile_mirror()
 -- draw arrows
 for _arrow in all(g_list_arrows[g_arrow_index]) do _arrow:ondraw() end
 -- draw lava/water/ice
 palt(0b0100000000000000)
 map(0, 0, 0, 0, _s_w, _s_h, 12)
 palt()
 -- draw the slime trail
 map(0, 0, 0, 0, _s_w, _s_h, 2)
 -- draw all the objects
 for _obj in all(g_list_obj) do _obj:ondraw() end

 -- draw_particles()

 -- get ready to draw UI stuff
 camera(0, 0)

 
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
 local _col = g_p_time <= g_p_sst.s_goaltime and 7 or 13
 -- time below dev time?
 if (g_stage_win and g_p_time <= g_p_sst.s_devtime) _col = 10
 -- if the player has beaten this stage or not
 local _curr_time = dget(g_p_sst.s_saveslot)
 spr(_curr_time < 599.995 and 147 or 146, 88, 0)
 --show timer and "new time?"
 if _show_timers then
  ?format_time(g_p_time), 2, 2, _col
  if (g_p_new_time) draw_wavy_text("new time!", 32, 2, _col, 1.3)
  -- player has minimum time?
  if (_curr_time <= g_p_sst.s_goaltime) ?"⧗", 81, 2, 9
  -- player has dev time?
  if (_curr_time <= g_p_sst.s_devtime) ?"♥", 75, 2, 14
 end

 -- draw slimebar
 rect(96, 1, 126, 7, 7)
 fillp(g_fillp_diag[ceil(g_fillp_anim)])
 rectfill(124 - max(1, (g_list_obj[1].tilestouched / g_p_sst.s_tiles) * 26), 3, 124, 5, 59)
 fillp()

 -- did we win or lose?
 if g_stage_win or g_stage_lose then
  draw_wavy_text(g_stage_win and "stage clear!" or "❎ undo", g_stage_win and 42 or 50, _bott_msg_y + 5, 7, 1.3)
 end
 
 ?g_list_obj[1].tilestouched.."/"..g_p_sst.s_tiles,8,32,7

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
  _col = _sw & 1 << i > 0 and 7 or 12
  sset(_x, 101, _col)
  sset(50, 103 - i, _col)
  sset(78, 96 + i, _col)

  _col = _sw & 1 << i > 0 and 9 or 4
  sset(_x, 91, _col)
  sset(52, _tst1, _col)
  sset(76, _tst2, _col)
  _col = _sw & 4 << i > 0 and 9 or 10
  sset(_x, 93, _col)
  sset(50, _tst1, _col)
  sset(78, _tst2, _col)
 end
 
 -- update animations
 g_shimmer_water >><= 1
end

function redraw_slimetrail()
 local _sta = g_slime_trail_anim

 -- initial copy of slime tiles to work area
 spr(224, 80, 104, 6, 2)
 
 local _dx1, _dy1, _subt = 80
 for _x=0,32,16 do
  clip(_dx1, 104, 16, 16)
  for _subx=0,15 do
   _subt = sin(_sta + (_subx / 8)) + 104
   sspr(_x + _subx, 112, 1, 16, _dx1 + _subx, _subt)
   sspr(_dx1, 104 + _subx, 16, 1, _dx1, _subt + _subx)
  end
  _dx1 += 16
 end

 -- initial copy of stephanie to work area
 local _obj = g_list_obj[1]
 clip()
 palt(0, false)
 spr(208, 24, 104, 3, 1)
 palt()

 -- does she have the key? if so, draw the extra circle
 if (_obj.haskey) spr(144, 32, 104) spr(144, 39, 104, 1, 1, true)
 
 -- add wavy effect to her
 local _fx, _fy
 for _foffset=0,16,8 do
  _dx1 = 24 + _foffset
  clip(_dx1, 104, 8, 8)
  for _subx=0,7 do
   sspr(_subx + _foffset, 104, 1, 8, _dx1 + sin(_sta + (_subx / 8)) + _subx, 104)
  end
 end
 clip()
 -- draw the second circle?
 if (_obj.haskey) spr(145, 32, 104) spr(145, 39, 104, 1, 1, true)

 -- get ready to draw her expression on
 local _eye_determined, _eye_blink, _spr = (btn(4) or _obj.sprint) and _obj.onconvey == false, _obj.blink < 4 or g_stage_win

 -- eyes
  _spr = 215
 if (_eye_determined) _spr = 214
 if (_eye_blink or g_stage_lose) _spr = 216
 spr(_spr, g_stage_win and 37 or 36, 104, 1, 1, g_stage_win)
 -- mouth
 _spr = 251
 if (_eye_determined) _spr = 252
 if (g_stage_lose) _spr = 160
 if (g_stage_win) _spr = 250
 spr(_spr, 40, 104)

 -- copy this sprite to the side angle
 -- roxy note: yes, the coordinates are wacky. it's fine
 for _x=0,23 do
  for _y=0,7 do
   sset(79 - _y, 104 + _x, sget(24 + _x, 104 + _y))
  end
 end
end

function redraw_floor_zappers()
 -- order is {LLMMHH}, {C}{M}{Y}
 g_pal_zappers = {{1, 13, 5, 12, 13, 12}, {1, 2, 5, 8, 4, 8}, {1, 4, 5, 9, 4, 9}}
 local _subt, _o1, _addmod
 for i=1,3 do
  --_addmod = ((g_p_zap_turn + 1) % 3 == i - 1 and g_p_zap_cntd < 8) and 1 or 0
  _addmod = 0
  _o1, _subt = (((i + g_p_zap_turn + 2 + _addmod) % 3) << 1) + 1, g_pal_zappers[i]
  pal(_subt[3], _subt[_o1])
  pal(_subt[4], _subt[_o1 + 1])
  spr(155 + i, 96 + (i << 3), 8, 1, 2)
 end
 pal()

 g_p_updt_zap = false
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
 local _coins, _col1, _col2, _ypos = g_list_obj[1].coins
 for i=0,1 do
  _col1, _col2 = 4, 5
  if (_coins > i) _col1, _col2 = 9, 4
  _ypos = 17 - (i * 3)
  for _x=0,8,8 do
   line(72 + _x, _ypos, 76 + _x, _ypos, _col1)
   line(72 + _x, _ypos - 1, 75 + _x, _ypos - 1, _col1)
   _ypos +=1
   _col1 = _col2
  end
 end
 g_p_updt_coin = false
end
