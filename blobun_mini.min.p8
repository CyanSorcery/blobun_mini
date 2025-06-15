pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function _init()cls(1)?"loading...",1,122,13
flip()memcpy(32768,0,17152)j={{},{},{},{},{},{}}f4,fb=0,0local e,f=32768,%32768while(f~=0)add(j[f>>13&7],e+2)e+=2+(f&8191)f=%e
f9,fu={51510,27795,14025,37740},{32769.5,42405.5,60855.5,-.5}f3,ff,n,R,S,f2,fe,A,o,a,fn,b=0,0,0,0,0,true,time(),0,1,{},false fo,fs,fh,J=D("0001115525511125",16),D("3c26915154",5),D("13b49a5d6",3),D(J,1)u={octo={64515,-925,-829,-733,-637,-541,-445,-248},t_switch=-349,t_coin=63494,p_state={64140,63686,63880},p_win=62483,p_portal=63142,p_hurt=61448,p_move=61956,m_sel=61700,m_back=63333,m_confirm=61828,s_trap=62084,pit_t=62210,pit_o=62278}function eF(f,e,n)print(f<<10|e<<5|n,7)end fN()fO()fP(1)fx()end function _update()f2=f2==false S+=.2S%=4f3+=.035f3%=1n+=.15n%=32R-=1if R<=0then R=14elseif R%7==1then K=true end fQ()y=max(y-1)if(btnp()&48>0and y>45)y=45
if(count(a)>0and y>10)y=10
if(y<=45)A=min(A+.1,1)
if q~=nil then o=max(o-.1)if(o==0)local f={fR,fx,fS,fT,fU,fV}f[q+1](T,fm)A,o,q,T,fm=0,1
end for f,e in pairs(a)do e:m_step(f)end if(not x(4))b=nil
if(b~=nil)sfx(b>>10&63,3,b>>5&31,b&31)b=nil
fe=time()if(fe<0)stop"game has been running for too long. take a break!"
end function _draw()fW()for f,e in pairs(a)do e:m_draw(f)end local f=q==2or q==nil and count(h)>0local e=f and T~=nil and T or L or 1local n,f,e=f and fs[1][e]or 1,fs[2][e],64*cos(A*o>>2)if(e>0)rectfill(0,0,e,127,n)rectfill(127-e,0,127,127,n)
if y>0then local a,o="stage "..U,cos(abs(max(abs(y-45),35)-35)/40)*64-64local n,d,o=o+8,o+9,w(a,o+12,97,7,f)line(d,105,d+o,105,f)line(n,104,n+o,104,7)w(i.s_name,n,107,7,f)if(e>0)?i.s_author,n,115,f
end end function g(e,f,n,o)if(e==5)V=f f=nil
q,T,fm,fX,y=e,f,n,o,0fy()if(q~=2)music(-1,500)fn=false
end function fg(f,e)fQ,fW,y,h=f,e,0,{}pal()end function e(f,e,n)fp(6)fw(1)fv(1,0,0)music(x(5)and f or-1,0,7)d=0fg(e,n)end function fT()e(-1,fY,fZ)W=90end function fR()e(0,f_,e1)end function fx()e(4,e0,e4)local f=fz()r,M=mid(1,f.world,count(s))v=mid(1,f.stage,count(s[r]))d,B,E,e3=0,0,.125,D("13b224cd02415d6d2494",4)end function fU()e(4,fk,fF)V=nil end function fV()e(4,fk,fF)end function fS(f,e)fg(ef,e2)local n=f4~=2f=mid(1,f,count(s))e=mid(1,e,count(s[f]))L,U,i=f,e,s[f][e]ee(f,e)f8,fj=0,61936.8827h,z,l,X,f5,k,K,Y,N,fA,y,C,fq,Z,G,fd,_,O,en,eo,e8,e5={},false,false,false,false,0,true,false,0,false,fX==true and 0or 90,0,false,{},{},{{},{}},1,i.s_tiles,fB(),fa(),H(false),H(true)fw(2)fp(f)if(n)poke(24405,0)local e=D("2854ef234924d6d54924",4)for n=1,4do pal(e[1][n],e[f][n])end spr(1,8,0,14,1)spr(16,0,8,2,2)poke(24405,96)ed(f)fv(2,96,0)
local n,o,f=i.s_data,i.s_width+2for e=1,#n,2do f=c(n,e,1,1)F(96+f\16*2,f%16*2,(e-1)\2%o*2-1,(e-1)\2\o*2-1)end local e,f=i.s_obj_count-1for e=0,e do f=ea(sub(i.s_obj_str,e*5+1,e*5+6))if(f.type==11)add(fd[1],fC(f.spr,f.x,f.y))else add(h,f)
end for f in all(i.s_hints)do add(fd[2],fC(f))end end function fC(f,e,n)local f={dir=type(f)=="number"and f or c(f,1,1),x=((e and e or c(f,2,1))<<4)+12,y=((n and n or c(f,3,1))<<4)+12}function f:ondraw()f6=self.dir spr(f6%2==0and 254or 255,self.x,self.y,1,1,cos(f6>>2)<0,sin(f6>>2)>=0)end return f end function fN()local n,a,e,f,o,d=s s={}for n in all(n)do a={}for n in all(n)do e={}f=2o=c(n,1,1)e.s_name=sub(n,f,f+o)f+=o+2o=c(n,f-1,1)e.s_author=sub(n,f,f+o)f+=o+1e.s_width=c(n,f,1)+1e.s_saveslot=c(n,f+1,0,1)e.s_goaltime=c(n,f+3,0,7)e.s_devtime=c(n,f+11,0,7)f+=19o=c(n,f,1)*3e.s_hints={}for o=1,o,3do add(e.s_hints,sub(n,f+o,f+o+2))end f+=o+1o=c(n,f,1,1)d=f+2+o*5e.s_obj_count=o e.s_obj_str=sub(n,f+2,d-1)e.s_tiles=c(n,d,1,1)e.s_data=sub(n,d+2)e.s_height=#e.s_data\2\(e.s_width+2)-2add(a,e)end add(s,a)end end e6="4fe5729bd9f69189773150d1dfc52318"J="55332"s={{"6tadpole3ashe601004.8344002.8344c0013110123221230221321310300400503600600100b3101b5100b0200b1203b3301124e4e4e38181818404e38184033ff01ff13403321131d010b01ff3b3301ff0cff01ff013b4c3101ff01ff01394d4e4c41414141414d4e","8suspicion3ashe402004.8344002.834451441431421412400104400124e3818181818403810ff01ff013b33ff01110dff3b3301ff01ff013b4c3101ff01ff3b4e33ff3931213b4e4c414d4c414d","efractured floor3ashe605006.8344004.836160450551651643632640504500a1160a6011a2540a40251e3818181830181818403301ff011a25ff053b33ff05ff121b01ff3b3301ff01ff1214143f3614141b01ff01ff3b3301ff121b01ff013b33ff01251a2101ff3b4c4141414b4141414d","btwisted path3ashe504005.3344003.334431031021010100300154e3818181818404e3810ff01ff01134033ff01ff19ff013b33010b011f0dff3b332101890cff013b4c413101ff01394d4e4e4c4141414d4e","asilly swine3ashe603007.7010005.501141051041031020100500223818181830181818403301ff011a01ff013b33ff0bff0cff0bff3b3301ff89ff89ff013b33ff11142a140dff3b3301ff010c01ff013b332101ff01ff01ff3b4c414141414141414d","dtricky portals3coco411005.3344003.567770323421431422411312300503200a1220a2012a2322a222315381818181818403301ff25ff013b33ff018901ff3b3301254521013b33ff014501ff3b4c41414141414d","cstylish bunny5autumn632007.4677005.501170561662651552541440430305600a4020a2040214e4e38183018404e4e4e3810451a4513404e4e3301ff1aff013b4e4e33ff010c01ff3b4e381001ff01ff0113403301ff0bff0bff013b33ff01ff89ff01ff3b4c31ff01ff0121394d4e4c41414141414d4e"},{"cbarrier break3ashe606006.6677004.717750010110211310300200100131531d4e4e3818181818404e381810040403ff134033210104020301ff3b3301ff01ff03ff013b330301ff010301ff3b4c4131030303ff394d4e4e4c414141414d4e","estaggered coins3coco627006.5011004.5011310310200104003004005643156462561c3818181818181818403362ff01ff01ff013b33ff19ff62ff19ff3b33010c0119010c623b332101ff0cff64ff3b4c31ff01ff01ff633b4e4c4141414141414d","cdiamond coins3ashe607007.9344005.68446024034044054164163050240046056402564325620454233818181818181818403301ff01ff01ff623b33ff6464016363ff3b33626464626363243b33ff01ff23ff01243b33222321ff2424013b4c414141414141414d","dunlocking path3ashe608006.3344004.334472232131031020011110100502300a4121a21419039f363551b3818181818181818403301ff448a44ff013b33ff01050b0501ff3b3301ff014301ff013b332c012143ff01423b4c414141414141414d","dtriangle coins3coco626006.5011004.50116163162261251341242060630045056412563425530355433561c3818181818181818403301ff01444462633b33ff01ff01ff01ff3b33646243ff4243013b334264ff62ff43213b4c414141414141414d","dfractured isle5willow620008.8677006.35105266256246236126090660035055a6100a00612035431355a0664a640621654273818181818181818403325ff01444442013b33ff01ff444401253b36141414141b24243b332242ff011a24243b33432323441aff053b33432323441214143f33052201ff01ff213b4c414141414141414d","atoggle maze3coco612009.8010007.23446263253243233223213090630042056461562125436455a0522a2205425569359f2b3818181818181818403344ff626301ff433b33ff01ff63ff01623b33012205238a23013b33242424448944213b3323ff01ff43ff423b330501622cff01ff3b4c414141414141414d","cnumerous keys4riley633009.8010007.117752432332232131030a043003405540156441569629f113534045624454a0560a60052b381818181818181840330303014442ff053b336201ff016264643b330144444343242c3b33ff0204012124243b33626363632289013b330501ff018a23233b4c414141414141414d"},{"ewatch your step5autumn330004.3011002.501140031132121020200300310551038181818184033014201ff3b33474443013b3301ff43ff3b332101ff273b4c414141414d","ccareful moves5willow518005.1677003.16774143142241231030430035055223541438181818181818403301ff01ff27423b33ff23ff0124433b4c3123014701394d4e33232227213b4e4e4c414141414d4e","cdiamond house3ashe509006.1677004.1844f154153252142141240330231221211301302003313114030540020254252541a4e4e381818404e4e381810232313184033ff012323ff013b332224242424223b33ff47ff0147013b33010701ff07213b4c4141414141414d","9conveyance3roxy528006.8344004.83446104103102101000010030040011353253541e38181818181818403301ff66ff01663b33ff664601ff663b330166060601663b33ff02030123223b33210303ff23233b4c4141414141414d","dunstable floor4riley417005.8344003.851040040140240340200400321551a381818181818403301ff0144443b33ff014244443b334343fe09fe3b334343ff89ff3b3321ff0109013b4c41414141414d","aforest maze5autumn531006.4677004.884440041140133230600400a5100a00519029f152539549f1f3818181818181840336589464646273b338a03ff8aff653b332cff010926023b33ff0404feff013b3321ff4709012c3b4c4141414141414d","bmisdirection3coco829007.7010005.501161030021122110010110700300280541715332255a2300a00239839f2238181818181818181818403325ff01ff06ff43ff223b33ff0144231924ff02ff3b33014442230c240404033b3321012501468aff032c3b4c4141414141414141414d"},{"dbring the heat3ashe416005.1677003.167732232131030202300741e714381818181818403301696969013b33ff0a0a0a283b33010a0a0a013b33ff012101ff3b4c41414141414d","acold circle5willow619006.1100004.501120031130300300a6360a60631c3818181818181818403301ff696969ff053b33ff6969696969ff3b33016969696969013b33210169696901053b4c414141414141414d","bfrozen water3mika624006.5011004.501112630406300811e8a1260a60121c3818181818181818403301ff696969ff053b33ff48acb5a401ff3b33010591968dff013b33ff0169696901213b4c414141414141414d","ahot diamond3mika523006.8344004.83445300301002012322030000025054724e71e381818181818184033210a7a8272223b33ff01578184723b3301ff017c86743b33ff0189575c543b3323ff28ff0a394d4c41414141414d4e","9lava coins3coco625006.5011004.51776103002112211001111060030041056730e74505626154433561c38181818181818184033016201280a620a3b33ff24ff017a72223b33016463558077523b332164236257540a3b4c414141414141414d","ahot springs3ashe810010.2677007.33442001111090010025054811e8761e7813e8a6320a2063a8404a04842d3818181818181818181840330166050606220606663b332148acb5b5a4285d693b3301ffaeb9b9a6235e693b33ff489196968d0551693b332555520a0aff01ff253b4c4141414141414141414d","ccool crossing3mika622007.9344005.68444002012122121090020042056831e8712e745256814e8a2562a622544656234e4e38181818404e4e4e4e3362ff013b4e4e381810ff48461318403321280a896962053b33ff4669896901ff3b3301488e928bff013b4c41310501ff39414d4e4e336363623b4e4e4e4e4c4141414d4e4e"},{"dfollow the gem3ashe714012.8344009.284453003010023123130c000005200755006352555720552300543035040120654526025460417653383818181818181818184033214aefff43cf44443b33ff4aff01430144443b33014a4a4a434201af3b33ff010f236f0403033b332fff0123230403033b33ff01ff232301ff013b3322ff4f238fff01023b4c41414141414141414d","boctogem maze3roxy613011.2010008.201061631622611513502510f06300200545300756000203545130613353553015640250505545045160334655a6606a06663138181818181818184033224a23ef01ff0f3b33ff0303030404ff3b33240303030404013b3322cf2302ff2f213b3301ff01ff43ff4f3b33af43ff018f01ff3b33056f44044204053b4c414141414141414d","bweaving path5willow821017.3440012.384441871862851751008700700e731255403569439f4735620554636e6837e815753a0834a3408818e842856a8882a82884a38181818181818181818403328ff434301ff7a720a3b33ff01ff01ff017c740a3b330142aca4010b5754453b33628e958d2c03ff628a3b3614140d2519ff6969013b332201ff011a01ff01ff3b33239769080cff2666013b33ff886948ff02ff01213b332548626301630163453b4c4141414141414141414d","bfour islands3ashef15030.3344023.734493b90ba2ca2ba0aa3ba3bb0bc2cc1c0b900210546c0e62e054a51b0ab0515a1055b30650404554031a453845e89199f549021aa53afaf4af4fa82ce873ce71ec5352d0123d545ad00a1e15a151eabe4ea4ebe5ee07834e3818181818404e4e4e4e3818181818404e38102201240113404e4e381045082422134033ff01ff24ff453b4e4e33af24240189233b3301ff012489243b4e4e330149012301ff3b338e8bff01ff013b4e4e3323cfff0104233b338fff0a0a236f3b4e4e330223010423653b4c3125ff0148394d4e4e4c3123ff0423394d4e4c414141414d4e4e4e4e4c414141414d4e4e4e4e4e4e4e4e4e4e4e4e4e4e4e4e4e4e4e4e3818181818404e4e4e4e3818181818404e38102c23234f13404e4e381021ff034a1340337a75587d82723b4e4e3302ff010301653b33575449575c543b4e4e3303030303ff013b3301ff482801ff3b4e4e3301ff018902043b33ff8a2f2223013b4e4e330f016604ff013b4c312501ff05394d4e4e4c3105464aef394d4e4c414141414d4e4e4e4e4c414141414d4e"}}function fw(f)if(f4==f)return false
holdframe()I(0,0,j[1][f],sget,sset)I(0,0,j[2][f],pget,pset)memcpy(12288,24576,255)f4=f end function fp(f)if(fb==f)return false
music(-1)holdframe()I(0,0,j[3][f],pget,pset)memcpy(12544,24576,128)memcpy(12800,24704,2176)fb=f end function fv(f,e,n)holdframe()I(e,n,j[4][f],mget,mset)end function fP(f)holdframe()I(0,0,j[5][f],pget,pset)memcpy(14976,24576,2176)end function ed(f)holdframe()I(32,72,j[6][f],sget,sset)end function I(i,e,f,r,t)local function c(f,o)local e,n=f[1],1while(e~=o)n+=1e,f[n]=f[n],e
f[1]=o end local function a(e)local n=$f>>f%1*8<<32-e>>>16-e f+=e>>3return n end local function f(e)local f=0repeat f+=1local n=a(f)e+=n until n<(1<<f)-1return e end local b,u,s,n,l,o,d=f"0",f"0",f"1",{},{},0for f=1,f"1"do add(n,a(s))end for a=e,e+u do for i=i,i+b do o-=1if(o<1)o,d=f"1",not d
local o=a>e and r(i,a-1)or 0local e=l[o]or{unpack(n)}l[o]=e local f=e[d and 1or f"2"]c(e,f)c(n,f)t(i,a,f)end end end function ei()local f={}f.obj_list=fD(h)f.player=fD(h[1])f.g_p_zap_turn,f.g_tile_count=k,O f.playfield=ec()add(G,f)if(count(G)>60)deli(G,1)
end function el()local e=count(G)if(e==0)return
local f=G[e]if(e>1)deli(G)
h=f.obj_list h[1]=f.player k,O=f.g_p_zap_turn,f.g_tile_count local e=h[1]e.nextdir,e.isdead,e.ismove,z,Y,K=-1,false,false,false,true,true er(f.playfield)end function ec()local f={}for e=0,34do f[e]={}for n=0,32do f[e][n]=mget(e,n)end end return f end function er(n)for f=0,34do for e=0,32do mset(f,e,n[f][e])end end end function fD(e)local f={}for e,n in pairs(e)do f[e]=n end return f end function c(n,f,o,e)return tonum(sub(n,f,f+(e and e or 0)),o)end function D(d,f)local e,o,n={},#d\f for o=1,o do e[o]={}n=(o-1)*f for f=1,f do n+=1add(e[o],c(d,n,1,0))end end return e end function p(f,e,n)return f+(e-f)*n end function F(n,o,d,a)for f=0,1do for e=0,1do mset(d+f,a+e,mget(n+f,o+e))end end end function P(o,d,f,e)local e,n,a,i,c,l,f=i.s_width<<1,i.s_height<<1,48+f\16<<1,f%16<<1,48+e\16<<1,e%16<<1for e=1,e,2do for n=1,n,2do f=mget(e+1,n)if f==o then F(c,l,e,n)elseif f==d then F(a,i,e,n)end end end end function Q(f,e)local n=mget(f,e)if(n~=125and n~=127)return 0
F(126,24,f-1,e)return 1+Q(f-2,e)+Q(f+2,e)+Q(f,e-2)+Q(f,e+2)end function fi(e,n,o,d,a)local f=#e for f=1,f do n=print(sub(e,f,f),n,o+sin(f3+f/10)*a,d)end end function w(f,e,n,o,d)?f,e+1,n+1,d
return print(f,e,n,o)end function fE(f)return(f>=60and flr(f/60)..":"or"")..sub(flr(f%60)+100,2,3).."."..sub(flr(f%1*1000)+1000,2,4)end function ef()local f=A*o==1ff+=.075ff%=1f8+=.015f8%=1if(y==45and fn==false)music(x(5)and 0or-1,0,7)fn=true
if y<=45and f then if(btn(6))poke(24368,1)
if((X and l or btn(6))and count(a)==0)et()
end N=mid(0,count(a)==0and(l or z)and N+.2or N-.2,1)if(f)for f in all(h)do f:onstep()end e7()
local f,e,n=h[1],i.s_width<<4,i.s_height<<4local o=f.inportal and cos(1-f.anim>>2)or f.anim fc=i.s_width>8and mid(0,(p(f.oldx,f.x,o)<<4)-48,e-112)or(e>>1)-56fl=i.s_height>7and mid(-8,(p(f.oldy,f.y,o)<<4)-48,n-108)or(n>>1)-60end function e2()poke(24405,0)if(f2)eb()else e9()
if(K)eu()
if(Y)es()
eh()poke(24405,96)palt(0)local f,e=-32+n,-n if(L>=3)f,e=-32+-fc/2,-32+-fl/2
for f=f,128,32do for e=e,128,32do spr(148,f,e,4,2)spr(152,f,e+16,4,2)end end poke(24404,96)pal()if(L<=2)for f=0,127do sspr(0,f,128,1,sin(f8+(f>>4))*1.4,f)end
poke(24404,0)camera(fc,fl)local f,e=i.s_width*2+2,i.s_height*2+2palt(256)map(0,0,0,0,f,e,1)fG()map(0,0,-7,0,f,e,128)fG()for f in all(fd[_])do f:ondraw()end palt(16384)map(0,0,0,0,f,e,12)palt()map(0,0,0,0,f,e,2)for f in all(h)do f:ondraw()end ex()camera(0,0)local o,d=x(1),count(a)local f,e=p(127,115,N),o and 0or 87poke(24404,96)pal(fo[1])if d>0then sspr(0,0,128,128,0,0)else sspr(e,0,128,9,e,0)if(N>0)sspr(0,f,128,16,0,f)
end pal()poke(24404,0)local e=C<=i.s_goaltime and 7or 13if(l and C<=i.s_devtime)e=10
local n=dget(i.s_saveslot)spr(n<599.995and 147or 146,88,0)if o then?fE(C),2,2,e
if(fA)fi("new time!",32,2,e,1.3)
if(n<=i.s_goaltime)?"⧗",81,2,9
if(n<=i.s_devtime)?"♥",75,2,14
end rect(96,1,126,7,7)fillp(f9[ceil(S)])rectfill(124-max(1,h[1].tilestouched/O*26),3,124,5,59)fillp()if(l or z)fi(l and"stage clear!"or"❎ undo",l and 42or 50,f+5,7,1.3)
if(d==1)local f=sin(a[1].m_anim_factor>>2)*-32+-24local e=w("stage "..U,f,106,7,0)line(f-2,112,f+e,112,7)w(i.s_name,f,115,7,0)w(i.s_author,f,122,13,0)
end function eb()sspr(12,56,1,15,0,56)sspr(4,56,8,15,5,56)sspr(0,56,1,15,4,56)sspr(17,59,15,1,112,127)sspr(17,60,15,8,17,59)sspr(112,127,15,1,17,67)sspr(36,56,1,15,0,56)sspr(37,56,8,15,36,56)sspr(0,56,1,15,44,56)sspr(49,67,15,1,112,127)sspr(49,59,15,8,49,60)sspr(112,127,15,1,49,59)line(112,127,127,127,7)line(0,56,0,71,0)end function e9()local d,e,f,n,o=fj,0,0,false,false for e=0,10do f,n,o=21+e,d&1<<e>0,d&8<<e>0sset(f,98,n and 7or 12)sset(f,96,o and 7or 0)sset(f,92,n and 9or 4)sset(f,90,d&32<<e>0and 10or 9)sset(f,88,o and 10or 0)end for e=0,4do f,n,o=8+e,d&16<<e>0,d&64<<e>0sset(f,98,n and 7or 12)sset(f,96,o and 7or 0)sset(f,90,n and 10or 9)sset(f,88,o and 10or 0)end for a=0,7do f,n,o=103-a,95-a,88+a e=d&1<<a>0and 7or 12sset(f,101,e)sset(50,103-a,e)sset(78,96+a,e)e=d&1<<a>0and 9or 4sset(f,91,e)sset(52,n,e)sset(76,o,e)e=d&4<<a>0and 9or 10sset(f,93,e)sset(50,n,e)sset(78,o,e)end fj>><=1end function eh()local o=ff spr(224,80,104,6,2)local f,n=80for d=0,32,16do clip(f,104,16,16)for e=0,15do n=sin(o+e/8)+104sspr(d+e,112,1,16,f+e,n)sspr(f,104+e,16,1,f,n+e)end f+=16end local e=h[1]clip()palt(0,false)spr(208,24,104,3,1)palt()if(e.haskey)spr(144,32,104)spr(144,39,104,1,1,true)
for n=0,16,8do f=24+n clip(f,104,8,8)for e=0,7do sspr(e+n,104,1,8,f+sin(o+e/8)+e,104)end end clip()if(e.haskey)spr(145,32,104)spr(145,39,104,1,1,true)
local e,n,f=(btn(4)or e.sprint)and e.onconvey==false,e.blink<4or l f=215if(e)f=214
if(n or z)f=216
spr(f,l and 37or 36,104,1,1,l)f=251if(e)f=252
if(z)f=160
if(l)f=250
spr(f,40,104)for f=0,23do for e=0,7do sset(79-e,104+f,sget(24+f,104+e))end end end function eu()em={{1,13,5,12,13,12},{1,2,5,8,4,8},{1,4,5,9,4,9}}local f,n,o for e=1,3do o=0n,f=((e+k+2+o)%3<<1)+1,em[e]pal(f[3],f[n])pal(f[4],f[n+1])spr(155+e,96+(e<<3),8,1,2)end pal()K=false end function fG()poke(24405,0)camera(0,0)local f,e for n=0,34do f,e=(n<<3)%128,(n\16<<4)+8sspr(f,e,8,16,f,e,8,16,true)end camera(fc,fl)poke(24405,96)end function es()local d,e,o,f=h[1].coins for n=0,1do e,o=4,5if(d>n)e,o=9,4
f=17-n*3for n=0,8,8do line(72+n,f,76+n,f,e)line(72+n,f-1,75+n,f-1,e)f+=1e=o end end Y=false end function ea(e)local f={type=c(e,1,1),x=c(e,2,1),y=c(e,3,1),spr=c(e,4,1,1),anim=rnd(),spin=rnd()}f.poskey=f.x<<4|f.y if f.type==0then f.startx,f.starty,f.poskey,f.dir,f.anim,f.jiggle,f.sprint,f.pstate,f.ismove,f.oldx,f.oldy,f.startturnx,f.startturny,f.haskey,f.onconvey,f.inportal,f.blink,f.octogems,f.coins,f.nextdir,f.tilestouched,f.isdead,f.prevslimetrap,f.prevcrackedfloor=f.x,f.y,-1,3,1,0,false,0,false,f.x,f.y,f.x,f.y,false,false,false,10,0,0,-1,1,false,false,false f.onstep=ey f.ondraw=eg else if(f.type==5)f.oct_ind=f.spr f.spr=87
if(f.type==10)f.dst_x,f.dst_y=c(e,4,1),c(e,5,1)
function f:onstep()if(self.type<10)self.anim+=.02self.anim%=1self.spin+=.035self.spin%=1
end function f:ondraw()local f,e=(self.x<<4)+8,self.y<<4if self.type<9then if self.oct_ind==nil or self.oct_ind==h[1].octogems then local e,o,d,n=e+sin(self.anim)*2,self.spr%16<<3,self.spr\16<<3,ceil(sin(self.spin*.5)*-8)if(n<=3)rectfill(f+7,e+1,f+9,e+14,7)
sspr(o,d,8,16,f+9-n,e,n,16)sspr(o,d,8,16,f+8,e,n,16,true)end elseif self.type<10then spr(self.spr,f+4,e+sin(self.anim)*2,1,2)end end end return f end function ey(f)if(not x(6)or count(a)>0)return
f.blink-=1if(f.blink<=1)f.blink=30+flr(rnd(60))
X=btn(4)and f5==false f5=btn(4)f.jiggle=max(f.jiggle-.2,0)if(btnp(5)and not l)el()
f.anim=min(f.anim+((f.sprint or f.onconvey or f.inportal)and.2or.1111),1)if f.anim>=.65then local n={2,0,1,3}for e=0,3do if(btn(e))f.nextdir=n[e+1]
end end if f.anim+.001>=1and not l and not z then if(f.ismove)ep(f)
if(X)f.jiggle=1
f.sprint=false local e=f.nextdir if e~=-1or f.inportal then if(f.inportal)e=-1
local o,d,a,i=f.inportal,16,f.x+cos(e>>2),f.y+sin(e>>2)if(f.onconvey or x(2))d=18
local n=mget((a<<1)+2,(i<<1)+1)if(n==121and f.pstate==1or n==51and f.haskey or fget(n)&d>0)o=true
f.nextdir,f.dir=-1,e if o and not z then fq=true if(f.inportal)b=u.p_portal
if(b==nil and stat(49)==-1and not f.onconvey)b=u.p_move
if(not f.inportal and not f.onconvey)f.startturnx,f.startturny=f.x,f.y ei()k+=1k%=3K=true
f.anim,f.sprint,f.ismove=0,tonum(x(3))~tonum(btn(4))==1,true if(f.inportal==false)f.oldx,f.oldy=f.x,f.y
if(e>=0)f.x,f.y=a,i
end end end if l==false and f.tilestouched>=O then l=true b=u.p_win if(C<dget(i.s_saveslot))dset(i.s_saveslot,C)fA=true
end if(l)f.dir=3
if(fq and not l)C=min(C+(time()-fe),599.999)
end function ep(f)f.ismove=false local o,d,a,i,l=f.x,f.y,(f.oldx<<1)+2,(f.oldy<<1)+1,true if(f.prevcrackedfloor)F(96,18,a-1,i)O-=Q(a,i)f.tilestouched-=1b=u.pit_o f.prevcrackedfloor=false
local e,t,r,c,n=mget((o<<1)+2,(d<<1)+1),mget(a,i),o<<4|d if(e\16==12and f.pstate==2)e=123
if(e==52)P(19,20,3,4)b,n=u.t_switch,{7,8,14}
if(e==53)P(21,22,35,36)b,n=u.t_switch,{7,3,11}
if(e==54)P(23,24,67,68)b,n=u.t_switch,{7,13,12}
if e==55then f.coins+=1b,n=u.t_coin,{4,9,10}if(f.coins==3)f.coins,b=0,u.t_switch P(25,26,99,100)
Y=true end for o=0,2do if(e==80+o)f.pstate,b,n=o,u.p_state[o+1],fh[o+1]
end for n=0,7do if(e==56+n and f.octogems==n)f.octogems+=1b=u.octo[n+1]
end if(f.octogems==8)P(27,28,74,106)f.octogems=0
if e==18then if(f.haskey)l=false else f.haskey=true
end if(e==51)f.haskey=false
if(f.prevslimetrap)F(126,26,a-1,i)b=u.s_trap
f.prevslimetrap=e==48if(e==125or e==127)f.prevcrackedfloor=true b=u.pit_t
local a=-1for f=0,3do if(e==113+(f<<1))a=f
end if(e==123)a=f.dir
if(a~=-1)f.nextdir=a
f.onconvey=a~=-1for e,f in pairs(h)do if f.poskey==r then c=f if(l)deli(h,e)
break end end if f.inportal then f.inportal=false else for n=0,6,2do if(e==89+n)F(126,f.pstate<<1,(o<<1)+1,(d<<1)+1)f.oldx,f.oldy=o,d f.x,f.y=c.dst_x,c.dst_y f.inportal=true
end end if(e>208)fH(f)
if(e\16==11and f.pstate==0or e\16==12or e==50or e==29and k==0or e==30and k==1or e==31and k==2)fH(f,true)else f.tilestouched+=1F(126,f.pstate<<1,(o<<1)+1,(d<<1)+1)
if(n~=nil)fI((o<<4)+12,(d<<4)+12,n)
end function fH(f,e)z=true if(e)b=u.p_hurt f.isdead=true ew((f.x<<4)+12,(f.y<<4)+12,fh[f.pstate+1])
end function eg(f)if(f.isdead or f.inportal or not x(6))return
local a,e,n,o,d=f.dir,f.x<<4,f.y<<4,f.anim if(f.pstate==1)pal(3,8)pal(11,9)
if(f.pstate==2)pal(3,13)pal(11,6)
if(o<1)d=f.onconvey and o or.5+cos(o*.5*sgn(o-.5))*-.5e,n=p(f.oldx<<4,f.x<<4,d),p(f.oldy<<4,f.y<<4,d)
e+=(-1+rnd(3))*f.jiggle+8n+=(-1+rnd(3))*f.jiggle+8local o,d=cos(f.dir>>2)<0,sin(f.dir>>2)<0local a,i=o and e or e-8,d and n or n-8if(f.dir%2==0)spr(211,a,n+7,3,1,o)spr(211,a,n,3,1,o,true)else spr(217,e+1,i,1,3,false,d)spr(217,e+8,i,1,3,true,d)
pal()end function fO()cartdata(e6)if(dget(63)==0)dset(63,117)for f=0,59do dset(f,599.999)end dset(62,0x1.12)dset(61,0)dset(60,0)
end function x(f)return dget(63)&1<<f>0end function ev(f,n)local f,e=1<<f,dget(63)dset(63,n and e|f or e&~f)end function fz()return{stage=dget(62)<<4&15,world=dget(62)<<7&7}end function ee(f,e)dset(62,dget(62)&~.9922|f>>7|e>>4)end function f1(e)local f=0for e in all(s[e])do if(dget(e.s_saveslot)<599.995)f+=1
end return f end function fJ(f)return f1(f)>=count(s[f])end function fB()local f=count(s)return f1(f)>=J[f][1]end function fr(f,e)for f in all(s[f])do if(dget(f.s_saveslot)>(e and f.s_devtime or f.s_goaltime))return false
end return true end function fa()for f=1,count(s)do if(not fJ(f))return false
end return true end function H(f)for e=1,count(s)do if(not fr(e,f))return false
end return true end function e1()cls(0)map(0,0,-24*d,32,19,2)map(0,2,d*2%1*-24,48,19,3)map(0,5,d*3%1*-24,72,19,7)palt(1024)local f=sin(d)*4map(19,0,12,8+f,13,7)if(not x(6))map(19,8,28,8+f,4,5)
?"2025 cyansorcery",32,122,3
palt()pal(7,1)if(fa())spr(241,1,119)
if x(1)then if(H(false))?"⧗",113,122,7
if(H(true))?"♥",120,122,7
end pal()if(count(a)==0and q==nil)fi("press 🅾️ to start!",28,96,1,1.4)
end function fZ()local e=A*o local f=e*8cls(1)rectfill(0,56,127,72,12)map(0,12,-24*d,56-f,19,1)map(0,13,-24+24*d,64+f,19,1)local f=f*.5?"presented by",39,60-f,1
if(x(6))map(19,7,18,60+f,11,1)
palt()fillp(fu[flr(p(1,4,e))])rectfill(0,56,127,72,12)fillp()end function fk()if(A*o==1and btnp()&48>0)g(0)
end function fF()for f=-32+n,128,32do for e=-n,128,32do spr(204,f,e,4,4)end end if(V==nil)poke(24404,96)pal(fo[1])sspr(0,58,128,70,0,58)sspr(0,7,128,18,0,7)sspr(39,38,52,20,39,38)pal()poke(24404,0)palt(4096)map(48,0,0,0,16,16)local n={{"programming","bug fixes","general"},{"art, music","art, music","music"}}for f=1,2do for e=1,3do w(n[f][e],f*64-46,e*24+42,7,1)end end w("director",58,42,7,1)w("created by",44,1,7,1)w("a plural system",34,26,7,1)w("seven spirits, one body",18,32,7,1)else poke(24404,96)pal(fo[1])sspr(0,0,128,128,0,0)pal()poke(24404,0)palt(4096)map(32,8+V*2,0,32,16,2)local f={[[ you've overcome many
 challenges and are at
the end of your journey!

but many puzzles remain
unsolved. can you solve
      them all?]],[[you're very good! you've
overcome every challenge
 in your way, and have
 solved all the puzzles.

       good job!]],[[ wow, you're fast! not
only did you solve every
puzzle, but you've done
 it super quick as well.

    congratulations!]],[[ we have no more puzzles
for you. you're too good
  at the game! not many
   people can do this.

    you are amazing!]]}w(f[V],16,56,7,0)
