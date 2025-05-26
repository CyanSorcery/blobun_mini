


function add_undo()
 local _undo = {}
 -- copy all object references
 _undo.obj_list = {}
 for _k,_v in pairs(g_o_list) do
 _undo.obj_list[_k] = g_o_list[_k]
 end

 -- store player parameters
 local _player = g_o_list[1]
 _undo.player_x, _undo.player_y, _undo.player_dir, _undo.player_pstate, _undo.player_coins, _undo.tiles_touched, _undo.player_octogems, _undo.player_haskey, _undo.zapper_turn = _player.startturnx, _player.startturny, _player.dir, _player.pstate, g_p_coins, g_s_touched, g_p_octog, _player.haskey, g_p_zap_turn
 add(g_u_list, _undo)
 -- store playfield
 _undo.playfield_walls, _undo.playfield_slime, _undo.playfiend_main= pack_undo_tiles(32, 16), pack_undo_tiles(48, 16), pack_undo_tiles(0, 32)
 -- if undo list has too many entries, delete the first one
 if (count(g_u_list) > 20) deli(g_u_list, 1)
end

function perform_undo()
 -- find out the top undo and, if it's not the last one, delete it
 local _count = count(g_u_list)
 if (_count == 0) return -- unlikely scenario, but prevents crash
 local _undo = g_u_list[_count]
 if (_count > 1) deli(g_u_list)
 -- replace object list
 g_o_list = _undo.obj_list
 -- reset player
 local _player = g_o_list[1]
 _player.x, _player.y, _player.oldx, _player.oldy, _player.anim, _player.dir, _player.pstate, g_p_coins, g_s_touched, g_p_octog, _player.haskey, g_p_zap_turn = _undo.player_x, _undo.player_y, _undo.player_x, _undo.player_y, 1, _undo.player_dir, _undo.player_pstate, _undo.player_coins, _undo.tiles_touched, _undo.player_octogems, _undo.player_haskey, _undo.zapper_turn
 -- reset the buffered direction and lose state, and redraw the coins
 g_new_dir, g_level_lose, _player.isdead, g_updt_coin, g_updt_zap, _player.ismove = -1, false, false, true, true, false
 -- restore the playfield
 unpack_undo_tiles(_undo.playfield_walls, 32, 16)
 unpack_undo_tiles(_undo.playfield_slime, 48, 16)
 unpack_undo_tiles(_undo.playfiend_main, 0, 32)
end

-- create table of tiles from how the playfield is right now
function pack_undo_tiles(_offset_x, _size)
 local _t = {}
 for _x=0,_size do
  _t[_x] = {}
  for _y=0,_size do
   _t[_x][_y] = mget(_x + _offset_x, _y)
  end
 end
 return _t
end
-- unpack table back to the playfield
function unpack_undo_tiles(_t, _offset_x, _size)
 for _x=0,_size do
  for _y=0,_size do
   mset(_x + _offset_x, _y, _t[_x][_y])
  end
 end
end


-- tile that's laid out as a block on the tilesheet
function put_x16_tile(_x, _y, _tile)
 put_tiles_fin(_x, _y, _tile, _tile + 1, _tile + 16, _tile + 17)
end
-- tile that's meant to be mirrored
function put_mirrored_tile(_x, _y, _tile)
 put_tiles_fin(_x, _y, 253, _tile, 253, _tile + 16)
end
-- fill all four tiles with the given tile
function put_1x4_tile(_x, _y, _tile)
 put_tiles_fin(_x, _y, _tile, _tile, _tile, _tile)
end
-- wrapper function for the above to save tokens
function put_tiles_fin(_x, _y, _tl, _tr, _bl, _br)
 mset(_x, _y, _tl)
 mset(_x + 1, _y, _tr)
 mset(_x, _y + 1, _bl)
 mset(_x + 1, _y + 1, _br)
end

function draw_wavy_text(_str, _x, _y, _col, _px)
 local _len = #_str
 for i=1,_len do
  _x = print(sub(_str, i, i), _x, _y + (sin(g_wavy_anim + (i / 10)) * _px), _col)
 end
end
function print_shd(_str, _x, _y, _col, _bg)
 ?_str, _x + 1, _y + 1, _bg
 return print(_str, _x, _y, _col)
end

function format_time(_num)
 -- mika note: we add to the time to guarantee 0's in the padding
 return (_num >= 60 and flr(_num / 60)..":" or "")..sub(flr(_num % 60) + 100, 2, 3).."."..sub(flr((_num % 1) * 1000) + 1000, 2, 4)
end
