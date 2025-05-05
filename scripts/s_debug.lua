function compress_sfx(_pattern, _offset, _len)
 print((_pattern << 10) | (_offset << 5) | _len, 7)
end