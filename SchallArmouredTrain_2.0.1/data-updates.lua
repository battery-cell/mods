local TRlib = require("lib.TRlib")
local cfg1 = require("config.config-1")



local dr = data.raw
local dri = dr["item-with-entity-data"]
local ie_pairs = {
  {item = dri["locomotive"], enty = dr.locomotive["locomotive"]},
  {item = dri["cargo-wagon"], enty = dr["cargo-wagon"]["cargo-wagon"]},
  {item = dri["fluid-wagon"], enty = dr["fluid-wagon"]["fluid-wagon"]},
  {item = dri["artillery-wagon"], enty = dr["artillery-wagon"]["artillery-wagon"]},
}


-- Hide vehicle resistances
local hide_resistances = cfg1.hide_resistances

for _, v in pairs(ie_pairs) do
  if v.item and v.enty then
    if not hide_resistances then
      v.enty["hide_resistances"] = hide_resistances
    end
    v.item.weight = TRlib.suggest_item_weight(v.enty)
  end
end
