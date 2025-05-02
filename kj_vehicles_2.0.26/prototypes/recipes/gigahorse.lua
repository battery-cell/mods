local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_gigahorse",
		enabled = false,
		energy_required = 20,
		ingredients = tables.recipes["kj_gigahorse"],
		results = {{type = "item", name = "kj_gigahorse", amount = 1}},
	},
})