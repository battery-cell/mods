local itemEquipment = util.table.deepcopy(data.raw["item"]["solar-panel-equipment"])
itemEquipment.name = "radar-mk1-equipment"
itemEquipment.icon = "__turret-library__/assets/graphics/icons/radar-mk1-equipment.png"
itemEquipment.place_as_equipment_result = "radar-mk1-equipment"
itemEquipment.order = "b[battery]-x[solar-panel-equipment]"
data:extend
({
	itemEquipment
})

local recipeEquipment = util.table.deepcopy(data.raw["recipe"]["solar-panel-equipment"])
recipeEquipment.name = "radar-mk1-equipment"
recipeEquipment.enabled = false
recipeEquipment.results = {{type="item", name="radar-mk1-equipment", amount=1}}
recipeEquipment.ingredients =
{
	{type = "item", name = "iron-gear-wheel", amount = 10},
	{type = "item", name = "copper-plate", amount = 10},
	{type = "item", name = "iron-plate", amount = 20},
	{type = "item", name = "radar", amount = 1}
}
data:extend
({
	recipeEquipment
})

local equipment = util.table.deepcopy(data.raw["solar-panel-equipment"]["solar-panel-equipment"])
equipment.name = "radar-mk1-equipment"
equipment.sprite.filename = "__turret-library__/assets/graphics/equipment/radar-mk1-equipment.png"
equipment.sprite.height = 128
equipment.sprite.width = 128
equipment.shape = 
{
	width = 3,
	height = 3,
	type = "full"
}
-- Can be installed only in IFV
equipment.categories = { "modular-turret" }
data:extend 
({
	equipment
})

-- Base entity
local entity = util.table.deepcopy(data.raw["radar"]["radar"])
entity.name = "radar-mk1-b"
entity.flags = turret_flags
entity.minable = nil
-- Collision
-- Make easier for enemies to attack it
entity.collision_box = {{-1, -1}, {1, 1}}
-- Fix player stuck inside wagon forever
entity.collision_mask = {layers = {object = true}}		
entity.selection_box = {{-1.25, -1.25}, {1.25, 1.25}}
entity.circuit_wire_max_distance = 0
-- Radar
entity.max_distance_of_sector_revealed = 2
entity.max_distance_of_nearby_sector_revealed = 1
entity.energy_source = data.raw["furnace"]["stone-furnace"]["energy_source"]
-- Animations
entity.integration_patch = empty_sprite
entity.pictures = empty_layers
data:extend
({
	entity
})

-- Because render layers of radar can't be changed by script
local radarDishAnimation = 
{
	type = "animation",
	name = "radar-dish", 
	layers =
	{
		{
			width = 256,
			height = 256,
			line_length = 8,
			frame_count = 64,
			shift = util.by_pixel(0, -12),
			scale = 0.6,
			filename = "__turret-library__/assets/graphics/radar-mk1/radar-mk1.png",
		}
	}
}
data:extend
({
	radarDishAnimation
})