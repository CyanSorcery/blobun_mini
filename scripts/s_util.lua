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
   add(_t[_aa], subl(_str,_offset, 0, 0x1))
  end
 end
 return _t
end

