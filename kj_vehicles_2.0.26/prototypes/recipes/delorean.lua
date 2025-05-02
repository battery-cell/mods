local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_delorean",
		enabled = false,
		energy_required = 15,
		ingredients = tables.recipes["kj_delorean"],
		results = {{type = "item", name = "kj_delorean", amount = 1}},
	},
})