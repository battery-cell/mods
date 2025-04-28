local sounds = require("__base__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

-- Base locomotives have shift of -0.5 (16/32)
-- Base sloped locomotives have shift of -0.14 (4.5/32)
-- Mini locomotives have shift of -0.75 (24/32)
-- Mini sloped locomotives should therefore have shift of -0.39? (12.5/32)
local cab_shift = {0, -0.75}
local default_color = {r = 0.87, g = 0.84, b = 0.16, a = 0.5}

local simulations = {}
simulations.factoriopedia_mini_locomotive =
{
  init =
  [[
    game.simulation.camera_position = {1, 0.5}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqN011uwyAMAOC7+JlWgybtkqtUU0RSL7UGpgKarYpy95Gk+5G6STxi7A+M8AitueLFE0eoR6DOcYD6OEKgnrWZY6wtQg1ek4FJAPEJP6CW04sA5EiRcK1YFreGr7ZFnxLEV2WIqbY/x81CCLi4kKocz3iSNqWAW8ovE34ij926V0ziwVTZ5i7b3GWbMtssvk1LTBvjOmddpAEfVbmV6tcDIOvWYGNcTyFSF5r3M6W1dQNxD/WrNgEFOE/pRL0yT1tV/nGHMrev/Lb2uWT+6x9yyfxP8pxLHv4h08cO0XVvTRoGXsP3mZij9wyKaNMRP9MjYEAfFqLcq6qoqrKQhVJSTtMn+cQifA==",
      position = {0, 0}
    }
  ]]
}
simulations.factoriopedia_mini_cargo_wagon =
{
  init =
  [[
    game.simulation.camera_position = {1, 0.5}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqN09tuwyAMANB/8TOpRi7tml+ZpoikjFojpgKSrory73OS7iJ1k3jE2IerJ2jtoC8eKUI9AXaOAtQvEwQ0pOwSI9VrqMErtDALQDrpD6jl/CpAU8SIeqtYB7eGhr7VnhPEV2WIXGvOMVsJARcXuMrRgrOUVQJunF8xfkKvu22unMWDmSebRbJZJJsy2Sy/zR4Js05547KrMpz/wMpdIfNfV6BJtVY31hkMEbvQXM/I496NSAbqN2WDFuA88ppqc552C4A0csh5hmiw9o9tValHTT/pPpVMf5BDKpn+b55TycM/JP/1EF333nB/0Ba+t8kSvWdg1D0v8dNQAkbtw0pU+/xYHo9VKcs8l3KePwEfASkW",
      position = {0, 0}
    }
  ]]
}
simulations.factoriopedia_mini_fluid_wagon =
{
  init =
  [[
    game.simulation.camera_position = {1, 0.5}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqN0+9ugyAQAPB3uc/YDJR2+irNYlCpvQyPBrBdY3z3oXZ/km4JHznufnCEm6Axo744pADVBNha8lAdJ/DYkzJLjNSgoQKn0MDMAKnTH1Dx+Y2BpoAB9VaxLu41jUOjXUxgX5U+xNr+HLKVYHCxPlZZWvAoZZLBPebLiHfodLvtFTN7MkWymSebebLJk83i2xyQMDuZEbvspvqY/8TyXc7FryfQpBqja2N79AFbX9/OGNeDvSL1UJ2U8ZqBdRjPVJvzshPyj1vI1M7SG9unkunvf0gl07/Jayp5+IeMX9sH277XcRxoCz+mYok+MjDoIR7xMz8Mrtr5lZB7URZlKQteCMH5PH8CjK4iyw==",
      position = {0, 0}
    }
  ]]
}


local drive_over_tie = function()
  return
  {
    type = "play-sound",
    sound = sound_variations("__base__/sound/train-tie", 6, 0.4,
      {volume_multiplier("main-menu", 2.4), volume_multiplier("driving", 1.3)})
  }
end

local locomotive_reflection = function()
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/locomotive/reflection/locomotive-reflection.png",
      priority = "extra-high",
      width = 20,
      height = 52,
      shift = util.by_pixel(0, 40),
      variation_count = 1,
      scale = 5
    },
    rotate = true,
    orientation_to_variation = false
  }
end

