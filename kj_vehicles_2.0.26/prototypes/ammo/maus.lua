local ammoData = require("tables").ammoData.kj_maustank
local items = require("tables").items
local modname = "kj_maustank"

data:extend({
	{
		type = "ammo",
		name = "kj_120kwk_ap",
		icon = "__kj_maustank__/graphics/equipment/ap_cannon_shell.png",
		ammo_category = "kj_128kwk",
		ammo_type =
		{
			target_type = "direction",
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "kj_120kwk_penetration_projectile",
					starting_speed = 1.5,
					direction_deviation = 0.1,
					range_deviation = 0.1,
					max_range = 50,
					min_range = 10,
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
		name = "kj_120kwk_he",
		icon = "__kj_maustank__/graphics/equipment/he_cannon_shell.png",
		ammo_category = "kj_128kwk",
		ammo_type =
		{
			target_type = "direction",
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "kj_120kwk_highexplosive_projectile",
					starting_speed = 1.5,
					direction_deviation = 0.1,
					range_deviation = 0.1,
					max_range = 50,
					min_range = 10,
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
		name = "kj_120kwk_aphe",
		icon = "__kj_maustank__/graphics/equipment/aphe_cannon_shell.png",
		ammo_category = "kj_128kwk",
		ammo_type =
		{
			target_type = "direction",
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "kj_120kwk_penetration_highexplosive_projectile",
					starting_speed = 1.5,
					direction_deviation = 0.1,
					range_deviation = 0.1,
					max_range = 50,
					min_range = 10,
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
		name = "kj_120kwk_penetration_projectile",
		flags = {"not-on-map"},
		force_condition = "not-same",
		hidden = true,
		height = 0,
		collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
		acceleration = 0,
		direction_only = true,
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
			filename = "__base__/graphics/entity/bullet/bullet.png",
			frame_count = 1,
			width = 3,
			height = 50,
			priority = "high"
		}
	},
	{
		type = "projectile",
		name = "kj_120kwk_highexplosive_projectile",
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
						damage = {amount = ammoData.APHE , type = "physical"}
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
						type = "destroy-cliffs",
						radius = 6,
						explosion = "explosion"
					},
					{
						type = "create-entity",
						entity_name = "massive-explosion"
					},
					{
						type = "nested-result",
						action =
						{
							type = "area",
							radius = 6,
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
		}
	},
	{
		type = "projectile",
		name = "kj_120kwk_penetration_highexplosive_projectile",
		flags = {"not-on-map"},
		force_condition = "not-same",
		hidden = true,
		height = 0,
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
						entity_name = "explosion"
					},
					{
						type = "destroy-cliffs",
						radius = 6,
						explosion = "explosion"
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
						entity_name = "massive-explosion"
					},
					{
						type = "nested-result",
						action =
						{
							type = "area",
							radius = 6,
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