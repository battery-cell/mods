local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_laser",
		enabled = false,
		energy_required = 30,
		ingredients = tables.recipes["kj_laser"],
		results = {{type = "item", name = "kj_laser", amount = 1}},
	},
	{
		type = "recipe",
		name = "kj_laser_normal",
		enabled = false,
		energy_required = 300,
		category = "advanced-crafting",
		ingredients = {
			{type = "item", name = "stone", amount = 500},
		},
		results = {{type = "item", name = "kj_laser_normal", amount = 1}},
	},
})