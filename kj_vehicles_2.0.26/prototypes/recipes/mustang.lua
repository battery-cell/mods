local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_fordmustang",
		enabled = false,
		energy_required = 15,
		ingredients = tables.recipes["kj_fordmustang"],
		results = {{type = "item", name = "kj_fordmustang", amount = 1}},
	},
})