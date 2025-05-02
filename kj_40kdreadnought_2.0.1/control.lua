if script.active_mods["gvv"] then require("__gvv__.gvv")() end
local dreadnoughtName = "kj_40kdreadnought"
local cooldown1 = {140, 140, 140, 330, 140, 100}
local cooldown2 = {200, 140}

function insertInGlobal(number, entity)
	local dread = {number = number, tick = 0, entity = entity, vlc = 0, vlt = 0}
	storage.dreadnoughts[number] = dread

	if storage.dreadnoughtDebug then game.print("Dreadnought inserted in storage. unit_number = "..number) end
	for i, dread in ipairs(storage.dreadnoughts) do
		if storage.dreadnoughtDebug then game.print("Dreadnought "..i..": "..dread.number..". Tick: "..dread.tick) end
	end

	return number
end

function init_global()
	storage = storage or {}
	storage.dreadnoughts = {}
	storage.dreadnoughtDebug = false
	if storage.dreadnoughtDebug then game.print("Global initialized.") end

	for _, surface in pairs(game.surfaces) do
		for _, ent in pairs(surface.find_entities_filtered{name = dreadnoughtName}) do
			insertInGlobal(ent.unit_number, ent)
		end
	end
end

function entityBuilt(event)
	local ent = event.created_entity or event.entity

	if ent.name == dreadnoughtName then
		if storage.dreadnoughtDebug then game.print("Dreadnought built. unit_number= "..ent.unit_number) end
			insertInGlobal(ent.unit_number, ent)
	end
end

function entityRemoved(event)
	local ent = event.created_entity or event.entity

	if storage.dreadnoughtDebug then game.print("Entity destroyed. unit_number = "..ent.unit_number) end
	if ent.valid and ent.name == dreadnoughtName then
		if storage.dreadnoughts[ent.unit_number] ~= nil then
			if storage.dreadnoughtDebug then game.print("Dreadnought destroyed. unit_number= "..ent.unit_number) end
			storage.dreadnoughts[ent.unit_number] = nil
		end
	end
end

function playSoundAtDreadnought(sound, entity, tick)
	if storage.dreadnoughtDebug then game.print("Playing sound: "..sound.." "..tick) end

	entity.surface.play_sound
	{
		path = sound,
		position = entity.position
	}
end

function randomNumber(size)
	local number = math.random(1, size)

	number = math.random(1, size)
	number = math.random(1, size)
	return number
end

function chooseASound()
	number = randomNumber(10)

	if storage.dreadnoughtDebug then game.print("Chose sound: "..number) end
	return "kj_40kdreadnought_walking_"..number
end

function getInGetOut(event)
	local player = game.players[event.player_index]
	local entity = event.entity

	if entity then
		if entity.valid and entity.name == dreadnoughtName then
			local dread = storage.dreadnoughts[entity.unit_number]

			if dread and (game.tick - dread.vlt) >= dread.vlc then
				local number = 1

				if player.vehicle then
					playSoundAtDreadnought("kj_40kdreadnought_getIn", entity, game.tick)
				else
					playSoundAtDreadnought("kj_40kdreadnought_getOut", entity, game.tick)
					number = 2
				end

				dread.vlc = cooldown2[number]
				dread.vlt = game.tick
			end
		end
	end
end

function voiceline(event)
	local player = game.players[event.player_index]

	if player.vehicle and player.vehicle.name == "kj_40kdreadnought" then
		local dread = storage.dreadnoughts[player.vehicle.unit_number]

		if dread and (game.tick - dread.vlt) >= dread.vlc then
			local number = randomNumber(6)

			playSoundAtDreadnought("kj_40kdreadnought_voiceline_"..number, player.vehicle, game.tick)

			dread.vlc = cooldown1[number]
			dread.vlt = game.tick
		end
	end
end

function onTick(e)
	if settings.global["kj_40kdreadnought_walking"].value == true then
		if storage.dreadnoughts ~= nil then
			for i, dread in pairs(storage.dreadnoughts) do
				if dread.entity.valid then
					local speed = 216 * dread.entity.speed
					if speed ~= 0 then
						local backward = 1

						if speed < 0 then backward = -1 end
						local cooldown = 60 * (1 / (speed / 7))

						if (game.tick - dread.tick) >= cooldown * backward then
							dread.tick = game.tick
							playSoundAtDreadnought(chooseASound(), dread.entity, e.tick)
						end
					end
				else
					table.remove(storage.dreadnoughts, i)
				end
			end
		end
	end
end

script.on_init(init_global)
script.on_configuration_changed(init_global)
script.on_event(defines.events.on_tick, onTick)

script.on_event("kj_dreadnought_voiceline", voiceline)
script.on_event(defines.events.on_player_driving_changed_state, getInGetOut)


script.on_event(defines.events.on_robot_built_entity, entityBuilt)
script.on_event(defines.events.on_built_entity, entityBuilt)

script.on_event(defines.events.on_player_mined_entity, entityRemoved)
script.on_event(defines.events.on_robot_mined_entity, entityRemoved)
script.on_event(defines.events.on_entity_died, entityRemoved)
