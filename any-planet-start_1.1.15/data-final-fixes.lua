local planet = settings.startup["aps-planet"].value
if planet == "none" then return end

local utils = require("utils") --[[@as APS.utils]]

local planet_technology = APS.planets[planet].technology
if planet_technology then
    utils.remove_tech(planet_technology, true, false)
end

for _, technology in pairs(data.raw.technology) do
    local prerequisites = technology.prerequisites
    if prerequisites then
        for i = #prerequisites, 1, -1 do
            if prerequisites[i] == "planet-discovery-" .. planet then
                table.remove(prerequisites, i)
                break
            end
        end
    end
end

local technology = data.raw.technology[APS.planets[planet].technology]
if technology and technology.effects then
    for _, effect in pairs(technology.effects) do
        if effect.type == "unlock-recipe" then
            data.raw.recipe[effect.recipe].enabled = true
        end
    end
end