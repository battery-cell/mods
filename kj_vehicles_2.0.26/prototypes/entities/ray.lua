local utils = require("utils")
local modname = "__kj_ray__"

data:extend({
	{
		type = "car",
		name = "kj_ray",
		corpse = "big-remnants",
		localised_name = {"", {"entity-name.kj_ray"}},
		localised_description = {"", {"entity-description.kj_ray"}},
		dying_explosion = "nuke-explosion",
		equipment_grid = "kj_ray",
		collision_mask = {layers = {out_of_map = true}},
		collision_box = {{-6, -3}, {6, 3}},
		selection_box = {{-6, -3}, {6, 3}},
		sticker_box = {{-1, -1}, {1, 1}},
		drawing_box_vertical_extension = 12,
		render_layer = "higher-object-under",
		stop_trigger = utils.brakes("tank"),
		tank_driving = true,
		turret_return_timeout = 60,
		has_belt_immunity = true,
		guns = {"kj_ray_cannon", "kj_ray_mg", "kj_ray_rocket"},
		is_military_target = true,
		allow_remote_driving = false,

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
				  name = "kj_ray_splash",
				  deviation = {0.5, 0.5},
				  frequency = 40,
				  position = {-4.5,1.5},
				  starting_frame = 6,
				  starting_frame_deviation = 6,
				  --height = -0.1,
				  --height_deviation = 0.2
				},
				{
				  name = "kj_ray_splash",
				  deviation = {0.5, 0.5},
				  frequency = 40,
				  position = {4.5,1.5},
				  starting_frame = 6,
				  starting_frame_deviation = 6,
				  --height = -0.1,
				  --height_deviation = 0.2
				},
				{
				  name = "kj_ray_splash",
				  deviation = {0.5, 0.5},
				  frequency = 40,
				  position = {-5,0},
				  starting_frame = 6,
				  starting_frame_deviation = 6,
				  --height = -0.1,
				  --height_deviation = 0.2
				},
				{
				  name = "kj_ray_splash",
				  deviation = {0.5, 0.5},
				  frequency = 40,
				  position = {5,0},
				  starting_frame = 6,
				  starting_frame_deviation = 6,
				  --height = -0.1,
				  --height_deviation = 0.2
				},
				{
				  name = "kj_ray_splash",
				  deviation = {0.5, 0.5},
				  frequency = 40,
				  position = {-6,-1.5},
				  starting_frame = 6,
				  starting_frame_deviation = 6,
				  --height = -0.1,
				  --height_deviation = 0.2
				},
				{
				  name = "kj_ray_splash",
				  deviation = {0.5, 0.5},
				  frequency = 40,
				  position = {6,-1.5},
				  starting_frame = 6,
				  starting_frame_deviation = 6,
				  --height = -0.1,
				  --height_deviation = 0.2
				},
			},
		},
		turret_animation =
		{
		  layers =
		  {
			utils.layerMaker(modname, "", "ray", 		2000, {1,2,64}, {1,4}, 16, 3, {0,-2.5}, 0.5, nil, nil, 1),
			utils.layerMaker(modname, "", "ray_normal", 2000, {2,1,64}, {2,4}, 16, 1, {0,-2.5}, 0.5, nil, nil, 1),
			utils.layerMaker(modname, "", "ray_top",    2000, {2,1,64}, {2,4}, 16, 1, {0,-2.5}, 0.5, nil, nil, 1),
			utils.layerMaker(modname, "", "ray_normal", 2000, {2,1,64}, {2,4}, 16, 2, {0,-2.5}, 0.5, nil, nil, 1),
			utils.layerMaker(modname, "", "ray_top",    2000, {2,1,64}, {2,4}, 16, 2, {6,-2.5}, 0.5, nil, nil, 1),
		  },
		},
		animation = util.empty_animation(1),
		--[[working_sound =
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
			  sound = {filename = "__kj_ray__/sounds/engine.ogg", volume = 0.37 },
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
		  activate_sound = {filename = "__kj_ray__/sounds/engine-start.ogg", volume = 0.37},
		  deactivate_sound = {filename = "__kj_ray__/sounds/engine-stop.ogg", volume = 0.37},
		},]]
	},
})
