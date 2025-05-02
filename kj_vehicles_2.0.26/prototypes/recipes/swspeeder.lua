local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_swspeeder",
		enabled = false,
		energy_required = 15,
		ingredients = tables.recipes["kj_swspeeder"],
		results = {{type = "item", name = "kj_swspeeder", amount = 1}},
	},
})