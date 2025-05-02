local techUpdates = {
    --DMG-5 - DMG-6 - DMG-7 - SPD-5 - SPD-6
    {
        modname = "kj_40kbaneblade",
        modifiers = {0.9, 1.3, 1, 0.8, 1.5},
        ammo_category = "kj_baneblade",
    },
    {
        modname = "kj_40kbaneblade",
        modifiers = {0.9, 1.3, 1, 0, 1.5},
        ammo_category = "kj_baneblade_artillery",
    },

    {
        modname = "kj_40kdreadnought",
        modifiers = {0.9, 1.3, 1, 0.8, 1.5},
        ammo_category = "kj_dreadnought_cannon",
    },

    {
        modname = "kj_40klemanruss",
        modifiers = {0.9, 1.3, 1, 0.8, 1.5},
        ammo_category = "kj_lemanruss",
    },

    {
        modname = "kj_40kpredator",
        modifiers = {0.9, 1.3, 1, 0.5, 0.5},
        ammo_category = "kj_predator",
    },

    {
        modname = "kj_2a6",
        modifiers = {0.9, 1.3, 1, 0.5, 0.5},
        ammo_category = "kj_rh120",
    },

    {
        modname = "kj_maustank",
        modifiers = {0.9, 1.3, 1, 0.8, 1.5},
        ammo_category = "kj_128kwk",
    },

    {
        modname = "kj_pak",
        modifiers = {0.9, 1.3, 1, 0.8, 1.5},
        ammo_category = "kj_pak",
    },

    {
        modname = "kj_panzer4",
        modifiers = {0.9, 1.3, 1, 0.8, 1.5},
        ammo_category = "kj_75kwk40",
    },

    {
        modname = "kj_rattetank",
        modifiers = {0.9, 1.3, 1, 0.8, 1.5},
        ammo_category = "kj_280SKC34",
    },

    {
        modname = "kj_ray",
        modifiers = {0.9, 1.3, 1, 0.8, 1.5},
        ammo_category = "kj_ray_cannon",
    },
    {
        modname = "kj_ray",
        modifiers = {0.9, 1.3, 1, 0.8, 1.5},
        ammo_category = "kj_ray_cannon_small",
    },

    {
        modname = "kj_rex",
        modifiers = {0.9, 1.3, 1, 0.8, 1.5},
        ammo_category = "kj_rex_cannon",
    },

    {
        modname = "kj_wirbelwind",
        modifiers = {0.2, 0.2, 0.2, 0.2, 0.2},
        ammo_category = "kj_2cmfv",
    },

    {
        modname = "kj_vierling",
        modifiers = {0.2, 0.2, 0.2, 0.2, 0.2},
        ammo_category = "kj_2cmfv_vierling",
    },

    {
        modname = "kj_phalanx",
        modifiers = {0.2, 0.2, 0.2, 0.2, 0.2},
        ammo_category = "kj_apds_phalanx",
    },
}

local laserTechs = {
    "laser-weapons-damage-5",
    "laser-weapons-damage-6",
    "laser-weapons-damage-7",
    "laser-shooting-speed-5",
    "laser-shooting-speed-6",
    "laser-shooting-speed-7",
    "ammo-damage",
    "ammo-damage",
    "ammo-damage",
    "gun-speed",
    "gun-speed",
    "gun-speed",
}

if mods["kj_laser"] then
    local tech = {
        modifiers = {0.2, 0.2, 0.2, 0.1, 0.2, 0.2},
        ammo_category = "kj_laser",
    }

    for i, unit in ipairs(tech.modifiers) do
        if unit > 0 then
            table.insert(data.raw["technology"][laserTechs[i]].effects, {
                type = laserTechs[i + 6],
                ammo_category = tech.ammo_category,
                modifier = unit,
            })
            log("Adding to "..laserTechs[i].." "..unit.." "..tech.ammo_category)
        end
    end
end

local techs = {
    "physical-projectile-damage-5",
    "physical-projectile-damage-6",
    "physical-projectile-damage-7",
    "weapon-shooting-speed-5",
    "weapon-shooting-speed-6",
    "ammo-damage",
    "ammo-damage",
    "ammo-damage",
    "gun-speed",
    "gun-speed",
}

for _, tech in pairs(techUpdates) do
    if mods[tech.modname] then
        for i, unit in ipairs(tech.modifiers) do
            if unit > 0 then
                table.insert(data.raw["technology"][techs[i]].effects, {
                    type = techs[i + 5],
                    ammo_category = tech.ammo_category,
                    modifier = unit,
                })
            end
        end
    end
end