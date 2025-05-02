local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_aventador",
		enabled = false,
		energy_required = 25,
		ingredients = tables.recipes["kj_aventador"],
		results = {{type = "item", name = "kj_aventador", amount = 1}}
	},
})