end function fY()d+=.025d%=1if W>0then W-=1if(btnp()&48>0)W=0
if(W==0)g(0)
end end function f_()d+=.01d%=1if count(a)==0then local f=btn(6)if(f)poke(24368,1)
if(btnp(4)or f)b=u.m_confirm ez()
if(btnp(5))g(3)
end end function e0()B=mid(0,B+E,1)d+=.02d%=1local f=count(s)if B==1then if(btnp(0)and r>1)b=u.m_sel M=max(r-1,1)E=-.125
if(btnp(1)and r<count(s)and f1(r)>=J[r][1])b=u.m_sel M=min(r+1,f)E=-.125
end if(B==0)E=.125r=M M=nil
local f,e=count(s[r]),btn(6)if(e)poke(24368,1)
if(btnp(2))v-=1b=u.m_sel
if(btnp(3))v+=1b=u.m_sel
if(v<0)v=f
if(v>f)v=0
if btnp(5)or btnp(4)or e then if(v==0)g(0)b=u.m_back else g(2,r,v)music(-1,500)b=u.m_confirm
end end function e4()local o,f=e3,20+sin(B>>3)*29for f=1,4do pal(o[1][f],o[r][f])end rectfill(0,0,127,127,1)map(0,14,-24+24*d,-2-f,19,3)map(0,17,-24*d,115+f,19,2)map(32,-2+r*2,0,1-f,16,2)local f,e=122+f,J[r][1]if(r>1)?"⬅️previous area",1,f,7
local n=f1(r)?n>=e and(r<count(s)and"next area➡️"or"")or"▶solve "..e-n,84,f,7
local e=count(s[r])local d=max(min(v-5,e-9),-1)local n,a,c,i,l,f=13-d*10,d+10,x(1)for e=0,e do i,fK=e==v,n+10if e>d and e<a then f=n+3local d=s[r][max(1,e)]local a=dget(d.s_saveslot)if(i)fL(4,n,90,fK)
pal(7,i and 7or o[r][2])if e>0then?(e>9and""or" ")..e.." "..d.s_name,15,f,7
spr(a<=599.995and 241or 240,6,n+1)if c then if(a<=d.s_goaltime)?fE(a),96,f,7
if(a<=d.s_devtime)?"♥",120,f,7
end else?"back",27,f,7
pal(7,10)if(fJ(r))spr(241,6,n+1)
if c then if(fr(r,false))?"⧗",113,f,7
if(fr(r,true))?"♥",120,f,7
end end end n=fK end if B<1then palt()if(E<0)pal(1,o[M][1])
fillp(fu[flr(p(1,4,B))])if(E>0)rectfill(0,22,127,112,1)else rectfill(0,0,127,127,1)
fillp()end pal()end function ft(e,n,o,f)add(a,{m_x=e,m_y=n,m_w=o,m_h=count(f)*10+6,m_items=f,m_highlight=1,m_anim_incr=.25,m_anim_factor=0,m_step=function(f,n)local e=count(a)local n,o,d=n==e,btn(6),count(f.m_items)if(o)poke(24368,1)
if f.m_anim_factor==1then if(btnp(2))f.m_highlight-=1b=u.m_sel
if(btnp(3))f.m_highlight+=1b=u.m_sel
if(f.m_highlight<1)f.m_highlight=d
if(f.m_highlight>d)f.m_highlight=1
if(btnp(5)or btnp(4)or o)b=u.m_confirm f.m_items[f.m_highlight]:i_onclick()
end local o=true if(n and e>1and a[e-1].m_anim_factor>0)o=false
if(o)f.m_anim_factor=mid(0,f.m_anim_factor+(n and f.m_anim_incr or-.25),1)
if(f.m_anim_factor==0and f.m_anim_incr<0)deli(a)
end,m_draw=function(f,n)palt()local e=count(a)local n=n==e if(n and e>1and a[e-1].m_anim_factor>0)return false
local e,b,o=count(f.m_items),count(h)>0and 147or 241,p(5,f.m_h,f.m_anim_factor)local n,e,d=f.m_x,f.m_y-(o>>1)local o,a,c,l,r,t=n+f.m_w,e+o rectfill(n,e,o,a,1)rect(n+1,e+1,o-1,a-1,13)local u,e=n+8,e+6for s,i in pairs(f.m_items)do if e<a-9then c,l,r,t=n+3,e-3,o-3,e+7d=s==f.m_highlight if(d)fL(c,l,r,t)
pal(7,d and 7or 13)?i.i_label,u,e,7
if(i.i_setting~=nil)spr(b-(x(i.i_setting)and 0or 1),o-11,e-2)
end e+=10end pal()end})end function fy()for f in all(a)do f.m_anim_incr=-.25end end function f7()b=u.m_back a[count(a)].m_anim_incr=-.25end function m(f,e)return{i_label=f,i_onclick=e,i_setting=nil}end function f(f,e)local f=m(f,function(f)ev(f.i_setting,x(f.i_setting)==false)if(f.i_setting==5)music(x(5)and 0or-1,0,7)
end)f.i_setting=e return f end function et()X,f5,b=false,false,u.m_confirm local f if(not en and fB())f=1
if(not eo and fa())f=2
if(not e8 and H(false))f=3
if(not e5 and H(true))f=4
if(f~=nil)g(5,f)return
local e,n,o,f=m((l and"next"or"skip").." puzzle",function()g(2,L,U+1)end),m("restart puzzle",function()g(2,L,U,true)end),m("stage select",function()g(1)end)if(l)f={e,n,o}else f={m("back",f7),n,e,m((_==2and"hide"or"show").." hints",function()_=_==2and 1or 2fy()end),o,m("options",fM),m("go to title",function()g(0)end)}
ft(16,64,96,f)end function ez()ft(24,96,80,{m("start game",function()g(1)end),m("continue",function()local f=fz()g(2,f.world,f.stage)end),m("options",fM),m("credits",function()g(4)end),m("back",f7)})end function fM()ft(16,count(h)>0and 64or 82,96,{m("back",f7),f("show timers",1),f("slime overlap",2),f("sprint by default",3),f("sound effects",4),f("music",5),f("lesbians allowed",6),m("pico8 menu",ek)})end function ek()extcmd"pause"end function fL(f,e,n,o)rectfill(f,e,n,o,2)fillp(f9[ceil(S)])rect(f,e,n,o,154)fillp(0)end function f0(e,n,o,d,a,f)add(Z,{x=e,y=n,spd=o,dir=d,col=a,time_max=f,time=f})end function ew(a,i,d)local f,e,n for o=0,.9,.1do f,e,n=a+cos(o)*4,i+sin(o)*4,o*360f0(f,e,.9,n,rnd(d),12)f0(f,e,1.8,n,rnd(d),8)end end function ej(o,d,e,n)for f=0,.8,.2do f0(p(o,e,f),p(d,n,f),0,0,14,p(5,12,f))end fI(e,n,{14,7})end function fI(e,n,o)for f=0,.9,.1do f0(e+cos(f)*4,n+sin(f)*4,.8,f*360,rnd(o),8)end end function e7()for f in all(Z)do local e=f.dir/360f.x+=f.spd*cos(e)f.y+=f.spd*sin(e)f.time-=1if(f.time<=0)del(Z,f)
end end function ex()for f in all(Z)do pal(7,f.col)spr(flr(p(163,161,f.time/f.time_max)+.5),f.x,f.y)end pal()end
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
0707480b11c91efffcd227270f1f701efff854219f580901070838fffb506cf24341c004ffffff0d48fffffffff110007692ffffff0ffffff0df7040fc93a8c2
577aff73113994666bc466233999ca399856bc4c2b56269d231bf95930293e2d7af44ef85c33dfb82fff70c1c3a4c7e97c1f71514871c817171f48190715e16f
8024ef1ef4e9444e0e4e5a44e29acd2f19324261e2ac3cf10640c2c0c541c7c2cbcb983110a11715e23cf71e4ef711ef741152ef4f80f583053016c1c8b342c2
c112cf002c111328fc6cdcf7c90a6f748392ff485874c521c5f4afd2fd7abc7f53b3f852e9877fcbf6e86bbf677b772e9ce78c3f3cf0f3cf19f36ef8427ecf06
fb4e78722b8be70707cc9f4eabe9c77f137a6febf6f486fe3972f96fe39724dd2ee727d35317d393e8ff917c2ad2652ef8695b44a582fc136f590d2fb82fffb4
4d31f1844a90989d5187617c51e8c19836312f6e07f1922ff3b99994f90510698323fb8e817be66e843f0ff31ea802c923e8074ae39f1c13d9df142178cfbcf4
9c08f13c199b4f2fe79a74f84c8f4ef77111acf3eab2170f15e0e84c7c235ef72c990102679e317c52f8e5c1e8d134ed448f4ff5e7a80068b293e883ea070fbd
1b07c8780d4c4ff7690488ecf0995e88ec399832a3fe8786f2c2c1fc2f302618eff48b6168cdda84af4ee4552e9cd9a80f8bf8dd9d5ee856fb01981fcfb2ff07
08163a481273cc11680811684d1a168cc4868ff917cacc119342c45a9342c43278489a43784899d19effb8b2a74832c7c13a71748f830a717c4a79bff72e9f94
e9cc52f4ae2972c56f46e2b2ceff2e9f7dd7817d5e8b4e2fc56ff337d31e90f44f19fc3f342f2e942f4ecd39b3f4e6866070830c10e0070830c1a161b05d367c
37573fcfc0e0780f4867872c31e90d2c3148a1f429b822e89cc842d5043c3636e10e09f5043c31e907186801e8c454e5746a94a1d0bd5c1e956ae01ab1b02c25
2c60c60c60c280b123cf9e02f9c2c670f9cf81e09070830c10ac5108f237c2371362fe2c8c6787670d594a212121e9052490909052cfd4cd5ee5938f12c323a1
e807136c8d012c8ff5d07c447ae3b50b1f40161c0685016140121a148f9942e91e89934ec921b190f056c821a480d0f0fb355e03c1337c4d763b3e0093043c28
052348c01234844e00de6c319303c1337c237125f964b42c548381681681681f9cf364881e2db4f282e45a701ac604b012348c0123c3c12218f273a2bdf4279d
5c1b1fcc4780916824b0d247804213288e3d321952db8b8bcea8c11e90f4872c31e90f487642c47c22f44e1df98fff75ebbc579d32fff3bac5105ea08275049b
81371e8c3972ddcf08f20e0e00f493ebf36c3f7c83ef81fcf1a90d07926429f2c3781b381cf083e179ef1f50171d34b6297012a5d274a6a5aa3b32c1980d869e
3a1f5eb8214ba071f7c2e10e1340ef00a24e1e18c3c1a529894954390ce151d4c3d9681ac19065f84436c35c61398c543672846eac6f8c5216594c1e976f3c19
c8d3178452bc7c1c521966ef70cf048902c142680842215c858dc27e619427e2394cd42677852ea42752a165946869d29d715042bf587dacff24ef0ed6e57552
1eb4cf0c12ff3099cdcf3a868f78724e1f78f583643142a1140eeff103dff58cf0933817c31a3b381590e1f78f5850cff94ef71a748f8583e0c4bcc13e809452
2c33ce79f1c74e027bf8069f1c793be0e9afc2a77e090f0b683e8527c12d9d8620fbcffb839fdc17831c3f40c73c31e9050bc1eac282529415a4268a2242b2a6
5972c3c59978b4e2e1b27011276804fc294c4eb3e1b9078ca50f4ebc5c56ff7bcb6c748f184ebf5e268034ece14e9bbf30fe15134d9719937fc18c2cf08c2fb4
2fdf29521e805f42c11611cd1e790fb48f56ef8f54ef89888c1ea116c622170eb4b981e769f78f78f966f78740e84029848354080f444080148f14ef2ef0e7a8
874061c242190fd0242009142210043cf21e79071f3988816309584858a40348019061240c11e702cf00e29fb28985184858d032120a284808f32cb49790f370
31b3001121610f45858ba2c2cf01e3e1e36cdc3c1884f10c2190b01698005862204586874071f702cf21ac519e32094486221401e00544e0030f848f93cf212c
519e720840a9848d05202d0a404805913e7321e791e3964c308586848328005845440824016256cf5490f30f5862f7c3884394280b08010144012020ef0e73e7
0ef19f78ac2810708c24918c249f34ff2ef0ef1ef361404a64984b6490bccf048f180f301e7044ef12272620f41c4097a0659b9ff8b9fb2fcf1fb4ae73e4e0e4
2a701690cdbf5e48ff983ef71e0e86872c3c544ef0972ce06cfffb07d1b5e7930ef830091bc1ea0b0524a0fff73c77c6ed3637d19159d2cfe1efffa46a223539
188a9c78190718f1068ffff196e951c257441870c5cd1efffc0f31126dccff042cfff515c148a1635abb2e72e0070ffff30c14908e1bad4ea4774250fff7c241
c10e06170e94f79147c0cfff1ac2f4e004250c3e01a97cf0c828fff7296e94d39afe96f82bc1944e907016cfff190324905e1fdfff1d050708383aca72701641
cfff117c13e836c1748cce0cbc710fff7b2eb72c31acf20efff8bbf2ef17d514ecd48095639d6248c7112d424a9484390f7c32f3bc5c361e0bb80783e2e2e70e
f90f48ff9e0f075846244e0c012c7306c8e0748ff72f03050010f25ed03ef0e6acff801a48719f320c1c3cb4903648f18b8382ff62e3e719f22f0f273b02cdcf
01480ff62e1e78c7e58c22fb174842eff048f131f737781f30f70a0f30f7410f38fe9c5743f93df1f92f3c329cd7a4ef870c1c12768283839f79b8742c1c5c7e
db8b8f18f72c31ef7a3c3c51e1e3e1ef0e72ef7dc3cf0cfff3e05ef042eff248fff78c8f79b8b2cf2c5c30ef7a98f181ff1f090ff306cf81ef6ee03e70ef041e
70ef041e70fc33fbcf25f17f319b8f38ffff795effff30cf05df52cff0c71c2d5ce80ffff06ba28b729fdbbc8eef8032dd8ffd731ab1778fd94254610fff730c
4210f54ff719e1e997083699ffd34612c82ff719f78fffff2c98ad57ced3fcfeee77eb7ff09c757687241cffdba25eaee8cac5d7e892f85321e89bd2eb0ff375
1d83079a85417990171ed93486d146e01ef7e05e8b10e60c1fb0fd41c4d8ffdbcf10ef0e7be3f4476209ffff04c1f301e7983e72e8991098fff340eff23f4252
a5e15ef7e07cf10ef083e727cf03370ffffe8fb6e0dc1e0bb87f833766d95e9529f8f78f368f325fbc0ff4f90ff4cf2ce09ff461e00fff1e7a9a673a808f3e89
b2ef8c5e49666c06f302cf080f308f15e79529f5291939840c11e62cf042cd4a2bd1781e09f926ff70e2302272b583952e5610fd40ab08ffb1305ab1794be0e2
96c079474f59b4ef78493834e79c2fb469f72cdc3cfff817307504ffffff0de5109842eefffff100000000206222222222000222222222200802000008ac8f79
a5ce9809f34a18c311cff12332cfb1648b215bfb838fb930fb5300047fcfc000000fd900efbf1e0c130e7cf1000e7718c3f0280cfff73e7a4af71ea090b07583
8f5010f172718b832cf00072f30340cf0cf0061ea0f3180107070832c1c5c50e105e3e2e1e2ef5e2243cf2cf2cf4cff3818072879f878f7848083803e4e80ff2
3e4acf0c9c1c0c50a400e22c51e4ac8150778fb040c14838b8ff90813a1e3242cff32c1c7cf3cffb24858f52c348f138073fb5848130890cfff73e7a5cf78734
1c5c8780f317077858b058360c80f5120eb032c342c310360e2648780707100e0e024687b07016c87002c93c1582d0f0f0f758fd2c14b08b973424838760cb04
8b24877808f1a0778170f07f0ff41e5001ac805eb1e70c0fb58c01a40cf2c0c8f511e360e908f81ff584839401e1ac0c9401e0e0e70a1a46838392248030f2f6
014832c3348b0478b687812c9c380300cf0cfff73e7ac240808424902279c394e7a42836425102280b03232160070011808d19421010968528002c6449888321
900b48880b8446780c8809161229a4230b8402934420c62880396329c22e90986288409c8842e0290c52448c6074240162688c4c2044211344032d88c1121098
00a22804c2296212900423119b07029350844429294246018423e401440d206c24000d0e140b07429ac032a242404608002b70407809016064e129006830c7b4
422208402806190085039844680900232f048988c5327083ea4294c42001a9442c1298e29430888481701a4e0099078011294a7421972042a1649768c2988884
4021406982838011c52611842460a01cfff73e7aeeade084444e160938c21198cb01d888c227c3211024024f00626c729742902a21698e22197e884244810864
852919422464619f34c0e04422962479023a7424e0eb1201514294522b07c1948c4009441090a0198c2cf0161c2111b440c6293e042e8888a489462114609852
111462211784409844e860101c11843267088409448d48320944a0ea0940e04242889020409032e804409401b0a84629880680e809461420e900f08cea429889
850944427802244884694c4251229c80904446c64c5290421b0888940208011649010f40f10c4401198042343287800b448440b0a21b061429142124918621d4
22901018880140348009840d480d3211942e8421088060c00200a01cfff73e7ad4c002124878046988c54420a742944295212228d22229028629444504298090
019292944a850b44098c42d6029480907d222090288884294a190ed622048840149841880193fe0098094288b0984a2121b097212a44ea5842221976299821f4
42292104629b2900348d4c9d400c294119d409f1a0098162228362194e2c3210142807442329219a06212a88986223110d848626f540946907940e39e128729c
294fb8809e24719b219944907444c1298b34284219721228840b0e02154242c1988722742212b424a94e90124398098842a4231c4c0a20021a1464031942d021
429c3212612211b426112743115242c483224a22422e521294430d4804c142429c422128a420ab46ffffff0ff7aef42104836579cdaefbe12137963557d19aa6
e1f8bcc5f5aaa0978c33db652d6a97c893eb559abecdbe657df09f3cf2aeaf72dbf8d1e97df0ef0976662fccc4e9999c6646914de236c0cea094c80b0910b013
6c66c8dc24562ff386ef83f7159c137817e1db56e2f784a179a5a1f8a4ed9bd836f8c2d87c16137817c1d9cc5e09cf3179f7c2f4c5e19c71f8f427caf461d624
eaafbedf3e793d67edfbcebf12e973979f673e21e2076e2fd4ee93c15675f6c4e9581f62dc6d8c28b6f162e103f5c787eec3d277887fcf7e79dbf7cf297e2e2b
e3ff83a9f7af0f3070b0e70c1fdf3fcd8b80ff832e708f16e783e6e19cf28f388215109ef0884e6c9483d2e60fecf13c9c3297edf5c9f8369c1b32fc3def0bb8
fce9075f793e87c93f9361ef89d480f927ef2955cd9a91b0c1260ba44ae1a3f7ccf33ff08f502f7c232eafa17df1c917e37c6d5e09b337162c36ebb767fa6ff4
606cf270cbbbfed9b74cb26fa0f140336e78b29a0bd36cf300070c5bb6bdebf66bdcf1bc3e07c675757579f7e8c7195db9bfb8f1ce3b9101637a8fe98a1f04ea
f52ef84cf0e0e79b663842e13e60080ba42c3376aeed5e998f126e42983e9db7d7ecfc5edcf0aef84cd7e57fa3d1ff8523e8c32ef840ef84ad53bc434d29f785
e11b40ef84e9ea69dbd042985e11940ec4475d83ff933bb27c1f6eb3a93e8e572f07ad9f9cb993e8f840c5e8f523ff03e22c54c523f46e9bff8876e12558c94c
1cde22ef95cab06d6881721e32e293c23b7ea93ff8bfdd5dafc3eac1b4c7313fdbc1c9ec812e16cd7807d2f42bf5ed8d1b422c69f74c1c1c50e2b8f56ef103c4
8f1e2ffc29427c7ae8f87cf33fc3e97e84b787adbe7842267cf3c3fb47b35480f30ce34e05112bd1707357eb922e522b454e3f8389e25e1321eb344e70fceef3
22b87db36ce57d19b4cb6dc5c36fbcf31b90f1626f42211031e487abeecb324ce0f83a74c961738c2ffc14a03b636f388581c9b34bbb6ef06c1ee875d1fd51ea
4e9f569b81f21ef024031ccf27031bcf0246fef0c5f7cb7c6fd211974493cad8c46fe304c23cb3f104ca5742f783c44ef86ecd1b5ebdc8f7cb9cf06e51ef240f
c1ebb791e0f006e71f4ec6eb3fe4ef8b30bb2051e12fd569f50dd7312e70c1973e3bf21f34c97a7674e8e1e2bcf17ee2e70b7e8f2ef1e610bdf38c32e40638c5
75620d480108d012b709fec524a9800b14e4990c276cbbb3fe7fbc1d4d5dc5fc5bb605e18628fe8fa7a1cc511f1cf148f50af70cc2a6037c32e00721bf524f48
f433373374440c548f50e906437f717e5ecd993b9c7db6dd174ce9bf47df3213296664e01f2429c216f99578e6fb48c1260ebdef8358c65c1b564c2e207c60bf
58420bc517abafc99c71faf2fc3f3cf2fcf0f1f8beeeb7e585d7487d29f3c59c96b381ff876bf3a5936aacbee6ef1b836b11a69d3ec88972bd69f3c5d4d6723e
4bee7199c6ef0667c517d7edf36fc7a7f17c7677ca7d7fe7487891752fbcd9b56cdf27acea487c8b59f784e89b0e9f073132cf3066429c798f10a020f0160e23
e278cf19bd9f9f3667c1f853fcc877e83fa7e8f1e93ef97ce6f9130917a3663f3c56ffff0e98f3e8f76fb8dfffb6b725fffffb11effff732cfffff648fffffd8
0fffffb11effff732cfffff648fffffd80fffffb11effff732cfffff648fffffd8039b26ffffff0ff7aef49045812367dabcfee11317962317d1dca2ea721317
d598987ebc3e8627ec2397e3f99c3333976662fccc4e9999c3333976662fccc4e999981360d1203c0681c03813233679dfff79fe577f57780c4c316b3f85c1c1
e79b3bcf01b8de788b6f38d617d26b4c58c217da6972031bdab4ea8bc56b73eadc2d439116e3bd9ef8c1e0df2d2000077eddd22f2e9ef24f794c906903481bc7
71a1d4430c5ea6d14a16e81df1212388f521feef8f72bbe70de4fa93278f2f100c3177f85e93a44a7cf376444c9371831c337ecb2c2e9c4014e95ce0a96e0746
9d22dc226fccf05fa86ece3707ca7d5962b42fc315be11bc8920772ebcc54c794f78036d6326fb97e6df3d178932782f442195f783c3fe81f5e78576c352117d
62ce48cc996e9b2ef9be836fe6bb7bd575cf3add3bdabde86cf3fc17cedd6dd6fc31f3fa2fc6319fadd39de9eebc1b3ef97f0bed731e6e6e28e727b7e32e7028
100040a101517319db1f308b0484e840e9c92ef022ff88b80731e4ab60a9af5cf5f8fed32f7c52def2ffc3f3cf3e87db7cc1fc5f43670c5cf1647e66cd617087
80791f23b3ef9132e8f14cb637110b217abcd4f983e71c9231c9fdf3bc54e626bf366127d57e5e8c5ab738fcaf6c04e078dee7726f3811b93d2ebccd4e42f44c
68db64c6e700f1caf789071662fb88f100200fad398f3b9f5c39cf2bd9fc1bfab6719f548938ac398797815e2050fe46e2099f3803cc00ec011224026199d490
__map__
3f4c09d7983f16478e6f11c77eb839e45ff91ffdf24fb627b91c6de2ea0f69af58ff60f9852b67da2bae1e69ff88abffa4157ff466afee3b7ef0ff2778e417cfc5bf72f225feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ff
ffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2004964fffffff07fea4f104238cd6597efba5031973655d791aaba9e5c86ebcbe955d79baabaeefce00f75fd92aabafe49cf6f87e717bff8479e99c93333796626cfcce499993c339363660ba85dc600c6d8b88cb1d965a142c8ff78d71f2f97fea10cc2
307e99477e50bf58982861469858fc33ff68943908c3f861fe91a83f2c4c943023cc1fce489f5639edfde3e4f5fc735fceb8c0c1e59f70c625454461d00370f9673c51ffc02ff008475cfe103fc4957f363fc4e507f30b11621f3970f30beff1c78efcf1e4380ee79b7faee78febf8ec785e7e58de43f7f517398f91eb0c324e
1cb9a74ee34d7cbbae2687f2595dbb9e26ffa83c6ff20f9f5f2affb48e73d55dff547e49e1fe2147ffb8fa5e897d795dfbe3f48b8352feb0f345e038ddf9c10e2749c42e0363e083e7f827f9c43fc4fe114ab8899d3fe007b80ef25cec9044ec9f8c7f9825b820f7fc80a7cf735df3a46dc6c7e69f1dc738793cbfe0a062f6cf
3ea9ac49643f787c38f047240f3f60f18bf2cb5c8904474e891193ecf1be9cb95cd7f97d349451b9ebf4995fde8dd83eb227af675f74f9c1920c95579644de408ef8de9cfe91cf459e47ea140401dd91e420fe104982e4c00f24d9f19e4becf28ba44b6e3b7243be3efef071e24b5cdb157c26765c39f6811b12407c6028c8f1
0f7e813c921fc43ff0fcf398a4df363f645edbb28c39cee7ecc1c16387287bcd210b14f698fc22020b36635321c8c73c72fc81187f24fe807d621f6cb99a01e09a1d7ddd3c47727ecb735cf394477240d997ec9f2c5f3d7ac891a72f9e68f38378548f593bdb234e0948fe50ceb872953bae34fc43722a480ee589e4f40f579f
6baee36a5d8e5ebffc73ccc3299e607ffc816f7ec87ce28f79605f6c5c701c7f7cdb9c7303c4fe90e1088e2bd79bbc4ac2e00741f047727b5d7335f12ccf9dc47bf885f003c7846e3f6472a99c062e8e09013de097c17861e72f38c1037620af27af62e7e6bcb54f9a5f3c4b2481900907ec8730bf383c579e5fea12e2807d1c
b9f2b82ef77cb05fe2c83f67e1b85cf34112978a63721c965c22811fae5c009705d4f9380260dea7f0c7e51189f05cfce38f7f739d8fcb95e48fa8edbcf9001e5e7b2ffc01fe011f18082cc3035b70c33fc9711dfb61e7fed83f8be7877c3b3f5f9ee3dab5e8f35c233ec7f1ec3992c393ce916693f09cf6c3f1aab7c88ef58f
fbe4a6fcc13ff69aed0ea71df9835fe4a6e480bdc167f39a14436b72c87dc44e983fe68f479281f33377f461f68b70d9917f4cc738f4c8e2c9bb378f9d7d4d5f4e971f96f8ec87ebb1133bf3489215baebc261fc02fb017e502a2bfcb2e30acfdcb09b61ff30c89ee09315833ffef8f479f3ccb1ca71783e7bef8b7fecf20fe4
8744c041f8077c903f8eec0ff805b620e01f8b0b7aec1c8be73fe7edfd4764abcb8e833de070fd63fff2ffc7f2f9ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11067662fffffff07fea4f60432157ad8f9cbe29599eaeda3cc7
6412b3c48e3cb63cd7aacd73794c9e99c93333796626cfcce499993c33936766f2cc4c9e99c96632b1cbd8610cdb2cc4feffdd8f9ff3799d79338e65c12569805b118db8a48d39d03812c7931f7b481c69625d1a5c9206b89df81c39e372581287581c891e39aeef5e9cfa5e7dba8b97cb020388852907ac1fc0aeb089267964
8fa593245b42982518406cc89b1cc303c666d243728c731d67bd124a2807b801660f5c53d855009b0776b4d6d5724cb26c0246c0206fe200c7811df83349e5dcb36deb9a5ccf7a1c8d63cb5712e361a6d85c33cc1808b86097d9a1d634796adb648b1f083f306ec8b3a40a983e39c46cdf1cd791c47f871f8ea73fe4f1875d5a
d378cff8c1e2076b6e87349c95942ccd893c915424c20fbee48f2d777c398ee4801f3c4b2d0eb237bf1ce48f7cfcd0e77c13973c4c7f50c739dbd877d13de6781c9b1eeea833cbde468223cb4d9c46208937bfe87ec120996bcfb3a25df066f983a831c815cb411c2e2e0234f3435c2e71043ec9b72f47bf73813fe60f47faec
1f0f9f2d1e62474288dca2c42a133b1a6b633f2413b913883dcb1a7f2c7e71c4b94cec0f71fdb063c732b17fc4f5cfb6eff967b8aef589ea2f3d93f3f0cbf56d2147faccf31e7f381cd72f21f0f8e78fedd6edd58459d496901fe2976eba25c813d9eab0bd7ac43f9b5fba2d82f8e23dffb0de47afe758d709ae38feffaceb4b
fdffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf1106f364fffffff07fea4f14023876e5a9fbdc2622ae75a9ba8e3c2ecde3f198ebcb
a9aa674a9eeabb9256ef95b4fac3fe20adfeb2b751fd2513d3e368a38e7fdafbe0f030973c33936766b29905c7cc668c8d03c60e9648262c13b619b621f18427c432c426ff7d3fec3eeafe83b8f68f2d71adb67fe21a5be2d81f1602939026b65d9b38d4465c9b2d71ad3671adb6c6b1c3426012d2c4b663d0e7cae17a8ee3f8
e59f3fec977ffee0e1253c04841f081fe10f101067fe79c5c4f147ba800f140304644208219c24090bcc99fc2396d8b5e507bfec1fff1cb9ae4a72da2f39b8edb8ff918ac825c71fe617bb3894180bf148242162830c928844442247f8237cf307b8592298c326821fe49773ff5c4b8f38da67f17efde31fba269ecc058b647e
61ee230fc7b1c4e2c3716511f2a6d02d716442fc10362f430eaa999bf9431cde1f3ef27d72451c39729d89ce3ff3cdb7fcb02339c2c575e5390e1f6f434693c4985cbe278e0071877bb9228f1d9f1c24541c49ded9e4f23db6381232d82f278fb7c7bea412992d1a4d882dc9b30cd9940d1379aee338126f677de4795cf1cbd1
fde0e86507887d0262b74cec8307897090447889112e62379603b10cb15b6c628483d8013f80d311af588597b8ffe087eb699f1fcae1726c3d02ebfdc89166723c3e95897b2e9244a4891c10fe188324603e891c9048bc739204fb032e0b821fdeecfabee3c8f11c0edb3fbc3f1ccff383a34d34401c492479b31c5c68134917
e4699e25f2ee3dc2ebe8957832219e847996c843dfc43cccc41feee70f761ef28d68fec9b738affc22412c9ec51f991fc8aec4394f1ed7f3ec8c63d150d7c5729163897f264ff4950995d9f134cfe389f3f9c192e7c9be507f84fa619268e297c9135774f14fa87f2e590e92253279e29f673d2e3f9237477e28d9f1be6d4e5d
7ee8e6fde19127125ddc891fb25dcc0fe287b0b8234bdeb0e40803e298844a184448f20564bd9fbc3b767e399638ae5faa8973fe19b1f808f867f97ec90a1f0684c083c180e510e75c41e035aec419045e21f008829ffc739efeb9975f721c4fa3f791739ef9f883cd38f90173937f9c9763803fc02ff3cffcc2c41b858dd9e9
9739c171e0d80fbfe4ed0f5b6cf9e3390f9ce0b4f778ec07783919ecf18745f8835ae1e1b047088745b8607f00d83f5fecfb0c0ef0c2e2b025fc413889dd89fd81e7073f9c5eef0fc70fd7f23d3e67765f7f3c7b7eb17fbc1c870b5cb69c1c8c8121818e6bf1310e328311720066bf64fcc0f805fc4228a4efc2f1c7fdf4398e
e3c8234d72dbf9bd9cc90fa7dca272cbf18be5b03b37c090984c904f1222d611a924994c1072cc1f6177c209fb6349442ef14825e4def7e63c8e1c0fa74a3e9e1cfdf6cf3a8e54f6d80181b0239bb5bc944a8207c28e1c87350c19fb052bf2831d69b3157f04efa6799a8cf9693927cfe29f5f72fc92e8f22df921a82c894397
92e862e6ce93f34b6e797eb1e34e74f98378c742f22ccfbb54929a45f3f867e91f9283788eeb4eceedfe83fd029bf2d90f891dc245b8902489f00fe1020f08ccc51ef8e172ce3f8c93d82fc52673f187bc8fc7d742f59fdced1f5fae744ddb3cf34cf881877ff887876bbe0917e1e09963c2c3c161fde13afc40d9e5e1e0a298
4c3838791cdf3fbf3c2818378767fb63dfe9b0fd335f9e244f3acf9cff1bd72587fc4f5cff1793eb7af287ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf1106a063fffffff07fea4f80642175a39dbcef1ec9c4d5c4c475e471a9eb4bbf6307739c7bd575e787e78f1d9e
3ffce007796626cfcce499993c33936766f2cc4c9e99c93333796626c7ccc0301863b36b8ccd183b8cfcffa3f7fce13d4e377f38f64b16e631993c8b78f2e412bfe4c82424bb1a118f98e4cac4ead8b2308fcae459c4992b93dc7179256f1c4e09c99e465651ead90f6ff783fdd03fccc3f8e348cecbf9c40f39f34b7ec8515b
1d71c82413268c1dc93912bf0888cd26b97274b97ed13fccb627ccf34be387caf147e2ca7c8eed0fc79c8ec70fc79378b2c4ba239afcb09cc41247963f1c82482289e38d2bbfe5b339fd71d9711cb91ee2f86339fe487226be799fe4bbbcd70fd7716c5b0fbafa2104714c131267e695207e780683d893dd4fb1432d472dfeb0
f823c7b21f9e1d5ed2fe81f607f43cf64bb7f923ba43691bec48c831d2c28efc4116a77890f37388acfef861a7c7d35d33ea7a9f7f8e7b712cfff40fbb47ff69ea89fc93d33aee5f92fc90e6871cd64cef34dec81f29e3fed688fc91d831eebb69236762efa6d2584412bbc2ff236992e73a73f5ea73a5e78ef3dc7dbdfe58e6
7b2514af24597d72c6e331bb24d43ff3cf2c511db221a1208791fc20c72d7e48587e10f7540f3ff01c3f3cc7c3d9fb9ff53b3fb63fc20f077cb071ecfd837d2e1ec23b231cc45ef861bb61b0c0716023811fb63bb8997dc6b7dd66917cff9cfd5cbf70fbb6ba8eef3a98f34cc5e986fc22c72f7fbc3aeffc009541dc904347e6
9df9f04b3c892aaf3cffa82349c4e08f4bb4ae07271c79f6bcb99ef3cc11f9e5399f274f3d0887002e274ee2825f6e9c3880097333214c0837e4e050d40936a1b03fce0b7c84ecfc615b92bbebb52d4f1712b10bfe0161fc32301fe685fd0027b84160bf6090a47081811bfc901a06cc2f2038d6c4f78ff63abf25895d59aece
f74ffee03ad237bbe08ff920f927cec97ce09b139ccbbd4713bf242c4d5271cf97f9985f927c22cb24779347368ff3f575d7f9bcce3eff38f3f674eca4b05f820ff60425f68770c2068c13f640087f10eb0c870036ec6510c24df8010027c6f0ed7af2b9a6f926df9ee7bd5f9f7dd76ddf3fecc6fec13ee10758cd0a8733f20b
77d8a03058b1409ca43c610f9ce01f50f0c26eec3cd81f43e0b4eb87c3f1cf6d7fe4b46f5d9cb5c3f5affdff237ec9edffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c200e084ff7fe3cfefffff
__gff__
23edeef0000406080a8e8d21757d5d5b597b898b91212426282a924d557781716979953365e7e8ea40424446484a4c4e5052545658466f6b85376d0360626466686a6c6e70727476783081828486888a8c8e90929496984461e1e2e4a0a2a4a6a8aaacaeb0b2b4b6b82a111222c2c4c6c8ccced0d2d4d6d838313262dddade5a
9a7afeba227301191a0c0e0205092d7f393a42832d2e0a11291315171d1e5c5ef2f4f6181b1d3f873d3e247d7ef8fafc14169c9e3436bcbec0c3c53d3551a1a3a53bfd2749922449922473f478ae3e3f7ce77bfff0c72ff9e7a7bf7e5bfefbe11f3ffed83f7ffdf7e72b7f7f7efbebf7ffc11f3ffd1ffe17ff8ffc4ffe2ffffd
__sfx__
ffdbffff3f7753ef770df773ff473f7343ff7729f771fd673ff723f77736f771f3110ea612ff771ff671fe771f8770fd771be7638f5619f773ff673ff1439b673ff161fb7730f7717e773ff173ff713ef7717f67
ff86ffff3bf770fe773ff173ff733ef771ff773f3673e3433ef773d7730ff773af363f71438c2739a773fb773ff77078670f8773bf773ff003f4553ff301f37738f773fb103ff773f8473ff7704e773f77538f77
fff4fff03f9473ff7708e363ff77270171d6140ef773ff7230f673ff7705f773f7703cb073f8433f7430f0123f877389362ff67389673f77704f773f7343cf773f9343ff7707161112450ff173fd070bf7726e77
ffdfffff3f04712c053ff771fb473ff770ee6711f673ff7707f773ff30244463e9663ff770fa673f77709f773f7373cf773ff441be240bf173ff7729c733ec773ff73321770bf273ff772dc773ff7732f773f703
0fddf5bf1fe473f75135d673f7770df773ff753cf773fb143fb263ff673fc460fe673ff771ce733f7303ff773fe173eb173df773fd743ff7717b672f9713ff773fa471ff273f9273fc553fb67391222177721c35
a8244992284733c7373cf773bf773ff7739f773fb023ff771f854099762bb473ff771ee773ff7139f773ff5007f272ff443ef773fa463ff770fa7423d773ff7134f773f75429f7039f773fb323ff773f9573ff77
cffcff972444412c573ff7729e773ff723af773ff5217f0639d773f7732bd773ff7335f773f7553f7770e37021b053ff772fb573ff772fe773f7703bd6732f773f7023fe670ff773f7772cf773ff543ed671fe67
fbffffb73f77732f773f7363ff771fa373ff772b573399363dc2024f573fe671fb773ff7722f723c7723e22209c010bd101df770be773ff7238f753cb051fe773f77325f723fb773fe7727f163af0532e773f776
ff3ff8ff2fb453ff7707f673ff771c9512df7712a343df673f77718f773f731347773ff773f7313f4713ff7725b603f8773ff732ef773ff763ef5729f772fa633f7613ff771fe373ff773bd773f906388673af54
ff8bffff3fb733ff773ff573ff7700322099112444412e160f6750ef773f7713cf773fb143f77730f773ff3037f7731f373f6173e7753e7613f3433e9553f77538a773ff043cf71369671fb772fd773ff7138f77
b7b9bfc61fb473fb4725f743ff771fb573fd671f97739f773fb213ff343fb461fe773fa073ff770fe771b6713af3127777329553fb730ef761ab010ff773ff730044104e7717e770bf373ff77291000903032e03
c12426280bf34037701af550c0400d07034a433ee6330a240cb740db042af563d30102410018330fb651d302048662d3230b42307033336331ef750452406963079762f7111543119c5323422274421403118051
892b2c432ac44185451a5551c5651e575285462a5562c5662e5763050732517345273653700e0002e1004e2006e301e4611f8142e4622f8441050512106211163c5673a557308600da500b204385471b06133840
fbffc0ff1201322014314043e5770ee70384433a4533c4633e47311044091540b1640d1740f5021ba223f96207f16227531f5333f0613bf16176713cb070f7743fb67357513bf76077733fd1617d753f6733ff67
c9ffef7f21f7323f671f9673f87727c7717e770df7727b473bc7723c673fb671fa773bf731cc473fa672fa663fb173fe073cc772fe77197743ff333ff653f74239f733cf7612f770d914228173fe473fa243ff06
57feffc028f713ff163fb663fd470ff77337773af153ef723ff553ff7439f773df753e7772c7773bf7738f71084353ef343f7363b7753ff763e77432f773e77125c7733f773b9373fe773f87725c771b6223f751
fe3ff2ff3f77320f772f8071ba673ff3023c573f7113ff7701e673ff501fc453ff7538f753c776124433df770f07339f77238133f777327770fe673ff213fa453f7140ce770df433ff77327773977119f771f643
b7ffffed2f1770a9773fb740f65326f7732f773f91726f770fc443ef7711e770fe673ff223f7533bf770f9243477735f7727a312ff363f77735f7737a7727e573f7753f7772cb471f9773ff133ff7336f7727877
feffc6ff3ff743d7773ff730b9172f7773e7331fb773ff653ff751be363ff773df7701d771ff773f9473f7311dc473ff703f77732c7723c623df7222c7535f772fc773fb363cf770ff773f05127f773fc673ff52
fffcfff13fd673ff133ef7706b36275443ee373ff753ef771df473ff733f77718e773f9673ff312df473ff743f7771ae772f222240672ff771f8473ff3509b773f3373ed653ff7716b671fe773f2653f7773cf77
1fa4c7e53f77334f773af7738c553f7772e8373ff353d9673f737398770f92433f772fd773fb673ff7126e333f7773fa673ff6725e773f77120f7733f512fe070f7771601726f773f73012e673f77701a443ff77
ff3bfeff3ff7403946379673f77702f773f7723477735f303df710e6711cf653ff77378673ff77039653ff771fc0717f7728c373ef773f9163ff772b8773f42225f773f7723ef773f4142df773f7331a97323f77
1ffd4f633f7123e73539c77276773ef773f9442cf773f7343ed771fc533ef773f2221ae733fb5732f773f7323ff771fa113c77702f77089773f77725b403ff772f50632f773f77211c363bf753fb173ff473f857
ffffc6ff3ff362547311e771df773106337f163fd243f7350236413d32087513f77117e363ff772316312c771fd710cf771fc753f7733ff753cd753fb263ff772711336f773f723128013ff052cb54082231fd77
3f74fdff287743f9671fa770fc0724e7723e770f366228263b8673f7770eb6301b0123c0137a612ff773ff760c7130b34113d453ff0010e763cf773fb713ff773f7442cc7408b61194021ce7539f773f7043ff77
ffffb0c43f50532e773f7730ae563cf773f3223f9763ff7717a1123f773ff512477732f773f774199773f7732a8713cf773fb213ff772fa173ff77179063ff7733a403cf773fb3138f773fb722df773ff7336c47
bf11feff3ff770fe643ff7717e073ff772710002f023ff773fb073ff460f101272753ce600691739c773f775118773f777238673ff77069473ff770da073ff771bc063ff77378143ff772f9203ff771f3403ff77
feff7f233f5123cf773f33438f773ff6030f773f75121f773f73302f773f77604e773ff7508c773ff73118773f777238673ff77069473ff770da073ff771bc063ff77378143ff772f9203ff771f3403ff773f601
cbe6971f3cf773f33438f773ff6030e773fb1135d341ee3639a573cc5531f263c9733de7437e57116710ee150e67336f3038e533dd11235772c7303fa473cb1633b473ea473b8732dd5535f340fc733c3073cf17
479e1fbe167673e1750ea4207967313763b7063bc702fd723bb453f4721ff471ec761ec353eb4413273177733367633e54389413db17071433477017243382261bf060a77131f4707c323f065319363d5763ef07
47ee37fb03f432fc343d7143ad7731b612ee360db67307433e7473e70307c530fd7724f503e7023bb721cd132ea703806311b7509e701797433c570c13217b763be7539f302bb533fd4527b16178772003739165
f27d567f036772c37331b5727077393753a5431e6773a1053907710d3303b721d317049572e47730f5303f06351530977039704329601f1631c3373ec7138c1607c6003e353b1473ce650f8370bf1731d070fe67
00000000380733fa61374073d31734f7138f041ea6701d113d1611c1713fb44375223f3651ef433f9070bf411c643327143371437b76326513eb061783423b54117653fb252ea670303000000000000000000000
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
0c 6f7e7861
05 7f737f6f
0e 1c7f237b
0d 7f715f7d
0f 5f5e7f27
07 7f557f2b
02 49122449
0b 12647f76
0e 7f7b5f7d
0f 7f7e077f
0f 477f657f
05 737f7a7f
07 7d5f7e7f
0f 7f473f3f
0f 7f677f43
07 3f7f6b1f
0b 7f793f7c
0f 3f7d1f7e
0f 677f0f6f
09 7f013f74
0f 7e3f3f7f
0f 7b5f7f57
07 6f7f697a
0e 1f7e7f40
0c 6f7f7c7f
0f 037f3f70
0d 7f1f7e7f
0f 447f3f78
0d 7f1b7f7f
0f 637f0f7c
0f 7f137f3f
0b 727f5f7e
0f 7f4c7f3f
02 597e073f
07 677a7f3b
0f 7f1f7f4b
0e 2f7f6b7f
07 3f713f49
0d 7e477f44
0e 786c7f77
03 3f7f5f39
05 7e674f0f
07 7f3b3f7f
0f 7b6d7f7f
0f 7c7f217f
0e 7f747f17
0f 7e7f537f
07 1f7a7f57
0d 7f7f6b7f
0e 7f7d7f31
0d 7f7f767f
0f 577e7f1b
0f 6b7f4f7d
0f 7c7f6f5c
0f 797d7c7f
0a 1b793f7f
05 713f191f
0f 7f793f7c
0f 7f3d7f7f
0b 777f0713
04 24491224
0e 497e7f61
0d 7f5f7c7f
0b 0f7f7f72
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
