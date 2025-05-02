local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_tower",
		enabled = false,
		energy_required = 60,
		ingredients = tables.recipes["kj_tower"],
		results = {{type = "item", name = "kj_tower", amount = 1}},
	},
})