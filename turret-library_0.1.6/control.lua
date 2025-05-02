equipmentDictionary = 
{
	{
		equipmentName = "minigun-turret-mk1-equipment", turretName = "minigun-turret-mk1-b", drawType = 1
	},
	{
		equipmentName = "shotgun-turret-mk1-equipment", turretName = "shotgun-turret-mk1-b", drawType = 1
	},
	{
		equipmentName = "cannon-turret-mk1-equipment", turretName = "cannon-turret-mk1-b", drawType = 1
	},
	{
		equipmentName = "cannon-turret-mk2-equipment", turretName = "cannon-turret-mk2-b", drawType = 1
	},		
	{
		equipmentName = "rocket-turret-mk1-equipment", turretName = "rocket-turret-mk1-b", drawType = 1
	},
	{
		equipmentName = "rocket-turret-mk2-equipment", turretName = "rocket-turret-mk2-b", drawType = 1
	},
	{
		equipmentName = "flamethrower-turret-mk1-equipment", turretName = "flamethrower-turret-mk1-b", drawType = 1
	},
	{
		equipmentName = "radar-mk1-equipment", turretName = "radar-mk1-b", drawType = 2
	},
	{
		equipmentName = "searchlight-turret-mk1-equipment", turretName = "searchlight-turret-mk1-b", drawType = 3
	},
	{
		equipmentName = "repair-arm-mk1-equipment", turretName = "repair-arm-mk1-b", drawType = 4
	}
}
-- Dont try to use float lol
local repairArmRangeRange = 7
local currentEntity



function OnInit()
	storage = storage or {}
	-- Teleport turret to entity (Created 1 per child mod LOL)
	storage.entityTurretData = storage.entityTurretData or {}
	storage.turretDrawData = storage.turretDrawData or {}
end
script.on_init(OnInit)



function CreateTurretEntity(entity, turretName)
	local turret = entity.surface.create_entity
	{
		name = turretName, 
		position = entity.position, 
		force = entity.force,
		direction = OrientationToDirection(entity.orientation),
		quality = entity.quality
	}
	return turret
end

-- Match turret rotation to entity rotation when created (Rotated with "R" key)
function OrientationToDirection(orientation)
	-- North direction: 0 to 0.125 or 0.875 to 1
	if orientation <= 0.125 or 0.875 < orientation then
        return defines.direction.north
    elseif orientation <= 0.375 then
        return defines.direction.east
    elseif orientation <= 0.625 then
        return defines.direction.south
    else
        return defines.direction.west
    end
end

function IsEntityInTurretDataExists(entity)
	if storage.entityTurretData == nil then
		return false
	end
	for key, value in pairs(storage.entityTurretData) do
		if value.entity == entity then
			return true
		end
	end
	return false
end

function GetOffsetPosition(entity, horizontal, vertical)
	local orientation = entity.orientation
	local position = entity.position
	if entity.train then
		local drawData = entity.draw_data
		orientation = drawData.orientation
		position = drawData.position
	end
	
    local rad = orientation * 2 * math.pi
    local cos = math.cos(rad)
    local sin = math.sin(rad)

    local speed = entity.speed or 0
    local offset = speed + horizontal

    local x = offset * sin
    local y = offset * -cos

    return { position.x + x, position.y + y + vertical }
end

-- Save some processing time on filtering mod equipment before mod entities
function OnModEquipmentInserted(equipmentName, entityDictionary, gridEntityOwner)
	-- Filter mod equipment
	for key, valueA in pairs(equipmentDictionary) do
		if valueA.equipmentName == equipmentName then
			-- Filter mod entity
			for key, valueB in pairs(entityDictionary) do
				if valueB.entityName == gridEntityOwner.name then
					local turretEntity = CreateTurretEntity(gridEntityOwner, valueA.turretName)
					local turretPosition
					-- Create new data or append to existing
					if not IsEntityInTurretDataExists(gridEntityOwner) then
						-- Turret A always created by default (Do not make it more complicated with grid position)
						turretPosition = GetOffsetPosition(gridEntityOwner, valueB.turretOffset[1][1], valueB.turretOffset[1][2])
						local createData = 
						{
							entity = gridEntityOwner,
							turretA = turretEntity,
							turretB = nil,
							turretOffset = valueB.turretOffset
						}
						if storage.entityTurretData == nil then
							storage.entityTurretData = {}
						end
						table.insert(storage.entityTurretData, createData)
					else
						-- Filter current entity only
						for key, value in pairs(storage.entityTurretData) do
							if value.entity == gridEntityOwner then
								-- Add missing turret A or B (Order can be changed due to destruction by enemies)
								if value.turretA == nil then
									turretPosition = GetOffsetPosition(gridEntityOwner, valueB.turretOffset[1][1], valueB.turretOffset[1][2])
									local appendData = 
									{
										entity = gridEntityOwner,
										turretA = turretEntity,
										turretB = value.turretB,
										turretOffset = valueB.turretOffset
									}
									storage.entityTurretData[key] = appendData
								else
									turretPosition = GetOffsetPosition(gridEntityOwner, valueB.turretOffset[2][1], valueB.turretOffset[2][2])
									local appendData = 
									{
										entity = gridEntityOwner,
										turretA = value.turretA,
										turretB = turretEntity,
										turretOffset = valueB.turretOffset
									}
									storage.entityTurretData[key] = appendData
								end
							end
						end
					end
					turretEntity.teleport(turretPosition)
					
					-- Draw data
					AddTurretDrawData(gridEntityOwner, turretEntity, valueA.drawType)
				end
			end
		end
	end
