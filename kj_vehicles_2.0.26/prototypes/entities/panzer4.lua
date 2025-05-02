local utils = require("utils")
local modname = "__kj_panzer4__"
local main_sounds = table.deepcopy(data.raw["car"]["tank"].working_sound.main_sounds)
main_sounds[2].activity_to_volume_modifiers.multiplier = 6

data:extend({
  {
    type = "car",
    name = "kj_panzer4",
    corpse = "big-remnants",
    dying_explosion = "massive-explosion",
    equipment_grid = "kj_panzer4",
    collision_box = {{-1.2, -2}, {1.2, 2}},
    selection_box = {{-1.2, -2}, {1.2, 2}},
    sticker_box = {{-1, -1}, {1, 1}},
    stop_trigger = utils.brakes("tank"),
    tank_driving = true,
    turret_return_timeout = 360,
	  has_belt_immunity = true,
    guns = {"kj_75kwk40", "kj_mg34"},
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
      utils.lights(3, 2, {x =-0.9, y = -2.5}),
      utils.lights(3, 2, {x = 0.9, y = -2.5}),
    },
    animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "panzer4", 720, {2,1}, {2,8}, 16, 1),
        utils.layerMaker(modname, "", "panzer4", 720, {1,2}, {8,8},  2, 2),
	  },
    },
	  turret_animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "panzer4", 720, {1,1}, {8,8}, 2, 4),
        utils.layerMaker(modname, "", "panzer4", 720, {1,1}, {8,8}, 2, 5),
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
    open_sound = { filename = "__base__/sound/fight/tank-door-open.ogg", volume=0.48 },
    close_sound = { filename = "__base__/sound/fight/tank-door-close.ogg", volume = 0.43 },
  },
})