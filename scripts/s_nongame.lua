function draw_title()
 cls(0)
 -- background graphics
 map(0, 0, -24 * g_title_scroll, 32, 19, 2)
 map(0, 2, g_title_scroll * 2 % 1 * -24, 48, 19, 3)
 map(0, 5, g_title_scroll * 3 % 1 * -24, 72, 19, 7)
 -- title logo
 palt(0b0000010000000000)
 local _y_mod = sin(g_title_scroll) * 4
 map(19, 0, 12, 8 + _y_mod, 13, 7)
 if (not setting_get(6)) map(19, 8, 28, 8 + _y_mod, 4, 5)

 ?"2025 cyansorcery", 32, 122, 3
 
 palt()
 pal(7, 1)
 if (achv_beat_game_stages()) spr(241, 1, 119)
 if setting_get(1) then
  if (achv_beat_game_times(false)) ?"⧗", 113, 122, 7
  if (achv_beat_game_times(true)) ?"♥", 120, 122, 7
 end
 pal()
 
 if (count(g_menu) == 0 and g_game_mode_target == nil) draw_wavy_text("press 🅾️ to start!", 28, 96, 1, 1.4)
end

function draw_intro()
 local _baseanim = g_intro_anim * g_outro_anim
 local _anim = _baseanim * 8
 cls(1)
 rectfill(0, 56, 127, 72, 12)
 map(0, 12, -24 * g_title_scroll, 56 - _anim, 19, 1)
 map(0, 13, -24 + 24 * g_title_scroll, 64 + _anim, 19, 1)
 local _anim2 = _anim * .5
 ?"presented by", 39, 60 - _anim2, 1
 -- draw the cyansorcery text, but only if lesbians are enabled
 if (setting_get(6)) map(19, 7, 18, 60 + _anim2, 11, 1)
 palt()
 fillp(g_fillp_transition[flr(lerp(1, 4, _baseanim))])
 rectfill(0, 56, 127, 72, 12)
 fillp()
end

function update_credits()
 if (g_intro_anim * g_outro_anim == 1 and btnp() & 0x30 > 0) set_game_mode(0)
end

function draw_credits()
 for _x=-32+g_bg_scl,128,32 do
  for _y=-g_bg_scl,128,32 do
   spr(204, _x, _y, 4, 4)
  end
 end

 -- if this isn't a victory screen, draw the credits
 if (g_victory_mode == nil) then
  -- darken behind text
  poke(0x5F54, 0x60)
  pal(g_pal_dark[1])
  sspr(0, 58, 128, 70, 0, 58)
  sspr(0, 7, 128, 18, 0, 7)
  sspr(39, 38, 52, 20, 39, 38)
  pal()
  poke(0x5F54, 0x00)
  palt(0b0001000000000000)
  map(48, 0, 0, 0, 16, 16)
  local _t = {{"programming", "bug fixes", "general"}, {"art, music", "art, music", "music"}}
  for _x=1,2 do
  for _y=1,3 do
  print_shd(_t[_x][_y], _x*64-46, _y*24+42, 7, 1)
  end
  end
  print_shd("director", 58, 42, 7, 1)
  print_shd("created by", 44, 1, 7, 1)
  print_shd("a plural system", 34, 26, 7, 1)
  print_shd("seven spirits, one body", 18, 32, 7, 1)
 else
  -- darken behind text
  poke(0x5F54, 0x60)
  pal(g_pal_dark[1])
  sspr(0, 0, 128, 128, 0, 0)
  pal()
  poke(0x5F54, 0x00)
  palt(0b0001000000000000)
  map(32, 8 + g_victory_mode * 2, 0, 32, 16, 2)
  local _str = {
[[ you've overcome many
 challenges and are at
the end of your journey!

but many puzzles remain
unsolved. can you solve
      them all?]],
[[you're very good! you've
overcome every challenge
 in your way, and have
 solved all the puzzles.

       good job!]],
[[ wow, you're fast! not
only did you solve every
puzzle, but you've done
 it super quick as well.

    congratulations!]],
[[ we have no more puzzles
for you. you're too good
  at the game! not many
   people can do this.

    you are amazing!]]
  }
  print_shd(_str[g_victory_mode], 16, 56, 7, 0)
 end
end

function update_intro()
 g_title_scroll += .025
 g_title_scroll %= 1

 if g_intro_countdown > 0 then
  g_intro_countdown -= 1
  -- skip countdown?
  if (btnp() & 0x30 > 0) g_intro_countdown = 0 
  if (g_intro_countdown == 0) set_game_mode(0)
 end
end

function update_title()
 g_title_scroll += .01
 g_title_scroll %= 1
 
 if count(g_menu) == 0 then
  local _pb = btn(6)
  if (_pb) poke(0x5f30,1)

  -- create title menu?
  if (btnp(4) or _pb) menu_create_title()
  -- back button to go back to title screen?
  if (btnp(5)) set_game_mode(3)
 end
 
end


