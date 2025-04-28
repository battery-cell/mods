local data_util = require("data-util")
local sounds = require("__base__.prototypes.entity.sounds")

local capacity_progressions = { -- wood, iron, steel, strongbox, storehouse, warehouse
  ["Smooth"] = {10, 30, 40, 100, 250, 500},
  ["Legacy"] = {16, 32, 50, 100, 250, 500},
  ["Vanilla"] = {16, 32, 48, 96, 256, 512},
  ["Low"] = {10, 15, 20, 80, 100, 400},
  ["Med"] = {10, 20, 30, 120, 300, 600},
  ["High"] = {20, 40, 50, 200, 500, 1000},
  ["CDLow"] = {10, 12, 15, 60, 240, 540},
  ["CDMed"] = {10, 15, 20, 80, 320, 720},
  ["CDHigh"] = {10, 20, 30, 120, 480, 1080},
  ["CDExtreme"] = {20, 40, 50, 200, 800, 1800},
}
local capacity_progression = capacity_progressions[settings.startup["aai-containers-progression"].value]

data.raw.container["wooden-chest"].inventory_size = capacity_progression[1]
data.raw.container["iron-chest"].inventory_size = capacity_progression[2]

local construction_robotics_tech = data.raw.technology["construction-robotics"]
local storage_techs_ingredients
if construction_robotics_tech then
  storage_techs_ingredients = construction_robotics_tech.unit.ingredients
else -- If a mod removed this tech somehow...
  storage_techs_ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
  }
end

local logistic_system_tech = data.raw.technology["logistic-system"]
local logistic_techs_ingredients
if logistic_system_tech then
  logistic_techs_ingredients = logistic_system_tech.unit.ingredients
else -- If a mod removed this tech somehow...
  logistic_techs_ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"utility-science-pack", 1},
  }
end

local surface_conditions = data.raw.container["steel-chest"].surface_conditions

data:extend({
  {
    type = "item-subgroup",
    name = "container-1",
    group = "logistics",
    order = "a1[container-1]"
  },
  {
    type = "item-subgroup",
    name = "container-2",
    group = "logistics",
    order = "a2[container-2]"
  },
  {
    type = "item-subgroup",
    name = "container-4",
    group = "logistics",
    order = "a4[container-4]"
  },
  {
    type = "item-subgroup",
    name = "container-6",
    group = "logistics",
    order = "a6[container-6]"
  },
})

data.raw.item["wooden-chest"].subgroup = "container-1"
data.raw.item["iron-chest"].subgroup = "container-1"
data.raw.item["iron-chest"].order = "y[items]-a[wooden-chest]"
data.raw.item["wooden-chest"].order = "z[items]-a[wooden-chest]"

local explosion_small = {
  {
    animation_speed = 0.5,
    filename = "__base__/graphics/entity/small-explosion/small-explosion-1.png",
    frame_count = 24,
    width = 88,
    height = 178,
    shift = {-0.03125,-0.75},
    scale = 0.5,
    line_length = 6,
    priority = "high",
  },
  {
    animation_speed = 0.5,
    filename = "__base__/graphics/entity/small-explosion/small-explosion-2.png",
    frame_count = 24,
    width = 92,
    height = 152,
    shift = {0.0625,-0.234375},
    scale = 0.5,
    line_length = 6,
    priority = "high",
  }
}

local explosion_medium = {
  {
    animation_speed = 0.5,
    filename = "__base__/graphics/entity/medium-explosion/medium-explosion-1.png",
    frame_count = 30,
    width = 124,
    height = 224,
    shift = {-0.03125,-1.125},
    scale = 0.5,
    line_length = 6,
    priority = "high",
  },
  {
    animation_speed = 0.5,
    filename = "__base__/graphics/entity/medium-explosion/medium-explosion-2.png",
    frame_count = 41,
    width = 154,
    height = 212,
    shift = {-0.40625,-1.0625},
    scale = 0.5,
    line_length = 6,
    priority = "high",
  },
  {
    animation_speed = 0.5,
    filename = "__base__/graphics/entity/medium-explosion/medium-explosion-3.png",
    frame_count = 39,
    width = 126,
    height = 236,
    shift = {0.015625,-1.15625},
    scale = 0.5,
    line_length = 6,
    priority = "high",
  }
}

