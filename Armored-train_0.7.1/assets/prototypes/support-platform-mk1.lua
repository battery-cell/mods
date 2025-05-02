local equipmentGrid = util.table.deepcopy(data.raw["equipment-grid"]["small-equipment-grid"])
equipmentGrid.name = "support-platform-mk1-equipment-grid"
equipmentGrid.equipment_categories = {"modular-turret", "modular-turret-equipment"}
data:extend
({
	equipmentGrid
})

local item = util.table.deepcopy(data.raw["item-with-entity-data"]["cargo-wagon"])
item.name = "support-platform-mk1"
item.icon = "__Armored-train__/assets/graphics/icons/support-platform-mk1.png"
item.icon_size = 64
item.icon_mipmaps = 4
item.order = "c[rolling-stock]-o[cargo-wagon]"
item.place_result = "support-platform-mk1"
data:extend
({
	item
})
	
local recipe = util.table.deepcopy(data.raw["recipe"]["cargo-wagon"])
recipe.name = "support-platform-mk1"
recipe.enabled = false						
recipe.ingredients =
{
	{type = "item", name = "iron-plate", amount = 20},			
	{type = "item", name = "steel-plate", amount = 20},
	{type = "item", name = "iron-gear-wheel", amount = 10},
	-- Unique
	{type = "item", name = "burner-inserter", amount = 1}			
}
recipe.results = {{type="item", name="support-platform-mk1", amount = 1}}
data:extend
({
	recipe
})

local entity = util.table.deepcopy(data.raw["cargo-wagon"]["cargo-wagon"])
entity.name = "support-platform-mk1"
entity.icon = "__Armored-train__/assets/graphics/icons/support-platform-mk1.png"
entity.icon_size = 64
entity.icon_mipmaps = 4
entity.inventory_size = 5					
entity.minable.result = "support-platform-mk1"	
entity.max_health = 1000
entity.weight = 2000
entity.energy_per_hit_point = 5
entity.equipment_grid = "support-platform-mk1-equipment-grid"
-- Animation
entity.pictures.rotated =
{
	layers =
	{
		{
			priority = "very-low",
			width = 512,
			height = 512,
			-- Not to rotate mirroring
			back_equals_front = true,    
			-- Add aditional frames							
			direction_count = 128,
			allow_low_quality_rotation = false,
			line_length = 8,
			lines_per_file = 8,
			shift = util.by_pixel(0, -10),
			scale = 0.5,
			filenames =
			{
				"__Armored-train__/assets/graphics/support-platform-mk1/support-platform-mk1-1.png",
				"__Armored-train__/assets/graphics/support-platform-mk1/support-platform-mk1-2.png"
			}
		}
		--[[
		,
		{
			priority = "very-low",
			width = 512,
			height = 512,
			-- Not to rotate mirroring
			back_equals_front = false,    
			-- Add aditional frames							
			direction_count = 128,
			allow_low_quality_rotation = true,
			line_length = 8,
			lines_per_file = 8,
			shift = util.by_pixel(0, -25),
			scale = 0.3,
			filenames =
			{
				"__Armored-train__/assets/graphics/repair-arm-mk1/repair-arm-mk1-01.png",
				"__Armored-train__/assets/graphics/repair-arm-mk1/repair-arm-mk1-02.png"
			}
		}
		--]]
	}
}
entity.horizontal_doors = nil
entity.vertical_doors = nil
-- Minimap representation
entity.minimap_representation =
{
	filename = "__Armored-train__/assets/graphics/icons/support-platform-mk1-minimap-representation.png",
	flags = {"icon"},
	size = {20, 40},
	scale = 0.5
}
entity.selected_minimap_representation =
{
	filename = "__Armored-train__/assets/graphics/icons/support-platform-mk1-selected-minimap-representation.png",
	flags = {"icon"},
	size = {20, 40},
	scale = 0.5
}

-- Write result
data:extend
({
	entity
})