-- object constructor
function obj_create(_str)
 -- get the variables from the string
 -- format is type, x, y, spr spr
 local _obj = {
  type = subl(_str, 1, 0x1),
  x = subl(_str, 2, 0x1),
  y = subl(_str, 3, 0x1),
  spr = subl(_str, 4, 0x1, 1),
  anim = rnd(),
  spin = rnd()
 }
  -- when interacting with this object, this is used
 _obj.poskey = _obj.x << 4 | _obj.y

 -- if this is the player, add additional variables
 if _obj.type == 0 then
  _obj.startx, -- where the player started
  _obj.starty,
  _obj.poskey, -- reset this so it wont match (otherwise game can destroy stephanie for reals)
  _obj.dir, -- direction she faces
  _obj.anim, -- movement animation
  _obj.jiggle, -- little shake when player presses sprint
  _obj.sprint, -- current move is sprint
  _obj.pstate, -- current player state (normal, fire, ice)
  _obj.ismove, -- move is active
  _obj.oldx, -- during a move, where she's coming from
  _obj.oldy,
  _obj.startturnx, -- where she was at the start of her turn
  _obj.startturny,
  _obj.haskey, -- she currently is holding a generic key
  _obj.onconvey, -- she's on a conveyer belt of some kind
  _obj.inportal, -- she's in a floor portal
  _obj.blink, -- how long until she blinks
  _obj.octogems, -- how many octogems she's carrying
  _obj.coins, -- how many coins she's carrying
  _obj.nextdir, -- the next direction she'll go (input buffering)
  _obj.tilestouched, -- how many tiles she's touched (starts at 1 for her spawn tile)
  _obj.isdead, -- player was destroyed and shouldn't be drawn
  _obj.prevslimetrap, -- previous move was a slime trap
  _obj.prevcrackedfloor -- previous move was on a cracked floor
  = _obj.x, _obj.y, -1, 3, 1, 0, false, 0, false, _obj.x, _obj.y, _obj.x, _obj.y, false, false, false, 10, 0, 0, -1, 1, false, false, false
  _obj.onstep = player_step
  _obj.ondraw = player_draw
 else
 
  -- if this is an octogem, set the octo index and correct sprite
  if (_obj.type == 5) _obj.oct_ind = _obj.spr _obj.spr = 87

  -- if this is a floor portal, set destination coordinates
  if (_obj.type == 10) _obj.dst_x, _obj.dst_y = subl(_str, 4, 0x1), subl(_str, 5, 0x1)

  function _obj:onstep()
   -- is this a floating key?
   if self.type < 10 then
    self.anim += .02
    self.anim %= 1
    self.spin += .035
    self.spin %= 1
   end
  end

  function _obj:ondraw()
   local _w_x, _w_y = (self.x << 4) + 8, self.y << 4
   if self.type < 9 then
    -- only draw if this isn't an octogem, or if it is and is the correct index
    if self.oct_ind == nil or self.oct_ind == g_list_obj[1].octogems then
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
 end

 return _obj
end