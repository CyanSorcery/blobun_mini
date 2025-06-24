pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function _init()cls(1)?"loading...",1,122,13
flip()memcpy(32768,0,17152)F={{},{},{},{},{},{}}ff,fr=0,0local e,f=32768,%32768while(f~=0)add(F[f>>13&7],e+2)e+=2+(f&8191)f=%e
ft,f7={51510,27795,14025,37740},{32769.5,42405.5,60855.5,-.5}f2,f8,n,T,U,fe,fn,_,a,d,fa,y=0,0,0,0,0,true,time(),0,1,{},false fu,fs,f6,I,fO,fh=J"0001115525511125",K("3c26915154",5),K("13b49a5d6",3),J(I),{64515,-925,-829,-733,-637,-541,-445,-248},{64140,63686,63880}fP()fQ()fR(1)fx()end function _update()fe=fe==false U+=.2U%=4f2+=.035f2%=1n+=.15n%=32T-=1if T<=0then T=14elseif T%7==1then L=true end fS()x=max(x-1)if(btnp()&48>0and x>45)x=45
if(count(d)>0and x>10)x=10
if(x<=45)_=min(_+.1,1)
if j~=nil then a=max(a-.1)if(a==0)local f={fT,fU,fV,fx,fW,fX}f[j+1](V,fm)_,a,j,V,fm=0,1
end for f,e in pairs(d)do e:m_step(f)end if(not h(4))y=nil
if(y~=nil)sfx(y>>10&63,3,y>>5&31,y&31)y=nil
fn=time()if(fn<0)stop"game has been running for too long. take a break!"
end function _draw()fY()for f,e in pairs(d)do e:m_draw(f)end local f=j==2or j==nil and count(g)>0local e=f and V~=nil and V or q or 1local n,f,e=f and fs[1][e]or 1,fs[2][e],64*cos(_*a>>2)if(e>0)rectfill(0,0,e,127,n)rectfill(127-e,0,127,127,n)
if x>0then local d,a="stage "..C,cos(abs(max(abs(x-45),35)-35)/40)*64-64local n,o,a=a+8,a+9,m(d,a+12,97,7,f)line(o,105,o+a,105,f)line(n,104,n+a,104,7)m(i.s_nm,n,107,7,f)if(e>0)?i.s_at,n,115,f
end end function s(e,f,n,a)if(e==5)M=f f=nil
j,V,fm,fZ,x=e,f,n,a,0fy()if(j~=2)music(-1,500)fa=false
end function fg(f,e)fS,fY,x,g=f,e,0,{}pal()end function e(f,e,n)fp(6)fw(1)fv(1,0,0)music(h(5)and f or-1,0,7)u=0fg(e,n)end function fx()e(-1,e1,e0)W=90end function fT()e(0,e3,e4)end function fU()e(4,ef,e2)local f=fk()b,N=mid(1,f.world,count(r))w=mid(1,f.stage,count(r[b]))u,A,D,e8=0,0,.125,K("13b224cd02415d6d2494",4)end function fW()e(4,fz,fF)M=nil end function fX()e(4,fz,fF)end function fV(f,e)fg(ee,en)local n=ff~=2f=mid(1,f,count(r))e=mid(1,e,count(r[f]))q,C,i=f,e,r[f][e]ea(f,e)fo,f_,X,Y=0,61936.8827,0,0g,k,l,Z,fd,z,L,f1,O,fj,x,B,fq,P,E,f5,f0,Q,e6,eo,ed,e5={},false,false,false,false,0,true,false,0,false,fZ==true and 0or 90,0,false,{},{},{{},{}},1,i.s_tl,fA(),fc(),G(false),G(true)fw(2)fp(f)if(n)poke(24405,0)local e=K("2854ef234924d6d54924",4)for n=1,4do pal(e[1][n],e[f][n])end spr(1,8,0,14,1)spr(16,0,8,2,2)poke(24405,96)pal()ec(f)fv(2,96,0)
local n,a,o,f=i.s_d,i.s_w+2,i.s_o_c-1,i.s_o_s for e=1,#n,2do local n,a,d=c(n,e,1,1),(e-1)\2%a,(e-1)\2\a v(96+n\16*2,n%16*2,a*2-1,d*2-1)for e=0,3do if(n==2|e<<5)f=f..e+1 ..sub(tostr(a-1,1),6,6)..sub(tostr(d-1,1),6,6)..sub(tostr(83+e,1),5,6)o+=1
end end for e=0,o do local f=ei(sub(f,e*5+1,e*5+6))if(f.type==11)add(f5[1],fB(f.spr,f.x,f.y))else add(g,f)
end for f in all(i.s_hn)do add(f5[2],fB(f))end end function fB(f,e,n)local f={dir=type(f)=="number"and f or c(f,1,1),x=((e and e or c(f,2,1))<<4)+12,y=((n and n or c(f,3,1))<<4)+12}function f:ondraw()fi=self.dir spr(fi%2==0and 254or 255,self.x,self.y,1,1,cos(fi>>2)<0,sin(fi>>2)>=0)end return f end function fP()local n,d,e,f,a,o=r r={}for n in all(n)do d={}for n in all(n)do e={}f=2a=c(n,1,1)e.s_nm=sub(n,f,f+a)f+=a+2a=c(n,f-1,1)e.s_at=sub(n,f,f+a)f+=a+1e.s_w=c(n,f,1)+1e.s_st=c(n,f+1,0,1)e.s_gt=c(n,f+3,0,7)e.s_dt=c(n,f+11,0,7)f+=19a=c(n,f,1)*3e.s_hn={}for a=1,a,3do add(e.s_hn,sub(n,f+a,f+a+2))end f+=a+1a=c(n,f,1,1)o=f+2+a*5e.s_o_c=a e.s_o_s=sub(n,f+2,o-1)e.s_tl=c(n,o,1,1)e.s_d=sub(n,o+2)e.s_h=#e.s_d\2\(e.s_w+2)-2add(d,e)end add(r,d)end end el="4fe5729bd9f69189773150d1dfc52318"I="55332"r={{"6tadpole3ashe601004.8344002.8344c3010023120130231331321310300403500510600100b3101b5100b0200b1203b3301124e4e4e38181818404e38184033ff01ff13403321131d010b01ff3b3301ff0cff01ff013b4c3101ff01ff01394d4e4c41414141414d4e","bplaying card4riley302004.8344002.851160000100203302313210100000123818181818403321ff01ff3b33ff19ff013b33010c01ff3b33ff01ff013b3301ff01ff3b4c414141414d","6big can3ashe542009.1010006.584480100200303400413512522420101000284e3818181818404e38102101ff01134033ff01ff01ff013b33011901ff01ff3b33ff1aff01ff013b33011a01ff01ff3b33ff0cff01ff013b3301ff01ff01ff3b4c3101ff01ff394d4e4c414141414d4e","efractured floor3ashe605006.8344004.836160450551651642633530504500a1160a6011a2540a40251e3818181830181818403301ff011a25ff053b33ff05ff121b01ff3b3301ff01ff1214143f3614141b01ff01ff3b3301ff121b01ff013b33ff01251a2101ff3b4c4141414b4141414d","btwisted path3ashe504005.3344003.334431031020010100300154e3818181818404e3810ff01ff01134033ff01ff19ff013b33010b011f0dff3b332101890cff013b4c413101ff01394d4e4e4c4141414d4e","asilly swine3ashe603007.7010005.501141051041031020100500223818181830181818403301ff011a01ff013b33ff0bff0cff0bff3b3301ff89ff89ff013b33ff11142a140dff3b3301ff010c01ff013b332101ff01ff01ff3b4c414141414141414d","ccompact pipes5autumn450004.6677002.767730021122110500200a2220a2022a4200a004211381818181818403325ff65ff013b33ff89ff89ff3b3321ff65ff253b4c41414141414d","dspiral portals4riley634006.8344004.867762331230220323423430303300a5414a14541e38181818181818184033018901ff0189013b33ff0111140d01ff3b33011901ff0119013b33ff0cff21ff0cff3b33010501ff0105013b4c414141414141414d","cstylish bunny5autumn632007.4677005.501171560551652641542531430305600a4020a2040214e4e38183018404e4e4e3810451a4513404e4e3301ff1aff013b4e4e33ff010c01ff3b4e381001ff01ff0113403301ff0bff0bff013b33ff01ff89ff01ff3b4c31ff01ff0121394d4e4c41414141414d4e","dtricky portals3coco411005.3344003.567770321421412403302312210503200a1220a2012a2322a222315381818181818403301ff25ff013b33ff018901ff3b3301256521013b33ff016501ff3b4c41414141414d","bsaving space5autumn549008.1677005.901031030021120100300244e4e381818404e4e4e381001ff13404e3810018989ff1340330189898989ff3b332189898989013b4c31ff898901394d4e4c31ff01394d4e4e4e4c41414d4e4e"},{"cbarrier break3ashe406005.6677003.667720011110100100174e3818181818403810444443013b3321444243ff3b3301ff0143013b334301ff43ff3b4c31434343013b4e4c414141414d","estaggered coins3coco627005.8344003.834421021010100200183818181818181818403362ff01ff01ff013b33ff0bff62ff0b623b3321ff010b0164013b4c3101ff01ff01633b4e4c4141414141414d","btoggled tris3mika536005.8344003.834460030131232222121020300300a5300a00531838181818181818403365ff01ff01423b33ff44444343013b330144444343ff3b332101ff01ff653b4c4141414141414d","cmasked hearts4riley535006.1677004.3177810310210100001032032122201003001a381818181818184033040401ff03033b33040bff010b033b33010201ff01ff3b332101ff01ff013b4c31ff030301394d4e4c414141414d4e","cdiamond coins3ashe607007.9344005.684460240340440541641630102400233818181818181818403301ff01ff01ff623b33ff6464016363ff3b33626464626363243b33ff01ff23ff01243b33222321ff2424013b4c414141414141414d","9swituation5autumn451005.1677003.167723220230102200143818181818184033024301ff423b33ff010444443b3301422104033b3304430402ff3b4c41414141414d","ekey to diamonds3ashe637006.1100004.5100510310210100001002003009209f193818181830181818403301ff2c1a2323233b33ff01ff0c2301233b3301ff018a2422243b332101ff192424243b4c4141414b4141414d","dtriangle coins3coco626006.5011004.5011616316226125124133101063001c3818181818181818403301ff01444462633b33ff01ff01ff01ff3b33646243ff4243013b334264ff62ff43213b4c414141414141414d","dunlocking path3ashe608006.3344004.334472232131031021010000100402300a4121a21419039f1b3818181818181818403301ff448a44ff013b33ff01050b0501ff3b3301ff014301ff013b332c012143ff01423b4c414141414141414d","dfractured isle5willow620008.8677006.351042662562462360506600a6100a0061a0664a6406273818181818181818403325ff01444442013b33ff01ff444401253b36141414141b24243b332242ff011a24243b33432323441aff053b33432323441214143f33052201ff01ff213b4c414141414141414d","atoggle maze3coco612009.8010007.234462632532432332232130406300a0522a22059359f2b3818181818181818403344ff626301ff433b33ff01ff63ff01623b33012205238a23013b33242424448944213b3323ff01ff43ff423b330501622cff01ff3b4c414141414141414d","cnumerous keys4riley633009.8010007.1177524323322321310304043009629fa0560a60052b381818181818181840330303014442ff053b336201ff016264643b330144444343242c3b33ff0204012124243b33626363632289013b330501ff018a23233b4c414141414141414d"},{"ewatch your step5autumn330004.3011002.5011410300211221101003001038181818184033014201ff3b33474443013b3301ff43ff3b332101ff273b4c414141414d","ccareful moves5willow518005.1677003.1677414314224123101043001438181818181818403301ff01ff27423b33ff23ff0124433b4c3123014701394d4e33232227213b4e4e4c414141414d4e","cdiamond house3ashe509006.1677004.1844215415301054001a4e4e381818404e4e381810232313184033ff012323ff013b332224242424223b33ff47ff0147013b33010701ff07213b4c4141414141414d","dforbidden path5willow439006.1100004.11005122021031341242010220019381818181818403323ff01ff233b33ff014701ff3b3301272107013b33ff010701ff3b3307ff01ff223b4c41414141414d","fkey in the woods5willow440006.1100004.5100524413403314324202044009049f19381818181818403366ff01ff463b33ff01ff01ff3b3301ff01ff013b33ff018a01ff3b332c0601ff213b4c41414141414d","9conveyance3roxy528006.8344004.8344510410310210100001004001e38181818181818403301ff66ff01663b33ff664601ff663b330166060601663b33ff02030123223b33210303ff23233b4c4141414141414d","dunstable floor4riley417005.8344003.8510400401402403401004001a381818181818403301ff0144443b33ff014244443b334343fe09fe3b334343ff89ff3b3321ff0109013b4c41414141414d","atiny cracks5autumn352004.3344002.3344201302304013009319fa0330a300310381818181840338aff47253b330966092c3b330147feff3b332521fffe3b4c414141414d","cdigging holes4riley638005.5011003.5011303114124001031001c3818181818181818403343ff014201ff443b33fffe092109feff3b330109fefffe09013b334301ff42ff01443b4c414141414141414d","aforest maze5autumn531006.4677004.884441040033130140500400a5100a00519029f9549f1f3818181818181840336589464646273b338a03ff8aff653b332cff010926023b33ff0404feff013b3321ff4709012c3b4c4141414141414d","bmisdirection3coco829007.7010005.501160031132121020010110400300a2300a00239839f2238181818181818181818403325ff01ff06ff43ff223b33ff0144231924ff02ff3b33014442230c240404033b3321012501468aff032c3b4c4141414141414141414d","ccompact curse3ashe745009.5677006.867722103000601000a6101a01619229fa7404a04742a381818181818181818403301216209242422ff3b3305fe8946464605013b3323232cff014346ff3b336442ff01ff4289423b33656462438a6362653b4c41414141414141414d"},{"dbring the heat3ashe416005.1677003.167722232130202300741e714381818181818403301696969013b33ff0a0a0a283b33010a0a0a013b33ff012101ff3b4c41414141414d","acold circle5willow519005.8344003.834421030020300300a5350a50531838181818181818403301ff696901053b33ff69696969013b330169696969ff3b3321016969ff053b4c4141414141414d","bfrozen water3mika624006.5011004.501122632530406300811e8a1260a60121c3818181818181818403301ff696969ff053b33ff48acb5a401ff3b33010591968dff013b33ff0169696901213b4c414141414141414d","cnot so simple4riley546005.5344003.851021120110401200811e8a2201a01221838181818181818403301ff01ff01223b3365488eb0a4013b33232165918dff3b332323ff01ff873b4c4141414141414d","ahot diamond3mika523006.8344004.834443003010020120200000724e71e381818181818184033210a7a8272223b33ff01578184723b3301ff017c86743b33ff0189575c543b3323ff28ff0a394d4c41414141414d4e","afreeze keys3ashe644006.5011004.5011216316204063009009fa1260a60121c381818181818181840332cff01ff01ff053b33ff0169692324223b33010569692324013b3322018a01ff01213b4c414141414141414d","alava bridge4riley647006.5677004.734431622611510406200810e8a6303a03631d4e381818301818404e381048241a24ff134033ff01ff0cff01ff3b3301ff895089ff213b330501ff19ff01053b4c31ff221a22ff394d4e4c41414b41414d4e","ftiny contraption5autumn253004.1100002.344021231220502300701e7821e8722e7813e80d3818181840336969503b332850483b336989283b338748213b4c4141414d","9lava coins3coco625006.5011004.517750031132121021010200300730e71c38181818181818184033016201280a620a3b33ff24ff017a72223b33016463558077523b332164236257540a3b4c414141414141414d","ahot springs3ashe810010.2677007.334421010000800100811e8761e7813e8a6320a2063a8404a04842d3818181818181818181840330166050606220606663b332148acb5b5a4285d693b3301ffaeb9b9a6235e693b33ff489196968d0551693b332555520a0aff01ff253b4c4141414141414141414d","ccool crossing3mika622007.9344005.684440020121221210600200831e8712e7814e8a2562a6225234e4e38181818404e4e4e4e3362ff013b4e4e381810ff48461318403321280a896962053b33ff4669896901ff3b3301488e928bff013b4c41310501ff39414d4e4e336363623b4e4e4e4e4c4141414d4e4e","8iced maze3ashe843012.6010009.101031061050040800600720e7881e89339f764e7825e8a5503a0355393818181830181818181840338e8b280c23fffeff013b33555f898789890901483b332351010b8722feff013b332506062c66110d8a394d33016969ff06ff28ff3b4e33ff5048010b257a723b4e3321ff018e8bff57543b4e4c41414141414141414d4e"},{"dfollow the gem3ashe841010.9677007.9510336126235209061005210654107581015530050405525045550257703304e4e381818301818404e4e4e381001ff0cff4a1318404e3301cf01ef0121012f3b4e33ff01ff19ff01ff013b3816140d011a0fff01ff3b33afff01ff1f14140d013b33ff018f011a4fff01ff3b4c31ff01ff0cff01ff394d4e4c413101ff01ff6f3b4e4e4e4e4c41414141414d4e","dunlocking gems3ashe714012.8344009.2844230030109000005200755006572055230054303504015260254604383818181818181818184033214aefff43cf44443b33ff4aff01430144443b33014a4a4a434201af3b33ff010f236f0403033b332fff0123230403033b33ff01ff232301ff013b3322ff4f238fff01023b4c41414141414141414d","boctogem maze3roxy613011.2010008.201051631621612602500b063005300756000513065530156402505055450451603a6606a06663138181818181818184033224a23ef01ff0f3b33ff0303030404ff3b33240303030404013b3322cf2302ff2f213b3301ff01ff43ff4f3b33af43ff018f01ff3b33056f44044204053b4c414141414141414d","fice fire islands3coco848016.5677011.984431841831820c08400501069419f5720051305773e754407574015060458602807e854803484e3818183018181818404e38108e991a22460169134033cf46880c2c242424693b33018789ff8969690f013b33ffafff19ff01ff28ff3b33acb5a41aef4a8a2f213b3391968d12140d5d11143f338fff894342556d524f3b3348010a43ff895e0a0a3b4c310a0a436f55530a394d4e4c414141414141414d4e","ckey labyrinth5autumn754011.2010008.84404144143142041140440050007521049619f9029f822e8542009139f52305a3362a6233563019349f554025150653503a4531a31459559f775e7313818181818181818184033ef698a4a4a8e8bff3b3369018f45ff012c013b332c69488a0f5025ff3b33ff2caf25ff8a2f8a3b3389468a2c214f01ff3b33ffcf696f452cff283b4c41414141414141414d","bweaving path5willow821017.3440012.384431871861850a08700700e79439f636e6837e8a0834a3408818e8a8882a82884a38181818181818181818403328ff434301ff7a720a3b33ff01ff01ff017c740a3b330142aca4010b5754453b33628e958d2c03ff628a3b3614140d2519ff6969013b332201ff011a01ff01ff3b33239769080cff2666013b33ff886948ff02ff01213b332548626301630163453b4c4141414141414141414d","bfour islands3ashec15030.3344023.734420873971608700690e6a5180a805157105583065040455403845e89179f54702ac8c4ac4c882ae873ae752b0157b00a1c15a151ca8c4ca4c8c5bc07834e3818181818404e3818181818404e38102201240113301045082422134033ff01ff24ff451aaf2424ff89233b3301ff012489241aff87ff23ff013b338e8bff01ff011a23cf01ff04233b338fff0a0a236f1a0223ff0423653b4c3125ff0148394b3123010423394d4e36141414143f4e36141414143f4e38102c23234f1330102101034a1340337a75587d82721a0201ff03ff653b33575487575c541a0303030301ff3b3301ff482801ff1aff01ff8902043b33ff8a2f2223011a0fff660401ff3b4c312501ff05394b3105464aef394d4e4c414141414d4e4c414141414d4e","bvictory laneacyansorceryf55040.6780032.5344902c03c14c24b13b23a32a22b11b1a02c00611e6742e7692e69f29f813e85b305594065d504717e7577078c7e8ab8b5ab5b87e8e756a015ec0390d9f54d00a6dacaac6da3e1aa1a3e59e02afefbafbfec24e381818181840381818183018181818404e38106264640120102201231aff01ff011340334208ff01ff1a248923070c8709fe97013b3389630a0a281a018947088a890109882c3b334348ff62891aff23220119afff0139414d3342ff6969261a23ff01cf1f140d6413184033070144441e1514140d231a45898f63623b33016201ff1aff898927ff1aff899701ff3b33ff2869690c016aef6a011a6248908b013b4c31ff01ff4aff016a01ff1a45555228ff3b4e361414143c34141414143d31ff01ff623b38106501ff131d2f4402033b36140d23113f33ff89ff01ff0c44446264131dff0189053b3301ff21ff898a01020444250c26226f093b332c89ff010f19256263424301ff4709fe3b4c31ff016539326203024f39310689fe053b4e4c4141414d4c414141414d4c414141414d"}}function fw(f)if(ff==f)return false
holdframe()H(0,0,F[1][f],sget,sset)H(0,0,F[2][f],pget,pset)memcpy(12288,24576,255)ff=f end function fp(f)if(fr==f)return false
music(-1)holdframe()H(0,0,F[3][f],pget,pset)memcpy(12544,24576,128)memcpy(12800,24704,2176)fr=f end function fv(f,e,n)holdframe()H(e,n,F[4][f],mget,mset)end function fR(f)holdframe()H(0,0,F[5][f],pget,pset)memcpy(14976,24576,2176)end function ec(f)holdframe()H(32,72,F[6][f],sget,sset)end function H(c,e,f,b,r)local function i(f,a)local e,n=f[1],1while(e~=a)n+=1e,f[n]=f[n],e
f[1]=a end local function d(e)local n=$f>>f%1*8<<32-e>>>16-e f+=e>>3return n end local function f(e)local f=0repeat f+=1local n=d(f)e+=n until n<(1<<f)-1return e end local t,u,s,n,l,a,o=f"0",f"0",f"1",{},{},0for f=1,f"1"do add(n,d(s))end for d=e,e+u do for c=c,c+t do a-=1if(a<1)a,o=f"1",not o
local a=d>e and b(c,d-1)or 0local e=l[a]or{unpack(n)}l[a]=e local f=e[o and 1or f"2"]i(e,f)i(n,f)r(c,d,f)end end end function eb()local f={}f.obj_list,f.player,f.g_p_zap_turn,f.g_tile_count,f.playfield=fC(g),fC(g[1]),z,Q,e9()add(E,f)if(count(E)>60)deli(E,1)
end function er()local e=count(E)if(e==0)return
local f=E[e]if(e>0)deli(E)
g=f.obj_list g[1]=f.player z,Q=f.g_p_zap_turn,f.g_tile_count local e=g[1]e.nextdir,e.isdead,e.ismv,k,f1,L=-1,false,false,false,true,true et(f.playfield)end function e9()local f={}for e=0,34do f[e]={}for n=0,31do f[e][n]=mget(e,n)end end return f end function et(n)for f=0,34do for e=0,31do mset(f,e,n[f][e])end end end function fC(e)local f={}for e,n in pairs(e)do f[e]=n end return f end function c(n,f,a,e)return tonum(sub(n,f,f+(e and e or 0)),a)end function K(n,f)local a,o,e={},#n\f for o=1,o do e=(o-1)*f a[o]=J(sub(n,e+1,e+f))end return a end function J(f)local e={}for n=1,#f do add(e,c(f,n,1))end return e end function p(f,e,n)return f+(e-f)*n end function v(a,o,d,e)for n=0,1do for f=0,1do if(e+f<32)mset(d+n,e+f,mget(a+n,o+f))
end end end function R(a,o,f,e)local e,n,d,c,i,l,f=i.s_w<<1,i.s_h<<1,48+f\16<<1,f%16<<1,48+e\16<<1,e%16<<1for e=1,e,2do for n=1,n,2do f=mget(e+1,n)if f==a then v(i,l,e,n)elseif f==o then v(d,c,e,n)end end end end function S(f,e)local n=mget(f,e)if(n~=125and n~=127)return 0
v(126,24,f-1,e)return 1+S(f-2,e)+S(f+2,e)+S(f,e-2)+S(f,e+2)end function fl(e,n,a,o,d)local f=#e for f=1,f do n=print(sub(e,f,f),n,a+sin(f2+f/10)*d,o)end end function m(f,e,n,a,o)?f,e+1,n+1,o
return print(f,e,n,a)end function fD(f)return(f>=60and flr(f/60)..":"or"")..sub(flr(f%60)+100,2,3).."."..sub(flr(f%1*1000)+1000,2,4)end function ee()local f=_*a==1f8+=.075f8%=1fo+=.015fo%=1if(x==45and fa==false)music(h(5)and 0or-1,0,7)fa=true
if x<=45and f then if(btn(6))poke(24368,1)
if((Z and l or btn(6))and count(d)==0)e7()
end O=mid(0,count(d)==0and(l or k)and O+.2or O-.2,1)if(f)for f in all(g)do f:onstep()end eu()
local f,e,n=g[1],i.s_w<<4,i.s_h<<4local a=f.inprt and cos(1-f.anim>>2)or f.anim X=i.s_w>=8and mid(0,(p(f.oldx,f.x,a)<<4)-48,e-112)or(e>>1)-56Y=i.s_h>7and mid(-8,(p(f.oldy,f.y,a)<<4)-48,n-108)or(n>>1)-60end function en()poke(24405,0)if(fe)es()else eh()
if(L)ex()
if(f1)em()
ey()poke(24405,96)palt(0)local f,e=-32+n,-n if(q>=3)f,e=-32+-X/2,-32+-Y/2
for f=f,128,32do for e=e,128,32do spr(148,f,e,4,2)spr(152,f,e+16,4,2)end end poke(24404,96)pal()if(q<=2)for f=0,127do sspr(0,f,128,1,sin(fo+(f>>4))*1.4,f)end
poke(24404,0)camera(X,Y)local f,e=i.s_w*2+2,i.s_h*2+2palt(256)map(0,0,0,0,f,e,1)fE()map(0,0,-7,0,f,e,128)fE()for f in all(f5[f0])do f:ondraw()end palt(16384)map(0,0,0,0,f,e,12)palt()map(0,0,0,0,f,e,2)for f in all(g)do f:ondraw()end eg()camera(0,0)local a,o=h(1),count(d)local f,e=p(127,115,O),a and 0or 87poke(24404,96)pal(fu)if o>0then sspr(0,0,128,128,0,0)else sspr(e,0,128,9,e,0)if(O>0)sspr(0,f,128,16,0,f)
end pal()poke(24404,0)local e=B<=i.s_gt and 7or 13if(l and B<=i.s_dt)e=10
local n=dget(i.s_st)spr(n<599.995and 147or 146,88,0)if a then?fD(B),2,2,e
if(fj)fl("new time!",32,2,e,1.3)
if(n<=i.s_gt)?"⧗",81,2,9
if(n<=i.s_dt)?"♥",75,2,14
end local e=g[1].ttch rect(96,1,126,7,7)fillp(ft[ceil(U)])rectfill(124-max(1,e/Q*26),3,124,5,59)fillp()if(l or k)fl(l and"stage clear!"or"❎ undo",l and 42or 50,f+5,7,1.3)
if o==1then local f=sin(d[1].m_anim_factor>>2)*-32+-24local e=m("stage "..C,f,106,7,0)line(f-2,112,f+e,112,7)m(i.s_nm,f,115,7,0)m(i.s_at,f,122,13,0)elseif not l and q==1and C==1and e>5then m("🅾️ sprint",12,12,7,0)end end function es()local f="0c38010f00380438080f05380038010f0438113b0f01587f113c0f08113b587f0f0111432438010f00382538080f24380038010f2c3831430f01587f313b0f08313c587f0f01313b"for e=1,144,12do sspr(c(f,e,1,1),c(f,e+2,1,1),c(f,e+4,1,1),c(f,e+6,1,1),c(f,e+8,1,1),c(f,e+10,1,1))end line(88,127,104,127,0)line(0,56,0,71,0)end function eh()local o,e,f,n,a=f_,0,0,false,false for e=0,10do f,n,a=21+e,o&1<<e>0,o&8<<e>0sset(f,98,n and 7or 12)sset(f,96,a and 7or 0)sset(f,92,n and 9or 4)sset(f,90,o&32<<e>0and 10or 9)sset(f,88,a and 10or 0)end for e=0,4do f,n,a=8+e,o&16<<e>0,o&64<<e>0sset(f,98,n and 7or 12)sset(f,96,a and 7or 0)sset(f,90,n and 10or 9)sset(f,88,a and 10or 0)end for d=0,7do f,n,a=103-d,95-d,88+d e=o&1<<d>0and 7or 12sset(f,101,e)sset(50,103-d,e)sset(78,96+d,e)e=o&1<<d>0and 9or 4sset(f,91,e)sset(52,n,e)sset(76,a,e)e=o&4<<d>0and 9or 10sset(f,93,e)sset(50,n,e)sset(78,a,e)end f_>><=1end function ey()local a=f8 spr(224,80,104,6,2)local f,n=80for o=0,32,16do clip(f,104,16,16)for e=0,15do n=sin(a+e/8)+104sspr(o+e,112,1,16,f+e,n)sspr(f,104+e,16,1,f,n+e)end f+=16end local e=g[1]clip()palt(0,false)spr(208,24,104,3,1)palt()if(e.haskey)spr(144,32,104)spr(144,39,104,1,1,true)
for n=0,16,8do f=24+n clip(f,104,8,8)for e=0,7do sspr(e+n,104,1,8,f+sin(a+e/8)+e,104)end end clip()if(e.haskey)spr(145,32,104)spr(145,39,104,1,1,true)
local e,n,f=(btn(4)or e.sprint)and e.oncnv==false,e.blink<4or l f=e and 214or 215if(n or k)f=216
spr(f,l and 37or 36,104,1,1,l)f=e and 252or 251if(k)f=160
if(l)f=250
spr(f,40,104)for f=0,23do for e=0,7do sset(79-e,104+f,sget(24+f,104+e))end end end ep=K("1d5cdc125848145949",6)function ex()local f,n for e=1,3do n,f=((z+3-e)%3<<1)+1,ep[e]pal(f[3],f[n])pal(f[4],f[n+1])spr(155+e,96+(e<<3),8,1,2)end pal()L=false end function fE()poke(24405,0)camera(0,0)local f,e for n=0,34do f,e=(n<<3)%128,(n\16<<4)+8sspr(f,e,8,16,f,e,8,16,true)end camera(X,Y)poke(24405,96)end function em()local o,e,a,f=g[1].coins for n=0,1do e,a=4,5if(o>n)e,a=9,4
f=17-n*3for n=0,8,8do line(72+n,f,76+n,f,e)line(72+n,f-1,75+n,f-1,e)f+=1e=a end end f1=false end function ei(e)local f={type=c(e,1,1),x=c(e,2,1),y=c(e,3,1),spr=c(e,4,1,1),anim=rnd(),spin=rnd()}f.poskey=f.x<<4|f.y if f.type==0then f.stx,f.sty,f.poskey,f.dir,f.anim,f.jgl,f.sprint,f.pstate,f.ismv,f.oldx,f.oldy,f.strnx,f.strny,f.haskey,f.oncnv,f.inprt,f.blink,f.octg,f.coins,f.nextdir,f.ttch,f.isdead,f.prvsltr,f.prvcrfl=f.x,f.y,-1,3,1,0,false,0,false,f.x,f.y,f.x,f.y,false,false,false,10,0,0,-1,1,false,false,false f.onstep=ew f.ondraw=ev else if(f.type==5)f.oct_ind=f.spr f.spr=87
if(f.type==10)f.dst_x,f.dst_y=c(e,4,1),c(e,5,1)
function f:onstep()if(self.type<10)self.anim+=.02self.anim%=1self.spin+=.035self.spin%=1
end function f:ondraw()local f,e=(self.x<<4)+8,self.y<<4if self.type<9then if self.oct_ind==nil or self.oct_ind==g[1].octg then local e,a,o,n=e+sin(self.anim)*2,self.spr%16<<3,self.spr\16<<3,ceil(sin(self.spin*.5)*-8)if(n<=3)rectfill(f+7,e+1,f+9,e+14,7)
sspr(a,o,8,16,f+9-n,e,n,16)sspr(a,o,8,16,f+8,e,n,16,true)end elseif self.type<10then spr(self.spr,f+4,e+sin(self.anim)*2,1,2)end end end return f end function ew(f)if(not h(6)or count(d)>0)return
f.blink-=1if(f.blink<=1)f.blink=30+flr(rnd(60))
Z=btn(4)and fd==false fd=btn(4)f.jgl=max(f.jgl-.2,0)if(btnp(5)and not l)er()return nil
f.anim=min(f.anim+((f.sprint or f.oncnv or f.inprt)and.2or.1111),1)if f.anim>=.65then local n=J"2013"for e=0,3do if(btn(e))f.nextdir=n[e+1]
end end if f.anim+.001>=1and not l and not k then if(f.ismv)ek(f)
if l==false and f.ttch>=Q then l,y=true,62483if(B<dget(i.s_st))dset(i.s_st,B)fj=true
end if(Z)f.jgl=1
f.sprint=false local e=f.nextdir if e~=-1or f.inprt then if(f.inprt)e=-1
local a,o,d,c=f.inprt,16,f.x+cos(e>>2),f.y+sin(e>>2)if(f.oncnv or h(2))o=18
local n=mget((d<<1)+2,(c<<1)+1)if(n==121and f.pstate==1or n==51and f.haskey or fget(n)&o>0)a=true
f.nextdir,f.dir=-1,e if a and not k and not l then fq=true if(y==nil and stat(49)==-1and not f.oncnv)y=61956
if not f.oncnv then if(not f.inprt)f.strnx,f.strny=f.x,f.y eb()
z+=1z%=3L=true end f.anim,f.sprint,f.ismv=0,tonum(h(3))~tonum(btn(4))==1,true if(f.inprt==false)f.oldx,f.oldy=f.x,f.y
if(e>=0)f.x,f.y=d,c
end end end if(l)f.dir=3
if(fq and not l)B=min(B+(time()-fn),599.999)
end function ek(f)f.ismv=false local a,o,d,c,l,h=f.x,f.y,(f.oldx<<1)+2,(f.oldy<<1)+1,true,true if(f.prvcrfl)v(96,18,d-1,c)Q-=S(d,c)f.ttch-=1y=62278f.prvcrfl=false
local e,m,x,b,r,t,u,s,n,i=mget((a<<1)+2,(o<<1)+1),mget(d,c),a<<4|o,(a<<1)+1,(o<<1)+1,(a<<4)+12,o<<4if(e\16==12and f.pstate==2)e,y=123,62084
if(e==52)R(19,20,3,4)y,n=-349,"78e"
if(e==53)R(21,22,35,36)y,n=-349,"73b"
if(e==54)R(23,24,67,68)y,n=-349,"7dc"
if e==55then f.coins+=1y,n=63494,"49a"if(f.coins==3)f.coins,y=0,-349R(25,26,99,100)
f1=true end if(f.prvsltr)v(126,26,d-1,c)y=62084
f.prvsltr=e==48for n=0,2do if(e==80+n)i=f6[n+1]f.pstate,y=n,fh[n+1]
end for n=0,7do if e==56+n then if f.octg==n then f.octg+=1y=fO[n+1]for e in all(g)do if(e.oct_ind==f.octg)ez(t,u+6,(e.x<<4)+12,(e.y<<4)+6)
end else l=false end end end if(f.octg==8)R(27,28,74,106)f.octg=0
if(e==18)if f.haskey then l=false else f.haskey,n,y=true,"67",63494end
if(e==51)f.haskey,y=false,-349
if(e==125or e==127)f.prvcrfl,y=true,62210
if(e==121)y=fh[2]
local d=-1for f=0,3do if(e==113+(f<<1))d=f
end if(e==123)d=f.dir
if(d~=-1)f.nextdir=d
f.oncnv=d~=-1for e,f in pairs(g)do if f.poskey==x then s=f if(l)deli(g,e)
break end end if f.inprt then f.inprt,i=false,f6[f.pstate+1]else for n=0,6,2do if(e==89+n)v(126,f.pstate<<1,b,r)f.oldx,f.oldy,f.inprt,y,f.x,f.y=a,o,true,63142,s.dst_x,s.dst_y
end end if(e==123and f.pstate==1)e=192v(112,14,b,r)
if(e>208)fG(f)h=false
if e\16==11and f.pstate==0or e\16==12or e==50or e==29and z==0or e==30and z==1or e==31and z==2then fG(f,true)elseif h then f.ttch+=1v(126,f.pstate<<1,b,r)end if(n~=nil)fH(t,u+8,J(n))
if(i~=nil)fI(t,u+12,i)
end function fG(f,e)k=true if(e)y=61448f.isdead=true fI((f.x<<4)+12,(f.y<<4)+12,f6[f.pstate+1])
end function ev(f)if(f.isdead or f.inprt or not h(6))return
local d,e,n,a,o=f.dir,f.x<<4,f.y<<4,f.anim if(f.pstate==1)pal(3,8)pal(11,9)
if(f.pstate==2)pal(3,13)pal(11,6)
if(a<1)o=f.oncnv and a or.5+cos(a*.5*sgn(a-.5))*-.5e,n=p(f.oldx<<4,f.x<<4,o),p(f.oldy<<4,f.y<<4,o)
e+=(-1+rnd(3))*f.jgl+8n+=(-1+rnd(3))*f.jgl+8local a,o=cos(f.dir>>2)<0,sin(f.dir>>2)<0local d,c=a and e or e-8,o and n or n-8if(f.dir%2==0)spr(211,d,n+7,3,1,a)spr(211,d,n,3,1,a,true)else spr(217,e+1,c,1,3,false,o)spr(217,e+8,c,1,3,true,o)
pal()end function fQ()cartdata("cs_blobun_"..el)if(dget(63)==0)dset(63,117)for f=0,59do dset(f,599.999)end dset(62,0x1.12)
end function h(f)return dget(63)&1<<f>0end function eF(f,n)local f,e=1<<f,dget(63)dset(63,n and e|f or e&~f)end function fk()return{stage=dget(62)<<4&15,world=dget(62)<<7&7}end function ea(f,e)dset(62,dget(62)&~.9922|f>>7|e>>4)end function f3(e)local f=0for e in all(r[e])do if(dget(e.s_st)<599.995)f+=1
end return f end function fJ(f)return f3(f)>=count(r[f])end function fA()local f=count(r)return f3(f)>=I[f]end function fb(f,e)for f in all(r[f])do if(dget(f.s_st)>(e and f.s_dt or f.s_gt))return false
end return true end function fc()for f=1,count(r)do if(not fJ(f))return false
end return true end function G(f)for e=1,count(r)do if(not fb(e,f))return false
end return true end function e4()cls(0)map(0,0,-24*u,32,19,2)map(0,2,u*2%1*-24,48,19,3)map(0,5,u*3%1*-24,72,19,7)palt(1024)local f=sin(u)*4map(19,0,12,8+f,13,7)if(not h(6))map(19,8,28,8+f,4,5)
?"2025 cyansorcery",32,122,3
?"beta 2",1,1,1
palt()pal(7,1)if(fc())spr(241,1,119)
if h(1)then if(G(false))?"⧗",113,122,7
if(G(true))?"♥",120,122,7
end pal()if(count(d)==0and j==nil)fl("press 🅾️ to start!",28,96,1,1.4)
end function e0()local e=_*a local f=e*8cls(1)rectfill(0,56,127,72,12)map(0,12,-24*u,56-f,19,1)map(0,13,-24+24*u,64+f,19,1)local f=f*.5?"presented by",39,60-f,1
if(h(6))map(19,7,18,60+f,11,1)
palt()fillp(f7[flr(p(1,4,e))])rectfill(0,56,127,72,12)fillp()end function fz()if(_*a==1and btnp()&48>0)s(0)
end function fF()for f=-32+n,128,32do for e=-n,128,32do spr(204,f,e,4,4)end end poke(24404,96)pal(fu)if(M==nil)sspr(0,58,128,70,0,58)sspr(0,7,128,18,0,7)sspr(39,38,52,20,39,38)else sspr(0,0,128,128,0,0)
pal()poke(24404,0)palt(4096)if(M==nil)map(48,0,0,0,16,16)local n={{"programming","bug fixes","general"},{"art, music","art, music","music"}}for f=1,2do for e=1,3do m(n[f][e],f*64-46,e*24+42,7,1)end end m("director",58,42,7,1)m("created by",44,1,7,1)m("a plural system",34,26,7,1)m("seven spirits, one body",18,32,7,1)else map(32,8+M*2,0,32,16,2)local f={[[ you've overcome many
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

    you are amazing!]]}m(f[M],16,56,7,0)
