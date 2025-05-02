local ammoData = require("tables").ammoData.kj_rex
local items = require("tables").items
local modname = "kj_rex"

data:extend({
	{
		type = "explosion",
		name = "kj_rex_rail_gun_line",
		flags = {"not-on-map"},
		hidden = true,
		animation_speed = 3,
		rotate = true,
		beam = true,
		animations =
		{
		  {
			filename = "__kj_rex__/graphics/laser-cannon-beam-piercing.png",
			priority = "extra-high",
			draw_as_glow = true,
			blend_mode = "additive",
			width = 187,
			height = 1,
			frame_count = 6,
		  }
		},
		light = {intensity = 1, size = 10},
		smoke = "smoke-fast",
		smoke_count = 2,
		smoke_slow_down_factor = 1
	},
	{
		type = "ammo",
		name = "kj_rex_normal",
		icon = "__kj_rex__/graphics/equipment/railgun_ammo.png",
		ammo_category = "kj_rex_cannon",
		ammo_type =
		{
			target_type = "direction",
			action =
			{
				type = "line",
				range = 100,
				min_range = 8,
				width = 0.75,
				range_effects =
				{
					type = "create-explosion",
					entity_name = "kj_rex_rail_gun_line"
				},
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
								radius = 3,
								action_delivery =
								{
									type = "instant",
									target_effects =
									{
										{
											type = "damage",
											damage = {amount = ammoData.APAP, type = "physical"}
										},
										{
											type = "damage",
											damage = {amount = ammoData.APHE, type = "laser"}
										},
										{
											type = "create-entity",
											entity_name = "medium-explosion"
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
						},
					},
				}
			}
		},
		order = items[modname].order.."-a[normal]",
	},

	{
		type = "projectile",
		name = "kj_rex_projectile",
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
						radius = 3,
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
							radius = 3,
							action_delivery =
							{
								type = "instant",
								target_effects =
								{
									{
										type = "damage",
										damage = {amount = ammoData.APAP, type = "physical"}
									},
									{
										type = "damage",
										damage = {amount = ammoData.APHE, type = "explosion"}
									},
									{
										type = "create-entity",
										entity_name = "medium-explosion"
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
		picture =
		{
			filename = "__base__/graphics/entity/artillery-projectile/shell.png",
			draw_as_glow = true,
			width = 64,
			height = 64,
			scale = 1
		},
	},
})