local ammoData = require("tables").ammoData.kj_ray
local items = require("tables").items
local modname = "kj_ray"

data:extend({
	--[[{
		type = "beam",
		name = "kj_ray_laser_beam",
		flags = {"not-on-map"},
		width = 1.5,
		damage_interval = 20,
		random_target_offset = true,
		action_triggered_automatically = false,
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
				damage = { amount = 10, type = "laser"}
			  }
			}
		  }
		},
		head =
		{
		  filename = "__base__/graphics/entity/laser-turret/hr-laser-body.png",
		  flags = beam_non_light_flags,
		  line_length = 8,
		  width = 64,
		  height = 12,
		  frame_count = 8,
		  scale = 0.5,
		  animation_speed = 0.5,
		  blend_mode = laser_beam_blend_mode
		},
		tail =
		{
		  filename = "__base__/graphics/entity/laser-turret/hr-laser-end.png",
		  flags = beam_non_light_flags,
		  width = 110,
		  height = 62,
		  frame_count = 8,
		  shift = util.by_pixel(11.5, 1),
		  scale = 0.5,
		  animation_speed = 0.5,
		  blend_mode = laser_beam_blend_mode
		},
		body =
		{
		  {
			filename = "__base__/graphics/entity/laser-turret/hr-laser-body.png",
			flags = beam_non_light_flags,
			line_length = 8,
			width = 64,
			height = 12,
			frame_count = 8,
			scale = 0.5,
			animation_speed = 0.5,
			blend_mode = laser_beam_blend_mode
		  }
		},

		light_animations =
		{
		  head =
		  {
			filename = "__base__/graphics/entity/laser-turret/hr-laser-body-light.png",
			line_length = 8,
			width = 64,
			height = 12,
			frame_count = 8,
			scale = 0.5,
			animation_speed = 0.5
		  },
		  tail =
		  {
			filename = "__base__/graphics/entity/laser-turret/hr-laser-end-light.png",
			width = 110,
			height = 62,
			frame_count = 8,
			shift = util.by_pixel(11.5, 1),
			scale = 0.5,
			animation_speed = 0.5
		  },
		  body =
		  {
			{
			  filename = "__base__/graphics/entity/laser-turret/hr-laser-body-light.png",
			  line_length = 8,
			  width = 64,
			  height = 12,
			  frame_count = 8,
			  scale = 0.5,
			  animation_speed = 0.5
			}
		  }
		},

		ground_light_animations =
		{
		  head =
		  {
			filename = "__base__/graphics/entity/laser-turret/laser-ground-light-head.png",
			line_length = 1,
			width = 256,
			height = 256,
			repeat_count = 8,
			scale = 0.5,
			shift = util.by_pixel(-32, 0),
			animation_speed = 0.5,
			tint = {0.5, 0.05, 0.05}
		  },
		  tail =
		  {
			filename = "__base__/graphics/entity/laser-turret/laser-ground-light-tail.png",
			line_length = 1,
			width = 256,
			height = 256,
			repeat_count = 8,
			scale = 0.5,
			shift = util.by_pixel(32, 0),
			animation_speed = 0.5,
			tint = {0.5, 0.05, 0.05}
		  },
		  body =
		  {
			filename = "__base__/graphics/entity/laser-turret/laser-ground-light-body.png",
			line_length = 1,
			width = 64,
			height = 256,
			repeat_count = 8,
			scale = 0.5,
			animation_speed = 0.5,
			tint = {0.5, 0.05, 0.05}
		  }
		}
	},]]
	{
		type = "explosion",
		name = "kj_ray_rail_gun_line",
		flags = {"not-on-map"},
		hidden = true,
		animation_speed = 3,
		rotate = true,
		beam = true,
		animations =
		{
			{
				filename = "__kj_ray__/graphics/laser-cannon-beam-piercing.png",
				priority = "extra-high",
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
		name = "kj_ray_normal",
		icon = "__kj_ray__/graphics/equipment/railgun_ammo.png",
		ammo_category = "kj_ray_cannon",
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
					entity_name = "kj_ray_rail_gun_line"
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
		order = items[modname].order.."-a[ammo]",
	},
	{
		type = "ammo",
		name = "kj_ray_ammo_small",
		icon = "__kj_ray__/graphics/equipment/railgun_ammo_small.png",
		ammo_category = "kj_ray_cannon_small",
		ammo_type =
		{
			target_type = "direction",
			action =
			{
				type = "line",
				range = 33,
				min_range = 2.6,
				width = 0.25,
				range_effects =
				{
					type = "create-explosion",
					entity_name = "kj_ray_rail_gun_line"
				},
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
								radius = 1,
								action_delivery =
								{
									type = "instant",
									target_effects =
									{
										{
											type = "damage",
											damage = {amount = ammoData.APAP * 0.333, type = "physical"}
										},
										{
											type = "damage",
											damage = {amount = ammoData.APHE * 0.333, type = "laser"}
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
						},
					},
				}
			}
		},
		order = items[modname.."2"].order.."-a[ammo]",
	},

	--[[{
		type = "projectile",
		name = "kj_ray_projectile",
		flags = {"not-on-map"},
		force_condition = "not-same", 
		height = 0,
		collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
		acceleration = 0,
		piercing_damage = APDW,
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
				damage = {amount = APAP , type = "physical"}
			  },
			  {
				type = "create-entity",
				entity_name = "explosion"
			  },
				{
					type = "destroy-cliffs",
					radius = 3,
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
				  radius = 3,
				  action_delivery =
				  {
					type = "instant",
					target_effects =
					{
					  {
						type = "damage",
						damage = {amount = APAP, type = "physical"}
					  },
					  {
						type = "damage",
						damage = {amount = APHE, type = "explosion"}
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
		height = 0,
	},]]
})