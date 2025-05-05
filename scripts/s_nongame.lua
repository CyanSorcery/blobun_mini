function draw_title()
 cls(0)
 -- background graphics
 map(0, 0, -24 * g_title_scroll, 32, 19, 2)
 map(0, 2, -24 * ((g_title_scroll * 2) % 1), 48, 19, 3)
 map(0, 5, -24 * ((g_title_scroll * 3) % 1), 72, 19, 7)
 -- title logo
 palt(0b0000010000000000)
 map(19, 0, 12, 8 + (sin(g_title_scroll) * 4), 13, 7)

 print("2025 cyansorcery", 32, 122, 3)
 
 if (count(g_menu) == 0 and g_game_mode_target == nil) draw_wavy_text("press 🅾️ to start!", 28, 96, 1, 1.4)
end

function update_title()
 g_title_scroll += 0.01
 g_title_scroll %= 1
 
 -- create title menu?
 if (count(g_menu) == 0 and btnp(4)) then menu_create(24, 96, 80, {
  menu_item_base("start game", function() 
   set_game_mode(2, 1)
  end),
  menu_item_base("options", function()
   printh("clicked options")
   menu_create(24, 96, 80, {
     menu_item_base("option 1", function() end),
     menu_item_base("option 2", function() end),
     menu_item_base("option 3", function() end),
     menu_item_base("option 4", function() end),
     menu_item_base("option 5", function() end)
   })
  end),
  menu_item_base("credits", function()
   printh("clicked credits")
  end)
 })
 end
end