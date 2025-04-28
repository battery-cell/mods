local mod_gui = require("__core__/lualib/mod-gui")
local Informatron = {
  name_root = "informatron",
  name_title_flow = "titlebar",
  name_time_label = "game-time",
  name_main_flow = "main-flow",
  name_menu_frame = "menu-frame",
  name_menu_pane = "menu-pane",

  name_content_container = "content-container",
  name_content_subheader = "content-subheader",
  name_content_path = "content-path",
  name_content_title = "content-title",
  name_content_flow = "content-flow",
  name_content_pane = "content-pane",

  content_width = 940,

  name_event = "informatron",
  name_lua_shortcut = "informatron",
  name_setting_overhead_button = "informatron-show-overhead-button",
  name_setting_show_at_start = "informatron-show-at-start",
  name_overhead_button = "informatron_overhead",

  action_close_button = "close-gui"
}

Informatron.path_menu_pane = {
  Informatron.name_main_flow,
  Informatron.name_menu_frame,
  Informatron.name_menu_pane
}
Informatron.path_content_subheader = {
  Informatron.name_main_flow,
  Informatron.name_content_container,
  Informatron.name_content_subheader,
}
Informatron.path_content_pane = {
  Informatron.name_main_flow,
  Informatron.name_content_container,
  Informatron.name_content_pane
}



---Returns a shallow copy of the given table.
---@param tbl table Table to shallow-copy
---@return table copy
local function _shallow_copy(tbl)
  local copy = {}
  for k, v in pairs(tbl) do
    copy[k] = v
  end
  return copy
end

---Safely traverses the given path to obtain a `LuaGuiElement`.
---@param parent LuaGuiElement Parent element to begin traversal from
---@param path string[] Array of names of elements to traverse
---@return LuaGuiElement? element
local function _get_gui_element(parent, path)
  local element = parent

  for _, level in pairs(path) do
    if element[level] then
      element = element[level]
    else
      return
    end
  end

  return element
end

---Updates the game time in the given Informatron root window.
local function _update_time(root, tick)
  local time_label = root[Informatron.name_title_flow][Informatron.name_time_label]
  local math_floor = math.floor

  local seconds = math_floor(tick/60)

  local days = math_floor(seconds/3600/24)
  local hours = math_floor(seconds/3600 - days*24)
  local mins = math_floor(seconds/60 - hours*60 - days*1440)
  local secs = math_floor(seconds - mins*60 - hours*3600  - days*86400)

  time_label.caption = {
    "informatron.game_time_caption",
    string.format("%d", days),
    string.format("%02d", hours),
    string.format("%02d", mins),
    string.format("%02d", secs),
  }
  time_label.tooltip = {
    "informatron.game_time_tooltip",
    tick,
    math_floor(tick / 60),
    math_floor(tick / 60^2),
    math_floor(tick / 60^3),
    math_floor(tick / 60^3 / 24),
  }
end

---Validates given items provided by a given interface and returns a table of valid menu items.
---@param interface string Name of remote interface
---@param items? table
---@param player_index uint Player index
---@return table?
local function _validate_menu_items(interface, items, player_index)
  if not items then return end

  local valid_items = {}
  local has_valid_items

  for item_name, children in pairs(items) do
    valid_items[item_name] = {interface=interface, name=item_name, caption={interface .. ".menu_" .. item_name}}

    if remote.interfaces[interface]["informatron_menu_caption_override"] then
      local caption_override = remote.call(interface, "informatron_menu_caption_override",
          {page_name=item_name, player_index=player_index})
      if caption_override then
        valid_items[item_name].caption = caption_override
      end
    end

    has_valid_items = true

    if type(children) == "table" then
      valid_items[item_name].children = _validate_menu_items(interface, children, player_index)
    end
  end

  if has_valid_items then
    return valid_items
  end
end

