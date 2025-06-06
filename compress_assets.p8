pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

function _init()
 --[[
	compression types:
	0: end data stream
	1: sprite sheet
	2: sprite flags
	3: music + sfx patterns
	4: map
	5: game sfx
	6: stage bg
 ]]

 g_offset = 0
 g_byte_max = 17151
 g_dest_cart = "blobun_mini.p8"

 g_bytes_total = {0, 0, 0, 0, 0, 0}

 printh("Starting compression...")
 -- compress all the assets
 compress_spritesheet("res/s_title.png", "res/s_title.p8")
 compress_spritesheet("res/s_game.png", "res/s_game.p8")
 compress_stagebg("res/s_stage_bg.png", 0, 0)
 compress_stagebg("res/s_stage_bg.png", 64, 0)
 compress_stagebg("res/s_stage_bg.png", 0, 16)
 compress_stagebg("res/s_stage_bg.png", 64, 16)
 compress_stagebg("res/s_stage_bg.png", 0, 32)
 compress_music("res/m_pipeworks.p8")
 compress_music("res/m_islander.p8")
 compress_music("res/m_forest.p8")
 compress_music("res/m_snowdrift.p8")
 compress_music("res/m_marmalade.p8")
 compress_music("res/m_title.p8")
 compress_map("res/s_title.p8", 0, 0, 64, 21)
 compress_map("res/map_lut.p8", 96, 0, 32, 32)
 compress_sfx("res/sfx.p8")

 printh("Finished compression. "..g_offset.."/"..g_byte_max.." ("..((g_offset/g_byte_max)*100).."% used)")
 local _spr_bytes = g_bytes_total[1] + g_bytes_total[2] + g_bytes_total[6]
 printh("Sprite Data: ".._spr_bytes.." bytes ("..((_spr_bytes / g_byte_max) * 100).."%)")
 printh("Music Data: "..g_bytes_total[3].." bytes ("..((g_bytes_total[3] / g_byte_max) * 100).."%)")
 local _spr_bytes = g_bytes_total[4] + g_bytes_total[5]
 printh("Misc Data: ".._spr_bytes.." bytes ("..((_spr_bytes / g_byte_max) * 100).."%)")
 printh("Free Bytes: "..(g_byte_max - g_offset).." bytes ("..(((g_byte_max - g_offset) / g_byte_max) * 100).."%)")
 
 printh("Copying the compressed data to main game...")
 -- first, clear out the cart of all data
 memset(0x0, 0x0, 0x4300)
 -- copy the blank data to the destination cart
 cstore(0x0, 0x0, 0x4300, g_dest_cart)
 -- now, copy the compressed data to the destination cart
 cstore(0x0, 0x8000, g_offset, g_dest_cart)
 printh("Compression routine complete. Data stored in cart successfully.")

 stop()
end

function write_type_len_bytes(_type, _bytes)
 -- shift the current data right by one
 memcpy(0x8000 + g_offset + 2, 0x8000 + g_offset, _bytes)
 -- write the type and length
 poke2(0x8000 + g_offset, (_type << 13) | _bytes)
 g_offset += 2 + _bytes

 g_bytes_total[_type] += _bytes
end

function compress_spritesheet(_filename, _cartname)
 -- load the sprite sheet and associated sprite flags
 import(_filename)
 reload(0x3000, 0x3000, 0xff, _cartname)
 cstore(0x0, 0x0, 0x2000, _cartname)
 -- update the sprite sheet of the given cart
 -- compress it
 local _bytes = px9_comp(0, 0, 128, 128, 0x8000 + g_offset, sget)
 write_type_len_bytes(1, _bytes)
 printh("Compressed sprite sheet ".._filename.." ("..tostr(_bytes).." bytes, ratio "..tostr((_bytes / 0x2000) * 100).."%)")
 -- add sprite flags to this
 memcpy(0x0, 0x3000, 0xff)
 _bytes = px9_comp(0, 0, 128, 4, 0x8000 + g_offset, sget)
 write_type_len_bytes(2, _bytes)
end

