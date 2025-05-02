-- Clear previous table
if storage.wagonData ~= nil then
	for key, value in pairs(storage.wagonData) do
		if value.wagon ~= nil and value.wagon then
			game.print("Sorry, your turrets are now gone, use modular ones")
			game.print(value.wagon)
		end
	end
	storage.wagonData = nil
end



--[[
-- Looks like 0.6.5 was ignored
for key, value in pairs(storage.wagonData) do
	-- Replace 'turret' with 'turretA'
	if value.wagon.valid and value.turret ~= nil then
		-- Remove old data
		local currentWagon = value.wagon
		local currentTurret = value.turret
		--table.remove(storage.wagonData, key)
		-- Write new data
		local wagonData = {wagon = currentWagon, turretA = currentTurret, turretB = nil}
		--table.insert(storage.wagonData, wagonData) 
		
		storage.wagonData[key] = wagonData
	end
end

for key, value in pairs(storage.wagonData) do
	-- Handle overflow
	if not value.wagon.valid then
		table.remove(storage.wagonData, key)
	end
end

for index, force in pairs(game.forces) do
	if force.technologies["armored-train-mk2"].researched then
		-- new to this verison
		force.recipes["flamethrower-platform-mk2"].enabled = true
	end
end--]]