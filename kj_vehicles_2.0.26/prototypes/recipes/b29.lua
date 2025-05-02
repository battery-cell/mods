local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_b29",
		enabled = false,
		energy_required = 500,
		ingredients = tables.recipes["kj_b29"],
		results = {{type = "item", name = "kj_b29", amount = 1}},
	},
})