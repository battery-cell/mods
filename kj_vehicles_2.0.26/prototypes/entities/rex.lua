local utils = require("utils")
local modname = "__kj_rex__"

data:extend({
	{
		type = "car",
		name = "kj_rex",
		corpse = "big-remnants",
		dying_explosion = "nuke-explosion",
		equipment_grid = "kj_rex",
		collision_box = {{-3, -3}, {3, 3}},
		selection_box = {{-3, -3}, {3, 3}},
		sticker_box = {{-1, -1}, {1, 1}},
		drawing_box_vertical_extension = 12,
		stop_trigger = utils.brakes("tank"),
		tank_driving = true,
		turret_return_timeout = 60,
		has_belt_immunity = true,
		guns = {"kj_rex_cannon", "kj_rex_mg", "kj_rex_rocket"},

		energy_source =
		{
			type = "burner",
			fuel_categories = {"kj_gas_barrel"},
			effectivity = 1,
			fuel_inventory_size = 5,
			burnt_inventory_size = 3,
		},
		turret_animation =
		{
			layers =
			{
				utils.layerMaker(modname, "", "rex", 2000, {2,1}, {2,2}, 64, 1, {0,0}, 0.5, nil, nil, 1),
				utils.layerMaker(modname, "", "rex", 2000, {2,1}, {2,2}, 64, 2, {0,0}, 0.5, nil, nil, 1),
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
				sound = {filename = "__kj_rex__/sounds/engine.ogg", volume = 0.37 },
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
			activate_sound = {filename = "__kj_rex__/sounds/engine-start.ogg", volume = 0.37},
			deactivate_sound = {filename = "__kj_rex__/sounds/engine-stop.ogg", volume = 0.37},
		},]]
	},
})