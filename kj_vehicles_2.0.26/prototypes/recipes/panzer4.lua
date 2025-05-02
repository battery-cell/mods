local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_panzer4",
		enabled = false,
		energy_required = 200,
		ingredients = tables.recipes["kj_panzer4"],
		results = {{type = "item", name = "kj_panzer4", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_mg34_hand",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
			{type = "item", name = "iron-gear-wheel", amount = 4},
			{type = "item", name = "iron-plate", amount = 4},
			{type = "item", name = "copper-plate", amount = 4},
			{type = "item", name = "iron-stick", amount = 8}
		},
		results = {{type = "item", name = "kj_mg34_hand", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_75kwk40_ap",
		enabled = false,
		results = {{type = "item", name = "kj_75kwk40_ap", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_75kwk40_he",
		enabled = false,
		results = {{type = "item", name = "kj_75kwk40_he", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_75kwk40_aphe",
		enabled = false,
		results = {{type = "item", name = "kj_75kwk40_aphe", amount = 1}}
	},
})