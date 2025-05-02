local utils = require("utils")
local modname = "__kj_2a6__"

data:extend({
  {
    type = "car",
    name = "kj_2a6",
    corpse = "big-remnants",
    dying_explosion = "oil-refinery-explosion",
	  equipment_grid = "kj_2a6",
    collision_box = {{-1.75, -3.5}, {1.75, 3.5}},
    selection_box = {{-1.75, -3}, {1.75, 3}},
    sticker_box = {{-1, -1}, {1, 1}},
    stop_trigger = utils.brakes("tank"),
    tank_driving = true,
    turret_return_timeout = 300,
	  has_belt_immunity = true,
    guns = {"kj_rh120", "kj_mg3"},
    is_military_target = true,
    allow_remote_driving = true,

	  energy_source =
    {
      type = "burner",
      fuel_categories = {"kj_gas_can"},
      effectivity = 2,
      fuel_inventory_size = 3,
  	  burnt_inventory_size = 2,
    },
    light =
    {
      utils.lights(3, 2, {x = -0.9, y =-3}),
      utils.lights(3, 2, {x =  0.9, y =-3}),
      utils.lights(3, 2, {x =  1.2, y = 3}, 0.2, 0.5, {r = 1, g = 0, b = 0}),
      utils.lights(3, 2, {x = -1.2, y = 3}, 0.2, 0.5, {r = 1, g = 0, b = 0}),
    },
    light_animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "2a6", 960, {1, 2}, {8, 8}, 2, 3, nil),
	    },
	  },
    animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "2a6", 960, {2, 1}, {2, 8}, 16, 1, nil),
        utils.layerMaker(modname, "", "2a6", 960, {1, 2}, {8, 8},  2, 2, nil),
      }
    },
	  turret_animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "2a6", 960, {1, 1}, {8, 8}, 2, 4, nil),
        utils.layerMaker(modname, "", "2a6", 960, {1, 1}, {8, 8}, 2, 5, nil),
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
          sound = {filename = "__base__/sound/fight/tank-tracks.ogg", volume = 0.35, modifiers = volume_multiplier("main-menu", 1.3)},
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {
            multiplier = 4.5,
            offset = 1.0,
          },
        },
        {
          sound = {filename = "__kj_2a6__/sounds/engine.ogg", volume = 0.37 },
          match_speed_to_activity = true,
          activity_to_speed_modifiers = {
            multiplier = 0.9,
            minimum = 1.0,
            maximum = 1.5,
            --offset = 0.8
          },
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
      activate_sound = {filename = "__kj_2a6__/sounds/engine-start.ogg", volume = 0.25},
      deactivate_sound = {filename = "__kj_2a6__/sounds/engine-stop.ogg", volume = 0.25},
    },
  },
})