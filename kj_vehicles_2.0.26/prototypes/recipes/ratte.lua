local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_rattetank",
		enabled = false,
		energy_required = 3000,
		ingredients = tables.recipes["kj_rattetank"],
		results = {{type = "item", name = "kj_rattetank", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_280SKC34_ap",
		enabled = false,
		results = {{type = "item", name = "kj_280SKC34_ap", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_280SKC34_he",
		enabled = false,
		results = {{type = "item", name = "kj_280SKC34_he", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_280SKC34_inc",
		enabled = false,
		results = {{type = "item", name = "kj_280SKC34_inc", amount = 1}},
	},
})