end



function SpillAmmoStackAt(turret, currentEntity)
	local turretInventory = turret.get_inventory(defines.inventory.turret_ammo)
	for i = 1, #turretInventory do
		local turretStack = turretInventory[i]
		if turretStack.valid_for_read then
			currentEntity.surface.spill_item_stack{position = currentEntity.position, stack = turretStack, enable_looted = true, allow_belts = false}
		end
	end
end

function OnModEquipmentRemoved(event)
	-- Filter mod equipment
	for key, valueA in pairs(equipmentDictionary) do
		if valueA.equipmentName == event.equipment then
			-- Filter current entity only
			if storage.entityTurretData ~= nil then
				for key, valueB in pairs(storage.entityTurretData) do
					local gridEntityOwner = event.grid.entity_owner
					if valueB.entity == gridEntityOwner then
						-- Remove first matching turret starting with A then B (Do not make it complicated with turret index)
						if valueB.turretA ~= nil and valueB.turretA.name == valueA.turretName then
							SpillAmmoStackAt(valueB.turretA, gridEntityOwner)
							
							-- Draw data
							RemoveTurretDrawData(valueB.turretA)
							
							valueB.turretA.destroy()
							valueB.turretA = nil
						elseif valueB.turretB ~= nil and valueB.turretB.name == valueA.turretName then
							SpillAmmoStackAt(valueB.turretB, gridEntityOwner)
							
							-- Draw data
							RemoveTurretDrawData(valueB.turretB)
							
							valueB.turretB.destroy()
							valueB.turretB = nil
						end
						-- Remove (Status can be changed due to destruction)
						if valueB.turretA == nil and valueB.turretB == nil then
							table.remove(storage.entityTurretData, key)
						end
					end
				end
			end
		end
	end
end
script.on_event(defines.events.on_equipment_removed, OnModEquipmentRemoved)
--script.on_event(defines.events.on_player_removed_equipment, OnModEquipmentRemoved)



function OnModMinedEntity(event)
	-- Filter current entity only
	if storage.entityTurretData ~= nil then
		for key, value in pairs(storage.entityTurretData) do
			local currentEntity = event.entity
			if value.entity == currentEntity then	
				-- Turret A always exists (If was not destroyed - handled in another event)
				if value.turretA ~= nil then
					SpillAmmoStackAt(value.turretA, currentEntity)
					value.turretA.destroy()
					
					-- Draw data
					RemoveTurretDrawData(value.turretA)
				end
				if value.turretB ~= nil then
					SpillAmmoStackAt(value.turretB, currentEntity)
					value.turretB.destroy()
					
					-- Draw data
					RemoveTurretDrawData(value.turretB)
				end
				table.remove(storage.entityTurretData, key)
			end
		end
	end
end
script.on_event(defines.events.on_player_mined_entity, OnModMinedEntity)
script.on_event(defines.events.on_robot_mined_entity, OnModMinedEntity)



function TakeOutEquipment(entityGrid, turretName)
	-- Find turret equipment representative
	for key, value in pairs(equipmentDictionary) do
		if value.turretName == turretName then
			local findEquipment = entityGrid.find(value.equipmentName, false)
			if findEquipment then
				entityGrid.take({equipment = findEquipment})
			end
		end
	end
end

function OnModEntityDied(event)
	-- Filter current entity only
	if storage.entityTurretData ~= nil then
		for key, value in pairs(storage.entityTurretData) do
			local currentEntity = event.entity
			-- Entity destroyed
			if value.entity == currentEntity then
				if value.turretA ~= nil then
					value.turretA.destroy()
				end
				if value.turretB ~= nil then
					value.turretB.destroy()
				end
				table.remove(storage.entityTurretData, key)
			end		
			-- Turret destroyed
			if value.turretA == currentEntity then
				TakeOutEquipment(value.entity.grid, value.turretA.name)
				
				-- Draw data
				RemoveTurretDrawData(value.turretA)
				
				value.turretA = nil
			elseif value.turretB == currentEntity then
				TakeOutEquipment(value.entity.grid, value.turretB.name)
				
				-- Draw data
				RemoveTurretDrawData(value.turretB)
				
				value.turretB = nil
			end
			-- Remove data (A and B destroyed)
			if value.turretA == nil and value.turretB == nil then
				table.remove(storage.entityTurretData, key)
			end
		end
	end
