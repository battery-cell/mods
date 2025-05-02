log("Entered file control.lua!")

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--                                  REQUIRE FILES                                 --
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
CMH = require("common")()

-- Support for "Global variable viewer"
if CMH.is_debug and script.active_mods["gvv"] then
  require("__gvv__.gvv")()
  CMH.writeDebug("Enabled support for gvv!")
end


local CMH_commands = require("commands")

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--                                LOCAL DEFINITIONS                               --
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
local function get_selector_mod_diagnostics()
  CMH.entered_function()

  local ret = {}
  local version, setting, value, need_value
  local wrapper, msg, unsupported

  -- We don't want to add a linebreak after the last mod's block, so we must keep
  -- track of how many mods are left in the list!
  local mod_cnt = table_size(CMH.selector_mod_list)
  local char_cnt = 0
  local total_char_cnt, max_char_cnt, dont_show_cnt
CMH.show("char_cnt", char_cnt)

  for mod_name, mod_data in pairs(storage.selector_mods) do
CMH.writeDebug("%s: %s", {CMH.enquote(mod_name), mod_data}, "line")

    mod_cnt = mod_cnt - 1
CMH.show("mod_cnt", mod_cnt)

    version = script.active_mods[mod_name]
CMH.show("version of "..CMH.enquote(mod_name), version)

    ret[mod_name] = {}

    -- Is mod installed?
    wrapper = version and "CMH-states.good-state-wrapper" or
                          "CMH-states.bad-state-wrapper"
    table.insert(ret[mod_name], {
      "CMH-messages.selector-mod-installed",
      mod_name,
      version and {wrapper, {"CMH-states.yes"}} or {wrapper, {"CMH-states.no"}}
    })

    -- We only need this for active mods!
    if version then

      -- Check that mod version is not lower than the required minimum version
CMH.show("mod_data.min_version", mod_data.min_version)
      if mod_data.min_version then
        msg = CMH.check_version(mod_name, ">=", mod_data.min_version) and
              "CMH-messages.selector-mod-valid-version" or
              "CMH-messages.selector-mod-invalid-version"
        CMH.writeDebug("Current version: %s\nRequired minimum version %s",
                        {version, mod_data.min_version})
        table.insert(ret[mod_name], {msg, version, mod_data.min_version})
      end

      -- If the mod supports multiple characters depending on a setting, print the
      -- setting state
      setting = mod_data.enable_multichar_setting
      need_value = mod_data.enable_multichar_setting_value
      if setting and need_value then
        value = CMH.get_startup_setting(setting)
        CMH.writeDebug("Multi-character setting %s has required value (%s == %s)!",
                        {setting, value, need_value})

        msg = (value == need_value) and {
                "CMH-messages.selector-mod-multichar-enabled",
                {"mod-setting-name."..setting},
                CMH.argprint(value)
              } or {
                "CMH-messages.selector-mod-multichar-disabled",
                {"mod-setting-name."..setting},
                CMH.argprint(value),
                need_value
              }
        table.insert(ret[mod_name], msg)
      end

      -- If on-the-fly character switching is locked behind a setting, print the
      -- setting state
      setting = mod_data.on_the_fly_setting
      need_value = mod_data.on_the_fly_setting_value
      if setting and need_value then
        value = CMH.get_startup_setting(setting)
        CMH.writeDebug("On-the-fly setting %s has required value (%s == %s)!",
                        {setting, value, need_value})

        msg = (value == need_value) and {
                "CMH-messages.selector-mod-on-the-fly-enabled",
                {"mod-setting-name."..setting},
                CMH.argprint(value)
              } or {
                "CMH-messages.selector-mod-on-the-fly-disabled",
                {"mod-setting-name."..setting},
                CMH.argprint(value),
                need_value
              }
        table.insert(ret[mod_name], msg)
      end
    end

    -- Always show whether the mod would support all available characters!
    if mod_data.unsupported_characters and
        next(mod_data.unsupported_characters) then

      CMH.writeDebug("Found %s unsupported characters!",
                      {table_size(mod_data.unsupported_characters)})

      total_char_cnt = table_size(mod_data.unsupported_characters)
      max_char_cnt = math.min(total_char_cnt, 10)
      dont_show_cnt = total_char_cnt - max_char_cnt
