local item_sounds = require("__base__.prototypes.item_sounds")

local order = {"a", "b", "c", "d", "e"}
for i=1,5 do
    local suffix = (i > 1) and ("-mk"..i) or ""
    data:extend{
        {
            type = "item-with-entity-data",
            name = "vehicle-miner"..suffix,
            icon = "__aai-vehicles-miner__/graphics/icons/miner"..suffix..".png",
            icon_size = 64,
            subgroup="transport",
            order = "ab[industrial]-a[miner]-"..order[i].."[vehicle-miner"..suffix.."]",
            stack_size = 1,
            place_result = "vehicle-miner"..suffix,
            pick_sound = item_sounds.vehicle_inventory_pickup,
            drop_sound = item_sounds.vehicle_inventory_move,
            inventory_move_sound = item_sounds.vehicle_inventory_move,
        }
    }
end
