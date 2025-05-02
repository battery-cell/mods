local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_747",
		enabled = false,
		energy_required = 700,
		ingredients = tables.recipes["kj_747"],
		results = {{type = "item", name = "kj_747", amount = 1}},
	},
})