function add_undo()
 local _undo = {}
 -- copy all references
 _undo.obj_list, _undo.player, _undo.g_p_zap_turn, _undo.g_tile_count, _undo.playfield = tbl_copy(g_list_obj), tbl_copy(g_list_obj[1]),g_p_zap_turn, g_tile_count,pack_undo_tiles()
 -- add this to the undo queue
 add(g_list_undo, _undo)
 -- if there's too many undos, remove one
 if (count(g_list_undo) > 60) deli(g_list_undo, 1)
end

function perform_undo()
 -- find out the top undo and, if it's not the last one, delete it
 local _count = count(g_list_undo)
 if (_count == 0) return -- unlikely scenario, but prevents crash
 local _undo = g_list_undo[_count]
 if (_count > 0) deli(g_list_undo)
 -- replace object list and player object
 g_list_obj     = _undo.obj_list
 g_list_obj[1]  = _undo.player
 -- replace any other variables
 g_p_zap_turn, g_tile_count = _undo.g_p_zap_turn,_undo.g_tile_count
 -- reset these variables
 local _player = g_list_obj[1]
 _player.nextdir, _player.isdead, _player.ismv, g_stage_lose, g_p_updt_coin, g_p_updt_zap = -1, false, false, false, true, true
 -- put the playfield back how it was
 unpack_undo_tiles(_undo.playfield)
end

function pack_undo_tiles()
 -- ashe note: this function is hard coded to take way more than most puzzles
 -- will ever need. however, we want consistency in how big undos are
 local _t = {}
 for _x=0,34 do
  _t[_x] = {}
  for _y=0,31 do
   _t[_x][_y] = mget(_x, _y)
  end
 end
 return _t
end

function unpack_undo_tiles(_t)
 for _x=0,34 do
  for _y=0,31 do
   mset(_x, _y, _t[_x][_y])
  end
 end
end

function tbl_copy(_t)
 local _d = {}
 for _k,_v in pairs(_t) do
  _d[_k] = _v
 end
 return _d
end

function subl(_str, _offset, _flag, _len)
 return tonum(sub(_str, _offset, _offset + (_len and _len or 0)), _flag)
end

function str2tbl2d(_str, _delimiter)
 local _t, _at, _offset = {}, #_str \ _delimiter
 for _aa=1,_at do
  _offset = (_aa - 1) * _delimiter
  _t[_aa] = str2tbl(sub(_str, _offset + 1, _offset + _delimiter))
 end
 return _t
end
function str2tbl(_str)
 local _t = {}
 for i=1,#_str do
  add(_t, subl(_str, i, 0x1))
 end
 return _t
end

-- from https://www.lexaloffle.com/bbs/?tid=40577
function lerp(a,b,t)
	return a+(b-a)*t
end

function tile_copy(_srcx, _srcy, _dstx, _dsty)
 for _x=0,1 do
  for _y=0,1 do
   -- prevent overflow into sprite memory
   if (_dsty + _y < 32) mset(_dstx + _x, _dsty + _y, mget(_srcx + _x, _srcy + _y))
  end
 end
end

-- source and destination top right tile, source puzzle ID, dest puzzle ID
function tile_swap(_str, _dtr, _smp, _dmp)
 local _w, _h, _smp_x, _smp_y, _dmp_x, _dmp_y, _tile = g_p_sst.s_w << 1, g_p_sst.s_h << 1, (48 + _smp \ 16) << 1, (_smp % 16) << 1, (48 + _dmp \ 16) << 1, (_dmp % 16) << 1
 for _x=1,_w,2 do
  for _y=1,_h,2 do
   _tile = mget(_x + 1, _y)
   if _tile == _str then
    tile_copy(_dmp_x, _dmp_y, _x, _y)
   elseif _tile == _dtr then
    tile_copy(_smp_x, _smp_y, _x, _y)
   end
  end
 end
end

-- coco note: this *may* cause an issue if there's a lot of contiguous floor tiles
function proc_cracked_floor(_x, _y)
 local _tile = mget(_x, _y)
 if (_tile != 125 and _tile != 127) return 0

 -- turn this tile into a pit, and then check adjacent tiles
 tile_copy(126, 24, _x - 1, _y)
 
 -- return how many tiles were removed
 return 1 + proc_cracked_floor(_x - 2, _y)
        + proc_cracked_floor(_x + 2, _y)
        + proc_cracked_floor(_x, _y - 2)
        + proc_cracked_floor(_x, _y + 2)

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