local train_graphics = function()
  return
  {
    priority = "very-low",
    dice = 4,
    width = 808 / 4,
    height = 1504 / 8,
    direction_count = 256,
    filenames =
    {
      "__Mini_Trains__/data/locomotive/hr-traintest1.png",
      "__Mini_Trains__/data/locomotive/hr-traintest2.png",
      "__Mini_Trains__/data/locomotive/hr-traintest3.png",
      "__Mini_Trains__/data/locomotive/hr-traintest4.png",
      "__Mini_Trains__/data/locomotive/hr-traintest5.png",
      "__Mini_Trains__/data/locomotive/hr-traintest6.png",
      "__Mini_Trains__/data/locomotive/hr-traintest7.png",
      "__Mini_Trains__/data/locomotive/hr-traintest8.png"
    },
    line_length = 4,
    lines_per_file = 8,
    shift = cab_shift,
    scale = 0.5
  }
end

local train_glow = function()
  return
  {
    priority = "very-low",
    dice = 4,
    width = 808 / 4,
    height = 1504 / 8,
    direction_count = 256,
    filenames =
    {
      "__Mini_Trains__/data/locomotive/hr-trainglow1.png",
      "__Mini_Trains__/data/locomotive/hr-trainglow2.png",
      "__Mini_Trains__/data/locomotive/hr-trainglow3.png",
      "__Mini_Trains__/data/locomotive/hr-trainglow4.png",
      "__Mini_Trains__/data/locomotive/hr-trainglow5.png",
      "__Mini_Trains__/data/locomotive/hr-trainglow6.png",
      "__Mini_Trains__/data/locomotive/hr-trainglow7.png",
      "__Mini_Trains__/data/locomotive/hr-trainglow8.png"
    },
    line_length = 4,
    lines_per_file = 8,
    shift = cab_shift,
    scale = 0.5,
    blend_mode = "additive",
    draw_as_glow = true,
  }
end

local train_shadow = function()
  return
  {
    priority = "very-low",
    dice = 4,
    width = 1008 / 4,
    height = 1504 / 8,
    direction_count = 256,
    filenames =
    {
      "__Mini_Trains__/data/locomotive/hr-trainsh1.png",
      "__Mini_Trains__/data/locomotive/hr-trainsh2.png",
      "__Mini_Trains__/data/locomotive/hr-trainsh3.png",
      "__Mini_Trains__/data/locomotive/hr-trainsh4.png",
      "__Mini_Trains__/data/locomotive/hr-trainsh5.png",
      "__Mini_Trains__/data/locomotive/hr-trainsh6.png",
      "__Mini_Trains__/data/locomotive/hr-trainsh7.png",
      "__Mini_Trains__/data/locomotive/hr-trainsh8.png"
    },
    line_length = 4,
    lines_per_file = 8,
    shift = {1, -0.4},
    scale = 0.5,
    draw_as_shadow = true
  }
end

local train_mask = function()
  return
  {
    priority = "very-low",
    dice = 4,
    width = 808 / 4,
    height = 1504 / 8,
    direction_count = 256,
    flags = {"mask"},
    filenames =
    {
      "__Mini_Trains__/data/locomotive/hr-trainmsk1.png",
      "__Mini_Trains__/data/locomotive/hr-trainmsk2.png",
      "__Mini_Trains__/data/locomotive/hr-trainmsk3.png",
      "__Mini_Trains__/data/locomotive/hr-trainmsk4.png",
      "__Mini_Trains__/data/locomotive/hr-trainmsk5.png",
      "__Mini_Trains__/data/locomotive/hr-trainmsk6.png",
      "__Mini_Trains__/data/locomotive/hr-trainmsk7.png",
      "__Mini_Trains__/data/locomotive/hr-trainmsk8.png"
    },
    line_length = 4,
    lines_per_file = 8,
    shift = cab_shift,
    scale = 0.5,
    apply_runtime_tint = true,
    --tint = { 0, 1, 0, 0.5 },
  }
end

