local utils = require("utils")
local modname = "__kj_swspeeder__"

data:extend({
  {
    type = "car",
    name = "kj_swspeeder",
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg",volume = 0.8},
    corpse = "small-remnants",
    dying_explosion = "big-explosion",
	  immune_to_cliff_impacts = false,
    collision_box 	= {{-0.2, -1.5}, {0.2, 1.5}},
    selection_box 	= {{-0.5, -1.5}, {0.5, 1.5}},
    sticker_box 	= {{-0.5, -0.5}, {0.5, 0.5}},
    darkness_to_render_light_animation = -100,
	  tank_driving = true,
    guns = {"kj_speeder_gun"},
    is_military_target = true,
    allow_remote_driving = false,

	  energy_source =
    {
      type = "burner",
      fuel_categories = {"kj_energy_cell"},
      effectivity = 1,
      fuel_inventory_size = 1,
      burnt_inventory_size = 1,
    },
    light =
    {
      utils.lights(3, 0.5, {x = 0, y =-2}, 3),
    },
    light_animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "swspeeder_scout", 500, {1,1}, {8,8}, 2, 1, {0,0}),
        utils.layerMaker(modname, "", "swspeeder_scout", 500, {1,1}, {8,8}, 2, 2, {0,0}),
      },
    },
    animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "swspeeder", 500, {1,1}, {8,8}, 2, 1, {0,0}),
        utils.layerMaker(modname, "", "swspeeder", 500, {1,1}, {8,8}, 2, 2, {0,0}),
      }
    },
    working_sound =
    {
      main_sounds =
      {
        {
          sound = {filename = "__kj_swspeeder__/sounds/engine.ogg", volume = 0.25},
          --fade_in_ticks = 22,
          match_speed_to_activity = true,
          activity_to_speed_modifiers =
          {
            multiplier = 0.75,
            minimum = 1.0,
            maximum = 2,
            offset = 0,
          }
        },
      },
      activate_sound = {filename = "__kj_swspeeder__/sounds/engine-start.ogg", volume = 0.305},
      deactivate_sound = {filename = "__kj_swspeeder__/sounds/engine-stop.ogg",volume = 0.25},
    },
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.5},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.5},
  },
})

