pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function _init()cls(1)?"loading...",1,122,13
flip()memcpy(32768,0,17152)v={{},{},{},{},{},{}}n1,nh=0,0local o,n=32768,%32768while(n~=0)add(v[n>>13&7],o+2)o+=2+(n&8191)n=%o
nb,ng={51510,27795,14025,37740},{32769.5,42405.5,60855.5,-.5}nN="0034131438701e507c7800000000380000000000000000000000000000000000003515163a721d51bf0000120000390000000000000000000000000000000000003617183c741f52cf1b000000003a00000000000000000000000000000000000037191a3e7600007a1c000000003b000000000000000000000000000000000000000000000000003033000000003c000000000000000000000000000000003100000000000000000000000000003d000000000000000000000000000000003200000000000000000000000000003e000000000000000000000000000000000000000000000000000000000000003f00000000000000000000000000000000"nO="cyansorcery_blobun_wp_pico8"s={{"bfill it outamika, roxy01004.3344002.417779f050c210011010100010100010001000111013100010101","ddon't overlapamika, roxy02004.3344002.9844581cba00001101710000210001010101015101000100000101010000","7zigzags4mika03004.3344002.7344794c41c000000017101010001710101010021310131010100","acapacitoryamika, roxy04007.1100005.4677796559c00010101010100000100010101000001000101010000010001010100000101010101000001010101010001010000000121","afull boxes6autumn05600.1000000.11007001010101010101010101000101010101010001010101000000000001010101000101010101010001010121010101010101","dpopping about4ashe06600.1000000.110060000045010101010101010101450101002501000000000000250101000121010101010100","9hop to it007600.1000000.1100b000000001010101010000000000000101010101010000000000000000010001010100000000010101010101010000000101010101010100000001010101010101000001010101010101010100002101010101010101000000","9superstar4roxy08600.1000000.1100a000000000010100000000000000000101000000000000000101010100000001010101010101010101010101010101010101010001010101010101010000000101010101010000000101012101010101000101010100000101010101010100000000010101","bmorning joe4roxy09600.1000000.1100a0000101010101000000000101000000010101000001010100010101010100010101010101010001010101010101010100000101010101010101000101010101010101010101000101010101010121000000010101010100000000","alost media4roxy10600.1000000.110090210001010101450045010001000101010001010001000101010001010000000000000001010101010101010101010101010101010101010101010101010101000101010101010101"},{"btest stage!5mouse45600.1000000.1100a00001620323436301010f8a89620529290501252f01016202224201014a4f2c010100010101016a6f2929000021010108ef8f2929000909012849cfaf0929270747000149492509092707470048494949","elocks'n'blocks4roxy46600.1000000.110060000001020000010101030303010101030303210000000003","dlocks'n'locks4roxy47600.1000000.1100500101010101010000002101000000000143434343010101014201010101010101010101","etoggled hearts4ashe48600.1000000.11005001010201010101010101030301042103030104040303010404","dcareful plans4roxy49600.1000000.110060012201210101010101000001010101010001012323232301012424242401","ftangy transport6willow50600.1000000.1100400101010101020304210501050301030401020101","fspace satellite6autumn51600.1000000.11007024240123012424242401230124242424052305242424220123012221","dcup of hearts4ashe52600.1000000.110070250102010300000301010103040401040401040101010402030001210101030301010000250101010000","ecoin conundrum4ashe53600.1000000.110060640101010164016201016201010101640101010164010101012101016201640101010163","dcoins of lovedcoins of love54600.1000000.110050040404010104010102010462010101010103036201010362016303210101","dkey collector6autumn55600.1000000.1100800563636364242462620404024243432244040403444343022105230404232362","ftight corridorsaroxy, ashe56600.1000000.110070000323232200000303242424240103010101010403030123230104030321232301020103010204040400","dthree of keys4ashe57600.1000000.110080040423232323040404012201010101040202434343432104010342444444440401010303000000000101030300000000","ejuncton islandaroxy, ashe58600.1000000.1100802323232324240104230101222402010123010123230101012301010323012323000001030301000000000101230400000000212204230000","ebizarre island4ashe59600.1000000.110090000000000101220000000001010424010000030201010124010404032323232324040404230101010101020424232124030303030424232224232322242400"},{"7stage 1030600.1000000.1100c0000000000000000000000000000000000101010100000000000000000000000100000000000000002100005151000000000000000100000101000000000000000101010100000000000000000000000000000000000000000000000000000000","7stage 2031600.1000000.1100c0000000000000000000000000000000000000000000000000000000010121010100000000000001010000000100000000000031000000010100000000000031000000010000000000000001010101010000000000000000000000000000000000","7stage 3032600.1000000.1100c0000000000000000000000000000151515101515101000000000100000000000001000000000100000000000021000000000101000000000001000000000001000000000001000000000001000000000101000000000001010101010100000000"},{"7stage 1033600.1000000.1100c0000000000000000000000000000000000000000000000000000000000000000000000000000000210131313131010000000000010000000000010000000001010000000000010000000001010101000001010000000000000001010101000000","7stage 2034600.1000000.1100c0000000000000000000000000000000010101010101010000000000000000000000010000000000210111111111010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"},{"7stage 1025600.0000000.1100c0000000000000000000000000000000000000000000000000000000000000000000000000000000210101010101000000000000000000000001000000000000000000000001000000000011111111010001000000000000000000010101000000","7stage 2060600.1000000.1100c0000000000000000000000000000000010101010101010000000000000000000000010100000000210101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000","7stage 3060600.1000000.1100c0000000000000000000000000000000000000000000000000000000000000000000000000000000002101010101000000000000000000000001000000000000000000000001000000000000000111111101000000000000000000000000000000","7stage 4060600.1000000.1100c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"}}_={octo={64515,-925,-829,-733,-637,-541,-445,-248},t_switch=-349,t_coin=63494,p_state={64140,63686,63880}}S,nn,n2,no,F,y,i,C=0,0,false,time(),0,1,{},0a,J,ne,l,np,ny=nil nm,nP,nk,nw=m("0001115525511125",16),m("155dd6122889142449",6),m("1c1d437369",5),m("3c26915154",5)nQ()nR()nS(1)nz(1,1)end function o(n,o,e,f)l,J,ne,nT,b=n,o,e,f,0nf()music(-1)end function K(n,o)np,ny,b,r=n,o,0,{}pal()end function _update()if(count(i)>0and btn(6))poke(24368,1)nf()
S+=.2S%=4nn+=.035nn%=1C+=.15C%=32n2=n2==false np()if(btnp()&48>0and b>45)b=45
b=max(b-1)if(b<=45)F=min(F+.1,1)
if l~=nil then y=max(y-.1)if(y==0)if l==0then nU()elseif l==1then nV()elseif l==2then nz(J,ne)elseif l==3then nW()elseif l==4then nX()end F,y,l,J,ne=0,1
end for n,o in pairs(i)do o:m_step(n)end if(a~=nil)sfx(a>>10&63,3,a>>5&31,a&31)a=nil
no=time()if(no<0)stop"game has been running for too long. take a break!"
end function _draw()ny()local n=l==2or l==nil and count(r)>0local o=n and J~=nil and J or L or 1local e,n,o=n and nw[1][o]or 1,nw[2][o],64*cos(F*y>>2)if(o>0)rectfill(0,0,o,127,e)rectfill(127-o,0,127,127,e)
if b>0then local i,f="stage "..nd,cos(abs(max(abs(b-45),35)-35)/40)*64-64local e,d,f=f+8,f+9,j(i,f+12,97,7,n)line(d,105,d+f,105,n)line(e,104,e+f,104,7)j(c.l_name,e,107,7,n)if(o>0)?c.l_author,e,115,n
end for n,o in pairs(i)do o:m_draw(n)end end function n(n)nv(1)nY(1,0,0)music(n)f=0end function nW()n(-1)K(nZ,o0)T=90end function nU()n(-1)K(o1,on)end function nV()n(-1)K(o2,oo)local n=n_()u,M=mid(1,n.world,count(s))A=mid(1,n.stage,count(s[u]))f,q,D,oe=0,0,.125,m("13b224cd02415d6d2494",4)end function nX()n(-1)K(of,od)end function nz(n,o)K(o4,o3)local e=n1~=2nv(2)oi(1)memset(8192,0,4096)r,n4,E,U,n3,nF={},{},{},{},{},61936.8827ni,N,O,G,p,na,nl=0,0,0,0,0,0,-8V,nr,d,k,H,w,nj,b=true,false,false,false,false,false,false,nT==true and 0or 90,false z,W,B,nA,P,X,nt,nq=0,true,0,false,-1,5,0,0n=mid(1,n,count(s))o=mid(1,o,count(s[n]))oa(n,o)L,nd,c=n,o,s[n][o]if(e)poke(24405,0)local o=m("2854ef234924d6d54924",4)for e=1,4do pal(o[1][e],o[n][e])end spr(1,8,0,14,1)spr(16,0,8,2,2)poke(24405,96)ol(n)
local f,i,a,d,l,e,n,o={},#c.l_data,c.l_data,1,(c.l_width<<1)+1,0,1,1for i=1,i do d+=2e=g(a,d,1,1)f[i]=e if(e>0)nc(n,o,(n+o)%4==2and 17or 16)
n+=2if(n>=l)n=1o+=2
end nB(0,0,32,function(n,o,e)if(n>0and n<15)mset(o+32,e,n)
end)for n=48,64do for o=0,16do mset(n,o,0)end end n,o=0,0for e in all(f)do mset(n+32,o,e)if(e~=0)mset(n+48,o,1)n6(n,o,e)ni+=1
if(e==33)ot(n,o)
for f=0,4do if(e==2|f<<5)add(r,Y(n,o,f+1,83+f))
end for f=0,2do if(e==8|f<<5)add(r,Y(n,o,5+f,230+f))
end for f=0,3do if(e==17|f<<5)nC(n,o,f)
end for f=0,7do if(e==15|f<<5)add(r,Y(n,o,8+f,87))
end if(e==44)add(r,Y(n,o,16,159))
n+=1if(n>=c.l_width)o+=1n=0
end oc()if(h(6))nD(r[1])
end function n6(o,e,i)local n=(i<<1)-1local n=g(nN,n,1,1)if n~=0then if(n==124and(o+e)%2==0)n+=2
local f,d=(o<<1)+1,(e<<1)+1if n==191or n==207then o6(f,d,n)elseif n<83then nc(f,d,n)else n5(f,d,n)end local n,f=-1,i&31if(f==3or f==10)n=0
if(f==4)n=1
if(n>=0)mset(o+48,e,n)
end end function oc()for n in all{191,207}do nB(1,n,64,function(n,o,e,f)if(n>0)mset(o+64,e,o%2==0and e%2==0and n==15and f-15or f+n-15)
end)end end function nB(o,d,x,p)local y,h,t,i,c,e,n,f,u,a,s,b,g,l,r=(c.l_width<<1)+1,(c.l_height<<1)+1for r=0,y do b,g=max(r-1),min(r+1,31)t,i,c,e,n,f=o,o,o,o,o,o for o=0,h do l=min(o+1,h)u,a,s=mget(b,l)==d and 0or 1,mget(r,l)==d and 0or 1,mget(g,l)==d and 0or 1if(n==0)p((u+a+e+n==0and 1or 0)|(s+a+f+n==0and 2or 0)|(c+i+f+n==0and 4or 0)|(t+i+e+n==0and 8or 0),r,o,d)
t,i,c=e,n,f e,n,f=u,a,s end end for n=0,31do for o=0,31do r=mget(n+x,o)if(r>0)mset(n,o,r)
mset(n+x,o,0)end end end function nQ()local d,l,f,n,i={},{"l_name","l_author"}for a,o in ipairs(s)do d[a]={}for r,e in ipairs(o)do local o={}n=1for d=1,2do f=g(e,n,0,1)o[l[d]]=sub(e,n+1,n+f)n+=f+1end o.l_saveslot=g(e,n,1)o.l_goaltime=g(e,n+2,7)o.l_devtime=g(e,n+10,7)n+=18o.l_width=g(e,n,0,1)n+=1i=g(e,n,0,1)f=ceil(i/2)o.l_hintcount,o.l_hintstr=i,f==0and""or sub(e,n,n+f)o.l_data=sub(e,n+f-1)o.l_height=#o.l_data/o.l_width>>1d[a][r]=o end end s=d end function o5()local i,a,e,f,o,n,d=c.l_hintcount-1,c.l_hintstr,r[1].startx,r[1].starty,0n4={}for i=0,i do d=1+i\2n=g(a,d,0,1)>>o&3nC(e,f,n)e+=cos(n>>2)f+=sin(n>>2)o+=2o%=4end nf()end function on()cls(0)map(0,0,-24*f,32,19,2)map(0,2,f*2%1*-24,48,19,3)map(0,5,f*3%1*-24,72,19,7)palt(1024)local n=sin(f)*4map(19,0,12,8+n,13,7)if(not h(6))map(19,8,28,8+n,4,5)
?"2025 cyansorcery",32,122,3
if(count(i)==0and l==nil)nu("press 🅾️ to start!",28,96,1,1.4)
end function o0()local o=F*y local n=o*8cls(1)rectfill(0,56,127,72,12)map(0,12,-24*f,56-n,19,1)map(0,13,-24+24*f,64+n,19,1)local n=n*.5?"presented by",39,60-n,1
if(h(6))map(19,7,18,60+n,11,1)
palt()fillp(ng[flr(x(1,4,o))])rectfill(0,56,127,72,12)fillp()end function of()if(F*y==1and btnp()&48>0)o(0)
end function od()for n=-32+C,128,32do for o=-C,128,32do spr(204,n,o,4,4)end end poke(24404,96)pal(nm[1])sspr(0,58,128,70,0,58)sspr(0,7,128,18,0,7)sspr(39,38,52,20,39,38)pal()poke(24404,0)palt(4096)map(48,0,0,0,16,16)local e={{"programming","bug fixes","general"},{"art, music","art, music","music"}}for n=1,2do for o=1,3do j(e[n][o],n*64-46,o*24+42,7,1)end end j("director",58,42,7,1)j("created by",44,1,7,1)j("a plural system",34,26,7,1)j("seven spirits, one body",18,32,7,1)end function nZ()f+=.025f%=1if T>0then T-=1if(btnp()&48>0)T=0
if(T==0)o(0)
end end function o1()f+=.01f%=1if count(i)==0then local n=btn(6)if(n)poke(24368,1)
if(btnp(4)or n)ou()
if(btnp(5))o(3)
end end function o2()q=mid(0,q+D,1)f+=.02f%=1local n=count(s)if q==1then if(btnp(0)and u>1)M=max(u-1,1)D=-.125
if(btnp(1)and u<count(s))M=min(u+1,n)D=-.125
end if(q==0)D=.125u=M M=nil
local n=count(s[u])if(btnp(2))A-=1
if(btnp(3))A+=1
A=mid(1,A,n)if(btnp(4))o(2,u,A)
if(btnp(5))o(0)
end function oo()local e,n=oe,20+sin(q>>3)*29for n=1,4do pal(e[1][n],e[u][n])end rectfill(0,0,127,127,1)map(0,14,-24+24*f,-2-n,19,3)map(0,17,-24*f,115+n,19,2)map(32,-2+u*2,0,1-n,16,2)local n=122+n if(u>1)?"⬅️previous area",1,n,7
if(u<count(s))?"next area➡️",84,n,7
local n=count(s[u])local i=max(min(A-5,n-9),0)local n,l,r,a,o,f=23-i*10,i+10,h(1)for o,d in ipairs(s[u])do a,nE=o==A,n+10if o>i and o<l then f=n+3local i=dget(d.l_saveslot)if(a)nG(4,n,90,nE)
pal(7,a and 7or e[u][2])?(o>9and""or" ")..o.." "..d.l_name,15,f,7
spr(i<=599.995and 241or 240,6,n+1)if r then if(i<=d.l_goaltime)?nH(i),96,f,7
if(i<=d.l_devtime)?"♥",120,f,7
end end n=nE end if q<1then palt()if(D<0)pal(1,e[M][1])
fillp(ng[flr(x(1,4,q))])if(D>0)rectfill(0,22,127,112,1)else rectfill(0,0,127,127,1)
fillp()end pal()end function o3()poke(24405,0)if(V)o7()
if(n2)o8()else o9()
os()if(W)ox()
poke(24405,96)cls(nk[1][L])pal(7,nk[2][L])for n=-32+C,128,32do for o=-C,128,32do spr(148,n,o,4,2)spr(152,n,o+16,4,2)end end pal()camera(na,nl)palt(256)map(0,0,0,0,32,32,1)nI()map(0,0,-7,0,32,32,128)nI()oh()palt(16384)map(0,0,0,0,32,32,12)palt()map(0,0,0,0,32,32,2)foreach(r,function(n)n:ondraw()end)ob()camera(0,0)local f=h(1)local n,o=x(127,115,O),f and 0or 87poke(24404,96)pal(nm[1])sspr(o,0,128,9,o,0)if(O>0)sspr(0,n,128,16,0,n)
pal()poke(24404,0)local o=B<=c.l_goaltime and 7or 13if(d and B<=c.l_devtime)o=10
local e=dget(c.l_saveslot)spr(e<599.995and 147or 146,88,0)if f then?nH(B),2,2,o
if(nj)nu("new time!",32,2,o,1.3)
if(e<=c.l_goaltime)?"⧗",81,2,9
if(e<=c.l_devtime)?"♥",75,2,14
end rect(96,1,126,7,7)fillp(nb[ceil(S)])rectfill(124-max(1,N/ni*26),3,124,5,59)fillp()if(d or k)nu(d and"stage clear!"or"❎ undo",d and 42or 50,n+5,7,1.3)
end function nI()poke(24405,0)camera(0,0)local n,o for e=0,34do n,o=(e<<3)%128,(e\16<<4)+8sspr(n,o,8,16,n,o,8,16,true)end camera(na,nl)poke(24405,96)end function ox()local n,e for o=1,3do e,n=((o+z)%3<<1)+1,nP[o]pal(n[3],n[e])pal(n[4],n[e+1])spr(155+o,96+(o<<3),8,1,2)end pal()W=false end function o7()local o,f,n for e=0,1do o,f=4,5if(G>e)o,f=9,4
n=17-e*3for e=0,8,8do line(72+e,n,76+e,n,o)line(72+e,n-1,75+e,n-1,o)n+=1o=f end end V=false end function o8()sspr(12,56,1,15,0,56)sspr(4,56,8,15,5,56)sspr(0,56,1,15,4,56)sspr(17,59,15,1,112,127)sspr(17,60,15,8,17,59)sspr(112,127,15,1,17,67)sspr(36,56,1,15,0,56)sspr(37,56,8,15,36,56)sspr(0,56,1,15,44,56)sspr(49,67,15,1,112,127)sspr(49,59,15,8,49,60)sspr(112,127,15,1,49,59)line(112,127,127,127,7)line(0,56,0,71,0)end function o9()local d,o,n,e,f=nF,0,0,false,false for o=0,10do n,e,f=21+o,d&1<<o>0,d&8<<o>0sset(n,98,e and 7or 12)sset(n,96,f and 7or 0)sset(n,92,e and 9or 4)sset(n,90,d&32<<o>0and 10or 9)sset(n,88,f and 10or 0)end for o=0,4do n,e,f=8+o,d&16<<o>0,d&64<<o>0sset(n,98,e and 7or 12)sset(n,96,f and 7or 0)sset(n,90,e and 10or 9)sset(n,88,f and 10or 0)end for i=0,7do n,e,f=103-i,95-i,88+i o=d&1<<i>0and 7or 12sset(n,101,o)sset(50,103-i,o)sset(78,96+i,o)o=d&1<<i>0and 9or 4sset(n,91,o)sset(52,e,o)sset(76,f,o)o=d&4<<i>0and 9or 10sset(n,93,o)sset(50,e,o)sset(78,f,o)end nF>><=1end function oh()local n for o in all(n4)do n=o.dir spr(n%2==0and 254or 255,o.x,o.y,1,1,cos(n>>2)<0,sin(n>>2)>=0)end end function o4()local o=F*y==1if b<=45and o then if(btn(6))poke(24368,1)
if((n7 and d or btn(6))and count(i)==0)og()
end nt+=.075nt%=1nq+=.015nq%=1X-=1if(X<=0)X=30+flr(rnd(60))
O=mid(0,(d or k)and O+.2or O-.2,1)local n,e,f=r[1],c.l_width<<4,c.l_height<<4na=c.l_width>8and mid(0,(x(n.oldx,n.x,n.anim)<<4)-48,e-112)or(e>>1)-56nl=c.l_height>7and mid(-8,(x(n.oldy,n.y,n.anim)<<4)-48,f-108)or(f>>1)-60if(o)op()oy()
end function op()foreach(r,function(n)n:onstep()end)for n in all(n3)do for o in all(r)do if(o.pos==n)del(r,o)break
end del(n3,n)end end function nC(n,o,e)add(n4,{dir=e,x=(n<<4)+12,y=(o<<4)+12})end function Y(n,o,e,f)local n={type=e,iskey=true,x=(n<<4)+8,y=(o<<4)+5,pos=n<<4|o,spr=f,anim=rnd(1),spin=rnd(1)}function n:ondraw()if self.type==16then spr(self.spr,self.x+4,self.y+sin(self.anim)*2,1,2)elseif self.type-8==p or self.type<8or self.type>15then local n,o,f,d,e=self.x,self.y+sin(self.anim)*2,self.spr%16<<3,self.spr\16<<3,ceil(sin(self.spin*.5)*-8)if(e<=3)rectfill(n+7,o+1,n+9,o+14,7)
sspr(f,d,8,16,n+9-e,o,e,16)sspr(f,d,8,16,n+8,o,e,16,true)end end function n:onstep()self.anim+=.02self.anim%=1self.spin+=.035self.spin%=1end return n end function Q(r,t,s,c)local f,n,d,i,a,l,u for o=32,48do for e=0,16do n,f=nil,mget(o,e)if mget(o+16,e)&2==0then if f==r then n,d,l=t,c,1elseif f==t then n,d,l=r,s,0end if n~=nil then u=c<56mset(o,e,n)mset(o+16,e,l)i,a=(o-32<<1)+1,(e<<1)+1if(u)nc(i,a,d)else n5(i,a,n)
end end end end end function x(n,o,e)return n+(o-n)*e end function om()local n={}n.obj_list={}for o,e in pairs(r)do n.obj_list[o]=r[o]end local o=r[1]n.player_x,n.player_y,n.player_dir,n.player_pstate,n.player_coins,n.tiles_touched,n.player_octogems,n.player_haskey,n.zapper_turn=o.startturnx,o.startturny,o.dir,o.pstate,G,N,p,o.haskey,z add(E,n)n.playfield_walls,n.playfield_slime,n.playfiend_main=n8(32,16),n8(48,16),n8(0,32)if(count(E)>20)deli(E,1)
end function ok()local o=count(E)if(o==0)return
local n=E[o]if(o>1)deli(E)
r=n.obj_list local o=r[1]o.x,o.y,o.oldx,o.oldy,o.anim,o.dir,o.pstate,G,N,p,o.haskey,z=n.player_x,n.player_y,n.player_x,n.player_y,1,n.player_dir,n.player_pstate,n.player_coins,n.tiles_touched,n.player_octogems,n.player_haskey,n.zapper_turn P,k,o.isdead,V,W,o.ismove=-1,false,false,true,true,false n9(n.playfield_walls,32,16)n9(n.playfield_slime,48,16)n9(n.playfiend_main,0,32)end function n8(f,e)local n={}for o=0,e do n[o]={}for e=0,e do n[o][e]=mget(o+f,e)end end return n end function n9(e,f,n)for o=0,n do for n=0,n do mset(o+f,n,e[o][n])end end end function R(n,o)if(mget(n+32,o)~=9)return false
n6(n,o,192)mset(n+48,o,0)mset(n+32,o,0)R(n-1,o)R(n+1,o)R(n,o-1)R(n,o+1)return true end function nJ(e)local n,o=c.l_width+32,c.l_height for n=32,n do for o=0,o do if(mget(n,o)==e)return{x=n-32,y=o}
end end return nil end function n5(o,e,n)ns(o,e,n,n+1,n+16,n+17)end function nc(o,e,n)ns(o,e,253,n,253,n+16)end function o6(o,e,n)ns(o,e,n,n,n,n)end function ns(n,o,e,f,d,i)mset(n,o,e)mset(n+1,o,f)mset(n,o+1,d)mset(n+1,o+1,i)end function nu(o,e,f,d,i)local n=#o for n=1,n do e=print(sub(o,n,n),e,f+sin(nn+n/10)*i,d)end end function j(n,o,e,f,d)?n,o+1,e+1,d
return print(n,o,e,f)end function nH(n)return(n>=60and flr(n/60)..":"or"")..sub(flr(n%60)+100,2,3).."."..sub(flr(n%1*1000)+1000,2,4)end function m(d,n)local o,f,e={},#d\n for f=1,f do o[f]={}e=(f-1)*n for n=1,n do e+=1add(o[f],g(d,e,0,1))end end return o end function g(e,n,o,f)return tonum(sub(e,n,n+(o and o or 0)),f)end function ot(n,o)add(r,{type=0,x=n,y=o,startx=n,starty=o,pos=-1,dir=3,anim=1,sprint=false,jiggle=0,ismove=false,pstate=0,oldx=n,oldy=o,startturnx=n,startturny=o,isdead=false,haskey=false,onstep=ow,ondraw=oz},1)end function ow(n)if(not h(6)or count(i)>0)return
n7=btn(4)and nr==false nr=btn(4)n.jiggle=max(n.jiggle-.2,0)if(btnp(5)and not d)ok()
n.anim=min(n.anim+((n.sprint or H or w)and.2or.1111),1)if n.anim>=.65then local o={2,0,1,3}for n=0,3do if(btn(n))P=o[n+1]
end end if n.anim+.001>=1and not d and not k then if(n.ismove==true)nD(n)
if(n7)n.jiggle=1
n.sprint=false local o=P if o~=-1or w then local d,i,e,f=w,1,n.x+cos(o>>2),n.y+sin(o>>2)if(H or h(2))i=3
local a=mget(e+32,f)if(a==10and n.pstate==1or a==138and n.haskey or mget(e+48,f)&i>0)d=true
P,n.dir=-1,o if d and not k then nA=true if(not w and not H)n.startturnx,n.startturny=n.x,n.y om()z+=1z%=3W=true
n.anim,n.sprint,n.ismove=0,tonum(h(3))~tonum(btn(4))==1,true if(w==false)n.oldx,n.oldy=n.x,n.y
if(o>=0)n.x,n.y=e,f
end end end if d==false and N>=ni then d=true if(B<dget(c.l_saveslot))dset(c.l_saveslot,B)nj=true
end if(d)n.dir=3
if(nA and not d)B=min(B+(time()-no),599.999)
end function nD(n)n.ismove=false local f,d,l=n.x,n.y,true local r,t,e=(f<<4)+12,(d<<4)+12local o=mget(f+32,d)if(o==73and n.pstate==2)o=105
if(o==2)Q(3,4,19,20)e,a={8,7},_.t_switch
if(o==34)Q(35,36,21,22)e,a={11,7},_.t_switch
if(o==66)Q(67,68,23,24)e,a={12,7},_.t_switch
if o==98then G+=1e,a={10,9,7},_.t_coin if(G==3)G=0Q(99,100,25,26)a=_.t_switch
V=true end local i=m("b31a9876d",3)for f=0,2do if(o==8|f<<5)n.pstate,e,a=f,i[f+1],_.p_state[f+1]
end for n=0,7do if o==15|n<<5and p==n then p+=1if p<8then local n=nJ(15|p<<5)if(n~=nil)ov(r,t,(n.x<<4)+12,(n.y<<4)+12)
end e,a={14,7},_.octo[n+1]end end if(p==8)Q(74,106,27,28)p=0
if o==44then if(n.haskey)l=false else n.haskey=true e={6,13,5}
end if(o==138)n.haskey=false
local i,a=n.oldx,n.oldy local c=mget(i+32,a)if(c==137)n6(i,a,160)mset(i+48,a,1)mset(i+32,a,1)
if(R(i,a))o=mget(f+32,d)
local i=-1for n=0,3do if(o==6|n<<5)i=n
end if(o==105)i=n.dir
if(i~=-1)P=i
H=i~=-1if(l)add(n3,f<<4|d)
w=false if o==5or o==37or o==69or o==101then mset(f+32,d,1)local o=nJ(o)if(o~=nil)n.oldx,n.oldy=n.x,n.y n.x,n.y=o.x-32,o.y w=true
end if(e~=nil)nK(r,t,e)
if(mget(n.x+48,n.y)&2==2)nL(n)
if(o==41and n.pstate==0or o==73and n.pstate~=2or o==0or o==39and z==2or o==7and z==1or o==71and z==0)nL(n,true)else N+=1mset(n.x+48,n.y,2)n5((n.x<<1)+1,(n.y<<1)+1,218+(n.pstate<<1))
end function nL(n,o)k=true local e=m("13b49a5d6",3)if(o==true)n.isdead=true o_((n.x<<4)+12,(n.y<<4)+12,e[n.pstate+1])
end function oz(n)if(n.isdead or w or not h(6))return
local i,o,e,f,d=n.dir,n.x<<4,n.y<<4,n.anim if(n.pstate==1)pal(3,8)pal(11,9)
if(n.pstate==2)pal(3,13)pal(11,6)
if(f<1)d=H and f or.5+cos(f*.5*sgn(f-.5))*-.5o,e=x(n.oldx<<4,n.x<<4,d),x(n.oldy<<4,n.y<<4,d)
o+=(-1+rnd(3))*n.jiggle+8e+=(-1+rnd(3))*n.jiggle+8local f,d=cos(n.dir>>2)<0,sin(n.dir>>2)<0local i,a=f and o or o-8,d and e or e-8if(n.dir%2==0)spr(211,i,e+7,3,1,f)spr(211,i,e,3,1,f,true)else spr(217,o+1,a,1,3,false,d)spr(217,o+8,a,1,3,true,d)
pal()end function os()local f=nt spr(224,80,104,6,2)local n,e=80for d=0,32,16do clip(n,104,16,16)for o=0,15do e=sin(f+o/8)+104sspr(d+o,112,1,16,n+o,e)sspr(n,104+o,16,1,n,e+o)end n+=16end local o=r[1]clip()palt(0,false)spr(208,24,104,3,1)palt()if(o.haskey)spr(144,32,104)spr(144,39,104,1,1,true)
for e=0,16,8do n=24+e clip(n,104,8,8)for o=0,7do sspr(o+e,104,1,8,n+sin(f+o/8)+o,104)end end clip()if(o.haskey)spr(145,32,104)spr(145,39,104,1,1,true)
local o,e,n=(btn(4)or o.sprint)and H==false,X<3or d n=215if(o)n=214
if(e or k)n=216
spr(n,d and 37or 36,104,1,1,d)n=251if(o)n=252
if(k)n=160
if(d)n=250
spr(n,40,104)for n=0,23do for o=0,7do sset(79-o,104+n,sget(24+n,104+o))end end end function Z(o,e,f,d,i,n)add(U,{x=o,y=e,spd=f,dir=d,col=i,time_max=n,time=n})end function o_(i,a,d)local n,o,e for f=0,.9,.1do n,o,e=i+cos(f)*4,a+sin(f)*4,f*360Z(n,o,.9,e,rnd(d),12)Z(n,o,1.8,e,rnd(d),8)end end function ov(f,d,o,e)for n=0,.8,.2do Z(x(f,o,n),x(d,e,n),0,0,14,x(5,12,n))end nK(o,e,{14,7})end function nK(o,e,f)for n=0,.9,.1do Z(o+cos(n)*4,e+sin(n)*4,.8,n*360,rnd(f),8)end end function oy()for n in all(U)do local o=n.dir/360n.x+=n.spd*cos(o)n.y+=n.spd*sin(o)n.time-=1if(n.time<=0)del(U,n)
end end function ob()for n in all(U)do pal(7,n.col)spr(flr(x(163,161,n.time/n.time_max)+.5),n.x,n.y)end pal()end function nv(n)if(n1==n)return false
holdframe()I(0,0,v[1][n],sget,sset)I(0,0,v[2][n],pget,pset)memcpy(12288,24576,255)n1=n end function oi(n)if(nh==n)return false
holdframe()I(0,0,v[3][n],pget,pset)memcpy(12544,24576,128)memcpy(12800,24704,2176)nh=n end function nY(n,o,e)holdframe()I(o,e,v[4][n],mget,mset)end function nS(n)holdframe()I(0,0,v[5][n],pget,pset)memcpy(14976,24576,2176)end function ol(n)holdframe()I(32,72,v[6][n],sget,sset)end function I(a,o,n,t,c)local function l(n,f)local o,e=n[1],1while(o~=f)e+=1o,n[e]=n[e],o
n[1]=f end local function i(o)local e=$n>>n%1*8<<32-o>>>16-o n+=o>>3return e end local function n(o)local n=0repeat n+=1local e=i(n)o+=e until e<(1<<n)-1return o end local u,s,x,e,r,f,d=n"0",n"0",n"1",{},{},0for n=1,n"1"do add(e,i(x))end for i=o,o+s do for a=a,a+u do f-=1if(f<1)f,d=n"1",not d
local f=i>o and t(a,i-1)or 0local o=r[f]or{unpack(e)}r[f]=o local n=o[d and 1or n"2"]l(o,n)l(e,n)c(a,i,n)end end end function nx(o,e,f,n)add(i,{m_x=o,m_y=e,m_w=f,m_h=count(n)*10+6,m_items=n,m_highlight=1,m_anim_incr=.25,m_anim_factor=0,m_step=function(n,e)local o=count(i)local e=e==o if n.m_anim_factor==1then if(btnp(2))n.m_highlight=max(n.m_highlight-1,1)
if(btnp(3))n.m_highlight=min(n.m_highlight+1,count(n.m_items))
if(btnp(4))n.m_items[n.m_highlight]:i_onclick()
if(btnp(5))n.m_anim_incr=-.25
end local f=true if(e and o>1and i[o-1].m_anim_factor>0)f=false
if(f)n.m_anim_factor=mid(0,n.m_anim_factor+(e and n.m_anim_incr or-.25),1)
if(n.m_anim_factor==0and n.m_anim_incr<0)deli(i)
end,m_draw=function(n,e)palt()local o=count(i)local e=e==o if(e and o>1and i[o-1].m_anim_factor>0)return false
local o,u,f=count(n.m_items),count(r)>0and 147or 241,x(5,n.m_h,n.m_anim_factor)local e,o,d=n.m_x,n.m_y-(f>>1)local f,i,l,r,t,c=e+n.m_w,o+f rectfill(e,o,f,i,1)rect(e+1,o+1,f-1,i-1,13)local s,o=e+8,o+6for x,a in pairs(n.m_items)do if o<i-9then l,r,t,c=e+3,o-3,f-3,o+7d=x==n.m_highlight if(d)nG(l,r,t,c)
pal(7,d and 7or 13)?a.i_label,s,o,7
if(a.i_setting~=nil)spr(u-(h(a.i_setting)and 0or 1),f-11,o-2)
end o+=10end pal()end})end function nf()for n in all(i)do n.m_anim_incr=-.25end end function e(n,o)return{i_label=n,i_onclick=o,i_setting=nil}end function n0(n,o)local n=e(n,function(n)oF(n.i_setting,h(n.i_setting)==false)end)n.i_setting=o return n end function og()nx(16,64,96,{e((d and"next"or"skip").." puzzle",function()o(2,L,nd+1)end),e("restart puzzle",function()o(2,L,nd,true)end),e("show hints",o5),e("stage select",function()o(1)end),e("options",nM),e("go to title",function()o(0)end)})n7,nr=false,false end function ou()nx(24,96,80,{e("start game",function()o(1)end),e("continue",function()local n=n_()o(2,n.world,n.stage)end),e("options",nM),e("credits",function()o(4)end)})end function nM()nx(16,count(r)>0and 64or 92,96,{n0("show timers",1),n0("slime overlap",2),n0("sprint by default",3),n0("lesbians allowed",6),e("pico8 menu",oj)})end function oj()extcmd"pause"end function nG(n,o,e,f)rectfill(n,o,e,f,2)fillp(nb[ceil(S)])rect(n,o,e,f,154)fillp(0)end function nR()cartdata(nO)if(dget(63)==0)dset(63,69)for n=0,59do dset(n,599.999)end dset(62,0x1.12)dset(61,0)dset(60,0)
end function h(n)return dget(63)&1<<n>0end function oF(n,e)local n,o=1<<n,dget(63)dset(63,e and o|n or o&~n)end function n_()return{stage=dget(62)<<4&15,world=dget(62)<<7&7}end function oa(n,o)dset(62,dget(62)&~.9922|n>>7|o>>4)end
__gfx__
02b2ffffff0ffffff0df906a254db9ed20f69f3e29f946cb242146a25e5a43559b0100494e0b48071793ef94e93837a75afd57e96fc17021fade5e87e2912f8b
507c5391e89322f38c2c2e40f452271fb6dbfd38175c597ee7dedf8f32817bbdbfe376ed3fe4597f2fe1932fddf1140f4fbc7f7cdabcc1d3f6169ccf5cf117b4
52487e72c1cb756f7cb7be11a2eaee78d521b9756174a7429b06bf1ca9f148ea7653bf32acf1bf74e79323f3cd05f170ef2b32df3eae8cae78f43295a1978cf0
09343daf2778be3cf0e9d24272ea4299d999dbc5cf00e8bcb95ef8f569905c5f34bf62049a0cf0cab443746787f78669946874390868f3c50fd22123f36c552f
8ea3f02ce8b225b9b3b2b917e1bb697226dec1f347f0dc176c1e0569c9cf32cad743ba6c12e393271794aecd174995e709ba20df1437c1766972bc34e6bc1f7c
decf1aa2b835f787f8bfeb29dbe2bc1f52ffcf3146f62a9c97a48dc179f5ec4f2b90e2793ef0eb62b122ebf5e4962519a056c36173629493c4b1e83e36881226
e98ea29ac9ef932b769325701956260dc1a6919f307148d8da78803b327863e9c8360f0b331c11ef14629c1224e0753a193eac1fcad8e97a65394311b9769779
4ae784e69d9a946753ffcd25bb35b4ac52ec448c5c59ad62955a9994e267b94a3922e8a45a48c09299a4442dc1d422d34e1972784e988529718c5c9294c1b3e8
424319c494ea88d21da5f517968d1f942976803827d92a6185370db8181bf8b2134a27cf011e9b95770168e59d5a9f2ae0d46bee71669d37c262f3885bec85e7
05378baf6a18c56794279ce799d515b40d38d946747eaf16c7767ecf7ed9e583c37d9bf252e2b6c36d8f14e9c4e2ea4e0e6fc2fb0171dd87c2b554f88cf53cff
32cf02f8d5eab0f1a2d956c7b520584297e09ffb6cd20f30b63a98f38cdc304a201ca419b6dbdfd48ff781e94e229ee8831c7b3a179f56bd39ea919293211f72
8152cf64536ba5f222bc702a561528c21b4a1fda5169807236434805ef229aab69d0b0864219b832da361bddde22c149f146c312c10e36988b8a56847295c48f
9ab4266972293e962219b1c325e89911e0e94c2329ca9f525390b54f7c346bd327d139914e18d99c3e010268b934f294e06ebc29639d29d519b2985ab537c275
c6604b0f0a1d9c093a9ca76868783e83ff887ce8a446d093807d593294ae83e84f8744429c69c88d2b4465de1754448842f1b4ac5951701cc98845638946b53e
ac6e2962b8422962d4688098a15290489e22f88848523194580cea3e8d22aa233b946b58583a6b46b4e061970119e2229097c27c63e852902270111295820a59
b48c14b426469cf170d62bc8a2211c129a19426397c4e8934c0c161289938402c2094f070953272f1318a2f836039a143112ea4213160b683445a620219f7e8e
3a7850a3e929e1b8c0c5bb027dc98046f533f46a8812f968083c2c1c78a56bc5e1e983a5998cb26987e1569ca40419962e28121071704fa495e8a4e8b30031b5
802c2317427c221740f854ef8675740ad30656ba95821e8c49adc1f5fc5329a0ce966c1a6b345e074491827ce884a0c52213201dd876293892e9cf339f7c3bc0
524858f1e947694c668c169984fa56209bc373e1c1388c397c8b2bf58b54e4842d36c8b222b546a7c868f6bd4858081fe1e8088d4119754def9f3e31b036bc40
2f4f98e4e9284c420e8b297580958870f01f00f80954e48d52f42b9f508b4c1b6abf426239d67d8402e846bc1b007446ba321594f9443c1bbe9a01954322b72e
880429012d96d22d842d8672f0d644ce212b080d0ce391f39fa2b0342c22219a46398c3972bb6457f422d84e94c8ea1f019940239b22578016d889d09d42a2b6
793e9c4d24c2742129298304615c2c7cf16b4383694e04611a190994eaa5cf024ab481b03927c0d07488c7239d84d19c4b96729097c1de8c5cf54d16ce297f88
4c629294c39c64688e5c91df1c4878fd854e5e6e4942b17a55665a94e7d809f1ce1e6b30cfa88c1c5028cf39f38531e52429cf01e3073811e0ee809e0f744ef0
b23e1e1ef00f272fb1f64e09798856977ef8d1940f9c3c9cf4c1cf8a76248b8502544ea8c994e729f7878fb03fbcf1d888422222048c322461a493838fdc2cf4
c53cf181bb4e772b218729ef11752db61e23c3c3cf10e30725c2731610976c39f1452142290fae10acbaff0723e5070fcc503645e1bbce594800c03cfd2f70f3
07f4b2934017432688114206c4730e8070ffff3833480d01280353c80ffffa22801ef72103a2801efff942a1ef7725efff052030860020a101eb050f87e2fef3
aff8d56ff9c0cf9e2ef9fcf3f3439428c3bfb86eccf5c1cf543bcf54defd1a16cdc519073758073f948b9ff9406878070f23b070f232c1cf261e0eff3128cc5c
f4c36f39c3cfb6ffac1cb103efffa2737760ffff39fb8212cffff4ef729fe91dafed77117c46b337793b39dfc932f7af02fcf36ea3e3e38e39cf0782c23d4df4
0ab5cfb5c4e8c99908667c94c6cf1014a80e29f58267c6f3f7693fc6c40f78c544a0098c534e924f7e7003cfe783e430e6a1e1a4248b3c118cf19af56b8f9827
deb32f38c921ac24878b8788cf221e522f7071756e59787c7217019fb8b03cf321ab0fb0f2f9c521249e167cab53e74bf696e70e94d29523f8cf3c534ce1a44e
26d321f3abe2593eafffb0b21fef7ed7c1fbb313ac811a4821ac811004815240001032120004811a4d46ae531042900626421042858421809021616944858485
834694298c22408168c129344a514697242440708329c529078c5c13908c5583680329848484219460039f70120480948011cf9229062ff42ef848720c0b8421
1e72e90f0f11ef3c4cd28f35604842294c5221070a180827430d0e321646044290d8401121ec21a144ab4809052129016148503c31681485848480914868c001
212161681e1effffb14648252483000000202000000005e50f718b90990068120421b80c024242481b0909090929011223a48136439090502904848484890e94
4932131421d64860f5211952c2c03009426109020e1938b216090b0ff5019046940e39802900190018429429090f480394025a480032752a2f34284025a29069
440b024000ff30e8424424394298422902b5807432c24884348732e02011298ac28b242021093044e844324c11901616c68681b12121612161242c242c01a424
242c8484848b0cf128fff7e28f62e51c30efff308f391114816821ab80a988c148236c8136401032c3020000000081684242a1485294293f9026810000000006
429018429404218090909388c2422905ef01280f3489424242442702968888412b484c1c1162b409ff5c809ac328f35642140d989852e7c489884228f8481910
9484830138483b48601979784423942984420c21290932111380b0944248c024382c24242c2c03c9121e903a148484851efff19746e020707c1bd7f742d7b2c3
877294c1ffff74ef0ead9e1313b1f706c380000000049ff76e136c9c83ce72224466121212125212245ef1e2e2e4e2ee8c31241c31a33d6c5c5121214e984259
fb838396839b3f38078d5c5c2cc6138ac8424840805ef1e8ccb43c5cd0640c56f48326b08852319444608ff1036c9cf8c1c70e1e952950380d014852e772c1cf
f18b2674c11a197c3c3ff377dffa0682d99190758fb82fff77464944a1076807371fff77834609361e712c1cbcffff19c877976fc26f71f31ffff921dc3e840e
fff53f4810020efffee2c30a804efffff0a8cfff5e0ff8cfff77f1e94cfff9e0d44862a0efffde4c4e02b0361ef2efff217c039ba245e2e6efffc139f2171727
0fff7c83221128368fff7c040101a80fbaf0ffffde0970c819071f48d14e1ffffb868b20e0e90524a0fff7b249ff86833cfff53142c52828198cd00fff7bc254
0707480b11c91efffcd227270f1f701efff854219f580901070838fffb506cf24341c004ffffff0d48fffffffff1100043b2ffffff0ffffff0df7040fc93a8c2
577aff73113994666bc466233999ca399856bc4c2b56269d231bf95930293e2d7af44ef85c33dfb82fff70c1c3a4c7e97c1f71514871c817171f48190715e16f
8024ef1ef4e9444e0e4e5a44e29acd2f19324261e2ac3cf10640c2c0c541c7c2cbcb983110a11715e23cf71e4ef711ef741152ef4f80f583053016c1c8b342c2
c112cf002c111328fc6cdcf7c90a6f748392ff485874c521c5f4afd2fd7abc7f53b3f852e9877fcbf6e86bbf677b772e9ce78c3f3cf0f3cf19f36ef8427ecf06
fb4e7872edcec3aa9c5fc6f51369c19727d5f4ebbf81b6feb3e90ded72f4e2ded72f48ab5cdf4e93a68b2d3e89e77c87e0ef2e8cc154b4ca5ad21961ac37c85a
48693652ea323fc6e8323f1756a61102ee6642661a90e95c11a1e84619d212f66227b6a4ae945d3250cf63538c8a2e84c19f3cf2e7913e6dd2574a9b21fc2023
3f762148356c11e84d7cf0e89c4ff0298b8f942cf69c08f13c199bce2bf2c367466cd6838051cf89448abef1ea4c1cf1270742e3699340d84111cfa901694e2d
72a79c3679c1ab368db990f52a0934070fb54088c794f88e51e0e7b361a3e12431bcc39280210cf694014c6e78c4d11b9323174c6ed9c32de78583e95e704c24
237cc3e897cf9b134ee7a22dd39b35784c39b7511e17f1bb3dbcd1746fb0198529c8849849fb830c01e02c090cc11680811680786812131a1930c10938fbce85
9974ead1216a67ea5903d8c12166676a59033b77bbc17c6e836c174aea4d39b774836ce2e81bb832c7c10bbc77cc675e6748764e8075e1ff8d399bc1f46e2fc3
1e2fd398bc55f2bffb83e17ff4ee3c5c1797e29bc579dfffb0d7c1f97e2b67f2f4eec396f947f4e0866070830c10e0070830c1485c24d17ce87e9e2e8f91c162
c31a5872c31e90d2c3140218729c81263991942b08687c6c41838f5043c31e9071868090dc454ae8443943616b783c3bc4d1247361485a48d08d08d085016346
8f3d14e3958de0e39f13c121e007083049b200f56e856e26c4ed5819de0fce0ab294524242c31a48212121a48fb905ee5938f12c323a1e807136c8d012c8ff5d
07c447ae3b50b1f40161c0685016140121a148f9942e91e89934ec921b190f056c821a480d0f0fb355268366e89afc667c10270868501a4680912468098c10ad
d87227068366e856e24ae3d86948b80703c03c03c03e39f7c801b179e5a71417a2d3805630a580912468091e1e0390c79b159ce729b4e2e858762a348c0341a5
861a32112981144f9e198c29d5c5c5a75832c31e90f4872c31e90fc8589e858729d3af31ffffac779d5e874eff7259b20ac5105ea08271369b2f83074ab9f10f
50c1c10e927c7f7c87ef81fcf13e9f3431e0543c142933c378383e060f30e87c9af7802e36786d42f0244ba5e84dc15aa3b62243c31d2d743edc71528651e2ef
85c30c3680cf10458c3c3097834b252421d86218d3a2a9867a168274283aa21d81f41b5c42271d8d90299b4eac6f848552178be9df074236f4c1219c2f170794
4a99ff107131c3c8384c0109442a81b0b95ecd2294ec56298b94cee0b4c798329c1165946869d29d715042bf587dacff24ef42dcbeaa42c798f1834ef70237dd
cf3a868b8f524e1f78f583643142a1140e78ff103dff58c5c8f2766f48ece0645287cf1e71610ff729ff58e13c2cf1706a56e817484a211e916fbcf0e32709bd
740bcf0ebc9370f4d761db2cb934853c17c293e09ec64318f5eff5c9cf6e83c99081c3fe0f487241c278b2b0a49425492981aa809ca8a55e1eacc31e1e29b87c
ac1448c9120d3b42139be87c62c12b61c39fc5279dffd2fa1f11e7029fe79b812c097a7097eeef1cb745c057e546ecd3702b0f302bcf29c7fb46948324531e80
b80ee0fb48f52cf23f7cf22f7c4444e07d8036319830f5ad4c0f3bcf3cf3cf43bf3c32074209442c922048722204802cf02f71f70f354c320b06129848f60121
08c0219000a1e790fb48b8f9444c0b18c242c245281248840b0120e80f301e70079cf51c4ca042c2c6819010514240cf11e5acb48f93898d1088090b087a2c2c
55161e780f1f0f13e6e1e044af0069848580b4408243110a243c328b8f301e7905ea84f1184224319028070822270818742cfc1e7901ea84f310420d442c6821
0960520248ac81fb190fbc0f9432e10c24342c1140824a2220412803923ef2a48f18f2439f3e144a942148504808022801010f70fb1f30ff8cf34561c0830461
ac0461acf1af71f70ff0ff1b020253a44a53a4856e702cf048f180f3022ff019313187a0628c350bacdcf7cdcf597edf525fb17270721d380b40eedf272cd1e9
090b04e8c1e0e79dc1c1d4e8729be1e222f78d3161c08f0c5c50e2e80f300a7cabbe856b306c6c278b24921250c7cf0c010f30f30893e81d321fc5146903e7d0
78d51e720120e0e0074832c398a9404429d18194c50e7080eb0f087049f8b878f29c3b0852e1102c0c5cd1eff0c54868f58b0cf4488533f0f3a48f8f98ff7030
1228380505d4775cf4c10e0e53cbc7c3cf3424880e0a404f078dc61bd3941cfc13c83932cfbc83215070838c428727cf238c818f582f38c9c1c0c50a4094a221
0421048990dc3e7064149b807583923641cf094e94c39838c39e15693298c31e02c80f79120e02c1c5cf3164821a0a2fff1e7203643c74848f5241c10e00bacc
9c1481501ef1e1e3ef1ef1e854e81932c2b0e5eb0879f534858f52c348b3e8bce91c0fb08fd8f5848b9fd242c81f3379bf2ef1fd7ef093ff8901297294ecd480
9074484b9042d840962ef878f99b87c2c16711b3c37171f30ff4872cff47878b242312c181248f60c81d1e80fff4e160a0020e5acb16cf1cd49ff112490f22f7
408387879216c80f3071705efd4c7cf22f54e1e5e66148b9f12801efd4c3cf097cb0954e73e8094cff180f362ef6ee03e70ef041e70ef820e70fd39fe86e27af
3e35e787429bf49cf1f083834ec0507072ff271f84834f2e3f3c5c5cf0cf31e90ff3d1e1ea0f0f1f0f70f31ffb6e1e70efff1782f702cff580ffff091ff27175
8f58b870cff4378f181ff1f090ff306cf81ef6ee03e70ef041e70ef041e707c33fbcf25737f337ee89f5c10b36f3424e7c5c093877b91e04e9ba2cf1dc53bbfd
f36283267569f56f03cebf5c2ec0b1efd54def844df2695e8191afef29567c97291afbcf239df27cf246022d0f7c11f52e2f1f10420446ec069b61b324c272d4
0713938003d781fb8c14089590191100bc5a68bf1b42b8452252b44adc86e79032dd0d6a936e809380bc583e02cc2e83802919e077187191ee0129c12850c7cf
d2ff3162908f2aa1974e8520f06cce8c1f876e10e856c15560948136178036455813c69e24815e85268bc545c4269aabef16b0a906e1610840371b70021cc8d3
009022f76c3dc331022163cfb529c187e8a486932524b4f821a59daa7d19bfd7f92f4fcf1e78f3693775c55f58724157695e872cf3cf3cf24cac59d34ac59d34
ac3995274836e5b8b297e11174e9b6612c0b726175816f6c2eb0349c5170ea6421075322e0c546e8486d146e09a724d1800428bc3c110428bc3c110428974493
ef00f70c1fb0fd41c4d092934905028c1241e014e01a07022ff0ff79e3fd476209769c559f78fff83ef1e7983e706c1bcc08c43972c81b874714c3161f85229c
3161f8622ff80ef09fd6e1921d2f8e29365e484009d19745200b3e8a94006dc27cf1b4cf1b4e8f342e8f169932bc1dcdf346974836df1c27524bbf5e5bc790dd
4e798cf294e71cc196e8c16793fabedc9d3a9856694eb729bea8c3bbf8ef16f7c8ef13cf13cf3d70dd51b83be71a78df72b07081fff0e7a96bd582202800ce88
6cf19935a99138cf022cf080f308f1d61844ab42fb4271939840c119b52cf042cd4a2bd1781e0970a75ceff0c5a04839d2c9c25f2b08f620d508522cff68182d
d2e2b6d3c52d82e29e8eb27943f53598ff905e0e842f74e8cf2932ff48b97841b469ffb03e602404ffffff0de310842eefffff10000000020000000000000000
00000008ffb0d42f1f31d0f1ff319b8f79b8b4e09fb838fb9306ff8dfff393a8e11e7c2c31e7738c1700280cfff73e7a50ff58b242c2c51e0e7140c7c9c50e2e
80f300c9cf0c010f30f30858b2cf40240c1c10e8070717187049f8b878b8f79b80d0fb0fb0f31fff0602c90e5e3e1ef12120e02c83932cfbc8392f3072703071
82108b807583923641cd1ef2010701e0e2ef7206c868f8090fff8070f1ff0fffa0161e790f01e7c02cdcf61216c0d50cfff73e7a507cf3cf248f7928f52cf2cf
f0868f52cf0cf04813e70eff541c1cd1e6e7e0f30f34839fb9ff10838ff3073ffb6efff50878ffd35ef60f01effb12492fff90f740c1490f33360e70e3e4acf2
c5c2cf81e2e1ef7ecf1c506400ba0cfff73e7a5e8d10c10e830830c17007083e00e00320a0080820020a0080820120090360090360090360090303e4e0e4e0e4
e0e4a4048b808071101e2202cb48f180f301e702c50e203071818b0c0c50090f5868f243c71a1eb02c83818170303e0606c1c240001050040410010500400481
30848130848130848130805e0e4e0e4e0e4e061071101e2202c54048b840cf048f180f301e700103071818b0c0c5060ea1a1eb0d0f5868f243c03a0cfff73e7a
5e0002c11483200a0f6858734838780f050872c200907d070ff13ed08300e3e06583a03e025821a485124781870400e8082fb40c80850c1480901248136c8116
801e7321ac10210848f0cff12c50e780ff48f32c51ef711eb0b02c0c7108ff00092c2009004a0348092c1580b0d0821a4828030b0870484801249f520247801e
02c20e0e161481f25e74e0e201a42c5105e2071702cb021e520ac1c83832006b0cfff73e7a507c603c0c603c0c603c0c603c2c8b8b8b8b8b8b8b838216c8216c
8216c8216482560a49182560a49116c8216c8216c8216c868c100a0d30041a700824f00050160216060216060216060216428030242803024280302428030200
30300c0c00030300c0c016c5c5c5c5c5c5c5c0c8152c8152c8152c8156c0492305ac0492305649036490364903649032824f00058e100a0d30041af002c0c042
c0c042c0c042c0c08001214810121481012148101214002b46ffffff0ff7aef40821436579cdaefbe19c4d574aaa97c3e237d79aa24e12fc4fa594b96e136e8f
655aea37fab5d5f34ef0fb8abef94fe36787e5f38f34e9999c3333976662fccc4e899dce236c0cea094c80b0910b0136c66c8dc24d62ff3a6ef83f7159c13781
7e1db56e2f784a179a5a1f8a4ed9bd836f8c2d87c16137817c1d9cc5e09cf3179f7c2f4c5e19c71f8f427caf461d624eaafbedf3e793d67edfbcebf12e973979
f673e21e2076e2fd4ee93c15675f6c4e9581f62dc6d8c28b6f162e103f5c787eec3d277887fcf7e79dbf7cf297e2e2be3ff83a9f7af0f3070b0e70c1fdf3fcd8
b80ff832e708f16e783e6e19cf28f388215109ef0884e6c9483d2e60fecf13c9c3297edf5c9f8369c1b32fc3def0bb8fce90f75f793e8363f4e3b1f7cc6248f4
93f794d2b0e23634e013855225f0d9f36ef99f70cf209f369e7d888d5f707ec9fc1b57938b33fb0ebd633f89db8df3770c8f5e0cf37f6bdabfef9835ce51044c
c89f1ea462c6ffc8df3100e0cdb57b577d20269c1ec3c1bd6dabadcf3d42bc9fa9777e5ef8bf2f982846e56ed4c9f0e1c18c5fb4cf114176aa0f34eb40f30002
79b71b5c93f6ef17de2bcf0ee1f2f56df6fe1762907bdf0a2987e783fc6b48932ad174291f303d948a6f860487dadf78629116c421b6b2d1f13d863a946489e4
2492f97df3e8d593e873fe1bbad6e9e1c527e7e707d1fc1d07c10c3ea3d5df728b0c30e9de8787e78f383ae2f9bea529bb2e1aea367c17d3c6346df4b21c70e4
07d6978f3e86cf17d5b7a97e2f87eab398bcedb067337d642c3493e01f4eace794ebc2e6122c69f7ee83040c36cf23ff08160fd5f86b942fd9aedb89f762fcc3
b66da7e8e574211799c3d3837248b16fdf34e051f47b539369977780f2196a22f9722884e1848fe019f1c37878c6768324e57f2798fef85e1a6fbcf21b90f162
6772211031fef2bd6b777dd1122b222cb2114e783c2ff484d14cab8df026f23c9e019366e706c14c979ab2f48b293e795e16cb48f3801c403f7cc98985e5127f
37e6bd1b7fa8db6278878ad6198ced70731bc0fec5003b6d19cf2e0fa8cf137ee8d27d6acf3ed4ef137a0f71287e07df2bc078f5003fb872763fd5772f7cb18d
518a0f09fe2bcf28eea901f30e8cb1f9db98b3ec3d3b3274f07ad7fc57f7d34e93c5df1eef7266c29f76e2faf16f64354484326462e27111d044843f4cc7944c
5e62b8668884644cc85e7977f6793c79ef0fd1e9e7d77f8df18329a7932f4e97bb398cb98339cc1bdf1227a4ef04c6b98884439cf0e8de419f542722e9d631bf
7285293c6bf88d74f7b8d6f3c17de475fd4f85e97ef8ba9f788cd7bce0dc5998c2f5c5ef8b6b7229302e49cb454485ec8bc62b84209f2293611169f12e299c91
9c30119498880df1279ce374e9b87eabea3e98febef3fdbdcf12df32115cc2ef8c1b3f8d4dc9ed9f5a288f70fa8f58c963f916a6244411b0e6956b7cc363f387
401f70e953ff87675db1fc1b7eb4a9727d16ff484a62efa0f707edfb4c77bc51bc9170908fdc91e702f78819f529cb1c40cf748f8c598b5674c6737842c0e785
ddd7a75c159e12b38ccbfbc677fff167bdfff980fffffb11effff732cfffff648fffffd80fffffb11effff732cfffff648fffffd80fffffb11effff732cfffff
648fffffd80fffffb11600b966ffffff0ff7aef40412386e57d9bfac621119d26c4b7ca2a972f8bc4fbc14cc57ee1f8abeac3e557dd9f1cf1aeaf52ff8f7ec3c
5ff4e3f86e13fa9bef94df1aeaf525f38acf31df1e457df3dfa7934ef938989bef9c37ddd87e8df3e7932b9f74ef191360601299700b91363362fb87c6c1c927
2f48b0127df3bf2db667df0717a4c3702d451ab057a0118dcf23fb82ffcce79b4294446e938529a2461a6244063b9913976d3ff9e9b36bf5e9344bfbc52ae008
14031e666f060ebc583caad98c254762834181403164ca81839fc7c860191ea7d50ecf835ff37c5fe9f46ff89be23ff05ffc351c50e562ccf2c06ef1e2ff0e4e
f0fbc57579dec3e2d3ff87e9d694cff739c6bd6bd6bd622222222222222f4abd12fc27542ff4cf098b39c21fb48ab39cd94ef8bcd112ede263d598df12f5c916
0ce792200ef87f83b5196f27203f42ec42fa1f52a1aef13bf3e96e05744202229c67838b89d12cf20000e78ff7cbe8554a42de17787f98bf161f640684bd67f5
380e9c44469de1301ef1bc1c3cf239837c0326462360f38b5e7178875e0c1ff0f6c39e38c2e1202e362622e8f1c1ef008c1705fcebb5ce834bf7cc0085e4e84f
__map__
13588ae0f1dcae279954fb02ea0b11577ed92ac9198b24678803929cf165422289e83623cc7d5ee7fdc374585c724a2eae573e62c4452e6224f7fdc3b33cdb99dae5e15836b7e4ca715c579223d7b6c391e6ca2f7310c7b5ee971e49de381dd9769c61b9bee3fae5dc9938c03f768c3ca5ea832704de0470245ee3706b0e39f6
2e93241b8e4773337e90438c1f38c003a938f8e65da57c92f45a991c61f1388e1cc71fb64e92d8747925bcae030ecb66afc3f54918ff48166047486411212ec8a148153bfc906df1248e85f28f993cce1efb834242d492a4de4c9ec44d1c6c15045e79c8b8e29fa5ddf1e2074c13d137a96ac8c4c0f8650c2669be53e493e388
4df2c351f4971ca206c3e08703c775c52f04203e277545778a3c632e7c57e71142450c801b8ff8a078a9ef75704daf2b4c78f3f941dcffcce223b9fcf2fea1f138c7a5e9c1977f360b3d370fff1b6e3bed70d13e5fc488fb8f7ce6ea1fdb0e2c7664f2c3c43ff38f47a7d3caf224d992c71fd9921f1cd94476c49d76c7b61ef1
5fda897cdb736cc79ef8e9388efdd2c791fcf074ab47229bd872c07ec8f8882bf805fb803fa2323a0949f68bc4e248248f591e2442892ba8382ec1a696dd6ab9b2182c33e8e113b2b89dcbad5b0707c76247269df8637f94bd8ea5b2f970a8643feaa5ff0a39607dce53b0fcf25973c2fec87600fb07c788995b5fc791caf2a4
e992c7912d51afeddbf65d713fc7b16bdbf3c47fcf71ecdaf66eefb31ddf174be2072249deaecb58b0a92d2f2c1923ae0fb00f661167f639762c24d929b13886c56c098c10e2ba007b6016b1ac62e4f187233d16b5adbbdef0a572f3ccb15f82c013779a1f1af9e3dad577db47c4b51f1cbba294fc10f14b2a7846be2070e4da
65cf2f897f3a93cf7264c42339047b9ef0c0fdcb73e43df3f442f243cee8e63847303f8859f24bbe19f938fe3896235df07eb62759e4aaed8ff041b97ef049a4bae3724130c7e0c7a8e6b5624fb677b67f58aed04b1de6ed7185744b78de4773b183a4b2c1f2037391494848f258164deb916b8f713892bd9183e5657998c5fa
05904948c81396edb46ddb9a6f708d3c48f30bec83e380cc1eb26d335be24a9e58b647403cbf1cf15ce8f1074974c7226973a23f1cf3d8716d2d3d42f1e23cba24fcb33c2c2478cc1a498f0dc7b1882c5b8c10fb236923ec0bc77d1cedbc4ffc1096499bf0cfdb6edb46837f7e398efd500d7ea18dd005b8d776db36daa00f1c
c7b13f22cd3661c4f5ad23c7b16ddf83707cbbc9b7fdf06d3bd0de6fbb3f68701f6d6f1a326c7e498ee76893a38244be63912cdb2320f624fd40c271afed92f3745c4dc23f6fda6dfb217ae07e9ef689c2fd3ceda2c18ef8ae5cc721b4454f387a4ca4d92284787fd1ef8ff7eef948b6ebfee7d2e87704c1995fe459716cd72f
73986156d8464ae57fa6e41069e197e7b6fce1d8f95d8a38b3987e4072c4b38459dce4700819d99fb7ed976d9738ba556ce761abd8fe5ce6e8061547b70324f19804fc60871fe60f380edb2fcbe4eab6882b891ff00c95fc22c7b2d921c92f46e69f1da7edda86ebda064f0249987f249363d93299cb9a10cffafdf0c7337ce6
8febcbed8a3f1c92c31f227918c4a8f7993ecf735c89f80e5fd77f9a1b5ed7953cae7f5c4ef170b9e5fcc7e5c1cbe3bda739aeeb8bb0a3fd251775b47d7ee0bc724988e3721cf0873d1d17f5bd644ca57175b7e6973393f0da258e777cc47b8e4f7b47587fc8b1185b63fffffff07fea4f804a912bc35d76ef5031577378d475
e572a9ebcbe5d23c4eafb9ee54d5f343ee9df2fcd1aef2fc6126cfcce499993c33936766f2cc4c9e99c93333396636636c76d9658c815dc6c8ecffdfdceff3c3f1fae13d76787fd9f24bec4992b8c4f64b5c9be5892d49c4e7175bc7bb2d8b2549e21fb1bdb9d59dc487640df91ffcb7feb13f1cbdaf1fae3d7fdcc2fdb6fde8
83e3c61f8977c7d776690f9873fb18dc4fdb50d8e30f969ce307799f9cd7fbc3ce6b7bfee6f82fc9f3c758afbecbf184fb97b6bfd007c71b24b6e787b60fe9e07edafe40e17cdafe120d04f3cb232c7d72b6c744faaf84fef724d7f3c87b5ccd72e4e23edb8e1ea425993b398eb67fa415ccb985c1d7b63c3c62c29bc9a772f1
1dcf766cfbbf5c7d923ef4877393a579a2592a17e336fd23b6e4d163271b71da76c496cc967f92bd598e25e72be97533916bebcfd4e78d3f1a7f24c191d4ea8e6cf77389e39924de674e0c91c924f14fe61fc029599aff07f5b8b3a7e14c8e2cbfccf2105f1259af81d9fe89ed3944635bd57ccc55e99d789f11f33157fc92c7
2322d2feaefde35964b1c5972d8c25771e47e624bbe6ba7479275db69b398ee417f1cb8e55bfac632adf755dfb65dbcf48b432662272278ee4f821f1e6057ffcf0875fe87cc3b11f7ec83ff02c07c43289b9087250879bcd012497d49dfd1dea0f2e70f10f8f0476488e497f310ff3de732e976e7f5cfc423d4bf28ec00f8ed4
0f2226525ba6eba48eec6fd7e1951ed178e48cbdeffc93fc719ff37de211abd8e3b25f3281a8d76935d7651ef3ced64c882462c496f98b637fecd8b163f78ec53fcdb3eed9b167c7e29a1fee3872fcb23cf5ed1f7df61e89270346f28f1d788db10123f9c50e30c6068cb101636cc0c8757c3ff4ecc7a7b2f9a23ffcf0cbf111
fed8f187efb9edfbe5935b0a8117643ee39d777e390efec05ee49503027ec181134f7765d39f7c3d2a57f31c9eafb7e7f3cb4bfc20b9f48763a77f1284e3cdee23b69c76396d9698f561e7f00f6cd86b56f3c7d1acedfc71fe71ec3afe388e7b91c60f599e799f1d479c4f8f77fbbe977fe6c1953c71fd0ff887ff3f94cfffff
6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f8401d063fffffff07fea4f80ef14326597badc1ec9548ea86570d4ccf5a4aa76e5b1a689d932380e33cf976b975c673b5f5c6f3b8deb6da771dded34ae
1fda695c7fb4d3b87e69a771fdd31e8ec3f18bf9632a83641ebb4ca62a04e1314666b319300166c00c9801336066d879fd725e97d73ff937ff886bd7f24b9350e911dfd8327cfb8e8bc3ec5a647d5c2a554763213db20cfb3fdd0fb7c7f3cb79f4f9c799fce2fd47b87ea1cfe99f7fba6d4db4c72fe397e587876ff14fe29a2b
c0eb4845daff89031cc39b4b42a2cf9526d1fa381212767bae6e5bfff9856e8e5f1844124772f5694a23ff3b39f0e6827f127d1c07a19ee9037f3c935f8ec833b97025f2ff488f6e5b9fedd8b66d2222edff407078bc397e585c47ec8aa7eba8b3fc805f240857960326ae5918572406c0fbf4a8c8fa3f1082fd20a9c5dbd8b5
77dd8b38cb89a309e69f3c4363d7fae9ec3d420476bcfc6277f7c7766c6bff356078f3489c67ecdb731cbb10b71cc9e2c3fedadb6e5b8fedd8d6e9967e477ca47573b81ffe2f72fd507dee95d4926bf98824b2f8b0f9c7932709e662c8991fba6d5bd23f32ffec785d4fb7adfd9fc86c579f3e7daac76a8b25ff10cb9c4d1654
9f708523dec499b988237379fefae13ab6add7b5675bfbafe1b876edfae5891e62c9b73c39d85c43bd4fb85c6f58def8289b238fe7c8d3f67fa038ae35fd125d63f349306f2432a7631e09c9fe39e20dfbc1fbf0e8fa872667586cc77b77fd9fd8a58e3d3daa5b2dd972308df8eac2a63b22d7f1a54bdee42093ef893f2e2c89
45fe27e0f8a16ddbfaa5b5e45a2ee249fcf1b0598ee1b8dcc7b13fc42dbae5842d6d82dff2b5dbd67b3bb6b5ffcad80fc77a5d5bdfc515ff401c09715eaecbfd241287b167fe49fc91f8e7f2cf75789bfd0f64b23fac6dea58be17ee5fce2fca0fb8ee1f7ef0dd7fb8ba79373bb11badfe5021fa09ff07f2a26bfe596dcbb6c3
1f4b5cc9d7a7f95b0eafe3f0cb15c7f1fc7172fcf3c72ffb47771d9fe6dab66f7f78eef3fd05e7f9a679ebe9711ccde5b8ae1c598e2ed976ac9cd9c8a1e27fc4448f1dafcf9d3f2efef1a97d3b67edb11ec773f6979ecf796e93624ead4b7e38bf5defcea9a7bbaa6fff78be779bfe4f980c95c495a6213fb83cdfbea9a353fd
a7d7737ddba41ce271ccf0b93cdfbed91cdd337d773dd7b74dff278cf99c72921f72321ef73f3fdcdbbae797b6477ff9637ff4f8e187bbdb76fe13dffd4f8eaae0beaeefdb8e698e69f65ffa7d5fb76ddbb6adffdaa5ceef8f5f12619ee911fbc9f1ff37c3ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff
1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f230c3184ff7fe3cfefffff07edeef0000406080a8e8d21757d5d5b597b898b91212426282a924d557781716979953365e7e8ea40424446484a4c4e5052545658466f6b85376d0360626466686a6c6e70727476783081828486888a8c8e90929496984461e1e2e4a0a2a4a6
a8aaacaeb0b2b4b6b82a111222c2c4c6c8ccced0d2d4d6d838313262dddade5a9a7afeba227301191a0c0e0205092d7f393a42832d2e0a111315171d1e5c5ef2f4f6181b1d3d3e247d7ef8fafc14169c9e3436bcbec0c3c5a1a3a5fd2749922449922473f478ae3e3f7ce77bfff0c72ff9e7a7bf7e5bfefbe11f3ffed83f7ffd
f7e72b7f7f7efbebf7ffc11f3ffd1ffe17ff8ffc4ffe2ffffd6f7ef8e1ff73ff6f1cffa3fbff71dffddfdeffa7ffd5ff2b4992244992e47ff67ffbdffdfffe87ffc7ffe5fff37ffa7ffddffe7fffc7bfbfffe7ffc3bfffeb1ffff93ffcbffd9ffee7ff8fefff013ff4febfbffffbdfffd7efffe97a1ffeffc06f7ffcff83ffbf
f0ff1ffeffc4ffbff8ff1bffffe3ff8ffcff93ffbff2ff5ffeffccffbf59fe073fe7faff3bff9fffcb2fffebffbff1bf49fe47ffc478ecfff7bfff5f39fe67cf0fffbbbf7ffbedfffffcffa1ff7ff4ff97feffd3ff9ffaff57ff7febff7ffdffb1ff7ff6ffd7feff9bebffcffdfcffefdcf9fdfcff1bf93ffff13f991ffff9bf
fcffbdfffff7ff07932449922449feffe1ff5ffcff8fff7ff2ff5ffeffcdfffff9ff47ffffe9ff5ffdffafff7ff6ffdf128e9cefffdffd9fff1ffe4fff9beff8ebd9fffffdffc3f9fcffe3dffef0ff97fffff3ff9ffeffd7fdffdbfffffbff8ffffff3ffbffeffdfffff7cfe38fefffd3fcffffae7ff4338f5b9fefffeffff07
fc0ffefbffff813f5bff87df7ef8ffff82ffff3ff8ffff84ffff5ff8ffff86ffff7ff8ffff88e7ffff27729d43ceffffaff0fdffffc5ffff0ffcf03fb8ff390f223ffe78e6effd78fcff7fc4ffff47fcff7fc6ffff471c9158cff37ff1cbffa6fffff4fff03f7812d1ffffdff8ffff8efdd1fdffffc7ffff8724697eecffff8f
fcff7fc9ffff77fcffffc99bc5cbf3ffff29bf3effffbf727ecbf5ffff2dfffffff2ffff31ffdfffff9ff9ff1b75fdff7fcdffffdffcffffc2ffe4fffd3fe98ffdffff9cbfff07ffffbf73468be4ff2664fefb8fff855c3f74d7ffa2fcf0dff1ffdfffffbfe7ffff7ffeff3f283fefffff87feffbfc8b1ffff3ffaffffa41cff
fdffffd2ffff37fdffff53922449922489fdff7fd4ffff4ffdff7fd5dffdffffabffffcffaffffadd72fffff1ff2dbfffcffffbbfeffffebd7ffd9ffccff7ff9ff27ffff1ff6ffff63ffff5ff69367de9ff37ffa3f6d0723bbff17ffffbff03fddffff9ffdff7f9a63ffffbff6ffff6d39ec7ffac7ffffbffdff7fdc7f3ffdff
__gff__
95f7bfe3ffffe7feffbfeeff0f1c875f7ff9ff07ffff7ff7ffff79ffffbf97244992244972fc3f8ee4ff1ff8ff07f37fdae1fff6ffff7dfffffff7ffff81ffffc17fffffc2f5ffff0d001fa1fffffff0ffe93f102a3596db7f48fcffff15e1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1
ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23ecc8f47025f6ac9ab492fa7f25bbbeefdcf61dddbbedd8bd1f76ee8ffdd0efed1f3fec9cfb5dbe9de7f5
__sfx__
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
05 7c71797f
06 3f49353d
07 3f78431f
0d 5f760a37
0f 5b316d5e
08 766c1369
05 365f3675
00 69137d7e
0c 207e306b
05 7d430e37
0e 1e7d4341
0b 630f200f
0f 6f661c53
07 067d6175
0b 7c610d4e
00 3c3f4c5c
0f 1a3c660f
0a 38763c37
07 740f247f
06 7867171f
03 3c7b2567
05 1e3c4b1f
0d 031d7b64
02 120f5d38
0e 6f796159
0e 75574e7c
00 020e0000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000eeee0000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000e2112ee00000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000e2111112e0000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000e11e77e12e000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000e21e7bb7e12e00000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000ee0000000e117bbbb711e00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000e21eee0000e117babb7e12e0000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000e211112ee0e2117b7abb711e0000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000e211111112e21117b77bb7e12e000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000e111e77e1111111737733b711e000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000e11e7bb77e1111173773bb7e12e00000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000e117bbbbb77e1117b77bb3b711e00000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000e117b7bbb3b7e11e7b7a333711e00000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000e217ba7bb3bb7e1173773337e12e0000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000e1e7b7b33b337e17377333b711e0000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000e117ba73b33337e7b373333711e0000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000e2173b7b3333337e73733337112e000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000eeeeeee0000e1e73a7a33333b773a333371112e0000000000000000000000000eee0000000000000000000000000000000000000000
0000000000000000000ee2111112ee00e1173b77a333333333333b7e1112e0000000000000000000000ee212e00000eee0000000000000000000000000000000
00000000000000000ee21111111112ee211e73a77a333333333333b7e1112ee0000000000eeee0000ee211112e000e212e000000000000000000000000000000
0000000000000000e2111111111111111111e7b777b3333333b777a37e11112eee00000ee2112eeee222111112eee22212e000000ee000000000000000000000
000000000000000e211111111111111111111e7b7773333bbb77777ab7e1111112eeeee2112211111111e77e22211111112e000ee22ee0000000000000000000
000011111100000e111e77777777e111111111e7ba7333bb377777777a7111221111111221111111122e73b7e11111111222eee222222e000000000000001111
01111111111110e211e7b333333b7e111111111e733b77ab3a7777777b7e222e7777e11112e777e22117ba3b722222e77e222211111111e00000000001111111
11111111111110e1117ba7777b33b711111e77e1e7b7777ab3333a7777a711e7333b77e2227b3b711117373371111e7b37e1111e77e1111e0000001111111111
11111111111110e111737ab77b33371111e73b7e177777773333bb7777b71173ba733b7e1173737112273ab3722227bb7b7112e7bb7e222e0011111111111111
11111111111110e11173737117333711117bb3b717777733333bbb7777b72273ab3333b7e2737372222e7bab7e22e737b372227bb3b7222e0001111111111111
11111111111110e111737371173bb7122173a33717777a333bbbb77777b711737b77b33b72737b7221117373b7117bba337e11737337222e0001111111111111
11111111111110e11173abb77bb3371111737bb717777a3bbbbbb7777b971273772273337173737e12227b73b71173abb3b722737337222e0001111111111111
11111111111110e11173ba333333bb71117b7337177777bbabbbb777b9972e7ba722733b727bab3722227b7bb72273733b37e2737337222e0001111111111111
11111111111110e1117b3733bbbbbbb7117373b717a777777abbbbbb9997273abb77bbb722e7bab72222e77ab722737333bb7e737337222e0001111111111111
111111111111110e11e737bbbbbbbbbb717b7bb7273a777777bbbbb999a71737333333b7e22737b7222227a797227b7b3333b77b7bb722e00001111111111111
111111111111110e1117b7bb777bbbbb717b7bb71e73a777abbbb999997e27b7b333333b7e27b7b72222279797227b7bbb333b7aa33722e00001111111111111
111111111111110e1127b7b72227bbbb727b7bb7117bb77abbb999999a7227b7bbbbbbb3b727b7b7e222e79797227b7bbbbbb337b33722e00011111111111111
111111111111110e2217b7b722279799717b7bb722e7bbbbb9999999a7e227b7bb777bbbb727bb997e2e7999972e79a9bbbbbbb7bba722e00011111111111111
111111111111110e1117b7b977797999717b7bb7221e7a999999999a7e22e797b72227bbb727997997779999a7279a997abbbbbbbb7e2e000011111111111111
111111111111110e11279a999997999a727b7b97e111e77a99999a77e2227aa7972227bbb72e7979999999997e279797e7999bbbbb722e000011111111111111
111111111111110e22279999977999a7e279799977777ee7777777e22222797a9977799997227a979999999a722797972e79999999722e000111111111111111
111111111111130e2217a99999999a7e117979999999a7e22222222222227979999997a9a722e7a9999999a7e2279a97227a999999722e000331111111111111
111111111133330e112e7a99999a77e22279a9999999997222222222222279a9999a779a7e222e7a99999a7e2227999722e799999a722e000333331111111111
3111111333333330e222e7777777e222227a999999999a722222222222227a99999999a7e22222e7777777e22227a97e2227a99997e22e000333333331111113
3333333333333330e22222222222222222e7a9999999a7e2222222222222e7a9999a777e2222222222222222222e77e2222e7999a7222e000333333333333333
3333333333333330e222222222222222222e777777777e2222eeeeeee2222e777777e222222ee22222222222222222222222e7a97e222e000333333333333333
33333333333333330e22222222222eee22222222222222222e0000000ee22222222222222ee00ee222eeeeee2222222222222e77e222e0000333333333333333
333333333333333330ee2222222ee000ee22222222222222e0000000000ee2222222222ee000000eee000000ee222222222222222222e0000333333333333333
33333333333333333300eeeeeee0000000ee2222222222ee0000000000000ee222222ee000000000000000000000000000002002000000003333333333333333
333333333333333333300000000000000000eeeeeeeeee00000033333330000eeeeee000000003309aaaaa9009aaa9009aa909a09aaa909a0333333333333333
33333333333333333333000000000003330000000000000000033333333330000000000000033309777777700777770077770770777770770033333333333333
33333333333333333333330000000333333300000000000000333333333333300000000003333307707707700077000970977790077000790003333333333333
3333333333333333333333333333333333333300000000003333333333333333300000033333330a90aa0a9000aa000aa0aaaa000aa000000003333333333333
3333333333333333333333333333333333333333333333333333333333333333333333333333309a00009a00aaaaa09a00aaa90aaaaa0aa00003333333333333
333333333333333333333333333333333333333333333333333333333333333333333333333330aa0000aa009aaa90aa00aa9009aaa90a900033333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333300000300000000000000000000000000000033333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333330000330000000000000000000000000000033333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333003333003300000300330003300000300333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
bbbbb333333333333333333bbbbbb333333333333333333bbbbbb333333333333333333bbbbbb333333333333333333bbbbbb333333333333333333bbbbbb333
bbbbbbbb333333333333bbbbbbbbbbbb333333333333bbbbbbbbbbbb333333333333bbbbbbbbbbbb333333333333bbbbbbbbbbbb333333333333bbbbbbbbbbbb
bbbbbbbbbbb333333bbbbbbbbbbbbbbbbbb333333bbbbbbbbbbbbbbbbbb333333bbbbbbbbbbbbbbbbbb333333bbbbbbbbbbbbbbbbbb333333bbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb333b333b333b333bbbbbb33b3b3b333b33bbb33bb33b333bb33b333b333b3b3bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb3b3b3bbb3b3bbbbbbb3bbb3b3b3b3b3b3b3bbb3b3b3b3b3bbb3bbb3b3b3b3bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb333b3b3b333b333bbbbb3bbb333b333b3b3b333b3b3b33bb3bbb33bb33bb333bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb3bbb3b3b3bbbbb3bbbbb3bbbbb3b3b3b3b3bbb3b3b3b3b3b3bbb3bbb3b3bbb3bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb333b333b333b333bbbbbb33b333b3b3b3b3b33bb33bb3b3bb33b333b3b3b333bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
__meta:title__
blobun mini
by cyansorcery
