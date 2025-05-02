CMH.entered_file()

local chars = data.raw.character
local args, char, new_name

CMH.writeDebug("Looking for known character mods that bypass us!")
for mod_name, mod_data in pairs(CMH.bypass_character_mod_list) do
  CMH.show(mod_name, mod_data)
  if mods[mod_name] and
      ( not mod_data.max_version or
        CMH.check_version(mod_name, "<=", mod_data.max_version) ) then

    CMH.writeDebug("Found mod %s (version %s)!",
                    {CMH.enquote(mod_name), mods[mod_name]})
    for c, c_name in pairs(mod_data.characters or {}) do
      CMH.writeDebug("Creating proxy for %s.", {CMH.enquote(c_name)})

      char = chars[c_name]
      new_name = CMH.proxy_prefix_characters..c_name

      args = {
        new = new_name,
        properties = {
          localised_name = char and CMH.get_loc_name(char) or
                                    {"entity-name."..new_name},
        }
      }
      CMH.create_data_proxy(args)
    end
  end
end

CMH.entered_file("leave")
