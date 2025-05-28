function menu_create(_x, _y, _w, _items)
 add(g_menu, {
  m_x = _x,
  m_y = _y,
  m_w = _w,
  m_h = (count(_items) * 10) + 6,
  m_items = _items,
  m_highlight = 1,
  m_anim_incr = .25,
  m_anim_factor = 0,
  m_step = function(self, _index)
   local _m_count = count(g_menu)
   local _is_top_pane = _index == _m_count
   if self.m_anim_factor == 1 then
    if (btnp(2)) self.m_highlight = max(self.m_highlight - 1, 1)
    if (btnp(3)) self.m_highlight = min(self.m_highlight + 1, count(self.m_items))
    -- confirm
    if (btnp(4)) self.m_items[self.m_highlight]:i_onclick()
    -- cancel
    if (btnp(5)) self.m_anim_incr = -.25
   end
   
   -- only increment if a menu below is done with its animation
   local _do_anim = true
   if (_is_top_pane and _m_count > 1 and g_menu[_m_count - 1].m_anim_factor > 0) _do_anim = false
   if (_do_anim) self.m_anim_factor = mid(0, self.m_anim_factor + (_is_top_pane and self.m_anim_incr or -.25), 1)

   -- is this menu done?
   if (self.m_anim_factor == 0 and self.m_anim_incr < 0) deli(g_menu)
  end,
  m_draw = function(self, _index)
   palt()
   local _m_count = count(g_menu)
   local _is_top_pane = _index == _m_count
   -- should we show this?
   if (_is_top_pane and _m_count > 1 and g_menu[_m_count - 1].m_anim_factor > 0) return false
   -- brute force detection of in puzzle or not
   local _count, _sprchk = count(self.m_items), count(g_list_obj) > 0 and 147 or 241
   -- draw background
   local _b_h = lerp(5, self.m_h, self.m_anim_factor)
   local _x1, _y1, _is_hilite = self.m_x, self.m_y - (_b_h >> 1)
   local _x2, _y2 = _x1 + self.m_w, _y1 + _b_h
   local _sx1, _sy1, _sx2, _sy2
   
   rectfill(_x1, _y1, _x2, _y2, 1)
   rect(_x1 + 1, _y1 + 1, _x2 - 1, _y2 - 1, 13)

   local _base_x, _base_y = _x1 + 8, _y1 + 6
    for _ind,_item in pairs(self.m_items) do
     if _base_y < _y2 - 9 then 
      _sx1, _sy1, _sx2, _sy2 = _x1 + 3, _base_y - 3, _x2 - 3, _base_y + 7
      _is_hilite = _ind == self.m_highlight
      if (_is_hilite) menu_draw_select(_sx1, _sy1, _sx2, _sy2)
      pal(7, _is_hilite and 7 or 13)
      ?_item.i_label, _base_x, _base_y, 7
      if _item.i_setting != nil then
       spr(_sprchk - (setting_get(_item.i_setting) and 0 or 1), _x2 - 11, _base_y - 2)
      end
	   end
     _base_y += 10
    end
    pal()
   end
 })
end
function menus_remove()
 -- get rid of any menus
 for _pane in all(g_menu) do
  _pane.m_anim_incr = -.25
 end
end
function menu_item_base(_str, _func)
 return {
	i_label = _str,
	i_onclick = _func,
  i_setting = nil
 }
end
-- setting is the offset of the setting this represents
function menu_item_setting(_str, _setting)
 local _item = menu_item_base(_str, function(self)
   setting_set(self.i_setting, setting_get(self.i_setting) == false)
  end)
 _item.i_setting = _setting
 return _item
end

function menu_create_puzz()
 menu_create(16, 64, 96,{
  menu_item_base((g_stage_win and "next" or "skip").." puzzle", function() set_game_mode(2, g_p_i_world, g_p_i_stage + 1) end),
  menu_item_base("restart puzzle", function() set_game_mode(2, g_p_i_world, g_p_i_stage, true) end),
  menu_item_base((g_arrow_index == 2 and "hide" or "show").." hints", function() g_arrow_index = g_arrow_index == 2 and 1 or 2 menus_remove() end),
  menu_item_base("stage select", function() set_game_mode(1) end),
  menu_item_base("options", menu_create_options),
  menu_item_base("go to title", function() set_game_mode(0) end)
 })
 g_btn4_press, g_btn4_held = false, false
end
function menu_create_title()
 menu_create(24, 96, 80, {
  menu_item_base("start game", function() 
   set_game_mode(1)
  end),
  menu_item_base("continue", function()
   local _ws = last_worldstage_get()
   set_game_mode(2, _ws.world, _ws.stage)
  end
  ),
  menu_item_base("options", menu_create_options),
  menu_item_base("credits", function() set_game_mode(4) end)
 })
end
function menu_create_options()
 menu_create(16, count(g_list_obj) > 0 and 64 or 92, 96, {
  menu_item_setting("show timers", 1),
  menu_item_setting("slime overlap", 2),
  menu_item_setting("sprint by default", 3),
  menu_item_setting("lesbians allowed", 6),
  menu_item_base("pico8 menu", menu_create_pico8)
 })
end
function menu_create_pico8()
 extcmd("pause")
end
function menu_draw_select(_x1, _y1, _x2, _y2)
 rectfill(_x1, _y1, _x2, _y2, 2)
 fillp(g_fillp_diag[ceil(g_fillp_anim)])
 rect(_x1, _y1, _x2, _y2, 154)
 fillp(0)
end