---Gets menu items from all mod interfaces.
---@param player_index uint Player index
---@return table items
local function _get_menu_items(player_index)
  local menu_items = {}

  -- Get Informatron's interface first
  local items = remote.call("informatron", "informatron_menu", {player_index=player_index})
  if items then
    ---@cast items table
    local primary = {
      name = "informatron",
      interface = "informatron",
      caption = {"informatron.menu_informatron"},
    }
    local valid_items = _validate_menu_items("informatron", items, player_index)
    if valid_items then primary.children = valid_items end
    menu_items[primary.name] = primary
  end

  -- Get menu items from other mods
  for interface, functions in pairs(remote.interfaces) do
    if interface ~= "informatron" and functions["informatron_menu"] and
        functions["informatron_page_content"] then
      items = remote.call(interface, "informatron_menu", {player_index=player_index})
      if items then
        ---@cast items table
        local primary = {
          name = interface,
          interface = interface,
          caption = {interface .. ".menu_" .. interface},
        }
        local valid_items = _validate_menu_items(interface, items, player_index)
        if valid_items then
          primary.children = valid_items
        end
        menu_items[primary.name] = primary
      end
    end
  end

  return menu_items
end

---Add a menu item to the given element.
---@param element LuaGuiElement Menu scroll pane
---@param item table Item table
---@param indent any Indentation level
---@param path? LocalisedString[]|string[] Path of item to save in tag
local function _add_menu_item(element, item, indent, path)
  indent = indent or 0
  local style = (indent == 0) and "informatron_menu_button_primary" or "informatron_menu_button"
  local button = element.add{
    type = "button",
    name = item.interface .. "/" .. item.name,
    caption = item.caption,
    tags = {
      root = Informatron.name_root,
      interface = item.interface,
      path = path or nil,
      page_name = item.name
    },
    style = style
  }

  -- Shallow copy path then modify it
  path = _shallow_copy(path or {})
  table.insert(path, item.caption)

  button.style.left_padding = 5 + 20 * indent
  if item.children then
    for _, child in pairs(item.children) do
      _add_menu_item(element, child, indent + 1, path)
    end
  end
end

---Applies the selected style to the given interface/page_name.
---@param pane LuaGuiElement Menu scroll pane
---@param interface string Name of interface the page belongs to
---@param page_name string Page name
local function _apply_selected_style(pane, interface, page_name)
  local button = pane[interface .. "/" .. page_name]
  if not button then return end

  local is_top_level = not button.tags.path and true or false
  local left_padding = button.style.left_padding

  button.style = is_top_level and
    "informatron_menu_button_primary_selected" or "informatron_menu_button_selected"
  button.style.left_padding = left_padding
end

---Applies the unselected style to the given interface/page_name.
---@param pane LuaGuiElement Menu scroll pane
---@param interface string Name of interface the page belongs to
---@param page_name string Page name
local function _apply_unselected_style(pane, interface, page_name)
  local button = pane[interface .. "/" .. page_name]
  if not button then return end

  local is_top_level = not button.tags.path and true or false
  local left_padding = button.style.left_padding

  button.style = is_top_level and
    "informatron_menu_button_primary" or "informatron_menu_button"
  button.style.left_padding = left_padding
end



---Gets (and if necessary makes) a `PlayerData` table for the given player in `global`.
---@param player_index uint Player index
function Informatron.get_make_playerdata(player_index)
  storage.playerdata = storage.playerdata or {}
  storage.playerdata[player_index] = storage.playerdata[player_index] or {}
  return storage.playerdata[player_index]
end

---Makes or destroys the overhead button depending on player setting.
---@param player LuaPlayer Player
function Informatron.update_overhead_button(player)
  local button_flow = mod_gui.get_button_flow(player)
  if not button_flow then return end

  local button = button_flow[Informatron.name_overhead_button]

  if player.mod_settings[Informatron.name_setting_overhead_button].value then
    if not button then
      button_flow.add{
        type = "sprite-button",
        name = Informatron.name_overhead_button,
        sprite = "virtual-signal/informatron"
      }
    end
  elseif button then
    button.destroy()
  end
end

---Returns the number of items in a given player's menu.
---@param player LuaPlayer Player
---@return integer? count
function Informatron.get_menu_item_count(player)
  local root = Informatron.get(player)
  if not root then return end

  local pane = _get_gui_element(root, Informatron.path_menu_pane) --[[@as LuaGuiElement]]
  return #pane.children
end

