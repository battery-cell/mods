local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_40klemanruss",
		enabled = false,
		energy_required = 360,
		ingredients = tables.recipes["kj_40klemanruss"],
		results = {{type = "item", name = "kj_40klemanruss", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_lemanruss_normal",
		enabled = false,
		results = {{type = "item", name = "kj_lemanruss_normal", amount = 1}},
	},
})