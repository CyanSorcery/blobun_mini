-- object constructor
function obj_create(_str)
 -- get the variables from the string
 local _obj = {
  type = subl(_str, 1, 0x1),
  x = subl(_str, 2, 0x1),
  y = subl(_str, 3, 0x1),
  spr = subl(_str, 4, 0x1, 1),
  -- when interacting with this object, this is used
  poskey = sub(_str, 2, 3),
  anim = rnd(),
  spin = rnd()
 }

 -- if this is an octogem, set the octo index and correct sprite
 if (_obj.type == 5) _obj.oct_ind = _obj.spr _obj.spr = 87

 function _obj:onstep()
  -- is this the player?
  if self.type == 0 then
   -- tmp
   self.anim = 0
  -- is this a floating key?
  elseif self.type < 10 then
   self.anim += .02
   self.anim %= 1
   self.spin += .035
   self.spin %= 1
  end
 end

 function _obj:ondraw()
  local _w_x, _w_y = (self.x << 4) + 8, self.y << 4
  -- is this the player?
  if self.type == 0 then
   -- tmp
   ?"plyr", _w_x, _w_y + 8, 7
  -- is this a floating key that spins?
  elseif self.type < 9 then
   -- only draw if this isn't an octogem, or if it is and is the correct index
   if self.oct_ind == nil or self.oct_ind == g_p_octogems then
    local _y, _sx, _sy, _modx = _w_y + (sin(self.anim) * 2), (self.spr % 16) << 3, (self.spr \ 16) << 3, ceil(sin(self.spin * .5) * -8)
    if (_modx <= 3) rectfill(_w_x + 7, _y + 1, _w_x + 9, _y + 14, 7)
    sspr(_sx, _sy, 8, 16, _w_x + 9 - _modx, _y, _modx, 16)
    sspr(_sx, _sy, 8, 16, _w_x + 8, _y, _modx, 16, true)
   end
  -- is this the generic key?
  elseif self.type < 10 then
   spr(self.spr, _w_x + 4, _w_y + (sin(self.anim) * 2), 1, 2)
  -- if it's not the above, it's invisible so don't draw it
  --[[else
   -- tmp, draw the type
   ?self.type, (self.x << 4) + 8, (self.y << 4) + 8, 7]]
  end
 end

 return _obj
end