local train_lights = function()
  return
  {
    priority = "very-low",
    dice = 4,
    width = 808 / 4,
    height = 1504 / 8,
    direction_count = 256,
    filenames =
    {
      "__Mini_Trains__/data/locomotive/hr-trainlight1.png",
      "__Mini_Trains__/data/locomotive/hr-trainlight2.png",
      "__Mini_Trains__/data/locomotive/hr-trainlight3.png",
      "__Mini_Trains__/data/locomotive/hr-trainlight4.png",
      "__Mini_Trains__/data/locomotive/hr-trainlight5.png",
      "__Mini_Trains__/data/locomotive/hr-trainlight6.png",
      "__Mini_Trains__/data/locomotive/hr-trainlight7.png",
      "__Mini_Trains__/data/locomotive/hr-trainlight8.png"
    },
    line_length = 4,
    lines_per_file = 8,
    shift = cab_shift,
    scale = 0.5,
    blend_mode = "additive",
    draw_as_light = true,
  }
end

local train_lamps = function()
  return
  {
    priority = "very-low",
    dice = 4,
    width = 808 / 4,
    height = 1504 / 8,
    direction_count = 256,
    filenames =
    {
      "__Mini_Trains__/data/locomotive/hr-cablamp1.png",
      "__Mini_Trains__/data/locomotive/hr-cablamp2.png",
      "__Mini_Trains__/data/locomotive/hr-cablamp3.png",
      "__Mini_Trains__/data/locomotive/hr-cablamp4.png",
      "__Mini_Trains__/data/locomotive/hr-cablamp5.png",
      "__Mini_Trains__/data/locomotive/hr-cablamp6.png",
      "__Mini_Trains__/data/locomotive/hr-cablamp7.png",
      "__Mini_Trains__/data/locomotive/hr-cablamp8.png"
    },
    line_length = 4,
    lines_per_file = 8,
    shift = cab_shift,
    scale = 0.5,
    blend_mode = "additive",
    --draw_as_light = true,
  }
end

local train_wheels = function(shift)
  return
  {
    rotated =
    {
      priority = "very-low",
      dice = 4,
      width = 640 / 4,
      height = 1520 / 8,
      direction_count = 256,
      filenames =
      {
        "__Mini_Trains__/data/locomotive/hr-trainwhl1.png",
        "__Mini_Trains__/data/locomotive/hr-trainwhl2.png",
        "__Mini_Trains__/data/locomotive/hr-trainwhl3.png",
        "__Mini_Trains__/data/locomotive/hr-trainwhl4.png",
        "__Mini_Trains__/data/locomotive/hr-trainwhl5.png",
        "__Mini_Trains__/data/locomotive/hr-trainwhl6.png",
        "__Mini_Trains__/data/locomotive/hr-trainwhl7.png",
        "__Mini_Trains__/data/locomotive/hr-trainwhl8.png"
      },
      line_length = 4,
      lines_per_file = 8,
      shift = shift or {0, 0.1},
      scale = 0.5
    },
  }
end

local train_wheelscab = function(shift)
  return
  {
    rotated =
    {
      priority = "very-low",
      dice = 4,
      width = 640 / 4,
      height = 1120 / 8,
      direction_count = 256,
      filenames =
      {
        "__Mini_Trains__/data/locomotive/hr-cabwhl1.png",
        "__Mini_Trains__/data/locomotive/hr-cabwhl2.png",
        "__Mini_Trains__/data/locomotive/hr-cabwhl3.png",
        "__Mini_Trains__/data/locomotive/hr-cabwhl4.png",
        "__Mini_Trains__/data/locomotive/hr-cabwhl5.png",
        "__Mini_Trains__/data/locomotive/hr-cabwhl6.png",
        "__Mini_Trains__/data/locomotive/hr-cabwhl7.png",
        "__Mini_Trains__/data/locomotive/hr-cabwhl8.png"
      },
      line_length = 4,
      lines_per_file = 8,
      shift = shift or {0, 0.1},
      scale = 0.5
    },
  }
end

