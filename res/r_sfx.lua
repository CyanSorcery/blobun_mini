-- format for this table: {pattern << 10, offset << 5, length}
-- use compress_sfx(pattern, offset, length) to get the number

-- roxy note: during development there was a sfx lookup table here
-- however, we've removed it since it's not needed anymore

--[[function compress_sfx(_pattern, _offset, _len)
 print((_pattern << 10) | (_offset << 5) | _len, 7)
end]]