function init_config()
 -- first, initialize this cartridge's save data
 cartdata(g_cart_name)

 --[[
	slot 63:
	1: save initialized
	2: show timers (off)
	3: slime overlap (on)
	4: sprint by default (off)
	5: unused
	6: unused
	7: lesbians (on)

	slot 62:
	4 bits per world (max 5)
	0 means player hasn't unlocked world, anything above
	means they have (up to 15 stages)
    last 4 bits: last stage
	3 bits after: last world

	levels (0-59)
	no mapping yet
 ]]

 -- if the first bit isn't set in the last slot, we need to initialize this
 if dget(63) == 0 then
  -- set initial options
  dset(63, 0b01000101)
  -- set initial time on all stages (means it hasn't been beaten)
  for i=0,59 do
   dset(i, 599.999)
  end
  -- set world 1 stage 1 unlocked and as last stage
  dset(62, 0b0000000000000001.0001001000000000)
  -- currently unused
  dset(61, 0)
  dset(60, 0)
 end
end
function setting_get(_ind)
 return dget(63) & 1 << _ind > 0
end
function setting_set(_ind, _on)
 local _bit, _data = 1 << _ind, dget(63)
 dset(63, _on and _data | _bit or _data & ~_bit)
end
function last_worldstage_get()
 return {stage = dget(62) << 4 & 0xF, world = dget(62) << 7 & 0x7}
end
function last_worldstage_set(_world, _stage)
 dset(62, dget(62) & 0b1111111111111111.00000001111111111 | _world >> 7 | _stage >> 4)
end