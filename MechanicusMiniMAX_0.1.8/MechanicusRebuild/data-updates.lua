MECHANICUS.entered_file()

------------------------------------------------------------------------------------
--             Make sure the same picture will be used for all armors!            --
------------------------------------------------------------------------------------
local corpse = data.raw["character-corpse"][MECHANICUS.protos.corpse.name]

corpse.armor_picture_mapping = {}
for a_name, armor in pairs(data.raw.armor) do
  corpse.armor_picture_mapping[a_name] = 1
  MECHANICUS.writeDebug("Changed armor_picture_mapping of \"%s\" for \"%s\": %s",
                    {corpse.name, a_name, corpse.armor_picture_mapping[a_name]})
end

MECHANICUS.protos.corpse.armor_picture_mapping = table.deepcopy(corpse.armor_picture_mapping)

------------------------------------------------------------------------------------
MECHANICUS.entered_file("leave")
