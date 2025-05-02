require("util")


return function(mod_name)
  --~ local common = {}
  local mod_data = require("__CharacterModHelper__/mod_data")
  local common = require("__Pi-C_lib__/common")(mod_data)

  common.images = require("__CharacterModHelper__.images")

  ----------------------------------------------------------------------------------
  -- Get mod name and path to mod
  common.modName = script and script.mod_name or mod_name
  common.modRoot = "__"..common.modName.."__"


  ----------------------------------------------------------------------------------
  -- Known character selector mods
  common.selector_mod_list = {
    ["minime"] = {
      -- At least this version of the mod must be active!
      min_version = "1.1.21",
      -- Data stage: Mod has a setting that must have a certain value to make it
      --  recognize multiple characters (optional).
      -- (minime will just scale the character scaler if there is no such setting)
      enable_multichar_setting = "minime_character-selector",
      -- Value that turns on character-selector mode (nil if there is no setting)
      enable_multichar_setting_value = true,

      -- Control stage: Mod requires this setting to enable on-the-fly character
      -- switching
      on_the_fly_setting = nil,
      -- Value this setting must have to enable on-the-fly character switching
      on_the_fly_setting_value = nil,
    },

    ["RitnCharacters"] = {
      min_version = "1.1.0",
      -- Data stage: Mod has a setting that must have a certain value to make it
      --  recognize multiple characters (optional).
      -- (RitnChars always allows players to choose a character when you start a
      -- new game.)
      enable_multichar_setting = nil,
      enable_multichar_setting_value = nil,

      -- Control stage: Mod requires this setting to enable on-the-fly character
      -- switching
      on_the_fly_setting = "ritnmods-characters-change",
      -- Value this setting must have to enable on-the-fly character switching
      on_the_fly_setting_value = true,

      -- Does this mod only support some hard-coded characters?
      -- (RitnCharacters >= 1.1.0 supports all characters!)
      --~ supported_characters = {
        --~ ["GearGirl-skin"] = true,
        --~ ["IRobot_character_skin"] = true,
        --~ ["among-us-character-skin"] = true,
        --~ ["Shrek-skin"] = true,
      --~ },
    },
  }


  ----------------------------------------------------------------------------------
  -- Known character mods that don't depend on CMH. We should still consider them
  -- when counting characters that overwrite the default character!
  common.bypass_character_mod_list = {
      ["GirlCharacter"] = {
        -- Last version of this mod that doesn't depend on us!
        max_version = nil,
        -- Names of characters provided by this mod
        characters = {"GearGirl-skin",},
      },
      ["shrek"] = {
        max_version = nil,
        characters = {"Shrek-skin"},
      },
      ["shrek2"] = {
        max_version = nil,
        characters = {"Shrek-skin"},
      },
      ["ProtogenCharacter"] = {
        max_version = nil,
        characters = {"Protogen-skin"},
      },
      ["vaporeon-character"] = {
        max_version = nil,
        characters = {"Vaporeon_character_skin"},
      },
  }

  ----------------------------------------------------------------------------------
  -- Type of the proxy prototypes that we use to transfer data to the control stage.
  common.proxy_type = "highlight-box"

  ----------------------------------------------------------------------------------
  -- Name prefixes for the proxy prototypes that we use to transfer data from the
  -- data to the control stage.
  common.proxy_prefix = "CMH_"
  common.proxy_prefix_selectors = common.proxy_prefix.."selector_mod_"
  common.proxy_prefix_characters = common.proxy_prefix.."characters_"


  ----------------------------------------------------------------------------------
  -- Nag each admin at most this many times about missing selector mods. The count
  -- will be reset when a selector mod has been available and is removed again!
  common.max_nag_count = 3


  ----------------------------------------------------------------------------------
  -- We must transfer some data from the data stage to the control stage, so we add
  -- copies of an unrelated entity and use their name field to store text. If the
  -- name of an old entity is passed on, we try to remove it before creating the new
  -- one!
  common.create_data_proxy = function(args)
    CMH.entered_function({args})

    CMH.assert(args, "table", "table with arguments")
    local new = args.new
    local old = args.old
    local properties = args.properties


    CMH.assert(new, "string", "name of new stored entity")
    if new:len() > 200 then
      CMH.arg_err(new, "longer than 200 characters")
    elseif new:find(".", 1, true) then
      CMH.arg_err(new, "contains illegal character '.'")
    end

    CMH.assert(old, {"string", "nil"}, "name of last stored entity")
    CMH.assert(properties, {"table", "nil"},
                            "nil or list of properties to change in addition to name")

    --~ local proxies = data.raw["arrow"]
    local proxies = data.raw[common.proxy_type]

    -- Remove old prototype?
    if old and proxies[old] then
      CMH.writeDebug("Removing %s!", {CMH.argprint(proxies[old])})
      proxies[old] = nil
    end

    -- Create new prototype! We use the prototype name to store the main information.
    local new_proxy = {
      --~ type = "arrow",
      type = common.proxy_type,
      name = new,
      flags = { "not-on-map" },
      --~ blinking = false,
      --~ arrow_picture =
      --~ {
        --~ filename = "__core__/graphics/empty.png",
        --~ priority = "low",
        --~ size = 64,
      --~ },
      hidden = true,
      hidden_in_factoriopedia = true,
    }

    -- We may have to store additional data, e.g. the localized name of characters
    for p_name, property in pairs(properties or {}) do
      new_proxy[p_name] = property
      CMH.writeDebug("Changed %s: %s", {p_name, property})
    end
    data:extend({new_proxy})
    CMH.created_msg(new_proxy)

    CMH.entered_function("leave")
    return new
  end


  ----------------------------------------------------------------------------------
  --  Ask "Space Exploration" whether player is in navigator view (god mode)
  common.SE_remote_view = function(player)
    common.entered_function({player})

    local p = common.ascertain_player(player)
    local ret

    if p and p.valid then
      local SE = remote.interfaces["space-exploration"]
      if SE and SE["remote_view_is_active"] then
        ret = remote.call("space-exploration", "remote_view_is_active", {player = p})
      end
    end
    common.show("ret", ret)

    common.entered_function({}, "leave")
    return ret
  end


  ----------------------------------------------------------------------------------
  -- Get localised name of a character
  common.get_loc_name = function(char)
    common.entered_function({char})

    common.assert(char, "table", "character data")

    local ret
common.show("char.localised_name", char.localised_name)
common.show("Is name of default character",
char.localised_name and util.table.compare(char.localised_name, {"entity-name.character"}) or {})
    if char.localised_name and
        not util.table.compare(char.localised_name, {"entity-name.character"}) then

      common.writeDebug("Using localised_name of character!")
      ret = char.localised_name

    -- Fall back to internal name if there is no proper localised_name!
    else
      common.writeDebug("Using character name!")
      ret = {"entity-name."..char.name}
    end

    return ret
  end


------------------------------------------------------------------------------------
--                                    END OF FILE
------------------------------------------------------------------------------------
  return common
end