function compress_stagebg(_filename, _x, _y)
 -- import the image into this cart, and then store it in the given cart
 import(_filename)
 --cstore(0x0, 0x0, 0x2000, _cartname)
 -- compress it
 local _bytes = px9_comp(_x, _y, 64, 16, 0x8000 + g_offset, sget)
 write_type_len_bytes(6, _bytes)
 printh("Compressed stage background ".._filename.." ("..tostr(_bytes).." bytes, ratio "..tostr((_bytes / 0x2000) * 100).."%)")
end

function compress_music(_filename)
 -- load the music + sfx from the given cart into this one
 reload(0x3100, 0x3100, 0x1200, _filename)
 -- move the music pattern data into the sprite sheet area (first 32 frames)
 memcpy(0x0, 0x3100, 0x80)
 -- move the sfx data into the sprite sheet area (first 32 patterns)
 memcpy(0x80, 0x3200, 0x880)
 -- compress it
 local _bytes = px9_comp(0, 0, 128, 36, 0x8000 + g_offset, sget)
 write_type_len_bytes(3, _bytes)
 printh("Compressed music ".._filename.." ("..tostr(_bytes).." bytes, ratio "..tostr((_bytes / 0x900) * 100).."%)")
 
end

function compress_sfx(_filename)
 -- load the sfx from the given cart into this one (last 32 patterns)
 reload(0x3A80, 0x3A80, 0x880, _filename)
 -- move the data into the sprite sheet area
 memcpy(0x0, 0x3A80, 0x880)
 -- compress it
 local _bytes = px9_comp(0, 0, 128, 34, 0x8000 + g_offset, sget)
 write_type_len_bytes(5, _bytes)
 printh("Compressed sfx ".._filename.." ("..tostr(_bytes).." bytes, ratio "..tostr((_bytes / 0x880) * 100).."%)")
end

function compress_map(_filename, _x, _y, _w, _h)
 -- load the map from the given cart into this one
 reload(0x2000, 0x2000, 0x1000, _filename)
 -- store the dimensions of the selection
 -- compress it
 local _bytes = px9_comp(_x, _y, _w, _h, 0x8000 + g_offset, mget)
 write_type_len_bytes(4, _bytes)
 printh("Compressed map from ".._filename.." ("..tostr(_bytes).." bytes, ratio "..tostr((_bytes / (_w * _h)) * 100)..") at "..tostr(_x)..","..tostr(_y).." with size "..tostr(_w)..","..tostr(_h))
 
end

-->8

function
	px9_comp(x0,y0,w,h,dest,vget)

	local dest0=dest

	local function vlist_val(l, val)
		-- find position and move
		-- to head of the list

--[ 2-3x faster than block below
		local v,i=l[1],1
		while v!=val do
			i+=1
			v,l[i]=l[i],v
		end
		l[1]=val
		return i
--]]

