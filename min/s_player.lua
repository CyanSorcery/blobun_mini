function player_create(_x,_y)add(g_o_list,{type=0,x=_x,y=_y,startx=_x,starty=_y,pos=-1,dir=3,anim=1,sprint=false,jiggle=0,ismove=false,pstate=0,oldx=_x,oldy=_y,startturnx=_x,startturny=_y,isdead=false,haskey=false,onstep=player_step,ondraw=player_draw},1)end function player_step(_obj)if(not setting_get(6)or count(g_menu)>0)return
g_btn4_press=btn(4)and g_btn4_held==false g_btn4_held=btn(4)_obj.jiggle=max(_obj.jiggle-.2,0)if(btnp(5)and not g_level_win)perform_undo()
_obj.anim=min(_obj.anim+((_obj.sprint or g_p_use_conv or g_p_use_port)and.2or.1111),1)if _obj.anim>=.65then local _t={2,0,1,3}for i=0,3do if(btn(i))g_new_dir=_t[i+1]
end end if _obj.anim+.001>=1and not g_level_win and not g_level_lose then if(_obj.ismove==true)player_end_move(_obj)
if(g_btn4_press)_obj.jiggle=1
_obj.sprint=false local _new_dir=g_new_dir if _new_dir~=-1or g_p_use_port then local _can_move,_check,_chx,_chy=g_p_use_port,1,_obj.x+cos(_new_dir>>2),_obj.y+sin(_new_dir>>2)if(g_p_use_conv or setting_get(2))_check=3
local _nextblock=mget(_chx+32,_chy)if(_nextblock==10and _obj.pstate==1or _nextblock==138and _obj.haskey or mget(_chx+48,_chy)&_check>0)_can_move=true
g_new_dir,_obj.dir=-1,_new_dir if _can_move and not g_level_lose then g_p_started=true if(not g_p_use_port and not g_p_use_conv)_obj.startturnx,_obj.startturny=_obj.x,_obj.y add_undo()g_p_zap_turn+=1g_p_zap_turn%=3g_updt_zap=true
_obj.anim,_obj.sprint,_obj.ismove=0,tonum(setting_get(3))~tonum(btn(4))==1,true if(g_p_use_port==false)_obj.oldx,_obj.oldy=_obj.x,_obj.y
if(_new_dir>=0)_obj.x,_obj.y=_chx,_chy
end end end if g_level_win==false and g_s_touched>=g_s_tiles then g_level_win=true if(g_p_time<dget(g_p_fst.l_saveslot))dset(g_p_fst.l_saveslot,g_p_time)g_new_time=true
end if(g_level_win)_obj.dir=3
if(g_p_started and not g_level_win)g_p_time=min(g_p_time+(time()-g_time),599.999)
end function player_end_move(_obj)_obj.ismove=false local _x,_y,_destroy_obj=_obj.x,_obj.y,true local _xcenter,_ycenter,_collectcol=(_x<<4)+12,(_y<<4)+12local _tile=mget(_x+32,_y)if(_tile==73and _obj.pstate==2)_tile=105
if(_tile==2)do_key_swap(3,4,19,20)_collectcol,g_play_sfx={8,7},g_sfx_lut.t_switch
if(_tile==34)do_key_swap(35,36,21,22)_collectcol,g_play_sfx={11,7},g_sfx_lut.t_switch
if(_tile==66)do_key_swap(67,68,23,24)_collectcol,g_play_sfx={12,7},g_sfx_lut.t_switch
if _tile==98then g_p_coins+=1_collectcol,g_play_sfx={10,9,7},g_sfx_lut.t_coin if(g_p_coins==3)g_p_coins=0do_key_swap(99,100,25,26)g_play_sfx=g_sfx_lut.t_switch
g_updt_coin=true end local _st=str2tbl("b31a9876d",3)for i=0,2do if(_tile==8|i<<5)_obj.pstate,_collectcol,g_play_sfx=i,_st[i+1],g_sfx_lut.p_state[i+1]
end for i=0,7do if _tile==15|i<<5and g_p_octog==i then g_p_octog+=1if g_p_octog<8then local _dest=find_tile_loc(15|g_p_octog<<5)if(_dest~=nil)part_create_octogem(_xcenter,_ycenter,(_dest.x<<4)+12,(_dest.y<<4)+12)
end _collectcol,g_play_sfx={14,7},g_sfx_lut.octo[i+1]end end if(g_p_octog==8)do_key_swap(74,106,27,28)g_p_octog=0
if _tile==44then if(_obj.haskey)_destroy_obj=false else _obj.haskey=true _collectcol={6,13,5}
end if(_tile==138)_obj.haskey=false
local _oldx,_oldy=_obj.oldx,_obj.oldy local _prevtile=mget(_oldx+32,_oldy)if(_prevtile==137)place_puzz_tile(_oldx,_oldy,160)mset(_oldx+48,_oldy,1)mset(_oldx+32,_oldy,1)
if(proc_cracked_floor(_oldx,_oldy))_tile=mget(_x+32,_y)
local _dir=-1for i=0,3do if(_tile==6|i<<5)_dir=i
end if(_tile==105)_dir=_obj.dir
if(_dir~=-1)g_new_dir=_dir
g_p_use_conv=_dir~=-1if(_destroy_obj)add(g_o_del,_x<<4|_y)
g_p_use_port=false if _tile==5or _tile==37or _tile==69or _tile==101then mset(_x+32,_y,1)local _pair_loc=find_tile_loc(_tile)if(_pair_loc~=nil)_obj.oldx,_obj.oldy=_obj.x,_obj.y _obj.x,_obj.y=_pair_loc.x-32,_pair_loc.y g_p_use_port=true
end if(_collectcol~=nil)part_create_item_grab(_xcenter,_ycenter,_collectcol)
if(mget(_obj.x+48,_obj.y)&2==2)player_destroy(_obj)
if(_tile==41and _obj.pstate==0or _tile==73and _obj.pstate~=2or _tile==0or _tile==39and g_p_zap_turn==2or _tile==7and g_p_zap_turn==1or _tile==71and g_p_zap_turn==0)player_destroy(_obj,true)else g_s_touched+=1mset(_obj.x+48,_obj.y,2)put_x16_tile((_obj.x<<1)+1,(_obj.y<<1)+1,218+(_obj.pstate<<1))
end function player_destroy(_obj,_kill)g_level_lose=true local _t=str2tbl("13b49a5d6",3)if(_kill==true)_obj.isdead=true part_create_slime_explode((_obj.x<<4)+12,(_obj.y<<4)+12,_t[_obj.pstate+1])
end function player_draw(_obj)if(_obj.isdead or g_p_use_port or not setting_get(6))return
local _dir,_x,_y,_anim,_offset=_obj.dir,_obj.x<<4,_obj.y<<4,_obj.anim if(_obj.pstate==1)pal(3,8)pal(11,9)
if(_obj.pstate==2)pal(3,13)pal(11,6)
if(_anim<1)_offset=g_p_use_conv and _anim or.5+cos(_anim*.5*sgn(_anim-.5))*-.5_x,_y=lerp(_obj.oldx<<4,_obj.x<<4,_offset),lerp(_obj.oldy<<4,_obj.y<<4,_offset)
_x+=(-1+rnd(3))*_obj.jiggle+8_y+=(-1+rnd(3))*_obj.jiggle+8local _xflip,_yflip=cos(_obj.dir>>2)<0,sin(_obj.dir>>2)<0local _xpos,_ypos=_xflip and _x or _x-8,_yflip and _y or _y-8if(_obj.dir%2==0)spr(211,_xpos,_y+7,3,1,_xflip)spr(211,_xpos,_y,3,1,_xflip,true)else spr(217,_x+1,_ypos,1,3,false,_yflip)spr(217,_x+8,_ypos,1,3,true,_yflip)
pal()end function redraw_slimetrail()local _sta=g_slime_trail_anim spr(224,80,104,6,2)local _dx1,_subt=80for _x=0,32,16do clip(_dx1,104,16,16)for _subx=0,15do _subt=sin(_sta+_subx/8)+104sspr(_x+_subx,112,1,16,_dx1+_subx,_subt)sspr(_dx1,104+_subx,16,1,_dx1,_subt+_subx)end _dx1+=16end local _obj=g_o_list[1]clip()palt(0,false)spr(208,24,104,3,1)palt()if(_obj.haskey)spr(144,32,104)spr(144,39,104,1,1,true)
for _foffset=0,16,8do _dx1=24+_foffset clip(_dx1,104,8,8)for _subx=0,7do sspr(_subx+_foffset,104,1,8,_dx1+sin(_sta+_subx/8)+_subx,104)end end clip()if(_obj.haskey)spr(145,32,104)spr(145,39,104,1,1,true)
local _eye_determined,_eye_blink,_spr=(btn(4)or _obj.sprint)and g_p_use_conv==false,g_p_blink<3or g_level_win _spr=215if(_eye_determined)_spr=214
if(_eye_blink or g_level_lose)_spr=216
spr(_spr,g_level_win and 37or 36,104,1,1,g_level_win)_spr=251if(_eye_determined)_spr=252
if(g_level_lose)_spr=160
if(g_level_win)_spr=250
spr(_spr,40,104)for _x=0,23do for _y=0,7do sset(79-_y,104+_x,sget(24+_x,104+_y))end end end