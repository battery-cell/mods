local utils = require("utils")
local modname = "__kj_firetruck__"
local main_sounds = table.deepcopy(data.raw["car"]["car"].working_sound.main_sounds)
main_sounds[2].sound = {filename = "__kj_firetruck__/sounds/engine.ogg", volume = 0.4}

data:extend({
  {
    type = "car",
    name = "kj_firetruck",
    corpse = "medium-remnants",
    dying_explosion = "oil-refinery-explosion",
	  equipment_grid = "large-equipment-grid",
    collision_box = {{-1.5, -4.5}, {1.5, 4.5}},
    selection_box = {{-1.5, -4.5}, {1.5, 4.5}},
    stop_trigger = utils.brakes("tank"),
    is_military_target = false,
    allow_remote_driving = false,

	  energy_source =
    {
	    type = "burner",
      fuel_categories = {"kj_gas_can"},
      effectivity = 1.5,
      fuel_inventory_size = 3,
	    burnt_inventory_size = 3,
      smoke =
      {
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {1.5, 1.5},
          starting_frame = 0,
          starting_frame_deviation = 60
        },
      }
    },
    light =
    {
      utils.lights(3,   2, {x =-0.8, y =-4}),
      utils.lights(3,   2, {x = 0.8, y =-4}),
      utils.lights(3, 1.5, {x =-1.1, y = 4}, 0.2, 0.5, {r = 1, g = 0, b = 0}),
      utils.lights(3, 1.5, {x = 1.1, y = 4}, 0.2, 0.5, {r = 1, g = 0, b = 0}),
    },
    light_animation =
    {
        layers =
        {
          utils.layerMaker(modname, "", "firetruck", 13*64, {1,2}, {8,8}, 2, 3),
        }
    },
	  animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "firetruck", 13*64, {2,1}, {2,8}, 16, 1),
        utils.layerMaker(modname, "", "firetruck", 13*64, {1,2}, {8,8}, 2, 2, {1.15, 0.5}),
      }
    },
    working_sound =
    {
      main_sounds = main_sounds,
      activate_sound = {filename = "__kj_firetruck__/sounds/engine-start.ogg", volume = 0.4},
      deactivate_sound = {filename = "__kj_firetruck__/sounds/engine-stop.ogg", volume = 0.4},
    },
    open_sound = {filename = "__base__/sound/fight/tank-door-open.ogg", volume = 0.48},
    close_sound = {filename = "__base__/sound/fight/tank-door-close.ogg", volume = 0.43},
  },
})