end
script.on_event(defines.events.on_entity_died, OnModEntityDied)



function OnModBuiltEntity(entity, entityDictionary)
	-- Filter mod entity
	for key, valueA in pairs(entityDictionary) do
		if valueA.entityName == entity.name then
			-- Count existing equipment 
			local equipment = {}
			for key, valueB in pairs(equipmentDictionary) do
				local count = entity.grid.count(valueB.equipmentName)
				-- Multiple instances of one equipment can be found
				for i = 1, count do
					local data = 
					{
						turretName = valueB.turretName,
						drawType = valueB.drawType
					}
					table.insert(equipment, data)
				end
			end
			-- Create turrets
			local turrets = {}
			for i = 1, #equipment do
				local turretEntity = CreateTurretEntity(entity, equipment[i].turretName)
				local turretPosition = GetOffsetPosition(entity, valueA.turretOffset[i][1], valueA.turretOffset[i][2])
				turretEntity.teleport(turretPosition)
				table.insert(turrets, turretEntity)
				
				-- Draw data
				AddTurretDrawData(entity, turretEntity, equipment[i].drawType)
			end
			local data = 
			{
				entity = entity,
				turretA = turrets[1],
				turretB = turrets[2],
				turretOffset = valueA.turretOffset
			}
			if storage.entityTurretData == nil then
				storage.entityTurretData = {}
			end
			table.insert(storage.entityTurretData, data)
		end
	end
end



-- Rotated with "R" key
function OnRotated(event)
	-- Filter current entity only
	if storage.entityTurretData ~= nil then
		for key, value in pairs(storage.entityTurretData) do
			if value.entity == event.entity then
				if value.turretA ~= nil then
					value.turretA.orientation = (value.turretA.orientation + 0.5)  % 1
				end
				if value.turretB ~= nil then
					value.turretB.orientation = (value.turretB.orientation + 0.5)  % 1
				end
			end
		end
	end
end
script.on_event(defines.events.on_player_rotated_entity , OnRotated)



function AddTurretDrawData(entity, turret, drawType)
	local data = 
	{
		entity = entity,
		turret = turret,
		drawType = drawType
	}	
	if storage.turretDrawData == nil then
		storage.turretDrawData = {}
	end
	table.insert(storage.turretDrawData, data)
end



function RemoveTurretDrawData(turret)
	for key, value in pairs(storage.turretDrawData) do
		if value.turret == turret then
			table.remove(storage.turretDrawData, key)
		end
	end
end



function DrawLight(turret)
	-- Draw only when attacking
	if turret.shooting_target ~= nil then		
		rendering.draw_light
		{
			sprite = "searchlight-turret-mk1-spot", 
			orientation = turret.orientation, 
			scale = 1.5, 
			target = turret.shooting_target,
			surface = turret.surface, 
			time_to_live = 1
		}
	end
end

function DrawRadarDish(entity)
	-- Animate only when has fuel
	local animationSpeed = 0
	if 0 < entity.burner.remaining_burning_fuel then
		animationSpeed = 0.15
	end
	rendering.draw_animation
	{
		animation = "radar-dish", 
		render_layer = turret_render_layer, 
		animation_speed = animationSpeed, 
		target = entity.position, 
		surface = entity.surface, 
		time_to_live = 1
	}
end

function OrientationToAnimation(orientation, frameCount)
	return math.floor(orientation * (frameCount))
end

function DrawRepairArm(orientation, entity)
	rendering.draw_animation
	{
		animation = "repair-arm-animation", 
		render_layer = turret_render_layer, 
		animation_speed = 0, 
		animation_offset = OrientationToAnimation(orientation, 64), 
		target =  entity.position,
		surface = entity.surface, 
		time_to_live = 1
	}
end

-- Can use other mod repair-packs (Untested)
function GetRepairPackStack(turret)
	local turretInventory = turret.get_inventory(defines.inventory.chest)
	local repairPackStack = turretInventory.find_item_stack("repair-pack")
	return repairPackStack
end