local fluid_wagon_graphics = function()
  return
  {
    priority = "very-low",
    dice = 4,
    width = 1472 / 4,
    height = 1472 / 4,
    direction_count = 256,
    filenames =
    {
      "__Mini_Trains__/data/fluid-wagon/hr-fluidwagon1.png",
      "__Mini_Trains__/data/fluid-wagon/hr-fluidwagon2.png",
      "__Mini_Trains__/data/fluid-wagon/hr-fluidwagon3.png",
      "__Mini_Trains__/data/fluid-wagon/hr-fluidwagon4.png",
      "__Mini_Trains__/data/fluid-wagon/hr-fluidwagon5.png",
      "__Mini_Trains__/data/fluid-wagon/hr-fluidwagon6.png",
      "__Mini_Trains__/data/fluid-wagon/hr-fluidwagon7.png",
      "__Mini_Trains__/data/fluid-wagon/hr-fluidwagon8.png"
    },
    line_length = 4,
    lines_per_file = 8,
    shift = {0, -1.0},
    scale = 0.5
  }
end

local fluid_wagon_shadow = function()
  return
  {
    priority = "very-low",
    dice = 4,
    width = 1400 / 4,
    height = 2080 / 8,
    direction_count = 256,
    filenames =
    {
      "__Mini_Trains__/data/fluid-wagon/hr-fluidwagsh1.png",
      "__Mini_Trains__/data/fluid-wagon/hr-fluidwagsh2.png",
      "__Mini_Trains__/data/fluid-wagon/hr-fluidwagsh3.png",
      "__Mini_Trains__/data/fluid-wagon/hr-fluidwagsh4.png",
      "__Mini_Trains__/data/fluid-wagon/hr-fluidwagsh5.png",
      "__Mini_Trains__/data/fluid-wagon/hr-fluidwagsh6.png",
      "__Mini_Trains__/data/fluid-wagon/hr-fluidwagsh7.png",
      "__Mini_Trains__/data/fluid-wagon/hr-fluidwagsh8.png"
    },
    line_length = 4,
    lines_per_file = 8,
    shift = util.by_pixel(18, -10),
    scale = 0.5,
    draw_as_shadow = true
  }
end

local cargo_wagon_graphics = function()
  return
  {
    priority = "very-low",
    dice = 4,
    width = 1472 / 4,
    height = 2944 / 8,
    direction_count = 256,
    filenames =
    {
      "__Mini_Trains__/data/cargo-wagon/hr-cargowag1.png",
      "__Mini_Trains__/data/cargo-wagon/hr-cargowag2.png",
      "__Mini_Trains__/data/cargo-wagon/hr-cargowag3.png",
      "__Mini_Trains__/data/cargo-wagon/hr-cargowag4.png",
      "__Mini_Trains__/data/cargo-wagon/hr-cargowag5.png",
      "__Mini_Trains__/data/cargo-wagon/hr-cargowag6.png",
      "__Mini_Trains__/data/cargo-wagon/hr-cargowag7.png",
      "__Mini_Trains__/data/cargo-wagon/hr-cargowag8.png"
    },
    line_length = 4,
    lines_per_file = 8,
    shift = {0, -1.0},
    scale = 0.5
  }
end

local cargo_wagon_shadow = function()
  return
  {
    priority = "very-low",
    dice = 4,
    width = 1472 / 4,
    height = 2944 / 8,
    direction_count = 256,
    filenames =
    {
      "__Mini_Trains__/data/cargo-wagon/hr-cargowsh1.png",
      "__Mini_Trains__/data/cargo-wagon/hr-cargowsh2.png",
      "__Mini_Trains__/data/cargo-wagon/hr-cargowsh3.png",
      "__Mini_Trains__/data/cargo-wagon/hr-cargowsh4.png",
      "__Mini_Trains__/data/cargo-wagon/hr-cargowsh5.png",
      "__Mini_Trains__/data/cargo-wagon/hr-cargowsh6.png",
      "__Mini_Trains__/data/cargo-wagon/hr-cargowsh7.png",
      "__Mini_Trains__/data/cargo-wagon/hr-cargowsh8.png"
    },
    line_length = 4,
    lines_per_file = 8,
    shift = {1.1, -1.0},
    scale = 0.5,
    draw_as_shadow = true
  }
end

local cargo_wagon_doors_vertical = function()
  return
  {
    priority = "very-low",
    width = 1104 / 3,
    height = 2944 / 8,
    direction_count = 256,
    filename = "__Mini_Trains__/data/cargo-wagon/hr-cargov.png",
    line_length = 3,
    lines_per_file = 8,
    shift = {0, -1.0},
    scale = 0.5,
    frame_count = 3 * 8
  }
