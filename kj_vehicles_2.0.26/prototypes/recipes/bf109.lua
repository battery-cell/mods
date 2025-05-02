local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_bf109",
		enabled = false,
		energy_required = 200,
		ingredients = tables.recipes["kj_2a6"],
		results = {{type = "item", name = "kj_bf109", amount = 1}},
	},
})