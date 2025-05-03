

function decompress_sprites(_index)
 holdframe()
 -- load them into the spritesheet area
 px9_decomp(0, 0, g_px9_sprites[_index], sget, sset)
 -- load the sprite flags into the screen data area
 px9_decomp(0, 0, g_px9_spr_flags[_index], pget, pset)
 -- copy the sprite flags to the correct spot
 memcpy(0x3000, 0x6000, 0xff)
end

function decompress_music(_index)
 holdframe()
 -- load data into the screen area
 px9_decomp(0, 0, g_px9_music[_index], pget, pset)
 -- copy the music patterns
 memcpy(0x3100, 0x6000, 0x80)
 -- copy the sfx in the right spot
 memcpy(0x3200, 0x6080, 0x880)
end

function decompress_map(_index, _x, _y)
 holdframe()
 -- load the data into the map area
 px9_decomp(_x, _y, g_px9_map[_index], mget, mset)
end

-- px9 decompress

-- x0,y0 where to draw to
-- src   compressed data address
-- vget  read function (x,y)
-- vset  write function (x,y,v)

function
	px9_decomp(x0,y0,src,vget,vset)

	local function vlist_val(l, val)
		-- find position and move
		-- to head of the list

		local v,i=l[1],1
		while v!=val do
			i+=1
			v,l[i]=l[i],v
		end
		l[1]=val
	end

	-- read an m-bit num from src
	local function getval(m)
		-- $src: 4 bytes at flr(src)
		-- >>src%1*8: sub-byte pos
		-- <<32-m: zero high bits
		-- >>>16-m: shift to int
		local res=$src >> src%1*8 << 32-m >>> 16-m
		src+=m>>3 --m/8
		return res
	end

	-- get number plus n
	local function gnp(n)
		local bits=0
		repeat
			bits+=1
			local vv=getval(bits)
			n+=vv
		until vv<(1<<bits)-1
		return n
	end

	-- header

	local
		w_1,h_1,      -- w-1,h-1
		eb,el,pr,
		splen,
		predict
		=
		gnp"0",gnp"0",
		gnp"1",{},{},
		0
		--,nil

	for i=1,gnp"1" do
		add(el,getval(eb))
	end
	for y=y0,y0+h_1 do
		for x=x0,x0+w_1 do
			splen-=1

			if splen<1 then
				splen,predict=gnp"1",not predict
			end

			local a=y>y0 and vget(x,y-1) or 0

			-- create vlist if needed
			local l=pr[a] or {unpack(el)}
			pr[a]=l

			-- grab index from stream
			-- iff predicted, always 1

			local v=l[predict and 1 or gnp"2"]

			-- update predictions
			vlist_val(l, v)
			vlist_val(el, v)

			-- set
			vset(x,y,v)
		end
	end
end