end

local cargo_wagon_doors_horizontal = function()
  return
  {
    priority = "very-low",
    width = 1104 / 3,
    height = 2944 / 8,
    direction_count = 256,
    filename = "__Mini_Trains__/data/cargo-wagon/hr-cargoh.png",
    line_length = 3,
    lines_per_file = 8,
    shift = {0, -1.0},
    scale = 0.5,
    frame_count = 3 * 8
  }
end

local back_light = function(smol)
  return
  {
    {
      minimum_darkness = 0.3,
      color = {r = 1, g = 0.1, b = 0.05, a = 0},
      shift = smol and {-0.6, 1.5} or {-0.6, 2.5},
      size = 2,
      intensity = 0.6,
      add_perspective = true
    },
    {
      minimum_darkness = 0.3,
      color = {r = 1, g = 0.1, b = 0.05, a = 0},
      shift = smol and {0.6, 1.5} or {0.6, 2.5},
      size = 2,
      intensity = 0.6,
      add_perspective = true
    }
  }
end

local stand_by_light = function(smol)
  return
  {
    {
      minimum_darkness = 0.3,
      color = {r = 0.05, g = 0.2, b = 1, a = 0},
      shift = smol and {-0.6, -1.5} or {-0.6, -2.5},
      size = 2,
      intensity = 0.5,
      add_perspective = true
    },
    {
      minimum_darkness = 0.3,
      color = {r = 0.05, g = 0.2, b = 1, a = 0},
      shift = smol and {0.6, -1.5} or {0.6, -2.5},
      size = 2,
      intensity = 0.5,
      add_perspective = true
    }
  }
end

