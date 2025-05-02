--random atom explosion when atomic bomber crashes with atom bomb
function OnDied(e)
	local entity = e.entity

	if entity ~= nil and entity.name ~= nil then
        local name = string.gsub(entity.name, "-airborne", "")
        if settings.global[name.."_crash_boom"] and settings.global[name.."_crash_boom"].value == true then
            local surface = entity.surface
            local position = entity.position

            inventory = entity.get_inventory(defines.inventory.car_ammo)
            if inventory and inventory.is_empty() == false then
                for i = 1, #inventory do
                    if inventory[i].count > 0 then
                        if inventory[i].name == "kj_plane_atom" then
                            local randomNumber = math.random(1, 100)

                            if randomNumber > 65 then
                                surface.create_entity {
                                    name = "atomic-rocket",
                                    position = position,
                                    force = "enemy",
                                    target = entity,
                                    speed = 1,
                                }
                            end
                        end
                    end
                end
            end
        end
	end
end

script.on_event(defines.events.on_entity_died, OnDied)