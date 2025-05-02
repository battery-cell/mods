local utils = require("utils")
local modname = "__kj_b17__"

for i = 0, 127 do
  data:extend({
    {
      name = "kj_b17_shadow-"..i+1,
      type = "sprite",
      layers = {
        utils.spriteMaker(modname, "shadow", "b17", 2000, i, {4, 4}, 2),
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
    name = "kj_b17",
    corpse = "big-remnants",
    dying_explosion = "massive-explosion",
    collision_box = {{-1.1, -6}, {1.1, 6}},
    selection_box = {{-1.1, -6}, {1.1, 6}},
    sticker_box = {{-0.5, -0.5}, {0.5, 0.5}},
    render_layer = "air-object",
    final_render_layer = "air-object",
    turret_return_timeout = 0,
	  has_belt_immunity = true,
    is_military_target = true,
    stop_trigger = utils.brakes("tank"),
    guns = {"kj_b17_machinegun", "kj_b17_bombs"},

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
      fuel_inventory_size = 5,
	    burnt_inventory_size = 5,
      smoke =
      {
        {
          name = "kj_b17_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {-2.2, -5},
		      offset = -1,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
        {
          name = "kj_b17_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {2.2, -5},
		      offset = -1,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
        {
          name = "kj_b17_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {-5, -5},
		      offset = -1,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
        {
          name = "kj_b17_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {5, -5},
		      offset = -1,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
      },
    },
    light = {
      utils.lights(3, 1, {x = -7, y =-4}),
      utils.lights(3, 1, {x =  7, y =-4}),
      utils.lights(3,0.5, {x = 0, y = 7}, nil, 0.5, {r = 1, g = 0, b = 0}),
    },
    animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "b17",        2000, {1,3}, {4,4}, 8, 1),
        utils.layerMaker(modname, "", "b17_rotor",  2000, {3,1}, {3,4}, 32, 1),
        utils.layerMaker(modname, "shadow", "b17",  2000, {1,3}, {4,4}, 8, 2),
        utils.layerMaker(modname, "shadow", "b17_rotor",  2000, {3,1}, {3,4}, 32, 2),
      },
    },
  },
})