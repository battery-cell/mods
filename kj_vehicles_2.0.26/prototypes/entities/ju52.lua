local utils = require("utils")
local modname = "__kj_ju52__"

for i = 0, 127 do
  data:extend({
    {
      name = "kj_ju52_shadow-"..i+1,
      type = "sprite",
      layers = {
        utils.spriteMaker(modname, "shadow", "ju52",       1600, i, {4, 4}, 2),
      }
    }
  })
end

data:extend({
  {
    type = "damage-type",
    name = "flak"
  },

  {
    type = "car",
    name = "kj_ju52",
    corpse = "big-remnants",
    dying_explosion = "massive-explosion",
    collision_box = {{-0.5, -5}, {0.5, 5}},
    selection_box = {{-0.5, -5}, {0.5, 5}},
    sticker_box = {{-0.5, -0.5}, {0.5, 0.5}},
    render_layer = "air-object",
    final_render_layer = "air-object",
    turret_return_timeout = 0,
	  has_belt_immunity = true,
    stop_trigger = utils.brakes("tank"),

    minimap_representation = {
      filename = modname.."/graphics/map.png",
      flags = {"icon"},
      size = {128, 128},
      scale = 0.3,
    },
    selected_minimap_representation = {
      filename = modname.."/graphics/map.png",
      flags = {"icon"},
      size = {128, 128},
      scale = 0.3,
    },
	  energy_source =
    {
      type = "burner",
      fuel_categories = {"kj_kerosine"},
      effectivity = 1,
      fuel_inventory_size = 3,
	    burnt_inventory_size = 3,
      smoke =
      {
        {
          name = "kj_ju52_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {0, -5.5},
		      offset = -1,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
        {
          name = "kj_ju52_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {2.5, -4.5},
		      offset = -1,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
        {
          name = "kj_ju52_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {-2.5, -4.5},
		      offset = -1,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
      },
    },
    light =
    {
      utils.lights(3, 1, {x = 0, y =-6}),
      utils.lights(3, 0.5, {x = 0, y = 5}, nil, 0.5, {r = 1, g = 0, b = 0}),
    },
    animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "ju52",        1600, {1, 3}, {4, 4}, 8, 1),
        utils.layerMaker(modname, "", "ju52_rotor" , 1600, {3, 1}, {3, 4}, 32, 1),
        utils.layerMaker(modname, "shadow", "ju52",  1600, {1, 3}, {4, 4}, 8, 2),
        utils.layerMaker(modname, "shadow", "ju52_rotor" , 1600, {3, 1}, {3, 4}, 32, 2),
      },
    },
  },
})