local tables = require("tables")
local utils = require("utils")
local name = "kj_40kbunker"
local modname = "__kj_40kbunker__"
local sounds = require ("__base__/prototypes/entity/sounds.lua")
local hit_effects = require ("__base__/prototypes/entity/hit-effects")

data:extend({
	{
		type = "car",
		name = "kj_40kbunker",
		max_health = 20000,
		corpse = "big-remnants",
		dying_explosion = "massive-explosion",
		collision_box = {{-4.5, -3.7}, {4.5, 3.7}},
		selection_box = {{-4.5, -3.7}, {4.5, 3.7}},
		sticker_box = {{-0.75, -0.75}, {0.75, 0.75}},
		drawing_box_vertical_extension = 1,
		guns = {"kj_40kbunker_gun"},
		turret_return_timeout = 60,
		has_belt_immunity = true,

		energy_source =
		{
			type = "void",
			render_no_power_icon = false,
		},
		light =
		{
			{
				type = "basic",
				minimum_darkness = 0,
				shift = {0, 0},
				size = 15,
				intensity = 0.8,
				color = {r = 1, g = 1, b = 1},
				source_orientation_offset = 1,
				add_perspective = true,
			},
		},
		animation =
		{
			layers =
			{
				utils.layerMaker(modname, "", "bunker_grid", 1200, {1,1,8}, {2,2}, 2, 1),
				utils.layerMaker(modname, "", "bunker_grid", 1200, {1,1,8}, {2,2}, 2, 2),
			},
		},

		light_animation =
		{
		  layers =
			{
				utils.layerMaker(modname, "", "bunker", 1200, {1,1,8}, {2,2}, 2, 3, nil, nil, {r = 0, g = 1, b = 0, a = 1}),
			}
		},

		open_sound  = {filename = "__base__/sound/artillery-open.ogg",  volume = 0.7},
		close_sound = {filename = "__base__/sound/artillery-close.ogg", volume = 0.7},
	},

	{
		type = "ammo-turret",
		name = "kj_40kbunker_turret",
		icon = "__kj_40kbunker__/graphics/icon.png",
		icon_size = 128,
		flags = {"placeable-neutral", "player-creation", "not-flammable"},
		minable = {mining_time = 15, result = "kj_40kbunker"},
		mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
		max_health = tables.entityData.max_health[name],
		corpse = "big-remnants",
		resistances =
		{
			{
				type = "fire",
				decrease = tables.entityData.resistances[name][1][1],
				percent  = tables.entityData.resistances[name][1][2]
			},
			{
				type = "physical",
				decrease = tables.entityData.resistances[name][2][1],
				percent  = tables.entityData.resistances[name][2][2]
			},
			{
				type = "impact",
				decrease = tables.entityData.resistances[name][3][1],
				percent  = tables.entityData.resistances[name][3][2]
			},
			{
				type = "explosion",
				decrease = tables.entityData.resistances[name][4][1],
				percent  = tables.entityData.resistances[name][4][2]
			},
			{
				type = "acid",
				decrease = tables.entityData.resistances[name][5][1],
				percent  = tables.entityData.resistances[name][5][2]
			},
		},
		dying_explosion = "massive-explosion",
		collision_box = {{-4.5, -4.5}, {4.5, 4.5}},
		selection_box = {{-4.5, -3.7}, {4.5, 3.7}},
		sticker_box = {{-0.75, -0.75}, {0.75, 0.75}},
		damaged_trigger_effect = hit_effects.entity(),
		rotation_speed = 1,
		preparing_speed = 1,
		folding_speed = 1,
		inventory_size = 3,
		automated_ammo_count = 10,
		attacking_speed = 0.5,
		alert_when_attacking = true,
		open_sound = {filename = "__base__/sound/artillery-open.ogg", volume = 0.7},
		close_sound = {filename = "__base__/sound/artillery-close.ogg", volume = 0.7},
		graphics_set =
		{
			base_visualisation =
			{
				animation = util.empty_animation(1)
			},
		},
		folded_animation =
		{
			layers =
			{
				utils.layerMaker(modname, "", "bunker", 1200, {1,1,4}, {1,1}, 4, 1),
				utils.layerMaker(modname, "", "bunker", 1200, {1,1,4}, {1,1}, 4, 2),
			},
		},
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "bullet",
			cooldown = 4,
			turn_range = 1/4,
			movement_slow_down_factor = 0.7,
			projectile_creation_distance = 4.4,
			projectile_center = {0, 0},
			range = 25,
			sound = sounds.heavy_gunshot,
		},
		shoot_in_prepare_state = false,
		turret_base_has_direction = true,
		call_for_help_radius = 40,
	},
})
