local utils = require("utils")
local modname = "__kj_aventador__"
local main_sounds = table.deepcopy(data.raw["car"]["car"].working_sound.main_sounds)
main_sounds[2].sound = {filename = "__kj_aventador__/sounds/engine.ogg", volume = 0.55}
main_sounds[2].activity_to_volume_modifiers.multiplier = 1.3
main_sounds[2].activity_to_volume_modifiers.minimum = 0.3
main_sounds[2].fade_in_ticks = 30

data:extend({
  {
    type = "car",
    name = "kj_aventador",
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.3, -3}, {1.3, 3}},
    selection_box = {{-1.3, -3}, {1.3, 3}},
    stop_trigger = utils.brakes("car"),
    is_military_target = false,
    allow_remote_driving = false,

	  energy_source =
    {
	    type = "burner",
      fuel_categories = {"kj_gas_can"},
      effectivity = 1,
      fuel_inventory_size = 2,
	    burnt_inventory_size = 1,
      smoke =
      {
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {0.5, 2.3},
          starting_frame = 0,
          starting_frame_deviation = 60,
        },
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {-0.5, 2.3},
          starting_frame = 0,
          starting_frame_deviation = 60,
        },
      }
    },
    light =
    {
      utils.lights(3,  2, {x = -1, y =-2.5}),
      utils.lights(3,  2, {x =  1, y =-2.5}),
      utils.lights(3,1.5, {x = -1, y = 1}, 0.3, 0.5, {r = 1, g = 0, b = 0}),
      utils.lights(3,1.5, {x =  1, y = 1}, 0.3, 0.5, {r = 1, g = 0, b = 0}),
    },
    light_animation = {
      layers = {
        utils.layerMaker(modname, "", "aventador", 704, {1,2}, {8,8}, 2, 3),
      }
    },
    animation = {
      layers = {
        utils.layerMaker(modname, "", "aventador", 704, {2, 1}, {2, 8}, 16, 1),
        utils.layerMaker(modname, "", "aventador", 704, {1, 2}, {8, 8}, 2, 2),
      }
    },
    working_sound =
    {
      main_sounds = main_sounds,
      activate_sound = {filename = "__kj_aventador__/sounds/engine-start.ogg", volume = 0.4},
      deactivate_sound = {filename = "__kj_aventador__/sounds/engine-stop.ogg", volume = 0.4},
    },
  },
})
