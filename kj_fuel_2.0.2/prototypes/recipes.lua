data:extend({
	{
		type = "recipe",
		name = "kj_gascan_empty",
		enabled = false,
		subgroup = "kj_fuels",
		order = "a",
		ingredients = {
			{type = "item", name = "steel-plate", amount = 1},
		},
		energy_required = 1,
		results = {{type = "item", name = "kj_gascan_empty", amount = 1}},
		category = "crafting",
		hidden = false,
	},

	{
		type = "recipe",
		name = "kj_gascan_fill",
		enabled = false,
		subgroup = "kj_fuels",
		order = "m",
		ingredients =  {
			{type = "item", name = "kj_gascan_empty", amount = 1},
			{type = "fluid", name = "light-oil", amount = 20.0, },
		},
		energy_required = 0.2,
		results = {{type = "item", name = "kj_gascan", amount = 1}},
		category = "crafting-with-fluid",
		hidden = false,
	},

	{
		type = "recipe",
		name = "kj_energy_cell_empty",
		enabled = false,
		subgroup = "kj_fuels",
		order = "b",
		ingredients = {
			{type = "item", name = "uranium-235", amount = 10},
		},
		energy_required = 60,
		results = {{type = "item", name = "kj_energy_cell_empty", amount = 1}},
		category = "crafting",
		hidden = false,
	},

	{
		type = "recipe",
		name = "kj_energy_cell_load",
		enabled = false,
		subgroup = "kj_fuels",
		order = "p",
		ingredients = {
			{type = "item", name = "kj_energy_cell_empty", amount = 1},
		},
		energy_required = 60,
		results = {{type = "item", name = "kj_energy_cell", amount = 1}},
		category = "crafting-with-fluid",
		hidden = false,
	},

	{
		type = "recipe",
		name = "kj_kerosine_fill",
		enabled = false,
		subgroup = "kj_fuels",
		order = "n",
		ingredients = {
			{type = "item", name = "kj_gascan_empty", amount = 1},
			{type = "fluid", name = "light-oil", amount = 120.0},
		},
		energy_required = 5,
		results = {{type = "item", name = "kj_kerosine", amount = 1}},
		category = "crafting-with-fluid",
		hidden = false,
	},

	{
		type = "recipe",
		name = "kj_gasbarrel_fill",
		enabled = false,
		subgroup = "kj_fuels",
		order = "o",
		ingredients = {
			{type = "item", name = "barrel", amount = 1},
			{type = "fluid", name = "light-oil", amount = 50.0},
		},
		energy_required = 0.2,
		results = {{type = "item", name = "kj_gasbarrel", amount = 1}},
		category = "crafting-with-fluid",
		hidden = false,
	}
})