---Gets the Informatron GUI of a given player, if open.
---@param player LuaPlayer
---@return LuaGuiElement? root
function Informatron.get(player)
  return player.gui.screen[Informatron.name_root]
end

---Opens the Informatron GUI for a given player.
---@param player LuaPlayer Player to open GUI for
---@param target_page any
function Informatron.open(player, target_page)
  if Informatron.get(player) then Informatron.close(player) end

  local player_index = player.index

  local root = player.gui.screen.add{
    type = "frame",
    direction = "vertical",
    name = Informatron.name_root,
    style = "informatron_root_frame"
  }

  -- Check in case another mod destroyed the GUI upon setting `player.opened`
  player.opened = root
  if not root.valid then return end

  do -- Titlebar
    local titlebar = root.add{
      type = "flow",
      name = Informatron.name_title_flow,
      direction = "horizontal",
      style = "informatron_titlebar_flow"
    }
    titlebar.drag_target = root
    titlebar.add{ -- Sprite
      type = "sprite",
      sprite = "virtual-signal/informatron",
      ignored_by_interaction = true,
      style = "informatron_titlebar_icon"
    }
    titlebar.add{ -- Title
      type = "label",
      caption = {"informatron.window_title_label"},
      ignored_by_interaction = true,
      style = "frame_title"
    }
    titlebar.add{
      type = "empty-widget",
      ignored_by_interaction = true,
      style = "informatron_drag_handle"
    }
    titlebar.add{
      type = "label",
      name = Informatron.name_time_label,
      style = "informatron_time_label"
    }
    titlebar.add{ -- Close button
      type = "sprite-button",
      sprite = "utility/close",
      hovered_sprite = "utility/close_black",
      clicked_sprite = "utility/close_black",
      tags = {root=Informatron.name_root, action=Informatron.action_close_button},
      style = "close_button"
    }
    _update_time(root, game.tick)
  end

  local main_flow = root.add{
    type = "flow",
    name = Informatron.name_main_flow,
    direction = "horizontal",
    style = "informatron_main_flow"
  }

  -- Menu
  local left_frame = main_flow.add{
    type = "frame",
    name = Informatron.name_menu_frame,
    direction = "vertical",
    style = "informatron_menu_frame"
  }
  local scroll_pane = left_frame.add{
    type = "scroll-pane",
    name = Informatron.name_menu_pane,
    direction = "vertical",
    vertical_scroll_policy = "auto",
    style = "informatron_menu_scroll_pane"
  }

  local menu_items = _get_menu_items(player_index)

  -- encapsulate the primary items so sub-item names are safe
  for _, item in pairs(menu_items) do
    _add_menu_item(scroll_pane, item, 0)
  end

  -- Content
  local content_container = main_flow.add{
    type = "frame",
    name = Informatron.name_content_container,
    direction = "vertical",
    style = "informatron_content_frame"
  }

  local subheader = content_container.add{
    type = "frame",
    name = Informatron.name_content_subheader,
    direction = "vertical",
    style = "informatron_content_subheader_frame"
  }

  subheader.add{type = "label", name = Informatron.name_content_path}
  subheader.add{
    type = "label",
    name = Informatron.name_content_title,
    style = "informatron_content_title"
  }

  content_container.add{
    type = "scroll-pane",
    name = Informatron.name_content_pane,
    style = "informatron_content_scroll_pane"
  }

  root.force_auto_center()

  if target_page and target_page.interface and remote.interfaces[target_page.interface] then
    Informatron.display(player, target_page.interface, target_page.page_name)
  else
    local last_page = Informatron.get_make_playerdata(player.index).last_page
    if last_page and last_page.interface and remote.interfaces[last_page.interface] then
      Informatron.display(player, last_page.interface, last_page.page_name)
    else
      Informatron.display(player, "informatron", "informatron")
    end
  end
end

---Opens/closes Informatron depending on its existing state.
---@param player LuaPlayer Player
function Informatron.toggle(player)
  local root = Informatron.get(player)

  if root then
    Informatron.close(player)
  else
    Informatron.open(player)
  end
end

