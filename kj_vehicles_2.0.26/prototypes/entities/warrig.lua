local utils = require("utils")
local modname = "__kj_warrig__"
local main_sounds = table.deepcopy(data.raw["car"]["car"].working_sound.main_sounds)
main_sounds[2].sound = {filename = modname.."/sounds/engine.ogg", volume = 0.7}
main_sounds[2].fade_in_ticks = 90
main_sounds[2].activity_to_volume_modifiers.multiplier = 1.5
main_sounds[2].activity_to_volume_modifiers.minimum = 0.5

data:extend({
	{
		type = "car",
		name = "kj_warrig",
		corpse = "medium-remnants",
		dying_explosion = "oil-refinery-explosion",
		equipment_grid = "large-equipment-grid",
		collision_box 	= {{-1.44, -5  }, {1.44, 5  }},
		selection_box 	= {{-1.44, -5  }, {1.44, 5  }},
		sticker_box 	= {{-1.44, -1.6}, {1.44, 1.6}},
		energy_source =
		{
			type = "burner",
			fuel_categories = {"kj_gas_barrel"},
			effectivity = 1,
			fuel_inventory_size = 3,
			burnt_inventory_size = 3,
			smoke =
			{
				{
					name = "kj_warrig_smoke",
					deviation = {0.25, 0.25},
					frequency = 100,
					height = 2.75,
					position = {-1.25, 2},
					starting_frame = 0,
					starting_frame_deviation = 60,
				},
				{
					name = "kj_warrig_smoke",
					deviation = {0.25, 0.25},
					frequency = 100,
					height = 2.75,
					position = {1.25, 2},
					starting_frame = 0,
					starting_frame_deviation = 60,
				},
			}
		},
		light =
		{
			utils.lights(3, 2, {x = -0.9, y =-3}),
			utils.lights(3, 2, {x =  0.9, y =-3}),
		},
		light_animation =
		{
			layers =
			{
				utils.layerMaker(modname, "warrig", "warrig", 962, {1, 3}, {8, 8}, 2, 3),
			},
		},
		animation =
		{
			layers =
			{
				utils.layerMaker(modname, "warrig", "warrig", 962, {3, 1}, {3, 8}, 16, 1),
				utils.layerMaker(modname, "warrig", "warrig", 962, {1, 3}, {8, 8}, 2, 2),
			}
		},
		stop_trigger =
		{
			{
				type = "play-sound",
				sound =
				{
					{
						filename = "__kj_warrig__/sounds/brakes.ogg",
						volume = 0.6
					},
				}
			},
		},
		working_sound =
		{
			main_sounds = main_sounds,
			activate_sound = {filename = "__kj_warrig__/sounds/engine-start.ogg", volume = 0.7},
			deactivate_sound = {filename = "__kj_warrig__/sounds/engine-stop.ogg", volume = 0.7},
		},
		open_sound = data.raw["car"]["tank"].open_sound,
	},
})

