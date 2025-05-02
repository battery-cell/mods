if not data.raw["ammo"]["kj_bolt"] then
	data:extend({
		{
			type = "ammo-category",
			name = "kj_bolter",
			icon = "__kj_vehicles__/graphics/category_bolt.png",
			icon_size = 128,
			order = "kj-40k-0",
			subgroup = "ammo-category",
		},

		{
			type = "recipe",
			name = "kj_bolt",
			enabled = false,
			energy_required = 15,
			ingredients =
			{
				{type = "item", name = "steel-plate", amount = 2},
				{type = "item", name = "plastic-bar", amount = 2},
				{type = "item", name = "explosives", amount = 2}
			},
			results = {{type = "item", name = "kj_bolt", amount = 1}},
		},

		{
			type = "ammo",
			name = "kj_bolt",
			icon = "__kj_vehicles__/graphics/bolt.png",
			ammo_category = "kj_bolter",
			ammo_type =
			{
			  action =
				{
					type = "direct",
					repeat_count = 1,
					action_delivery =
					{
						type = "projectile",
						projectile = "kj_bolt_projectile",
						starting_speed = 3,
						direction_deviation = 0.1,
						range_deviation = 0.1,
						max_range = 25,
						min_range = 3,
						source_effects =
						{
							type = "create-explosion",
							entity_name = "explosion-gunshot"
						},
					},
				},
			},
			order = "2[military]-40k-0",
		},

		{
			type = "projectile",
			name = "kj_bolt_projectile",
			flags = {"not-on-map"},
			hidden = true,
			force_condition = "not-same",
			height = 0,
			collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
			acceleration = 0,
			piercing_damage = 550,
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
							damage = {amount = 40, type = "physical"}
						},
						{
							type = "push-back",
							distance = 2,
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
							entity_name = "explosion"
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
											damage = {amount = 100, type = "explosion"}
										},
										{
											type = "push-back",
											distance = 2,
										},
									}
								}
							}
						},
						{
							type = "create-entity",
							entity_name = "small-scorchmark-tintable",
							check_buildability = true
						},
					}
				}
			},
			animation =
			{
				filename = "__base__/graphics/entity/bullet/bullet.png",
				draw_as_glow = true,
				frame_count = 1,
				width = 3,
				height = 50,
				priority = "high"
			}
		},
	})

	table.insert(data.raw["technology"]["physical-projectile-damage-5"].effects,
		{
			type = "ammo-damage",
			ammo_category = "kj_bolter",
			modifier = 0.3,
		}
	)
	table.insert(data.raw["technology"]["physical-projectile-damage-6"].effects,
		{
			type = "ammo-damage",
			ammo_category = "kj_bolter",
			modifier = 0.4,
		}
	)
	table.insert(data.raw["technology"]["physical-projectile-damage-7"].effects,
		{
			type = "ammo-damage",
			ammo_category = "kj_bolter",
			modifier = 0.5,
		}
	)
	table.insert(data.raw["technology"]["weapon-shooting-speed-5"].effects,
		{
			type = "gun-speed",
			ammo_category = "kj_bolter",
			modifier = 0.5,
		}
	)
	table.insert(data.raw["technology"]["weapon-shooting-speed-6"].effects,
		{
			type = "gun-speed",
			ammo_category = "kj_bolter",
			modifier = 0.5,
		}
	)

	local max = 1
	if settings.startup["kj_40kbanebladeammo_cost_setting_multiplicator"] ~= nil then
		max = math.max(max, settings.startup["kj_40kbanebladeammo_cost_setting_multiplicator"].value)
	end
	if settings.startup["kj_40kdreadnoughtammo_cost_setting_multiplicator"] ~= nil then
		max = math.max(max, settings.startup["kj_40kdreadnoughtammo_cost_setting_multiplicator"].value)
	end
	if settings.startup["kj_40klemanrussammo_cost_setting_multiplicator"] ~= nil then
		max = math.max(1, settings.startup["kj_40klemanrussammo_cost_setting_multiplicator"].value)
	end
	if settings.startup["kj_40kpredatorammo_cost_setting_multiplicator"] ~= nil then
		max = math.max(max, settings.startup["kj_40kpredatorammo_cost_setting_multiplicator"].value)
	end

	for _, ingredient in ipairs(data.raw["recipe"]["kj_bolt"].ingredients) do
		ingredient.amount = ingredient.amount * max
	end
end