--[[ 8 tokens smaller than above
		for i,v in ipairs(l) do
			if v==val then
				add(l,deli(l,i),1)
				return i
			end
		end
--]]
	end

	local bit=1
	local byte=0
	local function putbit(bval)
		if (bval>0) byte+=bit
		poke(dest, byte) bit<<=1
		if bit==256 then
			bit=1 byte=0
			dest += 1
		end
	end

	local function putval(val, bits)
		for i=0,bits-1 do
			putbit(val>>i&1)
		end
	end

	local function putnum(val)
		local bits = 0
		repeat
			bits += 1
			local mx=(1<<bits)-1
			local vv=min(val,mx)
			putval(vv,bits)
			val -= vv
		until vv<mx
	end


	-- first_used

	local el={}
	local found={}
	local highest=0
	for y=y0,y0+h-1 do
		for x=x0,x0+w-1 do
			c=vget(x,y)
			if not found[c] then
				found[c]=true
				add(el,c)
				highest=max(highest,c)
			end
		end
	end

	-- header

	local bits=1
	while highest >= 1<<bits do
		bits+=1
	end

	putnum(w-1)
	putnum(h-1)
	putnum(bits-1)
	putnum(#el-1)
	for i=1,#el do
		putval(el[i],bits)
	end


	-- data

	local pr={} -- predictions

	local dat={}

	for y=y0,y0+h-1 do
		for x=x0,x0+w-1 do
			local v=vget(x,y)

			local a=y>y0 and vget(x,y-1) or 0

			-- create vlist if needed
			local l=pr[a] or {unpack(el)}
			pr[a]=l

			-- add to vlist
			add(dat,vlist_val(l,v))

			-- and to running list
			vlist_val(el, v)
		end
	end

	-- write
	-- store bit-0 as runtime len
	-- start of each run

	local nopredict
	local pos=1

	while pos <= #dat do
		-- count length
		local pos0=pos

		if nopredict then
			while dat[pos]!=1 and pos<=#dat do
				pos+=1
			end
		else
			while dat[pos]==1 and pos<=#dat do
				pos+=1
			end
		end

		local splen = pos-pos0
		putnum(splen-1)

		if nopredict then
			-- values will all be >= 2
			while pos0 < pos do
				putnum(dat[pos0]-2)
				pos0+=1
			end
		end

		nopredict=not nopredict
	end

	if(bit>0) dest+=1 -- flush

	return dest-dest0
end

__sfx__
0123000023155231251f1551f1251a1551f1552315526155241552412521155211251d1551d1251f1552115523155231251f1551f1251a1551f15523155261552715527125241552412520155201251f15521155
01230000133351a3322b6250e335133351a3322b6251333511335183322b6250c33511335183322b62511335133351a3322b6250e335133351a3322b62513335143351b3322b6250f335143351b3322b62514335
0123000007055070250e0550b05507055006330e0550e02505055090550c0550905505055006330c0550c02507055070250e0550b05507055006330e0550e025080550c0550f0550c05508055006330f0550f025
0123000023155231251f1551f125000001f15523155261552415524125211552112500000000001f1552115523155231251f1551f1252315523125241552615527155271252c1552c12500000000002435526355
012300002735527325243552432533105381252735524355263552632523355233253210537125263552335524355203551d3552035524355351252735524355263552632523355233253b105371252435526355
01230000145551b5522b6250f555145551b5522b62514555135551a5522b6250e555135551a5522b6251355511555185522b6250c55511555185522b62511555135551a5522b6250e555135551a5522b62513555
012300000805508025000000f055080550063300000050550705507025000000e055070550063300000060550505505025000000c055050550063300000060550705507025000000e05507055006330000007055
0123000027355273252435524325331053812527355243552635526325233552332500000371251f3552335524355203551d355203552435535125273552435526355263252b3552b32500000371251f15521155
0123000027355273252435524325000003812527355243552b3552b3252635526325000003712524355263552735527325283552832529355293252a3552a3252b3552b325263552632523355233251f25521255
0123000023255232251a2551f2552325523225212551f25521255212251e2551e22500000000001e2551f25521255212251e2551e22500000000001f2552125523255232251f2551f2250000000000182551a255
012300001c2551c225182551a2551c2551c2251a255182551a2551a2251f2551f225232552322500000000002425524225232552225523255232251f2551e2551f2551f2251a2551a2251f2551f2251f1551e155
012300001c1551c125181551a1551c1551c1251a155181551a1551a1251f1551f12523155231251e2551f25521255212251e1551f15521155211251f2551e2551f2551f22523255232251f2551f2251f15521155
012300000705507025020550202507055006330205502025060550602502055020250605500633020550202506055060250205502025060550063309055090250705507025020550202507055006330205502025
012300001f42723417266252b4221f42723417266252b4221e42721417266252a4221e42721417266252a4221e42721417266252a4221e42721417266252a4221f42723417266252b4221f42723417266252b422
01230000040550402507055070250005500633070550702507055070250b0550b02502055006330b0550b025060550602509055090250105500633090550902507055070250e0550e02507055006330e0550e025
01230000184271c4171f62524422184271c4171f625244221a4271f41723625264221a4271f4172362526422184271e4172362524422184271e41723625244221a4271f41723625264221a4271f4172362526422
012300001f22723217266252b2271f21723217266252b2222122726217296251d2272121726217296251d2221f22723217266252b2271f21723217266252b2222022724217276252c2272021724217276252c222
012300002042724417276252c4272041724417276252c4261f42723417266252b4271f41723417266252b4261d4272041724625294271d4172041724625294261f42723417266252b4271f41723417266252b426