local tint_passive = {r=220,g=61,b=65}
local tint_active = {r=160,g=64,b=180}
local tint_storage = {r=230,g=180,b=66}
local tint_buffer = {r=70,g=200,b=70}
local tint_requester = {r=80,g=160,b=220}
--[[
Strong Chest
Strongbox
Storehouse
Warehouse
]]
local variants = {
  base = {tint = nil, order = "a", size_1_override = "steel-chest",
    particle_small = "steel-chest-metal-particle-small", particle_medium = "steel-chest-metal-particle-small", particle_large = "heat-exchanger-metal-particle-big"},
  passive = {tint = tint_passive, order = "b", container_type = "passive-provider", logistic_mode = "passive-provider",
    particle_small = "passive-provider-chest-metal-particle-small", particle_medium = "passive-provider-chest-metal-particle-medium", particle_large = "heat-exchanger-metal-particle-big"},
  active = {tint = tint_active, order = "c", container_type = "active-provider", logistic_mode = "active-provider",
    particle_small = "passive-provider-chest-metal-particle-small", particle_medium = "passive-provider-chest-metal-particle-medium", particle_large = "heat-exchanger-metal-particle-big"},
  storage = {tint = tint_storage, order = "d", container_type = "storage", logistic_mode = "storage", max_logistic_slots = 1,
    particle_small = "storage-chest-metal-particle-small", particle_medium = "storage-chest-metal-particle-medium", particle_large = "heat-exchanger-metal-particle-big"},
  buffer = {tint = tint_buffer, order = "e", container_type = "buffer", logistic_mode = "buffer", --max_logistic_slots = 30,
    particle_small = "buffer-chest-metal-particle-small", particle_medium = "buffer-chest-metal-particle-medium", particle_large = "heat-exchanger-metal-particle-big"},
  requester = {tint = tint_requester, order = "f", container_type = "requester", logistic_mode = "requester", --max_logistic_slots = 30,
    particle_small = "requester-chest-metal-particle-small", particle_medium = "requester-chest-metal-particle-medium", particle_large = "heat-exchanger-metal-particle-big"},
}




local sizes = {
  [1] = {name = "chest", inventory_size = capacity_progression[3], max_health = 350, mining_time = 0.1, stack_size = data.raw.item["steel-chest"].stack_size,
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}}, selection_box = {{-0.5, -0.5}, {0.5, 0.5}}, fast_replaceable_group = "container",
    ingredients_base = {{type = "item", name = "steel-plate", amount = 8}}, ingredients =
    {
      {type = "item", name = "steel-chest", amount = 1},
      {type = "item", name = "electronic-circuit", amount = 3},
      {type = "item", name = "advanced-circuit", amount = 1}
    },
    base = {width=64,height=74, shift={0,-2/32}}, doors = {width=60/2, height=80/4, shift={1/32,-13/32}}, shadow = {width=102, height=50, shift={10/32,4/32}},
    circuit_wire_connection_point = {
      points = {
        wire = {green = {13/32,-11/32}, red = {13/32,-14/32}},
        shadow = {green = {31/32,4/32}, red = {31/32,1/32}}
      }
    },
    icon_draw_specification = {shift = {0, 0}, scale = 0.6, scale_for_many = .8, render_layer = "entity-info-icon"},
    rocket_cap = 50,
  },
  [2] = {name = "aai-strongbox", inventory_size = capacity_progression[4], max_health = 700, mining_time = 0.2, stack_size = 40,
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}}, selection_box = {{-1, -1}, {1, 1}}, fast_replaceable_group = "strongbox",
    ingredients_base = {{type = "item", name = "steel-plate", amount = 24}}, ingredients =
    {
      {type = "item", name = "aai-strongbox", amount = 1},
      {type = "item", name = "electronic-circuit", amount = 4},
      {type = "item", name = "advanced-circuit", amount = 4}
    },
    base = {width=130,height=130}, doors = {width=76/2, height=104/4, shift={0,-14/32}}, shadow = {width=150, height=86, shift={12/32,11/32}},
    circuit_wire_connection_point = {
      points = {
        wire = {green = {24/32,-13/32}, red = {24/32,-16/32}},
        shadow = {green = {46/32,8/32}, red = {46/32,5/32}}
      }
    },
    icon_draw_specification = {shift = {0, 0}, scale = 0.7, scale_for_many = 1, render_layer = "entity-info-icon"},
    rocket_cap = 20,
  },
  [4] = {name = "aai-storehouse", inventory_size = capacity_progression[5], max_health = 1500, mining_time = 0.3, stack_size = 30,
    collision_box = {{-1.8, -1.8}, {1.8, 1.8}}, selection_box = {{-2, -2}, {2, 2}}, fast_replaceable_group = "storehouse",
    ingredients_base = {{type = "item", name = "steel-plate", amount = 100}, {type = "item", name = "concrete", amount = 50}}, ingredients =
    {
      {type = "item", name = "aai-storehouse", amount = 1},
      {type = "item", name = "electronic-circuit", amount = 10},
      {type = "item", name = "advanced-circuit", amount = 10}
    },
    base = {width=260,height=260}, doors = {width=156/2, height=232/4, shift={0,-27/32}}, shadow = {width=308, height=176, shift={28/32,21/32}},
    circuit_wire_connection_point = {
      points = {
        wire = {green = {46/32,-26/32}, red = {46/32,-30/32}},
        shadow = {green = {97/32,22/32}, red = {97/32,18/32}}
      }
    },
    icon_draw_specification = {shift = {0, 0}, scale = 1, scale_for_many = 1/.7, render_layer = "entity-info-icon"},
    rocket_cap = 10,
  },
  [6] = {name = "aai-warehouse", inventory_size = capacity_progression[6], max_health = 2500, mining_time = 0.4, stack_size = 20,
    collision_box = {{-2.8, -2.8}, {2.8, 2.8}}, selection_box = {{-3, -3}, {3, 3}}, fast_replaceable_group = "warehouse",
    ingredients_base = {{type = "item", name = "steel-plate", amount = 200}, {type = "item", name = "concrete", amount = 100}}, ingredients =
    {
      {type = "item", name = "aai-warehouse", amount = 1},
      {type = "item", name = "electronic-circuit", amount = 20},
      {type = "item", name = "advanced-circuit", amount = 20}
    },
    base = {width=384,height=384}, doors = {width=256/2, height=320/4, shift={0/32,-43/32}}, shadow = {width=464, height=260, shift={42/32,31/32}},
    circuit_wire_connection_point = {
      points = {
        wire = {green = {73/32,-35/32}, red = {73/32,-44/32}},
        shadow = {green = {149/32,32/32}, red = {149/32,25/32}}
      }
    },
    icon_draw_specification = {shift = {0, 0}, scale = 1, scale_for_many = 1/.7, render_layer = "entity-info-icon"},
    rocket_cap = 4,
  },
}