function update_stage_select()
 g_sss_anim_factor = mid(0, g_sss_anim_factor + g_sss_anim_incr, 1)
 g_title_scroll += .02
 g_title_scroll %= 1
 -- roxy note: cap this to the count of unlocked worlds later
 local _worlds = count(g_levels)
 
 -- pick the world
 if g_sss_anim_factor == 1 then
  if (btnp(0) and g_sss_menu_world > 1) g_sss_menu_world_tgt = max(g_sss_menu_world - 1, 1) g_sss_anim_incr = -.125
  -- roxy note: check for player worlds unlocked
  if (btnp(1) and g_sss_menu_world < count(g_levels) and stages_beat_in_world(g_sss_menu_world) >= g_w_req[g_sss_menu_world][1]) g_sss_menu_world_tgt = min(g_sss_menu_world + 1, _worlds) g_sss_anim_incr = -.125
 end

 -- show the next world panel?
 if (g_sss_anim_factor == 0) g_sss_anim_incr = .125 g_sss_menu_world = g_sss_menu_world_tgt g_sss_menu_world_tgt = nil

 -- roxy note: cap this to the count of unlocked stages in the above world later
 local _stages = count(g_levels[g_sss_menu_world])
 
 local _pause_press = btn(6)
 if (_pause_press) poke(0x5f30,1) 

 -- pick the stage
 if (btnp(2)) g_sss_menu_stage -= 1
 if (btnp(3)) g_sss_menu_stage += 1
 if (g_sss_menu_stage < 0) g_sss_menu_stage = _stages
 if (g_sss_menu_stage > _stages) g_sss_menu_stage = 0;
 
 -- select the stage?
 if btnp(5) or btnp(4) or _pause_press then
  if g_sss_menu_stage == 0 then
   -- this is the back button
   set_game_mode(0)
  else
   set_game_mode(2, g_sss_menu_world, g_sss_menu_stage) music(-1, 500)
  end
 end
end

function draw_stage_select()
 -- do lookups for what color the stage select should be
 local _t, _y_offset = g_sss_colors, 20 + sin(g_sss_anim_factor >> 3) * 29
 for i=1,4 do
  pal(_t[1][i], _t[g_sss_menu_world][i])
 end
 -- draw the background
 rectfill(0, 0, 127, 127, 1)
 -- draw the slime borders
 map(0, 14, -24 + 24 * g_title_scroll, -2 - _y_offset, 19, 3)
 map(0, 17, -24 * g_title_scroll, 115 + _y_offset, 19, 2)
 -- draw the stage title
 map(32, -2 + g_sss_menu_world * 2, 0, 1 - _y_offset, 16, 2)
 local _bott, _req = 122 + _y_offset, g_w_req[g_sss_menu_world][1]
 -- draw to go to previous world?
 if (g_sss_menu_world > 1) ?"⬅️previous area", 1, _bott, 7
 -- draw to go to next world?
 local _p_beat = stages_beat_in_world(g_sss_menu_world)
  ?_p_beat >= _req and (g_sss_menu_world < count(g_levels) and "next area➡️" or "") or "▶solve "..(_req - _p_beat), 84, _bott, 7

 -- draw the stages
 local _stages = count(g_levels[g_sss_menu_world])
 local _start = max(min(g_sss_menu_stage - 5, _stages - 9), -1)
 local _sy1, _end, _show_timers, _is_hilite, _stagetime, _syt = 13 - (_start * 10), _start + 10, setting_get(1)
 for _y=0,_stages do
  _is_hilite, _sy2 = _y == g_sss_menu_stage, _sy1 + 10
  if _y > _start and _y < _end then
   _syt = _sy1 + 3
   -- ashe note: this results in one double lookup, don't feel like fixing it
   local _st = g_levels[g_sss_menu_world][max(1, _y)];
   local _stagetime = dget(_st.s_saveslot)
   if (_is_hilite) menu_draw_select(4, _sy1, 90, _sy2)
   pal(7, _is_hilite and 7 or _t[g_sss_menu_world][2])
   if _y > 0 then
    ?(_y > 9 and "" or " ").._y.." ".._st.s_name, 15, _syt, 7
    spr(_stagetime <= 599.995 and 241 or 240, 6, _sy1 + 1)
    if _show_timers then
     if (_stagetime <= _st.s_goaltime) ?format_time(_stagetime), 96, _syt, 7
     if (_stagetime <= _st.s_devtime) ?"♥", 120, _syt, 7
    end
   else
    ?"back", 27, _syt, 7
    pal(7, 10)
    if (achv_beat_stages(g_sss_menu_world)) spr(241, 6, _sy1 + 1)
    if _show_timers then
     if (achv_beat_times(g_sss_menu_world, false)) ?"⧗", 113, _syt, 7
     if (achv_beat_times(g_sss_menu_world, true)) ?"♥", 120, _syt, 7
    end
   end
  end
  _sy1 = _sy2
 end

 -- draw the checkerboard effect?
 if g_sss_anim_factor < 1 then
  palt()
  if (g_sss_anim_incr < 0) pal(1, _t[g_sss_menu_world_tgt][1])
  fillp(g_fillp_transition[flr(lerp(1, 4, g_sss_anim_factor))])
  if (g_sss_anim_incr > 0) rectfill(0, 22, 127, 112, 1) else rectfill(0, 0, 127, 127, 1)
  fillp()
 end
 pal()
end