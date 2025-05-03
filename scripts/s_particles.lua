-- wrapper function for creating particles
function part_create(_x, _y, _spd, _dir, _spr1, _spr2, _col, _time)
 add(g_particles, {x=_x, y=_y, spd = _spd, dir=_dir, spr1=_spr1, spr2=_spr2, col=_col,time_max=_time,time=_time})
end

function part_create_slime_explode(_x, _y, _col)
 local _xfin, _yfin, _deg
 for i=0,0.9,0.1 do
  _xfin, _yfin, _deg = _x + (cos(i) * 4), _y + (sin(i) * 4), i * 360
  part_create(_xfin, _yfin, 0.9, _deg, 152, 155, rnd(_col), 12)
  part_create(_xfin, _yfin, 1.8, _deg, 152, 155, rnd(_col), 8)
 end
end

function part_create_octogem(_x1, _y1, _x2, _y2)
 local _xfin, _yfin
 for i=0,0.8, 0.2 do
  part_create(lerp(_x1, _x2, i), lerp(_y1, _y2, i), 0, 0, 152, 155, 14, lerp(5, 12, i))
 end
 part_create_item_grab(_x2, _y2, {14, 7})
end
function part_create_item_grab(_x, _y, _col)
 for i=0,0.9,0.1 do
  part_create(_x + (cos(i) * 4), _y + (sin(i) * 4), 0.8, i * 360, 152, 155, rnd(_col), 8)
 end
end

--[[
function part_create_sparkle_raise(_x, _y)
 part_create(_x, _y, 0.5, 90, 168, 171, 7, 20)
end
]]

-- sphere 152, 155
-- sparkle 168, 171

function proc_particles()
 -- get count of particles
 local _particles = g_particles
 local _count, i, _part, _factor = count(_particles), 1
 while (i <= _count) do
  _part = _particles[i]

  -- apply the speed and direction
  _factor = _part.dir / 360
  _part.x += _part.spd * cos(_factor)
  _part.y += _part.spd * sin(_factor)

  -- subtract off the time and, if it's done, destroy it
  _part.time -= 1
  if (_part.time <= 0) then
   deli(_particles, i)
   _count -= 1
  else i += 1
  end
 end
end

function draw_particles()
 -- get count of particles
 local _particles = g_particles
 local _count, _part = count(_particles)
 for i=1,_count do
  _part = _particles[i]
  pal(7, _part.col)
  spr(flr(lerp(_part.spr2, _part.spr1, _part.time/_part.time_max) + 0.5), _part.x, _part.y)

 end
 pal()
end