---Displays a given interface/page_name.
---@param player LuaPlayer Player
---@param interface string Name of interface
---@param page_name string Page name
function Informatron.display(player, interface, page_name)
  local root = Informatron.get(player) --[[@as LuaGuiElement]]
  local menu_pane = _get_gui_element(root, Informatron.path_menu_pane) --[[@as LuaGuiElement]]
  local head = _get_gui_element(root, Informatron.path_content_subheader) --[[@as LuaGuiElement]]
  local content = _get_gui_element(root, Informatron.path_content_pane) --[[@as LuaGuiElement]]
  local path_label = head[Informatron.name_content_path]
  local title_label = head[Informatron.name_content_title]
  local player_index = player.index

  local last_page = Informatron.get_make_playerdata(player_index).last_page
  if last_page then
    _apply_unselected_style(menu_pane, last_page.interface, last_page.page_name)
  end
  _apply_selected_style(menu_pane, interface, page_name)

  local menu_button = menu_pane[interface .. "/" .. page_name]
  if not menu_button then return end

  menu_pane.scroll_to_element(menu_button)

  local path = menu_button.tags.path --[[@as table|nil]]
  local path_str = {"", "/ "}

  for _, level in pairs(path or {}) do
    table.insert(path_str, level)
    table.insert(path_str, " / ")
  end

  path_label.caption = path_str

  if remote.interfaces[interface]["informatron_title_caption_override"] then
    title_label.caption =
      remote.call(interface, "informatron_title_caption_override",
          {page_name = page_name, player_index=player_index}) or
      {interface .. ".title_" .. page_name}
  else
    title_label.caption = {interface .. ".title_" .. page_name}
  end

  content.clear()
  if remote.interfaces[interface]["informatron_page_content"] then
    remote.call(interface, "informatron_page_content",
        {player_index=player_index, page_name=page_name, element=content})
  end

  -- Make sure all direct descendents are squashable
  for _, child in pairs(content.children) do
    child.style.horizontally_squashable = true
    child.style.maximal_width = Informatron.content_width - 52
    if child.type == "label" then
      child.style.single_line = false
    end
  end

  content.scroll_to_top()

  Informatron.get_make_playerdata(player_index).last_page = {
    interface = interface,
    page_name = page_name
  }
end

---Updates the Informatron GUI of a given player
---@param player LuaPlayer Player
---@param tick uint Game tick
function Informatron.update(player, tick)
  local root = Informatron.get(player)
  if not root then return end

  _update_time(root, tick)

  local player_index = player.index
  local last_page = Informatron.get_make_playerdata(player_index).last_page
  if not (last_page and last_page.interface and last_page.page_name) then return end

  local interface = last_page.interface
  local page_name = last_page.page_name
  local content = _get_gui_element(root, Informatron.path_content_pane) --[[@as LuaGuiElement]]

  if remote.interfaces[interface]["informatron_page_content_update"] then
    remote.call(interface, "informatron_page_content_update",
        {player_index=player_index, page_name=page_name, element=content})
  end

  for _, child in pairs(content.children) do
    child.style.horizontally_squashable = true
    child.style.maximal_width = Informatron.content_width - 52
    if child.type == "label" then
      child.style.single_line = false
    end
  end
end

---Closes the informatron GUI for the given player
function Informatron.close(player)
  local root = Informatron.get(player)
  if root then root.destroy() end
end

-- Returns true if the game is a testing game (from Editor Extensions or from ctrl+clicking "New Game")
local function is_testing_game()
  return script.level.level_name == "testing" or
         script.level.mod_name == "EditorExtensions" or
         game.default_map_gen_settings.height == 50 and game.default_map_gen_settings.width == 50 -- vanilla debug map
end

---Initializes informatron.
function Informatron.on_init()
  storage.open_informatron_check = not is_testing_game()

  -- In case mod is being added mid-game
  for _, player in pairs(game.players) do
    Informatron.update_overhead_button(player)
  end
end
script.on_init(Informatron.on_init)

