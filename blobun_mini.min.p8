pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function _init()cls(1)?"loading...",1,122,13
flip()memcpy(32768,0,17152)F={{},{},{},{},{},{}}ff,fb=0,0local e,f=32768,%32768while(f~=0)add(F[f>>13&7],e+2)e+=2+(f&8191)f=%e
f7,f9={51510,27795,14025,37740},{32769.5,42405.5,60855.5,-.5}f2,fe,n,S,T,fn,f8,_,o,d,fo,y=0,0,0,0,0,true,time(),0,1,{},false fu,fs,f5,H,fO,fh=I"0001115525511125",J("3c26915154",5),J("13b49a5d6",3),I(H),{64515,-925,-829,-733,-637,-541,-445,-248},{64140,63686,63880}fP()fQ()fR(1)fx()end function _update()fn=fn==false T+=.2T%=4f2+=.035f2%=1n+=.15n%=32S-=1if S<=0then S=14elseif S%7==1then K=true end fS()x=max(x-1)if(btnp()&48>0and x>45)x=45
if(count(d)>0and x>10)x=10
if(x<=45)_=min(_+.1,1)
if j~=nil then o=max(o-.1)if(o==0)local f={fT,fU,fV,fx,fW,fX}f[j+1](U,fm)_,o,j,U,fm=0,1
end for f,e in pairs(d)do e:m_step(f)end if(not h(4))y=nil
if(y~=nil)sfx(y>>10&63,3,y>>5&31,y&31)y=nil
f8=time()if(f8<0)stop"game has been running for too long. take a break!"
end function _draw()fY()for f,e in pairs(d)do e:m_draw(f)end local f=j==2or j==nil and count(g)>0local e=f and U~=nil and U or B or 1local n,f,e=f and fs[1][e]or 1,fs[2][e],64*cos(_*o>>2)if(e>0)rectfill(0,0,e,127,n)rectfill(127-e,0,127,127,n)
if x>0then local d,o="stage "..L,cos(abs(max(abs(x-45),35)-35)/40)*64-64local n,a,o=o+8,o+9,p(d,o+12,97,7,f)line(a,105,a+o,105,f)line(n,104,n+o,104,7)p(i.s_name,n,107,7,f)if(e>0)?i.s_author,n,115,f
end end function s(e,f,n,o)if(e==5)M=f f=nil
j,U,fm,fZ,x=e,f,n,o,0fy()if(j~=2)music(-1,500)fo=false
end function fg(f,e)fS,fY,x,g=f,e,0,{}pal()end function e(f,e,n)fp(6)fw(1)fk(1,0,0)music(h(5)and f or-1,0,7)u=0fg(e,n)end function fx()e(-1,e1,e0)V=90end function fT()e(0,e3,e4)end function fU()e(4,ef,e2)local f=fv()r,N=mid(1,f.world,count(b))w=mid(1,f.stage,count(b[r]))u,q,C,ee=0,0,.125,J("13b224cd02415d6d2494",4)end function fW()e(4,fz,fF)M=nil end function fX()e(4,fz,fF)end function fV(f,e)fg(en,e8)local n=ff~=2f=mid(1,f,count(b))e=mid(1,e,count(b[f]))B,L,i=f,e,b[f][e]eo(f,e)f6,f_,W,X=0,61936.8827,0,0g,v,l,Y,fa,z,K,Z,O,fj,x,A,fq,f1,D,fd,f0,P,e5,e6,ea,ed={},false,false,false,false,0,true,false,0,false,fZ==true and 0or 90,0,false,{},{},{{},{}},1,i.s_tiles,fA(),fc(),E(false),E(true)fw(2)fp(f)if(n)poke(24405,0)local e=J("2854ef234924d6d54924",4)for n=1,4do pal(e[1][n],e[f][n])end spr(1,8,0,14,1)spr(16,0,8,2,2)poke(24405,96)ec(f)fk(2,96,0)
local n,o,f=i.s_data,i.s_width+2for e=1,#n,2do f=c(n,e,1,1)k(96+f\16*2,f%16*2,(e-1)\2%o*2-1,(e-1)\2\o*2-1)end local e,f=i.s_obj_count-1for e=0,e do f=ei(sub(i.s_obj_str,e*5+1,e*5+6))if(f.type==11)add(fd[1],fB(f.spr,f.x,f.y))else add(g,f)
end for f in all(i.s_hints)do add(fd[2],fB(f))end end function fB(f,e,n)local f={dir=type(f)=="number"and f or c(f,1,1),x=((e and e or c(f,2,1))<<4)+12,y=((n and n or c(f,3,1))<<4)+12}function f:ondraw()fi=self.dir spr(fi%2==0and 254or 255,self.x,self.y,1,1,cos(fi>>2)<0,sin(fi>>2)>=0)end return f end function fP()local n,d,e,f,o,a=b b={}for n in all(n)do d={}for n in all(n)do e={}f=2o=c(n,1,1)e.s_name=sub(n,f,f+o)f+=o+2o=c(n,f-1,1)e.s_author=sub(n,f,f+o)f+=o+1e.s_width=c(n,f,1)+1e.s_saveslot=c(n,f+1,0,1)e.s_goaltime=c(n,f+3,0,7)e.s_devtime=c(n,f+11,0,7)f+=19o=c(n,f,1)*3e.s_hints={}for o=1,o,3do add(e.s_hints,sub(n,f+o,f+o+2))end f+=o+1o=c(n,f,1,1)a=f+2+o*5e.s_obj_count=o e.s_obj_str=sub(n,f+2,a-1)e.s_tiles=c(n,a,1,1)e.s_data=sub(n,a+2)e.s_height=#e.s_data\2\(e.s_width+2)-2add(d,e)end add(b,d)end end el="4fe5729bd9f69189773150d1dfc52318"H="55332"b={{"6tadpole3ashe601004.8344002.8344c0013110123221230221321310300400503600600100b3101b5100b0200b1203b3301124e4e4e38181818404e38184033ff01ff13403321131d010b01ff3b3301ff0cff01ff013b4c3101ff01ff01394d4e4c41414141414d4e","bplaying card4riley302004.8344002.851160000103200213312320100000123818181818403321ff01ff3b33ff19ff013b33010c01ff3b33ff01ff013b3301ff01ff3b4c414141414d","6big can3ashe542009.1010006.584480100203300313410422522420101000284e3818181818404e38102101ff01134033ff01ff01ff013b33011901ff01ff3b33ff1aff01ff013b33011a01ff01ff3b33ff0cff01ff013b3301ff01ff01ff3b4c3101ff01ff394d4e4c414141414d4e","efractured floor3ashe605006.8344004.836160450551651643632640504500a1160a6011a2540a40251e3818181830181818403301ff011a25ff053b33ff05ff121b01ff3b3301ff01ff1214143f3614141b01ff01ff3b3301ff121b01ff013b33ff01251a2101ff3b4c4141414b4141414d","btwisted path3ashe504005.3344003.334431031021010100300154e3818181818404e3810ff01ff01134033ff01ff19ff013b33010b011f0dff3b332101890cff013b4c413101ff01394d4e4e4c4141414d4e","asilly swine3ashe603007.7010005.501141051041031020100500223818181830181818403301ff011a01ff013b33ff0bff0cff0bff3b3301ff89ff89ff013b33ff11142a140dff3b3301ff010c01ff013b332101ff01ff01ff3b4c414141414141414d","dtricky portals3coco411005.3344003.567771320312411312303201210503200a1220a2012a2322a222315381818181818403301ff25ff013b33ff018901ff3b3301256521013b33ff016501ff3b4c41414141414d","cstylish bunny5autumn632007.4677005.501170561662651552541440430305600a4020a2040214e4e38183018404e4e4e3810451a4513404e4e3301ff1aff013b4e4e33ff010c01ff3b4e381001ff01ff0113403301ff0bff0bff013b33ff01ff89ff01ff3b4c31ff01ff0121394d4e4c41414141414d4e","dspiral portals4riley634006.8344004.867761332320220323423430303300a5414a14541e38181818181818184033018901ff0189013b33ff0111140d01ff3b33011901ff0119013b33ff0cff21ff0cff3b33010501ff0105013b4c414141414141414d"},{"cbarrier break3ashe606006.6677004.717750010110211310300200100331551d4e4e3818181818404e381810444443ff134033210144424301ff3b3301ff01ff43ff013b334301ff014301ff3b4c4131434343ff394d4e4e4c414141414d4e","estaggered coins3coco627006.5011004.5011310310200104003004005643156462561c3818181818181818403362ff01ff01ff013b33ff19ff62ff19ff3b33010c0119010c623b332101ff0cff64ff3b4c31ff01ff01ff633b4e4c4141414141414d","btoggled tris3mika536005.8344003.83446003013223113112211040030035055a5300a00531838181818181818403365ff01ff01423b33ff44444343013b330144444343ff3b332101ff01ff653b4c4141414141414d","cmasked hearts4riley535006.1677004.317781031020011113100112213110200300112531a381818181818184033040401ff03033b33040bff010b033b33010201ff01ff3b332101ff01ff013b4c31ff030301394d4e4c414141414d4e","cdiamond coins3ashe607007.9344005.68446024034044054164163050240046056402564325620454233818181818181818403301ff01ff01ff623b33ff6464016363ff3b33626464626363243b33ff01ff23ff01243b33222321ff2424013b4c414141414141414d","ekey to diamonds3ashe637006.1100004.5100510310200111131003003009209f25254193818181830181818403301ff2c1a2323233b33ff01ff0c2301233b3301ff018a2422243b332101ff192424243b4c4141414b4141414d","dtriangle coins3coco626006.5011004.50116163162261251341242060630045056412563425530355433561c3818181818181818403301ff01444462633b33ff01ff01ff01ff3b33646243ff4243013b334264ff62ff43213b4c414141414141414d","dunlocking path3ashe608006.3344004.334472232131031020011110100502300a4121a21419039f363551b3818181818181818403301ff448a44ff013b33ff01050b0501ff3b3301ff014301ff013b332c012143ff01423b4c414141414141414d","dfractured isle5willow620008.8677006.35105266256246236126090660035055a6100a00612035431355a0664a640621654273818181818181818403325ff01444442013b33ff01ff444401253b36141414141b24243b332242ff011a24243b33432323441aff053b33432323441214143f33052201ff01ff213b4c414141414141414d","atoggle maze3coco612009.8010007.23446263253243233223213090630042056461562125436455a0522a2205425569359f2b3818181818181818403344ff626301ff433b33ff01ff63ff01623b33012205238a23013b33242424448944213b3323ff01ff43ff423b330501622cff01ff3b4c414141414141414d","cnumerous keys4riley633009.8010007.117752432332232131030a043003405540156441569629f113534045624454a0560a60052b381818181818181840330303014442ff053b336201ff016264643b330144444343242c3b33ff0204012124243b33626363632289013b330501ff018a23233b4c414141414141414d"},{"ewatch your step5autumn330004.3011002.501140031132121020200300310551038181818184033014201ff3b33474443013b3301ff43ff3b332101ff273b4c414141414d","ccareful moves5willow518005.1677003.16774143142241231030430035055223541438181818181818403301ff01ff27423b33ff23ff0124433b4c3123014701394d4e33232227213b4e4e4c414141414d4e","cdiamond house3ashe509006.1677004.1844f154153252142141240330231221211301302003313114030540020254252541a4e4e381818404e4e381810232313184033ff012323ff013b332224242424223b33ff47ff0147013b33010701ff07213b4c4141414141414d","dforbidden path5willow439006.1100004.1100502213233103234202022002445419381818181818403323ff01ff233b33ff014701ff3b3301272107013b33ff010701ff3b3307ff01ff223b4c41414141414d","fkey in the woods5willow440006.1100004.5100514424313303214202044009049f19381818181818403366ff01ff463b33ff01ff01ff3b3301ff01ff013b33ff018a01ff3b332c0601ff213b4c41414141414d","9conveyance3roxy528006.8344004.83446104103102101000010030040011353253541e38181818181818403301ff66ff01663b33ff664601ff663b330166060601663b33ff02030123223b33210303ff23233b4c4141414141414d","dunstable floor4riley417005.8344003.851040040140240340200400321551a381818181818403301ff0144443b33ff014244443b334343fe09fe3b334343ff89ff3b3321ff0109013b4c41414141414d","cdigging holes4riley638006.1100004.1770403214224113103032003305533455233818181818181818403343ff014201ff443b33fffe090109feff3b330109fe21fe09013b33fffe090109feff3b3343ff014201ff443b4c414141414141414d","aforest maze5autumn531006.4677004.884440041140133230600400a5100a00519029f152539549f1f3818181818181840336589464646273b338a03ff8aff653b332cff010926023b33ff0404feff013b3321ff4709012c3b4c4141414141414d","bmisdirection3coco829007.7010005.501161030021122110010110700300280541715332255a2300a00239839f2238181818181818181818403325ff01ff06ff43ff223b33ff0144231924ff02ff3b33014442230c240404033b3321012501468aff032c3b4c4141414141414141414d"},{"dbring the heat3ashe416005.1677003.167732232131030202300741e714381818181818403301696969013b33ff0a0a0a283b33010a0a0a013b33ff012101ff3b4c41414141414d","acold circle5willow619006.1100004.501120031130300300a6360a60631c3818181818181818403301ff696969ff053b33ff6969696969ff3b33016969696969013b33210169696901053b4c414141414141414d","bfrozen water3mika624006.5011004.501112630406300811e8a1260a60121c3818181818181818403301ff696969ff053b33ff48acb5a401ff3b33010591968dff013b33ff0169696901213b4c414141414141414d","ahot diamond3mika523006.8344004.83445300301002012322030000025054724e71e381818181818184033210a7a8272223b33ff01578184723b3301ff017c86743b33ff0189575c543b3323ff28ff0a394d4c41414141414d4e","afreeze keys3ashe644006.5011004.5011216316206063009009f26154a1260a6012203541c381818181818181840332cff01ff01ff053b33ff0169692324223b33010569692324013b3322018a01ff01213b4c414141414141414d","9lava coins3coco625006.5011004.51776103002112211001111060030041056730e74505626154433561c38181818181818184033016201280a620a3b33ff24ff017a72223b33016463558077523b332164236257540a3b4c414141414141414d","ahot springs3ashe810010.2677007.33442001111090010025054811e8761e7813e8a6320a2063a8404a04842d3818181818181818181840330166050606220606663b332148acb5b5a4285d693b3301ffaeb9b9a6235e693b33ff489196968d0551693b332555520a0aff01ff253b4c4141414141414141414d","ccool crossing3mika622007.9344005.68444002012122121090020042056831e8712e745256814e8a2562a622544656234e4e38181818404e4e4e4e3362ff013b4e4e381810ff48461318403321280a896962053b33ff4669896901ff3b3301488e928bff013b4c41310501ff39414d4e4e336363623b4e4e4e4e4c4141414d4e4e","8iced maze3ashe843012.6010009.101031061053040900600720e7881e8252549339f764e7825e8a5503a0355393818181830181818181840338e8b280c23fffeff013b33555f894989890901483b332351010b4922feff013b332506062c66110d8a394d33016969ff06ff28ff3b4e33ff2948010b257a723b4e3321ff018e8bff57543b4e4c41414141414141414d4e"},{"dfollow the gem3ashe841010.9677007.9510326135105209061005210654107581015530050405525045550257703304e4e381818301818404e4e4e381001ff0cff4a1318404e3301cf01ef0121012f3b4e33ff01ff19ff01ff013b3816140d011a0fff01ff3b33afff01ff1f14140d013b33ff018f011a4fff01ff3b4c31ff01ff0cff01ff394d4e4c413101ff01ff6f3b4e4e4e4e4c41414141414d4e","dunlocking gems3ashe714012.8344009.284453003010023123130c000005200755006352555720552300543035040120654526025460417653383818181818181818184033214aefff43cf44443b33ff4aff01430144443b33014a4a4a434201af3b33ff010f236f0403033b332fff0123230403033b33ff01ff232301ff013b3322ff4f238fff01023b4c41414141414141414d","boctogem maze3roxy613011.2010008.201061631622611513502510f06300200545300756000203545130613353553015640250505545045160334655a6606a06663138181818181818184033224a23ef01ff0f3b33ff0303030404ff3b33240303030404013b3322cf2302ff2f213b3301ff01ff43ff4f3b33af43ff018f01ff3b33056f44044204053b4c414141414141414d","bweaving path5willow821017.3440012.384441871862851751008700700e731255403569439f4735620554636e6837e815753a0834a3408818e842856a8882a82884a38181818181818181818403328ff434301ff7a720a3b33ff01ff01ff017c740a3b330142aca4010b5754453b33628e958d2c03ff628a3b3614140d2519ff6969013b332201ff011a01ff01ff3b33239769080cff2666013b33ff886948ff02ff01213b332548626301630163453b4c4141414141414141414d","bfour islands3ashec15030.3344023.7344938708829828807838838908a29a1c0870021054690e62b054a5180a80515710558306504045540317453845e89179f5470217853ac8c4ac4c882ae873ae71ba5352b0123b5457b00a1c15a151ca8c4ca4c8c5bc07834e3818181818404e3818181818404e38102201240113301045082422134033ff01ff24ff451aaf2424ff89233b3301ff012489241aff49ff23ff013b338e8bff01ff011a23cf01ff04233b338fff0a0a236f1a0223ff0423653b4c3125ff0148394b3123010423394d4e36141414143f4e36141414143f4e38102c23234f1330102101034a1340337a75587d82721a0201ff03ff653b33575449575c541a0303030301ff3b3301ff482801ff1aff01ff8902043b33ff8a2f2223011a0fff660401ff3b4c312501ff05394b3105464aef394d4e4c414141414d4e4c414141414d4e"}}function fw(f)if(ff==f)return false
holdframe()G(0,0,F[1][f],sget,sset)G(0,0,F[2][f],pget,pset)memcpy(12288,24576,255)ff=f end function fp(f)if(fb==f)return false
music(-1)holdframe()G(0,0,F[3][f],pget,pset)memcpy(12544,24576,128)memcpy(12800,24704,2176)fb=f end function fk(f,e,n)holdframe()G(e,n,F[4][f],mget,mset)end function fR(f)holdframe()G(0,0,F[5][f],pget,pset)memcpy(14976,24576,2176)end function ec(f)holdframe()G(32,72,F[6][f],sget,sset)end function G(c,e,f,r,t)local function i(f,o)local e,n=f[1],1while(e~=o)n+=1e,f[n]=f[n],e
f[1]=o end local function d(e)local n=$f>>f%1*8<<32-e>>>16-e f+=e>>3return n end local function f(e)local f=0repeat f+=1local n=d(f)e+=n until n<(1<<f)-1return e end local b,u,s,n,l,o,a=f"0",f"0",f"1",{},{},0for f=1,f"1"do add(n,d(s))end for d=e,e+u do for c=c,c+b do o-=1if(o<1)o,a=f"1",not a
local o=d>e and r(c,d-1)or 0local e=l[o]or{unpack(n)}l[o]=e local f=e[a and 1or f"2"]i(e,f)i(n,f)t(c,d,f)end end end function er()local f={}f.obj_list,f.player,f.g_p_zap_turn,f.g_tile_count,f.playfield=fC(g),fC(g[1]),z,P,et()add(D,f)if(count(D)>60)deli(D,1)
end function eb()local e=count(D)if(e==0)return
local f=D[e]if(e>1)deli(D)
g=f.obj_list g[1]=f.player z,P=f.g_p_zap_turn,f.g_tile_count local e=g[1]e.nextdir,e.isdead,e.ismove,v,Z,K=-1,false,false,false,true,true e7(f.playfield)end function et()local f={}for e=0,34do f[e]={}for n=0,31do f[e][n]=mget(e,n)end end return f end function e7(n)for f=0,34do for e=0,31do mset(f,e,n[f][e])end end end function fC(e)local f={}for e,n in pairs(e)do f[e]=n end return f end function c(n,f,o,e)return tonum(sub(n,f,f+(e and e or 0)),o)end function J(n,f)local o,a,e={},#n\f for a=1,a do e=(a-1)*f o[a]=I(sub(n,e+1,e+f))end return o end function I(f)local e={}for n=1,#f do add(e,c(f,n,1))end return e end function m(f,e,n)return f+(e-f)*n end function k(n,o,a,d)for f=0,1do for e=0,1do mset(a+f,d+e,mget(n+f,o+e))end end end function Q(o,a,f,e)local e,n,d,c,i,l,f=i.s_width<<1,i.s_height<<1,48+f\16<<1,f%16<<1,48+e\16<<1,e%16<<1for e=1,e,2do for n=1,n,2do f=mget(e+1,n)if f==o then k(i,l,e,n)elseif f==a then k(d,c,e,n)end end end end function R(f,e)local n=mget(f,e)if(n~=125and n~=127)return 0
k(126,24,f-1,e)return 1+R(f-2,e)+R(f+2,e)+R(f,e-2)+R(f,e+2)end function fl(e,n,o,a,d)local f=#e for f=1,f do n=print(sub(e,f,f),n,o+sin(f2+f/10)*d,a)end end function p(f,e,n,o,a)?f,e+1,n+1,a
return print(f,e,n,o)end function fD(f)return(f>=60and flr(f/60)..":"or"")..sub(flr(f%60)+100,2,3).."."..sub(flr(f%1*1000)+1000,2,4)end function en()local f=_*o==1fe+=.075fe%=1f6+=.015f6%=1if(x==45and fo==false)music(h(5)and 0or-1,0,7)fo=true
if x<=45and f then if(btn(6))poke(24368,1)
if((Y and l or btn(6))and count(d)==0)e9()
end O=mid(0,count(d)==0and(l or v)and O+.2or O-.2,1)if(f)for f in all(g)do f:onstep()end eu()
local f,e,n=g[1],i.s_width<<4,i.s_height<<4local o=f.inportal and cos(1-f.anim>>2)or f.anim W=i.s_width>8and mid(0,(m(f.oldx,f.x,o)<<4)-48,e-112)or(e>>1)-56X=i.s_height>7and mid(-8,(m(f.oldy,f.y,o)<<4)-48,n-108)or(n>>1)-60end function e8()poke(24405,0)if(fn)es()else eh()
if(K)ex()
if(Z)em()
ey()poke(24405,96)palt(0)local f,e=-32+n,-n if(B>=3)f,e=-32+-W/2,-32+-X/2
for f=f,128,32do for e=e,128,32do spr(148,f,e,4,2)spr(152,f,e+16,4,2)end end poke(24404,96)pal()if(B<=2)for f=0,127do sspr(0,f,128,1,sin(f6+(f>>4))*1.4,f)end
poke(24404,0)camera(W,X)local f,e=i.s_width*2+2,i.s_height*2+2palt(256)map(0,0,0,0,f,e,1)fE()map(0,0,-7,0,f,e,128)fE()for f in all(fd[f0])do f:ondraw()end palt(16384)map(0,0,0,0,f,e,12)palt()map(0,0,0,0,f,e,2)for f in all(g)do f:ondraw()end eg()camera(0,0)local o,a=h(1),count(d)local f,e=m(127,115,O),o and 0or 87poke(24404,96)pal(fu)if a>0then sspr(0,0,128,128,0,0)else sspr(e,0,128,9,e,0)if(O>0)sspr(0,f,128,16,0,f)
end pal()poke(24404,0)local e=A<=i.s_goaltime and 7or 13if(l and A<=i.s_devtime)e=10
local n=dget(i.s_saveslot)spr(n<599.995and 147or 146,88,0)if o then?fD(A),2,2,e
if(fj)fl("new time!",32,2,e,1.3)
if(n<=i.s_goaltime)?"⧗",81,2,9
if(n<=i.s_devtime)?"♥",75,2,14
end rect(96,1,126,7,7)fillp(f7[ceil(T)])rectfill(124-max(1,g[1].tilestouched/P*26),3,124,5,59)fillp()if(l or v)fl(l and"stage clear!"or"❎ undo",l and 42or 50,f+5,7,1.3)
if(a==1)local f=sin(d[1].m_anim_factor>>2)*-32+-24local e=p("stage "..L,f,106,7,0)line(f-2,112,f+e,112,7)p(i.s_name,f,115,7,0)p(i.s_author,f,122,13,0)
end function es()local f="0c38010f00380438080f05380038010f0438113b0f01707f113c0f08113b707f0f0111432438010f00382538080f24380038010f2c3831430f01707f313b0f08313c707f0f01313b"for e=1,144,12do sspr(c(f,e,1,1),c(f,e+2,1,1),c(f,e+4,1,1),c(f,e+6,1,1),c(f,e+8,1,1),c(f,e+10,1,1))end line(112,127,127,127,7)line(0,56,0,71,0)end function eh()local a,e,f,n,o=f_,0,0,false,false for e=0,10do f,n,o=21+e,a&1<<e>0,a&8<<e>0sset(f,98,n and 7or 12)sset(f,96,o and 7or 0)sset(f,92,n and 9or 4)sset(f,90,a&32<<e>0and 10or 9)sset(f,88,o and 10or 0)end for e=0,4do f,n,o=8+e,a&16<<e>0,a&64<<e>0sset(f,98,n and 7or 12)sset(f,96,o and 7or 0)sset(f,90,n and 10or 9)sset(f,88,o and 10or 0)end for d=0,7do f,n,o=103-d,95-d,88+d e=a&1<<d>0and 7or 12sset(f,101,e)sset(50,103-d,e)sset(78,96+d,e)e=a&1<<d>0and 9or 4sset(f,91,e)sset(52,n,e)sset(76,o,e)e=a&4<<d>0and 9or 10sset(f,93,e)sset(50,n,e)sset(78,o,e)end f_>><=1end function ey()local o=fe spr(224,80,104,6,2)local f,n=80for a=0,32,16do clip(f,104,16,16)for e=0,15do n=sin(o+e/8)+104sspr(a+e,112,1,16,f+e,n)sspr(f,104+e,16,1,f,n+e)end f+=16end local e=g[1]clip()palt(0,false)spr(208,24,104,3,1)palt()if(e.haskey)spr(144,32,104)spr(144,39,104,1,1,true)
for n=0,16,8do f=24+n clip(f,104,8,8)for e=0,7do sspr(e+n,104,1,8,f+sin(o+e/8)+e,104)end end clip()if(e.haskey)spr(145,32,104)spr(145,39,104,1,1,true)
local e,n,f=(btn(4)or e.sprint)and e.onconvey==false,e.blink<4or l f=e and 214or 215if(n or v)f=216
spr(f,l and 37or 36,104,1,1,l)f=e and 252or 251if(v)f=160
if(l)f=250
spr(f,40,104)for f=0,23do for e=0,7do sset(79-e,104+f,sget(24+f,104+e))end end end ep=J("1d5cdc125848145949",6)function ex()local f,n,o for e=1,3do o=0n,f=((e+z+2+o)%3<<1)+1,ep[e]pal(f[3],f[n])pal(f[4],f[n+1])spr(155+e,96+(e<<3),8,1,2)end pal()K=false end function fE()poke(24405,0)camera(0,0)local f,e for n=0,34do f,e=(n<<3)%128,(n\16<<4)+8sspr(f,e,8,16,f,e,8,16,true)end camera(W,X)poke(24405,96)end function em()local a,e,o,f=g[1].coins for n=0,1do e,o=4,5if(a>n)e,o=9,4
f=17-n*3for n=0,8,8do line(72+n,f,76+n,f,e)line(72+n,f-1,75+n,f-1,e)f+=1e=o end end Z=false end function ei(e)local f={type=c(e,1,1),x=c(e,2,1),y=c(e,3,1),spr=c(e,4,1,1),anim=rnd(),spin=rnd()}f.poskey=f.x<<4|f.y if f.type==0then f.startx,f.starty,f.poskey,f.dir,f.anim,f.jiggle,f.sprint,f.pstate,f.ismove,f.oldx,f.oldy,f.startturnx,f.startturny,f.haskey,f.onconvey,f.inportal,f.blink,f.octogems,f.coins,f.nextdir,f.tilestouched,f.isdead,f.prevslimetrap,f.prevcrackedfloor=f.x,f.y,-1,3,1,0,false,0,false,f.x,f.y,f.x,f.y,false,false,false,10,0,0,-1,1,false,false,false f.onstep=ew f.ondraw=ek else if(f.type==5)f.oct_ind=f.spr f.spr=87
if(f.type==10)f.dst_x,f.dst_y=c(e,4,1),c(e,5,1)
function f:onstep()if(self.type<10)self.anim+=.02self.anim%=1self.spin+=.035self.spin%=1
end function f:ondraw()local f,e=(self.x<<4)+8,self.y<<4if self.type<9then if self.oct_ind==nil or self.oct_ind==g[1].octogems then local e,o,a,n=e+sin(self.anim)*2,self.spr%16<<3,self.spr\16<<3,ceil(sin(self.spin*.5)*-8)if(n<=3)rectfill(f+7,e+1,f+9,e+14,7)
sspr(o,a,8,16,f+9-n,e,n,16)sspr(o,a,8,16,f+8,e,n,16,true)end elseif self.type<10then spr(self.spr,f+4,e+sin(self.anim)*2,1,2)end end end return f end function ew(f)if(not h(6)or count(d)>0)return
f.blink-=1if(f.blink<=1)f.blink=30+flr(rnd(60))
Y=btn(4)and fa==false fa=btn(4)f.jiggle=max(f.jiggle-.2,0)if(btnp(5)and not l)eb()
f.anim=min(f.anim+((f.sprint or f.onconvey or f.inportal)and.2or.1111),1)if f.anim>=.65then local n=I"2013"for e=0,3do if(btn(e))f.nextdir=n[e+1]
end end if f.anim+.001>=1and not l and not v then if(f.ismove)ev(f)
if(Y)f.jiggle=1
f.sprint=false local e=f.nextdir if e~=-1or f.inportal then if(f.inportal)e=-1
local o,a,d,c=f.inportal,16,f.x+cos(e>>2),f.y+sin(e>>2)if(f.onconvey or h(2))a=18
local n=mget((d<<1)+2,(c<<1)+1)if(n==121and f.pstate==1or n==51and f.haskey or fget(n)&a>0)o=true
f.nextdir,f.dir=-1,e if o and not v then fq=true if(y==nil and stat(49)==-1and not f.onconvey)y=61956
if(not f.inportal and not f.onconvey)f.startturnx,f.startturny=f.x,f.y er()z+=1z%=3K=true
f.anim,f.sprint,f.ismove=0,tonum(h(3))~tonum(btn(4))==1,true if(f.inportal==false)f.oldx,f.oldy=f.x,f.y
if(e>=0)f.x,f.y=d,c
end end end if l==false and f.tilestouched>=P then l,y=true,62483if(A<dget(i.s_saveslot))dset(i.s_saveslot,A)fj=true
end if(l)f.dir=3
if(fq and not l)A=min(A+(time()-f8),599.999)
end function ev(f)f.ismove=false local o,a,d,c,l,h=f.x,f.y,(f.oldx<<1)+2,(f.oldy<<1)+1,true,true if(f.prevcrackedfloor)k(96,18,d-1,c)P-=R(d,c)f.tilestouched-=1y=62278f.prevcrackedfloor=false
local e,m,x,r,t,b,u,s,n,i=mget((o<<1)+2,(a<<1)+1),mget(d,c),o<<4|a,(o<<1)+1,(a<<1)+1,(o<<4)+12,a<<4if(e\16==12and f.pstate==2)e,y=123,62084
if(e==52)Q(19,20,3,4)y,n=-349,"78e"
if(e==53)Q(21,22,35,36)y,n=-349,"73b"
if(e==54)Q(23,24,67,68)y,n=-349,"7dc"
if e==55then f.coins+=1y,n=63494,"49a"if(f.coins==3)f.coins,y=0,-349Q(25,26,99,100)
Z=true end if(f.prevslimetrap)k(126,26,d-1,c)y=62084
f.prevslimetrap=e==48for n=0,2do if(e==80+n)i=f5[n+1]f.pstate,y=n,fh[n+1]
end for n=0,7do if e==56+n then if f.octogems==n then f.octogems+=1y=fO[n+1]for e in all(g)do if(e.oct_ind==f.octogems)ez(b,u+6,(e.x<<4)+12,(e.y<<4)+6)
end else l=false end end end if(f.octogems==8)Q(27,28,74,106)f.octogems=0
if(e==18)if f.haskey then l=false else f.haskey,n,y=true,"67",63494end
if(e==51)f.haskey,y=false,-349
if(e==125or e==127)f.prevcrackedfloor,y=true,62210
if(e==121)y=fh[2]
local d=-1for f=0,3do if(e==113+(f<<1))d=f
end if(e==123)d=f.dir
if(d~=-1)f.nextdir=d
f.onconvey=d~=-1for e,f in pairs(g)do if f.poskey==x then s=f if(l)deli(g,e)
break end end if f.inportal then f.inportal,i=false,f5[f.pstate+1]else for n=0,6,2do if(e==89+n)k(126,f.pstate<<1,r,t)f.oldx,f.oldy,f.inportal,y,f.x,f.y=o,a,true,63142,s.dst_x,s.dst_y
end end if(e==123and f.pstate==1)e=192k(104,18,r,t)
if(e>208)fG(f)h=false
if e\16==11and f.pstate==0or e\16==12or e==50or e==29and z==0or e==30and z==1or e==31and z==2then fG(f,true)elseif h then f.tilestouched+=1k(126,f.pstate<<1,r,t)end if(n~=nil)fH(b,u+8,I(n))
if(i~=nil)fI(b,u+12,i)
end function fG(f,e)v=true if(e)y=61448f.isdead=true fI((f.x<<4)+12,(f.y<<4)+12,f5[f.pstate+1])
end function ek(f)if(f.isdead or f.inportal or not h(6))return
local d,e,n,o,a=f.dir,f.x<<4,f.y<<4,f.anim if(f.pstate==1)pal(3,8)pal(11,9)
if(f.pstate==2)pal(3,13)pal(11,6)
if(o<1)a=f.onconvey and o or.5+cos(o*.5*sgn(o-.5))*-.5e,n=m(f.oldx<<4,f.x<<4,a),m(f.oldy<<4,f.y<<4,a)
e+=(-1+rnd(3))*f.jiggle+8n+=(-1+rnd(3))*f.jiggle+8local o,a=cos(f.dir>>2)<0,sin(f.dir>>2)<0local d,c=o and e or e-8,a and n or n-8if(f.dir%2==0)spr(211,d,n+7,3,1,o)spr(211,d,n,3,1,o,true)else spr(217,e+1,c,1,3,false,a)spr(217,e+8,c,1,3,true,a)
pal()end function fQ()cartdata("cs_blobun_"..el)if(dget(63)==0)dset(63,117)for f=0,59do dset(f,599.999)end dset(62,0x1.12)
end function h(f)return dget(63)&1<<f>0end function eF(f,n)local f,e=1<<f,dget(63)dset(63,n and e|f or e&~f)end function fv()return{stage=dget(62)<<4&15,world=dget(62)<<7&7}end function eo(f,e)dset(62,dget(62)&~.9922|f>>7|e>>4)end function f3(e)local f=0for e in all(b[e])do if(dget(e.s_saveslot)<599.995)f+=1
end return f end function fJ(f)return f3(f)>=count(b[f])end function fA()local f=count(b)return f3(f)>=H[f]end function fr(f,e)for f in all(b[f])do if(dget(f.s_saveslot)>(e and f.s_devtime or f.s_goaltime))return false
end return true end function fc()for f=1,count(b)do if(not fJ(f))return false
end return true end function E(f)for e=1,count(b)do if(not fr(e,f))return false
end return true end function e4()cls(0)map(0,0,-24*u,32,19,2)map(0,2,u*2%1*-24,48,19,3)map(0,5,u*3%1*-24,72,19,7)palt(1024)local f=sin(u)*4map(19,0,12,8+f,13,7)if(not h(6))map(19,8,28,8+f,4,5)
?"2025 cyansorcery",32,122,3
?"beta 1",1,1,1
palt()pal(7,1)if(fc())spr(241,1,119)
if h(1)then if(E(false))?"⧗",113,122,7
if(E(true))?"♥",120,122,7
end pal()if(count(d)==0and j==nil)fl("press 🅾️ to start!",28,96,1,1.4)
end function e0()local e=_*o local f=e*8cls(1)rectfill(0,56,127,72,12)map(0,12,-24*u,56-f,19,1)map(0,13,-24+24*u,64+f,19,1)local f=f*.5?"presented by",39,60-f,1
if(h(6))map(19,7,18,60+f,11,1)
palt()fillp(f9[flr(m(1,4,e))])rectfill(0,56,127,72,12)fillp()end function fz()if(_*o==1and btnp()&48>0)s(0)
end function fF()for f=-32+n,128,32do for e=-n,128,32do spr(204,f,e,4,4)end end poke(24404,96)pal(fu)if(M==nil)sspr(0,58,128,70,0,58)sspr(0,7,128,18,0,7)sspr(39,38,52,20,39,38)else sspr(0,0,128,128,0,0)
pal()poke(24404,0)palt(4096)if(M==nil)map(48,0,0,0,16,16)local n={{"programming","bug fixes","general"},{"art, music","art, music","music"}}for f=1,2do for e=1,3do p(n[f][e],f*64-46,e*24+42,7,1)end end p("director",58,42,7,1)p("created by",44,1,7,1)p("a plural system",34,26,7,1)p("seven spirits, one body",18,32,7,1)else map(32,8+M*2,0,32,16,2)local f={[[ you've overcome many
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

    you are amazing!]]}p(f[M],16,56,7,0)
