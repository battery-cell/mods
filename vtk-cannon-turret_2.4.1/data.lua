require("prototypes.cannon-turret")
require("prototypes.cannon-turret-ammo")
require("prototypes.technology-cannon-turret")

local path = "__vtk-cannon-turret__"

if mods["space-age"] then
  table.insert(data.raw["ammo-turret"]["vtk-cannon-turret"], {heating_energy = "50kW"})
  table.insert(data.raw["ammo-turret"]["vtk-cannon-turret-heavy"], {heating_energy = "100kW"})
end

if settings.startup["vtk-cannon-turret-ammo-use"].value == 1 then
  data.raw["ammo-turret"]["vtk-cannon-turret"]["attack_parameters"]["ammo_categories"] = {"cannon-shell-magazine"}
  data.raw["ammo-turret"]["vtk-cannon-turret-heavy"]["attack_parameters"]["ammo_categories"] = {"cannon-shell-magazine"}
end
if settings.startup["vtk-cannon-turret-ammo-use"].value == 3 then
  data.raw["ammo-turret"]["vtk-cannon-turret"]["attack_parameters"]["ammo_categories"] = {"cannon-shell-magazine", "cannon-shell"}
  data.raw["ammo-turret"]["vtk-cannon-turret-heavy"]["attack_parameters"]["ammo_categories"] = {"cannon-shell-magazine", "cannon-shell"}
end

if settings.startup["vtk-cannon-turret-ammo-use"].value == 1 or
   settings.startup["vtk-cannon-turret-ammo-use"].value == 3 then

  table.insert(data.raw["technology"]["vtk-cannon-turret-unlock"]["effects"], { type = "unlock-recipe", recipe = "cannon-shell-magazine" })
  table.insert(data.raw["technology"]["vtk-cannon-turret-unlock"]["effects"],  { type = "unlock-recipe", recipe = "explosive-cannon-shell-magazine" })

  -- Make new cannon turret shell magazine ammo affected by shell technology upgrades
  table.insert(data.raw['technology']['physical-projectile-damage-5']['effects'], {type = "ammo-damage", ammo_category = "cannon-shell-magazine", modifier = data.raw['technology']['physical-projectile-damage-5']['effects'][4].modifier})
  table.insert(data.raw['technology']['physical-projectile-damage-6']['effects'], {type = "ammo-damage", ammo_category = "cannon-shell-magazine", modifier = data.raw['technology']['physical-projectile-damage-6']['effects'][4].modifier})
  table.insert(data.raw['technology']['physical-projectile-damage-7']['effects'], {type = "ammo-damage", ammo_category = "cannon-shell-magazine", modifier = data.raw['technology']['physical-projectile-damage-7']['effects'][4].modifier})

  table.insert(data.raw['technology']['weapon-shooting-speed-5']['effects'], {type = "gun-speed", ammo_category = "cannon-shell-magazine", modifier = data.raw['technology']['weapon-shooting-speed-5']['effects'][3].modifier})
  table.insert(data.raw['technology']['weapon-shooting-speed-6']['effects'], {type = "gun-speed", ammo_category = "cannon-shell-magazine", modifier = data.raw['technology']['weapon-shooting-speed-6']['effects'][3].modifier})

  if settings.startup["vtk-cannon-turret-magazine-new-icon"].value == false then
    data.raw["ammo"]["cannon-shell-magazine"].icon = path .. "/graphics/icons/cannon-shell-magazine-old.png"
    data.raw["ammo"]["explosive-cannon-shell-magazine"].icon = path .. "/graphics/icons/explosive-cannon-shell-magazine-old.png"
    data.raw["ammo"]["uranium-cannon-shell-magazine"].icon = path .. "/graphics/icons/uranium-cannon-shell-magazine-old.png"
    data.raw["ammo"]["explosive-uranium-cannon-shell-magazine"].icon = path .. "/graphics/icons/explosive-uranium-cannon-shell-magazine-old.png"
  end
end

if settings.startup["vtk-cannon-turret-magazine-new-icon"].value == false then
  data.raw["ammo-category"]["cannon-shell-magazine"].icon = path .. "/graphics/icons/cannon-shell-magazine-old.png"
else
  data.raw["ammo-category"]["cannon-shell-magazine"].icon = path .. "/graphics/icons/cannon-shell-magazine.png"
end
