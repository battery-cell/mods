require("util")
log("Migrating Dreadnought to 2.0.0")

if storage.dreadnoughtList then
	local temp = table.deepcopy(storage.dreadnoughtList)
	storage.dreadnoughts = {}

	for _, dread in pairs(temp) do
		local dr = {number = dread[1], tick = dread[2], entity = dread[3], vlc = storage.voiceLineCooldown or 0, vlt = storage.voiceLineTick or 0}
		storage.dreadnoughts[dread[1]] = dr
	end

	storage.dreadnoughtList = nil
	storage.voiceLineCooldown = nil
	storage.voiceLineTick = nil
end