CMH = require("__CharacterModHelper__.common")("CharacterModHelper")

CharModHelper = {}

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--                              NOTES FOR MOD AUTHORS                             --
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

-- WHO SHOULD USE THIS MOD?
------------------------------------------------------------------------------------
-- This mod should be used by mods that provide new characters ("character mods"),
-- and by mods that allow players to change their appearance by swapping characters
-- at runtime ("character selector mods"). If your mod only generates versions of
-- the main character with different stats (e.g. reach distance, inventory size, or
-- maximum health), you'll probably won't need this mod.


-- CHARACTER MODS
------------------------------------------------------------------------------------
-- Your mod adds a new character, but there may be other mods that do the same. It
-- isn't safe to overwrite the default character (data.raw.character.character)
-- immediately, because other mods may also want to overwrite/change properties of
-- the default character. Moreover, if a character selector mod is active, you
-- shouldn't overwrite the default character at all because players may want to be
-- able to use it as well.
-- Instead, you should create a separate character in data.lua. Wait until the final
-- data stage (data-final-fixes.lua), then check whether a character selector mod is
-- active. If so, keep the default character, otherwise overwrite it with yours.
--
-- Further information and example code: README/character-mods.txt


-- CHARACTER SELECTOR MODS
------------------------------------------------------------------------------------
-- If people use your mod, they probably want to use different characters so they
-- can change their appearance. Perhaps there's only one new character added, but
-- then they may want to have a choice between the default character and the new
-- one. Therefore, you must prevent them from overwriting the default character. But
-- this will only work if the character mods know that your mod needs the default
-- character!
-- There are some character selector mods I know about, and they will be taken care
-- of automatically. Other character selector mods must announce themselves, or they
-- will be ignored.
--
-- Further information and example code: README/selector-mods.txt




------------------------------------------------------------------------------------
--                                    FUNCTIONS                                   --
------------------------------------------------------------------------------------

-- Character mods: Apply defined properties to new prototype (data.lua)
CharModHelper.apply_properties = function(prototype, properties)
  CMH.entered_function({CMH.argprint(prototype), type(properties)})

  if not (CMH.check_args(prototype, "character") or
          CMH.check_args(prototype, "character-corpse")) then
    CMH.arg_err(prototype, "character or character-corpse prototype")
  elseif not CMH.check_args(properties, "table") then
    CMH.arg_err(properties, "table with "..prototype.type.." properties")
  end

  properties = CMH.images.check_space_age(properties) or properties
  properties = CMH.images.check_hr_graphics(properties) or properties

  for p_name, property in pairs(properties or CMH.EMPTY_TAB) do
CMH.show(p_name, type(property) == "table" and "table" or property)
    prototype[p_name] = table.deepcopy(property)
  end

  CMH.entered_function("leave")
end


-- Character mods: Create character and corpse prototypes (data.lua)
CharModHelper.create_prototypes = function(prototype_data)
  CMH.entered_function({prototype_data})

  if not CMH.check_args(prototype_data, "table") then
    CMH.arg_err(prototype_data, "table")
  elseif not CMH.check_args(prototype_data.character, "table") then
    CMH.arg_err(prototype_data.character, "character data")
  elseif not CMH.check_args(prototype_data.corpse, "table") then
    CMH.arg_err(prototype_data.character, "corpse data")
  end

  local character = table.deepcopy(data.raw["character"]["character"])
  CharModHelper.apply_properties(character, prototype_data.character)
  data:extend({character})
  CMH.created_msg(character)

  local corpse = table.deepcopy(data.raw["character-corpse"]["character-corpse"])
  CharModHelper.apply_properties(corpse, prototype_data.corpse)
  data:extend({corpse})
  CMH.created_msg(corpse)

  CMH.entered_function("leave")
end


