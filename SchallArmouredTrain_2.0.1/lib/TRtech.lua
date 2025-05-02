local TRtech = {}



local locomotive_icon_path = "__SchallArmouredTrain__/graphics/technology/armoured-locomotive.png"
local cargo_wagon_icon_path = "__SchallArmouredTrain__/graphics/technology/armoured-cargo-wagon.png"
local fluid_wagon_icon_path = "__SchallArmouredTrain__/graphics/technology/armoured-fluid-wagon.png"
local nuclear_locomotive_icon_layer = {icon = "__base__/graphics/technology/railway.png", icon_size = 256}
local tank_icon_layer = {icon = "__base__/graphics/technology/tank.png", icon_size = 256}
local nuclear_icon_overlay = {icon = "__SchallArmouredTrain__/graphics/technology/nuclear.png", icon_size = 256}
local rail_icon_overlay = {icon = "__SchallArmouredTrain__/graphics/technology/rail.png", icon_size = 256}

local NL_icons = { nuclear_locomotive_icon_layer, nuclear_icon_overlay }
local AD_icons = { tank_icon_layer, rail_icon_overlay }



local tech = {
  ["Schall-nuclear-locomotive"] =
    {
      type = "technology",
      name = "Schall-nuclear-locomotive",
      icon_size = 256, icon_mipmaps = 4,
      icons = NL_icons,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "Schall-nuclear-locomotive"
        }
      },
      prerequisites = {"railway", "nuclear-power"},
      unit =
      {
        count = 400,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1}
        },
        time = 30
      },
      order = "c-g-e"
    },
  ["Schall-armoured-locomotive"] = {
    [0] =
      {
        type = "technology",
        name = "Schall-armoured-locomotive-0",
        icon_size = 256, icon_mipmaps = 4,
        icon = locomotive_icon_path,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "Schall-armoured-locomotive"
          }
        },
        prerequisites = {"railway", "modular-armor"},
        unit =
        {
          count = 100,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
          },
          time = 30
        },
        upgrade = true,
        order = "c-g-l"
      },
    [1] =
      {
        type = "technology",
        name = "Schall-armoured-locomotive-1",
        icon_size = 256, icon_mipmaps = 4,
        icon = locomotive_icon_path,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "Schall-armoured-locomotive-mk1"
          }
        },
        prerequisites = {"Schall-armoured-locomotive-0", "power-armor"},
        unit =
        {
          count = 200,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
          },
          time = 30
        },
        upgrade = true,
        order = "c-g-l"
      },
    [2] =
      {
        type = "technology",
        name = "Schall-armoured-locomotive-2",
        icon_size = 256, icon_mipmaps = 4,
        icon = locomotive_icon_path,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "Schall-armoured-locomotive-mk2"
          }
        },
        prerequisites = {"Schall-armoured-locomotive-1", "power-armor-mk2"},
        unit =
        {
          count = 400,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"military-science-pack", 1},
            {"utility-science-pack", 1}
          },
          time = 30
        },
        upgrade = true,
        order = "c-g-l"
      },
    [3] =
      {
        type = "technology",
        name = "Schall-armoured-locomotive-3",
        icon_size = 256, icon_mipmaps = 4,
        icon = locomotive_icon_path,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "Schall-armoured-locomotive-mk3"
          }
        },
        prerequisites = {"Schall-armoured-locomotive-2", "Schall-power-armor-3"},
        unit =
        {
          count = 800,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"military-science-pack", 1},
            {"utility-science-pack", 1},
            {"space-science-pack", 1},
            {"alien-science-pack", 1}
          },
          time = 30
        },
        upgrade = true,
        order = "c-g-l"
      },
    },
  ["Schall-armoured-cargo-wagon"] = {
    [0] =
      {
        type = "technology",
        name = "Schall-armoured-cargo-wagon-0",
        icon_size = 256, icon_mipmaps = 4,
        icon = cargo_wagon_icon_path,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "Schall-armoured-cargo-wagon"
          }
        },
        prerequisites = {"railway", "modular-armor"},
        unit =
        {
          count = 100,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
          },
          time = 30
        },
        upgrade = true,
        order = "c-g-m"
      },
    [1] =
      {
        type = "technology",
        name = "Schall-armoured-cargo-wagon-1",
        icon_size = 256, icon_mipmaps = 4,
        icon = cargo_wagon_icon_path,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "Schall-armoured-cargo-wagon-mk1"
          }
        },
        prerequisites = {"Schall-armoured-cargo-wagon-0", "power-armor"},
        unit =
        {
          count = 200,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
          },
          time = 30
        },
        upgrade = true,
        order = "c-g-m"
      },
    [2] =
      {
        type = "technology",
        name = "Schall-armoured-cargo-wagon-2",
        icon_size = 256, icon_mipmaps = 4,
        icon = cargo_wagon_icon_path,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "Schall-armoured-cargo-wagon-mk2"
          }
        },
        prerequisites = {"Schall-armoured-cargo-wagon-1", "power-armor-mk2"},
        unit =
        {
          count = 400,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"military-science-pack", 1},
            {"utility-science-pack", 1}
          },
          time = 30
        },
        upgrade = true,
        order = "c-g-m"
      },
    [3] =
      {
        type = "technology",
        name = "Schall-armoured-cargo-wagon-3",
        icon_size = 256, icon_mipmaps = 4,
        icon = cargo_wagon_icon_path,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "Schall-armoured-cargo-wagon-mk3"
          }
        },
        prerequisites = {"Schall-armoured-cargo-wagon-2", "Schall-power-armor-3"},
        unit =
        {
          count = 800,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"military-science-pack", 1},
            {"utility-science-pack", 1},
            {"space-science-pack", 1},
            {"alien-science-pack", 1}
          },
          time = 30
        },
        upgrade = true,
        order = "c-g-m"
      },
    },
  ["Schall-armoured-fluid-wagon"] = {
    [0] =
      {
        type = "technology",
        name = "Schall-armoured-fluid-wagon-0",
        icon_size = 256, icon_mipmaps = 4,
        icon = fluid_wagon_icon_path,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "Schall-armoured-fluid-wagon"
          }
        },
        prerequisites = {"fluid-wagon", "modular-armor"},
        unit =
        {
          count = 100,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
          },
          time = 30
        },
        upgrade = true,
        order = "c-g-n"
      },
    [1] =
      {
        type = "technology",
        name = "Schall-armoured-fluid-wagon-1",
        icon_size = 256, icon_mipmaps = 4,
        icon = fluid_wagon_icon_path,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "Schall-armoured-fluid-wagon-mk1"
          }
        },
        prerequisites = {"Schall-armoured-fluid-wagon-0", "power-armor"},
        unit =
        {
          count = 200,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
          },
          time = 30
        },
        upgrade = true,
        order = "c-g-n"
      },
    [2] =
      {
        type = "technology",
        name = "Schall-armoured-fluid-wagon-2",
        icon_size = 256, icon_mipmaps = 4,
        icon = fluid_wagon_icon_path,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "Schall-armoured-fluid-wagon-mk2"
          }
        },
        prerequisites = {"Schall-armoured-fluid-wagon-1", "power-armor-mk2"},
        unit =
        {
          count = 400,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"military-science-pack", 1},
            {"utility-science-pack", 1}
          },
          time = 30
        },
        upgrade = true,
        order = "c-g-n"
      },
    [3] =
      {
        type = "technology",
        name = "Schall-armoured-fluid-wagon-3",
        icon_size = 256, icon_mipmaps = 4,
        icon = fluid_wagon_icon_path,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "Schall-armoured-fluid-wagon-mk3"
          }
        },
        prerequisites = {"Schall-armoured-fluid-wagon-2", "Schall-power-armor-3"},
        unit =
        {
          count = 800,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"military-science-pack", 1},
            {"utility-science-pack", 1},
            {"space-science-pack", 1},
            {"alien-science-pack", 1}
          },
          time = 30
        },
        upgrade = true,
        order = "c-g-n"
      },
    },
  ["Schall-armoured-draisine"] = {
    [0] =
      {
        type = "technology",
        name = "Schall-armoured-draisine-0",
        icon_size = 256, icon_mipmaps = 4,
        icons = AD_icons,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "Schall-armoured-draisine"
          }
        },
        prerequisites = {"railway", "tank"},
        unit =
        {
          count = 100,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
          },
          time = 30
        },
        upgrade = true,
        order = "c-g-k"
      },
    [1] =
      {
        type = "technology",
        name = "Schall-armoured-draisine-1",
        icon_size = 256, icon_mipmaps = 4,
        icons = AD_icons,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "Schall-armoured-draisine-mk1"
          }
        },
        prerequisites = {"Schall-armoured-draisine-0", "Schall-tank-1"},
        unit =
        {
          count = 50,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
          },
          time = 30
        },
        upgrade = true,
        order = "c-g-k"
      },
    [2] =
      {
        type = "technology",
        name = "Schall-armoured-draisine-2",
        icon_size = 256, icon_mipmaps = 4,
        icons = AD_icons,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "Schall-armoured-draisine-mk2"
          }
        },
        prerequisites = {"Schall-armoured-draisine-1", "Schall-tank-2"},
        unit =
        {
          count = 100,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"military-science-pack", 1},
            {"utility-science-pack", 1}
          },
          time = 30
        },
        upgrade = true,
        order = "c-g-k"
      },
    [3] =
      {
        type = "technology",
        name = "Schall-armoured-draisine-3",
        icon_size = 256, icon_mipmaps = 4,
        icons = AD_icons,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "Schall-armoured-draisine-mk3"
          }
        },
        prerequisites = {"Schall-armoured-draisine-2", "Schall-tank-3"},
        unit =
        {
          count = 200,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"military-science-pack", 1},
            {"utility-science-pack", 1},
            {"space-science-pack", 1},
            {"alien-science-pack", 1}
          },
          time = 30
        },
        upgrade = true,
        order = "c-g-k"
      },
    },
}



function TRtech.VEH_tech(spec, tier)
  if spec.flags["tier"] then
    return tech[spec.name][tier]
  else
    return tech[spec.name]
  end
end



return TRtech