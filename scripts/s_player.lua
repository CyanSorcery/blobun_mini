-- stephanie
function player_create(_x, _y)
 -- make sure stephanie is below everything
 add(g_object_list, {
  type=0,
  -- note: unlike other entities, this is in grid space
  x=_x,
  y=_y,
  startx=_x,
  starty=_y,
  pos=-1, -- bogus key
  dir=3, -- direction
  anim=1, -- move factor
  sprint=false, -- move is sprint
  jiggle=0, -- jiggle factor
  ismove=false, -- if she's moving or not
  pstate=0, -- state, 0 normal, 1 fire, 2 ice
  oldx=_x, -- old x, used for animation
  oldy=_y, -- old y, used for animation
  startturnx = _x, -- where the player was at the end of the last turn
  startturny = _y,
  isdead = false, -- when the puzzle element destroys stephanie
  haskey = false, -- player is carrying generic key
  onstep = player_step,
  ondraw = player_draw
 }, 1)

end
function player_step(_obj)
 -- if lesbians aren't allowed, don't do this
 if (not setting_get(6)) return

 local _btn4_press = btn(4) and g_btn4_held == false
 g_btn4_held = btn(4)

 -- jiggle animation countdown
 _obj.jiggle = max(_obj.jiggle - 0.2, 0)

 -- do undo?
 if (btnp(5) and not g_level_win) perform_undo()

 -- show pause menu on victory?
 if (_btn4_press and g_level_win and g_bottom_msg_anim == 1 and count(g_menu) == 0) menu_create_puzz_win()

 
 -- do the move animation
 _obj.anim = min(_obj.anim + ((_obj.sprint or g_puzz_on_convey or g_puzz_use_portal) and 0.2 or 0.1111), 1)
 

 -- allow input buffer?
 if _obj.anim >= 0.65 then
  if (btn(0)) g_new_dir = 2
  if (btn(1)) g_new_dir = 0
  if (btn(2)) g_new_dir = 1
  if (btn(3)) g_new_dir = 3
 end
 
 -- fix fractional precision errors
 if _obj.anim + 0.001 >= 1 and not g_level_win and not g_level_lose then
  -- did she just stop moving?
  if (_obj.ismove == true) player_end_move(_obj)

  -- sprint jiggle?
  if (_btn4_press) _obj.jiggle = 1

  -- move her around the playfield?
  _obj.sprint = false
  local _new_dir = g_new_dir
  if _new_dir != -1 or g_puzz_use_portal then
   -- do a check if this is solid or not. if we're on portal, we can move
   local _can_move, _check, _chx, _chy = g_puzz_use_portal, 1, _obj.x + cos(_new_dir >> 2), _obj.y + sin(_new_dir >> 2)
   if (g_puzz_on_convey or setting_get(2)) _check = 3 -- allow for move on slime
   _can_move = mget(_chx + 48, _chy) & _check > 0
   -- if the future block is an ice block, and the player is in the fire state, let em through
   local _nextblock = mget(_chx + 32, _chy)
   if (_nextblock == 10 and _obj.pstate == 1) _can_move = true
   -- if the future block is a lock and they have a key, let em through
   if (_nextblock == 138 and _obj.haskey) _can_move = true

   -- reset the buffered input and face us in this direction
   g_new_dir, _obj.dir = -1, _new_dir
   -- can we actually move here?
   if _can_move and not g_level_lose then

    g_level_started = true
   
    -- record the playfield before making a move?
    if not g_puzz_use_portal and not g_puzz_on_convey then
     -- update the end turn position for the next undo
     _obj.startturnx, _obj.startturny = _obj.x, _obj.y
     add_undo()
     
     -- increment the floor zappers
     g_puzz_zapper_turn += 1
     g_puzz_zapper_turn %= 3
     g_redraw_zappers = true
    end

    -- reset move factor, set if move is sprint, set she's moving
    _obj.anim, _obj.sprint, _obj.ismove = 0, tonum(setting_get(3)) ^^ tonum(btn(4)) == 1, true
    -- set where she's moving from
    if (g_puzz_use_portal == false) _obj.oldx, _obj.oldy = _obj.x, _obj.y
    if (_new_dir >= 0) _obj.x, _obj.y = _chx, _chy

   end
  end
 end

 -- have we won?
 if g_level_win == false and g_level_touched >= g_level_tiles then
  g_level_win = true
  -- get rid of menu options since we have our own
  for i=1,5 do menuitem(i) end
  -- if the player time is lower than the record, store it
  if (g_level_time < dget(g_puzz_curr_fst.l_saveslot)) dset(g_puzz_curr_fst.l_saveslot, g_level_time) g_new_time = true
 end

 -- if we've won, make stephanie face down
 if (g_level_win) _obj.dir = 3
 
 -- timer
 if (g_level_started and not g_level_win) g_level_time = min(g_level_time + (time() - g_time), 599.999)

end

