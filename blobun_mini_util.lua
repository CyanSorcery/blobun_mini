
-- assumed first tile is raised, second is lowered
function do_key_swap(_src_tile, _dst_tile, _src_tl, _dst_tl)
 local _tile, _tgt_tile, _tgt_tl, _tx, _ty, _block, _doflip

 for _x = 32,48 do
  for _y = 0,16 do
   _tgt_tile = nil
   _tile = mget(_x, _y)
   
   -- only do this if this tile hasn't been slimed
   if (mget(_x + 16, _y) & 2 == 0) then
    if (_tile == _src_tile) then
     _tgt_tile, _tgt_tl, _block = _dst_tile, _dst_tl, 1
    elseif (_tile == _dst_tile) then
     _tgt_tile, _tgt_tl, _block = _src_tile, _src_tl, 0
    end
 
    -- swap the tile ids in the workspace as well as the visuals
    if (_tgt_tile != nil) then
     _doflip = _dst_tl < 56
     mset(_x, _y, _tgt_tile)
     mset(_x + 16, _y, _block)
     _tx, _ty = ((_x - 32) << 1) + 1, (_y << 1) + 1
     mset(_tx, _ty, _doflip and 253 or _tgt_tl)
     mset(_tx + 1, _ty, _doflip and _tgt_tl or _tgt_tl + 1)
     mset(_tx, _ty + 1, _doflip and 253 or _tgt_tl + 16)
     mset(_tx + 1, _ty + 1, _doflip and _tgt_tl + 16 or _tgt_tl + 17)
    end
   end
  end
 end
end


-- from https://www.lexaloffle.com/bbs/?tid=40577
function lerp(a,b,t)
	return a+(b-a)*t
end

function add_undo()
 local _undo = {}
 local l_object_list, l_count = g_object_list, count(g_object_list)
 -- copy all object references
 _undo.obj_list = {}
 for i=1,l_count do
  _undo.obj_list[i] = l_object_list[i]
 end
 -- store player parameters
 local _player = l_object_list[1]
 _undo.player_x, _undo.player_y, _undo.player_dir, _undo.player_pstate, _undo.player_coins, _undo.tiles_touched, _undo.player_octogems, _undo.player_haskey, _undo.zapper_turn = _player.startturnx, _player.startturny, _player.dir, _player.pstate, g_puzz_coins, g_level_touched, g_puzz_octogems, _player.haskey, g_puzz_zapper_turn
 add(g_undo_queue, _undo)
 -- store playfield
 _undo.playfield_walls, _undo.playfield_slime, _undo.playfiend_main= pack_undo_tiles(32, 16), pack_undo_tiles(48, 16), pack_undo_tiles(0, 32)
 -- if undo list has too many entries, delete the first one
 if (count(g_undo_queue) > 20) deli(g_undo_queue, 1)
end

function perform_undo()
 -- find out the top undo and, if it's not the last one, delete it
 local _count = count(g_undo_queue)
 local _undo = g_undo_queue[_count]
 if (_count > 1) deli(g_undo_queue)
 -- replace object list
 g_object_list = _undo.obj_list
 -- reset player
 local _player = g_object_list[1]
 _player.x, _player.y, _player.oldx, _player.oldy, _player.anim, _player.dir, _player.pstate, g_puzz_coins, g_level_touched, g_puzz_octogems, _player.haskey, g_puzz_zapper_turn = _undo.player_x, _undo.player_y, _undo.player_x, _undo.player_y, 1, _undo.player_dir, _undo.player_pstate, _undo.player_coins, _undo.tiles_touched, _undo.player_octogems, _undo.player_haskey, _undo.zapper_turn
 -- reset the buffered direction and lose state, and redraw the coins
 g_new_dir, g_level_lose, _player.isdead, g_redraw_coin, g_redraw_zappers = -1, false, false, true, true
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

-- coco note: this *may* cause an issue if there's a lot of contiguous floor tiles
function proc_cracked_floor(_x, _y)
 -- if the tile at this position isn't a cracked floor, give up
 if (mget(_x + 32, _y) != 9) return false

 -- unslime this tile, turn it into a pit and mark it as a wall
 place_puzz_tile(_x, _y, 192)
 mset(_x + 48, _y, 0)
 mset(_x + 32, _y, 0)

 --check adjacent tiles
 proc_cracked_floor(_x - 1, _y)
 proc_cracked_floor(_x + 1, _y)
 proc_cracked_floor(_x, _y - 1)
 proc_cracked_floor(_x, _y + 1)
 -- return that we did something
 return true
end