end function e1()u+=.025u%=1if V>0then V-=1if(btnp()&48>0)V=0
if(V==0)s(0)
end end function e3()u+=.01u%=1if count(d)==0then local f=btn(6)if(f)poke(24368,1)
if(btnp()&48>0or f)y=61828e_()
end end function ef()q=mid(0,q+C,1)u+=.02u%=1local f=count(b)if q==1then if(btnp(0)and r>1)y=61700N=max(r-1,1)C=-.125
if(btnp(1)and r<count(b)and f3(r)>=H[r])y=61700N=min(r+1,f)C=-.125
end if(q==0)C=.125r=N N=nil
local f,e=count(b[r]),btn(6)if(e)poke(24368,1)
if(btnp(2))w-=1y=61700
if(btnp(3))w+=1y=61700
if(w<0)w=f
if(w>f)w=0
if btnp()&48>0or e then if(w==0)s(0)y=63333else s(2,r,w)music(-1,500)y=61828
end end function e2()local o,f=ee,20+sin(q>>3)*29for f=1,4do pal(o[1][f],o[r][f])end rectfill(0,0,127,127,1)map(0,14,-24+24*u,-2-f,19,3)map(0,17,-24*u,115+f,19,2)map(32,-2+r*2,0,1-f,16,2)local f,e=122+f,H[r]if(r>1)?"⬅️previous area",1,f,7
local n=f3(r)?n>=e and(r<count(b)and"next area➡️"or"")or"▶solve "..e-n,84,f,7
local e=count(b[r])local a=max(min(w-5,e-9),-1)local n,d,i,c,l,f=13-a*10,a+10,h(1)for e=0,e do c,fK=e==w,n+10if e>a and e<d then f=n+3local a=b[r][max(1,e)]local d=dget(a.s_saveslot)if(c)fL(4,n,90,fK)
pal(7,c and 7or o[r][2])if e>0then?(e>9and""or" ")..e.." "..a.s_name,14,f,7
spr(d<=599.995and 241or 240,6,n+1)if i then if(d<=a.s_goaltime)?fD(d),96,f,7
if(d<=a.s_devtime)?"♥",120,f,7
end else?"back",26,f,7
pal(7,10)if(fJ(r))spr(241,6,n+1)
if i then if(fr(r,false))?"⧗",113,f,7
if(fr(r,true))?"♥",120,f,7
end end end n=fK end if q<1then palt()if(C<0)pal(1,o[N][1])
fillp(f9[flr(m(1,4,q))])if(C>0)rectfill(0,22,127,112,1)else rectfill(0,0,127,127,1)
fillp()end pal()end function ft(e,n,o,f)add(d,{m_x=e,m_y=n,m_w=o,m_h=count(f)*10+6,m_items=f,m_highlight=1,m_anim_incr=.25,m_anim_factor=0,m_step=function(f,n)local e=count(d)local n,o,a=n==e,btn(6),count(f.m_items)if(o)poke(24368,1)
if f.m_anim_factor==1then if(btnp(2))f.m_highlight-=1y=61700
if(btnp(3))f.m_highlight+=1y=61700
if(f.m_highlight<1)f.m_highlight=a
if(f.m_highlight>a)f.m_highlight=1
if(btnp(5)or btnp(4)or o)y=61828f.m_items[f.m_highlight]:i_onclick()
end local o=true if(n and e>1and d[e-1].m_anim_factor>0)o=false
if(o)f.m_anim_factor=mid(0,f.m_anim_factor+(n and f.m_anim_incr or-.25),1)
if(f.m_anim_factor==0and f.m_anim_incr<0)deli(d)
end,m_draw=function(f,n)palt()local e=count(d)local n=n==e if(n and e>1and d[e-1].m_anim_factor>0)return false
local e,b,o=count(f.m_items),count(g)>0and 147or 241,m(5,f.m_h,f.m_anim_factor)local n,e,a=f.m_x,f.m_y-(o>>1)local o,d,i,l,r,t=n+f.m_w,e+o rectfill(n,e,o,d,1)rect(n+1,e+1,o-1,d-1,13)local u,e=n+8,e+6for s,c in pairs(f.m_items)do if e<d-9then i,l,r,t=n+3,e-3,o-3,e+7a=s==f.m_highlight if(a)fL(i,l,r,t)
pal(7,a and 7or 13)?c.i_label,u,e,7
if(c.i_setting~=nil)spr(b-(h(c.i_setting)and 0or 1),o-11,e-2)
end e+=10end pal()end})end function fy()for f in all(d)do f.m_anim_incr=-.25end end function fM()y=63333d[count(d)].m_anim_incr=-.25end function a(f,e)return{i_label=f,i_onclick=e,i_setting=nil}end function f(f,e)local f=a(f,function(f)eF(f.i_setting,h(f.i_setting)==false)if(f.i_setting==5)music(h(5)and 0or-1,0,7)
end)f.i_setting=e return f end function e9()Y,fa,y=false,false,61828local f if(not e5 and fA())f=1
if(not e6 and fc())f=2
if(not ea and E(false))f=3
if(not ed and E(true))f=4
if(f~=nil)s(5,f)return
local e,n,o,f=a((l and"next"or"skip").." puzzle",function()if(L+1>count(b[B]))s(1)else s(2,B,L+1)
end),a("restart puzzle",function()s(2,B,L,true)end),a("stage select",function()s(1)end)if(l)f={e,n,o}else f={a("back",fM),n,e,a((f0==2and"hide"or"show").." hints",function()f0=f0==2and 1or 2fy()end),o,a("options",fN),a("go to title",function()s(0)end)}
ft(16,64,96,f)end function e_()ft(24,96,80,{a("start game",function()s(1)end),a("continue",function()local f=fv()s(2,f.world,f.stage)end),a("options",fN),a("credits",function()s(4)end),a("back",function()s(3)end)})end function fN()ft(16,count(g)>0and 64or 72,96,{a("back",fM),f("show timers",1),f("slime overlap",2),f("sprint by default",3),f("sound effects",4),f("music",5),f("lesbians allowed",6),a("exit game",function()extcmd"shutdown"end),a("pico8 menu",ej)})end function ej()extcmd"pause"end function fL(f,e,n,o)rectfill(f,e,n,o,2)fillp(f7[ceil(T)])rect(f,e,n,o,154)fillp(0)end function f4(e,n,o,a,d,f)add(f1,{x=e,y=n,spd=o,dir=a,col=d,time_max=f,time=f})end function fI(d,c,a)local f,e,n for o=0,.9,.1do f,e,n=d+cos(o)*4,c+sin(o)*4,o*360f4(f,e,.9,n,rnd(a),12)f4(f,e,1.8,n,rnd(a),8)end end function ez(o,a,e,n)for f=0,.8,.2do f4(m(o,e,f),m(a,n,f),0,0,14,m(5,12,f))end fH(e,n,{14,7})end function fH(e,n,o)for f=0,.9,.1do f4(e+cos(f)*4,n+sin(f)*4,.8,f*360,rnd(o),8)end end function eu()for f in all(f1)do local e=f.dir/360f.x+=f.spd*cos(e)f.y+=f.spd*sin(e)f.time-=1if(f.time<=0)del(f1,f)
end end function eg()for f in all(f1)do pal(7,f.col)spr(flr(m(163,161,f.time/f.time_max)+.5),f.x,f.y)end end
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
0fffffb11effff732cfffff648fffffd80fffffb11effff732cfffff648fffffd803a966ffffff0ff7aef40412386e57d9bfac621119d26c4b7ca2a972f8bc4f
bc14cc57ee1f8abeac3e557dd9f1cf1aeaf52ff8f7ec3c5ff4e3f86e13fa9bef94df1aeaf525f38acf31df1e457df3dfa7934ef938989bef9c37ddd87e8df3e7
932b9f74ef191360601299700b91363362fb87c6c1c9272f48b0127df3bf2db667df0717a4c3702d451ab057a0118dcf23fb82ffcce79b4294446e938529a246
1e91721663b9f7c89c3be9ff4fcd1bdf2fc12adf5e215700c02890733b7030f5ea27855b3195a8ec4078203e012cd4878d00f9f89478840fdbe207e7c9aff97e
a7fc72bf7cc5799f78af7e9a0e20f2316e71603ff079f70f2f78f5eababc67e179e9f7c3fc6b42effb946bd6bd6bd6311111111111119747b34e9dea84ef98f1
21772952e79057729b39cf179b324cbd5c6ab21bf34eb833c08df25400cf1fe176b22de5e506e94c994e63eb4434df366f7c3dc1ae884044429de070713b348f
50000cf1fff87d1ba8494ad3ee0fe317f3c2ed80c096bdeeb601c39988c2bd3602cf3693878f5621fe8164c8c46c0e707bcf2e01fac183ef1ec872d7095c3404
c7c4c44c1f383cf20093e0aabfe61b3e0def13300693932df40692287c37bfe9462551ea9f16ed3e0bf7cb7be10f301c49cc3cd09f54e893a1aee3fa7fef36ef
91617acb29f8be5979811719f18819cf6f7cf27d2fd67c779e2e9e3dca57873930e09c118bc7e7175883cf00785218f742772f437eafc971dc57e37df2feed4c
__map__
05feb167e439b8d50347089c8982265ee3706b0e3976ef9d247986e3f33c3f70f1835c62fcc0013e48c5c537f72ae593a4d7552647583c8e2fc7f18bad9324365d4e09afeb80c3b2d9eb707d12c63f92055e3b42228b0871410e45aad8e1876c8b27712c94cf4c1e5f8ffd4121216a495257264fe2250eb60a02af5c645cf1cf
d2ee38f107a689e8995435646260fc32069334df2dfa491fb1497e388a9e39440d86c177e0b8aef885003c3e27f545f78a3c632e7c57e71142450c801b8ff8a038a9ef76704daf2b4c78f3f941fcf0c32c3e92cb2f3ffca0f138c7a5e9c1977f360b7d370fff1b6ecf69878bf6f9221ee2fe239fb9fac7b6038b1d99fc31f1cf
fce3d1e9b4b23c49b6e4f147b6e4074736911d71a7ddb1ad47fc977622dff61cdbb1277e3a8e63bff471243f7cddea91c826b61cb03f323ee20afec05ee08fa88c4e4292fd22b13812c96396078950e20a2a8e4bb0a965b75abe2c06cb0c7af8842c6ee772ebd6c1c1b1d89149277ed81f65af63a96c3e1c2ad98f7ae9bf420e
589ff3152cef67cd09fb23db01ec1f1c23666e7d1d472acb93a64b1e47b644bdb66fdb77c5fd1cc7ae6dcf13ff3dc7b16bdbbbbdcf767c5f2c891f882479bb2e63c1a6b6dcb0648cb83ec05e98459cd9e7d8b19064a7c4e21816b325304288eb02ec8159c4b28a91c71f8ef458d4b6ee7ac39bcac133c77e09024fdc697e68e4
8f3f76f5ddf61171ed07c7ae28257f44fc920a9e912f081cb976d9f325fee94c3ecb91118fe4109223763cdcbf3c47de334f83e4879cd1cd718e606e314b7ec937e3fa38fe3896235df07eb62759e4aaed87f041b97ef049a4bae3b1e66231bf3aa29a372bf6647b67fb87e50abdd461de1e5748b784e77d34173b482a1b2c3f
3017998484248f65d1b47ed99eb99a646fe4603959308bf50b20939090272cdb69dbb635df866be4409a5f601f1c0764f6906d9bd9124b6a664b6212cf2f473c177afc4312dbb148da9ce80f9dc78e6b6be8118a17e7d125e19fe56121c163d6487a6c388ec50f32db8c10fb236923ec0bc77db49df7891fc2326913fe79db6d
db68f0cf2fc7b11faac12fb411ba00f7da6edb461bf481e338f647a4d9268cb8be75e438b6ed79108e6f37f9b61fbe6d07dafb6df7070deea3ed474386cd2fc9f11c6d725490c8772c92657b04c49ea41f4838eeb55d729e8eab49f8e74dbb6d7f441fdccfd3be51b89fa75d34d811df95eb3884b6e809478f89345b8410ef2f
fafdf1de3d1fc976ddff5c1afd8e2038f38b3c2b8eedfa650e33cc4ed8464ae57fa6e41069f7cb735bfe70ecfce552c4d9e3f411e2739f174cdce4f00809f9ff073ff8a1dd2fdb3e7174ab88c7731c3b441c629e63838aa7db81791ccfd2127eb0c70ff30f5cf1f8250887fc4184f1327e80a3e8f28be487917a88e71f44fcb0
602e017210c01fc012e29fa59273921c577c7994c7b3eb3df20c8ff88ce607173efc21cbc32046bddff448f289f80edfb1e31f39e11f112e7f70a9884b76fee332bc3cde6ffa25f948ec388e5f72f1388ef6f981f7ca25218ecb71c01ff6645cd4f79232957eaeeed6fc7266125ebbc4718f93783b2eed1d61fd21c762004964
fffffff07fea4f104238cd6597efba5031973655d791aaba9e5c86ebcbe955d79baabaeefce00f75fd92aabafe49cf6f87e717bff8479e99c93333796626cfcce499993c339363660ba85dc600c6d8b88cb1d965a142c8ff78d71f2f97fea10cc2307e99477e50bf58982861469858fc33ff68943908c3f861fe91a83f2c4c94
3023cc1fce489f5639edfde3e4f5fc735fceb8c0c1e59f70c625454461d00370f9673c51ffc02ff008475cfe103fc4957f363fc4e507f30b11621f3970f30beff1c78efcf1e4380ee79b7faee78febf8ec785e7e58de43f7f517398f91eb0c324e1cb9a74ee34d7cbbae2687f2595dbb9e26ffa83c6ff20f9f5f2affb48e73d5
5dff547e49e1fe2147ffb8fa5e897d795dfbe3f48b8352feb0f345e038ddf9c10e2749c42e0363e083e7f827f9c43fc4fe114ab8899d3fe007b80ef25cec9044ec9f8c7f9825b820f7fc80a7cf735df3a46dc6c7e69f1dc738793cbfe0a062f6cf3ea9ac49643f787c38f047240f3f60f18bf2cb5c8904474e891193ecf1be9c
b95cd7f97d349451b9ebf4995fde8dd83eb227af675f74f9c1920c95579644de408ef8de9cfe91cf459e47ea140401dd91e420fe104982e4c00f24d9f19e4becf28ba44b6e3b7243be3efef071e24b5cdb157c26765c39f6811b12407c6028c8f10f7e813c921fc43ff0fcf398a4df363f645edbb28c39cee7ecc1c16387287b
cd210b14f698fc22020b36635321c8c73c72fc81187f24fe807d621f6cb99a01e09a1d7ddd3c47727ecb735cf394477240d997ec9f2c5f3d7ac891a72f9e68f38378548f593bdb234e0948fe50ceb872953bae34fc43722a480ee589e4f40f579f6baee36a5d8e5ebffc73ccc3299e607ffc816f7ec87ce28f79605f6c5c701c
7f7cdb9c7303c4fe90e1088e2bd79bbc4ac2e00741f047727b5d7335f12ccf9dc47bf885f003c7846e3f6472a99c062e8e09013de097c17861e72f38c1037620af27af62e7e6bcb54f9a5f3c4b2481900907ec8730bf383c579e5fea12e2807d1cb9f2b82ef77cb05fe2c83f67e1b85cf34112978a63721c965c22811fae5c00
9705d4f9380260dea7f0c7e51189f05cfce38f7f739d8fcb95e48fa8edbcf9001e5e7b2ffc01fe011f18082cc3035b70c33fc9711dfb61e7fed83f8be7877c3b3f5f9ee3dab5e8f35c233ec7f1ec3992c393ce916693f09cf6c3f1aab7c88ef58ffbe4a6fcc13ff69aed0ea71df9835fe4a6e480bdc167f39a14436b72c87dc4
4e983fe68f479281f33377f461f68b70d9917f4cc738f4c8e2c9bb378f9d7d4d5f4e971f96f8ec87ebb1133bf3489215baebc261fc02fb017e502a2bfcb2e30acfdcb09b61ff30c89ee09315833ffef8f479f3ccb1ca71783e7bef8b7fecf20fe48744c041f8077c903f8eec0ff805b620e01f8b0b7aec1c8be73fe7edfd4764
abcb8e833de070fd63fff2ffc7f2f9ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf1106f864fffffff07fea4f1042386597badcfe1e49cca54dd575a4aa796ccfeaba7238d4f5e573aaeb4d555d77aaeafa215575fc915fbcd4f1
cfaad471ac4a1dc77a1d1c1e7ef08f3c3393676672cc6401b5cb12031b33c666975d76190bb185271c4364f2e3feb92f871f9e24fed0ac8143f647926b79971f32cde2f21d7fc41cf8279601f2e5a96b12d56c8143b6245dde5f92fce2ca3f71793c691cea8925e0713cd9ecf96ee70fff9cfacffdc73f8e7ffcf30fe7f27edd
2ffbc796cc1f76beb388c52ffcc16696c4f14f329288259931f8966dfb61d93fc31f160fb15fc42e0199e5873fb65ffa4f973e8ffbd97dfbe7eb638c83270403b0fb143f3c0c527201b0839810384b300ef0c3ae8a13fbe05962c17778fea927def3d3b3e7d1d23cf24f7b989de08f589e67cf237a1d3e2e9fef17d74384109b
632e07cb97676b779915fc9267bff867d38610c9e61f873c299faf76e43a3fcf95c6e3fb8eb3d7915b1c3cfc637cf9ecbe77dd0727a7edb8a46f00e3a1982f79ec7b67c9b10a01c97cb2077b31c7212f3b92e89c8778546edeb43ccf775d49ca61c70fffd83ffec184d975cefe39fe019924629f0f87cf7ef8215c0483d8cc62
182c9249f805fc4312b14ff805137fe43b77be5fdf7c39dc67385de449f68f2d87cd3fc9c4e276ed78f578b938ec8f671a884ce7ceb7f64efae4d91feff287cec8128b59aed8d1d31c755e59fe48f3831dc13fcec7d5c3f9bccec4963ff2f24bb23ff6f4dbbe79fa0792e50fc97d4b7e8944f9239234243ebbd5b7ddaffd32d9
3ff96fdfd1dedbf183f9be5d6f93549e264d466c3fb0e7e0cde3717a76f9ea3acee635cf1fa279fdd1f3783dcf4925dccfd975fda717d1fce31febf0873938a42b254be4a5ebf53563118f37db1f599e497ec9af7ed9f603e2768ffb3ef6d88e1fec9735cfcefc737c9e6787d9f4488ad4021174c0e6920ca90522e880817893
dc891f767c785c718292eccd75dc59793c8ecf1f638d8823066cc184ed85921106f1269178b3fd0325b330d8fe094124803ccfe98940ccb3f775d51fd63fb2ef497c927f98313f1cc992fcc2f4167740f64f667ffc805f327f2c00d4f383ec6616b14c0fdb17dbc7f235ee7cb848f8075c73369d3392b387c777f8c5bc1244e6
ce846c597e39e2976557d54abcd993dbfe585239962dc491f9a3f165c92fd25fb2fd71c51ff303e1242c3c5e39d885871d3eef916bffe40f3f8834a4fe819732c6c539ec87a7f60b7403a3c4e20a9210c824ff5898f00ff887607eb138edf54782bffe70f972fa767cebd703965cdb2fcfe1383d3e32ecc5f8811fec73b0c41c
8f7807ec8f70dc23e0dd168e6173c0fe117b94d3e21f6a318b9b08fde3b91c3f7cdfbee479385c7bd7efc06375e5f18ff9673ec61fc4f14ff881815292865fc047c01cbf8c237152421d49fc30618c39327e9880eeb8306e7ec80ffbc753df991e8743589223c96573dbbd6fde583c760aef7c973ffe7292ff89e774bf9ee8ae
c77ae038aee7f8637ed0b77b723dbeebc0ffe097fbdef56def71ecd8f6c39e39e469ac891f8e1c53792a7e49f2c7ba5fb61d4b82ffc191eed826c7be6dd78ebddd34f6245647ae76fef8e5725a76fcf139d7f7f609c2b1cfc7b5ddd8797214a7206221c40fa943b857224138f607d826724a210724243f9cfe982ec70f69b246
b99677bfcbff3fcb0f573c3b7ef1c799ffffdfc8fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1b6100f364fffffff07fea4f14023876e5a9fbdc2622ae75a9ba8e3c2ecde3f198ebcba9aa674a9eeabb9256ef95b4fac3fe20adfeb2b751fd2513d3e368a38e
7fdafbe0f030973c33936766b29905c7cc668c8d03c60e9648262c13b619b621f18427c432c426ff7d3fec3eeafe83b8f68f2d71adb67fe21a5be2d81f1602939026b65d9b38d4465c9b2d71ad3671adb6c6b1c3426012d2c4b663d0e7cae17a8ee3f8e59f3fec977ffee0e1253c04841f081fe10f101067fe79c5c4f147ba80
0f140304644208219c24090bcc99fc2396d8b5e507bfec1fff1cb9ae4a72da2f39b8edb8ff918ac825c71fe617bb3894180bf148242162830c928844442247f8237cf307b8592298c326821fe49773ff5c4b8f38da67f17efde31fba269ecc058b647e61ee230fc7b1c4e2c3716511f2a6d02d716442fc10362f430eaa999bf9
431cde1f3ef27d72451c39729d89ce3ff3cdb7fcb02339c2c575e5390e1f6f434693c4985cbe278e0071877bb9228f1d9f1c24541c49ded9e4f23db6381232d82f278fb7c7bea412992d1a4d882dc9b30cd9940d1379aee338126f677de4795cf1cbd1fde0e86507887d0262b74cec8307897090447889112e62379603b10cb1
5b6c628483d8013f80d311af588597b8ffe087eb699f1fcae1726c3d02ebfdc89166723c3e95897b2e9244a4891c10fe188324603e891c9048bc739204fb032e0b821fdeecfabee3c8f11c0edb3fbc3f1ccff383a34d34401c492479b31c5c68134917e4699e25f2ee3dc2ebe8957832219e847996c843dfc43cccc41feee70f
__gff__
761ef28d68fec9b738affc22412c9ec51f991fc8aec4394f1ed7f3ec8c63d150d7c5729163897f264ff4950995d9f134cfe389f3f9c192e7c9be507f84fa619268e297c9135774f14fa87f2e590e92253279e29f673d2e3f9237477e28d9f1be6d4e5d7ee8e6fde19127125ddc891fb25dcc0fe287b0b8234bdeb0e40803e298
844a184448f20564bd9fbc3b767e399638ae5faa8973fe19b1f808f867f97ec90a1f0684c083c180e510e75c41e035aec419045e21f008829ffc739efeb9975f721c4fa3f791739ef9f883cd38f90173937f9c9763803fc02ff3cffcc2c41b858dd9e99739c171e0d80fbfe4ed0f5b6cf9e3390f9ce0b4f778ec07783919ecf1
__sfx__
4ddb3cf3387362977112e10389702b3740ef663ef103d3101ba1719770096610272438a0124c4030770213100f0400cf241e847213170e7730ce11187720533233d0707a630fe341731435f711cf661f4752e227
fc4f5cff0c94701e303f94707e302b9730943121b061961602f14017063df063a86700d4525f0620b121826438043391611f7733f2632804137c3027d5723d7529b033d7131f971244743ac741ce771bc3525c30
ef1ec9c417c112b35732f303ff771f3403ff773f6013ef773f5123cf773f33438f773ff6030f773f75121f773f73302f773f77604e773ff7508c773ff73110301d6163ff773fb073f9560f9002450235d121da63
fcffa3f715b24047272470729e560bd7323530339613bd2535d3607e360f6611e6733cb0607447261320fb6424f411926333c112713632b640c97119e44334133913626c340cb043004123d132b9600d3413b860
d03fccc33cf063d07437477388370b13126703192630b24732b2612c7324b44240223b25111c7018a260ab242ab45322030fa542474504f412bc111c707395222f1610e54009b710613511956197702fd3703e67
7812b1ee38f16089740bf470477039a170b177187721c6572a434282643240602b4511a6113a242f01022d13099721c4652e6753477033e6609c173cb1538f023296711a4332c7123d5705703276122e36339f06
30883dd920e440fc540b1623112639f1421840248113887538a171b1731be151fc311dc3411e56218703f83123f702443622f51377443ee543bd673056107b3335b022b671021010732321407261750981607636
c51f76873d3213b82532925227700b673321623bf0619f0626c661f0463f1040f7163f2271b6732265314a3301b7004261234622cb441f02631950074433fc3008b560f671361573cc6535c120ee370917622d54
d7fe59363d4540a67538c62215213d70405c52187161901606c523900204331367620e6003163331a41230041286222f7138972247072d3431ae541bf761b7673dd4317e343335217467254470e27339b1631171
99e407d1095131ba261fe261f8160af260c701323650fd210b15507a240c76207b153ce410db6720c43086140fe1607077398751d4361fa363bf3239f301f92607632397343c3030a9170f247276502387139716
d9891d62093271ee451867700d32339003b1332736639e7101f2638f060b7351f177390110f7563f0670b9301f8333f9033f9643ec061f66212266093072d577102063f20630a413dd621d94509e6713d401af33
2111fb03276343ee343797129a5636353337633cb110b56707612277530e86003b632031721a2405c731c3420a06418e5109406069432147007610359000d94718e67317213c9202c36736622399533ec6532327
17bccbbd1e0073087101e43314332c730387203c70002c5705c1024c201b8632072017156180033fb002034513c753f85523f302f5442257516e523bf162b1762e6123dd1303077186511267722b510c77020b71
61ef6b10075113f12236223097221ef472341731c7324c4704931091772891708b3631f7529f561ee3739d723ec332f4732c7172cb2601e67110673065228c031f92017033201633065002947012452714304803
c00ff6fd02764387100043206b072df4332767173231fb261bf173c6733c2743b8721bb703f9450de67036670277330a5115070279261787630e042090322d0038444399141e843017300a07518f601d6303be30
37c2ffff301433ed4721b47258560b5312fd6630b672bd773fb401f1173bf773ff6030f773f75121f773f73302f773f77604e773ff7508c773ff73118773f777238673ff77069473ff770da073ff771bc063ff77
697995332f9203ff771f3403ff773f6013ef773f5123cf773f33438f773ff603080604e773fd160ff763ff7723c662eb0700020060400a8700d602355671d5551955709e50116022403228052126641553701607
b0b2b4b625d3628b560011404134081540c1741011514135181342f556056332d5102011624136281562c17630117341373810301a1004a3008a500ca7010a1114a311822421d0622b2620a1224a3228a522ca72
3d3e247d38252110112281404b3408b640eb0512b2516b4538403320161db551e3551a2573eb5322417014411a0600e010054402d4773905302d102d0720a40129411154311d0711c17532b27363411b4613fc30
7efbebf73e9473ab67140311ca71340333ca7300f14057633540521e12256533d73209911244441222233927389723e4733cd363bd7730f342fc4727f323f2771b9773bf061f4733eb453f4773df37277523f577
fddffe7f3ff041f4733d7713e7313ff703c7743e7723ff672f17738f063f7173f7761cc7723e573f7071ff671fb753ff323ff253f752099112444412a263f9373fd571ff673fb7707e7707f7725f77337773a777
e3ff8ffc3ff343fe733ff363ff143fe772b7713ff473f8673fe671fa7727f770fe763f7003f8273ef733fe773bf753ff352ff77293571f8773fb042f5773cf7703e773fa073f7713ef7704f773fa473f7513ff77
feffd3ff3ff113ff7332f771f9773fb643ff73199770747327b573f7533ff713ff542fc772bf773fe073f6443e7343fb24389663ff373fe771f5433e7360f7703ff533f6773bf663ff773cf7721e773f9273ff31
8fff7ff21fa573f7353f7772bf773fd673ff033f77736f7717b773ff512bf770ff673cf772fb6539f673cf771bc473fc7731773196713ff473fa673ff633ff7737f7707c112444412222099773ff063f7753cf77
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
d9fcf1c33cf773f33438f773ff6030e773fb1135d341ee3639a573cc5531f263c9733de7437e57116710ee150e67336f3038e533dd11235772c7303fa473cb1633b461547707f232d5533eb4721f311f8703f177
8f3c3f7c3ae740ff5411c2708e17076663f06627f072d7271fc5727f263bc7523f6523b552f44712f363a73636766365410fc131f97708c303eb1612430172663b065397123ec7720b270b6522eb632f7703cf16
ae23f79b076171f9703bf3034b77257431dd741be47217173cf173c7160e0373fb061f2671177324d751565616f273b0161e6442fb240773227f413d1321365637f452fb67037271df732c717317303f0013b263
f2bd567f3d7042d37331b5727877383753a5431e6773a1053907710d3303b721d317049572e4333f6531c077311530977039704329603f0631c3373ec7138c1607c6003e353b3473ce650f8370ff1731d070fe67
00000000380733fa61374073d71734f7138f042ea6701d113d1611c1713fb44375223f3651ef433f9070bf411c743327143371437f142ec5321f161783423b54117653fb252ea670203000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
0d 07457803
0e 5a616130
04 47080745
01 38607f00
09 583f5f6c
09 7b0c0e70
07 42623025
09 7c413809
0f 5d097d01
09 67073f1c
0a 5e6f0f47
06 0f57723d
00 3e67765f
00 7f3c7b7e
05 317f3c1c
09 070b5c36
0d 1c1c0c01
06 21010e6b
01 71310e32
01 03117200
0a 663f647c
0b 4078057c
0c 4228246f
0f 4271477d
0d 74390e63
01 48234d72
0f 5b793d1c
0d 490f275c
0d 22724b71
07 0b65303b
0e 37401018
02 4c104f12
0a 22561129
02 24194c10
02 724c1f61
0a 7742097b
00 6349442e
09 71482564
07 5e77663c
09 0e1c0f27
04 4a3e1e1c
07 7d764f3a
0d 0e547658
06 01013023
0f 1b353c14
0a 4a020742
05 0e1c0735
04 0c197b05
06 2b72031d
02 6933157f
06 046f2679
07 1a0c7969
0c 39274f62
09 1f5f727c
07 1268722d
05 7921282c
0d 09431712
0d 6862664e
03 13734b6e
0c 797e3163
0c 4e747903
0a 78474272
06 2c4f3b54
0b 121a4573
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
