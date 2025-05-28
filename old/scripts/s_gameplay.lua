


function draw_arrows()
 local _dir
 for _arrow in all(g_a_list) do
  _dir = _arrow.dir
  spr(_dir % 2 == 0 and 254 or 255, _arrow.x, _arrow.y, 1, 1, cos(_dir >> 2) < 0, sin(_dir >> 2) >= 0)
 end

end


-- this adds a hint arrow on the floor
-- 0: right, 1: up, 2: left, 3: down
function add_hint_arrow(_x, _y, _dir)
 add(g_a_list, {
  dir=_dir,
  x=(_x << 4) + 12,
  y=(_y << 4) + 12
 })
end