---Handles mod changes.
function Informatron.on_configuration_changed()
  for _, player in pairs(game.players) do
    -- Destroy old Informatron windows if they're open
    if player.gui.center["informatron_main"] then
      player.gui.center["informatron_main"].destroy()
    end
    if player.gui.screen["informatron_main"] then
      player.gui.screen["informatron_main"].destroy()
    end

    -- Refresh overhead buttons
    Informatron.update_overhead_button(player)

    -- If a player had Informatron open, close/reopen it to refresh its contents
    local root = Informatron.get(player)
    if root then
      Informatron.close(player)
      Informatron.open(player)
    end
  end
end
script.on_configuration_changed(Informatron.on_configuration_changed)

---Handles changes to the overhead button setting.
---@param event EventData.on_runtime_mod_setting_changed Event data
function Informatron.on_runtime_mod_setting_changed(event)
  if event.player_index and event.setting == Informatron.name_setting_overhead_button then
    Informatron.update_overhead_button(game.get_player(event.player_index) --[[@as LuaPlayer]])
  end
end
script.on_event(defines.events.on_runtime_mod_setting_changed,
    Informatron.on_runtime_mod_setting_changed)

---Handles new player creation.
---@param event EventData.on_player_created Event data
function Informatron.on_player_created(event)
  Informatron.update_overhead_button(game.get_player(event.player_index) --[[@as LuaPlayer]])
  storage.open_informatron_check = not is_testing_game() -- triggers a check in `on_nth_tick_60`
end
script.on_event(defines.events.on_player_created, Informatron.on_player_created)

---Calls update functions every second.
---@param event NthTickEventData Event data
function Informatron.on_nth_tick_60(event)
  if storage.open_informatron_check and event.tick >= 1200 then
    storage.open_informatron_check = nil
    for _, player in pairs(game.connected_players) do
      local playerdata = Informatron.get_make_playerdata(player.index)
      if not playerdata.last_page and
          not player.cheat_mode and
          player.mod_settings[Informatron.name_setting_show_at_start].value then
        if player.opened or player.opened_self then -- Wait until they don't have something else open
          storage.open_informatron_check = true
        else
          Informatron.open(player)
        end
      end
    end
  end

  for _, player in pairs(game.connected_players) do
    Informatron.update(player, event.tick)
  end
end
script.on_nth_tick(60, Informatron.on_nth_tick_60)

---Handles gui clicks, including for the overhead button.
---@param event EventData.on_gui_click Event data
function Informatron.on_gui_click(event)
  if event.element.name == Informatron.name_overhead_button then
    Informatron.toggle(game.get_player(event.player_index) --[[@as LuaPlayer]])
    return
  end

  if event.element.tags.root ~= "informatron" then return end

  local tags = event.element.tags
  local action = tags.action
  local player = game.get_player(event.player_index) --[[@as LuaPlayer]]

  if action == Informatron.action_close_button then
    Informatron.close(player)
  elseif action == Informatron.action_menu_button then
    Informatron.display(
      player,
      tags.interface --[[@as string]],
      tags.page_name --[[@as string]]
    )
  end
end
script.on_event(defines.events.on_gui_click, Informatron.on_gui_click)

---Closes the Informtron GUI when the player uses `E` or `Esc`.
---@param event EventData.on_gui_closed Event data
function Informatron.on_gui_closed(event)
  if event.element and event.element.name == Informatron.name_root then
    Informatron.close(game.get_player(event.player_index) --[[@as LuaPlayer]])
  end
end
script.on_event(defines.events.on_gui_closed, Informatron.on_gui_closed)

---Handles the keyboard shortcut for Informatron being used.
---@param event EventData.CustomInputEvent Event data
function Informatron.on_keyboard_shortcut(event)
  Informatron.toggle(game.get_player(event.player_index) --[[@as LuaPlayer]])
end
script.on_event(Informatron.name_event, Informatron.on_keyboard_shortcut)

---Handles the lua shortcut getting clicked.
---@param event EventData.on_lua_shortcut Event data
function Informatron.on_lua_shortcut(event)
  if event.prototype_name == Informatron.name_lua_shortcut then
    Informatron.toggle(game.get_player(event.player_index) --[[@as LuaPlayer]])
  end
end
script.on_event(defines.events.on_lua_shortcut, Informatron.on_lua_shortcut)

return Informatron
