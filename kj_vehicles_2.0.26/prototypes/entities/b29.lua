local utils = require("utils")
local modname = "__kj_b29__"

local pxRes = 2290 / 47
local function offset(pixels, unit, blenderUnits)
  local blU = blenderUnits or {1,0}
  local u = unit or {0, 0.5}
  local byPixel = util.by_pixel_hr(blU[1] * pxRes + pixels[1], -blU[2] * pxRes + pixels[2])

  return {byPixel[1] + u[1], byPixel[2] + u[2]}
end

for i = 0, 127 do
  data:extend({
    {
      name = "kj_b29_shadow-"..i+1,
      type = "sprite",
      layers = {
        utils.spriteMaker(modname, "shadow", "b29", 2290, i, {2, 2}, 2, offset({0,0})),
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
    name = "kj_b29",
    corpse = "big-remnants",
    dying_explosion = "massive-explosion",
    collision_box = {{-1.1, -7}, {1.1, 7}},
    selection_box = {{-1.1, -7}, {1.1, 7}},
    sticker_box = {{-0.5, -0.5}, {0.5, 0.5}},
    render_layer = "air-object",
    final_render_layer = "air-object",
    turret_return_timeout = 0,
	  has_belt_immunity = true,
    is_military_target = true,
    stop_trigger = utils.brakes("tank"),
    guns = {"kj_b29_machinegun", "kj_b29_bombs"},

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
          name = "kj_b29_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {-3.2, -4.2},
		      offset = -1,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
        {
          name = "kj_b29_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {3.2, -4.2},
		      offset = -1,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
        {
          name = "kj_b29_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {-7.2, -4.1},
		      offset = -1,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
        {
          name = "kj_b29_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {7.2, -4.1},
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
        utils.layerMaker(modname, "", "b29_wheels", {1110, 740}, {1,3}, {4,4},  8, 1, offset({-50,15})),
        utils.layerMaker(modname, "", "b29",               2290, {1,3}, {2,2}, 32, 1, offset({0,0})),
        utils.layerMaker(modname, "", "b29_rotor",  {1290,1000}, {3,1}, {3,4}, 32, 1, offset({-50, -105}), nil, nil, "backward"),
        utils.layerMaker(modname, "shadow", "b29",         2290, {1,3}, {2,2}, 32, 2, offset({0,0})),
        utils.layerMaker(modname, "shadow", "b29_rotor",{1450,910},{3,1},{3,4},32, 2, offset({0,0}), nil, nil, "backward"),
        --utils.layerMaker(modname, "shadow", "b29_rotor",  2290, {3,1}, {3,4}, 32, 2),
      },
    },
  },
})