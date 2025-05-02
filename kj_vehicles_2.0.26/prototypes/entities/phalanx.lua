local hit_effects = require ("__base__/prototypes/entity/hit-effects")
local sounds = require ("__base__/prototypes/entity/sounds.lua")
local volume = 0.01 * settings.startup["kj_phalanx_volume"].value
local modname = "__kj_phalanx__"
local name = "kj_phalanx"
local tables = require("tables")

local function flak_normal(inputs)
	return
	{
		layers =
		{
			{
				filename = "__kj_phalanx__/graphics/entity/phalanx_raising.png",
				width = 700,
				height = 700,
				direction_count = 4,
				frame_count = inputs.frame_count or 16,
				line_length = inputs.line_length or 8,
				run_mode = inputs.run_mode or "forward",
				axially_symmetrical = false,
				scale = 0.5,
			},
			{
				filename = "__kj_phalanx__/graphics/entity/phalanx_raising_shadow.png",
				width = 700,
				height = 700,
				direction_count = 4,
				draw_as_shadow = true,
				frame_count = inputs.frame_count or 16,
				line_length = inputs.line_length or 8,
				run_mode = inputs.run_mode or "forward",
				axially_symmetrical = false,
				scale = 0.5,
			}
		}
	}
end

local function flak_attack(inputs)
	if inputs.version then
		version = inputs.version
	else
		version = ""
	end

	return
	{
		layers =
		{
			{
				width = 700,
				height = 700,
				frame_count = inputs.frame_count or 3,
				run_mode = inputs.run_mode or "forward",
				axially_symmetrical = false,
				direction_count = 64,
				animation_speed = 1,
				scale = 0.5,
				stripes =
				{
					{
						filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_0.png",
						width_in_frames = inputs.frame_count or 3,
						height_in_frames = 8
					},
					{
						filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_1.png",
						width_in_frames = inputs.frame_count or 3,
						height_in_frames = 8
					},
					{
						filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_2.png",
						width_in_frames = inputs.frame_count or 3,
						height_in_frames = 8
					},
					{
						filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_3.png",
						width_in_frames = inputs.frame_count or 3,
						height_in_frames = 8
					},
					{
						filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_4.png",
						width_in_frames = inputs.frame_count or 3,
						height_in_frames = 8
					},
					{
						filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_5.png",
						width_in_frames = inputs.frame_count or 3,
						height_in_frames = 8
					},
					{
						filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_6.png",
						width_in_frames = inputs.frame_count or 3,
						height_in_frames = 8
					},
					{
						filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_7.png",
						width_in_frames = inputs.frame_count or 3,
						height_in_frames = 8
					},
				},
			},
			{
				width = 700,
				height = 700,
				frame_count = inputs.frame_count or 3,
				run_mode = inputs.run_mode or "forward",
				axially_symmetrical = false,
				draw_as_shadow = true,
				direction_count = 64,
				animation_speed = 1,
				scale = 0.5,
				stripes =
				{
					{
						filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_shadow_0.png",
						width_in_frames = inputs.frame_count or 3,
						height_in_frames = 8
					},
					{
						filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_shadow_1.png",
						width_in_frames = inputs.frame_count or 3,
						height_in_frames = 8
					},
					{
						filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_shadow_2.png",
						width_in_frames = inputs.frame_count or 3,
						height_in_frames = 8
					},
					{
						filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_shadow_3.png",
						width_in_frames = inputs.frame_count or 3,
						height_in_frames = 8
					},
					{
						filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_shadow_4.png",
						width_in_frames = inputs.frame_count or 3,
						height_in_frames = 8
					},
					{
						filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_shadow_5.png",
						width_in_frames = inputs.frame_count or 3,
						height_in_frames = 8
					},
					{
						filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_shadow_6.png",
						width_in_frames = inputs.frame_count or 3,
						height_in_frames = 8
					},
					{
						filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_shadow_7.png",
						width_in_frames = inputs.frame_count or 3,
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
		name = "kj_phalanx",
		icon = modname.."/graphics/icon.png",
		icon_size = 128,
		flags = {"placeable-neutral", "player-creation", "not-flammable"},
		minable = {mining_time = 1, result = "kj_phalanx"},
		mined_sound = {filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8},
		max_health = tables.entityData.max_health[name],
		localised_name = {"", {"entity-name.kj_phalanxAA"}},
		localised_description = {"", {"entity-description.kj_phalanxAA"}},
		corpse = "big-remnants",
		dying_explosion = "big-explosion",
		collision_box = {{-1.25, -1.25}, {1.25, 1.25}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		drawing_box_vertical_extension = 2,
		sticker_box   = {{-1, -1}, {1, 1}},
		damaged_trigger_effect = hit_effects.entity(),

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

		rotation_speed = 0.01,
		preparing_speed = 0.06,
		folding_speed = 0.06,
		prepared_speed = 0.4,
		attacking_speed = 0.4,

		inventory_size = 1,
		automated_ammo_count = 100,
		alert_when_attacking = true,
		call_for_help_radius = 75,
		prepare_range = 100,

		open_sound = {filename = "__base__/sound/artillery-open.ogg", volume = 0.7},
		close_sound = {filename = "__base__/sound/artillery-close.ogg", volume = 0.7},
		preparing_sound = {filename = "__kj_phalanx__/sounds/turn.ogg", volume = 0.5, speed = 1},
		folding_sound = {filename = "__kj_phalanx__/sounds/turn.ogg", volume = 0.5, speed = 1},

		prepared_sound = {
			{
				filename = "__kj_phalanx__/sounds/spinning_1.ogg",
				volume = 0.3 * volume
			},
			{
				filename = "__kj_phalanx__/sounds/spinning_2.ogg",
				volume = 0.3 * volume
			},
			{
				filename = "__kj_phalanx__/sounds/spinning_3.ogg",
				volume = 0.3 * volume
			},
			{
				filename = "__kj_phalanx__/sounds/spinning_4.ogg",
				volume = 0.3 * volume
			},
			{
				filename = "__kj_phalanx__/sounds/spinning_5.ogg",
				volume = 0.3 * volume
			},
		},

		folded_animation = {
			layers =
			{
				{
					filename = "__kj_phalanx__/graphics/entity/phalanx_folded.png",
					width = 700,
					height = 700,
					frame_count = 1,
					direction_count = 4,
					axially_symmetrical = false,
					scale = 0.5,
				},
				{
					filename = "__kj_phalanx__/graphics/entity/phalanx_folded_shadow.png",
					width = 700,
					height = 700,
					frame_count = 1,
					direction_count = 4,
					draw_as_shadow = true,
					axially_symmetrical = false,
					scale = 0.5,
				}
			}
		},
		folding_animation = flak_normal{run_mode = "backward"},

		prepared_animation = flak_attack{},
		preparing_animation = flak_normal{},

		attacking_animation = flak_attack{version = 2, frame_count = 2},

		graphics_set =
		{
			base_visualisation =
			{
				animation =
				{
					layers =
					{
						{
							filename = "__kj_phalanx__/graphics/entity/phalanx_base.png",
							width = 700,
							height = 700,
							axially_symmetrical = false,
							direction_count = 1,
							frame_count = 1,
							scale = 0.5,
							tint = {r = 1, g = 0.5, b = 0.5, a = 1},
						},
					},
				},
			},
		},
		integration =
		{
			filename = "__kj_phalanx__/graphics/entity/phalanx_base_shadow.png",
			width = 700,
			height = 700,
			draw_as_shadow = true,
			scale = 0.5,
		},
		attack_parameters =
		{
			type = "projectile",
			ammo_categories = {"kj_apds_phalanx"},
			cooldown = 3,
			projectile_creation_distance = 2.5,
			projectile_center = {0, -1.6},
			range = 70,
			min_range = 5,
			sound = {
				{
					filename = "__kj_phalanx__/sounds/minigun_1.ogg",
					volume = 0.3 * volume
				},
				{
					filename = "__kj_phalanx__/sounds/minigun_2.ogg",
					volume = 0.3 * volume
				},
				{
					filename = "__kj_phalanx__/sounds/minigun_3.ogg",
					volume = 0.3 * volume
				},
				{
					filename = "__kj_phalanx__/sounds/minigun_4.ogg",
					volume = 0.3 * volume
				},
				{
					filename = "__kj_phalanx__/sounds/minigun_5.ogg",
					volume = 0.3 * volume
				},
			},
			rotate_penalty = 10,
			health_penalty = 10,
		},
	},
})

