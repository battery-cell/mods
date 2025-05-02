local utils = require("utils")
local modname = "__kj_fordmustang__"
local main_sounds = table.deepcopy(data.raw["car"]["car"].working_sound.main_sounds)
main_sounds[2].sound = {filename = "__kj_fordmustang__/sounds/engine.ogg", volume = 0.4}
main_sounds[2].activity_to_volume_modifiers.multiplier = 1
main_sounds[2].activity_to_volume_modifiers.offset = 0

data:extend({
  {
    type = "car",
    name = "kj_fordmustang",
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
	  equipment_grid = "kj_fordmustang",
    collision_box = {{-1.1, -3}, {1.1, 3}},
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
          position = {0.6, 2.5},
          starting_frame = 0,
          starting_frame_deviation = 60,
        },
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {-0.6, 2.5},
          starting_frame = 0,
          starting_frame_deviation = 60,
        },
      }
    },
    light =
    {
      utils.lights(3,   2, {x =-0.9, y =-2.5}),
      utils.lights(3,   2, {x = 0.9, y =-2.5}),
      utils.lights(3, 1.5, {x =-0.9, y = 2.5}, 0.2, 0.5, {r = 1, g = 0, b = 0}),
      utils.lights(3, 1.5, {x = 0.9, y = 2.5}, 0.2, 0.5, {r = 1, g = 0, b = 0}),
    },
    light_animation = {
      layers = {
        utils.layerMaker(modname, "", "mustang", 600, {1,2}, {8,8}, 2, 3),
      },
    },
    animation =  {
      layers = {
        utils.layerMaker(modname, "", "mustang", 600, {2,1}, {2,8}, 16, 1),
        utils.layerMaker(modname, "", "mustang", 600, {1,2}, {8,8}, 2, 2),
      }
    },
    working_sound =
    {
      main_sounds = main_sounds,
      activate_sound = {filename = "__kj_fordmustang__/sounds/engine-start.ogg", volume = 0.4},
      deactivate_sound = {filename = "__kj_fordmustang__/sounds/engine-stop.ogg", volume = 0.4},
    },
  },
})