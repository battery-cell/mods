require("__turret-library__.control")

-- Offset from left to right
local entityDictionary = 
{
	{
		entityName = "combat-platform-mk1", turretOffset = {{0, -0.25}, {0, -0.25}}
	},
	{
		entityName = "combat-platform-mk2", turretOffset = {{-1.25, -0.25}, {1.25, -0.25}}
	},
	{
		entityName = "support-platform-mk1", turretOffset = {{0, -0.25}, {0, -0.25}}
	}
}



function OnEquipmentInserted(event)
	OnModEquipmentInserted(event.equipment.name, entityDictionary, event.grid.entity_owner)
end
script.on_event(defines.events.on_equipment_inserted, OnEquipmentInserted)



function OnBuiltEntity(event)
	OnModBuiltEntity(event.entity, entityDictionary)
end
script.on_event(defines.events.on_built_entity, OnBuiltEntity)
script.on_event(defines.events.on_robot_built_entity, OnBuiltEntity)