-- Unknown character selector mods: Announce your mod (data-updates.lua)
CharModHelper.enable_multi_character = function(mod_name)
  CMH.entered_function({mod_name})

  if mod_name and mods[mod_name] then
    CMH.writeDebug("Will keep the default character (requested by %s)!",
                    {CMH.enquote(mod_name)})
    CharModHelper.keep_default_char = true

    CMH.writeDebug("Creating data proxy for mod %s!", {CMH.enquote(mod_name)})
    CMH.create_data_proxy({new = CMH.proxy_prefix_selectors..mod_name})
  else
    CMH.arg_err(mod_name, "mod name")
  end
  CMH.entered_function("leave")
end


-- Character mods (data-final-fixes.lua)
CharModHelper.check_my_prototypes = function(p_data)
  CMH.entered_function({CMH.argprint(p_data)})

  -- Check argument
  if type(p_data) ~= "table" then
    CMH.arg_err(data, "prototype data")
  elseif not (p_data.character and next(p_data.character)) then
    error(string.format("Missing data for character prototype!"))
  elseif not (p_data.corpse and next(p_data.corpse)) then
    error(string.format("Missing data for character-corpse prototype!"))
  end


  -- Update armor_picture_mapping in p_data.corpse!
  CMH.writeDebugNewBlock("Checking armor_picture_mapping of new corpse!")
  p_data.corpse = CMH.images.check_corpse_armor_mapping(p_data.corpse)
CMH.show("p_data.corpse.armor_picture_mapping", p_data.corpse.armor_picture_mapping)


  local replace_base_char = not CharModHelper.keep_default_char

  -- If no other mod explicitly asked to keep the default character, we check if any
  -- of the supported mods are active.
  CMH.writeDebugNewBlock("Replace default character?")
  if replace_base_char then
    local setting = "enable_multichar_setting"
    local need_value = "enable_multichar_setting_value"

    CMH.writeDebugNewBlock("Checking mod settings!")
    for name, m_data in pairs(CMH.selector_mod_list or {}) do
      -- Mod version must be at least min_version!
      if mods[name] and
          (not m_data.min_version or
              CMH.check_version(name, ">=", m_data.min_version)) then

        CMH.writeDebug("Found active selector mod %s!", {CMH.argprint(name)})

        -- Mod requires a setting to support multiple characters (e.g. minime)
        if m_data[setting] then
          if CMH.get_startup_setting(m_data[setting]) == m_data[need_value] then
            CMH.writeDebug("No: won't overwrite base character with %s.",
                            {CMH.enquote(p_data.character.name)})
            replace_base_char = false
            break
          else
            CMH.writeDebug("Yes: character selector mode has been turned off!")
          end

        -- Mod will always support multiple characters (e.g. RitnCharacters)
        else
          CMH.writeDebug("No: mod %s always supports multiple characters!",
                          {CMH.argprint(name)})
          replace_base_char = false
          break
        end
      end
    end

  -- Active character selector mod
  else
    CMH.writeDebug("No!")
  end

  local chars = data.raw.character
  local corpses = data.raw["character-corpse"]


  -- This game doesn't support multiple characters: overwrite default character!
  CMH.writeDebugNewBlock("Copy properties from %s to default character?",
                          {CMH.enquote(p_data.character.name)})
  if replace_base_char then
    CMH.writeDebug("Yes!")

    -- Copy properties from stored prototype data to default prototype
    local function overwrite(src, dst)
      for p_name, property in pairs(src) do
        if p_name ~= "name" then
          dst[p_name] = table.deepcopy(property)
          CMH.modified_msg(p_name, dst)
        end
      end
    end


    -- Overwrite default and remove new character
    overwrite(p_data.character, chars["character"])

    -- Create a proxy for each character that replaced the default char. This allows
    -- us to check whether selector mods with a hard-coded list of supported
    -- characters (e.g. "Ritn Characters") support all characters that have
    -- overwritten the default character.
    do
      CMH.writeDebugNewBlock("Creating proxy to store character %s!",
                              {CMH.enquote(p_data.character.name)})
      local char = p_data.character

      -- Create proxy
      local args = {
        new = CMH.proxy_prefix_characters..char.name,
        properties = {
          localised_name = CMH.get_loc_name(char),
        }
      }
      CMH.create_data_proxy(args)

      chars[p_data.character.name] = nil
      CMH.writeDebug("Removed character \"%s\"!", {char.name})
    end

    -- Overwrite default corpse
    CMH.writeDebugNewBlock("Overwriting default corpse!")
    overwrite(p_data.corpse, corpses["character-corpse"])

    -- Remove new corpse
    CMH.writeDebugNewBlock("Removing newly created corpe %s!",
                            {CMH.argprint(p_data.corpse.name)})
    corpses[p_data.corpse.name] = nil

    -- Change corpse of all characters that want to use the new one!
    CMH.writeDebugNewBlock("Trying to replace removed with default corpse!")
    for c_name, character in pairs(chars) do
      if character.character_corpse == p_data.corpse.name then
        character.character_corpse = "character-corpse"
        CMH.writeDebug("Changed corpse of character %s to default (%s)!",
                        {CMH.enquote(c_name), CMH.enquote("character-corpse")})
      else
        CMH.writeDebug("Ignoring character %s (uses corpse %s)!",
                        {CMH.enquote(c_name), CMH.enquote(character.character_corpse)})
      end
    end


  -- Game supports multiple characters: update new character with possibly changed
  -- properties of default character
  else
    CMH.writeDebug("No: copying properties from base character to %s!",
                    {CMH.enquote(p_data.character.name)})
    -- Copy all properties that are NOT stored in our table from the default entity
    -- to the new one, just in case other mods changed stuff.
    local function copy(src, dst, stored)
      for p_name, property in pairs(data.raw[src.type][src.name]) do
        if stored[p_name] == nil then
          dst[p_name] = table.deepcopy(property)
          CMH.modified_msg(p_name, dst)
        end
      end
    end

    -- Copy character
    copy(chars["character"], chars[p_data.character.name], p_data.character)
    local char = chars[p_data.character.name]

    -- Add order string to new character
    char.order = chars["character"].order.."["..p_data.character.name.."]"
