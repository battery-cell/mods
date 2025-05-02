local tables = require("tables")
local ingredients1 = tables.recipes["kj_40kbunker"]
local ingredients2 = table.deepcopy(ingredients1)
data:extend({
	{
		type = "recipe",
		name = "kj_40kbunker",
		enabled = false,
		energy_required = 300,
		ingredients = ingredients1,
		results = {{type = "item", name = "kj_40kbunker", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_40kbunker_turret",
		enabled = false,
		energy_required = 300,
		ingredients = ingredients2,
		results = {{type = "item", name = "kj_40kbunker_turret", amount = 1}},
	},
})