CMH.show("char_cnt", char_cnt)
CMH.show("total_char_cnt", total_char_cnt)
CMH.show("max_char_cnt", max_char_cnt)
CMH.show("dont_show_cnt", dont_show_cnt)


      unsupported = {""}
      wrapper = "CMH-messages.char-name-wrapper"

      for c, c_loc in pairs(mod_data.unsupported_characters) do
        table.insert(unsupported, {wrapper, c_loc})
        char_cnt = char_cnt + 1
CMH.show("char_cnt", char_cnt)
CMH.show("char_cnt > max_char_cnt", char_cnt > max_char_cnt)
CMH.show("char_cnt < max_char_cnt", char_cnt < max_char_cnt)
        if char_cnt == max_char_cnt then
          if dont_show_cnt > 0 then
            CMH.writeDebug("Adding count of remaining characters!")
            table.insert(unsupported,
                          {"CMH-messages.more-characters", dont_show_cnt})
          end
          CMH.writeDebug("Maximum number of characters reached -- stopping!")
          break
        elseif char_cnt < max_char_cnt then
          table.insert(unsupported, ", ")
        end
      end

      msg = {"CMH-messages.unsupported", {"CMH-states.no"}, unsupported}
      msg = {
              "CMH-messages.selector-mod-unsupported-chars",
              {"CMH-states.bad-state-wrapper", msg}
            }
    else
      msg = {
              "CMH-messages.selector-mod-unsupported-chars",
              {"CMH-states.good-state-wrapper", {"CMH-states.yes"}}
            }
    end
    table.insert(ret[mod_name], msg)


    -- If a mod informed us that it disabled its selector mode, print the reason
    if storage.manually_disabled_mods and
        storage.manually_disabled_mods[mod_name] then

      wrapper = "CMH-states.bad-state-wrapper"
      msg = {wrapper, storage.manually_disabled_mods[mod_name]}

      CMH.writeDebug("Mod \"%s\" has disabled its character selector mode!",
                      {mod_name})
      table.insert(ret[mod_name], msg)
    end

    -- Add another line if there is at least one more mod!
    if mod_cnt > 0 then
      table.insert(ret[mod_name], " ")
    end
  end

  CMH.entered_function("leave")
  return ret
end


local function check_supported_characters(mod_name)
  CMH.entered_function({mod_name})

  CMH.assert(mod_name, "string", "name of a character selector mod")

  local mod_data = storage.selector_mods[mod_name]
CMH.show("storage.selector_mods", storage.selector_mods)
CMH.show("mod_data", mod_data)

  -- We'll return true if there are no hard-coded characters, or if only characters
  -- that are supported by the mod are available in the game.
  local ret = true

  -- Mod uses a hard-coded character list
  if mod_data.supported_characters then
    CMH.writeDebug("Mod %s has a hard-coded character list!",
                    {CMH.enquote(mod_name)})
    for c_name, c_locname in pairs(storage.characters) do
      CMH.writeDebug("Character %s: %s", {CMH.enquote(c_name), {c_locname}})

      if not mod_data.supported_characters[c_name] then
        mod_data.unsupported_characters = mod_data.unsupported_characters or {}
        mod_data.unsupported_characters[c_name] = c_locname
        CMH.writeDebug("Added %s to list of unsupported characters.",
                        {CMH.enquote(c_name)})
      end
    end
    if mod_data.unsupported_characters then
      ret = false
    end
  end

  CMH.entered_function("leave")
  return ret
end


-- Check whether a character selector mod is available.
local function is_selector_active()
  CMH.entered_function()

  local ret
CMH.show("storage.selector_mods", storage.selector_mods)

  local setting, value
  for m_name, m_data in pairs(storage.selector_mods) do
    local mod_active, enable_multichar, on_the_fly, all_chars_supported

    -- Even if the mod isn't active, players should know whether it would support
    -- all characters that are available in the game!
    all_chars_supported = check_supported_characters(m_name)
