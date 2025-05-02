local cfg1 = require("config.config-1")
local TRpt = require("lib.TRpt")



local VEH_specs =
{
  ["nuclear-locomotive"] = {
    name = "Schall-nuclear-locomotive",
    enable = settings.startup[cfg1.mod_prefix .. "nuclear-locomotive-enable"].value,
    -- tint = {r=1, g=1, b=1, a=1},
    icon_base = "__base__/graphics/icons/locomotive.png",
    flags = {
      ["nuclear"] = true,
    },
    subcat = "f[nuclear-locomotive]",
    item_base = data.raw["item-with-entity-data"]["locomotive"],
    entity_base = data.raw["locomotive"]["locomotive"],
    mining_time = 1,
    entity_changes = {
      -- inventory_size = 20,  --40,
    },
    base_color = {r = 0.25, g = 1, b = 0.25, a = 0.5},
    base_health = 1000,
    -- base_resistances = {
    --   fire      = { decrease = 15,  percent = 65 },
    --   physical  = { decrease = 15,  percent = 45 },
    --   impact    = { decrease = 52,  percent = 70 },
    --   explosion = { decrease = 17,  percent = 58 },
    --   acid      = { decrease = 12,  percent = 40 },
    --   laser     = { decrease =  5,  percent = 20 },
    --   electric  = { decrease =  5,  percent = 20 }
    -- },
    weight = 3000, --2000,
    weight_apply_mul = false,
    base_max_power = 1800, --"600kW",
    energy_source = {
      effectivity = 1,
    },
    -- grid = {
    --   width_add = -1,
    --   height_add = -1,
    --   equipment_categories = {"armor", "vehicle", "train", "train-M"}
    -- },
    recipe_specs = {
      [0] = {
        energy_required = 20,
        ingredients =
        {
          {type = "item", name = "locomotive", amount = 1},
          {type = "item", name = "Schall-vehicle-nuclear-reactor-equipment", amount = 1}
        }
      },
    },
  },
}



local dataextendlist = {}


local tier = 0

for name, spec in pairs(VEH_specs) do
  if spec.enable then
    table.insert( dataextendlist, TRpt.VEH_item(spec, tier) )
    table.insert( dataextendlist, TRpt.VEH_entity(spec, tier) )
    table.insert( dataextendlist, TRpt.VEH_recipe(spec, tier) )
    -- table.insert( dataextendlist, TRpt.VEH_grid(spec, tier) )
    table.insert( dataextendlist, TRpt.VEH_tech(spec, tier) )
  end
end

if next(dataextendlist) ~= nil then
  data:extend(dataextendlist)
end