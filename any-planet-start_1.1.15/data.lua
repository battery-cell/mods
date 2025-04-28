APS = {
    planets = {},
}

---@param planet APS.PlanetData
function APS.add_planet(planet)
    APS.planets[planet.name] = {
        filename = planet.filename,
        technology = planet.technology,
    }
end

for _, planet in pairs{"vulcanus", "gleba", "fulgora"} do
    APS.add_planet{
        name = planet,
        filename = "planets/" .. planet,
        technology = "planet-discovery-" .. planet,
    }
end

---@class APS.PlanetData
---@field name string
---@field filename string
---@field technology? string

data:extend{{
    type = "custom-event",
    name = "aps-post-init",
}}