CMH.show("all_chars_supported", all_chars_supported)

    -- Mod version must be at least min_version!
    if script.active_mods[m_name] and
        ( not m_data.min_version or
          CMH.check_version(m_name, ">=", m_data.min_version) ) then

      CMH.writeDebug("Found character selector mod %s:", {CMH.enquote(m_name)})
      mod_active = true

      -- Is there a setting to toggle whether multiple character will be created?
      -- (Ritn Characters always supports multiple characters, minime depends on a
      -- setting!)
      CMH.writeDebugNewBlock("Checking enable_multichar_setting!")
      setting = m_data.enable_multichar_setting
      value = m_data.enable_multichar_setting_value
CMH.show("setting", setting)
CMH.show("value", value)
      if CMH.get_startup_setting(setting) == value then
        CMH.writeDebug("%s", {
          setting and "Correct setting enabled." or "No setting!"
        })
        enable_multichar = true
      else
        CMH.writeDebug("Multiple characters are not enabled!")
      end

      -- Is there a setting to toggle whether characters can be changed on the fly?
      CMH.writeDebugNewBlock("Checking on_the_fly_setting!")
      setting = m_data.on_the_fly_setting
      value = m_data.on_the_fly_setting_value
CMH.show("setting", setting)
CMH.show("value", value)
      if CMH.get_startup_setting(setting) == value then
        CMH.writeDebug("%s", {
          setting and "Correct setting enabled." or "No setting!"
        })
        on_the_fly = true
      else
        CMH.writeDebug("On-the-fly character switching has been turned off!")
      end

    -- Mod is not installed
    else
      CMH.writeDebug("Didn't find mod %s!", {CMH.enquote(m_name)})
    end

    if mod_active and enable_multichar and on_the_fly and all_chars_supported then
      CMH.writeDebug("Found active selector mod: \"%s\"", {m_name})
      ret = m_name
      break
    end
  end

  CMH.entered_function("leave")
  return ret
end


-- Check whether a character selector mod should be active, and nag admins/single
-- player if it isn't. If called without an argument, all connected admins found in
-- game.players will be nagged.
-- The function will return true if there is a reason for nagging admins, even if no
-- message has actually been printed to a player.
local function nag_about_missing_char_selector(player)
  CMH.entered_function({player})

  CMH.assert(player, {"LuaPlayer", "nil"}, "LuaPlayer or nil")
  if player and not player.valid then
    CMH.arg_err(player, "player specification")
  end

  -- Don't nag if a character selector mod is active!
  local selector = storage.active_selector_mod and
                    not (storage.manually_disabled_mods and
                          next(storage.manually_disabled_mods))
CMH.show("selector", selector)
  if selector then
    CMH.entered_function({}, "leave", "Found selector mod "..CMH.enquote(selector))
    return
  end

  -- If the default character has been overwritten more than once, nag admins (this
  -- includes the player in single player mode) if they are connected to the game!
  local overwrite_count = table_size(storage.characters)
CMH.show("overwrite_count", overwrite_count)

  local nag = overwrite_count and overwrite_count > 1
  if nag then

    -- Initialize table with nag counts of individual players with admin status
    storage.players_nagged = storage.players_nagged or {}

    -- Get diagnostic messages explaining why no character selector mod is active
    -- (not installed, wrong version or setting, unsupported characters, ...)
    storage.diagnostic_msgs = storage.diagnostic_msgs or
                              get_selector_mod_diagnostics()
CMH.show("storage.diagnostic_msgs", storage.diagnostic_msgs)

    for p, player in pairs(player and {player} or game.players) do
      CMH.writeDebug("Checking %s!", {CMH.argprint(player)})

      if player.admin then
        storage.players_nagged[p] = storage.players_nagged[p] or 0
CMH.show("storage.players_nagged["..p.."]", storage.players_nagged[p])

        if player.connected and storage.players_nagged[p] < CMH.max_nag_count then
          player.print({"CMH-messages.missing-selector-mod", overwrite_count})

          for ms, messages in pairs(storage.diagnostic_msgs) do
            for m, message in pairs(messages) do
              player.print(message)
            end
          end
          storage.players_nagged[p] = storage.players_nagged[p] + 1
          CMH.writeDebug("Nagged %s %s times!",
                          {CMH.argprint(player), storage.players_nagged[p]})
        end
      end
    end
  end

  CMH.entered_function("leave")
  return nag
end


