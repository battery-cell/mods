local utils = require("utils")
local modname = "__kj_rattetank_graphics__"

local base          = utils.layerMaker(modname, "", "ratte", 2000, {1,1,64}, {2,2}, 16, 1, nil, nil, nil, nil, 1)
local baseShadow    = utils.layerMaker(modname, "", "ratte", 2000, {1,1,64}, {2,2}, 16, 2, nil, nil, nil, nil, 1)
local turret        = utils.layerMaker(modname, "", "ratte", 2000, {1,1,64}, {2,2}, 16, 4, nil, nil, nil, nil, 1)
local turretShadow  = utils.layerMaker(modname, "", "ratte", 2000, {1,1,64}, {2,2}, 16, 5, nil, nil, nil, nil, 1)

if mods["kj_rattetank_graphics"] and settings.startup["kj_rattetank_hr"].value == true then
	log("Graphics exist, HR is activated")
  base          = utils.layerMaker(modname, "", "hr_ratte", 4000, {1,1,64}, {2,2}, 16, 1)
  baseShadow    = utils.layerMaker(modname, "", "hr_ratte", 4000, {1,1,64}, {2,2}, 16, 2)
  turret        = utils.layerMaker(modname, "", "hr_ratte", 4000, {1,1,64}, {2,2}, 16, 4)
  turretShadow  = utils.layerMaker(modname, "", "hr_ratte", 4000, {1,1,64}, {2,2}, 16, 5)
end

data:extend({
  {
    type = "car",
    name = "kj_rattetank",
    corpse = "big-remnants",
    dying_explosion = "rocket-silo-explosion",
    equipment_grid = "kj_rattetank",
    render_layer = "higher-object-under",
    collision_box = {{-6.1, -10}, {6.1, 10}},
    selection_box = {{-6.0, -10}, {6.0, 10}},
    sticker_box = {{-3, -3}, {3, 3}},
	  drawing_box_vertical_extension = 3,
    stop_trigger = utils.brakes("tank"),
    tank_driving = true,
    turret_return_timeout = 600,
	  has_belt_immunity = true,
    guns = {"kj_280SKC34"},
    is_military_target = true,
    allow_remote_driving = true,

	  energy_source = {
		  type = "burner",
      fuel_categories = {"kj_gas_barrel"},
      effectivity = 1,
      fuel_inventory_size = 8,
      burnt_inventory_size = 8,
      smoke =
      {
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {-2, 5},
          starting_frame = 0,
          starting_frame_deviation = 60
        },
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {2, 5},
          starting_frame = 0,
          starting_frame_deviation = 60
        },
      }
    },
    light =
    {
      utils.lights(3, 2, {x =-4, y = -12}),
      utils.lights(3, 2, {x = 4, y = -12}),
    },
	  animation =
    {
      layers =
      {
        base,
        baseShadow,
      }
    },
	  turret_animation =
    {
      layers =
      {
        turret,
        turretShadow,
      }
    },
    working_sound =
    {
      main_sounds =
      {
        {
          sound = {filename = "__base__/sound/fight/tank-engine-driving.ogg", volume = 0.35, modifiers = volume_multiplier("main-menu", 1.3)},
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {
            multiplier = 4.5,
            offset = 1.0,
          },
          match_speed_to_activity = true,
          activity_to_speed_modifiers = {
            multiplier = 3.0,
            minimum = 1.0,
            maximum = 1.2,
            offset = 0.8
          }
        },
        {
          sound = {filename = "__base__/sound/fight/tank-tracks.ogg", volume = 0.35, speed = 0.5, modifiers = volume_multiplier("main-menu", 1.3)},
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {
            multiplier = 20,
            minimum = 0,
            maximum = 3,
            offset = 1.0,
          },
        },
        {
          sound = {filename = "__kj_rattetank__/sounds/engine.ogg", volume = 0.55},
          match_volume_to_activity = true,
          --fade_in_ticks = 22,
          --fade_out_ticks = 4,
          activity_to_volume_modifiers = {
            --multiplier = 1.3,
            --offset = 1.3,
            inverted = true,
            minimum = 0.75,
          }
        },
      },
      activate_sound = {filename = "__kj_rattetank__/sounds/engine-start.ogg", volume = 0.55},
      deactivate_sound = {filename = "__kj_rattetank__/sounds/engine-stop.ogg", volume = 0.55},
    },
  },
})
