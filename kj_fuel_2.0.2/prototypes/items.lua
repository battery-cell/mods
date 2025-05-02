local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
-- Gas Can Empty
	{
		type = "item",
		name = "kj_gascan_empty",
		icon = "__kj_fuel__/graphics/gascan_empty.png",
		icon_size = 128,
		subgroup = "kj_fuels",
		order = "aa",
		stack_size = 10,
		inventory_move_sound = item_sounds.metal_chest_inventory_move,
		pick_sound = item_sounds.metal_chest_inventory_pickup,
		drop_sound = item_sounds.metal_chest_inventory_move,
		weight = 10 * 1000,
	},

	{
		type = "item",
		name = "kj_energy_cell_empty",
		icon = "__kj_fuel__/graphics/nuclear-fuel-empty.png",
		subgroup = "kj_fuels",
		order = "ab",
		stack_size = 10,
		inventory_move_sound = item_sounds.fuel_cell_inventory_move,
		pick_sound = item_sounds.fuel_cell_inventory_pickup,
		drop_sound = item_sounds.fuel_cell_inventory_move,
		weight = 100 * 1000,
	},

	{
		type = "item",
		name = "kj_gascan",
		icon = "__kj_fuel__/graphics/gascan.png",
		icon_size = 128,
		subgroup = "kj_fuels",
		order = "m",
		stack_size = 4,
		burnt_result = "kj_gascan_empty",
		fuel_value = "24MJ",
		fuel_acceleration_multiplier = 1.8,
		fuel_category = "kj_gas_can",
		inventory_move_sound = item_sounds.metal_chest_inventory_move,
		pick_sound = item_sounds.metal_chest_inventory_pickup,
		drop_sound = item_sounds.metal_chest_inventory_move,
		weight = 10 * 1000,
	},

	{
		type = "item",
		name = "kj_energy_cell",
		icon = "__kj_fuel__/graphics/nuclear-fuel.png",
		pictures =
		{
			layers =
			{
				{
					size = 64,
					filename = "__kj_fuel__/graphics/nuclear-fuel.png",
					scale = 0.25,
					mipmap_count = 4
				},
				{
					draw_as_light = true,
					flags = {"light"},
					size = 64,
					filename = "__kj_fuel__/graphics/nuclear-fuel-light.png",
					scale = 0.25,
					mipmap_count = 4
				}
			}
		},
		subgroup = "kj_fuels",
		order = "p",
		stack_size = 1,
		burnt_result = "kj_energy_cell_empty",
		fuel_value = "1GJ",
		fuel_acceleration_multiplier = 2.5,
		fuel_top_speed_multiplier = 1.15,
		fuel_glow_color = {r = 0.87, g = 1, b = 0.01},
		fuel_category = "kj_energy_cell",
		inventory_move_sound = item_sounds.fuel_cell_inventory_move,
		pick_sound = item_sounds.fuel_cell_inventory_pickup,
		drop_sound = item_sounds.fuel_cell_inventory_move,
		weight = 100 * 1000,
	},

	{
		type = "item",
		name = "kj_kerosine",
		icon = "__kj_fuel__/graphics/kerosene.png",
		icon_size = 128,
		subgroup = "kj_fuels",
		order = "n",
		stack_size = 10,
		burnt_result = "kj_gascan_empty",
		fuel_value = "100MJ",
		fuel_acceleration_multiplier = 1.5,
		fuel_category = "kj_kerosine",
		inventory_move_sound = item_sounds.metal_chest_inventory_move,
		pick_sound = item_sounds.metal_chest_inventory_pickup,
		drop_sound = item_sounds.metal_chest_inventory_move,
		weight = 10 * 1000,
	},

	{
		type = "item",
		name = "kj_gasbarrel",
		icon = "__kj_fuel__/graphics/gasbarrel.png",
		subgroup = "kj_fuels",
		order = "o",
		stack_size = 5,
		burnt_result = "barrel",
		fuel_value = "60MJ",
		fuel_acceleration_multiplier = 1,
		fuel_category = "kj_gas_barrel",
		inventory_move_sound = item_sounds.metal_chest_inventory_move,
		pick_sound = item_sounds.metal_chest_inventory_pickup,
		drop_sound = item_sounds.metal_chest_inventory_move,
		weight = 10 * 1000,
	},
})