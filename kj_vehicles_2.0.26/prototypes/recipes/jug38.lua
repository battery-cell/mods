local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_jug38",
		enabled = false,
		energy_required = 480,
		ingredients = tables.recipes["kj_jug38"],
		results = {{type = "item", name = "kj_jug38", amount = 1}},
	},
})