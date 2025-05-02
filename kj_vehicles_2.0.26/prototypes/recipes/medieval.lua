local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_ballista",
		enabled = false,
		energy_required = 30,
		ingredients = tables.recipes["kj_ballista"],
		results = {{type = "item", name = "kj_ballista", amount = 1}},
	},
	{
		type = "recipe",
		name = "kj_ballista_normal",
		enabled = false,
		energy_required = 5,
		ingredients = {
			{type = "item", name = "iron-stick", amount = 5},
		},
		results = {{type = "item", name = "kj_ballista_normal", amount = 1}},
	},
})