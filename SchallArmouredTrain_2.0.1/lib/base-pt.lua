local basept = {}



-- This file is about the basic prototype of the armoured draisine

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
-- local movement_triggers = require("__base__.prototypes.entity.movement-triggers")
local tank_shift_y = 6



basept.AD = { }

basept.AD.item =
  {
    type = "item-with-entity-data",
    name = "Schall-armoured-draisine",
    icon = "__base__/graphics/icons/tank.png",
    subgroup = "transport",
    order = "b[personal-transport]-b[tank]",
    inventory_move_sound = item_sounds.vehicle_inventory_move,
    pick_sound = item_sounds.vehicle_inventory_pickup,
    drop_sound = item_sounds.vehicle_inventory_move,
    place_result = "tank",
    stack_size = 1
  }

basept.AD.entity =
  {
    type = "locomotive",
    name = "Schall-armoured-draisine",
    icon = "__base__/graphics/icons/tank.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"},
    minable = {mining_time = 0.5, result = "Schall-armoured-draisine"},
    mined_sound = sounds.deconstruct_large(0.8),
    max_health = 2000,
    corpse = "tank-remnants",
    dying_explosion = "tank-explosion",
    alert_icon_shift = util.by_pixel(0, -13),
    energy_per_hit_point = 0.5, --5,
    resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 60
      },
      {
        type = "physical",
        decrease = 15,
        percent = 60
      },
      {
        type = "impact",
        decrease = 50,
        percent = 80
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 70
      },
      {
        type = "acid",
        decrease = 0,
        percent = 70
      }
    },
    -- collision_box = {{-0.9, -1.3}, {0.9, 1.3}},
    -- selection_box = {{-0.9, -1.3}, {0.9, 1.3}},
    collision_box = {{-0.9, -1.5}, {0.9, 1.5}},
    selection_box = {{-0.9, -1.5}, {0.9, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box = {{-1.8, -1.8}, {1.8, 1.5}},
    weight = 20000, --2000,
    max_speed = 1.2,
    max_power = "800kW",
    reversing_power_modifier = 0.6,
    braking_force = 10,
    friction_force = 0.50,
    vertical_selection_shift = -0.5,
    air_resistance = 0.0075, -- this is a percentage of current speed that will be subtracted
    connection_distance = 2,  --3,
    joint_distance = 1.5, --4,
    energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1,
      fuel_inventory_size = 2,  --3,
      smoke =
      {
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {0, 1.5},
          starting_frame = 0,
          starting_frame_deviation = 60,
          height = 2,
          height_deviation = 0.5,
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
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {-0.1, -14 + tank_shift_y / 32},
        size = 2,
        intensity = 0.8,
        color = {r = 1.0, g = 1.0, b = 0.8},
        source_orientation_offset = -0.02
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0.1, -14 + tank_shift_y / 32},
        size = 2,
        intensity = 0.8,
        color = {r = 1.0, g = 1.0, b = 0.8},
        source_orientation_offset = 0.02
      }
    },
    -- back_light = rolling_stock_back_light(),
    -- stand_by_light = rolling_stock_stand_by_light(),
    front_light_pictures =
    {
      -- filename = "__base__/graphics/entity/tank/tank-light.png",
      -- priority = "low",
      -- blend_mode = "additive",
      -- draw_as_glow = true,
      -- width = 260,
      -- height = 210,
      -- line_length = 8,
      -- direction_count = 64,
      -- scale = 0.5,
      -- shift = util.by_pixel(-1, -17 + 6),
      -- repeat_count = 2,
      rotated =
      {
        layers =
        {
          {
            priority = "low",
            blend_mode = "additive",
            width = 260,
            height = 210,
            line_length = 8,
            lines_per_file = 8,
            direction_count = 64,
            shift = util.by_pixel(-1, -17 + 6),
            scale = 0.5,
            usage = "train",
            filenames = {
              "__base__/graphics/entity/tank/tank-light.png",
            }
          },
        }
      }
    },
    color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
    pictures =
    {
      -- layers =
      -- {
      --   {
      --     priority = "low",
      --     width = 270,
      --     height = 212,
      --     frame_count = 2,
      --     direction_count = 64,
      --     shift = util.by_pixel(0, -16 + tank_shift_y),
      --     animation_speed = 8,
      --     max_advance = 1,
      --     stripes =
      --     {
      --       {
      --         filename = "__base__/graphics/entity/tank/tank-base-1.png",
      --         width_in_frames = 2,
      --         height_in_frames = 16
      --       },
      --       {
      --         filename = "__base__/graphics/entity/tank/tank-base-2.png",
      --         width_in_frames = 2,
      --         height_in_frames = 16
      --       },
      --       {
      --         filename = "__base__/graphics/entity/tank/tank-base-3.png",
      --         width_in_frames = 2,
      --         height_in_frames = 16
      --       },
      --       {
      --         filename = "__base__/graphics/entity/tank/tank-base-4.png",
      --         width_in_frames = 2,
      --         height_in_frames = 16
      --       }
      --     },
      --     scale = 0.5
      --   },
      --   {
      --     priority = "low",
      --     width = 208,
      --     height = 166,
      --     frame_count = 2,
      --     apply_runtime_tint = true,
      --     direction_count = 64,
      --     shift = util.by_pixel(0, -27.5 + tank_shift_y),
      --     max_advance = 1,
      --     line_length = 2,
      --     stripes = util.multiplystripes(2,
      --     {
      --       {
      --         filename = "__base__/graphics/entity/tank/tank-base-mask-1.png",
      --         width_in_frames = 1,
      --         height_in_frames = 22
      --       },
      --       {
      --         filename = "__base__/graphics/entity/tank/tank-base-mask-2.png",
      --         width_in_frames = 1,
      --         height_in_frames = 22
      --       },
      --       {
      --         filename = "__base__/graphics/entity/tank/tank-base-mask-3.png",
      --         width_in_frames = 1,
      --         height_in_frames = 20
      --       }
      --     }),
      --     scale = 0.5
      --   },
      --   {
      --     filename = "__base__/graphics/entity/tank/tank-turret.png",
      --     priority = "low",
      --     line_length = 8,
      --     width = 179,
      --     height = 132,
      --     direction_count = 64,
      --     shift = util.by_pixel(2.25-2, -40.5 + tank_shift_y),
      --     animation_speed = 8,
      --     scale = 0.5
      --   },
      --   {
      --     filename = "__base__/graphics/entity/tank/tank-turret-mask.png",
      --     priority = "low",
      --     line_length = 8,
      --     width = 72,
      --     height = 66,
      --     apply_runtime_tint = true,
      --     direction_count = 64,
      --     shift = util.by_pixel(2-2, -41.5 + tank_shift_y),
      --     scale = 0.5
      --   },
      --   {
      --     priority = "low",
      --     width = 302,
      --     height = 194,
      --     frame_count = 2,
      --     draw_as_shadow = true,
      --     direction_count = 64,
      --     shift = util.by_pixel(22.5, 1 + tank_shift_y),
      --     max_advance = 1,
      --     stripes = util.multiplystripes(2,
      --     {
      --       {
      --         filename = "__base__/graphics/entity/tank/tank-base-shadow-1.png",
      --         width_in_frames = 1,
      --         height_in_frames = 16
      --       },
      --       {
      --         filename = "__base__/graphics/entity/tank/tank-base-shadow-2.png",
      --         width_in_frames = 1,
      --         height_in_frames = 16
      --       },
      --       {
      --         filename = "__base__/graphics/entity/tank/tank-base-shadow-3.png",
      --         width_in_frames = 1,
      --         height_in_frames = 16
      --       },
      --       {
      --         filename = "__base__/graphics/entity/tank/tank-base-shadow-4.png",
      --         width_in_frames = 1,
      --         height_in_frames = 16
      --       }
      --     }),
      --     scale = 0.5
      --   },
      --   {
      --     filename = "__base__/graphics/entity/tank/tank-turret-shadow.png",
      --     priority = "low",
      --     line_length = 8,
      --     width = 193,
      --     height = 134,
      --     draw_as_shadow = true,
      --     direction_count = 64,
      --     shift = util.by_pixel(58.25-2, 0.5 + tank_shift_y),
      --     scale = 0.5
      --   }
      -- }
      rotated =
      {
        layers =
        {
          {
            priority = "low",
            width = 270,
            height = 212,
            line_length = 1,  --2,
            lines_per_file = 16,
            direction_count = 64, --128,
            shift = util.by_pixel(0, -16 + tank_shift_y),
            scale = 0.5,
            usage = "train",
            filenames = {
              "__base__/graphics/entity/tank/tank-base-1.png",
              "__base__/graphics/entity/tank/tank-base-2.png",
              "__base__/graphics/entity/tank/tank-base-3.png",
              "__base__/graphics/entity/tank/tank-base-4.png",
            }
          },
          {
            priority = "low",
            flags = { "mask" },
            apply_runtime_tint = true,
            tint_as_overlay = true,
            width = 208,
            height = 166,
            line_length = 1,
            lines_per_file = 16,  --22,
            direction_count = 64,
            shift = util.by_pixel(0, -27.5 + tank_shift_y),
            scale = 0.5,
            usage = "train",
            filenames = {
              -- "__base__/graphics/entity/tank/tank-base-mask-1.png",
              -- "__base__/graphics/entity/tank/tank-base-mask-2.png",
              -- "__base__/graphics/entity/tank/tank-base-mask-3.png",
              "__SchallArmouredTrain__/graphics/entity/tank-base-mask-1.png",
              "__SchallArmouredTrain__/graphics/entity/tank-base-mask-2.png",
              "__SchallArmouredTrain__/graphics/entity/tank-base-mask-3.png",
              "__SchallArmouredTrain__/graphics/entity/tank-base-mask-4.png",
            }
          },
          {
            priority = "low",
            width = 179,
            height = 132,
            line_length = 8,
            lines_per_file = 8,
            direction_count = 64,
            shift = util.by_pixel(2.25-2, -40.5 + tank_shift_y),
            scale = 0.5,
            usage = "train",
            filenames = {
              "__base__/graphics/entity/tank/tank-turret.png",
            }
          },
          {
            priority = "low",
            flags = { "mask" },
            apply_runtime_tint = true,
            tint_as_overlay = true,
            width = 72,
            height = 66,
            line_length = 8,
            lines_per_file = 8,
            direction_count = 64,
            shift = util.by_pixel(2-2, -41.5 + tank_shift_y),
            scale = 0.5,
            usage = "train",
            filenames = {
              "__base__/graphics/entity/tank/tank-turret-mask.png",
            }
          },
          {
            priority = "low",
            flags = { "shadow" },
            draw_as_shadow = true,
            width = 302,
            height = 194,
            line_length = 1,
            lines_per_file = 16,
            direction_count = 64,
            shift = util.by_pixel(22.5, 1 + tank_shift_y),
            scale = 0.5,
            usage = "train",
            filenames = {
              "__base__/graphics/entity/tank/tank-base-shadow-1.png",
              "__base__/graphics/entity/tank/tank-base-shadow-2.png",
              "__base__/graphics/entity/tank/tank-base-shadow-3.png",
              "__base__/graphics/entity/tank/tank-base-shadow-4.png",
            }
          },
          {
            priority = "low",
            flags = { "shadow" },
            draw_as_shadow = true,
            width = 193,
            height = 134,
            line_length = 8,
            lines_per_file = 8,
            direction_count = 64,
            shift = util.by_pixel(58.25-2, 0.5 + tank_shift_y),
            scale = 0.5,
            usage = "train",
            filenames = {
              "__base__/graphics/entity/tank/tank-turret-shadow.png",
            }
          },
        }
      },
    },
    minimap_representation =
    {
      filename = "__SchallArmouredTrain__/graphics/minimap/draisine-map.png",
      flags = {"icon"},
      size = {20, 22},
      scale = 0.5
    },
    selected_minimap_representation =
    {
      filename = "__SchallArmouredTrain__/graphics/minimap/draisine-selected-map.png",
      flags = {"icon"},
      size = {20, 22},
      scale = 0.5
    },
    -- wheels = standard_train_wheels,
    stop_trigger =
    {
      -- left side
      {
        type = "create-trivial-smoke",
        repeat_count = 125,
        smoke_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the left
        speed = {-0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
      },
      -- right side
      {
        type = "create-trivial-smoke",
        repeat_count = 125,
        smoke_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the right
        speed = {0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
      },
      {
        type = "play-sound",
        sound = sounds.train_brakes,
      },
      {
        type = "play-sound",
        sound = sounds.train_brake_screech,
      },
    },
    -- stop_trigger =
    -- {
    --   {
    --     type = "play-sound",
    --     sound = { filename = "__base__/sound/fight/tank-brakes.ogg", volume = 0.3 }
    --   }
    -- },
    drive_over_tie_trigger =  -- drive_over_tie(),
    {
      type = "play-sound",
      sound = sound_variations("__base__/sound/train-tie", 6, 0.4, { volume_multiplier("main-menu", 2.4), volume_multiplier("driving", 1.3) } )
    },
    drive_over_tie_trigger_minimal_speed = 0.5,
    tie_distance = 50,
    impact_category = "metal-large",
    -- impact_category = "metal-large",
    -- impact_speed_to_volume_ratio = 5.0,
    -- working_sound =
    -- {
    --   sound =
    --   {
    --     filename = "__base__/sound/fight/tank-engine.ogg",
    --     volume = 0.37
    --   },
    --   activate_sound =
    --   {
    --     filename = "__base__/sound/fight/tank-engine-start.ogg",
    --     volume = 0.37
    --   },
    --   deactivate_sound =
    --   {
    --     filename = "__base__/sound/fight/tank-engine-stop.ogg",
    --     volume = 0.37
    --   },
    --   match_speed_to_activity = true
    -- },
    working_sound =
    {
      main_sounds =
      {
        {
          sound = { filename = "__base__/sound/fight/tank-engine-driving.ogg", volume = 0.35, modifiers = volume_multiplier("main-menu", 1.3) },
          match_volume_to_activity = true,
          activity_to_volume_modifiers =
          {
            multiplier = 4.5,
            offset = 1.0,
          },
          match_speed_to_activity = true,
          activity_to_speed_modifiers =
          {
            multiplier = 3.0,
            minimum = 1.0,
            maximum = 1.2,
            offset = 0.8
          }
        },
        {
          sound = { filename = "__base__/sound/fight/tank-tracks.ogg", volume = 0.35, modifiers = volume_multiplier("main-menu", 1.3) },
          match_volume_to_activity = true,
          activity_to_volume_modifiers =
          {
            multiplier = 4.5,
            offset = 1.0,
          },
        },
        {
          sound = { filename = "__base__/sound/fight/tank-engine.ogg", volume = 0.67 },
          match_volume_to_activity = true,
          fade_in_ticks = 22,
          fade_out_ticks = 4,
          activity_to_volume_modifiers =
          {
            multiplier = 1.75,
            offset = 1.3,
            inverted = true
          }
        },
      },
      activate_sound = { filename = "__base__/sound/fight/tank-engine-start.ogg", volume = 0.37 },
      deactivate_sound = { filename = "__base__/sound/fight/tank-engine-stop.ogg", volume = 0.37 },
    },
    open_sound = { filename = "__base__/sound/fight/tank-door-open.ogg", volume=0.48 },
    close_sound = { filename = "__base__/sound/fight/tank-door-close.ogg", volume = 0.43 },
    -- open_sound = { filename = "__base__/sound/train-door-open.ogg", volume=0.5 },
    -- close_sound = { filename = "__base__/sound/train-door-close.ogg", volume = 0.4 },
    sound_minimum_speed = 0.5,
    sound_scaling_ratio = 0.35,
    water_reflection = car_reflection(1.2), --locomotive_reflection(),
    allow_remote_driving = true
  }



return basept