local mini_locomotive =
{
  type = "locomotive",
  name = "mini-locomotive",
  icon = "__Mini_Trains__/data/icons/cab64.png",
  icon_size = 64,
  flags = { "placeable-neutral", "player-creation", "placeable-off-grid" },
  minable = { mining_time = 0.5, result = "mini-locomotive" },
  mined_sound = { filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8 },
  max_health = 500,
  corpse = "locomotive-remnants",
  dying_explosion = "locomotive-explosion",
  factoriopedia_simulation = simulations.factoriopedia_mini_locomotive,
  collision_box = { { -0.6, -1.2 }, { 0.6, 1.2 } },
  selection_box = { { -1, -1 }, { 1, 1 } },
  damaged_trigger_effect = hit_effects.entity(),
  alert_icon_shift = util.by_pixel(0, -24),
  weight = 1000,
  default_copy_color_from_train_stop = true,
  max_speed = 0.8,
  max_power = "250kW",
  reversing_power_modifier = 0.8,
  braking_force = 5,
  friction_force = 0.40,
  vertical_selection_shift = -0.5,
  air_resistance = 0.0095, -- this is a percentage of current speed that will be subtracted
  connection_distance = 1,
  joint_distance = 2,
  energy_per_hit_point = 5,
  resistances =
  {
    {
      type = "fire",
      decrease = 15,
      percent = 50
    },
    {
      type = "physical",
      decrease = 15,
      percent = 30
    },
    {
      type = "impact",
      decrease = 50,
      percent = 60
    },
    {
      type = "explosion",
      decrease = 15,
      percent = 30
    },
    {
      type = "acid",
      decrease = 3,
      percent = 20
    }
  },
  energy_source =
  {
    type = "burner",
    fuel_categories = { "chemical" },
    effectivity = 0.8,
    fuel_inventory_size = 1,
    smoke =
    {
      {
        name = "tank-smoke",
        deviation = { 0.3, 0.3 },
        frequency = 80,
        position = { 0, 0 },
        starting_frame = 0,
        starting_frame_deviation = 60,
        height = 1.5,
        height_deviation = 0.3,
        starting_vertical_speed = 0.2,
        starting_vertical_speed_deviation = 0.1
      }
    }
  },
  front_light =
  {
    {
      type = "oriented",
      minimum_darkness = 0.3,
      picture =
      {
        filename = "__core__/graphics/light-cone.png",
        priority = "extra-high",
        flags = { "light" },
        scale = 1.5,
        width = 200,
        height = 200
      },
      shift = { -0.4, -8 },
      size = 1.5,
      intensity = 0.6,
      color = { r = 0.8, g = 0.8, b = 0.2 }
    },
    {
      type = "oriented",
      minimum_darkness = 0.3,
      picture =
      {
        filename = "__core__/graphics/light-cone.png",
        priority = "extra-high",
        flags = { "light" },
        scale = 1.5,
        width = 200,
        height = 200
      },
      shift = { 0.4, -8 },
      size = 1.5,
      intensity = 0.6,
      color = { r = 0.8, g = 0.8, b = 0.2 }
    }
  },
  back_light = back_light(true),
  stand_by_light = stand_by_light(true),
  color = default_color,
  pictures =
  {
    rotated =
    {
      layers =
      {
        train_graphics(),
        train_mask(),
        train_glow(),
        train_shadow(),
      }
    },
  },
  front_light_pictures =
  {
    rotated =
    {
      layers =
      {
        train_lamps(),
        train_lights()
      }
    },
  },
  minimap_representation =
  {
    filename = "__Mini_Trains__/data/minimap/mini-locomotive-minimap-representation.png",
    flags = { "icon" },
    size = { 20, 26 },
    scale = 0.5
  },
  selected_minimap_representation =
  {
    filename = "__Mini_Trains__/data/minimap/mini-locomotive-selected-minimap-representation.png",
    flags = { "icon" },
    size = { 20, 26 },
    scale = 0.5
  },
  wheels = train_wheelscab(),
  stop_trigger =
  {
    -- left side
    {
      type = "create-trivial-smoke",
      repeat_count = 125,
      smoke_name = "smoke-train-stop",
      initial_height = 0,
      -- smoke goes to the left
      speed = { -0.03, 0 },
      speed_multiplier = 0.75,
      speed_multiplier_deviation = 1.1,
      offset_deviation = { { 0.3, -1.3 }, { 0.75, 1.3 } }
    },
    {
      type = "create-trivial-smoke",
      repeat_count = 60,
      smoke_name = "smoke-train-stop",
      initial_height = 0,
      -- smoke goes to the right
      speed = { 0.03, 0 },
      speed_multiplier = 0.75,
      speed_multiplier_deviation = 1.1,
      offset_deviation = { { 0.3, -1.3 }, { 0.75, 1.3 } }
    },
    {
      type = "play-sound",
      sound = sounds.train_brakes
    },
    {
      type = "play-sound",
      sound = sounds.train_brake_screech
    }
  },
  drive_over_tie_trigger = drive_over_tie(),
  tie_distance = 50,
  vehicle_impact_sound = sounds.generic_impact,
  working_sound =
  {
    sound =
    {
      filename = "__Mini_Trains__/data/mini-train-engine.ogg",
      volume = 0.25
    },
    deactivate_sound =
    {
      filename = "__base__/sound/train-engine-stop.ogg",
      volume = 0
    },
    match_speed_to_activity = true,
    max_sounds_per_type = 2,
    -- use_doppler_shift = false
  },
  open_sound = { filename = "__base__/sound/train-door-open.ogg", volume = 0.5 },
  close_sound = { filename = "__base__/sound/train-door-close.ogg", volume = 0.4 },
  sound_minimum_speed = 0.5,
  sound_scaling_ratio = 0.35,
  water_reflection = locomotive_reflection(),
  allow_remote_driving = true
}


data:extend { mini_locomotive }

local item = {
  type = "item",
  name = "mini-locomotive",
  icon = mini_locomotive.icon,
  icon_size = mini_locomotive.icon_size,
  subgroup = "transport",
  order = "a[train-system]-x[mini-locomotive]",
  place_result = "mini-locomotive",
  stack_size = 5
}

data:extend { item }

local recipe =
{
  type = "recipe",
  name = "mini-locomotive",
  enabled = false,
  energy_required = 5,
  ingredients =
  {
    {type="item", name="steel-plate", amount=15},
    {type="item", name="engine-unit", amount=5},
    {type="item", name="electronic-circuit", amount=10}
  },
  results = {{type="item", name="mini-locomotive", amount=1}}
}