-- Create commands so players can get a character when they are stuck in god mode.
local function add_commands()
  CMH.entered_function()

  local name

  for c_name, command in pairs(CMH_commands) do
    CMH.show(c_name, CMH.argprint(command))

    name = c_name:gsub("_", "-")
    -- Do nothing if command already exists!
    if commands.commands[name] then
      CMH.writeDebug("Command %s already exists!", {CMH.enquote(name)})

    -- Define new command
    else
      commands.add_command(name, {"CMH-commands."..name.."-help", name}, command)
      CMH.writeDebug("Added command %s.", {CMH.enquote(name)})
    end
  end

  CMH.entered_function("leave")
end


-- If a saved game is loaded, on_load will run before on_configuration_changed, and
-- add the commands because a flag is set in the global table. If we should find in
-- on_configuration_changed that no commands are needed, we must delete the commands
-- that on_load has added!
local function remove_commands()
  CMH.entered_function()

  local name, removed

  for c_name, command in pairs(CMH_commands) do
    CMH.show(c_name, CMH.argprint(command))

    name = c_name:gsub("_", "-")
    -- Remove command if it exists!
    if commands.commands[name] then
      CMH.writeDebug("Trying to remove command %s!", {CMH.enquote(name)})
      removed = commands.remove_command(name)
      CMH.show("Removed command", removed)
    end
  end

  CMH.entered_function("leave")
end


-- Show the new commands to players who are in god mode.
local function advertise_commands(player)
  CMH.entered_function(player)

  player = CMH.ascertain_player(player)
  local players = (player and player.valid) and {player} or game.players

  local our_commands = ""

  -- Make a list of all available commands
  local c_name
  for command_name, command in pairs(CMH_commands) do
CMH.show("command_name", command_name)
    c_name = command_name:gsub("_", "-")
    if c_name and commands.commands[c_name] then
      our_commands = string.format("%s\n/%s", our_commands, c_name)
    end
  end
CMH.show("our_commands", our_commands)

  if our_commands ~= "" then
    for p, player in pairs(players) do
CMH.show(p, CMH.argprint(player))
CMH.show("CMH.controller_names[player.controller_type]", CMH.controller_names[player.controller_type])
      if CMH.controller_names[player.controller_type] == "god" and
          not CMH.SE_remote_view(player) then

        player.print({"CMH-messages.new-commands", our_commands})
        CMH.writeDebug("Printed available commands to %s!", {CMH.argprint(player)})
      end
    end
  end

  CMH.entered_function("leave")
end



-- Reset everything!
local function init(flags)
  CMH.entered_function({flags})

  local nag = not (flags and flags.dont_nag)
CMH.show("nag", nag)
  storage = {
    -- These tables are created in response to remote calls from other mods, so we
    -- must keep them or they will be lost for good!
    manually_disabled_mods = storage.manually_disabled_mods,
    forbid_character_commands = storage.forbid_character_commands,
  }
  CMH.writeDebug("Emptied table storage!")

  storage.selector_mods = table.deepcopy(CMH.selector_mod_list)
  storage.characters = {}

  -- Find our proxy prototypes and save their data in the global table!
  do
    local proxies = prototypes.get_entity_filtered({
      --~ {filter = "type", type = "flying-text"}
      {filter = "type", type = CMH.proxy_type}
    })
    local char, selector, mod_version


    for p_name, proto in pairs(proxies) do
      char = p_name:match("^"..CMH.proxy_prefix_characters.."(.+)$")
      selector = not char and p_name:match("^"..CMH.proxy_prefix_selectors.."(.+)$")

      -- Store character name together with localised name, so we can use it for
      -- diagnostic output when mods only support some hard-coded characters.
      if char then
        storage.characters[char] = proto.localised_name
        CMH.writeDebug("Stored character %s: %s",
                        {CMH.enquote(char), storage.characters[char]}, "line")

      -- Store selector mod name?
      elseif selector then
        mod_version = script.active_mods[selector]
        CMH.show("mod_version", mod_version)

        -- As the mod registered itself, we'll assume its current version will be at
        -- least the required minimum mod version, so we use that in our list.
        if mod_version then
          storage.selector_mods[selector] = {
            min_version = mod_version,
          }
          CMH.writeDebug("Added mod %s (%s) to list of character selector mods!",
                          {CMH.enquote(selector), mod_version})
        end

      -- Ignore other prototypes
      else
        CMH.writeDebug("Ignored %s!", {CMH.argprint(proto)})
      end
    end
  end

  -- Update list of character selector mods
  storage.active_selector_mod = is_selector_active()
