local hit_effects = require ("__base__/prototypes/entity/hit-effects")
local modname = "__kj_laser__"
local name = "kj_laser"
local tables = require("tables")
local imgSize = 448
local setting = settings.startup["kj_laser_angle"].value

local function turret_raising(inputs)
	return
	{
		layers =
		{
			{
				filename = modname.."/graphics/entity/laser_raising.png",
				width = imgSize,
				height = imgSize,
				direction_count = 4,
				frame_count = 16,
				line_length = 8,
				axially_symmetrical = false,
				scale = 0.5,
				run_mode = inputs.run_mode or "forward",
			},
			{
				filename = modname.."/graphics/entity/laser_mask.png",
				flags = {"mask"},
				width = imgSize,
				height = imgSize,
				direction_count = 4,
				frame_count = 1,
				frame_sequence = {1, 1, 1, 1,  1, 1, 1, 1,  1, 1, 1, 1,  1, 1, 1, 1},
				line_length = 2,
				apply_runtime_tint = true,
				scale = 0.5,
				run_mode = inputs.run_mode or "forward",
			},
			{
				filename = modname.."/graphics/entity/laser_raising_light.png",
				width = imgSize,
				height = imgSize,
				direction_count = 4,
				frame_count = 16,
				line_length = 8,
				axially_symmetrical = false,
				draw_as_glow = true,
				blend_mode = "additive",
				scale = 0.5,
				run_mode = inputs.run_mode or "forward",
			},
			{
				filename = modname.."/graphics/entity/laser_raising_shadow.png",
				width = imgSize,
				height = imgSize,
				direction_count = 4,
				frame_count = 16,
				line_length = 8,
				axially_symmetrical = false,
				draw_as_shadow = true,
				scale = 0.5,
				run_mode = inputs.run_mode or "forward",
			},
		}
	}
end

local function turret_attacking(inputs)
	local rc = 1
	local sp = 1 / 120
	local fs
	if inputs.light == true then
		rc = 4
		fs = {4, 3, 2, 1}
	end
	local layers = {
		layers =
		{
			{
				width = imgSize,
				height = imgSize,
				direction_count = 128,
				frame_count = 1,
				repeat_count = rc,
				axially_symmetrical = false,
				animation_speed = sp,
				scale = 0.5,
				stripes =
				{
					{
						filename = modname.."/graphics/entity/laser_shooting_0.png",
						width_in_frames = 8,
						height_in_frames = 8
					},
					{
						filename = modname.."/graphics/entity/laser_shooting_1.png",
						width_in_frames = 8,
						height_in_frames = 8
					},
				},
			},
			{
				flags = {"mask"},
				width = imgSize,
				height = imgSize,
				direction_count = 128,
				frame_count = 1,
				repeat_count = rc,
				apply_runtime_tint = true,
				scale = 0.5,
				stripes =
				{
					{
						filename = modname.."/graphics/entity/laser_shooting_mask_0.png",
						width_in_frames = 8,
						height_in_frames = 8
					},
					{
						filename = modname.."/graphics/entity/laser_shooting_mask_1.png",
						width_in_frames = 8,
						height_in_frames = 8
					},
				},
			},
			{
				width = imgSize,
				height = imgSize,
				direction_count = 128,
				frame_count = rc,
				axially_symmetrical = false,
				frame_sequence = fs,
				draw_as_glow = true,
				blend_mode = "additive",
				animation_speed = sp,
				scale = 0.5,
				stripes =
				{
					{
						filename = modname.."/graphics/entity/laser_shooting_light_0.png",
						width_in_frames = rc,
						height_in_frames = 16,
					},
					{
						filename = modname.."/graphics/entity/laser_shooting_light_1.png",
						width_in_frames = rc,
						height_in_frames = 16,
					},
					{
						filename = modname.."/graphics/entity/laser_shooting_light_2.png",
						width_in_frames = rc,
						height_in_frames = 16,
					},
					{
						filename = modname.."/graphics/entity/laser_shooting_light_3.png",
						width_in_frames = rc,
						height_in_frames = 16,
					},
					{
						filename = modname.."/graphics/entity/laser_shooting_light_4.png",
						width_in_frames = rc,
						height_in_frames = 16,
					},
					{
						filename = modname.."/graphics/entity/laser_shooting_light_5.png",
						width_in_frames = rc,
						height_in_frames = 16,
					},
					{
						filename = modname.."/graphics/entity/laser_shooting_light_6.png",
						width_in_frames = rc,
						height_in_frames = 16,
					},
					{
						filename = modname.."/graphics/entity/laser_shooting_light_7.png",
						width_in_frames = rc,
						height_in_frames = 16,
					},
				},
			},
			{
				width = imgSize,
				height = imgSize,
				direction_count = 128,
				frame_count = 1,
				repeat_count = rc,
				axially_symmetrical = false,
				draw_as_shadow = true,
				animation_speed = sp,
				scale = 0.5,
				stripes =
				{
					{
						filename = modname.."/graphics/entity/laser_shooting_shadow_0.png",
						width_in_frames = 8,
						height_in_frames = 8
					},
					{
						filename = modname.."/graphics/entity/laser_shooting_shadow_1.png",
						width_in_frames = 8,
						height_in_frames = 8
					},
				},
			},
		}
	}
	return layers
