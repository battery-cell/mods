local hit_effects = require ("__base__/prototypes/entity/hit-effects")
local sounds = require ("__base__/prototypes/entity/sounds.lua")
local utils = require("utils")
local modname = "__kj_tower__"
local name = "kj_tower"
local tables = require("tables")

local COLLISIONBOX = {{-2.2, -2.2}, {2.2, 2.2}}

if settings.startup["kj_tower_collision_box"].value == true then
	COLLISIONBOX = {{-0.05, -0.05}, {0.05, 0.05}}
end


data:extend({
	{
		type = "ammo-turret",
		name = "kj_tower",
		icon = modname.."/graphics/icon.png",
		icon_size = 128,
		flags = {"placeable-neutral", "player-creation", "not-flammable"},
		minable = {mining_time = 5, result = "kj_tower"},
		mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
		collision_box = COLLISIONBOX,
		selection_box = {{-2.5, -1.5}, {2.5, 2.5}},
		sticker_box = {{-1.6, -1.6}, {1.6, 1.6}},
		drawing_box_vertical_extension = 6,
		max_health = tables.entityData.max_health[name],
		corpse = "big-remnants",
		dying_explosion = "big-explosion",
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
		damaged_trigger_effect = hit_effects.entity(),

		attacking_speed = 0.5,
		rotation_speed = 1,
		preparing_speed = 1,
		folding_speed = 1,

		inventory_size = 5,
		shoot_in_prepare_state = false,
		turret_base_has_direction = true,
		call_for_help_radius = 40,

		automated_ammo_count = 10,
		alert_when_attacking = true,

		open_sound = {filename = "__base__/sound/artillery-open.ogg", volume = 0.7},
		close_sound = {filename = "__base__/sound/artillery-close.ogg", volume = 0.7},

		graphics_set =
		{
			base_visualisation =
			{
				animation =
				{
					layers =
					{
						util.empty_animation(1),
					}
				},
			},
		},
		folded_animation =
		{
			layers =
			{
				utils.layerMaker(modname, "", "tower", 1800, {1,1,4}, {1,1}, 4, 1),
				utils.layerMaker(modname, "", "tower", 1800, {1,1,4}, {1,1}, 4, 2),
			},
		},
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "bullet",
			cooldown = 8,
			turn_range = 0.24,
			movement_slow_down_factor = 0.7,
			projectile_creation_distance = 1.5,
			projectile_center = {0, -6},
			range = 67,
			sound = sounds.heavy_gunshot,
			shell_particle =
			{
				name = "shell-particle",
				direction_deviation = 0.1,
				speed = 0.1,
				speed_deviation = 0.03,
				center = {0, 0},
				creation_distance = 0,
				starting_frame_speed = 0.2,
				starting_frame_speed_deviation = 0.1
			},
		},
	},
})
