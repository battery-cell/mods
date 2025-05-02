local utils = require("utils")
local modname = "__kj_cybertruck__"

data:extend({
  {
    type = "car",
    name = "kj_cybertruck",
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
	  equipment_grid = "kj_cybertruck",
    collision_box = {{-1.1, -3}, {1.1, 3}},
    selection_box = {{-1.5, -3.1}, {1.5, 3.1}},
    stop_trigger = utils.brakes("tank"),
    is_military_target = false,
    allow_remote_driving = false,

	  energy_source =
    {
	    type = "burner",
      fuel_categories = {"kj_el_car_fuel"},
      effectivity = 1,
      fuel_inventory_size = 1,
	    burnt_inventory_size = 1,
    },
    light =
    {
      utils.lights(3, 2,   {x =-0.9, y =-2.5}),
      utils.lights(3, 2,   {x = 0  , y =-2.5}),
      utils.lights(3, 2,   {x = 0.9, y =-2.5}),
      utils.lights(3, 1.5, {x =-0.9, y = 2}, 0.2, 0.5, {r = 1, g = 0, b = 0}),
      utils.lights(3, 1.5, {x = 0,   y = 2}, 0.2, 0.5, {r = 1, g = 0, b = 0}),
      utils.lights(3, 1.5, {x = 0.9, y = 2}, 0.2, 0.5, {r = 1, g = 0, b = 0}),
    },
    light_animation = {
      layers = {
        utils.layerMaker(modname, "", "cybertruck", 700, {1,2}, {8,8}, 2, 3),
      }
    },
    animation = {
      layers = {
        utils.layerMaker(modname, "", "cybertruck", 700, {2,1}, {2,8}, 16, 1),
        utils.layerMaker(modname, "", "cybertruck", 700, {1,2}, {8,8}, 2, 2),
      }
    },
    working_sound =
    {
      main_sounds =
      {
        sound = {filename = "__kj_cybertruck__/sounds/engine.ogg", volume = 0.6},
        match_volume_to_activity = true,
        activity_to_volume_modifiers =
        {
          multiplier = 1.8,
          offset = 0.95,
          minimum = 1.0,
        },
        match_speed_to_activity = true,
        activity_to_speed_modifiers =
        {
          --multiplier = 0.8,
          minimum = 1.0,
          maximum = 3,
          --offset = 1,
        }
      },
      activate_sound = {filename = "__kj_cybertruck__/sounds/engine-start.ogg", volume = 0.6},
      deactivate_sound = {filename = "__kj_cybertruck__/sounds/engine-stop.ogg", volume = 0.6},
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume = 0.7 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
  },
})