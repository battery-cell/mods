local itemEquipment = util.table.deepcopy(data.raw["item"]["solar-panel-equipment"])
itemEquipment.name = "shotgun-turret-mk1-equipment"
itemEquipment.icon = "__turret-library__/assets/graphics/icons/shotgun-turret-mk1-equipment.png"
itemEquipment.place_as_equipment_result = "shotgun-turret-mk1-equipment"
itemEquipment.order = "b[battery]-r[solar-panel-equipment]"
data:extend
({
	itemEquipment
})

local recipeEquipment = util.table.deepcopy(data.raw["recipe"]["solar-panel-equipment"])
recipeEquipment.name = "shotgun-turret-mk1-equipment"
recipeEquipment.enabled = false
recipeEquipment.results = {{type="item", name="shotgun-turret-mk1-equipment", amount=1}}
recipeEquipment.ingredients =
{
	{type = "item", name = "iron-gear-wheel", amount = 10},
	{type = "item", name = "copper-plate", amount = 10},
	{type = "item", name = "iron-plate", amount = 20}
}
data:extend
({
	recipeEquipment
})

local equipment = util.table.deepcopy(data.raw["solar-panel-equipment"]["solar-panel-equipment"])
equipment.name = "shotgun-turret-mk1-equipment"
equipment.sprite.filename = "__turret-library__/assets/graphics/equipment/shotgun-turret-mk1-equipment.png"
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
local entity = util.table.deepcopy(data.raw["ammo-turret"]["gun-turret"])
entity.name = "shotgun-turret-mk1-b"
entity.flags = turret_flags
entity.gun_animation_render_layer = turret_render_layer
entity.minable = nil
-- Collision
-- Make easier for enemies to attack it
entity.collision_box = {{-1, -1}, {1, 1}}
-- Fix player stuck inside wagon forever
entity.collision_mask = {layers = {object = true}}		
-- 1.25 for elevated rails selection
entity.selection_box = {{-1.25, -1.25}, {1.25, 1.25}}
entity.circuit_wire_max_distance = 0
-- Animation
local function entity_extension(inputs)
return
{
	filename = "__turret-library__/assets/graphics/shotgun-turret-mk1/shotgun-turret-mk1-attack.png",
	width = 256,
	height = 256,
	direction_count = 8,
	shift = util.by_pixel(0, -15),
	scale = 0.5	
}
end
local function entity_extension_mask(inputs)
return
{
	filename = "__turret-library__/assets/graphics/shotgun-turret-mk1/shotgun-turret-mk1-attack-mask.png",
	width = 256,
	height = 256,
	direction_count = 8,
	shift = util.by_pixel(0, -15),
	apply_runtime_tint = true,
	scale = 0.5	
}
end
local function entity_attack(inputs)
return
{
	layers =
	{
		{
			filename = "__turret-library__/assets/graphics/shotgun-turret-mk1/shotgun-turret-mk1-attack.png",
			width = 256,
			height = 256,
			line_length = 8,
			direction_count = 64,
			shift = util.by_pixel(0, -15),
			scale = 0.5
		},
		{
			filename = "__turret-library__/assets/graphics/shotgun-turret-mk1/shotgun-turret-mk1-attack-mask.png",
			flags = {"mask"},
			width = 256,
			height = 256,
			line_length = 8,
			direction_count = 64,
			shift = util.by_pixel(0, -15),
			apply_runtime_tint = true,
			scale = 0.5
		}
	}
}
end
entity.folded_animation =
{
	layers =
	{
		entity_extension{frame_count=1, line_length = 1},
		entity_extension_mask{frame_count=1, line_length = 1}
		-- Missing shadow
	}
}
entity.preparing_animation =
{
	layers =
	{
		entity_extension{},
		entity_extension_mask{}
		-- Missing shadow
	}
}
entity.prepared_animation = entity_attack{frame_count=1}
entity.attacking_animation = entity_attack{}
entity.folding_animation =
{
	layers =
	{
		entity_extension{run_mode = "backward"},
		entity_extension_mask{run_mode = "backward"}
		-- Missing shadow
	}
}
-- Remove base
entity.graphics_set.base_visualisation.animation = empty_layers
-- Attack parameters
entity.attack_parameters = data.raw["gun"]["shotgun"]["attack_parameters"]
data:extend
({
	entity
})