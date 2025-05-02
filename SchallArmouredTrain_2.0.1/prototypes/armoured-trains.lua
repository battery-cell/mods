local cfg1 = require("config.config-1")
local TRpt = require("lib.TRpt")



local VEH_specs =
{
  ["armoured-locomotive"] = {
    name = "Schall-armoured-locomotive",
    enable = settings.startup[cfg1.mod_prefix .. "locomotive-enable"].value,
    tint = {r=0.7, g=0.7, b=0.7, a=1},
    icon_base = "__base__/graphics/icons/locomotive.png",
    flags = {
      ["armoured"] = true,
      ["tier"] = true,
    },
    subcat = "fa[armoured-locomotive]-",
    item_base = data.raw["item-with-entity-data"]["locomotive"],
    entity_base = data.raw["locomotive"]["locomotive"],
    mining_time = 1,
    entity_changes = {
      -- inventory_size = 20,  --40,
    },
    base_color = {r = 0.5, g = 0.5, b = 0.5, a = 0.5},
    base_health = 1500, --1000,
    base_resistances = {
      fire      = { decrease = 15,  percent = 65 },
      physical  = { decrease = 15,  percent = 45 },
      impact    = { decrease = 52,  percent = 70 },
      explosion = { decrease = 17,  percent = 58 },
      acid      = { decrease = 12,  percent = 40 },
      laser     = { decrease =  5,  percent = 20 },
      electric  = { decrease =  5,  percent = 20 }
    },
    weight = 6000, --2000,
    weight_apply_mul = true,
    base_max_power = 800, --"600kW",
    energy_source = {
      effectivity = 1,
    },
    grid = {
      width_add = -1,
      height_add = -1,
      equipment_categories = {"armor", "vehicle", "armoured-vehicle", "tank", "train", "train-M"}
    },
    recipe_specs = {
      [0] = {
        energy_required = 8,
        ingredients =
        {
          {type = "item", name = "locomotive", amount = 1},
          {type = "item", name = "engine-unit", amount = 10},
          {type = "item", name = "steel-plate", amount = 20},
          {type = "item", name = "advanced-circuit", amount = 8}
        }
      },
      [1] = {
        energy_required = 16,
        ingredients =
        {
          {type = "item", name = "__VEH__0__", amount = 1},  -- Special string to call for name generation
          {type = "item", name = "processing-unit", amount = 35},
          {type = "item", name = "electric-engine-unit", amount = 15}
        }
      },
      [2] = {
        energy_required = 24,
        ingredients =
        {
          {type = "item", name = "__VEH__1__", amount = 1},
          {type = "item", name = "efficiency-module-2", amount = 20},
          {type = "item", name = "speed-module-2", amount = 20}
        }
      },
      [3] = {
        energy_required = 36,
        ingredients =
        {
          {type = "item", name = "__VEH__2__", amount = 1},
          {type = "item", name = "alien-artifact", amount = 450},
          {type = "item", name = "low-density-structure", amount = 45},
          {type = "item", name = "space-science-pack", amount = 45},
          {type = "item", name = "Schall-vehicle-nuclear-reactor-equipment", amount = 2}
        }
      },
    },
  },
  ["armoured-cargo-wagon"] = {
    name = "Schall-armoured-cargo-wagon",
    enable = settings.startup[cfg1.mod_prefix .. "cargo-wagon-enable"].value,
    tint = {r=0.7, g=0.7, b=0.7, a=1},
    icon_base = "__base__/graphics/icons/cargo-wagon.png",
    flags = {
      ["armoured"] = true,
      ["tier"] = true,
    },
    subcat = "ga[armoured-cargo-wagon]-",
    item_base = data.raw["item-with-entity-data"]["cargo-wagon"],
    entity_base = data.raw["cargo-wagon"]["cargo-wagon"],
    mining_time = 1,
    entity_changes = {
      inventory_size = 20,  --40,
    },
    base_color = {r = 0.5, g = 0.5, b = 0.5, a = 0.5},
    base_health = 900, --600,
    base_resistances = {
      fire      = { decrease = 15,  percent = 65 },
      physical  = { decrease = 15,  percent = 45 },
      impact    = { decrease = 52,  percent = 70 },
      explosion = { decrease = 17,  percent = 58 },
      acid      = { decrease = 12,  percent = 40 },
      laser     = { decrease =  5,  percent = 20 },
      electric  = { decrease =  5,  percent = 20 }
    },
    weight = 2000, --1000,
    weight_apply_mul = false,
    grid = {
      width_add = -2,
      height_add = -2,
      equipment_categories = {"armor", "vehicle", "armoured-vehicle", "train"}
    },
    recipe_specs = {
      [0] = {
        energy_required = 4,
        ingredients =
        {
          {type = "item", name = "cargo-wagon", amount = 1},
          {type = "item", name = "engine-unit", amount = 5},
          {type = "item", name = "steel-plate", amount = 10},
          {type = "item", name = "advanced-circuit", amount = 5}
        }
      },
      [1] = {
        energy_required = 8,
        ingredients =
        {
          {type = "item", name = "__VEH__0__", amount = 1},  -- Special string to call for name generation
          {type = "item", name = "processing-unit", amount = 30},
          {type = "item", name = "electric-engine-unit", amount = 10}
        }
      },
      [2] = {
        energy_required = 12,
        ingredients =
        {
          {type = "item", name = "__VEH__1__", amount = 1},
          {type = "item", name = "efficiency-module-2", amount = 16},
          {type = "item", name = "speed-module-2", amount = 16}
        }
      },
      [3] = {
        energy_required = 16,
        ingredients =
        {
          {type = "item", name = "__VEH__2__", amount = 1},
          {type = "item", name = "alien-artifact", amount = 300},
          {type = "item", name = "low-density-structure", amount = 30},
          {type = "item", name = "space-science-pack", amount = 30}
        }
      },
    },
  },
  ["armoured-fluid-wagon"] = {
    name = "Schall-armoured-fluid-wagon",
    enable = settings.startup[cfg1.mod_prefix .. "fluid-wagon-enable"].value,
    tint = {r=0.7, g=0.7, b=0.7, a=1},
    icon_base = "__base__/graphics/icons/fluid-wagon.png",
    flags = {
      ["armoured"] = true,
      ["tier"] = true,
    },
    subcat = "ha[armoured-fluid-wagon]-",
    item_base = data.raw["item-with-entity-data"]["fluid-wagon"],
    entity_base = data.raw["fluid-wagon"]["fluid-wagon"],
    mining_time = 1,
    entity_changes = {
      capacity = 10000, --25000,
    },
    base_color = {r = 0.5, g = 0.5, b = 0.5, a = 0.5},
    base_health = 900, --600,
    base_resistances = {
      fire      = { decrease = 15,  percent = 65 },
      physical  = { decrease = 15,  percent = 45 },
      impact    = { decrease = 52,  percent = 70 },
      explosion = { decrease = 17,  percent = 58 },
      acid      = { decrease = 12,  percent = 40 },
      laser     = { decrease =  5,  percent = 20 },
      electric  = { decrease =  5,  percent = 20 }
    },
    weight = 2000, --1000,
    weight_apply_mul = false,
    grid = {
      width_add = -2,
      height_add = -2,
      equipment_categories = {"armor", "vehicle", "armoured-vehicle", "train"}
    },
    recipe_specs = {
      [0] = {
        energy_required = 6,
        ingredients =
        {
          {type = "item", name = "fluid-wagon", amount = 1},
          {type = "item", name = "engine-unit", amount = 5},
          {type = "item", name = "steel-plate", amount = 10},
          {type = "item", name = "advanced-circuit", amount = 5}
        }
      },
      [1] = {
        energy_required = 12,
        ingredients =
        {
          {type = "item", name = "__VEH__0__", amount = 1},  -- Special string to call for name generation
          {type = "item", name = "processing-unit", amount = 30},
          {type = "item", name = "electric-engine-unit", amount = 10}
        }
      },
      [2] = {
        energy_required = 18,
        ingredients =
        {
          {type = "item", name = "__VEH__1__", amount = 1},
          {type = "item", name = "efficiency-module-2", amount = 16},
          {type = "item", name = "speed-module-2", amount = 16}
        }
      },
      [3] = {
        energy_required = 24,
        ingredients =
        {
          {type = "item", name = "__VEH__2__", amount = 1},
          {type = "item", name = "alien-artifact", amount = 300},
          {type = "item", name = "low-density-structure", amount = 30},
          {type = "item", name = "space-science-pack", amount = 30}
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