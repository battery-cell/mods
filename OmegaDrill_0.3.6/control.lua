function BuiltEntity(event)
--	game.players[1].print("builtentity")


	if event.entity.name == "omega-drill" or event.entity.name == "tomega-drill" then
		local e = event.entity
		local s = e.surface
		local X = e.position.x
		local Y = e.position.y
		chest = e.surface.find_entity("omega-chest",{X, Y})
		if chest ~= nil then
			return
		end
    local l = s.create_entity{name = "omega-chest", position = {X,Y}, force= game.forces.neutral}
		l.destructible = false
	end

end


function MinedEntity(event)
	if event.entity.name == "omega-drill" or event.entity.name == "tomega-drill" then
	local b = event.entity
	local X = b.position.x
	local Y = b.position.y
	chest = b.surface.find_entity("omega-chest",{X, Y})
	if chest ~= nil then
		chest.destroy() end
	end

end

function OrphanBox(event)
	if event.entity == nil then return end
	if event.entity.name == "omega-chest" then
		local b = event.entity
		local X = b.position.x
		local Y = b.position.y
		drill = b.surface.find_entities_filtered{name = "omega-drill", position = {X, Y}}
		if drill[1] ~= nil then return end
		if script.active_mods["space-age"] then
			drill = b.surface.find_entities_filtered{name = "tomega-drill", position = {X, Y}}
		end
		if drill[1] == nil then event.entity.destroy() end
	end
end

script.on_event(defines.events.on_gui_opened, OrphanBox)

script.on_event(defines.events.on_built_entity, BuiltEntity)
script.on_event(defines.events.on_robot_built_entity, BuiltEntity)
script.on_event(defines.events.script_raised_built, BuiltEntity)
script.on_event(defines.events.script_raised_revive, BuiltEntity)
script.on_event(defines.events.on_space_platform_built_entity, BuiltEntity)

script.on_event(defines.events.on_pre_player_mined_item , MinedEntity)
script.on_event(defines.events.on_entity_died , MinedEntity)
script.on_event(defines.events.on_robot_pre_mined , MinedEntity)
script.on_event(defines.events.script_raised_destroy , MinedEntity)
script.on_event(defines.events.on_space_platform_pre_mined , MinedEntity)
