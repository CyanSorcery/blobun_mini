function init_config()
 -- first, initialize this cartridge's save data
 cartdata(g_cart_name)

 --[[
	slot 63:
	0: save initialized
	1: show timers (off)
	2: slime overlap (on)
	3: sprint by default (off)
	4: music (on)
	5: sfx (on)
	6: lesbians (on)

	slot 62:
	4 bits per world, 4 worlds total
	0 means player hasn't unlocked world, anything above
	means they have (up to 15 stages)

	levels (0-59)
	no mapping yet
 ]]

 -- if the first bit isn't set in the last slot, we need to initialize this
 if (dget(63) == 0) then
  -- set initial options
  dset(63, 0b01110101)
  -- set initial time on all stages (means it hasn't been beaten)
  for i=0,59 do
   dset(i, 599.999)
  end
  -- set world 1 stage 1 unlocked
  dset(62, 0x1)
 end
end
function setting_get(_ind)
 return dget(63) & (1 << _ind) > 0
end
function setting_set(_ind, _on)
 local _bit, _data = 1 << _ind, dget(63)
 dset(63, _on and _data | _bit or _data & ~_bit)
end