local cfg1 = require("config.config-1")
local TRpt = require("lib.TRpt")
local basept = require("lib.base-pt")



local VEH_specs =
{
  ["armoured-draisine"] = {
    name = "Schall-armoured-draisine",
    enable = settings.startup[cfg1.mod_prefix .. "draisine-enable"].value,
    tint = {r=0.7, g=0.7, b=0.7, a=1},
    icon_base = "__base__/graphics/icons/tank.png",
    flags = {
      ["tier"] = true,
    },
    subcat = "fd[armoured-draisine]-",
    item_base = basept.AD.item,
    entity_base = basept.AD.entity,
    mining_time = 1,
    entity_changes = {
      -- inventory_size = 20,  --40,
    },
    base_color = {r = 0.6, g = 0.6, b = 0.6, a = 1},
    base_health = 2000, --1000,
    base_resistances = {
      fire      = { decrease = 15,  percent = 65 },
      physical  = { decrease = 15,  percent = 65 },
      impact    = { decrease = 52,  percent = 80 },
      explosion = { decrease = 17,  percent = 70 },
      acid      = { decrease = 12,  percent = 70 },
      laser     = { decrease =  5,  percent = 20 },
      electric  = { decrease =  5,  percent = 20 }
    },
    weight = 5000,  --20000, Scaled down 1/4 to fit with 2.0 Rocket Capacity
    weight_apply_mul = true,
    base_max_power = 800, --600, --"600kW",
    energy_source = {
      effectivity = 1,
    },
    grid = {
      width_add = 1,
      height_add = 1,
      equipment_categories = {"armor", "vehicle", "armoured-vehicle", "tank", "train", "train-M", "train-H"}
    },
    recipe_specs = {
      [0] = {
        energy_required = 2,
        ingredients =
        {
          {type = "item", name = "Schall-tank-M", amount = 1},
        }
      },
      [1] = {
        energy_required = 10,
        ingredients =
        {
          {type = "item", name = "__VEH__0__", amount = 1},  -- Special string to call for name generation
          {type = "item", name = "processing-unit", amount = 40},
          {type = "item", name = "electric-engine-unit", amount = 20},
        }
      },
      [2] = {
        energy_required = 15,
        ingredients =
        {
          {type = "item", name = "__VEH__1__", amount = 1},
          {type = "item", name = "efficiency-module-2", amount = 25},
          {type = "item", name = "speed-module-2", amount = 25},
        }
      },
      [3] = {
        energy_required = 20,
        ingredients =
        {
          {type = "item", name = "__VEH__2__", amount = 1},
          {type = "item", name = "alien-artifact", amount = 600},
          {type = "item", name = "low-density-structure", amount = 60},
          {type = "item", name = "space-science-pack", amount = 60},
          {type = "item", name = "Schall-vehicle-nuclear-reactor-equipment", amount = 2}
        }
      },
    },
  },
}



local dataextendlist = {}


local tier_max = cfg1.tier_max

for name, spec in pairs(VEH_specs) do
  if spec.enable then
    for tier = 0, tier_max, 1 do
      if cfg1.tier_on[tier] then
        table.insert( dataextendlist, TRpt.VEH_item(spec, tier) )
        table.insert( dataextendlist, TRpt.VEH_entity(spec, tier) )
        table.insert( dataextendlist, TRpt.VEH_recipe(spec, tier) )
        table.insert( dataextendlist, TRpt.VEH_grid(spec, tier) )
        table.insert( dataextendlist, TRpt.VEH_tech(spec, tier) )
      end
    end
  end
end

if next(dataextendlist) ~= nil then
  data:extend(dataextendlist)
end