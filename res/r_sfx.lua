-- format for this table: {pattern << 10, offset << 5, length}
-- use compress_sfx(pattern, offset, length) to get the number
g_sfx_lut = {
 octo = {
  -1021,
  -925,
  -829,
  -733,
  -637,
  -541,
  -445,
  -248
 },
 t_switch = -349,
 t_coin = -2042,
 p_state = {-1396, -1850, -1656}
}

--[[function compress_sfx(_pattern, _offset, _len)
 print((_pattern << 10) | (_offset << 5) | _len, 7)
end]]