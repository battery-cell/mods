log("Entered file " .. debug.getinfo(1).source)
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--                              Note for mod authors                              --
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

-- This mod will add another character to the game. It will not change the default
-- character (data.raw.character.character) at this point, so you can change it any
-- way you like. If we find in data-final-fixes that only one character is required
-- in the current game, any changes made to the default character will be applied to
-- the new character, and the new character will then replace the default character.
--
-- If you are the author of a character selector mod, you can prevent that the
-- default character is overwritten by adding the following to data-updates.lua:

--[[

    if CharModHelper and CharModHelper.enable_multi_character then
      CharModHelper.enable_multi_character("name-of-your-mod")
    end

--]]



------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--                     Some useful stuff and local definitions                    --
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
-- Debugging functions etc. provided by "CharacterModHelper"
MECHANICUS = require("__CharacterModHelper__.common")("MechanicusMiniMAX")

-- Enable verbose logging? (Change the value of default if you don't have the mod!)
local LOGGING_DEFAULT = false
MECHANICUS.is_debug = mods["_debug"] and true or LOGGING_DEFAULT

-- Share image path by adding it to the global table (also used in animations.lua)
MECHANICUS.IMG_PATH = MECHANICUS.modRoot.."/graphics/"

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--                  Properties of character and character-corpse                  --
--  Put these in tables so we can easily apply the changes to the new prototypes  --
--  and keep track of what properties to skip when we copy properties from the    --
--  default to the new prototype, to keep changes made by other mods intact.      --
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
MECHANICUS.protos = {}

------------------------------------------------------------------------------------
--   We can add data for the new prototypes to the global table we already have   --
------------------------------------------------------------------------------------
-- "miniMAXIme" expects that characters have the string "skin" (case insensitive)
-- somewhere in their name. The name is stored in file name.lua because we also need
-- it in settings-updates.lua, so we must make sure it's the same everywhere.
MECHANICUS.protos.character                 = { name = require("name") }
MECHANICUS.protos.corpse                    = { name = MECHANICUS.protos.character.name.."-corpse" }


------------------------------------------------------------------------------------
--                                    Character                                   --
------------------------------------------------------------------------------------
MECHANICUS.protos.character.localised_name         = {"entity-name."..MECHANICUS.protos.character.name}
MECHANICUS.protos.character.localised_description  = {"entity-description."..MECHANICUS.protos.character.name}
MECHANICUS.protos.character.icons                  = {
  {
    icon = MECHANICUS.IMG_PATH.."mechanicus-icon.png",
    icon_size = 64,
  }
}
MECHANICUS.protos.character.animations             = require("animations")
MECHANICUS.protos.character.character_corpse       = MECHANICUS.protos.corpse.name
MECHANICUS.protos.character.fast_replaceable_group = "character"
-- This will be added by the helper mod if a character-selector mod is active!
--~ MECHANICUS.protos.character.order                  = MECHANICUS.modName


------------------------------------------------------------------------------------
--                                Character corpse                                --
------------------------------------------------------------------------------------
MECHANICUS.protos.corpse.name                      = MECHANICUS.protos.character.name.."-corpse"
MECHANICUS.protos.corpse.localised_name            = {"entity-name."..MECHANICUS.protos.corpse.name}
MECHANICUS.protos.corpse.icons                     = {
  {
    icon                  = MECHANICUS.IMG_PATH.."mechanicus-corpse.png",
    icon_mipmaps          = 1,
    icon_size             = 128,
  },
}

base_size = 320
base_scale = 0.325

-- This will be added by the helper mod if a character-selector mod is active!
--~ MECHANICUS.protos.corpse.order                     = MECHANICUS.modName
MECHANICUS.protos.corpse.pictures                  = {
  layers = {
    {
      filename          = MECHANICUS.IMG_PATH.."base/level1_dead.png",
      frame_count       = 2,
      size              = base_size,
      scale             = base_scale
    },
  },
}


-- Create prototypes
CharModHelper.create_prototypes(MECHANICUS.protos)


------------------------------------------------------------------------------------
--                                     TESTING                                    --
------------------------------------------------------------------------------------
--~ error("Break!")


------------------------------------------------------------------------------------
MECHANICUS.entered_file("leave")
