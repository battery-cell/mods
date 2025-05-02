local itemEquipment = util.table.deepcopy(data.raw["item"]["solar-panel-equipment"])
itemEquipment.name = "repair-arm-mk1-equipment"
itemEquipment.icon = "__turret-library__/assets/graphics/icons/repair-arm-mk1-equipment.png"
itemEquipment.place_as_equipment_result = "repair-arm-mk1-equipment"
itemEquipment.order = "b[battery]-z[solar-panel-equipment]"
data:extend
({
	itemEquipment
})

local recipeEquipment = util.table.deepcopy(data.raw["recipe"]["solar-panel-equipment"])
recipeEquipment.name = "repair-arm-mk1-equipment"
recipeEquipment.enabled = false
recipeEquipment.results = {{type="item", name="repair-arm-mk1-equipment", amount=1}}
recipeEquipment.ingredients =
{
	{type = "item", name = "iron-gear-wheel", amount = 10},
	{type = "item", name = "copper-plate", amount = 10},
	{type = "item", name = "iron-plate", amount = 20},
	{type = "item", name = "repair-pack", amount = 5}
}
data:extend
({
	recipeEquipment
})

local equipment = util.table.deepcopy(data.raw["solar-panel-equipment"]["solar-panel-equipment"])
equipment.name = "repair-arm-mk1-equipment"
equipment.sprite.filename = "__turret-library__/assets/graphics/equipment/repair-arm-mk1-equipment.png"
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
local entity = util.table.deepcopy(data.raw["container"]["iron-chest"])
entity.name = "repair-arm-mk1-b"
entity.flags = turret_flags
entity.minable = nil
-- Collision
-- Make easier for enemies to attack it
entity.collision_box = {{-1, -1}, {1, 1}}
-- Fix player stuck inside wagon forever
entity.collision_mask = {layers = {object = true}}		
entity.selection_box = {{-1.25, -1.25}, {1.25, 1.25}}
entity.inventory_size = 1
entity.circuit_wire_max_distance = 0
-- Animation
entity.picture = empty_layers
data:extend
({
	entity
})

-- Repair arm animation
local repairArmAnimation = 
{
	type = "animation",
	name = "repair-arm-animation", 
	layers =
	{
		{
			width = 256,
			height = 256,
			line_length = 8,
			frame_count = 64,
			shift = util.by_pixel(0, -12),
			scale = 0.6,
			filename = "__turret-library__/assets/graphics/repair-arm-mk1/repair-arm-mk1.png",
		}
	}
}
data:extend
({
	repairArmAnimation
})