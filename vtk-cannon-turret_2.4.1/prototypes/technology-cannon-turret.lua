local path = "__vtk-cannon-turret__"

data:extend(
{
  {
    type = "technology",
    name = "vtk-cannon-turret-unlock",
    icon_size = 256,
    icon = path .. "/graphics/technology/cannon-turret-tech.png",
    effects = 
    {
      {
        type = "unlock-recipe",
        recipe = "vtk-cannon-turret"
      },
    },
    prerequisites = {"gun-turret", "tank"},
    unit =
    {
      count = 350,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 30,
    },
    upgrade = true,
    order = "e-c-c-a"
  },
  {
    type = "technology",
    name = "vtk-cannon-turret-heavy-unlock",
    icon_size = 256,
    icon = path .. "/graphics/technology/cannon-turret-heavy-tech.png",
    effects = 
    {
      {
        type = "unlock-recipe",
        recipe = "vtk-cannon-turret-heavy"
      },
    },
    prerequisites = {"vtk-cannon-turret-unlock"},
    unit =
    {
      count = 350,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"production-science-pack", 1},
      },
      time = 30,
    },
    upgrade = true,
    order = "e-c-c-a"
  },
})

if settings.startup["vtk-cannon-turret-ammo-use"].value == 1 or
   settings.startup["vtk-cannon-turret-ammo-use"].value == 3 then
  -- Set unlock on uranium magazine ammo on uranium ammo technology
  table.insert(data.raw['technology']['uranium-ammo']['effects'], {type = "unlock-recipe", recipe = "uranium-cannon-shell-magazine"})
  table.insert(data.raw['technology']['uranium-ammo']['effects'], {type = "unlock-recipe", recipe = "explosive-uranium-cannon-shell-magazine"})
end
