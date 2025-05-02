local TRlib = require("__SchallArmouredTrain__.lib.TRlib")
local cfg1 = require("config.config-1")



local TRpt = require("__SchallTankPlatoon__.lib.TPpt")
local TRtech = require("lib.TRtech")


TRpt.subgroup_vehrail = "transport"

if mods["SchallTransportGroup"] then
  TRpt.subgroup_vehrail = "vehicles-railway"
end



function TRpt.VEH_icons(spec, tier)
  local rt = {{ icon = spec.icon_base, tint = spec.tint, icon_size = spec.icon_size or 64, icon_mipmaps = spec.icon_mipmaps or 4 }}
  if spec.flags["armoured"] then table.insert(rt, TRlib.sp_icon_layer["armoured"]) end
  if spec.flags["nuclear"] then table.insert(rt, TRlib.sp_icon_layer["nuclear"]) end
  if spec.flags["tier"] then table.insert(rt, TRlib.tier_icon_layer[tier]) end
  return rt
end

function TRpt.VEH_item(spec, tier)
  local itemname = TRpt.VEH_name(spec.name, tier)
  local item = table.deepcopy(spec.item_base)
  item.name = itemname
  item.icons = TRpt.VEH_icons(spec, tier)
  item.subgroup = TRpt.subgroup_vehrail
  if spec.flags["tier"] then
    item.order = "a[train-system]-" .. spec.subcat .. tier
  else
    item.order = "a[train-system]-" .. spec.subcat
  end
  item.place_result = itemname
  item.weight = TRlib.suggest_item_weight(nil, spec.weight, spec.weight_apply_mul and cfg1.tier_weight_mul[tier])
  -- if spec.grid then
  --   item.equipment_grid = entyname .. "-equipment-grid"
  -- end
  return item
  -- return
  -- {
  --   type = "item-with-entity-data",
  --   name = entyname,
  --   icons = TRpt.VEH_icons(spec, tier),
  --   subgroup = TRpt.subgroup_vehrail,
  --   order = entyorder,
  --   place_result = entyname,
  --   equipment_grid = entyeqpgrid,
  --   stack_size = 5
  -- }
end

function TRpt.VEH_changes_recursive(enty, changes)
  for k,v in pairs(changes) do
    if type(v) == "table" then
      TRpt.VEH_changes_recursive(enty[k], v)
    else
      enty[k] = v
    end
  end
end

function TRpt.VEH_entity(spec, tier)
  local entyname = TRpt.VEH_name(spec.name, tier)
  local enty = table.deepcopy(spec.entity_base)
  enty.hide_resistances = cfg1.hide_resistances
  enty.name = entyname
  enty.icons = TRpt.VEH_icons(spec, tier)
  enty.minable = {mining_time = spec.mining_time, result = entyname}
  enty.max_health = spec.base_health * cfg1.tier_health_mul[tier]
  if spec.base_resistances then
    enty.resistances = TRlib.resistances(spec.base_resistances, cfg1.resistances_add[tier])
  end
  if enty.energy_source then
    if tier >= 3 or spec.flags["nuclear"] then
      enty.energy_source = TRlib.energy_source(enty.energy_source, {"chemical", "nuclear"}, spec.energy_source)
    else
      enty.energy_source = TRlib.energy_source(enty.energy_source, {"chemical"}, spec.energy_source)
    end
    enty.max_power = spec.base_max_power * cfg1.tier_power_mul[tier] .. "kW"
  end
  if spec.weight_apply_mul then
    enty.weight = spec.weight * cfg1.tier_weight_mul[tier]
  else
    enty.weight = spec.weight
  end
  enty.color = spec.base_color
  if spec.grid then
    enty.equipment_grid = entyname .. "-equipment-grid"
  end
  TRpt.VEH_changes_recursive(enty, spec.entity_changes)
  return enty
end

function TRpt.VEH_tech(spec, tier)
  return TRtech.VEH_tech(spec, tier)
end



return TRpt