--[[
if mods["Krastorio2"] then
    local gridcategory = data.raw["equipment-grid"]["saatomictank-equipment-grid"]
    gridcategory.equipment_categories = { 'armor', 'saatomictank', 'universal-equipment', 'vehicle-robot-interaction-equipment', 'vehicle-motor' }
end--]]

--[[
if mods["IndustrialRevolution3"] then

    local addburnt = data.raw["car"]["sa-atomic-tank"]

    if addburnt and addburnt.burner then
        addburnt.burner.burnt_inventory_size = 4
    end
end

if mods["IndustrialRevolution3"] then
    local checktank = data.raw["car"]["tank"]

    local validfuel = {}

    for k, v in pairs(checktank.burner.fuel_categories) do
        table.insert(validfuel, v)
    end    

    data.raw["car"]["sa-atomic-tank"].burner.fuel_categories = validfuel
end--]]