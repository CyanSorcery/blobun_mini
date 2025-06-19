function player_step(self)
 -- if lesbians aren't allowed, don't do this
 -- also don't if a menu is open right now
 if (not setting_get(6) or count(g_menu) > 0) return

 self.blink -= 1
 if (self.blink <= 1) self.blink = 30 + flr(rnd(60))

 -- find out if the player has just pressed the button
 g_btn4_press = btn(4) and g_btn4_held == false
 g_btn4_held = btn(4)
 
 -- jiggle animation countdown
 self.jiggle = max(self.jiggle - .2, 0)

 -- do undo?
 if (btnp(5) and not g_stage_win) perform_undo()

 -- do the move animation
 self.anim = min(self.anim + ((self.sprint or self.onconvey or self.inportal) and .2 or .1111), 1)
 
 -- allow input buffer?
 if self.anim >= .65 then
  local _t = str2tbl("2013")
  for i=0,3 do
   if (btn(i)) self.nextdir = _t[i + 1]
  end
 end
 
 -- fix fractional precision errors
 if self.anim + .001 >= 1 and not g_stage_win and not g_stage_lose then
  -- did she just stop moving?
  if (self.ismove) player_end_move(self)

  -- sprint jiggle?
  if (g_btn4_press) self.jiggle = 1

  -- move her around the playfield?
  self.sprint = false
  local _new_dir = self.nextdir
  if _new_dir != -1 or self.inportal then
   -- prevent bug where you can come out of the portal 1 tile over in the held direction
   if (self.inportal) _new_dir = -1
   -- do a check if this is solid or not. if we're on portal, we can move
   -- if sprite flag 5 is set, this is a floor tile we can move into
   local _can_move, _check, _chx, _chy = self.inportal, 16, self.x + cos(_new_dir >> 2), self.y + sin(_new_dir >> 2)
   if (self.onconvey or setting_get(2)) _check = 18 -- allow for move on slime
   -- check the top left corner of the tile they're moving into
   -- next block is ice block and they're in fire state OR next block is lock and they have a key OR check if next tile is slimed already (or is otherwise passable)
   local _nextblock = mget((_chx << 1) + 2, (_chy << 1) + 1)
   if (_nextblock == 121 and self.pstate == 1 or _nextblock == 51 and self.haskey or fget(_nextblock) & _check > 0) _can_move = true

   -- reset the buffered input and face us in this direction
   self.nextdir, self.dir = -1, _new_dir
   -- can we actually move here?
   if _can_move and not g_stage_lose then

    g_p_started = true

    -- if no sfx is playing, and we're not on a conveyer, play the move sound
    if (g_play_sfx == nil and stat(49) == -1 and not self.onconvey) g_play_sfx = -3580
   
    -- record the playfield before making a move?
    if not self.inportal and not self.onconvey then
     -- update the end turn position for the next undo
     self.startturnx, self.startturny = self.x, self.y
     add_undo()
     
     -- increment the floor zappers
     g_p_zap_turn += 1
     g_p_zap_turn %= 3
     g_p_updt_zap = true
    end

    -- reset move factor, set if move is sprint, set she's moving
    self.anim, self.sprint, self.ismove = 0, tonum(setting_get(3)) ^^ tonum(btn(4)) == 1, true
    -- set where she's moving from
    if (self.inportal == false) self.oldx, self.oldy = self.x, self.y
    if (_new_dir >= 0) self.x, self.y = _chx, _chy

   end
  end
 end

 -- have we won?
 if g_stage_win == false and self.tilestouched >= g_tile_count then
  g_stage_win, g_play_sfx = true, -3053
  -- if the player time is lower than the record, store it
  if (g_p_time < dget(g_p_sst.s_saveslot)) dset(g_p_sst.s_saveslot, g_p_time) g_p_new_time = true
 end

 -- if we've won, make stephanie face down
 if (g_stage_win) self.dir = 3
 
 -- timer
 if (g_p_started and not g_stage_win) g_p_time = min(g_p_time + (time() - g_time), 599.999)


end

