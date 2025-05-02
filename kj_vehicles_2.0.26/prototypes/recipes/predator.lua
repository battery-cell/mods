local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_40kpredator",
		enabled = false,
		energy_required = 360,
		ingredients = tables.recipes["kj_40kpredator"],
		results = {{type = "item", name = "kj_40kpredator", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_predator_normal",
		enabled = false,
		results = {{type = "item", name = "kj_predator_normal", amount = 1}}
	},
})