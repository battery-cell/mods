local utils = require("utils")
local modname = "__kj_gigahorse__"
local main_sounds = table.deepcopy(data.raw["car"]["car"].working_sound.main_sounds)
main_sounds[2].sound = {filename = modname.."/sounds/engine.ogg", volume = 0.45}
main_sounds[2].fade_in_ticks = 90
main_sounds[2].activity_to_volume_modifiers.multiplier = 1.5
main_sounds[2].activity_to_volume_modifiers.minimum = 0.5

data:extend({
  {
    type = "car",
    name = "kj_gigahorse",
    corpse = "medium-remnants",
    dying_explosion = "big-explosion",
	  equipment_grid = "medium-equipment-grid",
    collision_box = {{-1.4, -3}, {1.4, 3}},
    selection_box = {{-1.4, -2}, {1.4, 2}},
	  drawing_box_vertical_extension = 1.5,
    darkness_to_render_light_animation = -100,
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
          name = "kj_gigahorse_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {-1.5, 1.9},
		      shift = {0, 0.5},
          starting_frame = 0,
          starting_frame_deviation = 60,
        },
        {
          name = "kj_gigahorse_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {1.5, 1.9},
		      shift = {0, 0.5},
          starting_frame = 0,
          starting_frame_deviation = 60,
        },
      }
    },
    light =
    {
      utils.lights(3,   2, {x =-0.7, y =-2.5}),
      utils.lights(3,   2, {x = 0.7, y =-2.5}),
      utils.lights(3, 1.5, {x =-0.9, y = 1}, 0.35, 0.5, {r = 1, g = 0, b = 0}),
      utils.lights(3, 1.5, {x = 0.9, y = 1}, 0.35, 0.5, {r = 1, g = 0, b = 0}),
	  },
    light_animation =
    {
        layers =
        {
          utils.layerMaker(modname, "", "gigahorse", 1000, {1,2}, {8,8}, 2, 3),
        },
    },
    animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "gigahorse_axis", 1000, {2,1}, {2,8}, 16, 1), --axis
        utils.layerMaker(modname, "", "gigahorse", 1000, {1,2}, {8,8}, 2, 1), --base
        utils.layerMaker(modname, "", "gigahorse", 1000, {2,1}, {2,8}, 16, 2), --shadow
      }
    },
    stop_trigger = utils.brakes("tank"),
    working_sound =
    {
      main_sounds = main_sounds,
      activate_sound = {filename = "__kj_gigahorse__/sounds/engine-start.ogg", volume = 0.4},
      deactivate_sound = {filename = "__kj_gigahorse__/sounds/engine-stop.ogg", volume = 0.45},
    },
  },
})