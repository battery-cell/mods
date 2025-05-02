local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_b17",
		enabled = false,
		energy_required = 420,
		ingredients = tables.recipes["kj_b17"],
		results = {{type = "item", name = "kj_b17", amount = 1}},
	},
})