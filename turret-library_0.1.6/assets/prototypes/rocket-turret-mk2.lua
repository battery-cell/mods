local itemEquipment = util.table.deepcopy(data.raw["item"]["solar-panel-equipment"])
itemEquipment.name = "rocket-turret-mk2-equipment"
itemEquipment.icon = "__turret-library__/assets/graphics/icons/rocket-turret-mk2-equipment.png"
itemEquipment.place_as_equipment_result = "rocket-turret-mk2-equipment"
itemEquipment.order = "b[battery]-v[solar-panel-equipment]"
data:extend
({
	itemEquipment
})

local recipeEquipment = util.table.deepcopy(data.raw["recipe"]["solar-panel-equipment"])
recipeEquipment.name = "rocket-turret-mk2-equipment"
recipeEquipment.enabled = false
recipeEquipment.results = {{type="item", name="rocket-turret-mk2-equipment", amount=1}}
recipeEquipment.ingredients =
{
	{type = "item", name = "iron-plate", amount = 20},			
	{type = "item", name = "steel-plate", amount = 10},
	{type = "item", name = "iron-gear-wheel", amount = 10},
	{type = "item", name = "electronic-circuit", amount = 20}
}
data:extend
({
	recipeEquipment
})

local equipment = util.table.deepcopy(data.raw["solar-panel-equipment"]["solar-panel-equipment"])
equipment.name = "rocket-turret-mk2-equipment"
equipment.sprite.filename = "__turret-library__/assets/graphics/equipment/rocket-turret-mk2-equipment.png"
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
entity.name = "rocket-turret-mk2-b"
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
entity.max_health = entity.max_health * 2
-- Attack
entity.rotation_speed = data.raw["car"]["tank"]["turret_rotation_speed"]	
-- Animation
local function entity_extension(inputs)
return
{
	filename = "__turret-library__/assets/graphics/rocket-turret-mk2/rocket-turret-mk2-attack.png",
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
	filename = "__turret-library__/assets/graphics/rocket-turret-mk2/rocket-turret-mk2-attack-mask.png",
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
			filename = "__turret-library__/assets/graphics/rocket-turret-mk2/rocket-turret-mk2-attack.png",
			width = 256,
			height = 256,
			line_length = 8,
			direction_count = 64,
			shift = util.by_pixel(0, -15),
			scale = 0.5
		},
		{
			filename = "__turret-library__/assets/graphics/rocket-turret-mk2/rocket-turret-mk2-attack-mask.png",
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
entity.ttacking_animation = entity_attack{}
entity.folding_animation =
{
	layers =
	{
		entity_extension{run_mode = "backward"},
		entity_extension_mask{run_mode = "backward"}
		-- Missing shadow
	}
}
-- Base picture
entity.graphics_set.base_visualisation.animation = empty_layers
-- Attack
local attack_parameters = util.table.deepcopy(data.raw["gun"]["rocket-launcher"]["attack_parameters"])
attack_parameters.min_range = 20
attack_parameters.cooldown = attack_parameters.cooldown * 4
attack_parameters.range = attack_parameters.range * 2
entity.attack_parameters = attack_parameters
data:extend
({
	entity
})