pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function _init()cls(1)?"loading...",1,122,13
flip()memcpy(32768,0,17152)_={{},{},{},{},{},{}}ff,ft=0,0local e,f=32768,%32768while(f~=0)add(_[f>>13&7],e+2)e+=2+(f&8191)f=%e
fr,f7={51510,27795,14025,37740},{32769.5,42405.5,60855.5,-.5}f2,f8,n,T,U,fe,fu,j,a,d,fn,m=0,0,0,0,0,true,time(),0,1,{},false fs,fh,f5,J,fP,fx=K"0001115525511125",L("3c26915154",5),L("13b49a5d6",3),K(J),{64515,-925,-829,-733,-637,-541,-445,-248},{64140,63686,63880}fQ()fR()fS(1)fy()end function _update()fe=fe==false U+=.2U%=4f2+=.035f2%=1n+=.15n%=32T-=1if T<=0then T=14elseif T%7==1then M=true end fT()x=max(x-1)if(btnp()&48>0and x>45)x=45
if(count(d)>0and x>10)x=10
if(x<=45)j=min(j+.1,1)
if A~=nil then a=max(a-.1)if(a==0)local f={fU,fV,fW,fy,fX,fY}f[A+1](V,fm)j,a,A,V,fm=0,1
end for f,e in pairs(d)do e:U(f)end if(not h(4))m=nil
if(m~=nil)sfx(m>>10&63,3,m>>5&31,m&31)m=nil
fu=time()end function _draw()fZ()for f,e in pairs(d)do e:V(f)end local f=A==2or A==nil and count(g)>0local e=f and V~=nil and V or z or 1local n,f,e=f and fh[1][e]or 1,fh[2][e],64*cos(j*a>>2)if(e>0)rectfill(0,0,e,127,n)rectfill(127-e,0,127,127,n)
if x>0then local d,a="stage "..C,cos(abs(max(abs(x-45),35)-35)/40)*64-64local n,o,a=a+8,a+9,y(d,a+12,97,7,f)line(o,105,o+a,105,f)line(n,104,n+a,104,7)y(i.E,n,107,7,f)if(e>0)?i.L,n,115,f
end end function o(e,f,n,a)if(e==5)D=f f=nil
A,V,fm,e1,x=e,f,n,a,0fg()if(A~=2)music(-1,500)fn=false
end function fp(f,e)fT,fZ,x,g=f,e,0,{}pal()end function e(f,e,n)fw(6)fv(1)fk(1,0,0)music(h(5)and f or-1,0,7)l=0fp(e,n)end function fy()e(-1,e0,e3)W=90end function fU()e(0,e4,ef)end function fV()e(4,e2,e8)local f=fz()b,N=mid(1,f.M,count(r))w=mid(1,f.N,count(r[b]))l,q,E,ee=0,0,.125,L("13b224cd02415d6d2494",4)end function fX()e(4,fF,f_)D=nil end function fY()e(4,fF,f_)end function fW(f,e)fp(en,e5)local n=ff~=2f=mid(1,f,count(r))e=mid(1,e,count(r[f]))z,C,i=f,e,r[f][e]e6(f,e)f6,fj,X,Y=0,61936.8827,0,0g,v,u,Z,fa,F,M,f1,O,fA,x,B,fq,P,G,fo,f0,Q,ea,eo,ed,ec,ei={},false,false,false,false,0,true,true,0,false,e1==true and 0or 90,0,false,{},{},{{},{}},1,i.W,fB(),fd(),H(false),H(true),fc(f)fv(2)fw(f)if(n)poke(24405,0)local e=L("2854ef234924d6d54924",4)for n=1,4do pal(e[1][n],e[f][n])end spr(1,8,0,14,1)spr(16,0,8,2,2)poke(24405,96)pal()el(f)fk(2,96,0)
local e,n,f=i.O,i.r+2,i.X-1for f=1,#e,2do local e=c(e,f,1,1)k(96+e\16*2,e%16*2,(f-1)\2%n*2-1,(f-1)\2\n*2-1)end for f=0,f do local f=eb(sub(i.Y,f*5+1,f*5+6))if(f.t==11)add(fo[1],fC(f.u,f.f,f.e))else add(g,f)
end for f in all(i.P)do add(fo[2],fC(f))end end function fC(f,e,n)local f={o=type(f)=="number"and f or c(f,1,1),f=((e and e or c(f,2,1))<<4)+12,e=((n and n or c(f,3,1))<<4)+12}function f:v()fi=self.o spr(fi%2==0and 254or 255,self.f,self.e,1,1,cos(fi>>2)<0,sin(fi>>2)>=0)end return f end function fQ()local n,d,e,f,a,o=r r={}for n in all(n)do d={}for n in all(n)do e={}f=2a=c(n,1,1)e.E=sub(n,f,f+a)f+=a+2a=c(n,f-1,1)e.L=sub(n,f,f+a)f+=a+1e.r,e.s,e.k,e.z=c(n,f,1)+1,c(n,f+1,0,1),c(n,f+3,0,7),c(n,f+11,0,7)f+=19a=c(n,f,1)*3e.P={}for a=1,a,3do add(e.P,sub(n,f+a,f+a+2))end f+=a+1a=c(n,f,1,1)o=f+2+a*5e.X=a e.Y=sub(n,f+2,o-1)e.W=c(n,o,1,1)e.O=sub(n,o+2)e.F=#e.O\2\(e.r+2)-2add(d,e)end add(r,d)end end e9="4fe5729bd9f69189773150d1dfc52318"J="88774"r={{"6tadpole3ashe601004.8344002.8344c3010023120130231331321310300403500510600100b3101b5100b0200b1203b3301124e4e4e38181818404e38184033ff01ff13403321131d010b01ff3b3301ff0cff01ff013b4c3101ff01ff01394d4e4c41414141414d4e","bplaying card4riley302004.8344002.851160000100203302313210100000123818181818403321ff01ff3b33ff19ff013b33010c01ff3b33ff01ff013b3301ff01ff3b4c414141414d","6big can3ashe542009.1010006.584480100200303400413512522420101000284e3818181818404e38102101ff01134033ff01ff01ff013b33011901ff01ff3b33ff1aff01ff013b33011a01ff01ff3b33ff0cff01ff013b3301ff01ff01ff3b4c3101ff01ff394d4e4c414141414d4e","acredit card4riley657006.5011004.501173023030040141241232220500200a1300a0013a5360a60531c3818181818181818403345ff01ff01ff053b36141414141414143f3321ff01ff01ff013b33ff45ff01ff05ff3b3301ff01ff01ff013b4c414141414141414d","efractured floor3ashe605006.8344004.836160450551651642633530504500a1160a6011a2540a40251e3818181830181818403301ff011a25ff053b33ff05ff121b01ff3b3301ff01ff1214143f3614141b01ff01ff3b3301ff121b01ff013b33ff01251a2101ff3b4c4141414b4141414d","btwisted path3ashe504005.3344003.334451031020011110100100300154e3818181818404e3810ff01ff01134033ff01ff19ff013b33010b011f0dff3b332101890cff013b4c413101ff01394d4e4e4c4141414d4e","asilly swine3ashe603007.7010005.501141051041031020100500223818181830181818403301ff011a01ff013b33ff0bff0cff0bff3b3301ff89ff89ff013b33ff11142a140dff3b3301ff010c01ff013b332101ff01ff01ff3b4c414141414141414d","9mini robot4riley558005.5011003.517743200211310300302000a4010a1040164e3818181818404e4e332521ff253b4e381001ff01ff1340330189898989ff3b4c3101ff01ff394d4e4c414141414d4e","ccompact pipes5autumn450004.6677002.767730021122110500200a2220a2022a4200a004211381818181818403325ff65ff013b33ff89ff89ff3b3321ff65ff253b4c41414141414d","dspiral portals4riley634006.8344004.867762331230220323423430303300a5414a14541e38181818181818184033018901ff0189013b33ff0111140d01ff3b33011901ff0119013b33ff0cff21ff0cff3b33010501ff0105013b4c414141414141414d","cstylish bunny5autumn632007.4677005.501171560551652641542531430305600a4020a2040214e4e38183018404e4e4e3810451a4513404e4e3301ff1aff013b4e4e33ff010c01ff3b4e381001ff01ff0113403301ff0bff0bff013b33ff01ff89ff01ff3b4c31ff01ff0121394d4e4c41414141414d4e","calien shuttle4riley656006.5011004.501140340441540530303400a4222a22421c4e381818181818404e3810ff01ff01ff134033ff89ff19ff89ff3b33010b051a050b013b33ff01ff0cff01ff3b4c31ff012101ff394d4e4c41414141414d4e","dtricky portals3coco411005.3344003.567770321421412403302312210503200a1220a2012a2322a222315381818181818403301ff25ff013b33ff018901ff3b3301256521013b33ff016501ff3b4c41414141414d","bsaving space5autumn549008.1677005.901031030021120100300244e4e381818404e4e4e381001ff13404e3810018989ff1340330189898989ff3b332189898989013b4c31ff898901394d4e4c31ff01394d4e4e4e4c41414d4e4e"},{"cbarrier break3ashe406005.6677003.66772001111020010032155174e3818181818403810444443013b3321444243ff3b3301ff0143013b334301ff43ff3b4c31434343013b4e4c414141414d","estaggered coins3coco627005.8344003.834421021010400200400564315646156183818181818181818403362ff01ff01ff013b33ff0bff62ff0b623b3321ff010b0164013b4c3101ff01ff01633b4e4c4141414141414d","dpath of hearts4riley459005.1677003.1677330200311305002001015314153a3212a123214381818181818403304040404043b3302010301023b3321650165013b3304010401043b4c41414141414d","btoggled tris3mika536005.8344003.83446003013123222212102040030035055a5300a00531838181818181818403365ff01ff01423b33ff44444343013b330144444343ff3b332101ff01ff653b4c4141414141414d","cmasked hearts4riley535006.1677004.317781031021010000103203212220200300112531a381818181818184033040401ff03033b33040bff010b033b33010201ff01ff3b332101ff01ff013b4c31ff030301394d4e4c414141414d4e","cdiamond coins3ashe607007.9344005.68446024034044054164163050240046056402564325620454233818181818181818403301ff01ff01ff623b33ff6464016363ff3b33626464626363243b33ff01ff23ff01243b33222321ff2424013b4c414141414141414d","9swituation5autumn451005.1677003.16772322023050220010053340553125513353143818181818184033024301ff423b33ff010444443b3301422104033b3304430402ff3b4c41414141414d","ekey to diamonds3ashe637006.1100004.5100510310210100001003003009209f25254193818181830181818403301ff2c1a2323233b33ff01ff0c2301233b3301ff018a2422243b332101ff192424243b4c4141414b4141414d","dtriangle coins3coco626006.5011004.50116163162261251241331060630045056412563425530355433561c3818181818181818403301ff01444462633b33ff01ff01ff01ff3b33646243ff4243013b334264ff62ff43213b4c414141414141414d","dunlocking path3ashe608006.3344004.334472232131031021010000100502300a4121a21419039f363551b3818181818181818403301ff448a44ff013b33ff01050b0501ff3b3301ff014301ff013b332c012143ff01423b4c414141414141414d","btricky trail4riley700008.8010006.5011b104103002112211101000010020030040070040013253442561235345356224544645628381818181818181818403301ff01ff01ff01ff3b33ff640423ff0103013b3301642302626401ff3b33ff6302016462ff013b332103226301ff62ff3b4c41414141414141414d","atoggle maze3coco612009.8010007.23446263253243233223213090630042056461562125436455a0522a2205425569359f2b3818181818181818403344ff626301ff433b33ff01ff63ff01623b33012205238a23013b33242424448944213b3323ff01ff43ff423b330501622cff01ff3b4c414141414141414d","dfractured isle5willow620008.8677006.35104266256246236090660035055a6100a00612035431355a0664a640621654273818181818181818403325ff01444442013b33ff01ff444401253b36141414141b24243b332242ff011a24243b33432323441aff053b33432323441214143f33052201ff01ff213b4c414141414141414d","cnumerous keys4riley633009.8010007.117752432332232131030a043003405540156441569629f113534045624454a0560a60052b381818181818181840330303014442ff053b336201ff016264643b330144444343242c3b33ff0204012124243b33626363632289013b330501ff018a23233b4c414141414141414d"},{"ewatch your step5autumn330004.3011002.501141030021122110200300310551038181818184033014201ff3b33474443013b3301ff43ff3b332101ff273b4c414141414d","ccareful moves5willow518005.1677003.16774143142241231030430035055223541438181818181818403301ff01ff27423b33ff23ff0124433b4c3123014701394d4e33232227213b4e4e4c414141414d4e","cdiamond house3ashe509006.1677004.18442154153030540020254252541a4e4e381818404e4e381810232313184033ff012323ff013b332224242424223b33ff47ff0147013b33010701ff07213b4c4141414141414d","dforbidden path5willow439006.1100004.1100512202103134124202022002445419381818181818403323ff01ff233b33ff014701ff3b3301272107013b33ff010701ff3b3307ff01ff223b4c41414141414d","fkey in the woods5willow440006.1100004.5100524413403314324202044009049f19381818181818403366ff01ff463b33ff01ff01ff3b3301ff01ff013b33ff018a01ff3b332c0601ff213b4c41414141414d","9conveyance3roxy528006.8344004.83445104103102101000030040011353253541e38181818181818403301ff66ff01663b33ff664601ff663b330166060601663b33ff02030123223b33210303ff23233b4c4141414141414d","dunstable floor4riley417005.8344003.851040040140240340200400321551a381818181818403301ff0144443b33ff014244443b334343fe09fe3b334343ff89ff3b3321ff0109013b4c41414141414d","atiny cracks5autumn352004.3344002.3344401302313313204013009319fa0330a300310381818181840338aff47253b330966092c3b330147feff3b332521fffe3b4c414141414d","cdigging holes4riley638005.5011003.50116031141240230220210030310033055333551c3818181818181818403343ff014201ff443b33fffe092109feff3b330109fefffe09013b334301ff42ff01443b4c414141414141414d","aforest maze5autumn531006.4677004.884441040033130140600400a5100a00519029f152539549f1f3818181818181840336589464646273b338a03ff8aff653b332cff010926023b33ff0404feff013b3321ff4709012c3b4c4141414141414d","bmisdirection3coco829007.7010005.501160031132121020010110700300280541715332255a2300a00239839f2238181818181818181818403325ff01ff06ff43ff223b33ff0144231924ff02ff3b33014442230c240404033b3321012501468aff032c3b4c4141414141414141414d","ccompact curse3ashe745009.5677006.867722103000d010004205626054a6101a01619229f3135535355373554245646456a7404a04742a381818181818181818403301216209242422ff3b3305fe8946464605013b3323232cff014346ff3b336442ff01ff4289423b33656462438a6362653b4c41414141414141414d"},{"dbring the heat3ashe416005.1677003.167722232130202300741e714381818181818403301696969013b33ff0a0a0a283b33010a0a0a013b33ff012101ff3b4c41414141414d","acold circle5willow519005.8344003.834421030020300300a5350a50531838181818181818403301ff696901053b33ff69696969013b330169696969ff3b3321016969ff053b4c4141414141414d","bfrozen water3mika624006.5011004.501122632530406300811e8a1260a60121c3818181818181818403301ff696969ff053b33ff48acb5a401ff3b33010591968dff013b33ff0169696901213b4c414141414141414d","cnot so simple4riley546005.5344003.85102112011050120025054811e8a2201a01221838181818181818403301ff01ff01223b3365488eb0a4013b33232165918dff3b332323ff01ff873b4c4141414141414d","ahot diamond3mika523006.8344004.83444300301002012030000025054724e71e381818181818184033210a7a8272223b33ff01578184723b3301ff017c86743b33ff0189575c543b3323ff28ff0a394d4c41414141414d4e","afreeze keys3ashe644006.5011004.5011216316206063009009f26154a1260a6012203541c381818181818181840332cff01ff01ff053b33ff0169692324223b33010569692324013b3322018a01ff01213b4c414141414141414d","alava bridge4riley647006.5677004.734431622611510606200810e8a6303a036322454244541d4e381818301818404e381048241a24ff134033ff01ff0cff01ff3b3301ff895089ff213b330501ff19ff01053b4c31ff221a22ff394d4e4c41414b41414d4e","ftiny contraption5autumn253004.1100002.344021231220502300701e7821e8722e7813e80d3818181840336969503b332850483b336989283b338748213b4c4141414d","9lava coins3coco625006.5011004.51775003113212102101060030041056730e74505626154433561c38181818181818184033016201280a620a3b33ff24ff017a72223b33016463558077523b332164236257540a3b4c414141414141414d","ahot springs3ashe810010.2677007.33442101000090010025054811e8761e7813e8a6320a2063a8404a04842d3818181818181818181840330166050606220606663b332148acb5b5a4285d693b3301ffaeb9b9a6235e693b33ff489196968d0551693b332555520a0aff01ff253b4c4141414141414141414d","ccool crossing3mika622007.9344005.68444002012122121090020042056831e8712e745256814e8a2562a622544656234e4e38181818404e4e4e4e3362ff013b4e4e381810ff48461318403321280a896962053b33ff4669896901ff3b3301488e928bff013b4c41310501ff39414d4e4e336363623b4e4e4e4e4c4141414d4e4e","8iced maze3ashe843012.6010009.101031061050040900600720e7881e8252549339f764e7825e8a5503a0355393818181830181818181840338e8b280c23fffeff013b33555f898789890901483b332351010b8722feff013b332506062c66110d8a394d33016969ff06ff28ff3b4e33ff5048010b257a723b4e3321ff018e8bff57543b4e4c41414141414141414d4e"},{"dfollow the gem3ashe841010.9677007.9510836126235205306317317207109061005210654107581015530050405525045550257703304e4e381818301818404e4e4e381001ff0cff4a1318404e3301cf01ef0121012f3b4e33ff01ff19ff01ff013b3816140d011a0fff01ff3b33afff01ff1f14140d013b33ff018f011a4fff01ff3b4c31ff01ff0cff01ff394d4e4c413101ff01ff6f3b4e4e4e4e4c41414141414d4e","dunlocking gems3ashe714012.8344009.284483003013020030133233242250c000005200755006352555720552300543035040120654526025460417653383818181818181818184033214aefff43cf44443b33ff4aff01430144443b33014a4a4a434201af3b33ff010f236f0403033b332fff0123230403033b33ff01ff232301ff013b3322ff4f238fff01023b4c41414141414141414d","boctogem maze3roxy613011.2010008.201051631621612602500f06300200545300756000203545130613353553015640250505545045160334655a6606a06663138181818181818184033224a23ef01ff0f3b33ff0303030404ff3b33240303030404013b3322cf2302ff2f213b3301ff01ff43ff4f3b33af43ff018f01ff3b33056f44044204053b4c414141414141414d","fice fire islands3coco848016.5677011.984431841831820e0840024054501069419f5720051305773e75440757401506043465558602807e854803484e3818183018181818404e38108e991a22460169134033cf46880c2c242424693b33018789ff8969690f013b33ffafff19ff01ff28ff3b33acb5a41aef4a8a2f213b3391968d12140d5d11143f338fff894342556d524f3b3348010a43ff895e0a0a3b4c310a0a436f55530a394d4e4c414141414141414d4e","ckey labyrinth5autumn754011.2010008.84404144143142041140440050007521049619f9029f822e8542009139f52305a3362a6233563019349f554025150653503a4531a31459559f775e7313818181818181818184033ef698a4a4a8e8bff3b3369018f45ff012c013b332c69488a0f5025ff3b33ff2caf25ff8a2f8a3b3389468a2c214f01ff3b33ffcf696f452cff283b4c41414141414141414d","bweaving path5willow821017.3440012.384441871861852841008700700e731255403569439f4735620554636e6837e815753a0834a3408818e842856a8882a82884a38181818181818181818403328ff434301ff7a720a3b33ff01ff01ff017c740a3b330142aca4010b5754453b33628e958d2c03ff628a3b3614140d2519ff6969013b332201ff011a01ff01ff3b33239769080cff2666013b33ff886948ff02ff01213b332548626301630163453b4c4141414141414141414d","bfour islands3ashec15030.3344023.734440873972982881c0870021054690e62b054a5180a80515710558306504045540317453845e89179f5470217853ac8c4ac4c882ae873ae71ba5352b0123b5457b00a1c15a151ca8c4ca4c8c5bc07834e3818181818404e3818181818404e38102201240113301045082422134033ff01ff24ff451aaf2424ff89233b3301ff012489241aff87ff23ff013b338e8bff01ff011a23cf01ff04233b338fff0a0a236f1a0223ff0423653b4c3125ff0148394b3123010423394d4e36141414143f4e36141414143f4e38102c23234f1330102101034a1340337a75587d82721a0201ff03ff653b33575487575c541a0303030301ff3b3301ff482801ff1aff01ff8902043b33ff8a2f2223011a0fff660401ff3b4c312501ff05394b3105464aef394d4e4c414141414d4e4c414141414d4e","bvictory laneacyansorceryf55040.6780032.5344902c03c14c24b13b23a32a22b11b2c02c00410562705430155611e6742e7692e69f29f813e843356283545b30530455594065d5044f55641656717e7577074b7568c7e8ab8b5ab5b87e8e74f95656a0118a5348b5617c532dc545ec0390d9f54d00a6dacaac6d47d5639d55a3e1aa1a3e46e5618e5359e02afefbafbfec24e381818181840381818183018181818404e38106264640120102201231aff01ff011340334208ff01ff1a248923070c8709fe97013b3389630a0a281a018947088a890109882c3b334348ff62891aff23220119afff0139414d3342ff6969261a23ff01cf1f140d6413184033070144441e1514140d231a45898f63623b33016201ff1aff898927ff1aff899701ff3b33ff2869690c016aef6a011a6248908b013b4c31ff01ff4aff016a01ff1a45555228ff3b4e361414143c34141414143d31ff01ff623b38106501ff131d2f4402033b36140d23113f33ff89ff01ff0c44446264131dff0189053b3301ff21ff898a01020444250c26226f093b332c89ff010f19256263424301ff4709fe3b4c31ff016539326203024f39310689fe053b4e4c4141414d4c414141414d4c414141414d"}}function fv(f)if(ff==f)return false
holdframe()I(0,0,_[1][f],sget,sset)I(0,0,_[2][f],pget,pset)memcpy(12288,24576,255)ff=f end function fw(f)if(ft==f)return false
music(-1)holdframe()I(0,0,_[3][f],pget,pset)memcpy(12544,24576,128)memcpy(12800,24704,2176)ft=f end function fk(f,e,n)holdframe()I(e,n,_[4][f],mget,mset)end function fS(f)holdframe()I(0,0,_[5][f],pget,pset)memcpy(14976,24576,2176)end function el(f)holdframe()I(32,72,_[6][f],sget,sset)end function I(c,e,f,b,t)local function i(f,a)local e,n=f[1],1while(e~=a)n+=1e,f[n]=f[n],e
f[1]=a end local function d(e)local n=$f>>f%1*8<<32-e>>>16-e f+=e>>3return n end local function f(e)local f=0repeat f+=1local n=d(f)e+=n until n<(1<<f)-1return e end local r,u,s,n,l,a,o=f"0",f"0",f"1",{},{},0for f=1,f"1"do add(n,d(s))end for d=e,e+u do for c=c,c+r do a-=1if(a<1)a,o=f"1",not o
local a=d>e and b(c,d-1)or 0local e=l[a]or{unpack(n)}l[a]=e local f=e[o and 1or f"2"]i(e,f)i(n,f)t(c,d,f)end end end function et()local f={}f.Z,f.f1,f.f0,f.f3,f.f4=fD(g),fD(g[1]),F,Q,er()add(G,f)if(count(G)>60)deli(G,1)
end function e7()local e=count(G)if(e==0)return
local f=G[e]if(e>0)deli(G)
g=f.Z g[1]=f.f1 F,Q=f.f0,f.f3 local e=g[1]e.h,e.G,e._,v,f1,M=-1,false,false,false,true,true eu(f.f4)end function er()local f={}for e=0,34do f[e]={}for n=0,31do f[e][n]=mget(e,n)end end return f end function eu(n)for f=0,34do for e=0,31do mset(f,e,n[f][e])end end end function fD(e)local f={}for e,n in pairs(e)do f[e]=n end return f end function c(n,f,a,e)return tonum(sub(n,f,f+(e and e or 0)),a)end function L(n,f)local a,o,e={},#n\f for o=1,o do e=(o-1)*f a[o]=K(sub(n,e+1,e+f))end return a end function K(f)local e={}for n=1,#f do add(e,c(f,n,1))end return e end function p(f,e,n)return f+(e-f)*n end function k(a,o,d,e)for n=0,1do for f=0,1do if(e+f<32)mset(d+n,e+f,mget(a+n,o+f))
end end end function R(a,o,f,e)local e,n,d,c,i,l,f=i.r<<1,i.F<<1,48+f\16<<1,f%16<<1,48+e\16<<1,e%16<<1for e=1,e,2do for n=1,n,2do f=mget(e+1,n)if f==a then k(i,l,e,n)elseif f==o then k(d,c,e,n)end end end end function S(f,e)local n=mget(f,e)if(n~=125and n~=127)return 0
k(126,24,f-1,e)return 1+S(f-2,e)+S(f+2,e)+S(f,e-2)+S(f,e+2)end function fl(e,n,a,o,d)local f=#e for f=1,f do n=print(sub(e,f,f),n,a+sin(f2+f/10)*d,o)end end function y(f,e,n,a,o)?f,e+1,n+1,o
return print(f,e,n,a)end function fE(f)return(f>=60and flr(f/60)..":"or"")..sub(flr(f%60)+100,2,3).."."..sub(flr(f%1*1000)+1000,2,4)end function en()local f=j*a==1f8+=.075f8%=1f6+=.015f6%=1if(x==45and fn==false)music(h(5)and 0or-1,0,7)fn=true
if x<=45and f then if(btn(6))poke(24368,1)
if((Z and u or btn(6))and count(d)==0)es()
end O=mid(0,count(d)==0and(u or v)and O+.2or O-.2,1)if(f)for f in all(g)do f:Q()end eh()
local f,e,n=g[1],i.r<<4,i.F<<4local a=f.d and cos(1-f.a>>2)or f.a X=i.r>=8and mid(0,(p(f.g,f.f,a)<<4)-48,e-112)or(e>>1)-56Y=i.F>7and mid(-8,(p(f.p,f.e,a)<<4)-48,n-108)or(n>>1)-60end function e5()poke(24405,0)if(fe)ex()else ey()
if(M)em()
if(f1)eg()
ep()poke(24405,96)palt(0)local f,e=-32+n,-n if(z>=3)f,e=-32+-X/2,-32+-Y/2
for f=f,128,32do for e=e,128,32do spr(148,f,e,4,2)spr(152,f,e+16,4,2)end end poke(24404,96)pal()if(z<=2)for f=0,127do sspr(0,f,128,1,sin(f6+(f>>4))*1.4,f)end
poke(24404,0)camera(X,Y)local f,e=i.r*2+2,i.F*2+2palt(256)map(0,0,0,0,f,e,1)fG()map(0,0,-7,0,f,e,128)fG()for f in all(fo[f0])do f:v()end palt(16384)map(0,0,0,0,f,e,12)palt()map(0,0,0,0,f,e,2)for f in all(g)do f:v()end ew()camera(0,0)local a,o=h(1),count(d)local f,e=p(127,115,O),a and 0or 87poke(24404,96)pal(fs)if o>0then sspr(0,0,128,128,0,0)else sspr(e,0,128,9,e,0)if(O>0)sspr(0,f,128,16,0,f)
end pal()poke(24404,0)local e=B<=i.k and 7or 13if(u and B<=i.z)e=10
local n=dget(i.s)spr(n<599.995and 147or 146,88,0)if a then?fE(B),2,2,e
if(fA)fl("new time!",32,2,e,1.3)
if(n<=i.k)?"⧗",81,2,9
if(n<=i.z)?"♥",75,2,14
end local e=g[1].j rect(96,1,126,7,7)fillp(fr[ceil(U)])rectfill(124-max(1,e/Q*26),3,124,5,59)fillp()if(u or v)fl(u and"stage clear!"or"❎ undo",u and 42or 50,f+5,7,1.3)
if o==1then local f=sin(d[1].l>>2)*-32+-24local e=y("stage "..C,f,106,7,0)line(f-2,112,f+e,112,7)y(i.E,f,115,7,0)y(i.L,f,122,13,0)elseif not u and z==1and C==1and e>5then y("🅾️ sprint",12,12,7,0)end end function ex()local f="0c38010f00380438080f05380038010f0438113b0f01587f113c0f08113b587f0f0111432438010f00382538080f24380038010f2c3831430f01587f313b0f08313c587f0f01313b"for e=1,144,12do sspr(c(f,e,1,1),c(f,e+2,1,1),c(f,e+4,1,1),c(f,e+6,1,1),c(f,e+8,1,1),c(f,e+10,1,1))end line(88,127,104,127,0)line(0,56,0,71,0)end function ey()local o,e,f,n,a=fj,0,0,false,false for e=0,10do f,n,a=21+e,o&1<<e>0,o&8<<e>0sset(f,98,n and 7or 12)sset(f,96,a and 7or 0)sset(f,92,n and 9or 4)sset(f,90,o&32<<e>0and 10or 9)sset(f,88,a and 10or 0)end for e=0,4do f,n,a=8+e,o&16<<e>0,o&64<<e>0sset(f,98,n and 7or 12)sset(f,96,a and 7or 0)sset(f,90,n and 10or 9)sset(f,88,a and 10or 0)end for d=0,7do f,n,a=103-d,95-d,88+d e=o&1<<d>0and 7or 12sset(f,101,e)sset(50,103-d,e)sset(78,96+d,e)e=o&1<<d>0and 9or 4sset(f,91,e)sset(52,n,e)sset(76,a,e)e=o&4<<d>0and 9or 10sset(f,93,e)sset(50,n,e)sset(78,a,e)end fj>><=1end function ep()local a=f8 spr(224,80,104,6,2)local f,n=80for o=0,32,16do clip(f,104,16,16)for e=0,15do n=sin(a+e/8)+104sspr(o+e,112,1,16,f+e,n)sspr(f,104+e,16,1,f,n+e)end f+=16end local e=g[1]clip()palt(0,false)spr(208,24,104,3,1)palt()if(e.x)spr(144,32,104)spr(144,39,104,1,1,true)
for n=0,16,8do f=24+n clip(f,104,8,8)for e=0,7do sspr(e+n,104,1,8,f+sin(a+e/8)+e,104)end end clip()if(e.x)spr(145,32,104)spr(145,39,104,1,1,true)
local e,n,f=(btn(4)or e.A)and e.i==false,e.q<4or u f=e and 214or 215if(n or v)f=216
spr(f,u and 37or 36,104,1,1,u)f=e and 252or 251if(v)f=160
if(u)f=250
spr(f,40,104)for f=0,23do for e=0,7do sset(79-e,104+f,sget(24+f,104+e))end end end ev=L("1d5cdc125848145949",6)function em()local f,n for e=1,3do n,f=((F+3-e)%3<<1)+1,ev[e]pal(f[3],f[n])pal(f[4],f[n+1])spr(155+e,96+(e<<3),8,1,2)end pal()M=false end function fG()poke(24405,0)camera(0,0)local f,e for n=0,34do f,e=(n<<3)%128,(n\16<<4)+8sspr(f,e,8,16,f,e,8,16,true)end camera(X,Y)poke(24405,96)end function eg()local o,e,a,f=g[1].B for n=0,1do e,a=4,5if(o>n)e,a=9,4
f=17-n*3for n=0,8,8do line(72+n,f,76+n,f,e)line(72+n,f-1,75+n,f-1,e)f+=1e=a end end f1=false end function eb(e)local f={t=c(e,1,1),f=c(e,2,1),e=c(e,3,1),u=c(e,4,1,1),a=rnd(),H=rnd()}f.R=f.f<<4|f.e if f.t==0then f.fl,f.fb,f.R,f.o,f.a,f.w,f.A,f.c,f._,f.g,f.p,f.ff,f.f2,f.x,f.i,f.d,f.q,f.y,f.B,f.h,f.j,f.G,f.S,f.I=f.f,f.e,-1,3,1,0,false,0,false,f.f,f.e,f.f,f.e,false,false,false,10,0,0,-1,1,false,false,false f.Q=ek f.v=ez else if(f.t==5)f.J=f.u f.u=87
if(f.t==10)f.f8,f.fe=c(e,4,1),c(e,5,1)
function f:Q()if(self.t<10)self.a+=.02self.a%=1self.H+=.035self.H%=1
end function f:v()local f,e=(self.f<<4)+8,self.e<<4if self.t<9then if self.J==nil or self.J==g[1].y then local e,a,o,n=e+sin(self.a)*2,self.u%16<<3,self.u\16<<3,ceil(sin(self.H*.5)*-8)if(n<=3)rectfill(f+7,e+1,f+9,e+14,7)
sspr(a,o,8,16,f+9-n,e,n,16)sspr(a,o,8,16,f+8,e,n,16,true)end elseif self.t<10then spr(self.u,f+4,e+sin(self.a)*2,1,2)end end end return f end function ek(f)f.q-=1if(f.q<=1)f.q=30+flr(rnd(60))
if(not h(6)or count(d)>0)return
Z=btn(4)and fa==false fa=btn(4)f.w=max(f.w-.2,0)if(btnp(5)and not u)e7()return nil
f.a=min(f.a+((f.A or f.i or f.d)and.2or.1111),1)if f.a>=.65then local n=K"2013"for e=0,3do if(btn(e))f.h=n[e+1]
end end local o=f.h if f.a+.001>=1and not u and not v then if(f._)eF(f)
if not u and f.j>=Q and not v then u,m=true,62483if(B<dget(i.s))dset(i.s,min(599,B))fA=true
end if(Z)f.w=1
f.A=false local e,d=f.h,false if e~=-1or f.d then::f::if(f.d)e=-1
local n,c,i,l=f.d,16,f.f+cos(e>>2),f.e+sin(e>>2)if(f.i or h(2))c=18
local a=mget((i<<1)+2,(l<<1)+1)if(a==121and f.c==1or a==51and f.x or fget(a)&c>0)n=true
if(f.i and not n and o~=-1)e,f.i,d=o,false,true goto f
f.h,f.o=-1,e if n and not v and not u then fq=true if(m==nil and stat(49)==-1and not f.i)m=61956
if not f.i and not d then if(not f.d)f.ff,f.f2=f.f,f.e et()
F+=1F%=3M=true end f.a,f.A,f._=0,tonum(h(3))~tonum(btn(4))==1,true if(f.d==false)f.g,f.p=f.f,f.e
if(e>=0)f.f,f.e=i,l
end end end if(u)f.o=3
if(fq and not u)B=min(B+(time()-fu),599.999)
end function eF(f)f._=false local a,o,d,c,l,h=f.f,f.e,(f.g<<1)+2,(f.p<<1)+1,true,true if(f.I)k(96,18,d-1,c)Q-=S(d,c)f.j-=1m=62278f.I=false
local e,y,x,b,t,r,u,s,n,i=mget((a<<1)+2,(o<<1)+1),mget(d,c),a<<4|o,(a<<1)+1,(o<<1)+1,(a<<4)+12,o<<4if(e\16==12and f.c==2)e,m=123,62084
if(e==52)R(19,20,3,4)m,n=-349,"78e"
if(e==53)R(21,22,35,36)m,n=-349,"73b"
if(e==54)R(23,24,67,68)m,n=-349,"7dc"
if e==55then f.B+=1m,n=63494,"49a"if(f.B==3)f.B,m=0,-349R(25,26,99,100)
f1=true end if(f.S)k(126,26,d-1,c)m=62084
f.S=e==48for n=0,2do if(e==80+n)i=f5[n+1]f.c,m=n,fx[n+1]
end for n=0,7do if e==56+n then if f.y==n then f.y+=1m=fP[n+1]for e in all(g)do if(e.J==f.y)e_(r,u+6,(e.f<<4)+12,(e.e<<4)+6)
end else l=false end end end if(f.y==8)R(27,28,74,106)f.y=0
if(e==18)if f.x then l=false else f.x,n,m=true,"67",63494end
if(e==51)f.x,m=false,-349
if(e==125or e==127)f.I,m=true,62210
if(e==121)m=fx[2]
local d=-1for f=0,3do if(e==113+(f<<1))d=f
end if(e==123)d=f.o
if(d~=-1)f.h=d
f.i=d~=-1for e,f in pairs(g)do if f.R==x then s=f if(l)deli(g,e)
break end end if f.d then f.d,i=false,f5[f.c+1]else for n=0,6,2do if(e==89+n)k(126,f.c<<1,b,t)f.g,f.p,f.d,m,f.f,f.e=a,o,true,63142,s.f8,s.fe
end end if(e==123and f.c==1)e=192k(112,14,b,t)
if(e>208)fH(f)h=false
if e\16==11and f.c==0or e\16==12or e==50or e==29and F==0or e==30and F==1or e==31and F==2then fH(f,true)elseif h then f.j+=1k(126,f.c<<1,b,t)end if(n~=nil)fI(r,u+8,K(n))
if(i~=nil)fJ(r,u+12,i)
end function fH(f,e)v=true if(e)m=61448f.G=true fJ((f.f<<4)+12,(f.e<<4)+12,f5[f.c+1])
end function ez(f)if(f.G or f.d or not h(6))return
local d,e,n,a,o=f.o,f.f<<4,f.e<<4,f.a if(f.c==1)pal(3,8)pal(11,9)
if(f.c==2)pal(3,13)pal(11,6)
if(a<1)o=f.i and a or.5+cos(a*.5*sgn(a-.5))*-.5e,n=p(f.g<<4,f.f<<4,o),p(f.p<<4,f.e<<4,o)
e+=(-1+rnd(3))*f.w+8n+=(-1+rnd(3))*f.w+8local a,o=cos(f.o>>2)<0,sin(f.o>>2)<0local d,c=a and e or e-8,o and n or n-8if(f.o%2==0)spr(211,d,n+7,3,1,a)spr(211,d,n,3,1,a,true)else spr(217,e+1,c,1,3,false,o)spr(217,e+8,c,1,3,true,o)
pal()end function fR()cartdata("cs_blobun_"..e9)if(dget(63)==0)dset(63,117)for f=0,59do dset(f,599.999)end dset(62,0x1.12)
end function h(f)return dget(63)&1<<f>0end function ej(f,n)local f,e=1<<f,dget(63)dset(63,n and e|f or e&~f)end function fz()return{N=dget(62)<<4&15,M=dget(62)<<7&7}end function e6(f,e)dset(62,dget(62)&~.9922|f>>7|e>>4)end function f3(e)local f=0for e in all(r[e])do if(dget(e.s)<599.995)f+=1
end return f end function fc(f)return f3(f)>=J[f]end function fK(f)return f3(f)>=count(r[f])end function fB()local f=count(r)return f3(f)>=J[f]end function fb(f,e)for f in all(r[f])do if(dget(f.s)>(e and f.z or f.k))return false
end return true end function fd()for f=1,count(r)do if(not fK(f))return false
end return true end function H(f)for e=1,count(r)do if(not fb(e,f))return false
end return true end function ef()cls(0)map(0,0,-24*l,32,19,2)map(0,2,l*2%1*-24,48,19,3)map(0,5,l*3%1*-24,72,19,7)palt(1024)local f=sin(l)*4map(19,0,12,8+f,13,7)if(not h(6))map(19,8,28,8+f,4,5)
?"2025 cyansorcery",32,122,3
?"v1.1",1,1,1
palt()pal(7,1)if(fd())spr(241,1,119)
if h(1)then if(H(false))?"⧗",113,122,7
if(H(true))?"♥",120,122,7
end pal()if(count(d)==0and A==nil)fl("press 🅾️ to start!",28,96,1,1.4)
end function e3()local e=j*a local f=e*8cls(1)rectfill(0,56,127,72,12)map(0,12,-24*l,56-f,19,1)map(0,13,-24+24*l,64+f,19,1)local f=f*.5?"presented by",39,60-f,1
if(h(6))map(19,7,18,60+f,11,1)
palt()fillp(f7[flr(p(1,4,e))])rectfill(0,56,127,72,12)fillp()end function fF()if(j*a==1and btnp()&48>0)if D~=nil then o(1)else o(0)end
end function f_()for f=-32+n,128,32do for e=-n,128,32do spr(204,f,e,4,4)end end poke(24404,96)pal(fs)if(D==nil)sspr(0,58,128,70,0,58)sspr(0,7,128,18,0,7)sspr(39,38,52,20,39,38)else sspr(0,0,128,128,0,0)
pal()poke(24404,0)palt(4096)if(D==nil)map(48,0,0,0,16,16)local n={{"programming","bug fixes","general"},{"art, music","art, music","music"}}for f=1,2do for e=1,3do y(n[f][e],f*64-46,e*24+42,7,1)end end y("director",58,42,7,1)y("created by",44,1,7,1)y("a plural system",34,26,7,1)y("seven spirits, one body",18,32,7,1)else map(32,8+D*2,0,32,16,2)local f={[[ you've overcome many
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

    you are amazing!]],[[  your exploration has
  led to the discovery
     of a new area!
       good luck!]]}y(f[D],16,56,7,0)