CMH.show("storage.active_selector_mod", storage.active_selector_mod)
CMH.show("storage.manually_disabled_mods", storage.manually_disabled_mods)
CMH.show("next(storage.manually_disabled_mods)",
          storage.manually_disabled_mods and next(storage.manually_disabled_mods))

  -- If we have an active selector mod, we can clean up the global table!
  if storage.active_selector_mod and
      not (storage.manually_disabled_mods and
            next(storage.manually_disabled_mods)) then

    storage = { active_selector_mod = storage.active_selector_mod }
    CMH.writeDebug("Pruned storage table!")

  -- Nag admins if we have several character mods, but no active selector mod!
  elseif nag then
    CMH.writeDebug("Must nag players!")
    nag_about_missing_char_selector()
  end

  CMH.entered_function("leave")
end


------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--                                 EVENT HANDLERS                                 --
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

-- This will only be run on starting a new game! We'll skip on_init when the mod is
-- added to a running game because we can act in on_configuration_changed.
script.on_init(function()
  local event = {name = "on_init", tick = game.tick}
  CMH.entered_event(event)

  if game.tick == 0 then
    CMH.writeDebug("Initializing a new game!")

    -- Initialize global table
    init()

    --~ -- Nag admins if we have several character mods, but no active selector mod!
    --~ nag_about_missing_char_selector()
  else
    CMH.writeDebug("Waiting for on_configuration_changed!")
  end

  CMH.entered_event(event, "leave")
end)


-- Will be run when mod is added to a running game or mods/settings have changed
script.on_configuration_changed(function(event)
  event.name = "on_configuration_changed"
  event.tick = game.tick
  CMH.entered_event(event)

  -- Reset global table
  init({dont_nag = true})

  -- The event will be triggered when this mod already was active but something has
  -- changed, so we will always add recovery commands if multiple character mods are
  -- active without a selector mod.
  if nag_about_missing_char_selector() then
CMH.show("storage.forbid_character_commands", storage.forbid_character_commands)
    if storage.forbid_character_commands and
        next(storage.forbid_character_commands) then
      CMH.show("These mods forbid us to create commands",
                storage.forbid_character_commands)
    else
      CMH.writeDebug("Adding commands!")
      add_commands()
      storage.add_commands = true

  CMH.show("is multiplayer", game.is_multiplayer())
      -- In multiplayer games, we'll advertise our commands in on_player_joined_game!
      if not game.is_multiplayer() then
        CMH.writeDebug("Listing available commands for single player!")
        advertise_commands()
      end
    end
  -- Remove flag so commands won't be added in on_load!
  elseif storage.add_commands then
    remove_commands()
    storage.add_commands = nil
    CMH.writeDebug("Removed storage.add_commands!")
  end

  CMH.entered_event(event, "leave")
end)


-- Loaded existing game
script.on_load(function()
  CMH.entered_event({name = "on_load"})

  -- Check if commands must be loaded
  if storage.add_commands then
    CMH.writeDebug("Adding commands!")
    add_commands()
  end

  CMH.entered_event({name = "on_load"}, "leave")
end)


script.on_event(defines.events.on_player_joined_game, function(event)
  CMH.entered_event(event)

--[[
CMH.writeDebug("Looping over game.players")
for k, v in pairs(game.players) do
  CMH.show(k, v)
end
--]]
  local player = game.get_player(event.player_index)
CMH.show("player", player)
  -- If we nagged the player, we know that no character selector mod is active. If
  -- the last character that was attached to the player has been removed, the player
  -- could be stranded in god mode, so we advertise our command for creating a new
  -- character.
  local allow_commands = not (storage.forbid_character_commands and
                              next(storage.manually_disabled_mods))
  if nag_about_missing_char_selector(player) and
      allow_commands and (player.controller_type == defines.controllers.god) then

    advertise_commands(player)
  end

  CMH.entered_event(event, "leave")
end)


