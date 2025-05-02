local item_sounds = require("__base__.prototypes.item_sounds")
local utils = require("utils")
local ammos = require("tables").ammos
local recipes = require("tables").ammoRecipe

for name, _ in pairs(ammos.stackSize) do
    local ammo = data.raw["ammo"][name]
    if ammo ~= nil then
        ammo.subgroup = "ammo"
        ammo.stack_size = ammos.stackSize[name]
        ammo.weight = ammos.weight[name] * 1000
        ammo.icon_size = ammos.iconSize[name] or 256
        ammo.magazine_size = ammos.magSize[name] or 1

        local category = ammos.category[name]
        if category ~= nil then
            if  category == "bullet" then
                ammo.inventory_move_sound = item_sounds.ammo_small_inventory_move
                ammo.pick_sound = item_sounds.ammo_small_inventory_pickup
                ammo.drop_sound = item_sounds.ammo_small_inventory_move
            else
                ammo.inventory_move_sound = item_sounds.artillery_large_inventory_move
                ammo.pick_sound = item_sounds.artillery_large_inventory_pickup
                ammo.drop_sound = item_sounds.artillery_large_inventory_move
            end
        else
            ammo.inventory_move_sound = item_sounds.ammo_large_inventory_move
            ammo.pick_sound = item_sounds.ammo_large_inventory_pickup
            ammo.drop_sound = item_sounds.ammo_large_inventory_move
        end
    end
end

for name, _ in pairs(recipes.steel) do
    local recipe = data.raw["recipe"][name]
    if recipe ~= nil then
        recipe.energy_required = recipes.time[name]
        recipe.ingredients = utils.ammoRecipe(name)
    end
end
