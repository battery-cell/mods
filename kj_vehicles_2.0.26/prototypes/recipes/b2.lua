local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_b2",
		enabled = false,
		energy_required = 750,
		ingredients = tables.recipes["kj_b2"],
		results = {{type = "item", name = "kj_b2", amount = 1}},
	},
})