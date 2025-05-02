local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_ho229",
		enabled = false,
		energy_required = 600,
		ingredients = tables.recipes["kj_2a6"],
		results = {{type = "item", name = "kj_ho229", amount = 1}},
	},
})