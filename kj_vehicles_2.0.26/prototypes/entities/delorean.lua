local utils = require("utils")
local modname = "__kj_delorean__"
local main_sounds = table.deepcopy(data.raw["car"]["car"].working_sound.main_sounds)
main_sounds[2].sound = {filename = "__kj_delorean__/sounds/engine.ogg", volume = 0.8}

data:extend({
  {
    type = "car",
    name = "kj_delorean",
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
	  equipment_grid = "kj_delorean",
    collision_box = {{-1.1, -2.3}, {1.1, 2.3}},
    selection_box = {{-0.9, -2}, {0.9, 2}},
    stop_trigger = utils.brakes("car"),
    is_military_target = false,
    allow_remote_driving = false,

	  energy_source =
    {
	    type = "burner",
      fuel_categories = {"kj_gas_can"},
      effectivity = 1,
      fuel_inventory_size = 1,
	    burnt_inventory_size = 1,
      smoke =
      {
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {0.7, 2.25},
          starting_frame = 0,
          starting_frame_deviation = 60,
        },
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {-0.7, 2.25},
          starting_frame = 0,
          starting_frame_deviation = 60,
        },
      }
    },
    light =
    {
      utils.lights(3,  2, {x =-0.8, y =-2}),
      utils.lights(3,  2, {x = 0.8, y =-2}),
      utils.lights(3,1.5, {x =-0.6, y = 1.5}, 0.2, 0.5, {r = 1, g = 0, b = 0}),
      utils.lights(3,1.5, {x = 0.6, y = 1.5}, 0.2, 0.5, {r = 1, g = 0, b = 0}),
  	},
    light_animation = {
      layers = {
        utils.layerMaker(modname, "", "delorean", 500, {1,1}, {8,8}, 2, 3),
      }
    },
    animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "delorean", 500, {1,1}, {8,8}, 2, 1),
        utils.layerMaker(modname, "", "delorean", 500, {1,1}, {8,8}, 2, 2),
      }
    },
    working_sound =
    {
      main_sounds = main_sounds,
      activate_sound = {filename = "__kj_delorean__/sounds/engine-start.ogg", volume = 0.8},
      deactivate_sound = {filename = "__kj_delorean__/sounds/engine-stop.ogg", volume = 0.8},
    },
  },
})