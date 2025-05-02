local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_pak",
		enabled = false,
		energy_required = 60,
		ingredients = tables.recipes["kj_pak"],
		results = {{type = "item", name = "kj_pak", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_pak_turret",
		enabled = false,
		energy_required = 60,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 25},
			{type = "item", name = "iron-gear-wheel", amount = 5},
			{type = "item", name = "engine-unit", amount = 3},
		},
		results = {{type = "item", name = "kj_pak_turret", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_pak_ap",
		enabled = false,
		results = {{type = "item", name = "kj_pak_ap", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_pak_he",
		enabled = false,
		results = {{type = "item", name = "kj_pak_he", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_pak_inc",
		enabled = false,
		results = {{type = "item", name = "kj_pak_inc", amount = 1}}
	},
})