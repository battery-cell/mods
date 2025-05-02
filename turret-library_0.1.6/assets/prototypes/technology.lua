data:extend
({
	-- Basic stuff
	{
		type = "technology",
		name = "modular-turrets",
		icon = "__turret-library__/assets/graphics/technology/minigun-turret-mk1-technology.png",
		icon_size = 256,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "minigun-turret-mk1-equipment"
			},
			{
				type = "unlock-recipe",
				recipe = "shotgun-turret-mk1-equipment"
			}
		},
		prerequisites = {"gun-turret", "military"},
		unit =
		{
			count = data.raw["technology"]["automobilism"]["unit"]["count"] / 2,
			ingredients = data.raw["technology"]["automobilism"]["unit"]["ingredients"],
			time = data.raw["technology"]["automobilism"]["unit"]["time"] / 2
		},
		order = "e-g"
	},
	-- CANNON MK1
	{
		type = "technology",
		name = "modular-cannon-mk1",
		icon = "__turret-library__/assets/graphics/technology/cannon-turret-mk1-technology.png",
		icon_size = 256,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "cannon-turret-mk1-equipment"
			}
		},
		prerequisites = {"modular-turrets", "tank"},
		unit =
		{
			count = data.raw["technology"]["tank"]["unit"]["count"] / 2,
			ingredients = data.raw["technology"]["tank"]["unit"]["ingredients"],
			time = data.raw["technology"]["tank"]["unit"]["time"] / 2
		},
		order = "e-g"
	},
	-- CANNON MK2
	{
		type = "technology",
		name = "modular-cannon-mk2",
		icon = "__turret-library__/assets/graphics/technology/cannon-turret-mk2-technology.png",
		icon_size = 256,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "cannon-turret-mk2-equipment"
			}
		},
		prerequisites = {"modular-turrets", "artillery"},
		unit =
		{
			-- /2 is too expensive for silli cannon!
			count = data.raw["technology"]["artillery"]["unit"]["count"] / 4,
			ingredients = data.raw["technology"]["artillery"]["unit"]["ingredients"],
			time = data.raw["technology"]["artillery"]["unit"]["time"] / 4
		},
		order = "e-g"
	},
	-- ROCKET MK1 MK2
	{
		type = "technology",
		name = "modular-rocket-launcher-mk1-mk2",
		icon = "__turret-library__/assets/graphics/technology/rocket-turret-mk1-mk2-technology.png",
		icon_size = 256,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "rocket-turret-mk1-equipment"
			},
			{
				type = "unlock-recipe",
				recipe = "rocket-turret-mk2-equipment"
			}
		},
		prerequisites = {"modular-turrets", "rocketry"},
		unit =
		{
			count = data.raw["technology"]["rocketry"]["unit"]["count"] / 2,
			ingredients = data.raw["technology"]["rocketry"]["unit"]["ingredients"],
			time = data.raw["technology"]["rocketry"]["unit"]["time"] / 2
		},
		order = "e-g"
	},
	-- FLAMETHROWER MK1
	{
		type = "technology",
		name = "modular-flamethrower-mk1",
		icon = "__turret-library__/assets/graphics/technology/flamethrower-turret-mk1-technology.png",
		icon_size = 256,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "flamethrower-turret-mk1-equipment"
			}
		},
		prerequisites = {"modular-turrets", "flamethrower"},
		unit =
		{
			count = data.raw["technology"]["flamethrower"]["unit"]["count"] / 2,
			ingredients = data.raw["technology"]["flamethrower"]["unit"]["ingredients"],
			time = data.raw["technology"]["flamethrower"]["unit"]["time"] / 2
		},
		order = "e-g"
	},
	-- RADAR MK1
	{
		type = "technology",
		name = "modular-radar-mk1",
		icon = "__turret-library__/assets/graphics/technology/radar-mk1-technology.png",
		icon_size = 256,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "radar-mk1-equipment"
			}
		},
		prerequisites = {"modular-turrets", "radar"},
		unit =
		{
			count = data.raw["technology"]["radar"]["unit"]["count"] / 2,
			ingredients = data.raw["technology"]["radar"]["unit"]["ingredients"],
			time = data.raw["technology"]["radar"]["unit"]["time"] / 2
		},
		order = "e-g"
	},
	-- SEARCHLIGHT MK1 
	{
		type = "technology",
		name = "modular-searchlight-mk1",
		icon = "__turret-library__/assets/graphics/technology/searchlight-turret-mk1-technology.png",
		icon_size = 256,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "searchlight-turret-mk1-equipment"
			}
		},
		prerequisites = {"modular-turrets", "lamp"},
		unit =
		{
			count = data.raw["technology"]["lamp"]["unit"]["count"] / 2,
			ingredients = data.raw["technology"]["lamp"]["unit"]["ingredients"],
			time = data.raw["technology"]["lamp"]["unit"]["time"] / 2
		},
		order = "e-g"
	},
	-- REPAIR ARM MK1 
	{
		type = "technology",
		name = "modular-repair-arm-mk1",
		icon = "__turret-library__/assets/graphics/technology/repair-arm-mk1-technology.png",
		icon_size = 256,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "repair-arm-mk1-equipment"
			}
		},
		prerequisites = {"modular-turrets", "repair-pack"},
		unit =
		{
			count = data.raw["technology"]["repair-pack"]["unit"]["count"] / 2,
			ingredients = data.raw["technology"]["repair-pack"]["unit"]["ingredients"],
			time = data.raw["technology"]["repair-pack"]["unit"]["time"] / 2
		},
		order = "e-g"
	}
})