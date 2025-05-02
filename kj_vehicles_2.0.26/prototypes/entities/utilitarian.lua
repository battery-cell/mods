local utils = require("utils")
local modname = "__kj_utilitarian__"
local main_sounds = table.deepcopy(data.raw["car"]["car"].working_sound.main_sounds)
main_sounds[2].sound = {filename = "__kj_utilitarian__/sounds/engine.ogg", volume = 0.4}

data:extend({
  {
    type = "car",
    name = "kj_utilitarian",
    corpse = "medium-remnants",
    dying_explosion = "oil-refinery-explosion",
	  equipment_grid = "large-equipment-grid",
    collision_box = {{-1.8, -3.5}, {1.8, 3.5}},
    selection_box = {{-1.8, -2.5}, {1.8, 2.5}},
		drawing_box_vertical_extension = 1,
    stop_trigger = utils.brakes("tank"),
    is_military_target = false,
    allow_remote_driving = false,

	  energy_source =
    {
	    type = "burner",
      fuel_categories = {"kj_gas_barrel"},
      effectivity = 1,
      fuel_inventory_size = 2,
	    burnt_inventory_size = 1,
      smoke =
      {
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          north_position = {-0.6, -2.2},
          south_position = {-0.6, -2.2},
          east_position = {0, -2.6},
          west_position = {0, -2.6},
		      --offset = 2.2,
          starting_frame = 0,
          starting_frame_deviation = 60,
        },
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          north_position = {0.6, -2.2},
          south_position = {0.6, -2.2},
          east_position = {0, -1.8},
          west_position = {0, -1.8},
		      --offset = 2.2,
          starting_frame = 0,
          starting_frame_deviation = 60,
        },
      }
    },
    light =
    {
      utils.lights(3, 2, {x =-0.9, y = -3.5}),
      utils.lights(3, 2, {x =   0, y = -3.5}),
      utils.lights(3, 2, {x = 0.9, y = -3.5}),
      utils.lights(3, 2, {x =-0.9, y = 2}, 0.2, 0.5, {r = 1, g = 0, b = 0}),
      utils.lights(3, 2, {x =   0, y = 2}, 0.2, 0.5, {r = 1, g = 0, b = 0}),
      utils.lights(3, 2, {x = 0.9, y = 2}, 0.2, 0.5, {r = 1, g = 0, b = 0}),
    },
    light_animation =
    {
        layers =
        {
          utils.layerMaker(modname, "", "utilitarian", 800, {1,3}, {8,8}, 2, 3),
        }
    },
	  animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "utilitarian", 800, {3,1}, {3,8}, 16, 1, nil, 1, nil, "backward"),
        utils.layerMaker(modname, "", "utilitarian", 800, {1,3}, {8,8}, 2, 2),
      }
    },
    working_sound =
    {
      main_sounds = main_sounds,
      activate_sound = {filename = "__kj_utilitarian__/sounds/engine-start.ogg", volume = 0.4},
      deactivate_sound = {filename = "__kj_utilitarian__/sounds/engine-stop.ogg", volume = 0.4},
    },
    open_sound = { filename = "__base__/sound/fight/tank-door-open.ogg", volume=0.48 },
    close_sound = { filename = "__base__/sound/fight/tank-door-close.ogg", volume = 0.43 },
  },
})