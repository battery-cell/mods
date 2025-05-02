CMH.entered_file()

local img = {}

local SA_anims = {
  idle_in_air = true,
  idle_with_gun_in_air = true,
  flying = true,
  flying_with_gun = true,

  take_off = true,
  landing = true,
}
local SA_other = {
  smoke_in_air = true,
  smoke_cycles_per_tick = true,
  extra_smoke_cycles_per_tile = true,
}


-- Remove properties that are only available in space-age if that mod is not active!
img.check_space_age = function(properties)
  CMH.entered_function({type(properties)})

  if mods["space-age"] or not properties then
    CMH.nothing_to_do()
    return properties
  end

  CMH.writeDebugNewBlock("Trying to remove SA-specific animations!")
  if properties.animations then
    for a_name, anim in pairs(SA_anims) do
      if properties.animations[a_name] then
        properties.animations[a_name] = nil
        CMH.writeDebug("Removed animation %s!", {CMH.enquote(a_name)})
      end
    end
  end

  CMH.writeDebugNewBlock("Trying to remove other SA-specific properties!")
  for p_name, p in pairs(SA_other) do
    if properties[p_name] then
      properties[p_name] = nil
      CMH.writeDebug("Removed property %s!", {CMH.enquote(p_name)})
    end
  end

  CMH.entered_function("leave")
  return properties
end


-- Factorio 2.0 doesn't separate low-res and hi-res images. If a mod is still using
-- hr_version in its definitions, that will be discarded and only the low-res image
-- will be used. We better move all properties from hr_version to the main image!
img.check_hr_graphics = function(properties)
  CMH.entered_function({type(properties)})

  for k, v in pairs(properties or CMH.EMPTY_TAB) do
    if type(v) == "table" then
      if v.hr_version then
        CMH.writeDebugNewBlock("Found image with hr_version in %s!", {k})
        for p_name, property in pairs(v.hr_version) do
          CMH.writeDebug("Copying hr_version.%s!", {p_name})
          v[p_name] = table.deepcopy(property)
        end
        properties[k].hr_version = nil
      else
        CMH.writeDebugNewBlock("Diving into %s!", {k})
        img.check_hr_graphics(v)
      end
    end
  end

  CMH.entered_function("leave")
  return properties
end



-- Mods like "Metal and Stars" may add new armors and armor pictures to the default
-- character's corpse. Update armor_picture_mapping of new corpse accordingly!
img.check_corpse_armor_mapping = function(corpse_data)
  CMH.entered_function({corpse_data})

  CMH.assert(corpse_data, "table", "corpse_data")
CMH.show("corpse_data.armor_picture_mapping", corpse_data.armor_picture_mapping)
  if not corpse_data.armor_picture_mapping then
    CMH.entered_function({}, "leave", "no armor_picture_mapping in corpse data")
    return corpse_data
  end

  -- Deduce amount of pictures in corpse_data.pictures from values in
  -- corpse_data.armor_picture_mapping!
  CMH.writeDebugNewBlock("Deducing index of last armor picture!")
  local last_pic = 0
  for name, index in pairs(corpse_data.armor_picture_mapping) do
CMH.show(name, index)
    if last_pic < index then
      CMH.writeDebug("Setting last_pic to %s!", last_pic)
      last_pic = index
    end
  end
CMH.show("last_pic", last_pic)

  -- Compare armor_picture_mapping of default corpse with that in corpse data!
  CMH.writeDebugNewBlock("Checking armor_picture_mapping of default corpse!")
  local default = data.raw["character-corpse"]["character-corpse"]
  local new = corpse_data.armor_picture_mapping

  for name, index in pairs(default.armor_picture_mapping or CMH.EMPTY_TAB) do
    CMH.writeDebugNewBlock("%s: %s (default), %s (new)",
                            {name, index, new[name] or "nil"})
    if not new[name] then
      CMH.writeDebug("Adding mapping for %s to %s!", {CMH.enquote(name), last_pic})
      new[name] = last_pic
    end
  end

  CMH.entered_function("leave")
  return corpse_data
end


CMH.entered_file("leave")
return img