for s, size in pairs(sizes) do
  for v, variant in pairs(variants) do
    local name = size.name
    if s == 1 then
      if variant.size_1_override then
        name = variant.size_1_override
      else
        name = variant.container_type .. "-" .. name
      end
    elseif variant.container_type then
      name = name.."-"..variant.container_type
    end
    local icons = {
      {icon = "__aai-containers__/graphics/icons/container-"..s.."-base.png", icon_size = 64},
      variant.tint and {icon = "__aai-containers__/graphics/icons/container-"..s.."-mask.png", icon_size = 64, tint = variant.tint} or nil
    }
    if settings.startup["aai-containers-number-icons"].value then
      local width_string = tostring(s)
      for i = 1, #width_string do
        local c = width_string:sub(i,i)
        table.insert(icons, { icon = "__aai-containers__/graphics/icons/number/"..c..".png", scale = 0.5, shift = {-10+(i-1)*5, -10}, icon_size = 20 } )
      end
    end
    data:extend{
      {
        type = "item",
        name = name,
        icons = icons,
        subgroup = "container-"..s,
        order = "b[storage]-"..s.."-"..variant.order.."["..name.."]",
        place_result = name,
        stack_size = size.stack_size,
        pick_sound = "__base__/sound/item/metal-chest-inventory-pickup.ogg",
        drop_sound = "__base__/sound/item/metal-chest-inventory-move.ogg",
        inventory_move_sound = "__base__/sound/item/metal-chest-inventory-move.ogg",
        weight = 1000000/size.rocket_cap,
      },
      {
        type = "recipe",
        name = name,
        enabled = false,
        ingredients = v == "base" and size.ingredients_base or size.ingredients,
    		energy_required = s,
        results = {{type = "item", name = name, amount = 1}}
      },
      v == "base" and {
        type = "container",
        name = name,
        icons = icons,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = size.mining_time, result = name},
        surface_conditions = surface_conditions,
        max_health = size.max_health,
        corpse = name.."-remnants",
        dying_explosion = name.."-explosion",
        open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.43 },
        close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.43 },
        icon_draw_specification = size.icon_draw_specification,
        resistances =
        {
          {
            type = "fire",
            percent = 90
          },
          {
            type = "impact",
            percent = 60
          }
        },
        se_allow_in_space = true,
        collision_box = size.collision_box,
        selection_box = size.selection_box,
        damaged_trigger_effect = {
          entity_name = "spark-explosion",
          offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
          offsets = { { 0, 1 } },
          type = "create-entity"
        },
        fast_replaceable_group = size.fast_replaceable_group,
        inventory_size = size.inventory_size,
        vehicle_impact_sound = table.deepcopy(data.raw.container["steel-chest"].vehicle_impact_sound),
        picture =
        {
          layers =
          {
            {
              filename = "__aai-containers__/graphics/entity/container-"..s.."/base.png",
              width = size.base.width,
              height = size.base.height,
              shift = size.base.shift,
              scale = .5,
            },
            {
              draw_as_shadow = true,
              filename = "__aai-containers__/graphics/entity/container-"..s.."/shadow.png",
              width = size.shadow.width,
              height = size.shadow.height,
              shift = size.shadow.shift,
              scale = .5,
            },
          }
        },
        --circuit_wire_connection_point = size.circuit_wire_connection_point,
        circuit_connector = size.circuit_wire_connection_point,
        circuit_wire_max_distance = default_circuit_wire_max_distance,
        scale_info_icons = settings.startup["aai-containers-scale-icons"].value
      } or {
        type = "logistic-container",
        name = name,
        icons = icons,
        flags = {"placeable-player", "player-creation"},
        minable = {mining_time = size.mining_time, result = name},
        surface_conditions = surface_conditions,
        max_health = size.max_health,
        corpse = name.."-remnants",
        dying_explosion = name.."-explosion",
        se_allow_in_space = true,
        collision_box = size.collision_box,
        selection_box = size.selection_box,
        damaged_trigger_effect = {
          entity_name = "spark-explosion",
          offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
          offsets = { { 0, 1 } },
          type = "create-entity"
        },
        resistances =
        {
          {
            type = "fire",
            percent = 90
          },
          {
            type = "impact",
            percent = 60
          }
        },
        fast_replaceable_group = size.fast_replaceable_group,
        inventory_size = size.inventory_size,
        trash_inventory_size = (v == "buffer" or v == "requester") and 20 or 0,
        logistic_mode = variant.logistic_mode,
        max_logistic_slots = variant.max_logistic_slots,
        open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.43 },
        close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.43 },
        animation_sound = table.deepcopy(data.raw["logistic-container"]["passive-provider-chest"].animation_sound),
        vehicle_impact_sound = table.deepcopy(data.raw.container["steel-chest"].vehicle_impact_sound),
        opened_duration = 8,
        icon_draw_specification = size.icon_draw_specification,
        animation =
        {
          layers =
          {
            {
              filename = "__aai-containers__/graphics/entity/container-"..s.."/base.png",
              width = size.base.width,
              height = size.base.height,
              shift = size.base.shift,
              repeat_count = 8,
              scale = .5,
            },
            {
              filename = "__aai-containers__/graphics/entity/container-"..s.."/doors.png",
              width = size.doors.width,
              height = size.doors.height,
              shift = size.doors.shift,
              frame_count = 8,
              line_length = 2,
              scale = .5,
            },
            {
              filename = "__aai-containers__/graphics/entity/container-"..s.."/mask.png",
              width = size.base.width,
              height = size.base.height,
              shift = size.base.shift,
              repeat_count = 8,
              tint = variant.tint,
              scale = .5,
            },
            {
              draw_as_shadow = true,
              filename = "__aai-containers__/graphics/entity/container-"..s.."/shadow.png",
              width = size.shadow.width,
              height = size.shadow.height,
              shift = size.shadow.shift,
              repeat_count = 8,
              scale = .5,
            },
          }
        },
        --circuit_wire_connection_point = size.circuit_wire_connection_point,
        circuit_connector = size.circuit_wire_connection_point,
        circuit_wire_max_distance = default_circuit_wire_max_distance,
        scale_info_icons = settings.startup["aai-containers-scale-icons"].value
      },
      {
        type = "corpse",
        name = name.."-remnants",
        localised_name = {"remnant-name", {"entity-name."..name}},
        icons = icons,
        flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
        subgroup = "storage-remnants",
        order = "b[storage]-"..s.."-"..variant.order.."["..name.."]",
        selection_box = size.selection_box,
        tile_width = s,
        tile_height = s,
        selectable_in_game = false,
        time_before_removed = 60 * 60 * 15, -- 15 minutes
        final_render_layer = "remnants",
        remove_on_tile_placement = false,
        animation =
        {
          layers =
          {
            {
              filename = "__aai-containers__/graphics/entity/container-"..s.."/base-remnants.png",
              width = size.base.width,
              height = size.base.height,
              shift = size.base.shift,
              direction_count = 1,
              scale = .5,
            },
            {
              draw_as_shadow = true,
              filename = "__aai-containers__/graphics/entity/container-"..s.."/shadow.png",
              width = size.shadow.width,
              height = size.shadow.height,
              shift = size.shadow.shift,
              direction_count = 1,
              scale = .5,
            },
            variant.tint and {
              filename = "__aai-containers__/graphics/entity/container-"..s.."/mask-remnants.png",
              width = size.base.width,
              height = size.base.height,
              shift = size.base.shift,
              direction_count = 1,
              tint = variant.tint,
              scale = .5,
            } or nil,
          }
        },
      },
      {
        type = "explosion",
        name = name.."-explosion",
        icons = icons,
        flags = {"not-on-map"},
        subgroup = "storage-explosions",
        order = "b[storage]-"..s.."-"..variant.order.."["..name.."]",
        height = 0,
        animations = s > 2 and explosion_medium or explosion_small,
        light = {
          color = {b = 1,g = 1,r = 1},
          intensity = 1,
          size = 20
        },
        smoke = "smoke-fast",
        smoke_count = 2,
        smoke_slow_down_factor = 1,
        -- sound = s == 1 and sounds.small_explosion(0.5) or (s == 2 and sounds.medium_explosion(0.5) or sounds.large_explosion(0.8)),
        created_effect =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-particle",
                repeat_count = 15 + 5 * s,
                particle_name = variant.particle_small,
                offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
                initial_height = 0.5,
                initial_height_deviation = 0.44,
                initial_vertical_speed = 0.069,
                initial_vertical_speed_deviation = 0.05,
                speed_from_center = 0.02,
                speed_from_center_deviation = 0.046
              },
              {
                type = "create-particle",
                repeat_count = 15 + 5 * s,
                particle_name = variant.particle_medium,
                offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
                initial_height = 0.5,
                initial_height_deviation = 0.5,
                initial_vertical_speed = 0.06,
                initial_vertical_speed_deviation = 0.05,
                speed_from_center = 0.04,
                speed_from_center_deviation = 0.05
              },
              s > 2 and {
                type = "create-particle",
                repeat_count = 5 + 5 * s,
                particle_name = variant.particle_large,
                offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
                initial_height = 0.2,
                initial_height_deviation = 0.49,
                initial_vertical_speed = 0.08,
                initial_vertical_speed_deviation = 0.05,
                speed_from_center = 0.04,
                speed_from_center_deviation = 0.05
              } or nil,
            },
          }
        }
      },
    }
  end
