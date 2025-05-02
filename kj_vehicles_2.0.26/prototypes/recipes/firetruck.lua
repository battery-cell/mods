local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_firetruck",
		enabled = false,
		energy_required = 25,
		ingredients = tables.recipes["kj_firetruck"],
		results = {{type = "item", name = "kj_firetruck", amount = 1}},
	},
})