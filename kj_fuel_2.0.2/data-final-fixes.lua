if data.raw["item-group"]["kj_vehicles"] ~= nil then
	data.raw["item-subgroup"]["kj_fuels"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_fuels"].order = "z"
end
