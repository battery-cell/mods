local itemEquipment = util.table.deepcopy(data.raw["item"]["solar-panel-equipment"])
itemEquipment.name = "searchlight-turret-mk1-equipment"
itemEquipment.icon = "__turret-library__/assets/graphics/icons/searchlight-turret-mk1-equipment.png"
itemEquipment.place_as_equipment_result = "searchlight-turret-mk1-equipment"
itemEquipment.order = "b[battery]-y[solar-panel-equipment]"
data:extend
({
	itemEquipment
})

local recipeEquipment = util.table.deepcopy(data.raw["recipe"]["solar-panel-equipment"])
recipeEquipment.name = "searchlight-turret-mk1-equipment"
recipeEquipment.enabled = false
recipeEquipment.results = {{type="item", name="searchlight-turret-mk1-equipment", amount=1}}
recipeEquipment.ingredients =
{
	{type = "item", name = "iron-gear-wheel", amount = 10},
	{type = "item", name = "copper-plate", amount = 10},
	{type = "item", name = "iron-plate", amount = 20},
	{type = "item", name = "small-lamp", amount = 1}
}
data:extend
({
	recipeEquipment
})

local equipment = util.table.deepcopy(data.raw["solar-panel-equipment"]["solar-panel-equipment"])
equipment.name = "searchlight-turret-mk1-equipment"
equipment.sprite.filename = "__turret-library__/assets/graphics/equipment/searchlight-turret-mk1-equipment.png"
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
entity.name = "searchlight-turret-mk1-b"
entity.flags = turret_flags
entity.gun_animation_render_layer = turret_render_layer
entity.minable = nil
-- Collision
-- Make easier for enemies to attack it
entity.collision_box = {{-1, -1}, {1, 1}}
-- Fix player stuck inside wagon forever
entity.collision_mask = {layers = {object = true}}		
entity.selection_box = {{-1.25, -1.25}, {1.25, 1.25}}
entity.circuit_wire_max_distance = 0
-- Do not accept anything
entity.inventory_size = 0
-- Animation
local function searchlight_turret_mk1_extension(inputs)
return
{
	filename = "__turret-library__/assets/graphics/searchlight-turret-mk1/searchlight-turret-mk1-attack.png",
	width = 256,
	height = 256,
	direction_count = 8,
	shift = util.by_pixel(0, -15),
	scale = 0.5	
}
end
local function searchlight_turret_mk1_extension_mask(inputs)
return
{
	filename = "__turret-library__/assets/graphics/searchlight-turret-mk1/searchlight-turret-mk1-attack-mask.png",
	width = 256,
	height = 256,
	direction_count = 8,
	shift = util.by_pixel(0, -15),
	apply_runtime_tint = true,
	scale = 0.5	
}
end
local function searchlight_turret_mk1_attack(inputs)
return
{
	layers =
	{
		{
			filename = "__turret-library__/assets/graphics/searchlight-turret-mk1/searchlight-turret-mk1-attack.png",
			width = 256,
			height = 256,
			line_length = 8,
			direction_count = 64,
			shift = util.by_pixel(0, -15),
			scale = 0.5
		},
		{
			filename = "__turret-library__/assets/graphics/searchlight-turret-mk1/searchlight-turret-mk1-attack-mask.png",
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
		searchlight_turret_mk1_extension{frame_count=1, line_length = 1},
		searchlight_turret_mk1_extension_mask{frame_count=1, line_length = 1}
		-- Missing shadow
	}
}
entity.preparing_animation =
{
	layers =
	{
		searchlight_turret_mk1_extension{},
		searchlight_turret_mk1_extension_mask{}
		-- Missing shadow
	}
}
entity.prepared_animation = searchlight_turret_mk1_attack{frame_count=1}
entity.attacking_animation = searchlight_turret_mk1_attack{}
entity.folding_animation =
{
	layers =
	{
		searchlight_turret_mk1_extension{run_mode = "backward"},
		searchlight_turret_mk1_extension_mask{run_mode = "backward"}
		-- Missing shadow
	}
}
-- Base picture
entity.graphics_set.base_visualisation.animation = empty_layers
-- Attack
-- Hide need ammo icon
entity.alert_icon_scale = 0
data:extend
({
	entity
})
-- Light source
local searchlightCone = 
{
	type = "sprite",
	name = "searchlight-turret-mk1-cone", 
	filename = "__turret-library__/assets/graphics/searchlight-turret-mk1/searchlight-turret-mk1-cone.png",
	priority = "extra-high-no-scale",
	width = 200,
	height = 400,
	flags = {"no-crop"}
}
local searchlightSpot = 
{
	type = "sprite",
	name = "searchlight-turret-mk1-spot", 
	filename = "__turret-library__/assets/graphics/searchlight-turret-mk1/searchlight-turret-mk1-spot.png",
	priority = "extra-high-no-scale",
	width = 256,
	height = 256,
	flags = {"no-crop"}
}
data:extend
({
	searchlightCone,
	searchlightSpot
})