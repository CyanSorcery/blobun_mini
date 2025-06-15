-- object constructor
function obj_create(s)
 -- get the variables from the string
 -- format is type, x, y, spr spr
 local o = {
  type = subl(s, 1, 1),
  x = subl(s, 2, 1),
  y = subl(s, 3, 1),
  spr = subl(s, 4, 1, 1),
  anim = rnd(),
  spin = rnd()
 }
  -- when interacting with this object, this is used
 o.poskey = o.x << 4 | o.y

 -- if this is the player, add additional variables
 if o.type == 0 then
  o.startx, -- where the player started
  o.starty,
  o.poskey, -- reset this so it wont match (otherwise game can destroy stephanie for reals)
  o.dir, -- direction she faces
  o.anim, -- movement animation
  o.jiggle, -- little shake when player presses sprint
  o.sprint, -- current move is sprint
  o.pstate, -- current player state (normal, fire, ice)
  o.ismove, -- move is active
  o.oldx, -- during a move, where she's coming from
  o.oldy,
  o.startturnx, -- where she was at the start of her turn
  o.startturny,
  o.haskey, -- she currently is holding a generic key
  o.onconvey, -- she's on a conveyer belt of some kind
  o.inportal, -- she's in a floor portal
  o.blink, -- how long until she blinks
  o.octogems, -- how many octogems she's carrying
  o.coins, -- how many coins she's carrying
  o.nextdir, -- the next direction she'll go (input buffering)
  o.tilestouched, -- how many tiles she's touched (starts at 1 for her spawn tile)
  o.isdead, -- player was destroyed and shouldn't be drawn
  o.prevslimetrap, -- previous move was a slime trap
  o.prevcrackedfloor -- previous move was on a cracked floor
  = o.x, o.y, -1, 3, 1, 0, false, 0, false, o.x, o.y, o.x, o.y, false, false, false, 10, 0, 0, -1, 1, false, false, false
  o.onstep = player_step
  o.ondraw = player_draw
 else
 
  -- if this is an octogem, set the octo index and correct sprite
  if (o.type == 5) o.oct_ind = o.spr o.spr = 87

  -- if this is a floor portal, set destination coordinates
  if (o.type == 10) o.dst_x, o.dst_y = subl(s, 4, 0x1), subl(s, 5, 0x1)

  function o:onstep()
   -- is this a floating key?
   if self.type < 10 then
    self.anim += .02
    self.anim %= 1
    self.spin += .035
    self.spin %= 1
   end
  end

  function o:ondraw()
   local _w_x, _w_y = (self.x << 4) + 8, self.y << 4
   if self.type < 9 then
    -- only draw if this isn't an octogem, or if it is and is the correct index
    if self.oct_ind == nil or self.oct_ind == g_listo[1].octogems then
     local _y, _sx, _sy, _modx = _w_y + (sin(self.anim) * 2), (self.spr % 16) << 3, (self.spr \ 16) << 3, ceil(sin(self.spin * .5) * -8)
     if (_modx <= 3) rectfill(_w_x + 7, _y + 1, _w_x + 9, _y + 14, 7)
     sspr(_sx, _sy, 8, 16, _w_x + 9 - _modx, _y, _modx, 16)
     sspr(_sx, _sy, 8, 16, _w_x + 8, _y, _modx, 16, true)
    end
   -- is this the generic key?
   elseif self.type < 10 then
    spr(self.spr, _w_x + 4, _w_y + (sin(self.anim) * 2), 1, 2)
   end
   -- if here, not drawn
  end
 end

 return o
end