------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--                                REMOTE FUNCTIONS                                --
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
remote.add_interface(CMH.modName, {

  ----------------------------------------------------------------------------------
  -- Allow selector mods to declare their selector mode is disabled
  -- (miniMAXIme would use that if selector mode has been disabled because scenario
  -- doesn't support characters)
  selector_mode_disabled = function(mod_name, reason)
    CMH.entered_function({mod_name, reason})

    CMH.assert(mod_name, "string")
    CMH.assert(reason, {"string", "table"})

    if script.active_mods[mod_name] then
      storage.manually_disabled_mods = storage.manually_disabled_mods or {}
      storage.manually_disabled_mods[mod_name] = reason
      CMH.writeDebug("%s: Disabled selector mode. Reason: %s", {mod_name, {reason}})

      init()
    end

    CMH.entered_function("leave")
  end,

  ----------------------------------------------------------------------------------
  -- Allow selector mods to cancel a previous call to disable_selector_mode
  selector_mode_active = function(mod_name)
    CMH.entered_function({mod_name})

    CMH.assert(mod_name, "string")

    if script.active_mods[mod_name] and storage.manually_disabled_mods and
                                        storage.manually_disabled_mods[mod_name] then
      storage.manually_disabled_mods[mod_name] = nil
      CMH.writeDebug("%s: Enabled selector mode!", {mod_name})

      if not next(storage.manually_disabled_mods) then
        storage.manually_disabled_mods = nil
        CMH.writeDebug("No other mod has been manually disabled!")

        init()
      end
    end

    CMH.entered_function("leave")
  end,

  ----------------------------------------------------------------------------------
  -- Mod doesn't want us to provide commands for gaining a character if the player
  -- is in god mode (miniMAXIme would call this if current scenario doesn't support
  -- characters).
  forbid_character_commands = function(mod_name)
    CMH.entered_function({mod_name})

    CMH.assert(mod_name, "string")

    if script.active_mods[mod_name] then
      storage.forbid_character_commands = storage.forbid_character_commands or {}
      storage.forbid_character_commands[mod_name] = true

      CMH.writeDebug("Removing commands that allow players to regain a character!")
      remove_commands()

      init()
    end

    CMH.entered_function("leave")
  end,

  ----------------------------------------------------------------------------------
  -- Mod allows us to provide commands for gaining a character if the player
  -- is in god mode.
  allow_character_commands = function(mod_name)
    CMH.entered_function({mod_name})

    CMH.assert(mod_name, "string")

    if script.active_mods[mod_name] and
        storage.forbid_character_commands and
        storage.forbid_character_commands[mod_name] then

      storage.forbid_character_commands[mod_name] = nil
      CMH.writeDebug("Mod \"%s\" allows commands for giving players a character!",
                      {mod_name})

      -- Add commands if no other mod forbids us to create them!
      local cnt = table_size(storage.forbid_character_commands)
      if cnt > 0 then
        CMH.writeDebug("%s %s still %s us to create the commands!", {
          cnt,
          cnt > 1 and "mods" or "mod",
          cnt > 1 and "forbid" or "forbids"
        })
      else
        CMH.writeDebug("Creating commands!")
        add_commands()

        init()
      end
    end

    CMH.entered_function("leave")
  end,

})

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--                    FIND LOCAL VARIABLES THAT ARE USED GLOBALLY                 --
--                              (Thanks to eradicator!)                           --
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
do
  -- luacheck: no unused (Inline option for luacheck: ignore unused vars in block)

  local allowed_vars = {
    data = true,
    game = true,
    script = true,
    mods = true,
  }
  setmetatable(_ENV, {
    __newindex  = function(self, key, value)    -- locked_global_write
      error('\n\n[ER Global Lock] Forbidden global *write*:\n' ..
            serpent.line({key = key or '<nil>', value = value or '<nil>'})..'\n')
    end,
    __index     = function(self, key)           -- locked_global_read
      if not allowed_vars[key] then
        error('\n\n[ER Global Lock] Forbidden global *read*:\n' ..
            serpent.line({key = key or '<nil>'})..'\n')
      end
    end
  })
end

CMH.entered_file("leave")
