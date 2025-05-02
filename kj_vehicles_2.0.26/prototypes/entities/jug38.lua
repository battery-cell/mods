local utils = require("utils")
local modname = "__kj_jug38__"

for i = 0, 127 do
  data:extend({
    {
      name = "kj_jug38_shadow-"..i+1,
      type = "sprite",
      layers = {
        utils.spriteMaker(modname, "shadow", "jug38", 2730, i, {2, 2}, 2),
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
    name = "kj_jug38",
    corpse = "big-remnants",
    dying_explosion = "massive-explosion",
    collision_box = {{-0.7, -7}, {0.7, 7}},
    selection_box = {{-0.7, -7}, {0.7, 7}},
    sticker_box = {{-0.5, -0.5}, {0.5, 0.5}},
    render_layer = "air-object",
    final_render_layer = "air-object",
    turret_return_timeout = 0,
	  has_belt_immunity = true,
    stop_trigger = utils.brakes("tank"),

    minimap_representation = {
      filename = "__kj_jug38__/graphics/map.png",
      flags = {"icon"},
      size = {128, 128},
      scale = 0.3,
    },
    selected_minimap_representation = {
      filename = "__kj_jug38__/graphics/map.png",
      flags = {"icon"},
      size = {128, 128},
      scale = 0.3,
    },

    light =
    {
      utils.lights(3, 1, {x = 0, y =-8}),
      utils.lights(3, 0.75, {x = 0, y = 7}, nil, 0.5, {r = 1, g = 0, b = 0}),
    },
	  energy_source =
    {
      type = "burner",
      fuel_categories = {"kj_kerosine"},
      effectivity = 1,
      fuel_inventory_size = 4,
	    burnt_inventory_size = 4,
      smoke =
      {
        {
          name = "kj_jug38_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {-2.3, -7},
		      offset = -1,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
        {
          name = "kj_jug38_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {2.3, -7},
		      offset = -1,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
        {
          name = "kj_jug38_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {-5.8, -5},
		      offset = -1,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
        {
          name = "kj_jug38_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {5.8, -5},
		      offset = -1,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
      },
    },
    animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "jug38",        2730, {1, 3}, {2, 2}, 32, 1),
        utils.layerMaker(modname, "", "jug38_rotor" , 2730, {3, 1}, {3, 2}, 64, 1),
        utils.layerMaker(modname, "shadow", "jug38",  2730, {1, 3}, {2, 2}, 32, 2),
        utils.layerMaker(modname, "shadow", "jug38_rotor" , 2730, {3, 1}, {3, 2}, 64, 2),
      },
    },
  },
})