function player_end_move(_obj)
 -- mark turn as finished
 _obj.ismove = false
 
 -- proc what tile we're on
 local _x, _y, _doslime, _destroy_obj = _obj.x, _obj.y, true, true
 local _xcenter, _ycenter, _collectcol = (_x << 4) + 12, (_y << 4) + 12
 local _tile = mget(_x + 32, _y)

 -- if we're on a water tile and in the ice state, freeze that tile
 if (_tile == 73 and _obj.pstate == 2) _tile = 105
 
 -- heart
 if (_tile == 2) do_key_swap(3, 4, 19, 20) _collectcol, g_play_sfx = {8, 7}, g_sfx_lut.t_switch
 -- diamond
 if (_tile == 34) do_key_swap(35, 36, 21, 22) _collectcol, g_play_sfx = {11, 7}, g_sfx_lut.t_switch
 -- triangle
 if (_tile == 66) do_key_swap(67, 68, 23, 24) _collectcol, g_play_sfx = {12, 7}, g_sfx_lut.t_switch

 if _tile == 98 then
  g_puzz_coins += 1
  _collectcol, g_play_sfx = {10, 9, 7}, g_sfx_lut.t_coin
  if g_puzz_coins == 3 then
   g_puzz_coins = 0
   do_key_swap(99, 100, 25, 26)
   g_play_sfx = g_sfx_lut.t_switch
  end
  g_redraw_coin    = true;
 end
 
 -- states: 0 normal, 1 fire, 2 ice
 local _st = str_to_table("b31a9876d",3)
 for i=0,2 do
  if (_tile == 8 | i << 5) _obj.pstate, _collectcol, g_play_sfx = i, _st[i + 1], g_sfx_lut.p_state[i + 1]
 end

 -- is this an octogem?
 for i=0,7 do
  if _tile == 15 | i << 5 and g_puzz_octogems == i then
   g_puzz_octogems += 1
   -- find the destination octogem
   if (g_puzz_octogems < 8) then
    local _dest = find_tile_loc(15 | (g_puzz_octogems << 5))
    if (_dest != nil) part_create_octogem(_xcenter, _ycenter, (_dest.x << 4) + 12, (_dest.y << 4) + 12)
   end
   _collectcol, g_play_sfx = {14, 7}, g_sfx_lut.octo[i + 1]
  end
 end
 -- did we just get the last octogem? if so, process it and reset
 if (g_puzz_octogems == 8) do_key_swap(74,106,27, 28) g_puzz_octogems = 0

 -- is this a key? if we don't have one, go ahead and pick it up
 if _tile == 44 then
  if _obj.haskey then _destroy_obj = false else
   _obj.haskey = true
   _collectcol = {6, 13, 5}
  end
 end

 -- is this a key block? we can assume we let them through earlier
 if (_tile == 138) _obj.haskey = false

 -- fetch the previous tile
 local _oldx, _oldy = _obj.oldx, _obj.oldy
 local _prevtile = mget(_oldx + 32, _oldy)
 -- was the tile previous a slime trap?
 if _prevtile == 137 then
  -- unslime this spot and clear it for re-entry
  -- this just sets the tile ID to a clear spot
  place_puzz_tile(_oldx, _oldy, 160)
  mset(_oldx + 48, _oldy, 1)
  mset(_oldx + 32, _oldy, 1)
 end

 -- was the previous tile a cracked floor? if the cracked floor script ran, update the tile
 if (proc_cracked_floor(_oldx, _oldy)) _tile = mget(_x + 32, _y)

 -- are we on a conveyer? if so, overwrite new direction
 -- directions: 0 e, 1 n, 2 w, 3 s
 local _dir = -1
 for i=0,3 do
  if (_tile == 6 | i << 5) _dir = i
 end
 
 -- are we on an ice tile?
 if (_tile == 105) _dir = _obj.dir
 -- did we get a new direction?
 if (_dir != -1) g_new_dir = _dir
 g_puzz_on_convey = _dir != -1

 -- destroy floating object at this position
 if (_destroy_obj) add(g_obj_delete, _x << 4 | _y)

 -- are we on a floor portal?
 g_puzz_use_portal = false
 if _tile == 5 or _tile == 37 or _tile == 69 or _tile == 101 then
  -- delete portal, then find pair
  mset(_x + 32, _y, 1)
  local _pair_loc = find_tile_loc(_tile)
  if _pair_loc != nil then
   -- set our new position to where we're going
   _obj.oldx, _obj.oldy = _obj.x, _obj.y
   _obj.x, _obj.y = _pair_loc.x - 32, _pair_loc.y
   g_puzz_use_portal = true
  end
 end

 -- do we create collectible particles here?
 if (_collectcol != nil) part_create_item_grab(_xcenter, _ycenter, _collectcol)

 -- is this the end of this turn?
 --if not g_puzz_use_portal and not g_puzz_on_convey then
 --end
 
 -- coco note: this *could* be optimized, but let's keep the code readable unless we need those tokens
 -- did we overlap our own trail?
 if (mget(_obj.x + 48, _obj.y) & 2 == 2) player_destroy(_obj)
 -- process stuff that destroys stephanie
 if  
 -- did we step on a lava tile and aren't in the right state
  (_tile == 41 and _obj.pstate == 0) or
 -- did we step on an ice tile and aren't in the right state
  (_tile == 73 and _obj.pstate != 2) or
 -- did we step on a cracked floor that just broke?
  (_tile == 0) or
 -- did we step on a floor zapper on the wrong turn?
  (_tile == 39 and g_puzz_zapper_turn == 2) or -- cyan
  (_tile == 7 and g_puzz_zapper_turn == 1) or -- magenta
  (_tile == 71 and g_puzz_zapper_turn == 0) -- yellow
  then
  player_destroy(_obj, true)
  _doslime = false
 end

 -- put slime on the playfield here?
 if _doslime then
  g_level_touched += 1
  mset(_obj.x + 48, _obj.y, 2)
  local _dx, _dy = (_obj.x << 1) + 1, (_obj.y << 1) + 1
  put_x16_tile(_dx, _dy, 218 + (_obj.pstate << 1))
 end
