local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_cybertruck",
		enabled = false,
		energy_required = 15,
		ingredients = tables.recipes["kj_cybertruck"],
		results = {{type = "item", name = "kj_cybertruck", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_el_charge",
		enabled = false,
		energy_required = 260,
		--subgroup = "transport",
		--order = "y",
		ingredients =
		{
			{type = "item", name = "battery", amount = 25},
			{type = "item", name = "iron-plate", amount = 25},
		},
		results = {{type = "item", name = "kj_el_charge", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_el_charge_recycle_1",
		enabled = false,
		hidden = false,
		energy_required = 1290,
		--subgroup = "transport",
		--order = "z",
		ingredients =
		{
			{type = "item", name = "kj_el_charge_used", amount = 1},
		},
		results = {{type = "item", name = "kj_el_charge", amount = 1}},
		category = "assembling-machine-one",
	},

	{
		type = "recipe",
		name = "kj_el_charge_recycle_2",
		enabled = false,
		hidden = false,
		energy_required = 645,
		--subgroup = "transport",
		--order = "z",
		ingredients =
		{
			{type = "item", name = "kj_el_charge_used", amount = 1},
		},
		results = {{type = "item", name = "kj_el_charge", amount = 1}},
		category = "assembling-machine-two",
	},

	{
		type = "recipe",
		name = "kj_el_charge_recycle_3",
		enabled = false,
		hidden = false,
		energy_required = 257,
		--subgroup = "transport",
		--order = "z",
		ingredients =
		{
			{type = "item", name = "kj_el_charge_used", amount = 1},
		},
		results = {{type = "item", name = "kj_el_charge", amount = 1}},
		category = "assembling-machine-three",
	},
})