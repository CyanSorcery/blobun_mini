pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function _init()cls(1)?"loading...",1,122,13
flip()memcpy(32768,0,17152)w={{},{},{},{},{},{}}X,fa=0,0local e,f=32768,%32768while(f~=0)add(w[f>>13&7],e+2)e+=2+(f&8191)f=%e
fi,f5={51510,27795,14025,37740},{32769.5,42405.5,60855.5,-.5}Z,f1,A,L,M,f0,ff,z,m,a=0,0,0,0,0,true,time(),0,1,{}fl,f6=nil fc,fr,ft=D("1c0d237164",5),D("0001115525511125",16),D("3c26915154",5)f_()fj()fA(1)fu(1,1)N,O=0,0end function _update()if(count(a)>0and btn(6))poke(24368,1)f4()
f0=f0==false M+=.2M%=4Z+=.035Z%=1A+=.15A%=32L-=1if L<=0then L=14elseif L%7==1then E=true end fl()if(btnp()&48>0and c>45)c=45
c=max(c-1)if(c<=45)z=min(z+.1,1)
if x~=nil then m=max(m-.1)if(m==0)if x==0then fq()elseif x==1then fB()elseif x==2then fu(P,fb)elseif x==3then fC()elseif x==4then fD()end z,m,x,P,fb=0,1
end for f,e in pairs(a)do e:m_step(f)end if(f~=nil)sfx(f>>10&63,3,f>>5&31,f&31)f=nil
ff=time()if(ff<0)stop"game has been running for too long. take a break!"
end function _draw()f6()for f,e in pairs(a)do e:m_draw(f)end local f=x==2or x==nil and count(u)>0local e=f and P~=nil and P or y or 1local n,f,e=f and ft[1][e]or 1,ft[2][e],64*cos(z*m>>2)if(e>0)rectfill(0,0,e,127,n)rectfill(127-e,0,127,127,n)
if c>0then local a,o="stage "..f3,cos(abs(max(abs(c-45),35)-35)/40)*64-64local n,d,o=o+8,o+9,v(a,o+12,97,7,f)line(d,105,d+o,105,f)line(n,104,n+o,104,7)v(i.s_name,n,107,7,f)if(e>0)?i.s_author,n,115,f
end camera(0,0)?flr(stat(1)*100).."%",0,122,7
?flr(stat(0)).."/2048kb",18,122,7
end function e(f,e,n,o)x,P,fb,fE,c=f,e,n,o,0f4()music(-1)end function G(f,e)fl,f6,c,u=f,e,0,{}pal()end function Q(f)f9(1)f7(1,0,0)music(f)o=0end function fC()Q(-1)G(fG,fH)R=90end function fq()Q(-1)G(fI,fJ)end function fB()Q(-1)G(fK,fL)local f=fs()r,H=mid(1,f.world,count(b))F=mid(1,f.stage,count(b[r]))o,_,q,fM=0,0,.125,D("13b224cd02415d6d2494",4)end function fD()Q(-1)G(fN,fO)end function fu(f,e)G(fP,fQ)local n=X~=2fe,fx=0,61936.8827u,p,d,S,fn,g,E,T,I,fh,c,j,fp,U,B,f2,V={},false,false,false,false,0,true,false,0,false,fE==true and 0or 90,0,false,{},{},{{},{}},1f=mid(1,f,count(b))e=mid(1,e,count(b[f]))y,f3,i=f,e,b[f][e]fR(f,e)f9(2)if(n)poke(24405,0)local e=D("2854ef234924d6d54924",4)for n=1,4do pal(e[1][n],e[f][n])end spr(1,8,0,14,1)spr(16,0,8,2,2)poke(24405,96)fS(f)f7(2,96,0)
local n,o,f=i.s_data,i.s_width+2for e=1,#n,2do f=l(n,e,1,1)k(96+f\16*2,f%16*2,(e-1)\2%o*2-1,(e-1)\2\o*2-1)end local e,f=i.s_obj_count-1for e=0,e do f=fT(sub(i.s_obj_str,e*5+1,e*5+6))if(f.type==11)add(f2[1],fm(f.spr,f.x,f.y))else add(u,f)
end for f in all(i.s_hints)do add(f2[2],fm(f))end end function fm(f,e,n)local f={dir=type(f)=="number"and f or l(f,1,1),x=((e and e or l(f,2,1))<<4)+12,y=((n and n or l(f,3,1))<<4)+12}function f:ondraw()fo=self.dir spr(fo%2==0and 254or 255,self.x,self.y,1,1,cos(fo>>2)<0,sin(fo>>2)>=0)end return f end function f_()local n,a,e,f,o,d=b b={}for n in all(n)do a={}for n in all(n)do e={}f=2o=l(n,1,1)e.s_name=sub(n,f,f+o)f+=o+2o=l(n,f-1,1)e.s_author=sub(n,f,f+o)f+=o+1e.s_width=l(n,f,1)+1e.s_saveslot=l(n,f+1,0,1)e.s_goaltime=l(n,f+3,0,7)e.s_devtime=l(n,f+11,0,7)f+=19o=l(n,f,1)*3e.s_hints={}for o=1,o,3do add(e.s_hints,sub(n,f+o,f+o+2))end f+=o+1o=l(n,f,1,1)d=f+2+o*5e.s_obj_count=o e.s_obj_str=sub(n,f+2,d-1)e.s_tiles=l(n,d,1,1)e.s_data=sub(n,d+2)e.s_height=#e.s_data\2\(e.s_width+2)-2add(a,e)end add(b,a)end end fU="cyansorcery_blobun_wp_pico8"b={{"afill it out9mika, roxy601004.3344002.417793003010020121221210200303400400000b2000b0200b22010f38183018181830184033211a01ff011a013b33ff0cff19ff0cff3b3301ff011a01ff013b4c4141414b4141414d","cdon't overlap9mika, roxy402004.3344002.984480211313300312413312322220402100b2000b4003b42020f4e4e38181818404e4e3301ff013b381810210bff3b3301ff01ff013b33ff0bff39414d3301ff013b4e4e4c4141414d4e4e","6zigzags3mika603004.3344002.734491020013110121220210311413400500200b4003b2103b1201b32010f4e4e4e3818181818404e381810ff01ff013b381001ff01ff01394d3321ff01ff01ff3b4e4c4141414141414d4e","9capacitory9mika, roxy604007.1100005.4677916626515515415315225114134001066001f4e381818181818404e4e33ff01ff01ff3b4e4e33011901ff013b4e4e33ff1aff01ff3b4e4e33010c01ff013b4e4e33ff01ff01ff3b4e381001ff01ff0113403301ff394131ff213b4c41414d4e4c41414d","9full boxes5autumn605600.1000000.110000100600283818181818181818403301ff01ff01ff013b33ff01ff19ff01ff3b3301ff011a01ff013b33ff11142b140dff3b3301ff011a01ff013b33ff01ff0cff01ff3b3321ff01ff01ff013b4c414141414141414d","cpopping about3ashe506600.1000000.110000505400a0220a2002a0442a4204194e4e38181818184038181045ff01ff3b33ff01ff01ff013b3345ff011925ff3b361414142b14143f3325ff010c01213b33ff01ff01ff394d4c41414141414d4e","8hop to it4unseta07600.1000000.110000100700354e4e4e381818181818404e4e4e4e4e4e33ff01ff01ff13404e4e4e4e4e3301ff01ff01ff1318404e4e4e4c34140d010b01ff013b4e4e4e3810ff01ff01ff01ff3b4e4e3810ff01ff01ff01ff394d381810ff01ff01ff01ff394d4e3301ff01ff01ff01ff013b4e4e332101ff01ff01ff01394d4e4e4c41414141414141414d4e4e4e","8superstar3roxy908600.1000000.110000104700404e4e4e4e381818404e4e4e4e4e4e4e4e3301ff3b4e4e4e4e4e4e4e3810ff0113404e4e4e38181810ff01ff011318184033ff01ff01ff01ff01ff013b3301ff01ff01ff01ff01ff3b4c3101ff01ff01ff01ff394d4e360d01ff01ff01ff113f4e381001ff012101ff01ff13403301ff01ff393101ff01ff3b33ff01ff394d4c3101ff013b4c4141414d4e4e4c4141414d","amorning joe3roxy909600.1000000.110000107700424e381818181818404e4e4e4e3810ff01ff01ff1318404e4e33ff01112a0d01ff0113404e3301ff010c01ff01ff01134033ff01ff01ff01ff19ff013b3301ff01ff01ff011f0dff3b33ff01ff01ff01ff0cff013b3301ff01ff01ff01ff01394d33ff01ff01ff01ff21394d4e4c31ff01ff01ff39414d4e4e4e4c41414141414d4e4e4e4e","9lost media3roxy810600.1000000.110000300000a8060a608038381830181818181830184033211a01ff01ff451a453b33ff1aff19ff01ff1aff3b33011a011a01ff011a013b33ff1214151414140eff3b3301ff01ff01ff01ff013b33ff01ff01ff01ff01ff3b3301ff01ff01ff01ff013b4c3101ff01ff01ff01ff3b4e4c41414141414141414d","ccareful plans3roxy549600.1000000.110000203000210541b3818181818181840330122012101ff3b33ff01ff111b013b3301ff01ff0cff3b33ff23232323013b330124242424ff3b4c4141414141414d","etangy transport5willow350600.1000000.11000050020011153a3212a123211453143818181818403301ff01ff3b33ff0203043b33210501053b33030103043b33010201ff3b4c414141414d","espace satellite5autumn651600.1000000.110000506300a4222a224221354253541c38181818181818184033242401230124243b332424ff23ff24243b33242405230524243b332422ff23ff22213b4c414141414141414d"},{"atest stage!4mouse945600.1000000.110001607400890e8783e7693e64045641456424563345514453254545050050601866e8a7694a94765070251703527045370554706557079679f5038181818181818181818184033974727440424074701483b3388472744042466465d973b33646464430323662651883b33636363430323662628083b33626262420222012101053b330f0146464646ff0109013b332f4a4a6a6aff4805fe093b334f6f8fafcfef2c018afe3b4c414141414141414141414d","dlocks'n'blocks3roxy546600.1000000.11000020030013053104e4e381818404e4e381810010213184033ff01ff0303033b3301ff010303033b332139414131033b4c414d4e4e4c414d","clocks'n'locks3roxy447600.1000000.110000204100344551c381818181818403301ff01ff013b33ff394131213b3301131816143f33ff434343433b3301ff01ff423b33ff01ff01ff3b3301ff01ff013b4c41414141414d","dtoggled hearts3ashe448600.1000000.1100002042001205319381818181818403301ff02ff013b33ff01ff01ff3b3303030104213b330303ff04043b3303030104043b4c41414141414d"},{"ccup of hearts3ashe652600.1000000.1100005063001205312353a1500a001523381818181818404e4e3325ff02ff03131840330301ff010304043b33010404ff04ff013b33ff0402030b01213b3301ff030301ff394d4c3125ff01ff394d4e4e4c414141414d4e4e","dcoin conundrum3ashe553600.1000000.1100004014004115644156444562438181818181818403364ff01ff01643b33ff62ff0162013b3301ff016401ff3b33ff016401ff013b33012101ff62ff3b336401ff01ff633b4c4141414141414d","ccoins of loveccoins of love454600.1000000.110000502500131534125644356434561e3818181818184033040404ff013b330401ff02ff3b33046201ff013b33ff010303623b3301ff0362013b3363032101ff3b4c41414141414d"},{"ckey collector5autumn755600.1000000.110000a00300470564015613153341552715417253a1300a00134735620381818181818181818403305636363642424623b3362040402424343223b3344040403444343023b3321052304042323623b4c41414141414141414d","etight corridors9roxy, ashe656600.1000000.110000401400240541545312553264e3818181818404e4e38100323232213184033030324242424ff3b3303ff01ff0104033b3303012323ff04033b33032123230102013b33030102040404394d4c4141414141414d4e"},{"cthree of keys3ashe757600.1000000.1100005062002215410253112533235528381818181818181818403304042323232304043b3304012201ff01ff043b3302024343434321043b33ff034244444444043b3301ff0303394141414d33ff0103033b4e4e4e4e4c414141414d4e4e4e4e","djuncton island9roxy, ashe758600.1000000.1100004026002315415153236542c381818181818181818403323232323242401043b332301ff222402ff013b3323ff012323ff01ff3b332301ff03230123233b4c4131010303ff39414d4e4e33ff0123043b4e4e4e4e33212204233b4e4e4e4e4c414141414d4e4e","dbizarre island3ashe859600.1000000.1100006015002605411253164532165425654344e4e4e4e38181818404e4e4e4e38181001ff223b4e4e381810ff010424ff13184033030201ff01240104043b330323232323240404043b3323ff01ff01ff0204243b332321240303030304243b332322242323222424394d4c41414141414141414d4e"}}function f9(f)if(X==f)return false
holdframe()C(0,0,w[1][f],sget,sset)C(0,0,w[2][f],pget,pset)memcpy(12288,24576,255)X=f end function el(f)if(fa==f)return false
holdframe()C(0,0,w[3][f],pget,pset)memcpy(12544,24576,128)memcpy(12800,24704,2176)fa=f end function f7(f,e,n)holdframe()C(e,n,w[4][f],mget,mset)end function fA(f)holdframe()C(0,0,w[5][f],pget,pset)memcpy(14976,24576,2176)end function fS(f)holdframe()C(32,72,w[6][f],sget,sset)end function C(i,e,f,r,t)local function l(f,o)local e,n=f[1],1while(e~=o)n+=1e,f[n]=f[n],e
f[1]=o end local function a(e)local n=$f>>f%1*8<<32-e>>>16-e f+=e>>3return n end local function f(e)local f=0repeat f+=1local n=a(f)e+=n until n<(1<<f)-1return e end local u,b,s,n,c,o,d=f"0",f"0",f"1",{},{},0for f=1,f"1"do add(n,a(s))end for a=e,e+b do for i=i,i+u do o-=1if(o<1)o,d=f"1",not d
local o=a>e and r(i,a-1)or 0local e=c[o]or{unpack(n)}c[o]=e local f=e[d and 1or f"2"]l(e,f)l(n,f)t(i,a,f)end end end function fV()local f={}f.obj_list=fy(u)f.player=fy(u[1])f.g_p_zap_turn=g f.playfield=fW()add(B,f)if(count(B)>40)deli(B,1)
end function fX()local e=count(B)if(e==0)return
local f=B[e]if(e>1)deli(B)
u=f.obj_list u[1]=f.player g,p=f.g_p_zap_turn,f.g_stage_lose local e=u[1]e.nextdir,e.isdead,e.ismove,p,T,E=-1,false,false,false,true,true fY(f.playfield)end function fW()local f={}for e=0,34do f[e]={}for n=0,32do f[e][n]=mget(e,n)end end return f end function fY(n)for f=0,34do for e=0,32do mset(f,e,n[f][e])end end end function fy(e)local f={}for e,n in pairs(e)do f[e]=n end return f end function l(n,f,o,e)return tonum(sub(n,f,f+(e and e or 0)),o)end function D(d,f)local e,o,n={},#d\f for o=1,o do e[o]={}n=(o-1)*f for f=1,f do n+=1add(e[o],l(d,n,1,0))end end return e end function s(f,e,n)return f+(e-f)*n end function k(n,o,d,a)for f=0,1do for e=0,1do mset(d+f,a+e,mget(n+f,o+e))end end end function J(o,d,f,e)local e,n,a,i,l,c,f=i.s_width<<1,i.s_height<<1,48+f\16<<1,f%16<<1,48+e\16<<1,e%16<<1for e=1,e,2do for n=1,n,2do f=mget(e+1,n)if f==o then k(l,c,e,n)elseif f==d then k(a,i,e,n)end end end end function K(f,e)local n=mget(f,e)if(n~=125and n~=127)return false
k(126,24,f-1,e)K(f-2,e)K(f+2,e)K(f,e-2)K(f,e+2)return true end function fd(e,n,o,d,a)local f=#e for f=1,f do n=print(sub(e,f,f),n,o+sin(Z+f/10)*a,d)end end function v(f,e,n,o,d)?f,e+1,n+1,d
return print(f,e,n,o)end function fg(f)return(f>=60and flr(f/60)..":"or"")..sub(flr(f%60)+100,2,3).."."..sub(flr(f%1*1000)+1000,2,4)end function fP()local f=z*m==1f1+=.075f1%=1fe+=.015fe%=1if c<=45and f then if(btn(6))poke(24368,1)
if((S and d or btn(6))and count(a)==0)fZ()
end I=mid(0,(d or p)and I+.2or I-.2,1)if(f)for f in all(u)do f:onstep()end e1()
local f,e,n=u[1],i.s_width<<4,i.s_height<<4local o=f.inportal and cos(1-f.anim>>2)or f.anim N=i.s_width>8and mid(0,(s(f.oldx,f.x,o)<<4)-48,e-112)or(e>>1)-56O=i.s_height>7and mid(-8,(s(f.oldy,f.y,o)<<4)-48,n-108)or(n>>1)-60end function fQ()poke(24405,0)if(f0)e0()else ef()
if(E)e4()
if(T)e3()
ee()poke(24405,96)cls(fc[1][y])pal(7,fc[2][y])local f,e=-32+A,-A if(y==3or y==5)f,e=-N/2,-O/2
for f=f,128,32do for e=e,128,32do spr(148,f,e,4,2)spr(152,f,e+16,4,2)end end poke(24404,96)pal()if(y<=2)for f=0,127do sspr(0,f,128,1,sin(fe+(f>>4))*1.4,f)end
poke(24404,0)camera(N,O)local f,e=i.s_width*2+2,i.s_height*2+2palt(256)map(0,0,0,0,f,e,1)fk()map(0,0,-7,0,f,e,128)fk()for f in all(f2[V])do f:ondraw()end palt(16384)map(0,0,0,0,f,e,12)palt()map(0,0,0,0,f,e,2)for f in all(u)do f:ondraw()end camera(0,0)local o=h(1)local f,e=s(127,115,I),o and 0or 87poke(24404,96)pal(fr[1])sspr(e,0,128,9,e,0)if(I>0)sspr(0,f,128,16,0,f)
pal()poke(24404,0)local e=j<=i.s_goaltime and 7or 13if(d and j<=i.s_devtime)e=10
local n=dget(i.s_saveslot)spr(n<599.995and 147or 146,88,0)if o then?fg(j),2,2,e
if(fh)fd("new time!",32,2,e,1.3)
if(n<=i.s_goaltime)?"⧗",81,2,9
if(n<=i.s_devtime)?"♥",75,2,14
end rect(96,1,126,7,7)fillp(fi[ceil(M)])rectfill(124-max(1,u[1].tilestouched/i.s_tiles*26),3,124,5,59)fillp()if(d or p)fd(d and"stage clear!"or"❎ undo",d and 42or 50,f+5,7,1.3)
?u[1].tilestouched.."/"..i.s_tiles,8,32,7
end function e0()sspr(12,56,1,15,0,56)sspr(4,56,8,15,5,56)sspr(0,56,1,15,4,56)sspr(17,59,15,1,112,127)sspr(17,60,15,8,17,59)sspr(112,127,15,1,17,67)sspr(36,56,1,15,0,56)sspr(37,56,8,15,36,56)sspr(0,56,1,15,44,56)sspr(49,67,15,1,112,127)sspr(49,59,15,8,49,60)sspr(112,127,15,1,49,59)line(112,127,127,127,7)line(0,56,0,71,0)end function ef()local d,e,f,n,o=fx,0,0,false,false for e=0,10do f,n,o=21+e,d&1<<e>0,d&8<<e>0sset(f,98,n and 7or 12)sset(f,96,o and 7or 0)sset(f,92,n and 9or 4)sset(f,90,d&32<<e>0and 10or 9)sset(f,88,o and 10or 0)end for e=0,4do f,n,o=8+e,d&16<<e>0,d&64<<e>0sset(f,98,n and 7or 12)sset(f,96,o and 7or 0)sset(f,90,n and 10or 9)sset(f,88,o and 10or 0)end for a=0,7do f,n,o=103-a,95-a,88+a e=d&1<<a>0and 7or 12sset(f,101,e)sset(50,103-a,e)sset(78,96+a,e)e=d&1<<a>0and 9or 4sset(f,91,e)sset(52,n,e)sset(76,o,e)e=d&4<<a>0and 9or 10sset(f,93,e)sset(50,n,e)sset(78,o,e)end fx>><=1end function ee()local o=f1 spr(224,80,104,6,2)local f,n=80for d=0,32,16do clip(f,104,16,16)for e=0,15do n=sin(o+e/8)+104sspr(d+e,112,1,16,f+e,n)sspr(f,104+e,16,1,f,n+e)end f+=16end local e=u[1]clip()palt(0,false)spr(208,24,104,3,1)palt()if(e.haskey)spr(144,32,104)spr(144,39,104,1,1,true)
for n=0,16,8do f=24+n clip(f,104,8,8)for e=0,7do sspr(e+n,104,1,8,f+sin(o+e/8)+e,104)end end clip()if(e.haskey)spr(145,32,104)spr(145,39,104,1,1,true)
local e,n,f=(btn(4)or e.sprint)and e.onconvey==false,e.blink<4or d f=215if(e)f=214
if(n or p)f=216
spr(f,d and 37or 36,104,1,1,d)f=251if(e)f=252
if(p)f=160
if(d)f=250
spr(f,40,104)for f=0,23do for e=0,7do sset(79-e,104+f,sget(24+f,104+e))end end end function e4()en={{1,13,5,12,13,12},{1,2,5,8,4,8},{1,4,5,9,4,9}}local f,n,o for e=1,3do o=0n,f=((e+g+2+o)%3<<1)+1,en[e]pal(f[3],f[n])pal(f[4],f[n+1])spr(155+e,96+(e<<3),8,1,2)end pal()E=false end function fk()poke(24405,0)camera(0,0)local f,e for n=0,34do f,e=(n<<3)%128,(n\16<<4)+8sspr(f,e,8,16,f,e,8,16,true)end camera(N,O)poke(24405,96)end function e3()local d,e,o,f=u[1].coins for n=0,1do e,o=4,5if(d>n)e,o=9,4
f=17-n*3for n=0,8,8do line(72+n,f,76+n,f,e)line(72+n,f-1,75+n,f-1,e)f+=1e=o end end T=false end function fT(e)local f={type=l(e,1,1),x=l(e,2,1),y=l(e,3,1),spr=l(e,4,1,1),anim=rnd(),spin=rnd()}f.poskey=f.x<<4|f.y if f.type==0then f.startx,f.starty,f.poskey,f.dir,f.anim,f.jiggle,f.sprint,f.pstate,f.ismove,f.oldx,f.oldy,f.startturnx,f.startturny,f.haskey,f.onconvey,f.inportal,f.blink,f.octogems,f.coins,f.nextdir,f.tilestouched,f.isdead,f.prevslimetrap,f.prevcrackedfloor=f.x,f.y,-1,3,1,0,false,0,false,f.x,f.y,f.x,f.y,false,false,false,10,0,0,-1,1,false,false,false f.onstep=e2 f.ondraw=eo else if(f.type==5)f.oct_ind=f.spr f.spr=87
if(f.type==10)f.dst_x,f.dst_y=l(e,4,1),l(e,5,1)
function f:onstep()if(self.type<10)self.anim+=.02self.anim%=1self.spin+=.035self.spin%=1
end function f:ondraw()local f,e=(self.x<<4)+8,self.y<<4if self.type<9then if self.oct_ind==nil or self.oct_ind==u[1].octogems then local e,o,d,n=e+sin(self.anim)*2,self.spr%16<<3,self.spr\16<<3,ceil(sin(self.spin*.5)*-8)if(n<=3)rectfill(f+7,e+1,f+9,e+14,7)
sspr(o,d,8,16,f+9-n,e,n,16)sspr(o,d,8,16,f+8,e,n,16,true)end elseif self.type<10then spr(self.spr,f+4,e+sin(self.anim)*2,1,2)else?self.type,(self.x<<4)+8,(self.y<<4)+8,7
end end end return f end function e2(f)if(not h(6)or count(a)>0)return
f.blink-=1if(f.blink<=1)f.blink=30+flr(rnd(60))
S=btn(4)and fn==false fn=btn(4)f.jiggle=max(f.jiggle-.2,0)if(btnp(5)and not d)fX()
f.anim=min(f.anim+((f.sprint or f.onconvey or f.inportal)and.2or.1111),1)if f.anim>=.65then local n={2,0,1,3}for e=0,3do if(btn(e))f.nextdir=n[e+1]
end end if f.anim+.001>=1and not d and not p then if(f.ismove)ed(f)
if(S)f.jiggle=1
f.sprint=false local e=f.nextdir if e~=-1or f.inportal then if(f.inportal)e=-1
local o,d,a,i=f.inportal,16,f.x+cos(e>>2),f.y+sin(e>>2)if(f.onconvey or h(2))d=18
local n=mget((a<<1)+2,(i<<1)+1)if(n==121and f.pstate==1or n==51and f.haskey or fget(n)&d>0)o=true
f.nextdir,f.dir=-1,e if o and not p then fp=true if(not f.inportal and not f.onconvey)f.startturnx,f.startturny=f.x,f.y fV()g+=1g%=3E=true
f.anim,f.sprint,f.ismove=0,tonum(h(3))~tonum(btn(4))==1,true if(f.inportal==false)f.oldx,f.oldy=f.x,f.y
if(e>=0)f.x,f.y=a,i
end end end if d==false and f.tilestouched>=i.s_tiles then d=true if(j<dget(i.s_saveslot))dset(i.s_saveslot,j)fh=true
end if(d)f.dir=3
if(fp and not d)j=min(j+(time()-ff),599.999)
end function ed(f)f.ismove=false local n,o,d,a,l,c=f.x,f.y,(f.oldx<<1)+2,(f.oldy<<1)+1,true,true local e,t,r,i=mget((n<<1)+2,(o<<1)+1),mget(d,a),n<<4|o if(e\16==12and f.pstate==2)e=123
if(e==52)J(19,20,3,4)
if(e==53)J(21,22,35,36)
if(e==54)J(23,24,67,68)
if e==55then f.coins+=1if(f.coins==3)f.coins=0J(25,26,99,100)
T=true end for n=0,2do if(e==80+n)f.pstate=n
end for n=0,7do if(e==56+n and f.octogems==n)f.octogems+=1
end if(f.octogems==8)J(27,28,74,106)f.octogems=0
if e==18then if(f.haskey)l=false else f.haskey=true
end if(e==51)f.haskey=false
if(f.prevslimetrap)k(126,26,d-1,a)
f.prevslimetrap=e==48if(f.prevcrackedfloor)c=false e=50k(96,18,d-1,a)K(d,a)
f.prevcrackedfloor=e==125or e==127local d=-1for f=0,3do if(e==113+(f<<1))d=f
end if(e==123)d=f.dir
if(d~=-1)f.nextdir=d
f.onconvey=d~=-1for e,f in pairs(u)do if f.poskey==r then i=f if(l)deli(u,e)
break end end if f.inportal then f.inportal=false else for d=0,6,2do if(e==89+d)k(126,f.pstate<<1,(n<<1)+1,(o<<1)+1)f.oldx,f.oldy=n,o f.x,f.y=i.dst_x,i.dst_y f.inportal=true
end end if(e>208)fw(f)
if e\16==11and f.pstate==0or e\16==12or e==50or e==29and g==0or e==30and g==1or e==31and g==2then fw(f,true)elseif c then f.tilestouched+=1k(126,f.pstate<<1,(n<<1)+1,(o<<1)+1)end end function fw(f,e)p=true if(e)f.isdead=true
end function eo(f)if(f.isdead or f.inportal or not h(6))return
local a,e,n,o,d=f.dir,f.x<<4,f.y<<4,f.anim if(f.pstate==1)pal(3,8)pal(11,9)
if(f.pstate==2)pal(3,13)pal(11,6)
if(o<1)d=f.onconvey and o or.5+cos(o*.5*sgn(o-.5))*-.5e,n=s(f.oldx<<4,f.x<<4,d),s(f.oldy<<4,f.y<<4,d)
e+=(-1+rnd(3))*f.jiggle+8n+=(-1+rnd(3))*f.jiggle+8local o,d=cos(f.dir>>2)<0,sin(f.dir>>2)<0local a,i=o and e or e-8,d and n or n-8if(f.dir%2==0)spr(211,a,n+7,3,1,o)spr(211,a,n,3,1,o,true)else spr(217,e+1,i,1,3,false,d)spr(217,e+8,i,1,3,true,d)
pal()end function fj()cartdata(fU)if(dget(63)==0)dset(63,69)for f=0,59do dset(f,599.999)end dset(62,0x1.12)dset(61,0)dset(60,0)
end function h(f)return dget(63)&1<<f>0end function e8(f,n)local f,e=1<<f,dget(63)dset(63,n and e|f or e&~f)end function fs()return{stage=dget(62)<<4&15,world=dget(62)<<7&7}end function fR(f,e)dset(62,dget(62)&~.9922|f>>7|e>>4)end function fJ()cls(0)map(0,0,-24*o,32,19,2)map(0,2,o*2%1*-24,48,19,3)map(0,5,o*3%1*-24,72,19,7)palt(1024)local f=sin(o)*4map(19,0,12,8+f,13,7)if(not h(6))map(19,8,28,8+f,4,5)
?"2025 cyansorcery",32,122,3
if(count(a)==0and x==nil)fd("press 🅾️ to start!",28,96,1,1.4)
end function fH()local e=z*m local f=e*8cls(1)rectfill(0,56,127,72,12)map(0,12,-24*o,56-f,19,1)map(0,13,-24+24*o,64+f,19,1)local f=f*.5?"presented by",39,60-f,1
if(h(6))map(19,7,18,60+f,11,1)
palt()fillp(f5[flr(s(1,4,e))])rectfill(0,56,127,72,12)fillp()end function fN()if(z*m==1and btnp()&48>0)e(0)
end function fO()for f=-32+A,128,32do for e=-A,128,32do spr(204,f,e,4,4)end end poke(24404,96)pal(fr[1])sspr(0,58,128,70,0,58)sspr(0,7,128,18,0,7)sspr(39,38,52,20,39,38)pal()poke(24404,0)palt(4096)map(48,0,0,0,16,16)local n={{"programming","bug fixes","general"},{"art, music","art, music","music"}}for f=1,2do for e=1,3do v(n[f][e],f*64-46,e*24+42,7,1)end end v("director",58,42,7,1)v("created by",44,1,7,1)v("a plural system",34,26,7,1)v("seven spirits, one body",18,32,7,1)end function fG()o+=.025o%=1if R>0then R-=1if(btnp()&48>0)R=0
if(R==0)e(0)
end end function fI()o+=.01o%=1if count(a)==0then local f=btn(6)if(f)poke(24368,1)
if(btnp(4)or f)ea()
if(btnp(5))e(3)
end end function fK()_=mid(0,_+q,1)o+=.02o%=1local f=count(b)if _==1then if(btnp(0)and r>1)H=max(r-1,1)q=-.125
if(btnp(1)and r<count(b))H=min(r+1,f)q=-.125
end if(_==0)q=.125r=H H=nil
local f=count(b[r])if(btnp(2))F-=1
if(btnp(3))F+=1
F=mid(1,F,f)if(btnp(4))e(2,r,F)
if(btnp(5))e(0)
end function fL()local n,f=fM,20+sin(_>>3)*29for f=1,4do pal(n[1][f],n[r][f])end rectfill(0,0,127,127,1)map(0,14,-24+24*o,-2-f,19,3)map(0,17,-24*o,115+f,19,2)map(32,-2+r*2,0,1-f,16,2)local f=122+f if(r>1)?"⬅️previous area",1,f,7
if(r<count(b))?"next area➡️",84,f,7
local f=count(b[r])local a=max(min(F-5,f-9),0)local f,l,c,i,e,o=23-a*10,a+10,h(1)for e,d in ipairs(b[r])do i,fz=e==F,f+10if e>a and e<l then o=f+3local a=dget(d.s_saveslot)if(i)fv(4,f,90,fz)
pal(7,i and 7or n[r][2])?(e>9and""or" ")..e.." "..d.s_name,15,o,7
spr(a<=599.995and 241or 240,6,f+1)if c then if(a<=d.s_goaltime)?fg(a),96,o,7
if(a<=d.s_devtime)?"♥",120,o,7
end end f=fz end if _<1then palt()if(q<0)pal(1,n[H][1])
fillp(f5[flr(s(1,4,_))])if(q>0)rectfill(0,22,127,112,1)else rectfill(0,0,127,127,1)
fillp()end pal()end function f8(e,n,o,f)add(a,{m_x=e,m_y=n,m_w=o,m_h=count(f)*10+6,m_items=f,m_highlight=1,m_anim_incr=.25,m_anim_factor=0,m_step=function(f,n)local e=count(a)local n=n==e if f.m_anim_factor==1then if(btnp(2))f.m_highlight=max(f.m_highlight-1,1)
if(btnp(3))f.m_highlight=min(f.m_highlight+1,count(f.m_items))
if(btnp(4))f.m_items[f.m_highlight]:i_onclick()
if(btnp(5))f.m_anim_incr=-.25
end local o=true if(n and e>1and a[e-1].m_anim_factor>0)o=false
if(o)f.m_anim_factor=mid(0,f.m_anim_factor+(n and f.m_anim_incr or-.25),1)
if(f.m_anim_factor==0and f.m_anim_incr<0)deli(a)
end,m_draw=function(f,n)palt()local e=count(a)local n=n==e if(n and e>1and a[e-1].m_anim_factor>0)return false
local e,u,o=count(f.m_items),count(u)>0and 147or 241,s(5,f.m_h,f.m_anim_factor)local n,e,d=f.m_x,f.m_y-(o>>1)local o,a,l,c,r,t=n+f.m_w,e+o rectfill(n,e,o,a,1)rect(n+1,e+1,o-1,a-1,13)local b,e=n+8,e+6for s,i in pairs(f.m_items)do if e<a-9then l,c,r,t=n+3,e-3,o-3,e+7d=s==f.m_highlight if(d)fv(l,c,r,t)
pal(7,d and 7or 13)?i.i_label,b,e,7
if(i.i_setting~=nil)spr(u-(h(i.i_setting)and 0or 1),o-11,e-2)
end e+=10end pal()end})end function f4()for f in all(a)do f.m_anim_incr=-.25end end function n(f,e)return{i_label=f,i_onclick=e,i_setting=nil}end function W(f,e)local f=n(f,function(f)e8(f.i_setting,h(f.i_setting)==false)end)f.i_setting=e return f end function fZ()f8(16,64,96,{n((d and"next"or"skip").." puzzle",function()e(2,y,f3+1)end),n("restart puzzle",function()e(2,y,f3,true)end),n((V==2and"hide"or"show").." hints",function()V=V==2and 1or 2f4()end),n("stage select",function()e(1)end),n("options",fF),n("go to title",function()e(0)end)})S,fn=false,false end function ea()f8(24,96,80,{n("start game",function()e(1)end),n("continue",function()local f=fs()e(2,f.world,f.stage)end),n("options",fF),n("credits",function()e(4)end)})end function fF()f8(16,count(u)>0and 64or 92,96,{W("show timers",1),W("slime overlap",2),W("sprint by default",3),W("lesbians allowed",6),n("pico8 menu",ei)})end function ei()extcmd"pause"end function fv(f,e,n,o)rectfill(f,e,n,o,2)fillp(fi[ceil(M)])rect(f,e,n,o,154)fillp(0)end function Y(e,n,o,d,a,f)add(U,{x=e,y=n,spd=o,dir=d,col=a,time_max=f,time=f})end function e6(a,i,d)local f,e,n for o=0,.9,.1do f,e,n=a+cos(o)*4,i+sin(o)*4,o*360Y(f,e,.9,n,rnd(d),12)Y(f,e,1.8,n,rnd(d),8)end end function ec(o,d,e,n)for f=0,.8,.2do Y(s(o,e,f),s(d,n,f),0,0,14,s(5,12,f))end e5(e,n,{14,7})end function e5(e,n,o)for f=0,.9,.1do Y(e+cos(f)*4,n+sin(f)*4,.8,f*360,rnd(o),8)end end function e1()for f in all(U)do local e=f.dir/360f.x+=f.spd*cos(e)f.y+=f.spd*sin(e)f.time-=1if(f.time<=0)del(U,f)
end end function er()for f in all(U)do pal(7,f.col)spr(flr(s(163,161,f.time/f.time_max)+.5),f.x,f.y)end pal()end
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
0707480b11c91efffcd227270f1f701efff854219f580901070838fffb506cf24341c004ffffff0d48fffffffff11000a6b2ffffff0ffffff0df7040fc93a8c2
577aff73113994666bc466233999ca399856bc4c2b56269d231bf95930293e2d7af44ef85c33dfb82fff70c1c3a4c7e97c1f71514871c817171f48190715e16f
8024ef1ef4e9444e0e4e5a44e29acd2f19324261e2ac3cf10640c2c0c541c7c2cbcb983110a11715e23cf71e4ef711ef741152ef4f80f583053016c1c8b342c2
c112cf002c111328fc6cdcf7c90a6f748392ff485874c521c5f4afd2fd7abc7f53b3f852e9877fcbf6e86bbf677b772e9ce78c3f3cf0f3cf19f36ef8427ecf06
fb4e78762fad97453ea72bc711369c19727d5f4ebbf89cadbfe8724b7f9c39b4b7f9c31ae617f397e8a1ea6f8d1b3c1fb8f63b787632ff074ae82b4987a56d21
961ac37c85a48e83e0b4fa68095e22e0d34883e49b215b8101f3431213f4860e95c31a1e8c619d212f66227b6a4b2bd1a294f2546cf43538d8a28c2174ef0fb8
f56c8b57b4d196eadc5742e89af33902c923e8074ae3e707cc66f7094c7a329e332191f75230e7c0746e29b8f21f83e84d837c689424023e3ec422090ff0752e
0e0225e0e84c7c23d8029b6ca9ec09d1cf5944081e1e98be297c17178de812f662c79b09071590fb540848b29be883ea070fbd1b07c8780d4c675ce94ea82c17
c51331f17521487cf099d174c337462e8836ed48786f3c2c1fc2f302612b760ac3a5e15e7ad812f34b2297e9cf09a342e9cf0ba80f8f1e8dd9d5e78856fb0198
5297711bcb9844844ef2e003c8490340cc11680811680786812131a198f120930270f79d1b23f8c678489ad9b652c432784899df09652ccce78de2709d69742f
3462f84694375ae9cdb32c13a717c071748f830a79fe895fa3e69942c279432342c5972ff8d31e27c398bc3f48bc7f42e275db4eb9bc10e00783e17df4ee3c5c
1797e29bc579dffc4e90f4872af8c7e9bcaddb2f4297274f9c1b72f0433830c10e0070830c10e02c261ae8367c3f4717cfc0e031e90d2c31e90f4861e902090c
3946c01b9cc84295043c3636a0c1cf20a1e90f48b043484866a225742a94a1b0bd3c1e956ae01ab1b02c252c60c60c60c280b123cf9e02f9c2c670f9cf81e090
70830c10ac5108f237c2371362fe2c8c6787670d594a212121e9052490909052cfd4827fac1cf01e191d0748b8136c68016cffa68362a35f9d28d87280b0603c
280b028090d02cfc421fc07ccc127e498d8487823649052486878fd9a213c1337c4d763b3e0093043c28052348c01234844e00de6c319303c1337c237125f964
b42c548381681681681f9cf36488d8b4f2db0a8359e1482b10d248c012348c0f078940ebcf08a46f39c52717c2c331d124681a0d24b0d198094c802af4f84469
ce2e2e2db2c11e90f4872c31e90f4876c2c47c2c39ce1df98fff75ebbc579d32fff39ac5105ea08275049b81371e8c3972ddcf18f20e0e00f493ebf36c3f7c87
ef81fcf1a90d0792642933c378383e060f30e87c9af7802e3a786d42f0244ba5e84dc15aa3b32c1980d869e3a1f6eb8214ba071f7c2e10e1340ef00a24e1e18c
3c1a529894954390ce151d44b3d0349321caa21d81f41b5c42271d8d90299b2bd327948552178be9df074236f4c1219c2f1707944a99ff10f301628070981202
9844136163bc9b5429c9bc4217398dd1698b29c5986855291a56b46f54109ce71e5b2ffb09f387b97d55948f21f3078cff046273ff82a1ef1e9097cf1e71e81d
409864018f1ef70c4ff712f34ec06c1f48ece0645287cf1e71610ff729ff58e11e361e8303d237c832425980fc0bf5ef0f1938cf0e3285ef0f5eca387ae3b8ed
9342c3ca1e8369c1784763a90cf2fff2e4e737c1e40fc310fd0f487241c278b2b0a49425492981aa809ca8a55e90f0756e1e29b87cac1448c9120d3b42139fe8
7c62c12b61c39f27179dffd2fa1f11e7029fe79b812c097a7097eeef1cb745c057e546ecd3702b0f302bcf29c7fb46948324531e80b80ee0fb48f52cf23f7cf2
2f7c4444e07d8036319830f5ad4c0f3bcf3cf3cf43bf3c32074209442c922048722204802cf02f71f70f354c320b06129848f6012108c0219000a1e790fb48b8
f9444c0b18c242c245281248840b0120e80f301e70079cf51c4ca042c2c6819010514240cf11e5acb48f93898d1088090b087a2c2c55161e780f1f0f13e6e1e0
44af0069848580b4408243110a243c328b8f301e7905ea84f1184224319028070822270818742cfc1e7901ea84f310420d442c68210960520248ac81fb190fbc
0f9432e10c24342c1140824a2220412803923ef2a48f18f2439f3e144a942148504808022801010f70fb1f30ff8cf34561c0830461ac0461acf1af71f70ff0ff
1b020253a44a53a4856e702cf048f180f3022ff019313187a0628c350bacdcf7cdcf597edf525fb17270721d380b40eedf272cd1e9090b04e8c1e0e79dc1c1d4
c39878b88cf12f485030e3071718b832cf008be853fbc10f7c10123693c51a490920e3e706808f18f10cc77c6ea3637d17d0952cfe1e0bb2cf40240c1c10e807
46a22353918862bf0321e20f3040f5870c30ac7c5c3c796e951c25f820160e2ee0ff70e2243cf2c9cf4488533ff3090f1f31fff060e05c148a161d4775cf4c10
e0e53cbc7c3cf342480838210d34d6674c674250f37c03e4e80ff23e805070838c830f4afbc02360e71acf02727030718214697270029202cc1243f8f181505e
22c51e4ac8150f34a9725f4ae02f4b7495e8422f4838032cf568083807071ff4811a4828afeff3cf406c868f8090fb482830c10656e4e02c8280ff0f0f1ff0ff
83e817c13e832c2b30f2f50cbcfa12c2cf21e12cd1fd31e9108f50cf6cf242cdcf61216c8f99bcd71ff8be3f78c9f7c4809c39427e6248483224ad4029642843
1f7c3cfc271f8583ce22c1e9b8b8f18f72c31ef7a3c3c51299019303480fd0813a3c11eff9c3c041040cb4973c8f38b92ff324821e54ef80070f0f252c811e70
e2e0acfb98f8f54eb8c3cbcdc28073f34012cfb9878f12f8712b8cf6c11298ff301e7c4cfdcd16cf0cf182cf0cf150cf0eb72fd1dc7e4f7c7acf1f8427f929f3
e107078c91a0e0e4ef5e2e19078e5c7e78b8b8f18f72c31ef7a3c3c51e1e3e1ef0e72ef7dc3cf0cfff3e05ef042eff248fff78c8f79b8b2cf2c5c30ef7a93cf0
c8ff87848ff103e7c0f737781f30f70a0f30f70a0f387e99f5e79ab9bf99777ccf1e08d1bf1212f3e268c1cbbdc0702fc551ef86ea9ddfef131c11bb2bcf2bb8
16fdf261768d0ffe2a6f742ae71bc27c8c0d7f79c2b7ed39c0df5e799ce793e712301968f3e88f2179f8f00210223760bc5b8d1126939628b89c14089e3c8f54
e020cca488c80085e253cdf852954a21929522d6643fb4819e6863dc13748c1485e2c17016617c1409c8478bb0cb8c0778094e01c20e3ef69ff903940c715d8c
327c2187036674e83c33f007c23e8a23842c81b834813aa2c816b4712c827c213c5e2a2621b45d5ff0b50d403f0b004289b8d3009066ce1084019f33e96e9900
190b1efd294e0c374524bc1921a5a7490dac65dbe8cdfebf497a7eb7ff0bc9bb2eaaf2c31a8a3bc27c31ef1ef1e71265eace125eac3f092f4669c11e897d2ea4
e9744c197ea95803ce985c5168db1b8f2c05275c18ba1940c5d888307199321a5709934ae9057020090e2f0740090e2f07400906e115e8f30cf107cf2c735035
34a4e052418027805834093482c188cf3cff5afc73d9904e952755ef1eff3e8f78f52e8f1817c233023d4e9036c2e1d501f485c369842f485c3a98cf328f34e7
b974a44bc3ab4e859312104674e15900ce83a6210853bc1f7c21f7c293ef0983e7856e8c27437fd95e11e8d7f385ea48677cb69f21ab9cf219f529cf28932dc1
93ce27e57db93b7431bcc29c7f427d519767f5df3cef81df368f368f7af0abb26176df24f0bff461e003eff1cf43d6bb054040108d11d8f3237a4333609f1448
f101e700f3ad20984794e794e227219083227b48f1848b9456b3e03c12f04fa8dff18b418072b58395ae5610fd40ab00b448ffd0305ab5c56da78b4a15c52d1d
75e296eb6a21ff31ac1c194ef8c19f5274ef9073f09269c2ff716cd07504ffffff0de5109842eefffff100000000206222222222000222222222200802000008
ac8f79a5ce9809f34a18c311cff12332cfb1648b215bfb838fb930fb5300047fcfc000000fd900efbf1e0c130e7cf1000e7718c3f0280cfff73e7a50ff58b242
c2c51e0e7140c7c9c50e2e80f300c9cf0c010f30f30858b2cf40240c1c10e8070717187049f8b878b8f79b80d0fb0fb0f31fff0602c90e5e3e1ef12120e02c83
932cfbc8392f307270307182108b807583923641cd1ef2010701e0e2ef7206c868f8090fff8070f1ff0fffa0161e790f01e7c02cdcf61216c0d50cfff73e7a50
7cf3cf248f7928f52cf2cff0868f52cf0cf04813e70eff541c1cd1e6e7e0f30f34839fb9ff10838ff3073ffb6efff50878ffd35ef60f01effb12492fff90f740
c1490f33360e70e3e4acf2c5c2cf81e2e1ef7ecf1c506400ba0cfff73e7a5e8d10c10e830830c17007083e00e00320a0080820020a0080820120090360090360
090360090303e4e0e4e0e4e0e4a4048b808071101e2202cb48f180f301e702c50e203071818b0c0c50090f5868f243c71a1eb02c83818170303e0606c1c24000
105004041001050040048130848130848130848130805e0e4e0e4e0e4e061071101e2202c54048b840cf048f180f301e700103071818b0c0c5060ea1a1eb0d0f
5868f243c03a0cfff73e7a5e0002c11483200a0f6858734838780f050872c200907d070ff13ed08300e3e06583a03e025821a485124781870400e8082fb40c80
850c1480901248136c8116801e7321ac10210848f0cff12c50e780ff48f32c51ef711eb0b02c0c7108ff00092c2009004a0348092c1580b0d0821a4828030b08
70484801249f520247801e02c20e0e161481f25e74e0e201a42c5105e2071702cb021e520ac1c83832006b0cfff73e7a507c603c0c603c0c603c0c603c2c8b8b
8b8b8b8b8b838216c8216c8216c8216482560a49182560a49116c8216c8216c8216c868c100a0d30041a700824f0005016021606021606021606021642803024
280302428030242803020030300c0c00030300c0c016c5c5c5c5c5c5c5c0c8152c8152c8152c8156c0492305ac0492305649036490364903649032824f00058e
100a0d30041af002c0c042c0c042c0c042c0c08001214810121481012148101214002b46ffffff0ff7aef40821436579cdaefbe19c4d574aaa97c3e237d79aa2
4e12fc4fa594b96e136e8f655aea37fab5d5f34ef0fb8abef94fe36787e5f38f34e9999c3333976662fccc4e899dce236c0cea094c80b0910b0136c66c8dc24d
62ff3a6ef83f7159c137817e1db56e2f784a179a5a1f8a4ed9bd836f8c2d87c16137817c1d9cc5e09cf3179f7c2f4c5e19c71f8f427caf461d624eaafbedf3e7
93d67edfbcebf12e973979f673e21e2076e2fd4ee93c15675f6c4e9581f62dc6d8c28b6f162e103f5c787eec3d277887fcf7e79dbf7cf297e2e2be3ff83a9f7a
f0f3070b0e70c1fdf3fcd8b80ff832e708f16e783e6e19cf28f388215109ef0884e6c9483d2e60fecf13c9c3297edf5c9f8369c1b32fc3def0bb8fce90f75f79
3e8363f4e3b1f7cc6248f493f794d2b0e23634e013855225f0d9f36ef99f70cf209f369e7d888d5f707ec9fc1b57938b33fb0ebd633f89db8df3770c8f5e0cf3
7f6bdabfef9835ce51044cc89f1ea462c6ffc8df3100e0cdb57b577d20269c1ec3c1bd6dabadcf3d42bc9fa9777e5ef8bf2f982846e56ed4c9f0e1c18c5fb4cf
114176aa0f34eb40f3000279b71b5c93f6ef17de2bcf0ee1f2f56df6fe1762907bdf0a2987e783fc6b48932ad174291f303d948a6f860487dadf78629116c421
b6b2d1f13d863a946489e42492f97df3e8d593e873fe1bbad6e9e1c527e7e707d1fc1d07c10c3ea3d5df728b0c30e9de8787e78f383ae2f9bea529bb2e1aea36
7c17d3c6346df4b21c70e407d6978f3e86cf17d5b7a97e2f87eab398bcedb067337d642c3493e01f4eace794ebc2e6122c69f7ee83040c36cf23ff08160fd5f8
6b942fd9aedb89f762fcc3b66da7e8e574211799c3d3837248b16fdf34e051f47b539369977780f2196a22f9722884e1848fe019f1c37878c6768324e57f2798
fef85e1a6fbcf21b90f1626772211031fef2bd6b777dd1122b222cb2114e783c2ff484d14cab8df026f23c9e019366e706c14c979ab2f48b293e795e16cb48f3
801c403f7cc98985e5127f37e6bd1b7fa8db6278878ad6198ced70731bc0fec5003b6d19cf2e0fa8cf137ee8d27d6acf3ed4ef137a0f71287e07df2bc078f500
3fb872763fd5772f7cb18d518a0f09fe2bcf28eea901f30e8cb1f9db98b3ec3d3b3274f07ad7fc57f7d34e93c5df1eef7266c29f76e2faf16f64354484326462
e27111d044843f4cc7944c5e62b8668884644cc85e7977f6793c79ef0fd1e9e7d77f8df18329a7932f4e97bb398cb98339cc1bdf1227a4ef04c6b98884439cf0
e8de419f542722e9d631bf7285293c6bf88d74f7b8d6f3c17de475fd4f85e97ef8ba9f788cd7bce0dc5998c2f5c5ef8b6b7229302e49cb454485ec8bc62b8420
9f2293611169f12e299c919c30119498880df1279ce374e9b87eabea3e98febef3fdbdcf12df32115cc2ef8c1b3f8d4dc9ed9f5a288f70fa8f58c963f916a624
4411b0e6956b7cc363f387401f70e953ff87675db1fc1b7eb4a9727d16ff484a62efa0f707edfb4c77bc51bc9170908fdc91e702f78819f529cb1c40cf748f8c
598b5674c6737842c0e785ddd7a75c159e12b38ccbfbc677fff167bdfff980fffffb11effff732cfffff648fffffd80fffffb11effff732cfffff648fffffd80
fffffb11effff732cfffff648fffffd80fffffb11600b966ffffff0ff7aef40412386e57d9bfac621119d26c4b7ca2a972f8bc4fbc14cc57ee1f8abeac3e557d
d9f1cf1aeaf52ff8f7ec3c5ff4e3f86e13fa9bef94df1aeaf525f38acf31df1e457df3dfa7934ef938989bef9c37ddd87e8df3e7932b9f74ef19136060129970
0b91363362fb87c6c1c9272f48b0127df3bf2db667df0717a4c3702d451ab057a0118dcf23fb82ffcce79b4294446e938529a2461a6244063b9913976d3ff9e9
b36bf5e9344bfbc52ae00814031e666f060ebc583caad98c254762834181403164ca81839fc7c860191ea7d50ecf835ff37c5fe9f46ff89be23ff05ffc351c50
e562ccf2c06ef1e2ff0e4ef0fbc57579dec3e2d3ff87e9d694cff739c6bd6bd6bd622222222222222f4abd12fc27542ff4cf098b39c21fb48ab39cd94ef8bcd1
12ede263d598df12f5c9160ce792200ef87f83b5196f27203f42ec42fa1f52a1aef13bf3e96e05744202229c67838b89d12cf20000e78ff7cbe8554a42de1778
__map__
f789fb61f1466048db765f83e0c94464d91e03e11fcbc1c32f9338c730626432063fb8e5178778e5c0f10f6f3ce9832c1e02e26362228e1f1cfe00c87150cfbe5bec38b47fcc00584e8ef413588ae0f1dcae279954fb02ea0b11577ed92ac9198b24678803929cf165422289e83623cc7d5ee7fdc374585c724a2eae573e62c4
452e6224f7fdc3b33cdb99dae5e15836b7e4ca715c579223d7b6c391e6ca2f7310c7b5ee971e49de381dd9769c61b9bee3fae5dc9938c03f768c3ca5ea832704de0470245ee3706b0e39f62e93241b8e4773337e90438c1f38c003a938f8e65da57c92f45a991c61f1388e1cc71fb64e92d8747925bcae030ecb66afc3f54918
ff48166047486411212ec8a148153bfc906df1248e85f28f993cce1efb834242d492a4de4c9ec44d1c6c15045e79c8b8e29fa5ddf1e2074c13d137a96ac8c4c0f8650c2669be53e493e3884df2c351f4971ca206c3e08703c775c52f04203e277545778a3c632e7c57e71142450c801b8ff8a078a9ef75704daf2b4c78f3f941
dcffcce223b9fcf2fea1f138c7a5e9c1977f360b3d370fff1b6e3bed70d13e5fc488fb8f7ce6ea1fdb0e2c7664f2c3c43ff38f47a7d3caf224d992c71fd9921f1cd94476c49d76c7b61ef15fda897cdb736cc79ef8e9388efdd2c791fcf074ab47229bd872c07ec8f8882bf805fb803fa2323a0949f68bc4e248248f591e2442
892ba8382ec1a696dd6ab9b2182c33e8e113b2b89dcbad5b0707c76247269df8637f94bd8ea5b2f970a8643feaa5ff0a39607dce53b0fcf25973c2fec87600fb07c788995b5fc791caf2a4e992c7912d51afeddbf65d713fc7b16bdbf3c47fcf71ecdaf66eefb31ddf174be2072249deaecb58b0a92d2f2c1923ae0fb00f6611
67f639762c24d929b13886c56c098c10e2ba007b6016b1ac62e4f187233d16b5adbbdef0a572f3ccb15f82c013779a1f1af9e3dad577db47c4b51f1cbba294fc10f14b2a7846be2070e4da65cf2f897f3a93cf7264c42339047b9ef0c0fdcb73e43df3f442f243cee8e63847303f8859f24bbe19f938fe3896235df07eb62759
e4aaed8ff041b97ef049a4bae3724130c7e0c7a8e6b5624fb677b67f58aed04b1de6ed7185744b78de4773b183a4b2c1f2037391494848f258164deb916b8f713892bd9183e5657998c5fa05904948c81396edb46ddb9a6f708d3c48f30bec83e380cc1eb26d335be24a9e58b647403cbf1cf15ce8f1074974c7226973a23f1c
f3d8716d2d3d42f1e23cba24fcb33c2c2478cc1a498f0dc7b1882c5b8c10fb236923ec0bc77d1cedbc4ffc1096499bf0cfdb6edb46837f7e398efd500d7ea18dd005b8d776db36daa00f1cc7b13f22cd3661c4f5ad23c7b16ddf83707cbbc9b7fdf06d3bd0de6fbb3f68701f6d6f1a326c7e498ee76893a38244be63912cdb23
20f624fd40c271afed92f3745c4dc23f6fda6dfb217ae07e9ef689c2fd3ceda2c18ef8ae5cc721b4454f387a4ca4d92284787fd1ef8ff7eef948b6ebfee7d2e87704c1995fe459716cd72f73986156d8464ae57fa6e41069e197e7b6fce1d8f95d8a38b3987e4072c4b38459dce4700819d99fb7ed976d9738ba556ce761abd8
fe5ce6e8061547b70324f19804fc60871fe60f380edb2fcbe4eab6882b891ff00c95fc22c7b2d921c92f46e69f1da7edda86ebda064f0249987f249363d93299cb9a10cffafdf0c7337ce68febcbed8a3f1c92c31f227918c4a8f7993ecf735c89f80e5fd77f9a1b5ed7953cae7f5c4ef170b9e5fcc7e5c1cbe3bda739aeeb8b
b0a3fd251775b47d7ee0bc724988e3721cf0873d1d17f5bd644ca57175b7e6973393f0da258e777cc47b8e4f7b47587fc8b1185b63fffffff07fea4f804a912bc35d76ef5031577378d475e572a9ebcbe5d23c4eafb9ee54d5f343ee9df2fcd1aef2fc6126cfcce499993c33936766f2cc4c9e99c93333396636636c76d9658c
815dc6c8ecffdfdceff3c3f1fae13d76787fd9f24bec4992b8c4f64b5c9be5892d49c4e7175bc7bb2d8b2549e21fb1bdb9d59dc487640df91ffcb7feb13f1cbdaf1fae3d7fdcc2fdb6fde883e3c61f8977c7d776690f9873fb18dc4fdb50d8e30f969ce307799f9cd7fbc3ce6b7bfee6f82fc9f3c758afbecbf184fb97b6bfd0
07c71b24b6e787b60fe9e07edafe40e17cdafe120d04f3cb232c7d72b6c744faaf84fef724d7f3c87b5ccd72e4e23edb8e1ea425993b398eb67fa415ccb985c1d7b63c3c62c29bc9a772f11dcf766cfbbf5c7d923ef4877393a579a2592a17e336fd23b6e4d163271b71da76c496cc967f92bd598e25e72be97533916bebcfd4
e78d3f1a7f24c191d4ea8e6cf77389e39924de674e0c91c924f14fe61fc029599aff07f5b8b3a7e14c8e2cbfccf2105f1259af81d9fe89ed3944635bd57ccc55e99d789f11f33157fc92c72322d2feaefde35964b1c5972d8c25771e47e624bbe6ba7479275db69b398ee417f1cb8e55bfac632adf755dfb65dbcf48b4326622
72278ee4f821f1e6057ffcf0875fe87cc3b11f7ec83ff02c07c43289b9087250879bcd012497d49dfd1dea0f2e70f10f8f0476488e497f310ff3de732e976e7f5cfc423d4bf28ec00f8ed40f2226525ba6eba48eec6fd7e1951ed178e48cbdeffc93fc719ff37de211abd8e3b25f3281a8d76935d7651ef3ced64c882462c496
f98b637fecd8b163f78ec53fcdb3eed9b167c7e29a1fee3872fcb23cf5ed1f7df61e89270346f28f1d788db10123f9c50e30c6068cb101636cc0c8757c3ff4ecc7a7b2f9a23ffcf0cbf111fed8f187efb9edfbe5935b0a8117643ee39d777e390efec05ee49503027ec181134f7765d39f7c3d2a57f31c9eafb7e7f3cb4bfc20
b9f48763a77f1284e3cdee23b69c76396d9698f561e7f00f6cd86b56f3c7d1acedfc71fe71ec3afe388e7b91c60f599e799f1d479c4f8f77fbbe977fe6c1953c71fd0ff887ff3f94cfffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ff
ff8df0ffff1be1ffff37c2ffff6f8401d063fffffff07fea4f80ef14326597badc1ec9548ea86570d4ccf5a4aa76e5b1a689d932380e33cf976b975c673b5f5c6f3b8deb6da771dded34ae1fda695c7fb4d3b87e69a771fdd31e8ec3f18bf9632a83641ebb4ca62a04e1314666b319300166c00c9801336066d879fd725e97d7
3ff937ff886bd7f24b9350e911dfd8327cfb8e8bc3ec5a647d5c2a554763213db20cfb3fdd0fb7c7f3cb79f4f9c799fce2fd47b87ea1cfe99f7fba6d4db4c72fe397e587876ff14fe29a2bc0eb4845daff89031cc39b4b42a2cf9526d1fa381212767bae6e5bfff9856e8e5f1844124772f5694a23ff3b39f0e6827f127d1c07
a19ee9037f3c935f8ec833b97025f2ff488f6e5b9fedd8b66d2222edff407078bc397e585c47ec8aa7eba8b3fc805f240857960326ae5918572406c0fbf4a8c8fa3f1082fd20a9c5dbd8b577dd8b38cb89a309e69f3c4363d7fae9ec3d420476bcfc6277f7c7766c6bff356078f3489c67ecdb731cbb10b71cc9e2c3fedadb6e
5b8fedd8d6e9967e477ca47573b81ffe2f72fd507dee95d4926bf98824b2f8b0f9c7932709e662c8991fba6d5bd23f32ffec785d4fb7adfd9fc86c579f3e7daac76a8b25ff10cb9c4d16549f708523dec499b988237379fefae13ab6add7b5675bfbafe1b876edfae5891e62c9b73c39d85c43bd4fb85c6f58def8289b238fe7
c8d3f67fa038ae35fd125d63f349306f2432a7631e09c9fe39e20dfbc1fbf0e8fa872667586cc77b77fd9fd8a58e3d3daa5b2dd972308df8eac2a63b22d7f1a54bdee42093ef893f2e2c8945fe27e0f8a16ddbfaa5b5e45a2ee249fcf1b0598ee1b8dcc7b13fc42dbae5842d6d82dff2b5dbd67b3bb6b5ffcad80fc77a5d5bdf
c515ff401c09715eaecbfd241287b167fe49fc91f8e7f2cf75789bfd0f64b23fac6dea58be17ee5fce2fca0fb8ee1f7ef0dd7fb8ba79373bb11badfe5021fa09ff07f2a26bfe596dcbb6c31f4b5cc9d7a7f95b0eafe3f0cb15c7f1fc7172fcf3c72ffb47771d9fe6dab66f7f78eef3fd05e7f9a679ebe9711ccde5b8ae1c598e
2ed976ac9cd9c8a1e27fc4448f1dafcf9d3f2efef1a97d3b67edb11ec773f6979ecf796e93624ead4b7e38bf5defcea9a7bbaa6fff78be779bfe4f980c95c495a6213fb83cdfbea9a353fda7d7737ddba41ce271ccf0b93cdfbed91cdd337d773dd7b74dff278cf99c72921f72321ef73f3fdcdbbae797b6477ff9637ff4f8e1
87bbdb76fe13dffd4f8eaae0beaeefdb8e698e69f65ffa7d5fb76ddbb6adffdaa5ceef8f5f12619ee911fbc9f1ff37c3ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f230c3184ff7fe3cfefffff07edeef0000406080a8e8d21757d5d5b597b898b91
212426282a924d557781716979953365e7e8ea40424446484a4c4e5052545658466f6b85376d0360626466686a6c6e70727476783081828486888a8c8e90929496984461e1e2e4a0a2a4a6a8aaacaeb0b2b4b6b82a111222c2c4c6c8ccced0d2d4d6d838313262dddade5a9a7afeba227301191a0c0e0205092d7f393a42832d
2e0a111315171d1e5c5ef2f4f6181b1d3d3e247d7ef8fafc14169c9e3436bcbec0c3c5a1a3a5fd2749922449922473f478ae3e3f7ce77bfff0c72ff9e7a7bf7e5bfefbe11f3ffed83f7ffdf7e72b7f7f7efbebf7ffc11f3ffd1ffe17ff8ffc4ffe2ffffd6f7ef8e1ff73ff6f1cffa3fbff71dffddfdeffa7ffd5ff2b49922449
92e47ff67ffbdffdfffe87ffc7ffe5fff37ffa7ffddffe7fffc7bfbfffe7ffc3bfffeb1ffff93ffcbffd9ffee7ff8fefff013ff4febfbffffbdfffd7efffe97a1ffeffc06f7ffcff83ffbff0ff1ffeffc4ffbff8ff1bffffe3ff8ffcff93ffbff2ff5ffeffccffbf59fe073fe7faff3bff9fffcb2fffebffbff1bf49fe47ffc4
78ecfff7bfff5f39fe67cf0fffbbbf7ffbedfffffcffa1ff7ff4ff97feffd3ff9ffaff57ff7febff7ffdffb1ff7ff6ffd7feff9bebffcffdfcffefdcf9fdfcff1bf93ffff13f991ffff9bffcffbdfffff7ff07932449922449feffe1ff5ffcff8fff7ff2ff5ffeffcdfffff9ff47ffffe9ff5ffdffafff7ff6ffdf128e9cefff
dffd9fff1ffe4fff9beff8ebd9fffffdffc3f9fcffe3dffef0ff97fffff3ff9ffeffd7fdffdbfffffbff8ffffff3ffbffeffdfffff7cfe38fefffd3fcffffae7ff4338f5b9fefffeffff07fc0ffefbffff813f5bff87df7ef8ffff82ffff3ff8ffff84ffff5ff8ffff86ffff7ff8ffff88e7ffff27729d43ceffffaff0fdffff
c5ffff0ffcf03fb8ff390f223ffe78e6effd78fcff7fc4ffff47fcff7fc6ffff471c9158cff37ff1cbffa6fffff4fff03f7812d1ffffdff8ffff8efdd1fdffffc7ffff8724697eecffff8ffcff7fc9ffff77fcffffc99bc5cbf3ffff29bf3effffbf727ecbf5ffff2dfffffff2ffff31ffdfffff9ff9ff1b75fdff7fcdffffdf
fcffffc2ffe4fffd3fe98ffdffff9cbfff07ffffbf73468be4ff2664fefb8fff855c3f74d7ffa2fcf0dff1ffdfffffbfe7ffff7ffeff3f283fefffff87feffbfc8b1ffff3ffaffffa41cfffdffffd2ffff37fdffff53922449922489fdff7fd4ffff4ffdff7fd5dffdffffabffffcffaffffadd72fffff1ff2dbfffcffffbbfe
__gff__
ffffebd7ffd9ffccff7ff9ff27ffff1ff6ffff63ffff5ff69367de9ff37ffa3f6d0723bbff17ffffbff03fddffff9ffdff7f9a63ffffbff6ffff6d39ec7ffac7ffffbffdff7fdc7f3ffdff95f7bfe3ffffe7feffbfeeff0f1c875f7ff9ff07ffff7ff7ffff79ffffbf97244992244972fc3f8ee4ff1ff8ff07f37fdae1fff6ff
ff7dfffffff7ffff81ffffc17fffffc2f5ffff0d001984ff97ffcbf7ffff69000906b2b1b7b9bfc6cbc7c30fdadb0c080d0eb4b8bebdb0c4cccecdc0eaebfd10020301b6cfdcdd2004eced340b350736b337dedf444546bc47eeef13151719bb232527291416181ac12426282ac958595a5b5c5d5e5f68696a6b6c6d6e6f7071
__sfx__
6f7e4afe2f8071ba673ff3023c573f7113ff7701e673ff501fc453ff7538f753c776124433df770f07339f77238133f777327770fe673ff213fa453f7140ce770df433ff77327773977119f771f6433e77332f77
ffcffd7f3fb740f65326f7732f773f91726f770fc443ef7711e770fe673ff223f7533bf770f9243477735f7727a312ff363f77735f7737a7727e573f7753f7772cb471f9773ff133ff7336f772787737e773ff66
7ffdffb33ff730b9172f7773e7331fb773ff653ff751be363ff773df7701d771ff773f9473f7311dc473ff703f77732c7723c623df7222c7535f772fc773fb363cf770ff773f05127f773fc673ff523ef7706f77
ff3ff4ff3ef7706b36275443ee373ff753ef771df473ff733f77718e773f9673ff312df473ff743f7771ae772f222240672ff771f8473ff3509b773f3373ed653ff7716b671fe773f2653f7773cf773fb673ff07
ffcf43e83af7738c553f7772e8373ff353d9673f737398770f92433f772fd773fb673ff7126e333f7773fa673ff6725e773f77120f7733f512fe070f7771601726f773f73012e673f77701a443ff771f82207f26
ff23fe57379673f77702f773f7723477735f303df710e6711cf653ff77378673ff77039653ff771fc0717f7728c373ef773f9163ff772b8773f42225f773f7723ef773f4142df773f7331a97323f773f7533ef77
ffe7253f39c77276773ef773f9442cf773f7343ed771fc533ef773f2221ae733fb5732f773f7323ff771fa113c77702f77089773f77725b403ff772f50632f773f77211c363bf753fb173ff473f8571fc670f516
e84f7ffc11e771df773106337f163fd243f7350236413d32087513f77117e363ff772316312c771fd710cf771fc753f7733ff753cd753fb263ff772711336f773f723128013ff052cb54082231fd773ff7706f77
7f51b2ff1fa770fc0724e7723e770f366228263b8673f7770eb6301b0123c0137a612ff773ff760c7130b34113d453ff0010e763cf773fb713ff773f7442cc7408b61194021ce7539f773f7043ff773f0273df77
ffff8fcd3f7730ae563cf773f3223f9763ff7717a1123f773ff512477732f773f774199773f7732a8713cf773fb213ff772fa173ff77179063ff7733a403cf773fb3138f773fb722df773ff7336c473ff7730a24
37c2ffff3ff7717e073ff77271001fc023ff773fb073ff463f0012a42316e553f1443cf773f72121f773f73302f773f77604e773ff7508c773ff73118773f777238673ff77069473ff770da073ff771bc063ff77
ffff6f842f9203ff771f3403ff773f6013ef773f5123cf773f33438f773ff6030f773f75121f773f73302f773f77604e773ff7508c773ff73118773f777238673ff77069473ff770da073ff771bc063ff7737814
c31fdf763ff771f3403ff773f6013ef773f5122cb4434307258372ca5134a113a77725c533ee761cb371dc653be6618f631f0372ef703db052ff661f4732cb613b7653ee6127f273c707397773fc44356633fa47
971fbcfb0ae331bf032db753616613c463667536627295113d1772007730e563d7140e6331ec6703f0423f7020c702fb361ce1506e67217273cf060d8743c4730c1651aa6326f70388373cc3334f702467738d36
00000000254361e2630b771036613bb2612c701d1432fd4721f4535d350eb67020700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
00 72737475
0c 76770001
0f 02030405
03 06071e1d
02 1f422e2d
02 2f485051
00 52606162
00 7c7d7a7b
0e 300c0d0a
01 0b407879
08 1b1c3308
01 092b2c43
00 12322242
00 31417e7f
03 0e0f3839
00 3a3b3c3d
00 3e3f1148
00 494a4b4c
00 4d4e4f21
0b 1b247f2c
07 4763623b
00 5f373f1c
07 7b63171f
07 7c704f4f
07 7f7c751b
07 7b6f473f
0a 7f63575f
0d 3f3f7f7d
0f 7b7f407f
0f 613f637d
0a 5f7c3f7e
0e 277f177f
0f 4d7f6778
0a 3b7f237d
0f 7f7c1f7e
0b 7b3f1c79
0f 3f7c2f6c
0f 7f723f71
0e 3c7f2f7f
0d 594f7f37
07 7f5d7f29
0f 793f7c6f
0b 527f4d42
0e 22723f79
0f 3f447f61
07 497f6f7f
0f 681f7f63
0b 7f6c7f79
07 4f7f737f
0f 7a537e2f
0f 7f5b7f4f
0f 797f7d5f
05 7e7f6c7f
0f 7b7f781f
0c 08577e47
05 7f677b5f
07 7f6f7e4f
07 727f7e1f
0e 257f737f
0e 7b763f7f
0a 3f7e257f
05 1b257f1b
0e 577e7f40
0d 7f3f607f
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
