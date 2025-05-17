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

 print("2025 cyansorcery", 32, 122, 3)
 
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
 print("presented by", 39, 60 - _anim2, 1)
 if (setting_get(6)) map(19, 7, 18, 60 + _anim2, 11, 1)
 palt()
 fillp(g_fillp_transition[flr(lerp(1, 4, _baseanim))])
 rectfill(0, 56, 127, 72, 12)
 fillp()
end

function update_intro()
 g_title_scroll += 0.025
 g_title_scroll %= 1

 if (g_intro_countdown > 0) then
  g_intro_countdown -= 1
  -- skip countdown?
  if (btnp() & 0x30 > 0) g_intro_countdown = 0 
  if (g_intro_countdown == 0) set_game_mode(0)
 end
end

function update_title()
 g_title_scroll += 0.01
 g_title_scroll %= 1
 
 if (count(g_menu) == 0) then
  -- create title menu?
  if (btnp(4)) then 
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
  elseif (btnp(5)) then
   set_game_mode(3)
  end
 end
 
end


function update_stage_select()
 g_title_scroll += 0.02
 g_title_scroll %= 1
 -- roxy note: cap this to the count of unlocked worlds later
 local _worlds = count(g_levels)
 
 -- pick the world
 if (btnp(0)) g_sss_menu_world = max(g_sss_menu_world - 1, 1)
 if (btnp(1)) g_sss_menu_world = min(g_sss_menu_world + 1, _worlds)

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
 cls(1)
 -- draw slime borders
 -- roxy note: allow lookup of slime colors later
 pal(1, 3)
 map(0, 14, -24 + (24 * g_title_scroll), -4, 19, 3)
 map(0, 0, -24 * g_title_scroll, 116, 19, 2)
 pal()
 -- draw the stages
 local _stages = count(g_levels[g_sss_menu_world])
 local _start = max(min(g_sss_menu_stage - flr(_stages >> 1), _stages - 9), 0)
 local _sy1, _end, _is_hilite = 22 - (_start * 10), _start + 10
 for _y,_st in ipairs(g_levels[g_sss_menu_world]) do
  _is_hilite, _sy2 = _y == g_sss_menu_stage, _sy1 + 10
  if (_y > _start and _y < _end) then
   if (_is_hilite) rectfill(4, _sy1, 88, _sy2, 2)
   pal(7, _is_hilite and 7 or 3)
   print((_y > 9 and "" or " ").._y.." ".._st.l_name, 8, _sy1 + 3, 7)
   if (_is_hilite) then
    fillp(g_fillp_diag[ceil(g_fillp_anim)])
    rect(4, _sy1, 88, _sy2, 154)
    fillp(0)
   end
  end
  _sy1 = _sy2
 end
end