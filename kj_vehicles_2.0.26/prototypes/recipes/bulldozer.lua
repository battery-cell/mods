local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_bulldozer",
		enabled = false,
		energy_required = 25,
		ingredients = tables.recipes["kj_bulldozer"],
		results = {{type = "item", name = "kj_bulldozer", amount = 1}},
	},
})