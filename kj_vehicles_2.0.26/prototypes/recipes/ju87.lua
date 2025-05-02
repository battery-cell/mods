local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_ju87",
		enabled = false,
		energy_required = 240,
		ingredients = tables.recipes["kj_ju87"],
		results = {{type = "item", name = "kj_ju87", amount = 1}},
	},
})