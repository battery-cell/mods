local tables = require("tables")
local movement_triggers = require("movement_triggers")
--log(serpent.block(movement_triggers))

for name, mod in pairs(tables.supportedMods) do
    if mod.car == true then
        --log("Updating car data "..name)
        if data.raw["car"][name] ~= nil then
            log(name.." existing")

            local car = data.raw["car"][name]
            car.icon = "__"..name.."__".."/graphics/icon.png"
            car.icon_size = 128
            car.flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "building-direction-8-way", "not-flammable"}
            car.minable = {mining_time = math.min(tables.entityData.weight[name] / 10000, 15), result = name}
            if car.mined_sound == nil then
                car.mined_sound = {filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8}
            end
            car.max_health = tables.entityData.max_health[name]
            car.immune_to_tree_impacts = tables.entityData.impactInfos[name][1]
            car.immune_to_rock_impacts = tables.entityData.impactInfos[name][2]
            car.energy_per_hit_point =   tables.entityData.impactInfos[name][3]
            car.resistances = {
                {
                    type = "fire",
                    decrease = tables.entityData.resistances[name][1][1],
                    percent  = tables.entityData.resistances[name][1][2]
                },
                {
                    type = "physical",
                    decrease = tables.entityData.resistances[name][2][1],
                    percent  = tables.entityData.resistances[name][2][2]
                },
                {
                    type = "impact",
                    decrease = tables.entityData.resistances[name][3][1],
                    percent  = tables.entityData.resistances[name][3][2]
                },
                {
                    type = "explosion",
                    decrease = tables.entityData.resistances[name][4][1],
                    percent  = tables.entityData.resistances[name][4][2]
                },
                {
                    type = "acid",
                    decrease = tables.entityData.resistances[name][5][1],
                    percent  = tables.entityData.resistances[name][5][2]
                },
                {
                    type = "electric",
                    decrease = tables.entityData.resistances[name][6][1],
                    percent  = tables.entityData.resistances[name][6][2]
                },
                {
                    type = "laser",
                    decrease = tables.entityData.resistances[name][7][1],
                    percent  = tables.entityData.resistances[name][7][2]
                },
                {
                    type = "poison",
                    decrease = tables.entityData.resistances[name][8][1],
                    percent  = tables.entityData.resistances[name][8][2]
                },
            }
            car.braking_power = tables.entityData.braking_power[name]
            car.consumption = tables.entityData.consumption[name]

            car.friction =                  tables.entityData.friTerSpdEff[name][1]
            car.terrain_friction_modifier = tables.entityData.friTerSpdEff[name][2]
            car.stop_trigger_speed        = tables.entityData.friTerSpdEff[name][3]
            car.effectivity               = 1
            car.energy_source.effectivity = tables.entityData.friTerSpdEff[name][4]

            if car.sound_no_fuel == nil then
                car.sound_no_fuel = {{filename = "__"..name.."__/sounds/engine-fail.ogg", volume = 0.5}}
            end
            if car.open_sound == nil then
                car.open_sound =  {filename = "__"..name.."__/sounds/door-open.ogg",  volume = 0.7}
            end
            if car.close_sound == nil then
                car.close_sound = {filename = "__"..name.."__/sounds/door-close.ogg", volume = 0.7}
            end

            car.weight = tables.entityData.weight[name]

            car.inventory_size =        tables.entityData.invRotTur[name][1]
            car.rotation_speed =        tables.entityData.invRotTur[name][2]
            car.turret_rotation_speed = tables.entityData.invRotTur[name][3]

            car.damaged_trigger_effect = data.raw["car"]["car"].damaged_trigger_effect
            car.impact_category = "metal"
            car.impact_speed_to_volume_ratio = 4.0
            car.deliver_category = "vehicle"
            car.crash_trigger = data.raw["car"]["car"].crash_trigger
            car.track_particle_triggers = movement_triggers[mod.name]

            car.water_reflection = data.raw["car"]["car"].water_reflection
        end
    end
end