function player_end_move(self)
 -- mark turn as finished
 self.ismove = false
 
 -- figure out what tile we're on, and if we should destroy the object on this tile
 local _x, _y, _oldx, _oldy, _destroy_obj, _doslime = self.x, self.y, (self.oldx << 1) + 2, (self.oldy << 1) + 1, true, true
 
 -- if the previous tile was a cracked floor, process it
 if (self.prevcrackedfloor) tile_copy(96, 18, _oldx - 1, _oldy) g_tile_count -= proc_cracked_floor(_oldx, _oldy) self.tilestouched -= 1 g_play_sfx = -3258 self.prevcrackedfloor = false
 
 local _tile, _prevtile, _poskey, _tcp_dx, _tcp_dy, _visx, _visy, _collision_obj, _partcol, _ppartcol = mget((_x << 1) + 2, (_y << 1) + 1), mget(_oldx, _oldy), _x << 4 | _y, (_x << 1) + 1, (_y << 1) + 1, (_x << 4) + 12, _y << 4

 -- if we're on a water tile and are in the ice state, treat as ice floor
 if (_tile \ 16 == 12 and self.pstate == 2) _tile, g_play_sfx = 123, -3452
 
 -- heart
 if (_tile == 52) tile_swap(19, 20, 3, 4) g_play_sfx, _partcol = -349, "78e"
 -- diamond
 if (_tile == 53) tile_swap(21, 22, 35, 36) g_play_sfx, _partcol = -349, "73b"
 -- triangle
 if (_tile == 54) tile_swap(23, 24, 67, 68) g_play_sfx, _partcol = -349, "7dc"
 -- coins
 if _tile == 55 then
  self.coins += 1
  g_play_sfx, _partcol = -2042, "49a"
  if self.coins == 3 then
   self.coins, g_play_sfx = 0, -349
   tile_swap(25, 26, 99, 100)
  end
  g_p_updt_coin = true;
 end

 -- was the previous tile a slime trap?
 if (self.prevslimetrap) tile_copy(126, 26, _oldx - 1, _oldy) g_play_sfx = -3452

 -- are we on a slime trap right now?
 self.prevslimetrap = _tile == 48

 -- states: 0 normal, 1 fire, 2 ice
 for i=0,2 do
  if (_tile == 80 + i) _ppartcol = g_pal_state_part[i + 1] self.pstate, g_play_sfx = i, g_sfx_pstate[i + 1]
 end



 -- octogems
 for i=0,7 do
  if _tile == 56 + i then
   -- this allows the gem to show up in an already touched tile
   -- if it hadn't spawned there yet, letting the player know they goofed
   if self.octogems == i then
    self.octogems += 1
    g_play_sfx = g_sfx_octo[i + 1]
    -- find next octogem
    for _o in all(g_list_obj) do
     if (_o.oct_ind == self.octogems) part_create_octogem(_visx, _visy + 6, (_o.x << 4) + 12, (_o.y << 4) + 6)
    end
   else
    _destroy_obj=false
   end
  end
 end
 -- was that the last octogem?
 if (self.octogems == 8) tile_swap(27, 28, 74, 106) self.octogems = 0

 -- generic key?
 if (_tile == 18) if self.haskey then _destroy_obj=false else self.haskey, _partcol, g_play_sfx = true, "67", -2042 end

 -- if this is a key block, take their key away (passage into this block is checked elsewhere)
 if (_tile == 51) self.haskey, g_play_sfx = false, -349

 -- are we on a cracked floor right now?
 if (_tile == 125 or _tile == 127) self.prevcrackedfloor, g_play_sfx = true, -3326

 -- did we just melt an ice block?
 if (_tile == 121) g_play_sfx = g_sfx_pstate[2]

 -- are we on a conveyer? if so, overwrite new direction
 local _dir = -1
 for i=0,3 do
  if (_tile == 113 + (i << 1)) _dir = i
 end
 -- are we on an ice tile?
 if (_tile == 123) _dir = self.dir
 -- enforce the new direction?
 if (_dir != -1) self.nextdir = _dir
 self.onconvey = _dir != -1

 -- fetch and then destroy object at this position
 for i,_obj in pairs(g_list_obj) do
  if _obj.poskey == _poskey then 
   _collision_obj = _obj
   if (_destroy_obj) deli(g_list_obj, i)
   break
  end
 end

 -- are we on a floor portal? don't process it though if we're *in* the portal
 if self.inportal then
  self.inportal, _ppartcol = false, g_pal_state_part[self.pstate + 1]
 else
  for i=0,6,2 do
   if _tile == 89 + i then
    -- slime this tile
    tile_copy(126, self.pstate << 1, _tcp_dx, _tcp_dy)
    -- set our new position
    self.oldx, self.oldy, self.inportal, g_play_sfx, self.x, self.y = _x, _y, true, -2394, _collision_obj.dst_x, _collision_obj.dst_y
   end
  end
 end

 -- did we step on an ice tile in the fire state
 if (_tile == 123 and self.pstate == 1) _tile = 192 tile_copy(104, 18, _tcp_dx, _tcp_dy)

 -- did we overlap our own trail? this (vaguely) captures all slime tiles
 if (_tile > 208) player_destroy(self) _doslime = false

 -- process stuff that destroys stephanie
 if  
 -- did we step on a lava tile and aren't in the right state
  _tile \ 16 == 11 and self.pstate == 0 or
 -- did we step on an water tile (if we're in ice state, the tile is pre-converted above)
  _tile \ 16 == 12 or
 -- did we step on a cracked floor that just broke?
  _tile == 50 or
 -- did we step on a floor zapper on the wrong turn?
  _tile == 29 and g_p_zap_turn == 0 or -- cyan
  _tile == 30 and g_p_zap_turn == 1 or -- magenta
  _tile == 31 and g_p_zap_turn == 2 -- yellow
  then
  player_destroy(self, true)
 elseif _doslime then
  self.tilestouched += 1
  tile_copy(126, self.pstate << 1, _tcp_dx, _tcp_dy)
 end

 -- make particles?
 if (_partcol != nil) part_create_item_grab(_visx, _visy + 8, str2tbl(_partcol))
 if (_ppartcol != nil) part_create_slime_explode(_visx, _visy + 12, _ppartcol)

end

function player_destroy(self, _kill)
 g_stage_lose = true
 if (_kill) g_play_sfx = -4088 self.isdead = true part_create_slime_explode((self.x << 4) + 12, (self.y << 4) + 12, g_pal_state_part[self.pstate + 1])
end

function player_draw(self)
 -- if the player was destroyed by something, don't draw
 -- also don't draw if the player is in a floor portal
 -- or if lesbians are not allowed
 if (self.isdead or self.inportal or not setting_get(6)) return

 local _dir, _x, _y, _anim, _offset, _dir = self.dir, self.x << 4, self.y << 4, self.anim
 
 -- fire/ice states respectively
 if (self.pstate == 1) pal(3,8) pal(11,9)
 if (self.pstate == 2) pal(3,13) pal(11,6)

 -- do animation?
 if _anim < 1 then
  -- if on conveyer, use linear animation
  -- if not, use curved animation
  _offset = self.onconvey and _anim or .5 + cos(_anim * .5 * sgn(_anim - .5)) * -.5
  
  _x, _y = lerp(self.oldx << 4, self.x << 4, _offset), lerp(self.oldy << 4, self.y << 4, _offset)
  
 end
 
 -- do jiggle and positional offset
 _x += (-1 + rnd(3)) * self.jiggle + 8
 _y += (-1 + rnd(3)) * self.jiggle + 8
 
 local _xflip, _yflip = cos(self.dir >> 2) < 0, sin(self.dir >> 2) < 0
 local _xpos, _ypos = _xflip and _x or _x - 8, _yflip and _y or _y - 8
 if self.dir % 2 == 0 then
  spr(211, _xpos, _y + 7, 3, 1, _xflip)
  spr(211, _xpos, _y, 3, 1, _xflip, true)
 else
  spr(217, _x + 1, _ypos, 1, 3, false, _yflip)
  spr(217, _x + 8, _ypos, 1, 3, true, _yflip)
 end
 
 -- reset palette back to normal in case it was set
 pal()

end