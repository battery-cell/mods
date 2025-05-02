local utils = require("utils")
local modname = "__kj_bulldozer__"
local main_sounds = table.deepcopy(data.raw["car"]["tank"].working_sound.main_sounds)
main_sounds[3].sound = {filename = "__kj_bulldozer__/sounds/engine.ogg", volume = 0.7}
main_sounds[3].fade_in_ticks = 90
main_sounds[3].fade_out_ticks = 0

data:extend({
  {
    type = "car",
    name = "kj_bulldozer",
    corpse = "medium-remnants",
    dying_explosion = "oil-refinery-explosion",
	  equipment_grid = "medium-equipment-grid",
    collision_box = {{-1.5, -3.0}, {1.5, 3.0}},
    selection_box = {{-1.5, -3.0}, {1.5, 3.0}},
	  drawing_box_vertical_extension = 1,
    stop_trigger = utils.brakes("tank"),
    tank_driving = true,
    guns = {"kj_bulldozer_gun"},
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
          deviation = {0.1, 0.1},
          frequency = 50,
          position = {-0.4, -0.6},
		      height = 2.4,
          starting_frame = 0,
          starting_frame_deviation = 60,
        },
      }
    },
    light =
    {
      utils.lights(3,  2, {x = -1, y =-3}),
      utils.lights(3,  2, {x =  1, y =-3}),
      utils.lights(3,1.5, {x = -1, y = 2}, 0.5, 0.5, {r = 1, g = 0, b = 0}),
      utils.lights(3,1.5, {x =  1, y = 2}, 0.5, 0.5, {r = 1, g = 0, b = 0}),
    },
	  light_animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "bulldozer", 750, {1,3}, {1,4}, 32, 3),
      }
    },
	  animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "bulldozer", 750, {1,3}, {1,4}, 32, 1),
        utils.layerMaker(modname, "", "bulldozer_chain", 750, {3,1}, {3,4}, 32, 1),
        utils.layerMaker(modname, "", "bulldozer", 750, {1,3}, {1,4}, 32, 2),
      }
    },
    working_sound =
    {
      main_sounds = main_sounds,
      activate_sound = {filename = "__kj_bulldozer__/sounds/engine-start.ogg", volume = 0.5},
      deactivate_sound = {filename = "__kj_bulldozer__/sounds/engine-stop.ogg", volume = 0.3},
    },
    open_sound = {filename = "__base__/sound/fight/tank-door-open.ogg", volume = 0.48},
    close_sound = {filename = "__base__/sound/fight/tank-door-close.ogg", volume = 0.43},
  },
})