CMH.show("char", char)

    -- Add flag 'not-in-made-in'? (Prevents character to be shown in recipe tooltip.)
    local new_flag = "not-in-made-in"
    CMH.writeDebugNewBlock("Add flag %s to character %s?",
                          {CMH.enquote(new_flag), CMH.enquote(p_data.character.name)})
    char.flags = char.flags or {}
CMH.show("char.flags", char.flags)
    if CMH.table_contains(char.flags, new_flag) then
      CMH.show("No: flag is already set!")
    else
      CMH.writeDebug("Yes!")
        table.insert(char.flags, new_flag)
    end
CMH.show("New flags", char.flags)

    -- Copy corpse and add order string to corpses of default + new character
    CMH.writeDebugNewBlock("Copying properties from default corpse to %s!",
                            {CMH.enquote(p_data.corpse.name)})
    copy(corpses["character-corpse"], corpses[p_data.corpse.name], p_data.corpse)

    CMH.writeDebugNewBlock("Setting order string of default corpse!")
    corpses["character-corpse"].order = "a-[character-corpse]"

    CMH.writeDebugNewBlock("Setting order string of new corpse!")
    corpses[p_data.corpse.name].order = corpses["character-corpse"].order.."-["..p_data.character.name.."]"
  end

  CMH.entered_function("leave")
end



------------------------------------------------------------------------------------
--                                  TESTING AREA                                  --
------------------------------------------------------------------------------------

--~ local corpse = data.raw["character-corpse"]["character-corpse"]
--~ CMH.show("corpse.picture", corpse.picture)
--~ CMH.show("corpse.pictures", corpse.pictures)
--~ error("Break!")
