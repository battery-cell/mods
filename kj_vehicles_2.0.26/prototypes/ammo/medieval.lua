local ammoData = require("tables").ammoData.kj_ballista
local items = require("tables").items
local modname = "kj_medieval_warfare"

data:extend({
	{
		type = "ammo",
		name = "kj_ballista_normal",
		icon = "__kj_medieval_warfare__/graphics/ammo.png",
		ammo_category = "kj_ballista_normal",
		ammo_type =
		{
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "kj_ballista_normal_projectile",
					starting_speed = 1,
					max_range = 50,
					source_effects =
					{
						type = "create-explosion",
						entity_name = "explosion-hit"
					}
				}
			}
		},
		order = items[modname].order.."-a",
	},


	{
		type = "projectile",
		name = "kj_ballista_normal_projectile",
		flags = {"not-on-map"},
		--force_condition = "not-same",
		hidden = true,
		acceleration = 0.01,
		turn_speed = 0.01,
		turning_speed_increases_exponentially_with_projectile_speed = true,
		final_action =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "damage",
						damage = {amount = ammoData.NP , type = "physical"}
					},
					{
						type = "damage",
						damage = {amount = ammoData.NF , type = "flak"}
					},
					{
						type = "create-entity",
						entity_name = "explosion"
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
	}
})