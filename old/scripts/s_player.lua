

function player_end_move(_obj)
 
 -- proc what tile we're on
 --local _x, _y, _doslime, _destroy_obj = _obj.x, _obj.y, true, true
 local _xcenter, _ycenter, _collectcol = (_x << 4) + 12, (_y << 4) + 12
 --local _tile = mget(_x + 32, _y)

 -- if we're on a water tile and in the ice state, freeze that tile
 if (_tile == 73 and _obj.pstate == 2) _tile = 105
 
 -- heart
 --if (_tile == 2) do_key_swap(3, 4, 19, 20) _collectcol, g_play_sfx = {8, 7}, g_sfx_lut.t_switch
 -- diamond
 --if (_tile == 34) do_key_swap(35, 36, 21, 22) _collectcol, g_play_sfx = {11, 7}, g_sfx_lut.t_switch
 -- triangle
 --if (_tile == 66) do_key_swap(67, 68, 23, 24) _collectcol, g_play_sfx = {12, 7}, g_sfx_lut.t_switch

 --[[if _tile == 98 then
  g_p_coins += 1
  _collectcol, g_play_sfx = {10, 9, 7}, g_sfx_lut.t_coin
  if g_p_coins == 3 then
   g_p_coins = 0
   do_key_swap(99, 100, 25, 26)
   g_play_sfx = g_sfx_lut.t_switch
  end
  g_updt_coin    = true;
 end]]
 
 -- states: 0 normal, 1 fire, 2 ice
 --[[local _st = str2tbl("b31a9876d",3)
 for i=0,2 do
  if (_tile == 8 | i << 5) _obj.pstate, _collectcol, g_play_sfx = i, _st[i + 1], g_sfx_lut.p_state[i + 1]
 end]]
--[[
 -- is this an octogem?
 for i=0,7 do
  if _tile == 15 | i << 5 and g_p_octog == i then
   g_p_octog += 1
   -- find the destination octogem
   if (g_p_octog < 8) then
    local _dest = find_tile_loc(15 | (g_p_octog << 5))
    if (_dest != nil) part_create_octogem(_xcenter, _ycenter, (_dest.x << 4) + 12, (_dest.y << 4) + 12)
   end
   _collectcol, g_play_sfx = {14, 7}, g_sfx_lut.octo[i + 1]
  end
 end
 -- did we just get the last octogem? if so, process it and reset
 if (g_p_octog == 8) do_key_swap(74,106,27, 28) g_p_octog = 0
]]

 -- is this a key? if we don't have one, go ahead and pick it up
 --[[if _tile == 44 then
  if _obj.haskey then _destroy_obj = false else
   _obj.haskey = true
   _collectcol = {6, 13, 5}
  end
 end

 -- is this a key block? we can assume we let them through earlier
 if (_tile == 138) _obj.haskey = false]]

 -- fetch the previous tile
 local _oldx, _oldy = _obj.oldx, _obj.oldy
 local _prevtile = mget(_oldx + 32, _oldy)
 -- was the tile previous a slime trap?
 if _prevtile == 137 then
  -- unslime this spot and clear it for re-entry
  -- this just sets the tile ID to a clear spot
  place_puzz_tile(_oldx, _oldy, 160)
  mset(_oldx + 48, _oldy, 1)
  mset(_oldx + 32, _oldy, 1)
 end

 -- was the previous tile a cracked floor? if the cracked floor script ran, update the tile
 if (proc_cracked_floor(_oldx, _oldy)) _tile = mget(_x + 32, _y)

 -- are we on a conveyer? if so, overwrite new direction
 -- directions: 0 e, 1 n, 2 w, 3 s
 local _dir = -1
 for i=0,3 do
  if (_tile == 6 | i << 5) _dir = i
 end
 
 -- are we on an ice tile?
 if (_tile == 105) _dir = _obj.dir
 -- did we get a new direction?
 if (_dir != -1) g_new_dir = _dir
 g_p_use_conv = _dir != -1

 -- destroy floating object at this position
 --if (_destroy_obj) add(g_o_del, _x << 4 | _y)

 -- are we on a floor portal?
 --[[g_p_use_port = false
 if _tile == 5 or _tile == 37 or _tile == 69 or _tile == 101 then
  -- delete portal, then find pair
  mset(_x + 32, _y, 1)
  local _pair_loc = find_tile_loc(_tile)
  if _pair_loc != nil then
   -- set our new position to where we're going
   _obj.oldx, _obj.oldy = _obj.x, _obj.y
   _obj.x, _obj.y = _pair_loc.x - 32, _pair_loc.y
   g_p_use_port = true
  end
 end]]

 -- do we create collectible particles here?
 if (_collectcol != nil) part_create_item_grab(_xcenter, _ycenter, _collectcol)

 -- is this the end of this turn?
 --if not g_p_use_port and not g_p_use_conv then
 --end
 
 -- did we overlap our own trail?
 if (mget(_obj.x + 48, _obj.y) & 2 == 2) player_destroy(_obj)
 -- process stuff that destroys stephanie
 if  
 -- did we step on a lava tile and aren't in the right state
  _tile == 41 and _obj.pstate == 0 or
 -- did we step on an ice tile and aren't in the right state
  _tile == 73 and _obj.pstate != 2 or
 -- did we step on a cracked floor that just broke?
  _tile == 0 or
 -- did we step on a floor zapper on the wrong turn?
  _tile == 39 and g_p_zap_turn == 2 or -- cyan
  _tile == 7 and g_p_zap_turn == 1 or -- magenta
  _tile == 71 and g_p_zap_turn == 0 -- yellow
  then
  player_destroy(_obj, true)
 -- put slime on the playfield here?
--[[ elseif _doslime then
  g_s_touched += 1
  mset(_obj.x + 48, _obj.y, 2)
  put_x16_tile((_obj.x << 1) + 1, (_obj.y << 1) + 1, 218 + (_obj.pstate << 1))]]
 end
end

function player_destroy(_obj, _kill)
 g_level_lose = true
 -- colors for normal, fire, ice
 local _t = str2tbl("13b49a5d6", 3)
 if (_kill == true) _obj.isdead = true part_create_slime_explode((_obj.x << 4) + 12, (_obj.y << 4) + 12, _t[_obj.pstate + 1])
end
