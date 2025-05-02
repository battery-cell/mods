local path = ('__SA-AtomicTank__')

local tank_shift_y = 6
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local movement_triggers = require("__base__.prototypes.entity.movement-triggers")
local is_immune_to_rock_impacts = settings.startup["T1-rock-impact"].value
local is_immune_to_tree_impacts = settings.startup["T1-tree-impact"].value
local t1atomhealth = settings.startup["T1-Atom-hp"].value


local remnants ={
    {
        type = "corpse",
        name = "t1atom-remnants",
        icon = path .. "/graphics/icons/t1atomicon2.png",
        icon_size = 64,
        flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
        subgroup = "transport-remnants",
        order = "a-k-a",
        selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
        tile_width = 3,
        tile_height = 5,
        selectable_in_game = false,
        time_before_removed = 60 * 60 * 15, -- 15 minutes
        final_render_layer = "remnants",
        remove_on_tile_placement = false,
        animation =
        {
          layers =
          {
            {
                filename = path .. "/graphics/entity/saatomictank/hr-t1ruin.png",
                line_length = 1,
                width = 512,
                height = 398,
                frame_count = 1,
                direction_count = 4,
                shift = util.by_pixel(0,0),
                scale = 0.5
              
            }
          }
        }
    },
}


   
data:extend(remnants)



