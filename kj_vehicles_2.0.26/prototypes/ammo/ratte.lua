local ammoData = require("tables").ammoData.kj_rattetank
local items = require("tables").items
local modname = "kj_rattetank"


local fire =table.deepcopy(data.raw["fire"]["fire-flame"])
fire.name = "incend-flame"
fire.damage_per_tick = {amount = 2, type = "fire"}
fire.initial_lifetime = 60 * 10
fire.hidden = true
data:extend({fire})

data:extend({
	{
		type = "explosion",
		name = "kj_ratte_turret_shot",
		flags = {"not-on-map"},
		hidden = true,
		subgroup = "explosions",
		animations =
		{
			filename = "__kj_rattetank__/graphics/flash_hr_spritesheet.png",
			line_length = 7,
			width = 552,
			height = 382,
			frame_count = 21,
			scale = 0.4,
			shift = {0, 0},
			animation_speed = 0.5,
		},
		rotate = true,
		height = 0,
		correct_rotation = true,
		light = {intensity = 1, size = 10, color = {r=1.0, g=1.0, b=1.0}},
		smoke = "smoke-fast",
		smoke_count = 1,
		smoke_slow_down_factor = 1
	},

	{
		type = "ammo",
		name = "kj_280SKC34_ap",
		icon = "__kj_rattetank__/graphics/equipment/ap_cannon_shell.png",
		ammo_category = "kj_280SKC34",
		ammo_type =
		{
		  target_type = "direction",
		  consumption_modifier = 2,
		  action =
		  {
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "kj_280SKC34_penetration_projectile",
					starting_speed = 2,
					direction_deviation = 0.1,
					range_deviation = 0.1,
					max_range = 80,
					min_range = 10,
					source_effects =
					{
						type = "create-explosion",
						entity_name = "kj_ratte_turret_shot"
					}
				}
			}
		},
		order = items[modname].order.."-a[AP]",
	},
	{
		type = "ammo",
		name = "kj_280SKC34_he",
		icon = "__kj_rattetank__/graphics/equipment/he_cannon_shell.png",
		ammo_category = "kj_280SKC34",
		ammo_type =
		{
			target_type = "direction",
			consumption_modifier = 2,
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "kj_280SKC34_highexplosive_projectile",
					starting_speed = 2,
					direction_deviation = 0.1,
					range_deviation = 0.1,
					max_range = 80,
					min_range = 10,
					source_effects =
					{
						type = "create-explosion",
						entity_name = "kj_ratte_turret_shot"
					}
				}
			}
		},
		order = items[modname].order.."-b[HE]",
	},
	{
		type = "ammo",
		name = "kj_280SKC34_inc",
		icon = "__kj_rattetank__/graphics/equipment/hei_cannon_shell.png",
		ammo_category = "kj_280SKC34",
		ammo_type =
		{
			target_type = "direction",
			consumption_modifier = 2,
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "kj_280SKC34_incendiary_projectile",
					starting_speed = 2,
					direction_deviation = 0.1,
					range_deviation = 0.1,
					max_range = 80,
					min_range = 10,
					source_effects =
					{
						type = "create-explosion",
						entity_name = "kj_ratte_turret_shot"
					}
				}
			}
		},
		order = items[modname].order.."-c[HEI]",
	},

	{
		type = "projectile",
		name = "kj_280SKC34_penetration_projectile",
		flags = {"not-on-map"},
		force_condition = "not-same",
		hidden = true,
		height = 0,
		collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
		acceleration = 0,
		piercing_damage = ammoData.APDW,
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
						damage = {amount = ammoData.APAP , type = "physical"}
					},
					{
						type = "damage",
						damage = {amount = ammoData.APHE , type = "explosion"}
					},
					{
						type = "create-entity",
						entity_name = "explosion"
					}
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
						entity_name = "small-scorchmark-tintable",
						check_buildability = true
					}
				}
			}
		},
		animation =
		{
			filename = "__kj_rattetank__/graphics/projectile.png",
			frame_count = 1,
			width = 151,
			height = 156,
			priority = "high"
		}
	},
	{
		type = "projectile",
		name = "kj_280SKC34_highexplosive_projectile",
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
						entity_name = "medium-explosion"
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
						type = "destroy-cliffs",
						radius = 6,
						explosion = "explosion"
					},
					{
						type = "create-entity",
						entity_name = "big-artillery-explosion"
					},
					{
						type = "nested-result",
						action =
						{
							type = "area",
							radius = 8,
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
										entity_name = "big-explosion"
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
			filename = "__kj_rattetank__/graphics/projectile.png",
			frame_count = 1,
			width = 151,
			height = 156,
			priority = "high"
		}
	},
	{
		type = "projectile",
		name = "kj_280SKC34_incendiary_projectile",
		flags = {"not-on-map"},
		force_condition = "not-same",
		hidden = true,
		height = 0,
		collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
		acceleration = 0,
		piercing_damage = ammoData.HEIDW,
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
						damage = {amount = ammoData.HEIAP , type = "physical"}
					},
					{
						type = "create-entity",
						entity_name = "explosion"
					},
				},
			},
		},
		final_action =
		{
			{
				type = "area",
				radius = 7,
				action_delivery =
				{
					type = "instant",
					target_effects =
					{
						{
							type = "create-sticker",
							sticker = "fire-sticker",
							show_in_tooltip = true
						},
					}
				}
			},
			{
				type = "direct",
				action_delivery =
				{
					type = "instant",
					target_effects =
					{
						{
							type = "create-entity",
							entity_name = "small-scorchmark-tintable",
							check_buildability = true
						},
						{
							type = "create-entity",
							entity_name = "medium-explosion"
						},
						{
							type = "nested-result",
							show_in_tooltip = true,
							action =
							{
								type = "area",
								target_entities = false,
								trigger_from_target = true,
								repeat_count = 40,
								radius = 7,
								action_delivery =
								{
									type = "projectile",
									projectile = "kj_280SKC34_fire_projectile",
									starting_speed = 0.5
								},
							},
						},
					}
				}
			}
		},
		animation =
		{
			filename = "__kj_rattetank__/graphics/projectile.png",
			frame_count = 1,
			width = 151,
			height = 156,
			priority = "high"
		}
	},
	{
		type = "projectile",
		name = "kj_280SKC34_fire_projectile",
		flags = {"not-on-map"},
		force_condition = "not-same",
		hidden = true,
		height = 0,
		collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
		acceleration = 0,
		piercing_damage = ammoData.HEIFDW,
		action =
		{
			{
				type = "direct",
				action_delivery =
				{
					type = "instant",
					target_effects =
					{
						{
							type = "create-fire",
							show_in_tooltip = true,
							entity_name = "incend-flame"
						},
						{
							type = "damage",
							damage = {amount = ammoData.HEIFAP , type = "physical"}
						},
						{
							type = "damage",
							damage = {amount = ammoData.HEIFHE , type = "explosion"}
						},
					}
				}
			},
		},
		animation =
		{
			filename = "__core__/graphics/empty.png",
			frame_count = 1,
			width = 1,
			height = 1,
			priority = "high"
		},
		shadow =
		{
			filename = "__core__/graphics/empty.png",
			frame_count = 1,
			width = 1,
			height = 1,
			priority = "high"
		}
	},
})