local modname = "__kj_vierling__"
local name = "kj_vierling"
local tables = require("tables")

local hit_effects = require ("__base__/prototypes/entity/hit-effects")
local sounds = require ("__base__/prototypes/entity/sounds.lua")

local function flak_normal(inputs)
	return
	{
		layers = {
			{
				filename = "__kj_vierling__/graphics/entity/vierling_raising.png",
				width = 500,
				height = 500,
				direction_count = 4,
				frame_count = inputs.frame_count or 6,
				line_length = inputs.line_length or 0,
				run_mode = inputs.run_mode or "forward",
				axially_symmetrical = false,
				scale = 0.5,
			},
			{
				filename = "__kj_vierling__/graphics/entity/vierling_raising.png",
				width = 500,
				height = 500,
				direction_count = 4,
				draw_as_shadow = true,
				frame_count = inputs.frame_count or 6,
				line_length = inputs.line_length or 0,
				run_mode = inputs.run_mode or "forward",
				axially_symmetrical = false,
				scale = 0.5,
			}
		}
	}
end

local function flak_attack(inputs)
	return
	{
		layers =
		{
			{
				width = 500,
				height = 500,
				frame_count = inputs.frame_count or 2,
				axially_symmetrical = false,
				direction_count = 64,
				scale = 0.5,
				stripes =
				{
					{
						filename = "__kj_vierling__/graphics/entity/vierling_shooting_0.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 8
					},
					{
						filename = "__kj_vierling__/graphics/entity/vierling_shooting_1.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 8
					},
					{
						filename = "__kj_vierling__/graphics/entity/vierling_shooting_2.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 8
					},
					{
						filename = "__kj_vierling__/graphics/entity/vierling_shooting_3.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 8
					},
					{
						filename = "__kj_vierling__/graphics/entity/vierling_shooting_4.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 8
					},
					{
						filename = "__kj_vierling__/graphics/entity/vierling_shooting_5.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 8
					},
					{
						filename = "__kj_vierling__/graphics/entity/vierling_shooting_6.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 8
					},
					{
						filename = "__kj_vierling__/graphics/entity/vierling_shooting_7.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 8
					},
				},
			},
			{
				width = 500,
				height = 500,
				frame_count = inputs.frame_count or 2,
				axially_symmetrical = false,
				draw_as_shadow = true,
				direction_count = 64,
				scale = 0.5,
				stripes =
				{
					{
						filename = "__kj_vierling__/graphics/entity/vierling_shooting_shadow_0.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 8
					},
					{
						filename = "__kj_vierling__/graphics/entity/vierling_shooting_shadow_1.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 8
					},
					{
						filename = "__kj_vierling__/graphics/entity/vierling_shooting_shadow_2.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 8
					},
					{
						filename = "__kj_vierling__/graphics/entity/vierling_shooting_shadow_3.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 8
					},
					{
						filename = "__kj_vierling__/graphics/entity/vierling_shooting_shadow_4.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 8
					},
					{
						filename = "__kj_vierling__/graphics/entity/vierling_shooting_shadow_5.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 8
					},
					{
						filename = "__kj_vierling__/graphics/entity/vierling_shooting_shadow_6.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 8
					},
					{
						filename = "__kj_vierling__/graphics/entity/vierling_shooting_shadow_7.png",
						width_in_frames = inputs.frame_count or 2,
						height_in_frames = 8
					},
				},
			},
		}
	}
end

data:extend({
	{
		type = "damage-type",
		name = "flak"
	},
	{
		type = "ammo-turret",
		name = "kj_vierling",
		icon = modname.."/graphics/icon.png",
		icon_size = 128,
		flags = {"placeable-neutral", "player-creation", "not-flammable"},
		minable = {mining_time = 1, result = "kj_vierling"},
		mined_sound = {filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8},
		max_health = tables.entityData.max_health[name],
		localised_name = {"", {"entity-name.kj_vierlingAA"}},
		localised_description = {"", {"entity-description.kj_vierlingAA"}},
		corpse = "big-remnants",
		dying_explosion = "big-explosion",
		collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		sticker_box = {{-1, -1}, {1, 1}},
		damaged_trigger_effect = hit_effects.entity(),
		resistances = {
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
			{
				type = "electric",
				decrease = tables.entityData.resistances[name][6][1],
				percent  = tables.entityData.resistances[name][6][2]
			},
			{
				type = "laser",
				decrease = tables.entityData.resistances[name][7][1],
				percent  = tables.entityData.resistances[name][7][2]
			},
			{
				type = "poison",
				decrease = tables.entityData.resistances[name][8][1],
				percent  = tables.entityData.resistances[name][8][2]
			},
		},

		rotation_speed = 0.005,
		preparing_speed = 0.06,
		folding_speed = 0.06,
		attacking_speed = 0.15,

		preparing_sound = sounds.gun_turret_activate,
		folding_sound = sounds.gun_turret_deactivate,
		inventory_size = 2,
		automated_ammo_count = 10,
		alert_when_attacking = true,
		open_sound = {filename = "__base__/sound/artillery-open.ogg", volume = 0.7},
		close_sound = {filename = "__base__/sound/artillery-close.ogg", volume = 0.7},

		folded_animation = flak_normal{frame_count = 1, line_length = 1},
		preparing_animation = flak_normal{},
		folding_animation = flak_normal{run_mode = "backward"},

		prepared_animation = flak_attack{frame_count = 1},
		attacking_animation = flak_attack{},

		graphics_set =
		{
			base_visualisation =
			{
				animation =
				{
					layers =
					{
						{
							filename = "__kj_vierling__/graphics/entity/vierling_base.png",
							width = 500,
							height = 500,
							axially_symmetrical = false,
							direction_count = 1,
							frame_count = 1,
							shift = util.by_pixel(0, 16),
							scale = 0.5,
							tint = {r = 1, g = 0.5, b = 0.5, a = 1},
						},
						{
							filename = "__kj_vierling__/graphics/entity/vierling_base_shadow.png",
							width = 500,
							height = 500,
							axially_symmetrical = false,
							direction_count = 1,
							frame_count = 1,
							draw_as_shadow = true,
							shift = util.by_pixel(0, 16),
							scale = 0.5,
						},
					},
				},
			},
		},
		integration = {
			filename = "__kj_vierling__/graphics/entity/vierling_base.png",
			priority = "low",
			width = 500,
			height = 500,
			shift = util.by_pixel(0, 16),
			draw_as_shadow = true,
			scale = 0.5,
		},
		vehicle_impact_sound =  sounds.generic_impact,
		attack_parameters = {
			type = "projectile",
			ammo_categories = {"kj_2cmfv_vierling"},
			cooldown = 60 / 10,
			projectile_creation_distance = 2,
			projectile_center = {0, -1},
			range = 40,
			sound = sounds.tank_gunshot,
			rotate_penalty = 100,
			health_penalty = 10,
		},
		call_for_help_radius = 50,
		prepare_range = 100
	},
})

