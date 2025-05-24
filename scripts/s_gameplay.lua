function gameplay_update()


 g_slime_trail_anim += .075
 g_slime_trail_anim %= 1

 g_stage_bg_anim += .015
 g_stage_bg_anim %= 1

end

function gameplay_draw()

 -- get ready to update the sprite sheet
 poke(0x5f55,0x0)

 -- what should we redraw?
 if (g_even_frame) redraw_conveyers() else redraw_waterlava()

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
 local _s_w, _s_h = g_p_sst.s_width * 2 + 2, g_p_sst.s_height * 2 + 2
-- get ready to draw the map, using white as the transparent color
 palt(0b0000000100000000)
 -- draw the puzzle floor
 map(0, 0, 0, 0, _s_w, _s_h, 1)
 -- now draw the map again, with flipped tiles only
 do_tile_mirror()
 map(0, 0, -7, 0, _s_w, _s_h, 128)
 do_tile_mirror()
 -- draw lava/water/ice
 palt(0b0100000000000000)
 map(0, 0, 0, 0, _s_w, _s_h, 12)
 palt()
 -- draw the slime trail
 map(0, 0, 0, 0, _s_w, _s_h, 2)

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

 --[[-- initial copy of stephanie to work area
 local _obj = g_o_list[1]
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
 local _eye_determined, _eye_blink, _spr = (btn(4) or _obj.sprint) and g_p_use_conv == false, g_p_blink < 3 or g_level_win

 -- eyes
  _spr = 215
 if (_eye_determined) _spr = 214
 if (_eye_blink or g_level_lose) _spr = 216
 spr(_spr, g_level_win and 37 or 36, 104, 1, 1, g_level_win)
 -- mouth
 _spr = 251
 if (_eye_determined) _spr = 252
 if (g_level_lose) _spr = 160
 if (g_level_win) _spr = 250
 spr(_spr, 40, 104)

 -- copy this sprite to the side angle
 -- roxy note: yes, the coordinates are wacky. it's fine
 for _x=0,23 do
  for _y=0,7 do
   sset(79 - _y, 104 + _x, sget(24 + _x, 104 + _y))
  end
 end]]
end