local modTable = require("tables").balancedMods
--[[

for name, mod in pairs(modTable) do
	if mods[name] and mod ~= true then
		for _, entity in pairs(mod) do
			if entity.setting ~= nil then
				if settings.startup[entity.setting] ~= nil then
					data.raw["int-setting"][name.."-hp_modifier"].hidden = true
				end
				if settings.startup[entity.setting] ~= nil then
					data.raw["int-setting"][name.."-resistance_modifier"].hidden = true
				end
			end
		end
	end
end
]]