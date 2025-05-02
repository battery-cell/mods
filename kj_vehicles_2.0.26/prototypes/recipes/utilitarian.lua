local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_utilitarian",
		enabled = false,
		energy_required = 25,
		ingredients = tables.recipes["kj_utilitarian"],
		results = {{type = "item", name = "kj_utilitarian", amount = 1}},
	},
})