data:extend({
    {
        type = "car",
        name = "sa-atomic-tank",
        icon = path .. "/graphics/icons/t1atomicon.png",
        icon_size = 128,
        flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"},
        minable = {mining_time = 0.5, result = "sa-atomic-tank"},
        mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
        max_health = t1atomhealth,
        corpse = "t1atom-remnants",
        dying_explosion = "tank-explosion",
        alert_icon_shift = util.by_pixel(0, -13),
        immune_to_tree_impacts = is_immune_to_tree_impacts,
        immune_to_rock_impacts = is_immune_to_rock_impacts,
        energy_per_hit_point = 0.5,
        equipment_grid = "saatomictank-equipment-grid",
        trash_inventory_size = 20,
        allow_remote_driving = true,
        resistances =
        {
            {
                type = "fire",
                decrease = 15,
                percent = 65
            },
            {
                type = "physical",
                decrease = 15,
                percent = 65
            },
            {
                type = "impact",
                decrease = 50,
                percent = 85
            },
            {
                type = "explosion",
                decrease = 15,
                percent = 75
            },
            {
                type = "acid",
                decrease = 0,
                percent = 75
            }
        },
        collision_box = {{-1.4, -2.6}, {1.4, 2.6}},
        selection_box = {{-1.4, -2.6}, {1.4, 2.6}},
        damaged_trigger_effect = hit_effects.entity(),
        drawing_box = {{-1.8, -3.6}, {1.8, 3.6}},
        effectivity = 1.1,
        braking_power = "800kW",
        energy_source =
        {
        type = "burner",
        fuel_categories = {"chemical"},
        effectivity = 1.2,
        fuel_inventory_size = 4,
        smoke =
        {
            {
            name = "tank-smoke",
            deviation = {0.25, 0.25},
            frequency = 50,
            position = {0.6, 2.2},
            starting_frame = 0,
            starting_frame_deviation = 60
            }
        }
        },
        consumption = "800kW",
        terrain_friction_modifier = 0.3,
        friction = 0.003,
        light =
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
            shift = {0, -17 + tank_shift_y / 32},
            size = 2,
            intensity = 0.8,
            color = {r = 1.0, g = 1.0, b = 0.8},
            source_orientation_offset = 0
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
            shift = {0, -17 + tank_shift_y / 32},
            size = 2,
            intensity = 0.8,
            color = {r = 1.0, g = 1.0, b = 0.8},
            source_orientation_offset = 0
        }
        },
        light_animation =
        {
            filename = path .. "/graphics/entity/saatomictank/hr-T1Light.png",
            priority = "low",
            blend_mode = "additive",
            draw_as_glow = true,
            width = 512,
            height = 512,
            line_length = 8,
            direction_count = 64,
            scale = 0.5,
            repeat_count = 2,        
        },
        animation =
        {
        layers =
        {
            {
                priority = "low",
                width = 512,
                height = 512,
                frame_count = 2,
                direction_count = 64,
                animation_speed = 4,
                max_advance = 1,
                render_layer = "object",
                stripes =
                {
                    {
                    filename = path .. "/graphics/entity/saatomictank/hr-T1BodyA.png",
                    width_in_frames = 2,
                    height_in_frames = 16
                    },
                    {
                    filename = path .. "/graphics/entity/saatomictank/hr-T1BodyB.png",
                    width_in_frames = 2,
                    height_in_frames = 16
                    },
                    {
                    filename = path .. "/graphics/entity/saatomictank/hr-T1BodyC.png",
                    width_in_frames = 2,
                    height_in_frames = 16
                    },
                    {
                    filename = path .. "/graphics/entity/saatomictank/hr-T1BodyD.png",
                    width_in_frames = 2,
                    height_in_frames = 16
                    }
                },
                scale = 0.5            
            },
            {
                priority = "low",
                width = 614,
                height = 614,
                apply_runtime_tint = true,
                direction_count = 64,
                max_advance = 1,
                line_length = 8,
                repeat_count = 2,
                filename = path .. "/graphics/entity/saatomictank/hr-T1Mask.png",
                scale = 0.5                
            },
            {
                priority = "low",
                width = 614,
                height = 614,
                frame_count = 2,
                draw_as_shadow = true,
                direction_count = 64,
                shift = util.by_pixel(0,0),
                max_advance = 1,
                stripes = 
                {
                    {
                    filename = path .. "/graphics/entity/saatomictank/hr-T1BodyshA.png",
                    width_in_frames = 4,
                    height_in_frames = 8
                    },
                    {
                    filename = path .. "/graphics/entity/saatomictank/hr-T1BodyshB.png",
                    width_in_frames = 4,
                    height_in_frames = 8
                    },
                    {
                    filename = path .. "/graphics/entity/saatomictank/hr-T1BodyshC.png",
                    width_in_frames = 4,
                    height_in_frames = 8
                    },
                    {
                    filename = path .. "/graphics/entity/saatomictank/hr-T1BodyshD.png",
                    width_in_frames = 4,
                    height_in_frames = 8
                    }
                },
                scale = 0.5            
            }
        }
        },
        turret_animation =
        {
        layers =
        {
            {
                priority = "low",
                width = 614,
                height = 614,
                direction_count = 64,
                max_advance = 1,
                line_length = 8,
                filename = path .. "/graphics/entity/saatomictank/hr-T1Turret.png",
                scale = 0.5                
            },        
            {
                priority = "low",
                draw_as_shadow = true,
                width = 614,
                height = 614,
                direction_count = 64,
                max_advance = 1,
                line_length = 8,
                filename = path .. "/graphics/entity/saatomictank/hr-T1Turretsh.png",
                scale = 0.5                
            }
        }
        },
        turret_rotation_speed = 0.30 / 60,
        turret_return_timeout = 300,
        sound_no_fuel =
        {
        {
            filename = "__base__/sound/fight/tank-no-fuel-1.ogg",
            volume = 0.4
        }
        },
        sound_minimum_speed = 0.2,
        sound_scaling_ratio = 0.8,
        vehicle_impact_sound = sounds.generic_impact,
        working_sound =
        {
        sound =
        {
            filename = "__base__/sound/fight/tank-engine.ogg",
            volume = 0.37
        },
        activate_sound =
        {
            filename = "__base__/sound/fight/tank-engine-start.ogg",
            volume = 0.37
        },
        deactivate_sound =
        {
            filename = "__base__/sound/fight/tank-engine-stop.ogg",
            volume = 0.37
        },
        match_speed_to_activity = true
        },
        stop_trigger_speed = 0.1,
        stop_trigger =
        {
        {
            type = "play-sound",
            sound =
            {
            {
                filename = "__base__/sound/fight/tank-brakes.ogg",
                volume = 0.3
            }
            }
        }
        },
        open_sound = { filename = "__base__/sound/fight/tank-door-open.ogg", volume=0.48 },
        close_sound = { filename = "__base__/sound/fight/tank-door-close.ogg", volume = 0.43 },
        rotation_speed = 0.0030,
        tank_driving = true,
        weight = 25000,
        inventory_size = 120,
        track_particle_triggers = movement_triggers.tank,
        guns = { "t1atom-cannon", "t1atom-cannon-b", "tank-machine-gun", "tank-flamethrower" },
        water_reflection = car_reflection(1.2)
    },

    
})