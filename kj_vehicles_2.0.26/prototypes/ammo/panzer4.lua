local ammoData = require("tables").ammoData.kj_panzer4
local items = require("tables").items
local modname = "kj_panzer4"

data:extend({
	{
		type = "ammo",
		name = "kj_75kwk40_ap",
		icon = "__kj_panzer4__/graphics/equipment/ap_cannon_shell.png",
		ammo_category = "kj_75kwk40",
		ammo_type =
		{
			target_type = "direction",
			consumption_modifier = 1,
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "kj_75kwk40_penetration_projectile",
					starting_speed = 2,
					direction_deviation = 0.1,
					range_deviation = 0.1,
					max_range = 50,
					min_range = 4,
					source_effects =
					{
						type = "create-explosion",
						entity_name = "explosion-gunshot"
					}
				}
			}
		},
		order = items[modname].order.."-a[AP]",
	},
	{
		type = "ammo",
		name = "kj_75kwk40_he",
		icon = "__kj_panzer4__/graphics/equipment/he_cannon_shell.png",
		ammo_category = "kj_75kwk40",
		ammo_type =
		{
			target_type = "direction",
			consumption_modifier = 1,
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "kj_75kwk40_highexplosive_projectile",
					starting_speed = 2,
					direction_deviation = 0.1,
					range_deviation = 0.1,
					max_range = 50,
					min_range = 4,
					source_effects =
					{
						type = "create-explosion",
						entity_name = "explosion-gunshot"
					}
				}
			}
		},
		order = items[modname].order.."-b[HE]",
	},
	{
		type = "ammo",
		name = "kj_75kwk40_aphe",
		icon = "__kj_panzer4__/graphics/equipment/aphe_cannon_shell.png",
		ammo_category = "kj_75kwk40",
		ammo_type =
		{
			target_type = "direction",
			consumption_modifier = 1,
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "kj_75kwk40_penetration_highexplosive_projectile",
					starting_speed = 2,
					direction_deviation = 0.1,
					range_deviation = 0.1,
					max_range = 50,
					min_range = 4,
					source_effects =
					{
						type = "create-explosion",
						entity_name = "explosion-gunshot"
					}
				}
			}
		},
		order = items[modname].order.."-c[APHE]",
	},

	{
		type = "projectile",
		name = "kj_75kwk40_penetration_projectile",
		flags = {"not-on-map"},
		force_condition = "not-same",
		hidden = true,
		height = 1,
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
			filename = "__base__/graphics/entity/bullet/bullet.png",
			frame_count = 1,
			width = 3,
			height = 50,
			priority = "high"
		},
	},
	{
		type = "projectile",
		name = "kj_75kwk40_highexplosive_projectile",
		flags = {"not-on-map"},
		force_condition = "not-same",
		hidden = true,
		height = 1,
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
						damage = {amount = ammoData.APHE , type = "physical"}
					},
					{
						type = "create-entity",
						entity_name = "big-explosion"
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
						entity_name = "explosion"
					},
					{
						type = "nested-result",
						action =
						{
							type = "area",
							radius = 4.5,
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
			filename = "__base__/graphics/entity/bullet/bullet.png",
			frame_count = 1,
			width = 3,
			height = 50,
			priority = "high"
		},
	},
	{
		type = "projectile",
		name = "kj_75kwk40_penetration_highexplosive_projectile",
		flags = {"not-on-map"},
		force_condition = "not-same",
		hidden = true,
		height = 1,
		collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
		acceleration = 0,
		piercing_damage = ammoData.APHEDW,
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
						damage = {amount = ammoData.APHEAP , type = "physical"}
					},
					{
						type = "create-entity",
						entity_name = "big-explosion"
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
						entity_name = "explosion"
					},
					{
						type = "nested-result",
						action =
						{
							type = "area",
							radius = 4.5,
							action_delivery =
							{
								type = "instant",
								target_effects =
								{
									{
										type = "damage",
										damage = {amount = ammoData.APHEHE, type = "explosion"}
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
		  filename = "__base__/graphics/entity/bullet/bullet.png",
		  frame_count = 1,
		  width = 3,
		  height = 50,
		  priority = "high"
		}
	},
})