function ActivateRepairArm(entity, turret)
	-- Get repair packs
	local repairPackStack = GetRepairPackStack(turret)
	if repairPackStack ~= nil and repairPackStack.valid_for_read then
		local entities = entity.surface.find_entities_filtered
		{
			force = entity.force, 
			position = entity.position, 
			radius = repairArmRangeRange,
			type = {"container", "ammo-turret", "locomotive", "cargo-wagon", "straight-rail", "curved-rail-a", "curved-rail-b", "car"}
		}
		for key, value in pairs(entities) do
			-- Prevent repairing projectiles or player
			if value.health ~= nil then
				if value.health < value.max_health then
					value.health = value.health + repairPackStack.prototype.speed
					repairPackStack.drain_durability(repairPackStack.prototype.speed)
					-- Show repaired target
					rendering.draw_circle
					{
						color = {r = 0, g = 0.5, b = 0, a = 0.5},
						radius = 1,
						filled = false,
						target = value.position, 
						surface = value.surface,
						time_to_live = 1,
						draw_on_ground = true
					}
				end
			end
		end
	end
end

function TurretDrawData(entity, turret, drawType)
	if turret.valid then
		if drawType == 2 then
			DrawRadarDish(turret)
		end
		if drawType == 3 then
			DrawLight(turret)
		end
		if drawType == 4 then
			DrawRepairArm(entity.orientation, turret)
			ActivateRepairArm(entity, turret)
		end
	end
end

function IsCanInsertStack(turret, stack)
	-- Insert only when empty to avoid loosing stacks
	if not turret.has_items_inside() and turret.can_insert(stack) then
		return true
	end
	return false
end

-- Insert ammo to turret
function InsertAmmoStack(inventory, turret, stack)
	turret.get_inventory(defines.inventory.turret_ammo).insert(stack)
	inventory.remove(stack)
end

function InserRepairPackStack(inventory, turret, stack)
	turret.get_inventory(defines.inventory.chest).insert(stack)
	inventory.remove(stack)
end

function OnTick(event) 
	-- For existing data only
	if storage.entityTurretData ~= nil then
		for key, value in pairs(storage.entityTurretData) do
			if value.entity.valid then
				-- Update ammo/repair-pack count (Dont need to do it each tick)
				if event.tick % 30 == 0 then
					-- Get correct inventory (Car is 2, wagon is 1)
					local entityInventory = value.entity.get_inventory(2)
					if entityInventory == nil then
						entityInventory = value.entity.get_inventory(1)
					end
					for i = 1, #entityInventory do
						local stack = entityInventory[i]
						if value.turretA ~= nil then
							if IsCanInsertStack(value.turretA, stack) then
								-- Repair pack or ammo
								if value.turretA.type == "container" and stack.type == "repair-tool" then
									InserRepairPackStack(entityInventory, value.turretA, stack)
								elseif value.turretA.type ~= "container" then
									InsertAmmoStack(entityInventory, value.turretA, stack)
								end
							end
						end
						if value.turretB ~= nil then
							if IsCanInsertStack(value.turretB, stack) then
								-- Repair pack or ammo
								if value.turretB.type == "container" and stack.type == "repair-tool" then
									InserRepairPackStack(entityInventory, value.turretB, stack)
								elseif value.turretA.type ~= "container" then
									InsertAmmoStack(entityInventory, value.turretB, stack)
								end
							end
						end
					end
				end
				
				-- Teleport
				-- Optimisation (On quad core i7 PC in 2k25 LOL, some guys on forums mentioned this, I know you are reading this rght now)
				if value.entity.speed ~= 0 then
					if value.turretA ~= nil and value.turretA.valid then
						local turretPosition = GetOffsetPosition(value.entity, value.turretOffset[1][1], value.turretOffset[1][2])
						value.turretA.teleport(turretPosition)
					end
					if value.turretB ~= nil and value.turretB.valid  then
						local turretPosition = GetOffsetPosition(value.entity, value.turretOffset[2][1], value.turretOffset[2][2])
						value.turretB.teleport(turretPosition)
					end
				end
			end
		end
	end
	
	-- Draw data
	if storage.turretDrawData ~= nil then
		for key, value in pairs(storage.turretDrawData) do
			if value.turret.valid then
				TurretDrawData(value.entity, value.turret, value.drawType)
			end
		end
	end
	
	-- Selected entity
	if currentEntity ~= nil then
		rendering.draw_circle
		{
			color = {r = 0, g = 0.025, b = 0, a = 0.025},
			radius = repairArmRangeRange,
			filled = true,
			target = currentEntity.position, 
			surface = currentEntity.surface,
			time_to_live = 1,
			draw_on_ground = true
		}
	end
end
script.on_event(defines.events.on_tick, OnTick)



function OnSelectedEntityChanged(event)
	local selectedEntity = game.players[event.player_index].selected
	if selectedEntity == nil or selectedEntity.name ~= "repair-arm-mk1-b" then
		currentEntity = nil
	else 
		currentEntity = selectedEntity
	end
end
script.on_event(defines.events.on_selected_entity_changed, OnSelectedEntityChanged)