end function e1()u+=.025u%=1if W>0then W-=1if(btnp()&48>0)W=0
if(W==0)s(0)
end end function e3()u+=.01u%=1if count(d)==0then local f=btn(6)if(f)poke(24368,1)
if(btnp()&48>0or f)y=61828e_()
end end function ef()A=mid(0,A+D,1)u+=.02u%=1local f=count(r)if A==1then if(btnp(0)and b>1)y=61700N=max(b-1,1)D=-.125
if(btnp(1)and b<count(r)and f3(b)>=I[b])y=61700N=min(b+1,f)D=-.125
end if(A==0)D=.125b=N N=nil
local f,e=count(r[b]),btn(6)if(e)poke(24368,1)
if(btnp(2))w-=1y=61700
if(btnp(3))w+=1y=61700
if(w<0)w=f
if(w>f)w=0
if btnp()&48>0or e then if(w==0)s(0)y=63333else s(2,b,w)music(-1,500)y=61828
end end function e2()local a,f=e8,20+sin(A>>3)*29for f=1,4do pal(a[1][f],a[b][f])end rectfill(0,0,127,127,1)map(0,14,-24+24*u,-2-f,19,3)map(0,17,-24*u,115+f,19,2)map(32,-2+b*2,0,1-f,16,2)local f,e=122+f,I[b]if(b>1)?"⬅️previous area",1,f,7
local n=f3(b)?n>=e and(b<count(r)and"next area➡️"or"")or"▶solve "..e-n,84,f,7
local e=count(r[b])local o=max(min(w-5,e-9),-1)local n,d,i,c,l,f=13-o*10,o+10,h(1)for e=0,e do c,fK=e==w,n+10if e>o and e<d then f=n+3local o=r[b][max(1,e)]local d=dget(o.s_st)if(c)fL(4,n,90,fK)
pal(7,c and 7or a[b][2])if e>0then?(e>9and""or" ")..e.." "..o.s_nm,14,f,7
spr(d<=599.995and 241or 240,6,n+1)if i then if(d<=o.s_gt)?fD(d),96,f,7
if(d<=o.s_dt)?"♥",120,f,7
end else?"back",26,f,7
pal(7,10)if(fJ(b))spr(241,6,n+1)
if i then if(fb(b,false))?"⧗",113,f,7
if(fb(b,true))?"♥",120,f,7
end end end n=fK end if A<1then palt()if(D<0)pal(1,a[N][1])
fillp(f7[flr(p(1,4,A))])if(D>0)rectfill(0,22,127,112,1)else rectfill(0,0,127,127,1)
fillp()end pal()end function f9(e,n,a,f)add(d,{m_x=e,m_y=n,m_w=a,m_h=count(f)*10+6,m_items=f,m_highlight=1,m_anim_incr=.25,m_anim_factor=0,m_step=function(f,n)local e=count(d)local n,a,o=n==e,btn(6),count(f.m_items)if(a)poke(24368,1)
if f.m_anim_factor==1then if(btnp(2))f.m_highlight-=1y=61700
if(btnp(3))f.m_highlight+=1y=61700
if(f.m_highlight<1)f.m_highlight=o
if(f.m_highlight>o)f.m_highlight=1
if(btnp(5)or btnp(4)or a)y=61828f.m_items[f.m_highlight]:i_onclick()
end local a=true if(n and e>1and d[e-1].m_anim_factor>0)a=false
if(a)f.m_anim_factor=mid(0,f.m_anim_factor+(n and f.m_anim_incr or-.25),1)
if(f.m_anim_factor==0and f.m_anim_incr<0)deli(d)
end,m_draw=function(f,n)palt()local e=count(d)local n=n==e if(n and e>1and d[e-1].m_anim_factor>0)return false
local e,t,a=count(f.m_items),count(g)>0and 147or 241,p(5,f.m_h,f.m_anim_factor)local n,e,o=f.m_x,f.m_y-(a>>1)local a,d,i,l,b,r=n+f.m_w,e+a rectfill(n,e,a,d,1)rect(n+1,e+1,a-1,d-1,13)local u,e=n+8,e+6for s,c in pairs(f.m_items)do if e<d-9then i,l,b,r=n+3,e-3,a-3,e+7o=s==f.m_highlight if(o)fL(i,l,b,r)
pal(7,o and 7or 13)?c.i_label,u,e,7
if(c.i_setting~=nil)spr(t-(h(c.i_setting)and 0or 1),a-11,e-2)
end e+=10end pal()end})end function fy()for f in all(d)do f.m_anim_incr=-.25end end function fM()y=63333d[count(d)].m_anim_incr=-.25end function o(f,e)return{i_label=f,i_onclick=e,i_setting=nil}end function f(f,e)local f=o(f,function(f)eF(f.i_setting,h(f.i_setting)==false)if(f.i_setting==5)music(h(5)and 0or-1,0,7)
end)f.i_setting=e return f end function e7()Z,fd,y=false,false,61828local f if(not e6 and fA())f=1
if(not eo and fc())f=2
if(not ed and G(false))f=3
if(not e5 and G(true))f=4
if(f~=nil)s(5,f)return
local e,n,a,f=o((l and"next"or"skip").." puzzle",function()if(C+1>count(r[q]))s(1)else s(2,q,C+1)
end),o("restart puzzle",function()s(2,q,C,true)end),o("stage select",function()s(1)end)if(l)f={e,n,a}else f={o("back",fM),n,e,o((f0==2and"hide"or"show").." hints",function()f0=f0==2and 1or 2fy()end),a,o("options",fN),o("go to title",function()s(0)end)}
f9(16,64,96,f)end function e_()f9(24,96,80,{o("start game",function()s(1)end),o("continue",function()local f=fk()s(2,f.world,f.stage)end),o("options",fN),o("credits",function()s(4)end),o("back",function()s(3)end)})end function fN()f9(16,count(g)>0and 64or 72,96,{o("back",fM),f("show timers",1),f("slime overlap",2),f("sprint by default",3),f("sound effects",4),f("music",5),f("lesbians allowed",6),o("exit game",function()extcmd"shutdown"end),o("pico8 menu",ej)})end function ej()extcmd"pause"end function fL(f,e,n,a)rectfill(f,e,n,a,2)fillp(ft[ceil(U)])rect(f,e,n,a,154)fillp(0)end function f4(e,n,a,o,d,f)if(count(P)<100)add(P,{x=e,y=n,spd=a,dir=o,col=d,time_max=f,time=f})
end function fI(d,c,o)local f,e,n for a=0,.9,.1do f,e,n=d+cos(a)*4,c+sin(a)*4,a*360f4(f,e,.9,n,rnd(o),12)f4(f,e,1.8,n,rnd(o),8)end end function ez(a,o,e,n)for f=0,.8,.2do f4(p(a,e,f),p(o,n,f),0,0,14,p(5,12,f))end fH(e,n,{14,7})end function fH(e,n,a)for f=0,.9,.1do f4(e+cos(f)*4,n+sin(f)*4,.8,f*360,rnd(a),8)end end function eu()for f in all(P)do local e=f.dir/360f.x+=f.spd*cos(e)f.y+=f.spd*sin(e)f.time-=1if(f.time<=0)del(P,f)
end end function eg()for f in all(P)do pal(7,f.col)spr(flr(p(163,161,f.time/f.time_max)+.5),f.x,f.y)end end
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
0707480b11c91efffcd227270f1f701efff854219f580901070838fffb506cf24341c004ffffff0d48fffffffff11000e592ffffff0ffffff0df7040fc93a8c2
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
5972c3c59978b4e2e1b27011276804fc294c4eb3e1b9078ca50f4ebc5c56ff7bcb6c748f184ebf5e268034ece14e9bbf30fe15134d9719937fc18c2cf044e798
fe794290748a721e80b80ee0fb48f52cf278f3cf0012029b048e026b82eb4b981e3ef1bf78f78f9e0f704058093a90200f88001e988001280f38cf5cf1cf4228
0a0b9813647012108c0219000a1e790fb48b8fb8424140011a4245281248840b01ac11e702cf00e29f984241c0904ea1642404509010f748792f21e779414046
121e1e9a0b0755858f12c7c3c7c8b9787425014009b9522041a980051a1e11c5cf180fb482f84a02801486848401e00544e0070f848f93cf212c9802820420b0
9091a404a1490801a236cf642cf23c98480600a129006140824a222041a16256cf5490f30fd8cd830175860480802280105ef0e73e70ef11e797945841080708
c24918c240cf1af71f70f31fbc08604b64984b6490b4cf048f180f301e7044ef1e70c40e928902f41ca273ff173f793ef74c9c1c944f02c218b7fbc90ffff1c1
c1d0f4878b88df12f48d146efff587e852fbc10f3c108c858b2c249092cfffd0fd1b97f8dc57464df1b58fd3cfff59c4546a62301578c31321e20f30c0ffff32
dc3b285ae8820f08b8b3cfff91e7224866ef7021efffa82e024d0b92dd51f3170838ffff10e0a404f85d62fb4ab32928fff361a0e0070b830f4afbc0a360efff
0569727002920e1780dc3e70641cfff3943f4ae94d7f477495e8422f483803efff84811a482f8befff8682830c1c156d393803a0efff883e817c13e83246670e
5eb08fffb517d31e905e710fff7cdd71ff8bea027e6248c2b9c63124eb8096212d424a948f3e19f95e2e1b078d5483c17171f30ff4872cff47878b2423122706
801eb103647832cff39781820808792f681f70735ef748052cb8cf110e0e1e5a48132cf0c5c149f731f1fb8c7197879b9501e6e780248f731f0f34e3f24619fd
832421ff702cf898fb9b3c8f18f3058f18f3a08f1c7f4ea3a9fc9ef8f49f1e194ee352f7c30e0e093341c1c9cfbc5c321e0e2e3fe5c5cf0cf31e90ff3d1e1ea0
f0f1f0f70f31ffb6e1e70efff1782f7021ff712cfff346cfbc5c51e71e2e10ff3d4cf0c8ff87848ff103e7c0f737781f30f70a0f30f70a0f387e99f5e79af8bf
98c5cf1cffffbc2fffff10e78aef21ef70eb069e26748fff70b551cd39cfed5647f74819e6cffeb90dd8b3cfe42922b08fffb1062908f2affb84f0fcc30c1bcc
ffe12b01649ffb8cf3cffff71e44dea36fe97e777fb3fdbf784eba33c31a0effe55927577465eae37c497ca1907ccd61f58ff9ba86c18b45c2a8bc488b0fec12
4be023780ff37827cd00730e8f58f6a06a6cffe5ef00f70fb5f972a3318cfff702e8f180fb4c1f317ccc084cfff120ff79972921d2f82ff3783ef00f70c1f393
e789938fff77cf53786e078d5cb7c9933bec2fc29c740c102cf13cf19af568f7af48f72e71678cf72b536c8ffd0ff45aadc8220ef83aea8f32793502b1074ce7
048f101e7048ff4e79529f52b29bd6c7cd48f1848b94d2b3e80c12f79dff9c7044e46b072b4cbc20eb904710ff73680168d8b4a570794368b4a3af039b4ef788
30c994e79c2fb44e791e6e1eff7c2cb07504ffffff0de5109842eefffff100000000206222222222000222222222200802000008ac8f79a5ce9809f34a18c311
cff12332cfb1648b215bfb838fb930fb5300047fcfc000000fd900efbf1e0c130e7cf1000e7718c3f0280cfff73e7a4af71ea090b075838f5010f172718b832c
f00072f30340cf0cf0061ea0f3180107070832c1c5c50e105e3e2e1e2ef5e2243cf2cf2cf4cff3818072879f878f7848083803e4e80ff23e4acf0c9c1c0c50a4
00e22c51e4ac8150778fb040c14838b8ff90813a1e3242cff32c1c7cf3cffb24858f52c348f138073fb5848130890cfff73e7a5cf787341c5c8780f317077858
b058360c80f5120eb032c342c310360e2648780707100e0e024687b07016c87002c93c1582d0f0f0f758fd2c14b08b973424838760cb048b24877808f1a07781
70f07f0ff41e5001ac805eb1e70c0fb58c01a40cf2c0c8f511e360e908f81ff584839401e1ac0c9401e0e0e70a1a46838392248030f2f6014832c3348b0478b6
87812c9c380300cf0cfff73e7ac240808424902279c394e7a42836425102280b03232160070011808d19421010968528002c6449888321900b48880b8446780c
8809161229a4230b8402934420c62880396329c22e90986288409c8842e0290c52448c6074240162688c4c2044211344032d88c112109800a22804c229621290
0423119b07029350844429294246018423e401440d206c24000d0e140b07429ac032a242404608002b70407809016064e129006830c7b4422208402806190085
039844680900232f048988c5327083ea4294c42001a9442c1298e29430888481701a4e0099078011294a7421972042a1649768c29888844021406982838011c5
2611842460a01cfff73e7aeeade084444e160938c21198cb01d888c227c3211024024f00626c729742902a21698e22197e884244810864852919422464619f34
c0e04422962479023a7424e0eb1201514294522b07c1948c4009441090a0198c2cf0161c2111b440c6293e042e8888a489462114609852111462211784409844
e860101c11843267088409448d48320944a0ea0940e04242889020409032e804409401b0a84629880680e809461420e900f08cea429889850944427802244884
694c4251229c80904446c64c5290421b0888940208011649010f40f10c4401198042343287800b448440b0a21b061429142124918621d4229010188801403480
09840d480d3211942e8421088060c00200a01cfff73e7ad4c002124878046988c54420a742944295212228d22229028629444504298090019292944a850b4409
8c42d6029480907d222090288884294a190ed622048840149841880193fe0098094288b0984a2121b097212a44ea5842221976299821f442292104629b290034
8d4c9d400c294119d409f1a0098162228362194e2c3210142807442329219a06212a88986223110d848626f540946907940e39e128729c294fb8809e24719b21
9944907444c1298b34284219721228840b0e02154242c1988722742212b424a94e90124398098842a4231c4c0a20021a1464031942d021429c3212612211b426
112743115242c483224a22422e521294430d4804c142429c422128a420ab46ffffff0ff7aef42104836579cdaefbe12137963557d19aa6e1f8bcc5f5aaa0978c
33db652d6a97c893eb559abecdbe657df09f3cf2aeaf72dbf8d1e97df0ef0976662fccc4e9999c6646914de236c0cea094c80b0910b0136c66c8dc24562ff386
ef83f7159c137817e1db56e2f784a179a5a1f8a4ed9bd836f8c2d87c16137817c1d9cc5e09cf3179f7c2f4c5e19c71f8f427caf461d624eaafbedf3e793d67ed
fbcebf12e973979f673e21e2076e2fd4ee93c15675f6c4e9581f62dc6d8c28b6f162e103f5c787eec3d277887fcf7e79dbf7cf297e2e2be3ff83a9f7af0f3070
b0e70c1fdf3fcd8b80ff832e708f16e783e6e19cf28f388215109ef0884e6c9483d2e60fecf13c9c3297edf5c9f8369c1b32fc3def0bb8fce9075f793e87c93f
9361ef89d480f927ef2955cd9a91b0c1260ba44ae1a3f7ccf33ff08f502f7c232eafa17df1c917e37c6d5e09b337162c36ebb767fa6ff4606cf270cbbbfed9b7
4cb26fa0f140336e78b29a0bd36cf300070c5bb6bdebf66bdcf1bc3e07c675757579f7e8c7195db9bfb8f1ce3b9101637a8fe98a1f04eaf52ef84cf0e0e79b66
3842e13e60080ba42c3376aeed5e998f126e42983e9db7d7ecfc5edcf0aef84cd7e57fa3d1ff8523e8c32ef840ef84ad53bc434d29f785e11b40ef84e9ea69db
d042985e11940ec4475d83ff933bb27c1f6eb3a93e8e572f07ad9f9cb993e8f840c5e8f523ff03e22c54c523f46e9bff8876e12558c94c1cde22ef95cab06d68
81721e32e293c23b7ea93ff8bfdd5dafc3eac1b4c7313fdbc1c9ec812e16cd7807d2f42bf5ed8d1b422c69f74c1c1c50e2b8f56ef103c48f1e2ffc29427c7ae8
f87cf33fc3e97e84b787adbe7842267cf3c3fb47b35480f30ce34e05112bd1707357eb922e522b454e3f8389e25e1321eb344e70fceef322b87db36ce57d19b4
cb6dc5c36fbcf31b90f1626f42211031e487abeecb324ce0f83a74c961738c2ffc14a03b636f388581c9b34bbb6ef06c1ee875d1fd51ea4e9f569b81f21ef024
031ccf27031bcf0246fef0c5f7cb7c6fd211974493cad8c46fe304c23cb3f104ca5742f783c44ef86ecd1b5ebdc8f7cb9cf06e51ef240fc1ebb791e0f006e71f
4ec6eb3fe4ef8b30bb2051e12fd569f50dd7312e70c1973e3bf21f34c97a7674e8e1e2bcf17ee2e70b7e8f2ef1e610bdf38c32e40638c575620d480108d012b7
09fec524a9800b14e4990c276cbbb3fe7fbc1d4d5dc5fc5bb605e18628fe8fa7a1cc511f1cf148f50af70cc2a6037c32e00721bf524f48f433373374440c548f
50e906437f717e5ecd993b9c7db6dd174ce9bf47df3213296664e01f2429c216f99578e6fb48c1260ebdef8358c65c1b564c2e207c60bf58420bc517abafc99c
71faf2fc3f3cf2fcf0f1f8beeeb7e585d7487d29f3c59c96b381ff876bf3a5936aacbee6ef1b836b11a69d3ec88972bd69f3c5d4d6723e4bee7199c6ef0667c5
17d7edf36fc7a7f17c7677ca7d7fe7487891752fbcd9b56cdf27acea487c8b59f784e89b0e9f073132cf3066429c798f10a020f0160e23e278cf19bd9f9f3667
c1f853fcc877e83fa7e8f1e93ef97ce6f9130917a3663f3c56ffff0e98f3e8f76fb8dfffb6b725fffffb11effff732cfffff648fffffd80fffffb11effff732c
fffff648fffffd80fffffb11effff732cfffff648fffffd803a966ffffff0ff7aef40412386e57d9bfac621119d26c4b7ca2a972f8bc4fbc14cc57ee1f8abeac
3e557dd9f1cf1aeaf52ff8f7ec3c5ff4e3f86e13fa9bef94df1aeaf525f38acf31df1e457df3dfa7934ef938989bef9c37ddd87e8df3e7932b9f74ef19136060
1299700b91363362fb87c6c1c9272f48b0127df3bf2db667df0717a4c3702d451ab057a0118dcf23fb82ffcce79b4294446e938529a2461e91721663b9f7c89c
3be9ff4fcd1bdf2fc12adf5e215700c02890733b7030f5ea27855b3195a8ec4078203e012cd4878d00f9f89478840fdbe207e7c9aff97ea7fc72bf7cc5799f78
af7e9a0e20f2316e71603ff079f70f2f78f5eababc67e179e9f7c3fc6b42effb946bd6bd6bd6311111111111119747b34e9dea84ef98f121772952e79057729b
39cf179b324cbd5c6ab21bf34eb833c08df25400cf1fe176b22de5e506e94c994e63eb4434df366f7c3dc1ae884044429de070713b348f50000cf1fff87d1ba8
494ad3ee0fe317f3c2ed80c096bdeeb601c39988c2bd3602cf3693878f5621fe8164c8c46c0e707bcf2e01fac183ef1ec872d7095c3404c7c4c44c1f383cf200
93e0aabfe61b3e0def13300693932df40692287c37bfe9462551ea9f16ed3e0bf7cb7be10f301c49cc3cd09f54e893a1aee3fa7fef36ef91617acb29f8be5979
811719f18819cf6f7cf27d2fd67c779e2e9e3dca57873930e09c118bc7e7175883cf00785218f742772f437eafc971dc57e37df2feed4c50ef1b764e938b5d30
__map__
47089c8982265ee3706b0e3976ef9d247986e3f33c3f70f1835c62fcc0013e48c5c537f72ae593a4d7552647583c8e2fc7f18bad9324365d4e09afeb80c3b2d9eb707d12c63f92055e3b42228b0871410e45aad8e1876c8b27712c94cf4c1e5f8ffd4121216a495257264fe2250eb60a02af5c645cf1cfd2ee38f107a689e899
5435646260fc32069334df2dfa491fb1497e388a9e39440d86c177e0b8aef885003c3e27f545f78a3c632e7c57e71142450c801b8ff8a038a9ef76704daf2b4c78f3f941fcf0c32c3e92cb2f3ffca0f138c7a5e9c1977f360b7d370fff1b6ecf69878bf6f9221ee2fe239fb9fac7b6038b1d99fc31f1cffce3d1e9b4b23c49b6
e4f147b6e4074736911d71a7ddb1ad47fc977622dff61cdbb1277e3a8e63bff471243f7cddea91c826b61cb03f323ee20afec05ee08fa88c4e4292fd22b13812c96396078950e20a2a8e4bb0a965b75abe2c06cb0c7af8842c6ee772ebd6c1c1b1d89149277ed81f65af63a96c3e1c2ad98f7ae9bf420e589ff3152cef67cd09
fb23db01ec1f1c23666e7d1d472acb93a64b1e47b644bdb66fdb77c5fd1cc7ae6dcf13ff3dc7b16bdbbbbdcf767c5f2c891f882479bb2e63c1a6b6dcb0648cb83ec05e98459cd9e7d8b19064a7c4e21816b325304288eb02ec8159c4b28a91c71f8ef458d4b6ee7ac39bcac133c77e09024fdc697e68e48f3f76f5ddf61171ed
07c7ae28257f44fc920a9e912f081cb976d9f325fee94c3ecb91118fe4109223763cdcbf3c47de334f83e4879cd1cd718e606e314b7ec937e3fa38fe3896235df07eb62759e4aaed87f041b97ef049a4bae3b1e66231bf3aa29a372bf6647b67fb87e50abdd461de1e5748b784e77d34173b482a1b2c3f3017998484248f65d1
b47ed99eb99a646fe4603959308bf50b20939090272cdb69dbb635df866be4409a5f601f1c0764f6906d9bd9124b6a664b6212cf2f473c177afc4312dbb148da9ce80f9dc78e6b6be8118a17e7d125e19fe56121c163d6487a6c388ec50f32db8c10fb236923ec0bc77db49df7891fc2326913fe79db6ddb68f0cf2fc7b11faa
c12fb411ba00f7da6edb461bf481e338f647a4d9268cb8be75e438b6ed79108e6f37f9b61fbe6d07dafb6df7070deea3ed474386cd2fc9f11c6d725490c8772c92657b04c49ea41f4838eeb55d729e8eab49f8e74dbb6d7f441fdccfd3be51b89fa75d34d811df95eb3884b6e809478f89345b8410ef2ffafdf1de3d1fc976dd
ff5c1afd8e2038f38b3c2b8eedfa650e33cc4ed8464ae57fa6e41069f7cb735bfe70ecfce552c4d9e3f411e2739f174cdce4f00809f9ff073ff8a1dd2fdb3e7174ab88c7731c3b441c629e63838aa7db81791ccfd2127eb0c70ff30f5cf1f8250887fc4184f1327e80a3e8f28be487917a88e71f44fcb0602e017210c01fc012
e29fa59273921c577c7994c7b3eb3df20c8ff88ce607173efc21cbc32046bddff448f289f80edfb1e31f39e11f112e7f70a9884b76fee332bc3cde6ffa25f948ec388e5f72f1388ef6f981f7ca25218ecb71c01ff6645cd4f79232957eaeeed6fc7266125ebbc4718f93783b2eed1d61fd21c762004964fffffff07fea4f1042
38cd6597efba5031973655d791aaba9e5c86ebcbe955d79baabaeefce00f75fd92aabafe49cf6f87e717bff8479e99c93333796626cfcce499993c339363660ba85dc600c6d8b88cb1d965a142c8ff78d71f2f97fea10cc2307e99477e50bf58982861469858fc33ff68943908c3f861fe91a83f2c4c943023cc1fce489f5639
edfde3e4f5fc735fceb8c0c1e59f70c625454461d00370f9673c51ffc02ff008475cfe103fc4957f363fc4e507f30b11621f3970f30beff1c78efcf1e4380ee79b7faee78febf8ec785e7e58de43f7f517398f91eb0c324e1cb9a74ee34d7cbbae2687f2595dbb9e26ffa83c6ff20f9f5f2affb48e73d55dff547e49e1fe2147
ffb8fa5e897d795dfbe3f48b8352feb0f345e038ddf9c10e2749c42e0363e083e7f827f9c43fc4fe114ab8899d3fe007b80ef25cec9044ec9f8c7f9825b820f7fc80a7cf735df3a46dc6c7e69f1dc738793cbfe0a062f6cf3ea9ac49643f787c38f047240f3f60f18bf2cb5c8904474e891193ecf1be9cb95cd7f97d349451b9
ebf4995fde8dd83eb227af675f74f9c1920c95579644de408ef8de9cfe91cf459e47ea140401dd91e420fe104982e4c00f24d9f19e4becf28ba44b6e3b7243be3efef071e24b5cdb157c26765c39f6811b12407c6028c8f10f7e813c921fc43ff0fcf398a4df363f645edbb28c39cee7ecc1c16387287bcd210b14f698fc2202
0b36635321c8c73c72fc81187f24fe807d621f6cb99a01e09a1d7ddd3c47727ecb735cf394477240d997ec9f2c5f3d7ac891a72f9e68f38378548f593bdb234e0948fe50ceb872953bae34fc43722a480ee589e4f40f579f6baee36a5d8e5ebffc73ccc3299e607ffc816f7ec87ce28f79605f6c5c701c7f7cdb9c7303c4fe90
e1088e2bd79bbc4ac2e00741f047727b5d7335f12ccf9dc47bf885f003c7846e3f6472a99c062e8e09013de097c17861e72f38c1037620af27af62e7e6bcb54f9a5f3c4b2481900907ec8730bf383c579e5fea12e2807d1cb9f2b82ef77cb05fe2c83f67e1b85cf34112978a63721c965c22811fae5c009705d4f9380260dea7
f0c7e51189f05cfce38f7f739d8fcb95e48fa8edbcf9001e5e7b2ffc01fe011f18082cc3035b70c33fc9711dfb61e7fed83f8be7877c3b3f5f9ee3dab5e8f35c233ec7f1ec3992c393ce916693f09cf6c3f1aab7c88ef58ffbe4a6fcc13ff69aed0ea71df9835fe4a6e480bdc167f39a14436b72c87dc44e983fe68f479281f3
3377f461f68b70d9917f4cc738f4c8e2c9bb378f9d7d4d5f4e971f96f8ec87ebb1133bf3489215baebc261fc02fb017e502a2bfcb2e30acfdcb09b61ff30c89ee09315833ffef8f479f3ccb1ca71783e7bef8b7fecf20fe48744c041f8077c903f8eec0ff805b620e01f8b0b7aec1c8be73fe7edfd4764abcb8e833de070fd63
fff2ffc7f2f9ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf1106f864fffffff07fea4f1042386597badcfe1e49cca54dd575a4aa796ccfeaba7238d4f5e573aaeb4d555d77aaeafa215575fc915fbcd4f1cfaad471ac4a1dc77a
1d1c1e7ef08f3c3393676672cc6401b5cb12031b33c666975d76190bb185271c4364f2e3feb92f871f9e24fed0ac8143f647926b79971f32cde2f21d7fc41cf8279601f2e5a96b12d56c8143b6245dde5f92fce2ca3f71793c691cea8925e0713cd9ecf96ee70fff9cfacffdc73f8e7ffcf30fe7f27edd2ffbc796cc1f76beb3
88c52ffcc16696c4f14f329288259931f8966dfb61d93fc31f160fb15fc42e0199e5873fb65ffa4f973e8ffbd97dfbe7eb638c83270403b0fb143f3c0c527201b0839810384b300ef0c3ae8a13fbe05962c17778fea927def3d3b3e7d1d23cf24f7b989de08f589e67cf237a1d3e2e9fef17d74384109b632e07cb97676b7799
15fc9267bff867d38610c9e61f873c299faf76e43a3fcf95c6e3fb8eb3d7915b1c3cfc637cf9ecbe77dd0727a7edb8a46f00e3a1982f79ec7b67c9b10a01c97cb2077b31c7212f3b92e89c8778546edeb43ccf775d49ca61c70fffd83ffec184d975cefe39fe019924629f0f87cf7ef8215c0483d8cc62182c9249f805fc4312
b14ff805137fe43b77be5fdf7c39dc67385de449f68f2d87cd3fc9c4e276ed78f578b938ec8f671a884ce7ceb7f64efae4d91feff287cec8128b59aed8d1d31c755e59fe48f3831dc13fcec7d5c3f9bccec4963ff2f24bb23ff6f4dbbe79fa0792e50fc97d4b7e8944f9239234243ebbd5b7ddaffd32d93ff96fdfd1dedbf183
f9be5d6f93549e264d466c3fb0e7e0cde3717a76f9ea3acee635cf1fa279fdd1f3783dcf4925dccfd975fda717d1fce31febf0873938a42b254be4a5ebf53563118f37db1f599e497ec9af7ed9f603e2768ffb3ef6d88e1fec9735cfcefc737c9e6787d9f4488ad4021174c0e6920ca90522e880817893dc891f767c785c7182
92eccd75dc59793c8ecf1f638d8823066cc184ed85921106f1269178b3fd0325b330d8fe094124803ccfe98940ccb3f775d51fd63fb2ef497c927f98313f1cc992fcc2f4167740f64f667ffc805f327f2c00d4f383ec6616b14c0fdb17dbc7f235ee7cb848f8075c73369d3392b387c777f8c5bc1244e6ce846c597e39e29765
57d54abcd993dbfe585239962dc491f9a3f165c92fd25fb2fd71c51ff303e1242c3c5e39d885871d3eef916bffe40f3f8834a4fe819732c6c539ec87a7f60b7403a3c4e20a9210c824ff5898f00ff887607eb138edf54782bffe70f972fa767cebd703965cdb2fcfe1383d3e32ecc5f8811fec73b0c41c8f7807ec8f70dc23e0
dd168e6173c0fe117b94d3e21f6a318b9b08fde3b91c3f7cdfbee479385c7bd7efc06375e5f18ff9673ec61fc4f14ff881815292865fc047c01cbf8c237152421d49fc30618c39327e9880eeb8306e7ec80ffbc753df991e8743589223c96573dbbd6fde583c760aef7c973ffe7292ff89e774bf9ee8aec77ae038aee7f8637e
d0b77b723dbeebc0ffe097fbdef56def71ecd8f6c39e39e469ac891f8e1c53792a7e49f2c7ba5fb61d4b82ffc191eed826c7be6dd78ebddd34f6245647ae76fef8e5725a76fcf139d7f7f609c2b1cfc7b5ddd8797214a7206221c40fa943b857224138f607d826724a210724243f9cfe982ec70f69b246b99677bfcbff3fcb0f
573c3b7ef1c799ffffdfc8fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1b6100f364fffffff07fea4f14023876e5a9fbdc2622ae75a9ba8e3c2ecde3f198ebcba9aa674a9eeabb9256ef95b4fac3fe20adfeb2b751fd2513d3e368a38e7fdafbe0f030973c33
936766b29905c7cc668c8d03c60e9648262c13b619b621f18427c432c426ff7d3fec3eeafe83b8f68f2d71adb67fe21a5be2d81f1602939026b65d9b38d4465c9b2d71ad3671adb6c6b1c3426012d2c4b663d0e7cae17a8ee3f8e59f3fec977ffee0e1253c04841f081fe10f101067fe79c5c4f147ba800f140304644208219c
24090bcc99fc2396d8b5e507bfec1fff1cb9ae4a72da2f39b8edb8ff918ac825c71fe617bb3894180bf148242162830c928844442247f8237cf307b8592298c326821fe49773ff5c4b8f38da67f17efde31fba269ecc058b647e61ee230fc7b1c4e2c3716511f2a6d02d716442fc10362f430eaa999bf9431cde1f3ef27d7245
1c39729d89ce3ff3cdb7fcb02339c2c575e5390e1f6f434693c4985cbe278e0071877bb9228f1d9f1c24541c49ded9e4f23db6381232d82f278fb7c7bea412992d1a4d882dc9b30cd9940d1379aee338126f677de4795cf1cbd1fde0e86507887d0262b74cec8307897090447889112e62379603b10cb15b6c628483d8013f80
d311af588597b8ffe087eb699f1fcae1726c3d02ebfdc89166723c3e95897b2e9244a4891c10fe188324603e891c9048bc739204fb032e0b821fdeecfabee3c8f11c0edb3fbc3f1ccff383a34d34401c492479b31c5c68134917e4699e25f2ee3dc2ebe8957832219e847996c843dfc43cccc41feee70f761ef28d68fec9b738
__gff__
affc22412c9ec51f991fc8aec4394f1ed7f3ec8c63d150d7c5729163897f264ff4950995d9f134cfe389f3f9c192e7c9be507f84fa619268e297c9135774f14fa87f2e590e92253279e29f673d2e3f9237477e28d9f1be6d4e5d7ee8e6fde19127125ddc891fb25dcc0fe287b0b8234bdeb0e40803e298844a184448f20564bd
9fbc3b767e399638ae5faa8973fe19b1f808f867f97ec90a1f0684c083c180e510e75c41e035aec419045e21f008829ffc739efeb9975f721c4fa3f791739ef9f883cd38f90173937f9c9763803fc02ff3cffcc2c41b858dd9e99739c171e0d80fbfe4ed0f5b6cf9e3390f9ce0b4f778ec07783919ecf18745f8835ae1e1b047
__sfx__
f887876b0e9742db7703e6702c5132f450fc401d814059431022209a070fc0602470088640537138f06329743f86013a452fc242641731f303ce7007f3502d271fa652d7711f972345641b3633336438f0007677
87ffffdf3e64017c0620f412391403f0421d67213533c30419f2621b0622a410c143384471cc753fc733c04218433076363b7161ff4630e67334751e2220f1530fb613f7511772207a670f1653f73113e563a917
71a9eb4b08c773ff73118773f777238673ff77069473ff770da073ff771bc063ff77378143ff772f9203ff771f3403ff773f60106c6123d773ff77307772a774002262142723e613ce761ec4404f2504b2435926
7f38f64b3f616074171c6571572727f3027f701d8713f867207303913626c740cb2619e413c41313636269170c3641ee4109713334472613207b640030318416336560ce64184530ca673ff1237b67217630e533
f9c40fb91683631c413cc5038917243113fa260832224c531a4010fa4124b5404b5618b1330c700ab26199241965213a6531547254761c07409c441e234165052af450f47637f103db053f86403b47233440ef54
2c7164f9327543e9452f8613b152079420c1132191418f011ce110477202016336442e2611d9721f9270fc132d74033b6712b47212173cf01382131f6163bf2431c32238763cc472134712c032eb02097700b754
d4e20f8b0370208222122431eb43327553ec51137711766107f012b7020e67316e160f222279161be37099730b7573d3071dc3436e2720e521f01410c3434402311361e54022f30271030866319f671445314317
ad6115fd3f0172cc5721f45213322d7712857700d7423d7334d513f8123b82136e040ea201c4122d86608771245070a6303947307a442af701f0373a1631d72323a70377442e1160bf241f037076630b9501f143
e51fe2ca015202ba4523541221302b64320824168372d87001c0337c0318612001112ca161f2472ea2631d66388510bf552ff553d56739e3107f172a4313d522399703ec47227071ec353e7453644433c5124f71
7f40a77325b64118171c574156541ad3004b642dc3412b6319e643c30239a4003d70237303e5431e76127d7126f5727e470767524f3027c47079673005432f7038d320b4121ee4723d412473011f443497119b41
9ea9eaf60065736c362cd431fe0425b4721f54175753e54312c742b5733c5540667136677306770c37321f712d8112cd44305663f90120d7320903186672d66518f403d71509a5537e450966122d320797307737
b93137ec3ac173d867126543dd3023c363b0700ce143ca0632d02047203fa65280500c9411b64021134386020fc30034270066438b413df071506704a663c933254473a2731db173450211c5703071301031ee00
34c925de0784705867010103b72003222056513ca06054352a14130c7700a06185111f7731af1607676091161f9312be57237562e97223467336103e9411b8113f9161aa640f8061e6313ce543d6341347724833
27c6f0ed39712335033f22239324166443e14632b4426f071ff462bb71377472f273376723f8663396624f003d7013c9032b0423167504631360063c8030b01438f001853638020306062f756108140d94703000
f825ea4b39a173dd3534c7524f5533b633f8630e5532ee550e67718f603df103d9143f8031a6210e436247312eb03013063021601243095470237138e04070501e9450de6107c5307a040f8373d3073807739f06
08ffffbf174762db073c7563ff770867532d573ff770da073ff771bc063ff77378143ff772f9203ff771f3403ff773f6013ef773f5123cf773f33438f773ff6030f773f75121f773f73302f773f77604e773ff75
42444648118773f777238673ff77069473ff770d20320b203f77723f742ff773f7122db763030004030080500ee60214273d5651b5453bd400be0121022260422a8110d52537d003154639d213342627b462a304
c2c4c6c80a1640e1051212516145065762bd20374660300622126261462a1662e107321273614730c0002a2006a400aa600ea0112a2116a410450621b1624b0222a2226a422aa622ea0332a2336a432a40112012
169c9e340cb7410b1514b35183433101322d651ab751a9513a9773a21233500190510c07002420094623f5433a014036622e0501144213421174611e0651e91734b37184511d473076633e0223d17738b573c321
1ffe17ff368633ea0403f243d42311d0223e223bc6727444122220991124417343472e2733f067277573fb070777239f3627e733e5553ef57217713f877187733fd6737f362b4773f1773bf5637f77017713fc67
e7ffc3bf0fa670f9772fc773d7763e94721f7733d772f1613ff123bf7731d753df751ef7727e7715f772b444122220991124777367773bf753df773ef303ff343ff263ff173f9573fd671fb773fd7707f733fe77
ff5ffeff3ff561fc77397733cf733df713ef363ff702ff770147334b773fe733ff571ff7717f763ff463a5713ef77007763f9673ff103ff7330f771f8773fb243ff7338f771bc773ff163ff703cf7713e773fa17
7febff7f0cf773f6453e7303fc363af773bc771fe770b7723ff563ff7331f730997707d77043472cf7737f733f7753987727d740fc773be733fd572df773fb673ff023f77734f7717a773ff153ff713af7717d77
fffff9ff3df7731e773f9373ff353ef771be563ff743db673ff761cf473db673f751397733ff073fc411fc7739f733cf773de773ff373f7301322209911244443ef7721f771f9673ff703f77732f771f9773ff64
f3ffbffe07d773ff463f7753df772fe773f9373ff75128701ce763ff753df713f7713e7743ff512fb472bf453ff773df7703f473cf7723f753eb073ff313ff7733f771fa773ff353df771bf773ff573ff703ff77
e7ffff273ff753ff773c977388773ff673fc743fb5727f770314335f433ef773ef773f7303c7703ef573ff77016731bd7707e753e9473ff7702e773f77338f773fb203ff771f9473ff7706e773f77738f773fb40
ffdff8ff32d61039743ff772fa073df773ff243ff770f8673077338e7739470224733e34726f763d3473cf773f9243ff77079673f77706f773f7341cc0118d743377731f543fb323ff7734f77307733811111f77
fdff7fcd3fb703df053df773ff343ff7707222291772cf773ff703cf773fd443ff77379673ff7709f5105f5433f773f7423f2733ff773f2173ed5435f773f7623ff773fb173ff7731c771ff773ff7139f771b427
fffbffff3ff771fb673ff7702f7724f773d77329f703df773fb613fe7707c773ff7333b7732f673f7770ff773ff353c7761ee773ff7338f7535777347731bf773c74724c063f502177701df273f2423f86737967
ffa9ffff3ff473ff7720e773f7710a7442ef5638f773fb713ff771fe473ff770be3435f7609b773ff7328f773ff700e7163ff771fa273ff770bd460fe473ff7726e773f7773af773fb422444412222091113bf77
67ffff9f2fa573ff772be35217473ff773f4563ff773fe273ff771bd773f9740ec0610f773ff763af773ff723ff770f4573db173ff7721c733df743ff773f9663ff770b3773df713df743cf7717e773f9173ff77
fdffff5c36f773f7563f4472676305a263bf733df753ef773fb162fa672f873244401165403e653ff503ff772fa471fb6710f713ff773fc262fe773ef733ff3623b5711b133ff772fd573ff7737e7618f773ff34
fbffffc01ae663fb1106f673df773f9453ff77178273fd773ff77174731fc773ff260c6733ef773fa763ff772fb773bf463ff723ce771dc773ff7137f773f7573f777203433cb570bf773f8473ff773ee773ff77
cfffffdf24444122220991123f701f9743ff771f8673ff7702f773f9073ff7707e373ff0737f73339771f9771dc77380771af771f9433ef7701b671f2373cf753e7763ff771fa473ff770be773ff7538f7738f26
db0c080d3a7773d7753ef473ff7714e7707f7728f713ff7330f773ff703ff511f85717e363f1171af773ea742fb5510e743ff773f200198203ff313ff5437f773f746004400681331e3339e7306f5407f140f855
5b5c5d5e0e82338a733da0304b640ef6400b562bf67100100340036e741cf65200202cf66344503543036c13378751f324051343c6342ef7613421174413b6122543229021160411ac0424032280520934519155
417e7f8e1f146291562b1662d1762f1073111733127351373790001a1003a2005a30072711d471023722d472083051111520506221673d1573b1030ce600ae5000147395511c41308e402b062031113201202503
fc3ffe270f243390533b0633d0733f401085440a5540c5640e57421c51246772ce3423b163b475374731cc5723f311f86730f740fd773cf271bc572ff343f477237351ff733fc773df573fb043ff063fe163d775
ec7ff9cf3ff313ff643ff36387533f7123df773cf713ef573f26139f733cf722cf7732f73313633ff723ff450fd7737e771df7729c473fa672fb153f7640231232f7339f7304f7721f443ff763f9461fe7723f77
f09bfcff3ff173f95713b772fe771bf770ff473ff671fb773f9663fd573fb471f2401797707f7727d571fd772fb770f9173fb771f4223ff173f75736f733f7733e7223ff5125c771b4353ef7700f773f8063f772
ce8f3be6076123bf7713c773ff003df770b67119f771fb471fb672f11139c673f7703ec473f71232e773f9173fd703df7715e7318f77039603ff6439e773fb173fd471fc453ff71398773f8173f7763e1543ef77
bf4bf2ef3fb173f77732b363f77009b773ff013ff703df7725e773bc573f77404b273fd273ff3216e7627f773fd273ff333ef323bf771fd773f966387753ef7733e773fa373f7323ef333ff772df770ff673fd77
ffc6e6673f97737c753ef771df771ff5127f773ff673f7043ff753f77738f771746139f770fe773f1133f7122de672f2121ff273f7723ff7726b673ff743f7731ac363f7733df772ba773fb343f7773df7733a77
ff38dbff0997337f771fb773ff6539f773fe773f9413f7773cf7717e6639f770ff773f9513ff72240223cd763f77138f7717f443ef77361771df773fb353cf713ff731cd773f9673ff773cf7731f773f8273fb57
fcff7fc23f17236f77177673cf77375433e77404f173f7763ff773cf771fa3237e773fd733cf773df223ff771f8063ff171be7231f743f131329363ff77078113df773fd0008f773f77124e3425f770f71428737
ffa77ffe3ff772f8273fd2707e671fa701f8651df773f7333cf773f7141cf773f77131f353f34237b773f77722f773f7523e77325c263ff772f8773f77303d663ff77370553ee163ff773b8773ff772387717543
ffddff313f77708b663ff77071773f7713ba773ff73248513fe773ab173ff7727c773ff7112a673f9143f3443ef773fd2608e773f776219173ff772f40127f571ff7732f77397733a7713d77423d77277223fc01
fe0ff1a43cc372377705f77179140c51527a441bc771fc3127f773f7163c0113f7751fa643f7711ff773fc771f3671ff7724f773f736328373ff773501110e7711b660ab40344753ff773fb343fb460f5773cf71
3f8aebfc3ff123ff742c112247533cf773f9743ce041061211e331ce763ff772fb6433c541841519f7701a012fb673ff771ee773ff77091620fb441c641218611ff473ff7701d773f77334d673f777119133ff77
ff97f1ff3ff77244772ef773ff3112e163ff771ba263f9173ff770f5453ef773f0521ea673ff7714e773ff7232f773f73520f773ff1308a673ff7716a473ff772ee663ff773f23339f773fb0304f773ff700df77
46f8ffff3f7360081421e773ff7730f772977410c321e9630d234327433ff771f5013ef773f5123cf773f33438f773ff6030f773f75121f773f73302f773f77604e773ff7508c773ff73118773f777238673ff77
ffff8db00da073ff771bc063ff77378143ff772f9203ff771f3403ff773f6013ef773f5123cf773f33438f773ff6030f773f75121f773f73302f773f77604e773ff7508c773ff73118773f777238673ff7706947
f588f3873ff771262707b7127f433a3631bf07253673ee630ff333bf011f87013b703f83707a433b667136163f96607c7338b6722f17287213fd34356663b87738f06176710e6773ed453cf0703b530ff740b701
87f4fee52d5732cd3631f66355713bf36257531ff161df161a7723991527b57279372d13719470336753e34007a772231107c312c5531cd47230733fb0634f502b8763ce760f86723f703c4733cd30335750ee57
fa27fef8394650ff5139f063396733b672317036d7720f713cd053f0261ff212b935357532297109d7604f3427c361966726c112bd3719f763cf1435d653fa6633d070747310c533c87223c371be6701d663ec07
71fd73f41e157398713f157105433e10537e142ee65321243a37237c733b0613e5073ac440fc47011170c6733c865361731f243237300de1017f57389631d77036f743370731f703db173d2353f1433ec731c633
000000001fa4701b723c704136671c0651ec770873725c771c9753967730f5419a653981703d1703d37033723be062373106f160af051dd7714b723c310060000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
0a 08074538
08 607f0058
0c 3f5f6c7b
0c 0c0e7042
0b 6230257c
0c 4138095d
0f 097d0167
04 073f1c5e
05 6f0f470f
03 57723d3e
00 67765f7f
08 3c7b7e31
0a 7f3c1c07
0c 0b5c361c
06 1c0c0121
0b 010e6b71
08 310e3203
00 11720066
0d 3f647c40
05 78057c42
0e 28246f42
0f 71477d74
0e 390e6348
08 234d725b
0f 793d1c49
0e 0f275c22
0e 724b710b
03 65303b37
07 4010184c
01 104f1222
05 56112924
01 194c1072
01 4c1f6177
05 42097b63
08 49442e71
0c 4825645e
0b 77663c0e
04 1c0f274a
0a 3e1e1c7d
0b 764f3a0e
06 54765801
0b 0130231b
07 353c144a
0d 0207420e
02 1c07350c
02 197b052b
03 72031d69
01 33157f04
0b 6f26791a
03 0c796939
0e 274f621f
0c 5f727c12
0b 68722d79
0a 21282c09
0e 43171268
0e 62664e13
01 734b6e79
06 7e31634e
06 74790378
05 4742722c
0b 4f3b5412
0d 1a457378
0a 67691f12
0d 03780e6b
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
