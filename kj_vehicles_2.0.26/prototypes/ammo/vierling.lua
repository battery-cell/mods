local ammoData = require("tables").ammoData.kj_vierling
local items = require("tables").items
local modname = "kj_vierling"

local flak_impact =
{
	{
		filename = "__base__/sound/fight/poison-capsule-explosion-1.ogg",
		volume = 0.6
	},
	{
		filename = "__base__/sound/fight/poison-capsule-explosion-2.ogg",
		volume = 0.6
	},
	{
		filename = "__base__/sound/fight/poison-capsule-explosion-3.ogg",
		volume = 0.6
	},
	{
		filename = "__base__/sound/fight/poison-capsule-explosion-4.ogg",
		volume = 0.6
	},
	{
		filename = "__base__/sound/fight/poison-capsule-explosion-5.ogg",
		volume = 0.6
	},
}

data:extend({
	{
		type = "ammo",
		name = "kj_2cmfv_normal_vierling",
		icon = "__kj_vierling__/graphics/ammo.png",
		ammo_category = "kj_2cmfv_vierling",
		ammo_type =
		{
			action =
			{
				{
					type = "direct",
					action_delivery =
					{
						{
							type = "instant",
							source_effects =
							{
								{
									type = "create-explosion",
									entity_name = "explosion-gunshot",
									offset_deviation = {{-0.5, -0.1}, {0.5, 0.1}}
								}
							},
							target_effects =
							{
								{
									type = "create-entity",
									entity_name = "explosion-hit",
									offsets = {{0, 1}},
									offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
								},
								{
									type = "play-sound",
									sound = flak_impact,
									play_on_target_position = true,
								},

								{
									type = "damage",
									damage = { amount = ammoData.NF , type = "flak"}
								},
								{
									type = "damage",
									damage = { amount = ammoData.NE , type = "explosion"}
								},
								{
									type = "damage",
									damage = { amount = ammoData.NP , type = "physical"}
								},
							}
						}
					}
				}
		  }
		},
		order = items[modname].order.."-a[normal]",
	},
})