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
    set_game_mode(2, 1)
   end),
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

end

function draw_stage_select()
 cls(1)
 --tmp
 for _y,_st in ipairs(g_levels[1]) do
  print(_st.l_name, 10, _y * 8, 7)
 end
end