end function e0()l+=.025l%=1if W>0then W-=1if(btnp()&48>0)W=0
if(W==0)o(0)
end end function e4()l+=.01l%=1if count(d)==0then local f=btn(6)if(f)poke(24368,1)
if(btnp()&48>0or f)m=61828eA()
end end function e2()q=mid(0,q+E,1)l+=.02l%=1local f=count(r)if q==1then if(btnp(0)and b>1)m=61700N=max(b-1,1)E=-.125
if(btnp(1)and b<count(r)and fc(b))m=61700N=min(b+1,f)E=-.125
end if(q==0)E=.125b=N N=nil
local f,e=count(r[b]),btn(6)if(e)poke(24368,1)
if(btnp(2))w-=1m=61700
if(btnp(3))w+=1m=61700
if(w<0)w=f
if(w>f)w=0
if btnp()&48>0or e then if(w==0)o(0)m=63333else o(2,b,w)music(-1,500)m=61828
end end function e8()local a,f=ee,20+sin(q>>3)*29for f=1,4do pal(a[1][f],a[b][f])end rectfill(0,0,127,127,1)map(0,14,-24+24*l,-2-f,19,3)map(0,17,-24*l,115+f,19,2)map(32,-2+b*2,0,1-f,16,2)local f,e=122+f,J[b]if(b>1)?"⬅️previous area",1,f,7
local n=f3(b)?n>=e and(b<count(r)and"next area➡️"or"")or"▶solve "..e-n,84,f,7
local e=count(r[b])local o=max(min(w-5,e-9),-1)local n,d,i,c,l,f=13-o*10,o+10,h(1)for e=0,e do c,fL=e==w,n+10if e>o and e<d then f=n+3local o=r[b][max(1,e)]local d=dget(o.s)if(c)fM(4,n,90,fL)
pal(7,c and 7or a[b][2])if e>0then?(e>9and""or" ")..e.." "..o.E,14,f,7
spr(d<=599.995and 241or 240,6,n+1)if i then if(d<=o.k)?fE(d),96,f,7
if(d<=o.z)?"♥",120,f,7
end else?"back",26,f,7
pal(7,10)if(fK(b))spr(241,6,n+1)
if i then if(fb(b,false))?"⧗",113,f,7
if(fb(b,true))?"♥",120,f,7
end end end n=fL end if q<1then palt()if(E<0)pal(1,a[N][1])
fillp(f7[flr(p(1,4,q))])if(E>0)rectfill(0,22,127,112,1)else rectfill(0,0,127,127,1)
fillp()end pal()end function f9(e,n,a,f)add(d,{fn=e,f5=n,f6=a,fa=count(f)*10+6,C=f,b=1,D=.25,l=0,U=function(f,n)local e=count(d)local n,a,o=n==e,btn(6),count(f.C)if(a)poke(24368,1)
if f.l==1then if(btnp(2))f.b-=1m=61700
if(btnp(3))f.b+=1m=61700
if(f.b<1)f.b=o
if(f.b>o)f.b=1
if(btnp(5)or btnp(4)or a)m=61828f.C[f.b]:fo()
end local a=true if(n and e>1and d[e-1].l>0)a=false
if(a)f.l=mid(0,f.l+(n and f.D or-.25),1)
if(f.l==0and f.D<0)deli(d)
end,V=function(f,n)palt()local e=count(d)local n=n==e if(n and e>1and d[e-1].l>0)return false
local e,r,a=count(f.C),count(g)>0and 147or 241,p(5,f.fa,f.l)local n,e,o=f.fn,f.f5-(a>>1)local a,d,i,l,b,t=n+f.f6,e+a rectfill(n,e,a,d,1)rect(n+1,e+1,a-1,d-1,13)local u,e=n+8,e+6for s,c in pairs(f.C)do if e<d-9then i,l,b,t=n+3,e-3,a-3,e+7o=s==f.b if(o)fM(i,l,b,t)
pal(7,o and 7or 13)?c.fd,u,e,7
if(c.m~=nil)spr(r-(h(c.m)and 0or 1),a-11,e-2)
end e+=10end pal()end})end function fg()for f in all(d)do f.D=-.25end end function fN()m=63333d[count(d)].D=-.25end function s(f,e)return{fd=f,fo=e,m=nil}end function f(f,e)local f=s(f,function(f)ej(f.m,h(f.m)==false)if(f.m==5)music(h(5)and 0or-1,0,7)
end)f.m=e return f end function es()Z,fa,m=false,false,61828local f if(not ei and fc(z))f=5
if(not ea and fB())f=1
if(not eo and fd())f=2
if(not ed and H(false))f=3
if(not ec and H(true))f=4
if(f~=nil)o(5,f)return
local e,n,a,f=s((u and"next"or"skip").." puzzle",function()if(C+1>count(r[z]))o(1)else o(2,z,C+1)
end),s("restart puzzle",function()o(2,z,C,true)end),s("stage select",function()o(1)end)if(u)f={e,n,a}else f={s("back",fN),n,e,s((f0==2and"hide"or"show").." hints",function()f0=f0==2and 1or 2fg()end),a,s("options",fO),s("go to title",function()o(0)end)}
f9(16,64,96,f)end function eA()f9(24,96,80,{s("start game",function()o(1)end),s("continue",function()local f=fz()o(2,f.M,f.N)music(-1,500)end),s("options",fO),s("credits",function()o(4)end),s("back",function()o(3)end)})end function fO()f9(16,count(g)>0and 64or 72,96,{s("back",fN),f("show timers",1),f("slime overlap",2),f("sprint by default",3),f("sound effects",4),f("music",5),f("lesbians allowed",6),s("pico8 menu",eq)})end function eq()extcmd"pause"end function fM(f,e,n,a)rectfill(f,e,n,a,2)fillp(fr[ceil(U)])rect(f,e,n,a,154)fillp(0)end function f4(e,n,a,o,d,f)if(count(P)<100)add(P,{f=e,e=n,T=a,o=o,fc=d,fi=f,K=f})
end function fJ(d,c,o)local f,e,n for a=0,.9,.1do f,e,n=d+cos(a)*4,c+sin(a)*4,a*360f4(f,e,.9,n,rnd(o),12)f4(f,e,1.8,n,rnd(o),8)end end function e_(a,o,e,n)for f=0,.8,.2do f4(p(a,e,f),p(o,n,f),0,0,14,p(5,12,f))end fI(e,n,{14,7})end function fI(e,n,a)for f=0,.9,.1do f4(e+cos(f)*4,n+sin(f)*4,.8,f*360,rnd(a),8)end end function eh()for f in all(P)do local e=f.o/360f.f+=f.T*cos(e)f.e+=f.T*sin(e)f.K-=1if(f.K<=0)del(P,f)
end end function ew()for f in all(P)do pal(7,f.fc)spr(flr(p(163,161,f.K/f.fi)+.5),f.f,f.e)end end
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
fff2ffc7f2f9ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11feff7f23fcffff46f8ffff8df0ffff1be1ffff37c2ffff6f84ffffdf08ffffbf11069366fffffff07fea4f1042386597badcfe1e49cca54dd575a4aa796ccfeaba7238d4f5e573aaeb4dbdd7e1ba7bb8d4f5437eb88afdd1d92fa9fd935a53d73f7d
bdeafa25bff4fb1ecfe11fffc83333796626c74c1650bb2c31b031636cb644ec3242c06c36137ec9d47ede1fff1c0eff3c4b7c9a9d81437626399677f932cde2723f67cc811f6219205f9eba2651cd1638644bd2e57d93dcaefc1197c793c6a19e58021e47b3599fd379fdf1e81fff7c7f38fe70ffc2b95c4ff7cffeb025f3d9
73d622162f379b5912c71fc948229664c6e05bb6ed9f65bf0cff583cc4fe11bb0464961fbeedecdde568ddcffef8fcf0f511c6c9138201d8fd83f8e56190920b801dc484c0558271807b57c50fd807cf120bbec3f3433df1fef0e9d5eb68691ef9a33dcc7e00672ccfb33ea2cfe1e3f2f95ef74384109b632e07cb97676b7799
15dc7976ba376d08916cfe70c893f2f96a47aef3f35c693cbeef387b1d79c5c1c30fc60ff9ecbd77bd07273fd88e4bfa06301e8af992c7be77961cab1090cc277bb017731cf2b22389ce798847e5e64dcbd3e7ba9294c78eeb17fbc10f9830bbced90fc70d3249c43e1f0e9ffdf3858b60109b590c83453209ff807f4822f609
ff60e28f7ce7cef7eb9b2f87fb0ca78b3cc97eb0e5b0f9219958dcae1daf1e2f1787fdf14c0391e9dcf9d6be499f3cfbe35dfed019596231cb153b7a9aa3ce3bcb1f697eb123f8c3f9b87a389fd799d8f24b5efe49f6cb9e7edb374f7f41b2fc22f9e596fc1389f2472469487c76ab6ffbe5b57f26fb27ffed3bda7b3b7e30df
b7eb6d92cad3a4c988ed17f61cbc793c4ecf0e5f3dc7d9bce6f94534afb7e7f18be7f9814ab89fafebfa472fa2f9c70fd6e10f737048574a96c84bd7eb6bc6221e6fb63fb23c93dcf9d53fdb7e40dceef1fd73ecb11d3fd8bde6d999ebf83cbfecf08fcd7324456a81083a60734886d4021174c040bc497e48dc3b3e3cae3841
49f6e63bee7ce5f338e697b146c41103b660c2f642c90883789348bcd9fe819259186cff842012409ee7714520e679ded7557f587fc8f33df97c927f98313f1cc992fcc3f407f14740f64f4efbe307fc92f96301a09e57f60bb388657ad8bed83e96aff14b3e5c24fc03ae399bce19c9d9c3e33bfc627e902032772664cbf2cb
11bf2cbbaa56e2cd9edcf6c792cab16c218ecc1f8d2f4b7e91fe91ed872b7e993f082761e1f1cac12e3cec30ef916fffe40f3f8834a47e809732c6c539ec87a7f60b7403a3c4e20a9210c824bf5898f00ff88760feb078ed7525f8eb0f97338f6bc7b77e3d60c9b9fdf31c8ed3e323c36e8c1ff8c15e074bccf1886fc0fe08c7
3d02de6de1183607ec1fb15f94d7e21f6a318b9708fde3b91c3f7cdfbee479385c7bd7efc06375e5f18ff9653ec61fc4f14fb819282569f8057c04ccf1cb38122725d491c40f13c6982363f30be88e0fe5e697fcb0cf53df991e87434e4b7224b96c7eb01ff6cd1d8bcb5ee19deff2cb5f5ef23ff0feec89ee7aac070ed775fc
323fe8d13db91edf75e07ff0c77dedfa677b8f63c7b61ff6cc214f634dfc70e498ca53f14b923fd6fdb2ed5812fc0f8e74c73639f66dbb76eceda6b127b13f1cb9daf9e397cb792d3b7ef99ceb7bfb04e1d8e7e3da6eec3d398a5310b110e287d421fcb11209c2b15fc03691530a392021f9e3f4cb7439fe4893953d9e3c4f76
e432596cc90ff60f89c348822daf0991c59b68e248987f2cf9456489f923f14766c491e4b42d22902ce2a7ebf3c375fdf043de137bf8a59e4faf90903c121212e2bdfcf0f0931f2ed7e5fcc771991fb91d479283e4fde7cd3fccfeb05c72afdff98f6f97f2ec79b25dc42f99c3be6d7f987f6c922bbf743dcb3617f8bafe6365
d33dc976106fe690ff856d3f98db194efb61cfb53ec777be879eb90f71507ffcf0cbe74ef379bd96647ed1214e629fb83ef1cf1f23b69db3d4d97173d83fc81fffa8eb98e38cbd00ff48c4cbeb1e4ebfb87f99fef3c377f9a1af27fdbe5dfd837181871fecba8f61e5c81685fd10728a7bfe003841b888fc22fe20f6fd813fe6
993fc0c10f38dce60ff28ff80e87fcc031bfb47e78b7f3cbce3ff61edbf1cecee7b43787bca2903d81c821077c399c266241ce65ddf80880091f1fe1062156913fc40dbbf7d93f50c871e68f2b7f3cef79af5f4a7bb4d90f0f9dd7975b7699104148ff0102ec0f71fc20be2bb1896fafd884635ad2175fbff7e33b731c791e70
357afc7250ad1cc022fc02a95c2f2eec802e87058b70c399f1037e217611cb017f4022d70fe2820f5263c10f1fd99ee7b98ee8733c1789fee6bcec3fbd9dff73e5fd72f9ffff8df0ffff1be1ffff37c2ffff6f8401f664fffffff07fea4f14023876e5a9fbdc2622ae75a9ba8e3c2ecde3f198ebcba9aa674a9eeabb9256ef95
b4fac3fe20adfeb2b751fd2513d3e368a38e7fdafbe0f030973c33936766b29905c7cc668c8d03c60e9648262c13b619b621f18427c432c426ff7d3fec3eeafe83b8f68f2d71adb67fe21a5be2d81f1602939026b65d9b38d4465c9b2d71ad3671adb6c6b1c3426012d2c4b663d0e7cae17a8ee3f8e59f3fec977ffee0e1253c
__gff__
04841fc007fe20841067fe79c5c4f147bacc47289980804c0821e04492588439937fc412bbb6fce18ffd23fde7b9ea929cd61cfc60c7fd8b544462883fecf2cba13016e211866033329098444466e50f7c8c1fc04d12c31c16043f9cf9e5dc79343de627befde2eb1fe39f1d8947930b5924975f24f79187e36862e2c3f1df16
6352a15be2d024243f845d5e0939a8e6ca27f9433cee1f4ef29d7aa18e1c7f5c5f92ce3f73cdb9fcb02339c2c575ed390e276f434693c4985ef64403c40fe15eaec863c72907091547927736b95c8f2d8e840cf6cbc7e3edb133a944669bfe4213624bf21c19d9a50c13f9eb3a34f9a3618f3d8f6b7e398edd8ee3b207c47e11
__sfx__
2b089cc607a240fc451e83607c07031451cf012547618917046003176402d632110121c44158011dc371363707b742fc3412c3435754354070d773230311f4003f3621f77219d0603b0010047300413026122b61
d8f2c7f315a4702a042b0200e40430f113f976137732fb170b9712774534b7732974354323f903194323f1063e1023f3432fc34004770067526f7139f20096330a45133e152f41702e1600f031f07709f551f833
f7f7c7d33d8430073637f07187713051732845237310ba070bc2302f1421d70100700b20701b77008033f97318f371906120f20057060b9470320712c5313c5707c740f07738c633e96721b4721b550ef3439136
8021319927f0307f4431943007360bf3401f0400b0100d3435a470560532c1011017000361f9340f8603f9042f820029572e0613f26307d7136e6623c3423c4701b702f7260977007a63222170b7071a1162f172
17714dbc20c31240242c6701125412e440440207b67128372686130673162240216332c47076633f3612f1773802617432126241323424a14112551e453200512cc40085242e95424c0421e0412a501415509966
38a2dec324c4124c503075430b3025b461291627a361d3371cf070f7720ff170b91610b470ea260e0521ac5003f032330231146243033797127b6722b3127b0638611131772087531e303895127f301dc3024630
e69a871f3f4530ee1609f1613e363a67708f431cc7304772336422747238804050720ce043f806023023026711e401f0722f8470760702177091260e10731f50337661d5410c677243763fb47329320b9753e447
eb7fe29a38947016773817017b200720730b6431c0621f2630a7730f3421f022cb173010711164260611c2630ea7733f5403a1031517389333f8373d17731e6733e763d9113c44726f413377723b5324b013ff40
c4d5c4c42bf441f8773f777238673ff77069473ff770da073ff771bc063ff77378143ff772f9203ff771f3403ff773f6013ef773f5123cf773f33418c6123d773ff77307772a774002262142723e613ce761ec44
f7fce13d3592631d422b7543f616074171c6571572727f3027f701d8713f867207303913626c740cb2619e413c41313636269170c3641ee4109713334472613207b640030318416336560ce64184530ca673ff12
c3f8e3480e5333f143367541683631c413cc5038917243113fa260832224c531a4010fa4124b5404b5618b1330c700ab26199241965213a6531547254761c07409c441e234165052af450f47637f103db053f864
eea0c90f0ef5439b240fc43327543e9452f8613b152079420c1132191418f011ce110477202016336442e2611d9721f9270fc132d74033b6712b47212173cf01382131f6163bf2431c32238763cc472134712c03
d9fd143b0b7542c40724d470370208222122431eb43327553ec51137711766107f012b7020e67316e160f222279161be37099730b7573d3071dc3436e2720e521f01410c3434402311361e54022f302710308663
873d4b8a1431714b160fc503f0172cc5721f45213322d7712857700d7423d7334d513f8123b82136e040ea201c4122d86608771245070a6303947307a442af701f0373a1631d72323a70377442e1160bf241f037
3649339b1f1432d60615c67015202ba4523541221302b64320824168372d87001c0337c0318612001112ca161f2472ea2631d66388510bf552ff553d56739e3107f172a4313d522399703ec47227071ec353e745
d1c9749e24f712577122b5425b64118171c574156541ad3004b642dc3412b6319e643c30239a4003d70237303e5431e76127d7126f5727e470767524f3027c47079673005432f7038d320b4121ee4723d4124730
62a747be19b413f104276170065736c362cd431fe0425b4721f54175753e54312c742b5733c5540667136677306770c37321f712d8112cd44305663f90120d7320903186672d66518f403d71509a5537e4509661
031e7030077371ee422ab373ac173d867126543dd3023c363b0700ce143ca0632d02047203fa65280500c9411b64021134386020fc30034270066438b413df071506704a663c933254473a2731db173450211c57
bd47137f1ee0039603378660784705867010103b72003222056513ca06054352a14130c7700a06185111f7731af1607676091161f9312be57237562e97223467336103e9411b8113f9161aa640f8061e6313ce54
10c24df82483334c442587539712335033f22239324166443e14632b4426f071ff462bb71377472f273376723f8663396624f003d7013c9032b0423167504631360063c8030b01438f001853638020306062f756
fd70387e030002783430f6639a173dd3534c7524f5533b633f8630e5532ee550e67718f603df103d9143f8031a6210e436247312eb03013063021601243095470237138e04070501e9450de6107c5307a040f837
ff6f84ff39f06387222a754174762db073c7563ff770867532d573ff770da073ff771bc063ff77378143ff772f9203ff771f3403ff773f6013ef773f5123cf773f33438f773ff6030f773f75121f773f73302f77
3365e7e83ff7508c773ff73118773f777238673ff77069473ff770d2033fb203f77723f342ff773f7322db763030004030080500ee60214273d5651b5453bd400be0121022260422a8110d52537d003154639d21
b6b82a112a30402124061440a1640e1051212516145065762bd20374660300622126261462a1662e107321273614730c0002a2006a400aa600ea0112a2116a410450621b1624b0222a2226a422aa622ea0332a23
7d7ef8fa1201202b2406b440cb7410b1514b35183433101322d651ab751a9513a9773a21233500190510c07002420094623f5433a014036622e0501144213421174611e0651e91734b37184511d473076633e022
ebf7ffc13c321168611e223368633ea0403f243d42311d0223e223b4323d73209911244441222233927389723e4733cd363bd7730f342fc4727f323f2771b9773bf061f4733eb453f4773df37277523f5773ed57
fe7fffc71f4733d7713e7313ff703c7743e7723ff672f17738f063f7173f7761cc7723e573f7071ff671fb753ff323ff253f752099112444412a263f9373fd571ff673fb7707e7707f7725f77337773a7773df75
8ffcff933fe733ff363ff143fe772b7713ff473f8673fe671fa7727f770fe763f7003f8273ef733fe773bf753ff352ff77293571f8773fb042f5773cf7703e773fa073f7713ef7704f773fa473f7513ff7723f77
d3ff9ffa3ff7332f771f9773fb643ff73199770747327b573f7533ff713ff542fc772bf773fe073f6443e7343fb24389663ff373fe771f5433e7360f7703ff533f6773bf663ff773cf7721e773f9273ff313ef77
7ff2ff5f3f7353f7772bf773fd673ff033f77736f7717b773ff512bf770ff673cf772fb6539f673cf771bc473fc7731773196713ff473fa673ff633ff7737f7707c112444412222099773ff063f7753cf770fe77
fffffbff3ef770df773ff473f7343ff7729f771fd673ff723f77736f771f3110ea612ff771ff671fe771f8770fd771be7638f5619f773ff673ff1439b673ff161fb7730f7717e773ff173ff713ef7717f673ff55
ffff7ff80fe773ff173ff733ef771ff773f3673e3433ef773d7730ff773af363f71438c2739a773fb773ff77078670f8773bf773ff003f4553ff301f37738f773fb103ff773f8473ff7704e773f77538f773fb30
fff03f783ff7708e363ff77270171d6140ef773ff7230f673ff7705f773f7703cb073f8433f7430f0123f877389362ff67389673f77704f773f7343cf773f9343ff7707161112450ff173fd070bf7726e773fb27
ffff9ff912c053ff771fb473ff770ee6711f673ff7707f773ff30244463e9663ff770fa673f77709f773f7373cf773ff441be240bf173ff7729c733ec773ff73321770bf273ff772dc773ff7732f773f7033ff75
f5bf283f3f75135d673f7770df773ff753cf773fb143fb263ff673fc460fe673ff771ce733f7303ff773fe173eb173df773fd743ff7717b672f9713ff773fa471ff273f9273fc553fb67391222177721c350fc65
499224493c7373cf773bf773ff7739f773fb023ff771f854099762bb473ff771ee773ff7139f773ff5007f272ff443ef773fa463ff770fa7423d773ff7134f773f75429f7039f773fb323ff773f9573ff7728222
ff97ff7f12c573ff7729e773ff723af773ff5217f0639d773f7732bd773ff7335f773f7553f7770e37021b053ff772fb573ff772fe773f7703bd6732f773f7023fe670ff773f7772cf773ff543ed671fe670fb67
ffb7efd832f773f7363ff771fa373ff772b573399363dc2024f573fe671fb773ff7722f723c7723e22209c010bd101df770be773ff7238f753cb051fe773f77325f723fb773fe7727f163af0532e773f7763bf77
f8ffffbe3ff7707f673ff771c9512df7712a343df673f77718f773f731347773ff773f7313f4713ff7725b603f8773ff732ef773ff763ef5729f772fa633f7613ff771fe373ff773bd773f906388673af543f773
ffffdff83ff773ff573ff7700322099112444412e160f6750ef773f7713cf773fb143f77730f773ff3037f7731f373f6173e7753e7613f3433e9553f77538a773ff043cf71369671fb772fd773ff7138f773ff50
fe5ffdff3fb4725f743ff771fb573fd671f97739f773fb213ff343fb461fe773fa073ff770fe771b6713af312777733f343ff773f0753ff3123f7717e77017473fb533f7143fb173e7753ed4439f773ff013bf06
0b3507363ff543ff2638f5637b662f44104e7717e770bf373ff77291000903032e0337e433fa340bf34037701af550c0400d07034a433ee6330a240cb740db042af563d30102410018330fb651d302048662d323
1fc22e2d336331ef750452406963079762f7111543119c532342227442140311805101322260422ac44185451a5551c5651e575285462a5562c5662e5763050732517345273653700e0002e1004e2006e301e461
5f373f1c2f8441050512106211163c5673a557308600da500b204385471b06133840096522c4141201322014314043e5770ee70384433a4533c4633e47311044091540b1640d1740f5021ba223f96207f1622753
3cffafff3bf16176713cb070f7743fb67357513bf76077733fd1617d753f6733ff673bf7700f7721f7323f671f9673f87727c7717e770df7727b473bc7723c673fb671fa773bf731cc473fa672fa663fb173fe07
ff67fb5f197743ff333ff653f74239f733cf7612f770d914228173fe473fa243ff0609f772f77728f713ff163fb663fd470ff77337773af153ef723ff553ff7439f773df753e7772c7773bf7738f71084353ef34
23b2ff7f3ff763e77432f773e77125c7733f773b9373fe773f87725c771b6223f751179773fb043f77320f772f8071ba673ff3023c573f7113ff7701e673ff501fc453ff7538f753c776124433df770f07339f77
a796efe7327770fe673ff213fa453f7140ce770df433ff77327773977119f771f6433e77332f772f1770a9773fb740f65326f7732f773f91726f770fc443ef7711e770fe673ff223f7533bf770f9243477735f77
ff7f32ff3f77735f7737a7727e573f7753f7772cb471f9773ff133ff7336f772787737e773ff663ff743d7773ff730b9172f7773e7331fb773ff653ff751be363ff773df7701d771ff773f9473f7311dc473ff70
af24247c23c623df7222c7535f772fc773fb363cf770ff773f05127f773fc673ff523ef7706f773fd673ff133ef7706b36275443ee373ff753ef771df473ff733f77718e773f9673ff312df473ff743f7771ae77
fffda5ff2ff771f8473ff3509b773f3373ed653ff7716b671fe773f2653f7773cf773fb673ff073f77334f773af7738c553f7772e8373ff353d9673f737398770f92433f772fd773fb673ff7126e333f7773fa67
28f7feff3f77120f7733f512fe070f7771601726f773f73012e673f77701a443ff771f82207f263ff7403946379673f77702f773f7723477735f303df710e6711cf653ff77378673ff77039653ff771fc0717f77
fc7fc2ff3f9163ff772b8773f42225f773f7723ef773f4142df773f7331a97323f773f7533ef773f7123e73539c77276773ef773f9442cf773f7343ed771fc533ef773f2221ae733fb5732f773f7323ff771fa11
1fdfff3f089773f77725b403ff772f50632f773f77211c363bf753fb173ff473f8571fc670f5163ff362547311e771df773106337f163fd243f7350236413d32087513f77117e363ff772316312c771fd710cf77
53d9ff813ff753cd753fb263ff772711336f773f723128013ff052cb54082231fd773ff7706f77287743f9671fa770fc0724e7723e770f366228263b8673f7770eb6301b0123c0137a612ff773ff760c7130b341
ff94ffff10e763cf773fb713ff773f7442cc7408b61194021ce7539f773f7043ff773f0273df773f50532e773f7730ae563cf773f3223f9763ff7717a1123f773ff512477732f773f774199773f7732a8713cf77
23fcffff2fa173ff77179063ff7733a403cf773fb3138f773fb722df773ff7336c473ff7730a243ff770fe643ff7717e073ff772710004f023ff773fb073ff460f101272753ce600691739c773f775118773f777
ffff46f8069473ff770da073ff771bc063ff77378143ff772f9203ff771f3403ff773f6013ef773f5123cf773f33438f773ff6030f773f75121f773f73302f773f77604e773ff7508c773ff73118773f77723867
b8bb7d933ff770da073ff771bc063ff77378143ff772f9203ff771f3403ff773f6013ef773f5123cf773f33438f773ff6030e773fb1135d341ee3639a573cc5531f263c9733de7437e57116710ee150e67336f30
0fb35ffe235772c7303fa473cb1633b461547707f232d5533eb4721f311f8703f17719b6731f143ae740ff5411c2708e17076663f06627f072d7271fc5727f263bc7523f6523b552f44712f363a7363676636541
9e49efc408c303eb1612430172663b065397123ec7720b270b6522eb632f7703cf160f2633f067076171f9703bf3034b77257431dd741be47217173cf173c7160e0373fb061f2671177324d751565616f273b016
f941728c0773227f413d1321365637f452fb67037271df732c717317303f0013b2632e61237f513d7042d37331b5727877383753a5431e6773a1053907710d3303b721d317049572e4333f6531c0773115309770
e4c80fdd3f0631c3373ec7138c1607c77147063e5473c4733ce743e9033f9710fe703f9663eb7730a5703f0739f263ce402bf7123e770477036d360f8512cf16202713fb4437f260f6772e6362e7713c3172d473
000000000fc651fc511db07317302370725b462e6772a535002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
0a 103b1976
08 090f4904
05 0324424b
0c 0c5c305b
0e 2f166324
0e 762f547e
06 70586330
0a 70400e65
02 07460f32
02 62762837
02 757f217f
06 5c077963
03 4e630f47
0d 6708317d
0c 30395230
0f 3a4d6a61
07 07391024
09 11265620
08 04132402
01 79245648
0a 125e3911
01 08052e0b
05 021f1a1d
0f 0f670867
05 70137967
0c 7e587703
03 2c094802
02 49134872
0b 6a767005
02 6c114407
0e 391a2719
04 7c7e1827
02 72697125
08 0e4d4272
0a 244c2410
0c 075f624b
0c 21197c61
0d 4e1f6c3b
07 746a1a7f
04 762d7901
03 007c2241
06 2c1e451f
05 191f484e
0d 6346271f
0c 38630b05
0d 7a2e160b
0a 6c463f78
01 422b330e
09 191d572f
07 634a617d
08 1e4b2e40
04 6c067047
09 281f2609
03 4378030c
0e 302e6862
05 1f507f5c
01 321c2435
00 06061837
01 606f7d2e
07 644e111f
06 4a56776d
06 736a7243
0a 376f0f0f
0e 3e316862
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