data:extend { recipe }

local mini_fluid_wagon =
{
  type = "fluid-wagon",
  name = "mini-fluid-wagon",
  icon = "__Mini_Trains__/data/icons/fluid64.png",
  icon_size = 64,
  flags = { "placeable-neutral", "player-creation", "placeable-off-grid" },
  minable = { mining_time = 0.5, result = "mini-fluid-wagon" },
  mined_sound = { filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8 },
  max_health = 300,
  capacity = 30000,
  corpse = "fluid-wagon-remnants",
  dying_explosion = "fluid-wagon-explosion",
  factoriopedia_simulation = simulations.factoriopedia_mini_fluid_wagon,
  collision_box = { { -0.6, -1.7 }, { 0.6, 1.7 } },
  selection_box = { { -1, -2 }, { 1, 2 } },
  damaged_trigger_effect = hit_effects.entity(),
  vertical_selection_shift = -0.8,
  weight = 500,
  max_speed = 1.5,
  braking_force = 3,
  friction_force = 0.40,
  air_resistance = 0.015,
  connection_distance = 2,
  joint_distance = 3,
  energy_per_hit_point = 6,
  tank_count = 2,
  resistances =
  {
    {
      type = "fire",
      decrease = 15,
      percent = 50
    },
    {
      type = "physical",
      decrease = 15,
      percent = 30
    },
    {
      type = "impact",
      decrease = 50,
      percent = 60
    },
    {
      type = "explosion",
      decrease = 15,
      percent = 30
    },
    {
      type = "acid",
      decrease = 3,
      percent = 20
    }
  },
  back_light = back_light(),
  stand_by_light = stand_by_light(),
  color = { r = 0.43, g = 0.23, b = 0, a = 0.5 },
  pictures =
  {
    rotated =
    {
      layers =
      {
        fluid_wagon_graphics(),
        fluid_wagon_shadow()
      }
    },
  },
  minimap_representation =
  {
    filename = "__Mini_Trains__/data/minimap/mini-fluid-wagon-minimap-representation.png",
    flags = { "icon" },
    size = { 20, 30 },
    scale = 0.5
  },
  selected_minimap_representation =
  {
    filename = "__Mini_Trains__/data/minimap/mini-fluid-wagon-selected-minimap-representation.png",
    flags = { "icon" },
    size = { 20, 30 },
    scale = 0.5
  },
  wheels = train_wheels(),
  drive_over_tie_trigger = drive_over_tie(),
  tie_distance = 50,
  working_sound =
  {
    sound =
    {
      filename = "__base__/sound/train-wheels.ogg",
      volume = 0.3
    },
    match_volume_to_activity = true
  },
  crash_trigger = crash_trigger(),
  sound_minimum_speed = 0.1,
  vehicle_impact_sound = sounds.generic_impact,
  water_reflection = locomotive_reflection()
}

data:extend { mini_fluid_wagon }

local item = {
  type = "item",
  name = "mini-fluid-wagon",
  icon = mini_fluid_wagon.icon,
  icon_size = mini_fluid_wagon.icon_size,
  subgroup = "transport",
  order = "a[train-system]-z[mini-fluid-wagon]",
  place_result = "mini-fluid-wagon",
  stack_size = 5
}

data:extend { item }

local recipe =
{
  type = "recipe",
  name = "mini-fluid-wagon",
  enabled = false,
  energy_required = 5,
  ingredients =
  {
    {type="item", name="steel-plate", amount=10},
    {type="item", name="iron-gear-wheel", amount=5},
    {type="item", name="pipe", amount=20}
  },
  results = {{type="item", name="mini-fluid-wagon", amount=1}}
}

data:extend { recipe }

data.raw.pump.pump.fluid_wagon_connector_alignment_tolerance = 20 / 32 --2/32