end

function player_destroy(_obj, _kill)
 g_level_lose = true
 -- colors for normal, fire, ice
 local _t = str_to_table("13b49a5d6", 3)
 if _kill == true then 
  _obj.isdead = true
  local _col = _t[_obj.pstate + 1]
  part_create_slime_explode((_obj.x << 4) + 12, (_obj.y << 4) + 12, _col)
 end
end

function player_draw(_obj)
 -- if the player was destroyed by something, don't draw
 -- also don't draw if the player is in a floor portal
 -- or if lesbians are not allowed
 if (_obj.isdead or g_puzz_use_portal or not setting_get(6)) return

 local _dir, _x, _y, _offset, _dir = _obj.dir, _obj.x << 4, _obj.y << 4
 
 -- fire/ice states respectively
 if _obj.pstate == 1 then
  pal(3,8)
  pal(11,9)
 elseif _obj.pstate == 2 then
  pal(3,13)
  pal(11,6)
 end

 -- do animation?
 if _obj.anim < 1 then
  -- if on conveyer, use linear animation
  -- if not, use curved animation
  if g_puzz_on_convey then
   _offset = _obj.anim
  elseif _obj.anim < 0.5 then
   _offset = 0.5 + (cos(_obj.anim * 0.5) * -0.5)
  else
   _offset = 0.5 - (cos(_obj.anim * 0.5) * 0.5)
  end
  
  _x, _y = lerp(_obj.oldx << 4, _obj.x << 4, _offset), lerp(_obj.oldy << 4, _obj.y << 4, _offset)
  
 end
 
 -- do jiggle and positional offset
 _x += (-1 + rnd(3)) * _obj.jiggle + 8
 _y += (-1 + rnd(3)) * _obj.jiggle + 8
 
 local _xflip, _yflip = cos(_obj.dir >> 2) < 0, sin(_obj.dir >> 2) < 0
 local _xpos, _ypos = _xflip and _x or _x - 8, _yflip and _y or _y - 8
 if _obj.dir % 2 == 0 then
  spr(211, _xpos, _y + 7, 3, 1, _xflip)
  spr(211, _xpos, _y, 3, 1, _xflip, true)
 else
  spr(217, _x + 1, _ypos, 1, 3, false, _yflip)
  spr(217, _x + 8, _ypos, 1, 3, true, _yflip)
 end
 
 -- reset palette back to normal in case it was set
 pal()

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
 local _obj = g_object_list[1]
 clip()
 palt(0, false)
 spr(208, 24, 104, 3, 1)
 palt()

 -- does she have the key? if so, draw the extra circle
 if _obj.haskey then
  spr(144, 32, 104)
  spr(144, 39, 104, 1, 1, true)
 end
 
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
 if _obj.haskey then
  spr(145, 32, 104)
  spr(145, 39, 104, 1, 1, true)
 end

 -- get ready to draw her expression on
 local _eye_determined = (btn(4) or _obj.sprint) and g_puzz_on_convey == false -- >:3
 local _eye_blink = g_player_blink < 3 or g_level_win
 local _mouse_grin = _eye_determined -- sprinting
 local _is_win, _no_win, _spr = g_level_win, g_level_win == false

 -- eyes
  _spr = 215
 if (_eye_determined) _spr = 214
 if (_eye_blink or g_level_lose) _spr = 216
 spr(_spr, _is_win and 37 or 36, 104, 1, 1, _is_win)
 -- mouth
 _spr = 251
 if (_mouse_grin) _spr = 252
 if (g_level_lose) _spr = 160
 if (_is_win) _spr = 250
 spr(_spr, 40, 104)

 -- copy this sprite to the side angle
 -- roxy note: yes, the coordinates are wacky. it's fine
 for _x=0,23 do
  for _y=0,7 do
   sset(79 - _y, 104 + _x, sget(24 + _x, 104 + _y))
  end
 end
end