function subl(_str, _offset, _flag, _len)
 return tonum(sub(_str, _offset, _offset + (_len and _len or 0)), _flag)
end

function str2tbl(_str, _delimiter)
 local _t, _at, _offset = {}, #_str \ _delimiter
 for _aa=1,_at do
  _t[_aa] = {}
  _offset = (_aa - 1) * _delimiter
  for i=1,_delimiter do
   _offset += 1
   add(_t[_aa], subl(_str,_offset, 0x1, 0))
  end
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
   mset(_dstx + _x, _dsty + _y, mget(_srcx + _x, _srcy + _y))
  end
 end
end

-- source and destination top right tile, source puzzle ID, dest puzzle ID
function tile_swap(_str, _dtr, _smp, _dmp)
 local _w, _h, _smp_x, _smp_y, _dmp_x, _dmp_y, _tile = g_p_sst.s_width << 1, g_p_sst.s_height << 1, (48 + _smp \ 16) << 1, (_smp % 16) << 1, (48 + _dmp \ 16) << 1, (_dmp % 16) << 1
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
 if (_tile != 125 and _tile != 127) return false

 -- turn this tile into a pit, and then check adjacent tiles
 tile_copy(126, 24, _x - 1, _y)

 proc_cracked_floor(_x - 2, _y)
 proc_cracked_floor(_x + 2, _y)
 proc_cracked_floor(_x, _y - 2)
 proc_cracked_floor(_x, _y + 2)

 -- return we did something
 return true
end