local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_phalanx",
		enabled = false,
		energy_required = 45,
		ingredients = tables.recipes["kj_phalanx"],
		results = {{type = "item", name = "kj_phalanx", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_apds_normal",
		enabled = false,
		energy_required = 300,
		localised_name = {"", {"recipe-name.kj_apds_normal"}},
		localised_description = {"", {"recipe-description.kj_apds_normal"}},
		ingredients =
		{
			{type = "item", name = "kj_apds_normal_single", amount = 1500},
		},
		results = {{type = "item", name = "kj_apds_normal", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_apds_normal_single",
		enabled = false,
		localised_name = {"", {"recipe-name.kj_apds_normal_single"}},
		localised_description = {"", {"recipe-description.kj_apds_normal_single"}},
		results = {{type = "item", name = "kj_apds_normal_single", amount = 2}},
	},
})