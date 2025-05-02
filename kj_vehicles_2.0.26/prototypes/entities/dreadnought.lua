local utils = require("utils")
local modname = "__kj_40kdreadnought__"

data:extend({
	{
		type = "car",
		name = "kj_40kdreadnought",
		corpse = "big-remnants",
		dying_explosion = "rocket-silo-explosion",
		equipment_grid = "kj_40kdreadnought",
		collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		sticker_box = {{-1, -1}, {1, 1}},
		drawing_box_vertical_extension = 3,
		stop_trigger = utils.brakes("tank"),
		tank_driving = true,
		turret_return_timeout = 0,
		has_belt_immunity = true,
		guns = {"kj_dreadnought_cannon", "kj_bolter"},
		is_military_target = true,
		allow_remote_driving = true,
		healing_per_tick = 40,
		minimap_representation = {
			filename = "__kj_40kdreadnought__/graphics/equipment/map.png",
			flags = {"icon"},
			size = {128, 128},
			scale = 0.4,
		},
		selected_minimap_representation = {
			filename = "__kj_40kdreadnought__/graphics/equipment/map.png",
			flags = {"icon"},
			size = {128, 128},
			scale = 0.4,
		},

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
					deviation = {0.4, 0.4},
					frequency = 50,
					north_position = { 0.8, -3},
					east_position =  {-0.8, -3.1},
					south_position = { 0.8, -4.1},
					west_position =  { 0.8, -3.1},
					starting_frame = 0,
					starting_frame_deviation = 60
				},
				{
					name = "tank-smoke",
					deviation = {0.4, 0.4},
					frequency = 50,
					north_position = {-0.8, -3},
					east_position =  {-0.8, -4.1},
					south_position = {-0.8, -4.1},
					west_position =  { 0.8, -4.1},
					starting_frame = 0,
					starting_frame_deviation = 60
				},
			}
		},
		light =
		{
			utils.lights(3, 2, {x =-1.4, y = -2}),
			utils.lights(3, 2, {x = 1.4, y = -2}),
		},
		turret_animation =
		{
			layers =
			{
				utils.layerMaker(modname, "", "dreadnought", 1000, {1,1}, {8,8}, 2, 3),
				utils.layerMaker(modname, "", "dreadnought", 1000, {1,1}, {8,8}, 2, 4),
				utils.layerMaker(modname, "shadow", "dreadnought", 1000, {1,1}, {8,8}, 2, 5),
			},
		},
		light_animation =
		{
			layers =
			{
				utils.layerMaker(modname, "", "dreadnought", 1000, {1,4}, {8,8}, 2, 3),
			},
		},
		animation =
		{
			layers =
			{
				utils.layerMaker(modname, "", "dreadnought", 1000, {4,1}, {4,8}, 16, 1, nil, 1),
				utils.layerMaker(modname, "shadow", "dreadnought", 1000, {4,1}, {4,8}, 16, 2, nil, 1),
			}
		},
		working_sound =
		{
			main_sounds =
			{
			  {
				sound = {filename = "__base__/sound/fight/tank-engine-driving.ogg", volume = 0.35, modifiers = volume_multiplier("main-menu", 1.3)},
				match_volume_to_activity = true,
				activity_to_volume_modifiers = {
				  multiplier = 4.5,
				  offset = 1.0,
				},
				match_speed_to_activity = true,
				activity_to_speed_modifiers = {
				  multiplier = 3.0,
				  minimum = 1.0,
				  maximum = 1.2,
				  offset = 0.8
				}
			  },
			  {
				sound = {filename = "__kj_40kdreadnought__/sounds/engine.ogg", volume = 0.37 },
				match_volume_to_activity = true,
				--fade_in_ticks = 22,
				--fade_out_ticks = 4,
				activity_to_volume_modifiers = {
				  --multiplier = 1.3,
				  --offset = 1.3,
				  inverted = true,
				  minimum = 0.75,
				}
			  },
			},
			activate_sound = {filename = "__kj_40kdreadnought__/sounds/engine-start.ogg", volume = 0.37},
			deactivate_sound = {filename = "__kj_40kdreadnought__/sounds/engine-stop.ogg", volume = 0.37},
		},
	},
})
