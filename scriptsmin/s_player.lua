function player_step(self)self.blink-=1if(self.blink<=1)self.blink=30+flr(rnd(60))
if(not setting_get(6)or count(g_menu)>0)return
g_btn4_press=btn(4)and g_btn4_held==false g_btn4_held=btn(4)self.jgl=max(self.jgl-.2,0)if(btnp(5)and not g_stage_win)perform_undo()return nil
self.anim=min(self.anim+((self.sprint or self.oncnv or self.inprt)and.2or.1111),1)if self.anim>=.65then local _t=str2tbl"2013"for i=0,3do if(btn(i))self.nextdir=_t[i+1]
end end if self.anim+.001>=1and not g_stage_win and not g_stage_lose then if(self.ismv)player_end_move(self)
if not g_stage_win and self.ttch>=g_tile_count and not g_stage_lose then g_stage_win,g_play_sfx=true,62483if(g_p_time<dget(g_p_sst.s_st))dset(g_p_sst.s_st,min(599,g_p_time))g_p_new_time=true
end if(g_btn4_press)self.jgl=1
self.sprint=false local _new_dir=self.nextdir if _new_dir~=-1or self.inprt then if(self.inprt)_new_dir=-1
local _can_move,_check,_chx,_chy=self.inprt,16,self.x+cos(_new_dir>>2),self.y+sin(_new_dir>>2)if(self.oncnv or setting_get(2))_check=18
local _nextblock=mget((_chx<<1)+2,(_chy<<1)+1)if(_nextblock==121and self.pstate==1or _nextblock==51and self.haskey or fget(_nextblock)&_check>0)_can_move=true
self.nextdir,self.dir=-1,_new_dir if _can_move and not g_stage_lose and not g_stage_win then g_p_started=true if(g_play_sfx==nil and stat(49)==-1and not self.oncnv)g_play_sfx=61956
if not self.oncnv then if(not self.inprt)self.strnx,self.strny=self.x,self.y add_undo()
g_p_zap_turn+=1g_p_zap_turn%=3g_p_updt_zap=true end self.anim,self.sprint,self.ismv=0,tonum(setting_get(3))~tonum(btn(4))==1,true if(self.inprt==false)self.oldx,self.oldy=self.x,self.y
if(_new_dir>=0)self.x,self.y=_chx,_chy
end end end if(g_stage_win)self.dir=3
if(g_p_started and not g_stage_win)g_p_time=min(g_p_time+(time()-g_time),599.999)
end function player_end_move(self)self.ismv=false local _x,_y,_oldx,_oldy,_destroy_obj,_doslime=self.x,self.y,(self.oldx<<1)+2,(self.oldy<<1)+1,true,true if(self.prvcrfl)tile_copy(96,18,_oldx-1,_oldy)g_tile_count-=proc_cracked_floor(_oldx,_oldy)self.ttch-=1g_play_sfx=62278self.prvcrfl=false
local _tile,_prevtile,_poskey,_tcp_dx,_tcp_dy,_visx,_visy,_collision_obj,_partcol,_ppartcol=mget((_x<<1)+2,(_y<<1)+1),mget(_oldx,_oldy),_x<<4|_y,(_x<<1)+1,(_y<<1)+1,(_x<<4)+12,_y<<4if(_tile\16==12and self.pstate==2)_tile,g_play_sfx=123,62084
if(_tile==52)tile_swap(19,20,3,4)g_play_sfx,_partcol=-349,"78e"
if(_tile==53)tile_swap(21,22,35,36)g_play_sfx,_partcol=-349,"73b"
if(_tile==54)tile_swap(23,24,67,68)g_play_sfx,_partcol=-349,"7dc"
if _tile==55then self.coins+=1g_play_sfx,_partcol=63494,"49a"if(self.coins==3)self.coins,g_play_sfx=0,-349tile_swap(25,26,99,100)
g_p_updt_coin=true end if(self.prvsltr)tile_copy(126,26,_oldx-1,_oldy)g_play_sfx=62084
self.prvsltr=_tile==48for i=0,2do if(_tile==80+i)_ppartcol=g_pal_state_part[i+1]self.pstate,g_play_sfx=i,g_sfx_pstate[i+1]
end for i=0,7do if _tile==56+i then if self.octg==i then self.octg+=1g_play_sfx=g_sfx_octo[i+1]for _o in all(g_list_obj)do if(_o.oct_ind==self.octg)part_create_octogem(_visx,_visy+6,(_o.x<<4)+12,(_o.y<<4)+6)
end else _destroy_obj=false end end end if(self.octg==8)tile_swap(27,28,74,106)self.octg=0
if(_tile==18)if self.haskey then _destroy_obj=false else self.haskey,_partcol,g_play_sfx=true,"67",63494end
if(_tile==51)self.haskey,g_play_sfx=false,-349
if(_tile==125or _tile==127)self.prvcrfl,g_play_sfx=true,62210
if(_tile==121)g_play_sfx=g_sfx_pstate[2]
local _dir=-1for i=0,3do if(_tile==113+(i<<1))_dir=i
end if(_tile==123)_dir=self.dir
if(_dir~=-1)self.nextdir=_dir
self.oncnv=_dir~=-1for i,_obj in pairs(g_list_obj)do if _obj.poskey==_poskey then _collision_obj=_obj if(_destroy_obj)deli(g_list_obj,i)
break end end if self.inprt then self.inprt,_ppartcol=false,g_pal_state_part[self.pstate+1]else for i=0,6,2do if(_tile==89+i)tile_copy(126,self.pstate<<1,_tcp_dx,_tcp_dy)self.oldx,self.oldy,self.inprt,g_play_sfx,self.x,self.y=_x,_y,true,63142,_collision_obj.dst_x,_collision_obj.dst_y
end end if(_tile==123and self.pstate==1)_tile=192tile_copy(112,14,_tcp_dx,_tcp_dy)
if(_tile>208)player_destroy(self)_doslime=false
if _tile\16==11and self.pstate==0or _tile\16==12or _tile==50or _tile==29and g_p_zap_turn==0or _tile==30and g_p_zap_turn==1or _tile==31and g_p_zap_turn==2then player_destroy(self,true)elseif _doslime then self.ttch+=1tile_copy(126,self.pstate<<1,_tcp_dx,_tcp_dy)end if(_partcol~=nil)part_create_item_grab(_visx,_visy+8,str2tbl(_partcol))
if(_ppartcol~=nil)part_create_slime_explode(_visx,_visy+12,_ppartcol)
end function player_destroy(self,_kill)g_stage_lose=true if(_kill)g_play_sfx=61448self.isdead=true part_create_slime_explode((self.x<<4)+12,(self.y<<4)+12,g_pal_state_part[self.pstate+1])
end function player_draw(self)if(self.isdead or self.inprt or not setting_get(6))return
local _dir,_x,_y,_anim,_offset=self.dir,self.x<<4,self.y<<4,self.anim if(self.pstate==1)pal(3,8)pal(11,9)
if(self.pstate==2)pal(3,13)pal(11,6)
if(_anim<1)_offset=self.oncnv and _anim or.5+cos(_anim*.5*sgn(_anim-.5))*-.5_x,_y=lerp(self.oldx<<4,self.x<<4,_offset),lerp(self.oldy<<4,self.y<<4,_offset)
_x+=(-1+rnd(3))*self.jgl+8_y+=(-1+rnd(3))*self.jgl+8local _xflip,_yflip=cos(self.dir>>2)<0,sin(self.dir>>2)<0local _xpos,_ypos=_xflip and _x or _x-8,_yflip and _y or _y-8if(self.dir%2==0)spr(211,_xpos,_y+7,3,1,_xflip)spr(211,_xpos,_y,3,1,_xflip,true)else spr(217,_x+1,_ypos,1,3,false,_yflip)spr(217,_x+8,_ypos,1,3,true,_yflip)
pal()end