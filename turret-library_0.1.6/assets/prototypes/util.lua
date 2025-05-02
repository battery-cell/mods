empty_sprite = 
{
	filename = "__turret-library__/assets/graphics/emptyLayers.png",
	direction_count = 1,
	height = 16,
	width = 16
}

empty_layers = 
{
	layers =
	{
		{
			filename = "__turret-library__/assets/graphics/emptyLayers.png",
			direction_count = 1,
			height = 16,
			width = 16
		}
	}
}

turret_flags = 
{
	-- Can draw enemies
	"player-creation",
	"placeable-off-grid", 
	-- Hide on minimap
	"not-on-map",
	"not-deconstructable", 
	"not-blueprintable"
}

turret_render_layer = "higher-object-under"

-- Remove friendly fire from ammo
data.raw["projectile"]["shotgun-pellet"].force_condition = "not-same"
data.raw["projectile"]["piercing-shotgun-pellet"].force_condition = "not-same"
data.raw["projectile"]["cannon-projectile"].force_condition = "not-same"
data.raw["projectile"]["uranium-cannon-projectile"].force_condition = "not-same"
data.raw["projectile"]["explosive-cannon-projectile"].force_condition = "not-same"
data.raw["projectile"]["explosive-uranium-cannon-projectile"].force_condition = "not-same"

-- Equipment
-- Turrets
local modularTurretCategory = util.table.deepcopy(data.raw["equipment-category"]["armor"])
modularTurretCategory.name = "modular-turret"
-- Vanilla equipment (Why separate? I don't remember)
local modularTurretEquipmentCategory = util.table.deepcopy(data.raw["equipment-category"]["armor"])
modularTurretEquipmentCategory.name = "modular-turret-equipment"
data:extend 
({
	modularTurretCategory,
	modularTurretEquipmentCategory
})

-- Prohibit exoskeleton or laser-like equipment (Removes purpose of the mod LOL)
table.insert(data.raw["energy-shield-equipment"]["energy-shield-equipment"].categories, "modular-turret-equipment")
table.insert(data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].categories, "modular-turret-equipment")
table.insert(data.raw["battery-equipment"]["battery-equipment"].categories, "modular-turret-equipment")
table.insert(data.raw["battery-equipment"]["battery-mk2-equipment"].categories, "modular-turret-equipment")
table.insert(data.raw["solar-panel-equipment"]["solar-panel-equipment"].categories, "modular-turret-equipment")
table.insert(data.raw["generator-equipment"]["fission-reactor-equipment"].categories, "modular-turret-equipment")
table.insert(data.raw["energy-shield-equipment"]["energy-shield-equipment"].categories, "modular-turret-equipment")