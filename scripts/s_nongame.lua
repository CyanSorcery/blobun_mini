function draw_title()
 cls(0)
 -- background graphics
 map(0, 0, -24 * g_title_scroll, 32, 19, 2)
 map(0, 2, -24 * ((g_title_scroll * 2) % 1), 48, 19, 3)
 map(0, 5, -24 * ((g_title_scroll * 3) % 1), 72, 19, 7)
 -- title logo
 palt(0b0000010000000000)
 local _y_mod = (sin(g_title_scroll) * 4)
 map(19, 0, 12, 8 + _y_mod, 13, 7)
 if (not setting_get(6)) map(19, 8, 28, 8 + _y_mod, 4, 5)

 ?"2025 cyansorcery", 32, 122, 3
 
 if (count(g_menu) == 0 and g_game_mode_target == nil) draw_wavy_text("press 🅾️ to start!", 28, 96, 1, 1.4)
end

function draw_intro()
 local _baseanim = g_intro_anim * g_outro_anim
 local _anim = _baseanim * 8
 cls(1)
 rectfill(0, 56, 127, 72, 12)
 map(0, 12, -24 * g_title_scroll, 56 - _anim, 19, 1)
 map(0, 13, -24 + (24 * g_title_scroll), 64 + _anim, 19, 1)
 local _anim2 = _anim * 0.5
 ?"presented by", 39, 60 - _anim2, 1
 -- draw the cyansorcery text, but only if lesbians are enabled
 if (setting_get(6)) map(19, 7, 18, 60 + _anim2, 11, 1)
 palt()
 fillp(g_fillp_transition[flr(lerp(1, 4, _baseanim))])
 rectfill(0, 56, 127, 72, 12)
 fillp()
end

function update_intro()
 g_title_scroll += 0.025
 g_title_scroll %= 1

 if g_intro_countdown > 0 then
  g_intro_countdown -= 1
  -- skip countdown?
  if (btnp() & 0x30 > 0) g_intro_countdown = 0 
  if (g_intro_countdown == 0) set_game_mode(0)
 end
end

function update_title()
 g_title_scroll += 0.01
 g_title_scroll %= 1
 
 if count(g_menu) == 0 then
  -- create title menu?
  if btnp(4) then 
   menu_create(24, 96, 80, {
   menu_item_base("start game", function() 
    set_game_mode(1)
   end),
   menu_item_base("continue", function()
    local _ws = last_worldstage_get()
    set_game_mode(2, _ws.world, _ws.stage)
   end
   ),
   menu_item_base("options", function()
    menu_create(16, 92, 96, {
      menu_item_setting("show timers", 1),
      menu_item_setting("slime overlap", 2),
      menu_item_setting("sprint by default", 3),
      menu_item_setting("music", 4),
      menu_item_setting("sound effects", 5),
      menu_item_setting("lesbians allowed", 6)
    })
   end),
   menu_item_base("credits", function()
    printh("clicked credits")
   end)
  })
  -- back button to go back to title screen?
  elseif btnp(5) then
   set_game_mode(3)
  end
 end
 
end


function update_stage_select()
 g_sss_anim_factor = mid(0, g_sss_anim_factor + g_sss_anim_incr, 1)
 g_title_scroll += 0.02
 g_title_scroll %= 1
 -- roxy note: cap this to the count of unlocked worlds later
 local _worlds = count(g_levels)
 
 -- pick the world
 if g_sss_anim_factor == 1 then
  if (btnp(0) and g_sss_menu_world > 1) g_sss_menu_world_tgt = max(g_sss_menu_world - 1, 1) g_sss_anim_incr = -0.125
  -- roxy note: check for player worlds unlocked
  if (btnp(1) and g_sss_menu_world < count(g_levels)) g_sss_menu_world_tgt = min(g_sss_menu_world + 1, _worlds) g_sss_anim_incr = -0.125
 end

 -- show the next world panel?
 if (g_sss_anim_factor == 0) g_sss_anim_incr = 0.125 g_sss_menu_world = g_sss_menu_world_tgt g_sss_menu_world_tgt = nil

 -- roxy note: cap this to the count of unlocked stages in the above world later
 local _stages = count(g_levels[g_sss_menu_world])
 -- pick the stage
 if (btnp(2)) g_sss_menu_stage -= 1
 if (btnp(3)) g_sss_menu_stage += 1
 g_sss_menu_stage = mid(1, g_sss_menu_stage, _stages)
 
 -- select the stage?
 if (btnp(4)) set_game_mode(2, g_sss_menu_world, g_sss_menu_stage)
 -- go back to the title?
 if (btnp(5)) set_game_mode(0)
end

function draw_stage_select()
 -- do lookups for what color the stage select should be
 local _t = g_sss_colors
 local _y_offset = 20 + sin(g_sss_anim_factor >> 3) * 29
 for i=1,4 do
  pal(_t[1][i], _t[g_sss_menu_world][i])
 end
 -- draw the background
 rectfill(0, 0, 127, 127, 1)
 -- draw the slime borders
 map(0, 14, -24 + (24 * g_title_scroll), -2 - _y_offset, 19, 3)
 map(0, 17, -24 * g_title_scroll, 115 + _y_offset, 19, 2)
 -- draw the stage title
 map(32, -2 + g_sss_menu_world * 2, 0, 1 - _y_offset, 16, 2)
 local _bott = 122 + _y_offset
 -- draw to go to previous world?
 if (g_sss_menu_world > 1) ?"⬅️previous area", 1, _bott, 7
 -- draw to go to next world?
 -- roxy note: check for player worlds unlocked
 if (g_sss_menu_world < count(g_levels)) ?"next area➡️", 84, _bott, 7

 -- draw the stages
 local _stages = count(g_levels[g_sss_menu_world])
 local _start = max(min(g_sss_menu_stage - flr(_stages >> 1), _stages - 9), 0)
 local _sy1, _end, _show_timers, _is_hilite, _stagetime, _syt = 23 - (_start * 10), _start + 10, setting_get(1)
 for _y,_st in ipairs(g_levels[g_sss_menu_world]) do
  _is_hilite, _sy2 = _y == g_sss_menu_stage, _sy1 + 10
  if _y > _start and _y < _end then
   _syt = _sy1 + 3
   local _stagetime = dget(_st.l_saveslot)
   if (_is_hilite) rectfill(4, _sy1, 90, _sy2, 2)
   pal(7, _is_hilite and 7 or _t[g_sss_menu_world][2])
   ?(_y > 9 and "" or " ").._y.." ".._st.l_name, 15, _syt, 7
   spr(_stagetime <= 599.995 and 101 or 96, 6, _sy1 + 1)
   if _is_hilite then
    fillp(g_fillp_diag[ceil(g_fillp_anim)])
    rect(4, _sy1, 90, _sy2, 154)
    fillp(0)
   end
   if (_show_timers) then
    if (_stagetime <= _st.l_goaltime) ?format_time(_stagetime), 96, _syt, 7
    if (_stagetime <= _st.l_devtime) ?"♥", 120, _syt, 7
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