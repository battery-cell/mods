if not storage.silos then
	return
end

for unit_number, data in pairs(storage.silos) do
	if data.disabled then
		data.disabled = nil
	end
end
