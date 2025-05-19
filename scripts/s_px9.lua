

function decompress_sprites(_index)
 -- don't do it if we don't have to
 if (g_px9_ind_sprites == _index) return false

 holdframe()
 -- load them into the spritesheet area
 px9_decomp(0, 0, g_px9_data[1][_index], sget, sset)
 -- load the sprite flags into the screen data area
 px9_decomp(0, 0, g_px9_data[2][_index], pget, pset)
 -- copy the sprite flags to the correct spot
 memcpy(0x3000, 0x6000, 0xff)
 -- remember this was the last decompressed
 g_px9_ind_sprites = _index
end

function decompress_music(_index)
 -- don't do it if we don't have to
 if (g_px9_ind_music == _index) return false

 holdframe()
 -- load data into the screen area
 px9_decomp(0, 0, g_px9_data[3][_index], pget, pset)
 -- copy the music patterns
 memcpy(0x3100, 0x6000, 0x80)
 -- copy the sfx in the right spot
 memcpy(0x3200, 0x6080, 0x880)
 -- remember this was the last decompressed
 g_px9_ind_music = _index
end

function decompress_map(_index, _x, _y)
 holdframe()
 -- load the data into the map area
 px9_decomp(_x, _y, g_px9_data[4][_index], mget, mset)
end

function decompress_sfx(_index)
 holdframe()
 px9_decomp(0, 0, g_px9_data[5][_index], pget, pset)
 memcpy(0x3A80, 0x6000, 0x880)
end

function
px9_decomp(x0,y0,src,vget,vset)
local function vlist_val(l,val)
local v,i=l[1],1
while(v~=val)i+=1v,l[i]=l[i],v
l[1]=val
end
local function getval(m)
local res=$src>>src%1*8<<32-m>>>16-m
src+=m>>3
return res
end
local function gnp(n)
local bits=0
repeat
bits+=1
local vv=getval(bits)
n+=vv
until vv<(1<<bits)-1
return n
end
local
w_1,h_1,
eb,el,pr,
splen,
predict
=
gnp"0",gnp"0",
gnp"1",{},{},
0
for i=1,gnp"1"do
add(el,getval(eb))
end
for y=y0,y0+h_1 do
for x=x0,x0+w_1 do
splen-=1
if(splen<1)splen,predict=gnp"1",not predict
local a=y>y0 and vget(x,y-1)or 0
local l=pr[a]or{unpack(el)}
pr[a]=l
local v=l[predict and 1or gnp"2"]
vlist_val(l,v)
vlist_val(el,v)
vset(x,y,v)
end
end
end