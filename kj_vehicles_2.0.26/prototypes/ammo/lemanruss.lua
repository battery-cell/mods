local ammoData = require("tables").ammoData.kj_40klemanruss
require("bolter")
local items = require("tables").items
local modname = "kj_40klemanruss"

data:extend({
	{
		type = "explosion",
		name = "kj_lemanruss_shot",
		flags = {"not-on-map"},
		hidden = true,
		subgroup = "explosions",
		animations =
		{
			filename = "__base__/graphics/entity/artillery-cannon-muzzle-flash/muzzle-flash.png",
			line_length = 7,
			width = 276,
			height = 382,
			frame_count = 21,
			scale = 0.06,
			shift = {0, 0},
			animation_speed = 2,
		},
		rotate = true,
		height = 0,
		correct_rotation = true,
		light = {intensity = 1, size = 5, color = {r=1.0, g=1.0, b=1.0}},
		smoke = "smoke-fast",
		smoke_count = 1,
		smoke_slow_down_factor = 1
	},

	{
		type = "ammo",
		name = "kj_lemanruss_normal",
		icon = "__kj_40klemanruss__/graphics/equipment/he_cannon_shell.png",
		ammo_category = "kj_lemanruss",
		ammo_type =
		{
			target_type = "direction",
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "kj_lemanruss",
					starting_speed = 1.5,
					direction_deviation = 0.1,
					range_deviation = 0.1,
					max_range = 50,
					min_range = 8,
					source_effects =
					{
						type = "create-explosion",
						entity_name = "kj_lemanruss_shot"
					}
				}
			}
		},
		order = items[modname].order.."-a[normal]",
	},

	{
		type = "projectile",
		name = "kj_lemanruss",
		flags = {"not-on-map"},
		force_condition = "not-same",
		hidden = true,
		height = 0,
		collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
		acceleration = 0,
		piercing_damage = ammoData.HEDW,
		action =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "damage",
						damage = {amount = ammoData.HEAP , type = "physical"}
					},
					{
						type = "create-entity",
						entity_name = "explosion"
					},
				}
			}
		},
		final_action =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "create-entity",
						entity_name = "big-explosion"
					},
					{
						type = "nested-result",
						action =
						{
							type = "area",
							radius = 5,
							action_delivery =
							{
								type = "instant",
								target_effects =
								{
									{
										type = "damage",
										damage = {amount = ammoData.HEHE, type = "explosion"}
									},
									{
										type = "create-entity",
										entity_name = "explosion"
									}
								}
							}
						}
					},
					{
						type = "create-entity",
						entity_name = "medium-scorchmark-tintable",
						check_buildability = true
					},
					{
						type = "invoke-tile-trigger",
						repeat_count = 1,
					},
					{
						type = "destroy-decoratives",
						from_render_layer = "decorative",
						to_render_layer = "object",
						include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
						include_decals = false,
						invoke_decorative_trigger = true,
						decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
						radius = 3.25
					}
				}
			}
		},
		animation =
		{
		  filename = "__base__/graphics/entity/artillery-projectile/shell.png",
		  frame_count = 1,
		  width = 64,
		  height = 64,
		  scale = 0.5,
		  priority = "high"
		}
	},
})