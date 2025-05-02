local hit_effects = require ("__base__/prototypes/entity/hit-effects")
local modname = "__kj_medieval_warfare__"
local name = "kj_ballista"
local tables = require("tables")

local function ballista(mode)
	local shadow = ""
	if mode == true then
		shadow = "_shadow"
	end

	return
	{
		filename = "__kj_medieval_warfare__/graphics/entity/ballista"..shadow..".png",
		--priority = "high",
		scale = 0.5,
		width = 256,
		height = 256,
		direction_count = 64,
		draw_as_shadow = mode,
		frame_count = 1,
		line_length = 8,
		axially_symmetrical = false,
		shift = util.by_pixel(20, -15),
	}
end

data:extend({
	{
		type = "damage-type",
		name = "flak"
	},
	{
		type = "ammo-turret",
		name = "kj_ballista",
		icon = modname.."/graphics/icon.png",
    	icon_size = 128,
		flags = {"placeable-neutral", "player-creation"},
		minable = {mining_time = 1, result = "kj_ballista"},
		mined_sound = {filename = "__core__/sound/deconstruct-small.ogg", volume = 0.8},
		max_health = tables.entityData.max_health[name],
		corpse = "medium-remnants",
		dying_explosion = "explosion",
		collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
		selection_box = {{-1, -1}, {1, 1}},
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
		call_for_help_radius = 20,
		prepare_range = 30,

		open_sound = {filename = "__base__/sound/wooden-chest-open.ogg", volume = 0.6},
		close_sound = {filename = "__base__/sound/wooden-chest-close.ogg", volume = 0.6},
		--preparing_sound = {filename = modname.."/sounds/turn.ogg", volume = 0.5, speed = 1},
		--folding_sound = {filename = modname.."/sounds/turn.ogg", volume = 0.5, speed = 1},

		folded_animation = {
			layers =
			{
				ballista(false),
					ballista(true)
			}
		},
		preparing_animation = {
			layers =
			{
				ballista(false),
					ballista(true)
			}
		},
		prepared_animation = {
			layers =
			{
				ballista(false),
					ballista(true)
			}
		},
		attacking_animation = {
			layers =
			{
				ballista(false),
					ballista(true)
			}
		},
		folding_animation = {
			layers =
			{
				ballista(false),
					ballista(true)
			}
		},

		graphics_set =
		{
			base_visualisation =
			{
				animation = util.empty_animation(1)
			},
		},
		attack_parameters =
		{
			type = "projectile",
			ammo_categories = {"kj_ballista_normal"},
			cooldown = 60,
			projectile_creation_distance = 1.5,
			projectile_center = {0, 0.3},
			range = 30,
			min_range = 5,
			shoot_in_prepare_state = false,
			--lead_target_for_projectile_delay = 15,
			--lead_target_for_projectile_speed = 1 / 60,
			sound = {
				{
					filename = modname.."/sounds/shoot.ogg",
					volume = 0.5
				},
			},
			rotate_penalty = 10,
			health_penalty = 10,
		},
	},
})
