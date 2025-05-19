function menu_create(_x, _y, _w, _items)
 add(g_menu, {
  m_x = _x,
  m_y = _y,
  m_w = _w,
  m_h = (count(_items) * 10) + 6,
  m_items = _items,
  m_highlight = 1,
  m_anim_incr = 0.25,
  m_anim_factor = 0,
  m_step = function(self, _index)
   local _m_count = count(g_menu)
   local _is_top_pane = _index == _m_count
   if self.m_anim_incr > 0 and self.m_anim_factor == 1 then
    if (btnp(2)) self.m_highlight = max(self.m_highlight - 1, 1)
    if (btnp(3)) self.m_highlight = min(self.m_highlight + 1, count(self.m_items))
    -- confirm
    if (btnp(4)) self.m_items[self.m_highlight]:i_onclick()
    -- cancel
    if (btnp(5)) self.m_anim_incr = -0.25
   end
   
   -- only increment if a menu below is done with its animation
   local _do_anim = true
   if (_is_top_pane and _m_count > 1 and g_menu[_m_count - 1].m_anim_factor > 0) _do_anim = false
   if (_do_anim) self.m_anim_factor = mid(0, self.m_anim_factor + (_is_top_pane and self.m_anim_incr or -0.25), 1)

   -- is this menu done?
   if (self.m_anim_factor == 0 and self.m_anim_incr < 0) deli(g_menu)
  end,
  m_draw = function(self, _index)
   palt()
   local _m_count = count(g_menu)
   local _is_top_pane = _index == _m_count
   -- should we show this?
   if (_is_top_pane and _m_count > 1 and g_menu[_m_count - 1].m_anim_factor > 0) return false

   local _count = count(self.m_items)
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
	    if (_is_hilite) rectfill(_sx1, _sy1, _sx2, _sy2, 2)
      pal(7, _is_hilite and 7 or 13)
      ?_item.i_label, _base_x, _base_y, 7
      if _is_hilite then
       fillp(g_fillp_diag[ceil(g_fillp_anim)])
	     rect(_sx1, _sy1, _sx2, _sy2, 154)
	     fillp(0)
	    end
      if _item.i_setting != nil then
       spr(setting_get(_item.i_setting) and 101 or 96, _x2 - 11, _base_y - 2)
      end
	   end
     _base_y += 10
    end
    pal()
   end
 })
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

function menu_create_puzz_win()
 menu_create(16, 64, 96,{
  menu_item_base("next puzzle", menuitem_puzz_skip),
  menu_item_base("restart puzzle", menuitem_puzz_restart),
  menu_item_base("stage select", menuitem_puzz_stage_select),
  menu_item_base("go to title", menuitem_puzz_goto_title)
 })
end

function menuitem_puzz_restart()
 set_game_mode(2, g_puzz_world_index, g_puzz_level_index, true)
end
function menuitem_puzz_skip()
 set_game_mode(2, g_puzz_world_index, g_puzz_level_index + 1)
end
function menuitem_puzz_stage_select()
 set_game_mode(1)
end
function menuitem_puzz_goto_title()
 set_game_mode(0)
end
