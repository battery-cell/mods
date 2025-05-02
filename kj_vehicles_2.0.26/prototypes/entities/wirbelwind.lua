local utils = require("utils")
local modname = "__kj_wirbelwind__"
local main_sounds = table.deepcopy(data.raw["car"]["tank"].working_sound.main_sounds)
main_sounds[2].activity_to_volume_modifiers.multiplier = 6

data:extend({
  {
    type = "car",
    name = "kj_wirbelwind",
    corpse = "big-remnants",
    dying_explosion = "massive-explosion",
	  equipment_grid = "kj_wirbelwind",
    collision_box = {{-1.2, -2}, {1.2, 2}},
    selection_box = {{-1.2, -2}, {1.2, 2}},
    sticker_box = {{-1, -1}, {1, 1}},
		drawing_box_vertical_extension = 0.5,
    stop_trigger = utils.brakes("tank"),
    tank_driving = true,
    turret_return_timeout = 180,
	  has_belt_immunity = true,
    guns = {"kj_2cmfv"},
    is_military_target = true,
    allow_remote_driving = true,

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
          position = {0, 0.9},
          starting_frame = 0,
          starting_frame_deviation = 60
        },
      }
    },
    light =
    {
      utils.lights(3, 2, {x =-0.9, y =-2.5}),
      utils.lights(3, 2, {x = 0.9, y =-2.5}),
    },
    animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "wirbelwind", 720, {1,1}, {8,8}, 2, 4),
        utils.layerMaker(modname, "", "wirbelwind", 720, {1,1}, {8,8}, 2, 5),
	    },
    },
	  turret_animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "wirbelwind", 720, {1,1}, {8,8}, 2, 4),
        utils.layerMaker(modname, "", "wirbelwind", 720, {1,1}, {8,8}, 2, 5),
	    },
    },
    working_sound =
    {
      main_sounds = main_sounds,
      activate_sound = {filename = "__base__/sound/fight/tank-engine-start.ogg", volume = 0.37},
      deactivate_sound = {filename = "__base__/sound/fight/tank-engine-stop.ogg", volume = 0.37},
    },
    sound_no_fuel =
    {
      {
        filename = "__base__/sound/fight/tank-no-fuel-1.ogg",
        volume = 0.4
      }
    },
    open_sound = { filename = "__base__/sound/fight/tank-door-open.ogg", volume = 0.48 },
    close_sound = { filename = "__base__/sound/fight/tank-door-close.ogg", volume = 0.43 },
  },
})

data.raw["car"]["kj_wirbelwind"].animation = data.raw["car"]["kj_panzer4"].animation