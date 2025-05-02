local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_40kbaneblade",
		enabled = false,
		energy_required = 1000,
		ingredients = tables.recipes["kj_40kbaneblade"],
		results = {{type = "item", name = "kj_40kbaneblade", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_baneblade_normal",
		enabled = false,
		results = {{type = "item", name = "kj_baneblade_normal", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_baneblade_artillery",
		enabled = false,
		results = {{type = "item", name = "kj_baneblade_artillery", amount = 1}}
	},
})