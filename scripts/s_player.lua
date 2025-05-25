function player_step(self)
 -- if lesbians aren't allowed, don't do this
 -- also don't if a menu is open right now
 --if (not setting_get(6) or count(g_menu) > 0) return

 self.blink -= 1
 if (self.blink <= 1) self.blink = 30 + flr(rnd(60))

 -- find out if the player has just pressed the button
 g_btn4_press = btn(4) and g_btn4_held == false
 g_btn4_held = btn(4)
 
 -- jiggle animation countdown
 self.jiggle = max(self.jiggle - .2, 0)

 -- do undo?
 --if (btnp(5) and not g_stage_win) perform_undo()

 -- do the move animation
 self.anim = min(self.anim + ((self.sprint or self.onconvey or self.inportal) and .2 or .1111), 1)
 
 -- allow input buffer?
 if self.anim >= .65 then
  local _t = {2, 0, 1, 3}
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
   -- do a check if this is solid or not. if we're on portal, we can move
   -- if sprite flag 5 is set, this is a floor tile we can move into
   local _can_move, _check, _chx, _chy = self.inportal, 16, self.x + cos(_new_dir >> 2), self.y + sin(_new_dir >> 2)
   if (self.onconvey--[[or setting_get(2)]]) _check = 18 -- allow for move on slime
   -- check the top left corner of the tile they're moving into
   -- next block is ice block and they're in fire state OR next block is lock and they have a key OR check if next tile is slimed already (or is otherwise passable)
   local _nextblock = mget((_chx << 1) + 2, (_chy << 1) + 1)
   if (_nextblock == 121 and self.pstate == 1 or _nextblock == 51 and self.haskey or fget(_nextblock) & _check > 0) _can_move = true

   --if (_nextblock == 10 and self.pstate == 1 or _nextblock == 138 and self.haskey or mget(_chx + 48, _chy) & _check > 0) _can_move = true

   -- reset the buffered input and face us in this direction
   self.nextdir, self.dir = -1, _new_dir
   -- can we actually move here?
   if _can_move and not g_stage_lose then

    g_p_started = true
   
    -- record the playfield before making a move?
    if not self.inportal and not self.onconvey then
     -- update the end turn position for the next undo
     self.startturnx, self.startturny = self.x, self.y
     --add_undo()
     
     -- increment the floor zappers
     g_p_zap_turn += 1
     g_p_zap_turn %= 3
     g_p_updt_zap = true
    end

    -- reset move factor, set if move is sprint, set she's moving
    self.anim, self.sprint, self.ismove = 0, tonum(--[[setting_get(3)]]false) ^^ tonum(btn(4)) == 1, true
    -- set where she's moving from
    if (self.inportal == false) self.oldx, self.oldy = self.x, self.y
    if (_new_dir >= 0) self.x, self.y = _chx, _chy

   end
  end
 end

 -- have we won?
 if g_stage_win == false and self.tilestouched >= g_p_sst.s_tiles then
  g_stage_win = true
  -- if the player time is lower than the record, store it
  --if (g_p_time < dget(g_p_fst.l_saveslot)) dset(g_p_fst.l_saveslot, g_p_time) g_new_time = true
 end

 -- if we've won, make stephanie face down
 if (g_stage_win) self.dir = 3
 
 -- timer
 --if (g_p_started and not g_stage_win) g_p_time = min(g_p_time + (time() - g_time), 599.999)


end

function player_end_move(self)

end

function player_draw(self)
 -- if the player was destroyed by something, don't draw
 -- also don't draw if the player is in a floor portal
 -- or if lesbians are not allowed
 if (self.isdead or self.inportal --[[or not setting_get(6)]]) return

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