end

data:extend({
  {
    type = "technology",
    name = "aai-strongbox-base",
    icons = { { icon = "__aai-containers__/graphics/technology/container-2-base.png", icon_size = 128 } },
    order = "a",
    prerequisites = {"steel-processing", "logistic-science-pack"},
    unit = {
      count = 100,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 30
    },
    effects = { { type = "unlock-recipe", recipe = "aai-strongbox" } },
  },
  {
    type = "technology",
    name = "aai-strongbox-storage",
    icons = {
      { icon = "__aai-containers__/graphics/technology/container-2-base.png", icon_size = 128 },
      { icon = "__aai-containers__/graphics/technology/container-2-mask.png", icon_size = 128, tint = tint_storage }
    },
    order = "a",
    prerequisites = {"aai-strongbox-base", "logistic-robotics"},
    unit = {
      count = 100,
      ingredients = storage_techs_ingredients,
      time = 30
    },
    effects = {
      { type = "unlock-recipe", recipe = "aai-strongbox-storage" },
      { type = "unlock-recipe", recipe = "aai-strongbox-passive-provider" }
    },
  },
  {
    type = "technology",
    name = "aai-strongbox-logistic",
    icons = {
      { icon = "__aai-containers__/graphics/technology/container-2-base.png", icon_size = 128 },
      { icon = "__aai-containers__/graphics/technology/container-2-mask.png", icon_size = 128, tint = tint_requester }
    },
    order = "a",
    prerequisites = {"aai-strongbox-storage", "logistic-system"},
    unit = {
      count = 100,
      ingredients = logistic_techs_ingredients,
      time = 30
    },
    effects = {
      { type = "unlock-recipe", recipe = "aai-strongbox-buffer" },
      { type = "unlock-recipe", recipe = "aai-strongbox-requester" },
      { type = "unlock-recipe", recipe = "aai-strongbox-active-provider" }
    },
  },
  {
    type = "technology",
    name = "aai-storehouse-base",
    icons = { { icon = "__aai-containers__/graphics/technology/container-4-base.png", icon_size = 128 } },
    order = "a",
    prerequisites = {"aai-strongbox-base", "concrete"},
    unit = {
      count = 200,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 30
    },
    effects = { { type = "unlock-recipe", recipe = "aai-storehouse" } },
  },
  {
    type = "technology",
    name = "aai-storehouse-storage",
    icons = {
      { icon = "__aai-containers__/graphics/technology/container-4-base.png", icon_size = 128 },
      { icon = "__aai-containers__/graphics/technology/container-4-mask.png", icon_size = 128, tint = tint_storage }
    },
    order = "a",
    prerequisites = {"aai-storehouse-base", "aai-strongbox-storage"},
    unit = {
      count = 200,
      ingredients = storage_techs_ingredients,
      time = 30
    },
    effects = {
      { type = "unlock-recipe", recipe = "aai-storehouse-storage" },
      { type = "unlock-recipe", recipe = "aai-storehouse-passive-provider" }
    },
  },
  {
    type = "technology",
    name = "aai-storehouse-logistic",
    icons = {
      { icon = "__aai-containers__/graphics/technology/container-4-base.png", icon_size = 128 },
      { icon = "__aai-containers__/graphics/technology/container-4-mask.png", icon_size = 128, tint = tint_requester }
    },
    order = "a",
    prerequisites = {"aai-storehouse-storage", "aai-strongbox-logistic"},
    unit = {
      count = 200,
      ingredients = logistic_techs_ingredients,
      time = 30
    },
    effects = {
      { type = "unlock-recipe", recipe = "aai-storehouse-buffer" },
      { type = "unlock-recipe", recipe = "aai-storehouse-requester" },
      { type = "unlock-recipe", recipe = "aai-storehouse-active-provider" }
    },
  },
  {
    type = "technology",
    name = "aai-warehouse-base",
    icons = { { icon = "__aai-containers__/graphics/technology/container-6-base.png", icon_size = 128 } },
    order = "a",
    prerequisites = {"aai-storehouse-base"},
    unit = {
      count = 400,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 30
    },
    effects = { { type = "unlock-recipe", recipe = "aai-warehouse" } },
  },
  {
    type = "technology",
    name = "aai-warehouse-storage",
    icons = {
      { icon = "__aai-containers__/graphics/technology/container-6-base.png", icon_size = 128 },
      { icon = "__aai-containers__/graphics/technology/container-6-mask.png", icon_size = 128, tint = tint_storage }
    },
    order = "a",
    prerequisites = {"aai-warehouse-base", "aai-storehouse-storage"},
    unit = {
      count = 400,
      ingredients = storage_techs_ingredients,
      time = 30
    },
    effects = {
      { type = "unlock-recipe", recipe = "aai-warehouse-storage" },
      { type = "unlock-recipe", recipe = "aai-warehouse-passive-provider" }
    },
  },
  {
    type = "technology",
    name = "aai-warehouse-logistic",
    icons = {
      { icon = "__aai-containers__/graphics/technology/container-6-base.png", icon_size = 128 },
      { icon = "__aai-containers__/graphics/technology/container-6-mask.png", icon_size = 128, tint = tint_requester }
    },
    order = "a",
    prerequisites = {"aai-warehouse-storage", "aai-storehouse-logistic"},
    unit = {
      count = 400,
      ingredients = logistic_techs_ingredients,
      time = 30
    },
    effects = {
      { type = "unlock-recipe", recipe = "aai-warehouse-buffer" },
      { type = "unlock-recipe", recipe = "aai-warehouse-requester" },
      { type = "unlock-recipe", recipe = "aai-warehouse-active-provider" }
    },
  },
})
