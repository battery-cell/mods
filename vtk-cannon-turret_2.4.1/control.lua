local function debug(string)
    -- local player = game.players[1]
    -- player.print("VTK-CANNON-TURRET-DEBUG")
    -- player.print(string)
end

-- Apply unlocks and bonuses if already researched (case of loading an existing savegame)
local function update_tech_unlock()
    if settings.startup["vtk-cannon-turret-ammo-use"].value == 1 or
    settings.startup["vtk-cannon-turret-ammo-use"].value == 3 then
        for index, force in pairs(game.forces) do
            local technologies = force.technologies
            local recipes = force.recipes

            if technologies["uranium-ammo"].researched then 
                recipes["uranium-cannon-shell-magazine"].enabled = true
                recipes["explosive-uranium-cannon-shell-magazine"].enabled = true
            end

            -- Magazine ammo bonus are equal to non magazine ammo bonus, so we can just copy the bonuses to get the current researched bonus modifiers
            force.set_ammo_damage_modifier("cannon-shell-magazine", force.get_ammo_damage_modifier("cannon-shell"))
            force.set_gun_speed_modifier("cannon-shell-magazine", force.get_gun_speed_modifier("cannon-shell"))
        end
    end
end

-- events hooks
local events = defines.events

-- Need to run update unlock depending on tech and setting here during mod init and mod reload : 
-- on_init
-- on_configuration_changed

script.on_event({events.on_init, events.on_configuration_changed},
    function(event)
        update_tech_unlock()
    end
)