local cargo_wagon =
{
  type = "cargo-wagon",
  name = "mini-cargo-wagon",
  icon = "__Mini_Trains__/data/icons/cargo64.png",
  icon_size = 64,
  flags = { "placeable-neutral", "player-creation", "placeable-off-grid" },
  inventory_size = 20,
  minable = { mining_time = 0.5, result = "mini-cargo-wagon" },
  mined_sound = { filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8 },
  max_health = 300,
  corpse = "cargo-wagon-remnants",
  dying_explosion = "cargo-wagon-explosion",
  factoriopedia_simulation = simulations.factoriopedia_mini_cargo_wagon,
  collision_box = { { -0.6, -1.7 }, { 0.6, 1.7 } },
  selection_box = { { -1, -2 }, { 1, 2 } },
  damaged_trigger_effect = hit_effects.entity(),
  vertical_selection_shift = -0.8,
  weight = 500,
  max_speed = 1.5,
  braking_force = 3,
  friction_force = 0.40,
  air_resistance = 0.015,
  connection_distance = 2,
  joint_distance = 3,
  energy_per_hit_point = 5,
  resistances =
  {
    {
      type = "fire",
      decrease = 15,
      percent = 50
    },
    {
      type = "physical",
      decrease = 15,
      percent = 30
    },
    {
      type = "impact",
      decrease = 50,
      percent = 60
    },
    {
      type = "explosion",
      decrease = 15,
      percent = 30
    },
    {
      type = "acid",
      decrease = 3,
      percent = 20
    }
  },
  back_light = back_light(),
  stand_by_light = stand_by_light(),
  color = { r = 0.43, g = 0.23, b = 0, a = 0.5 },
  pictures =
  {
    rotated =
    {
      layers =
      {
        cargo_wagon_graphics(),
        cargo_wagon_shadow()
      }
    },
  },
  horizontal_doors =
  {
    layers =
    {
      cargo_wagon_doors_horizontal()
    }
  },
  vertical_doors =
  {
    layers =
    {
      cargo_wagon_doors_vertical()
    }
  },
  minimap_representation =
  {
    filename = "__Mini_Trains__/data/minimap/mini-cargo-wagon-minimap-representation.png",
    flags = { "icon" },
    size = { 20, 30 },
    scale = 0.5
  },
  selected_minimap_representation =
  {
    filename = "__Mini_Trains__/data/minimap/mini-cargo-wagon-selected-minimap-representation.png",
    flags = { "icon" },
    size = { 20, 30 },
    scale = 0.5
  },
  wheels = train_wheels(),
  drive_over_tie_trigger = drive_over_tie(),
  tie_distance = 50,
  working_sound =
  {
    sound =
    {
      filename = "__base__/sound/train-wheels.ogg",
      volume = 0.3
    },
    match_volume_to_activity = true
  },
  crash_trigger = crash_trigger(),
  open_sound = sounds.cargo_wagon_open,
  close_sound = sounds.cargo_wagon_close,
  sound_minimum_speed = 1,
  vehicle_impact_sound = sounds.generic_impact,
  water_reflection = locomotive_reflection()
}

data:extend { cargo_wagon }

local item = {
  type = "item",
  name = "mini-cargo-wagon",
  icon = cargo_wagon.icon,
  icon_size = cargo_wagon.icon_size,
  subgroup = "transport",
  order = "a[train-system]-y[mini-cargo-wagon]",
  place_result = "mini-cargo-wagon",
  stack_size = 5
}

data:extend { item }

local recipe =
{
  type = "recipe",
  name = "mini-cargo-wagon",
  enabled = false,
  energy_required = 5,
  ingredients =
  {
    {type="item", name="iron-plate", amount=10},
    {type="item", name="steel-plate", amount=10},
    {type="item", name="iron-gear-wheel", amount=10}
  },
  results = {{type="item", name="mini-cargo-wagon", amount=1}}
}

data:extend { recipe }

local technology =
{
  type = "technology",
  name = "mini-trains",
  icon = "__Mini_Trains__/data/icons/tech256.png",
  icon_size = 256,
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "mini-locomotive"
    },
    {
      type = "unlock-recipe",
      recipe = "mini-fluid-wagon"
    },
    {
      type = "unlock-recipe",
      recipe = "mini-cargo-wagon"
    }
  },
  prerequisites = { "railway" },
  unit =
  {
    count = 100,
    ingredients =
    {
      { "logistic-science-pack",   1 },
      { "automation-science-pack", 1 }
    },
    time = 30
  },
  order = "c-g-a"
}

data:extend { technology }
