local item = util.table.deepcopy(data.raw["item-with-entity-data"]["locomotive"])
item.name = "armored-locomotive-mk1"
item.icon = "__Armored-train__/assets/graphics/icons/armored-locomotive-mk1.png"
item.icon_size = 64
item.icon_mipmaps = 4
item.order = "c[rolling-stock]-e[cargo-wagon]"
item.place_result = "armored-locomotive-mk1"
data:extend
({
	item
})
	
local recipe = util.table.deepcopy(data.raw["recipe"]["locomotive"])
recipe.name = "armored-locomotive-mk1"
recipe.enabled = false						
recipe.ingredients =
{
	{type = "item", name = "steel-plate", amount = 60},	
	{type = "item", name = "electronic-circuit", amount = 10},				
	{type = "item", name = "engine-unit", amount = 40}	
}
recipe.results = {{type="item", name="armored-locomotive-mk1", amount = 1}}
data:extend
({
	recipe
})

--------------
--- ENTITY ---
--------------
-- Deep copy base data and create new one with custom parametres
local l_armored_locomotive_mk1 = util.table.deepcopy(data.raw["locomotive"]["locomotive"])
l_armored_locomotive_mk1.name = "armored-locomotive-mk1"
l_armored_locomotive_mk1.icon = "__Armored-train__/assets/graphics/icons/armored-locomotive-mk1.png"
l_armored_locomotive_mk1.icon_size = 64
l_armored_locomotive_mk1.icon_mipmaps = 4
l_armored_locomotive_mk1.minable.result = "armored-locomotive-mk1"
l_armored_locomotive_mk1.max_health = 2000
l_armored_locomotive_mk1.weight = 4000
l_armored_locomotive_mk1.max_speed = 1
l_armored_locomotive_mk1.max_power = "800kW"
l_armored_locomotive_mk1.energy_source.fuel_inventory_size = 5
-- Animation
l_armored_locomotive_mk1.pictures.rotated =	
{
	layers =
	{
		{
			priority = "very-low",
			width = 512, 
			height = 512,
			direction_count = 256,
			allow_low_quality_rotation = true,
			line_length = 8,
			lines_per_file = 8,
			shift = util.by_pixel(0, -10),
			scale = 0.6,
			filenames =
			{
				"__Armored-train__/assets/graphics/armored-locomotive-mk1/armored-locomotive-mk1-1.png",
				"__Armored-train__/assets/graphics/armored-locomotive-mk1/armored-locomotive-mk1-2.png",
				"__Armored-train__/assets/graphics/armored-locomotive-mk1/armored-locomotive-mk1-3.png",
				"__Armored-train__/assets/graphics/armored-locomotive-mk1/armored-locomotive-mk1-4.png"
			}
		},
		{
			priority = "very-low",
			flags = { "mask" },
			width = 512, 
			height = 512,
			direction_count = 256,
			allow_low_quality_rotation = true,
			line_length = 8,
			lines_per_file = 8,
			shift = util.by_pixel(0, -10),
			apply_runtime_tint = true,
			scale = 0.6,
			-- Somehow it is different from turret masks (use transparency 192)
			filenames =
			{
				"__Armored-train__/assets/graphics/armored-locomotive-mk1/armored-locomotive-mk1-mask-1.png",
				"__Armored-train__/assets/graphics/armored-locomotive-mk1/armored-locomotive-mk1-mask-2.png",
				"__Armored-train__/assets/graphics/armored-locomotive-mk1/armored-locomotive-mk1-mask-3.png",
				"__Armored-train__/assets/graphics/armored-locomotive-mk1/armored-locomotive-mk1-mask-4.png"
			}
		}
		--[[,
		-- Shadow
		
		{
			priority = "very-low",
			flags = { "shadow" },
			width = 253,
			height = 212,
			direction_count = 256,
			draw_as_shadow = true,
			allow_low_quality_rotation = true,
			filenames =
			{
				"__base__/graphics/entity/locomotive/locomotive-shadow-1.png",
				"__base__/graphics/entity/locomotive/locomotive-shadow-2.png",
				"__base__/graphics/entity/locomotive/locomotive-shadow-3.png",
				"__base__/graphics/entity/locomotive/locomotive-shadow-4.png",
				"__base__/graphics/entity/locomotive/locomotive-shadow-5.png",
				"__base__/graphics/entity/locomotive/locomotive-shadow-6.png",
				"__base__/graphics/entity/locomotive/locomotive-shadow-7.png",
				"__base__/graphics/entity/locomotive/locomotive-shadow-8.png"
			},
			line_length = 4,
			lines_per_file = 8,
			shift = {0.5, 0.3}
		}
		--]]
	}
}
-- minimap representation
l_armored_locomotive_mk1.minimap_representation =
{
	filename = "__Armored-train__/assets/graphics/icons/armored-locomotive-mk1-minimap-representation.png",
	flags = {"icon"},
	size = {20, 40},
	scale = 0.5
}
l_armored_locomotive_mk1.selected_minimap_representation =
{
	filename = "__Armored-train__/assets/graphics/icons/armored-locomotive-mk1-selected-minimap-representation.png",
	flags = {"icon"},
	size = {20, 40},
	scale = 0.5
}
	
-- Write result
data:extend
({
	l_armored_locomotive_mk1
})