end

data:extend({
	{
		type = "ammo-turret",
		name = "kj_laser",
		icon = modname.."/graphics/icon.png",
		icon_size = 128,
		flags = {"placeable-neutral", "player-creation", "not-flammable"},
		minable = {mining_time = 1, result = "kj_laser"},
		mined_sound = {filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8},
		max_health = tables.entityData.max_health[name],
		corpse = "big-remnants",
		dying_explosion = "big-explosion",
		collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		sticker_box   = {{-1.5, -1.5}, {1.5, 1.5}},
		drawing_box_vertical_extension = 0,
		turret_base_has_direction = true,
		can_retarget_while_starting_attack = false,
		alert_when_attacking = true,
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

		energy_source =
		{
			type = "electric",
			buffer_capacity = "3001kJ",
			input_flow_limit = "9600kW",
			drain = "50kW",
			usage_priority = "primary-input"
		},

		rotation_speed = 0.0025,
		preparing_speed = 0.03,
		folding_speed = 0.03,
		prepared_speed = 0.2,
		attacking_speed = 0.1,
		ending_attack_speed = 0.1,

		call_for_help_radius = 80,
		prepare_range = 80,

		open_sound = {filename = "__base__/sound/artillery-open.ogg", volume = 0.7},
		close_sound = {filename = "__base__/sound/artillery-close.ogg", volume = 0.7},
		preparing_sound = {
			variations = sound_variations(modname.."/sounds/activate", 4, 0.4, volume_multiplier("main-menu", 0.9)),
			aggregation = {max_count = 3, remove = true, count_already_playing = true}
		},
		folding_sound = {
			variations = sound_variations(modname.."/sounds/deactivate", 4, 0.4, volume_multiplier("main-menu", 0.9)),
			aggregation = {max_count = 3, remove = true, count_already_playing = true}
		},
		prepared_sound =
		{
			filename = "__base__/sound/fight/destroyer-robot-loop.ogg", volume = 0.85,
			aggregation = {max_count = 1, remove = true, count_already_playing = true}
		},
		rotating_sound =
		{
			sound = {filename = modname.."/sounds/rotation.ogg", volume = 0.15}
		},

		glow_light_intensity = 0.5,

		folded_animation = {
			layers =
			{
				{
					width = imgSize,
					height = imgSize,
					frame_count = 1,
					axially_symmetrical = false,
					direction_count = 4,
					animation_speed = 1,
					scale = 0.5,
					stripes =
					{
						{
							filename = modname.."/graphics/entity/laser_folded.png",
							width_in_frames = 2,
							height_in_frames = 2
						},
					},
				},
				{
					width = imgSize,
					height = imgSize,
					frame_count = 1,
					axially_symmetrical = false,
					direction_count = 4,
					animation_speed = 1,
					scale = 0.5,
					draw_as_glow = true,
					blend_mode = "additive",
					stripes =
					{
						{
							filename = modname.."/graphics/entity/laser_folded_light.png",
							width_in_frames = 2,
							height_in_frames = 2
						},
					},
				},
				{
					filename = modname.."/graphics/entity/laser_mask.png",
					flags = {"mask"},
					width = imgSize,
					height = imgSize,
					direction_count = 4,
					frame_count = 1,
					line_length = 2,
					apply_runtime_tint = true,
					scale = 0.5,
				},
				{
					width = imgSize,
					height = imgSize,
					frame_count = 1,
					axially_symmetrical = false,
					direction_count = 4,
					animation_speed = 1,
					scale = 0.5,
					draw_as_shadow = true,
					stripes =
					{
						{
							filename = modname.."/graphics/entity/laser_folded_shadow.png",
							width_in_frames = 2,
							height_in_frames = 2
						},
					},
				},
			}
		},
		preparing_animation = turret_raising{},
		folding_animation   = turret_raising{run_mode = "backward"},
		prepared_animation  = turret_attacking{},
		attacking_animation = turret_attacking{},
		ending_attack_animation = turret_attacking{light = true},
		graphics_set =
		{
			base_visualisation =
			{
				animation =
				{
					layers =
					{
						{
							filename = modname.."/graphics/entity/laser_base.png",
							width = imgSize,
							height = imgSize,
							axially_symmetrical = false,
							direction_count = 1,
							frame_count = 1,
							scale = 0.5,
						},
					},
				},
			},
		},

		automated_ammo_count = 1,
		inventory_size = 1,

		attack_parameters =
		{
			type = "projectile",
			ammo_categories = {"kj_laser"},
			health_penalty = 10,
			cooldown = 180,
			projectile_creation_distance = 2.5,
			projectile_center = {0, 0},
			apply_projection_to_projectile_creation_position = false,
			min_range = 2.5,
			range = 60,
			turn_range = 1 / tonumber(setting),
      		sound =
			{
				variations = sound_variations(modname.."/sounds/shoot", 2, 1, {volume_multiplier("main-menu", 0.9)}),
				aggregation = {max_count = 8, remove = true, count_already_playing = true, priority = "newest"}
			},
		},
	},
})

