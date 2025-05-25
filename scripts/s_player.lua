function player_step(self)
 self.blink -= 1
 if (self.blink <= 1) self.blink = 30 + flr(rnd(60))
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