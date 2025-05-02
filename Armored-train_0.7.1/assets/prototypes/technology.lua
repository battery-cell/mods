data:extend
({
	-- Basic stuff
	{
		type = "technology",
		name = "armored-train-mk1",
		icon = "__Armored-train__/assets/graphics/technology/armored-train-mk1-technology.png",
		icon_size = 256,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "armored-locomotive-mk1"
			},
			{
				type = "unlock-recipe",
				recipe = "combat-platform-mk1"
			}
		},
		prerequisites = {"gun-turret", "military", "railway"},
		unit =
		{
			count = data.raw["technology"]["automobilism"]["unit"]["count"] / 2,
			ingredients = data.raw["technology"]["automobilism"]["unit"]["ingredients"],
			time = data.raw["technology"]["automobilism"]["unit"]["time"] / 2
		},
		order = "e-g"
	},
	-- PLATFROM MK2
	{
		type = "technology",
		name = "armored-train-mk2",
		icon = "__Armored-train__/assets/graphics/technology/armored-train-mk2-technology.png",
		icon_size = 256,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "combat-platform-mk2"
			}
		},
		prerequisites = {"armored-train-mk1", "artillery"},
		unit =
		{	
			count = data.raw["technology"]["artillery"]["unit"]["count"] / 2,
			ingredients = data.raw["technology"]["artillery"]["unit"]["ingredients"],
			time = data.raw["technology"]["artillery"]["unit"]["time"] / 2,
			time = 15
		},
		order = "e-g"
	}
})