local utils = require("utils")
local modname = "__kj_747__"

for i = 0, 127 do
  data:extend({
    {
      name = "kj_747_shadow-"..i+1,
      type = "sprite",
      layers = {
        --utils.spriteMaker(modname, "", "747_wheels", 2000, i, {4, 4}, 2, nil, nil, 1),
        utils.spriteMaker(modname, "", "747",        2000, i, {4, 4}, 2, nil, nil, 1),
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
    name = "kj_747",
    corpse = "big-remnants",
    dying_explosion = "massive-explosion",
    trigger_target_mask = nil,
    render_layer = "air-object",
    final_render_layer = "air-object",
    collision_box = {{-1, -6}, {1, 6}},
    selection_box = {{-1, -6}, {1, 6}},
    sticker_box = {{-0.5, -0.5}, {0.5, 0.5}},
		drawing_box_vertical_extension = 5,
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
      fuel_inventory_size = 6,
      burnt_inventory_size = 6,
    },
    light =
    {
      utils.lights(3, 1, {x = -5.5, y =-4}, 2),
      utils.lights(3, 1, {x =  5.5, y =-4}, 2),
      utils.lights(3, 0.5, {x =  0, y = 13}, 2, 0.5, {r = 1, g = 0, b = 0}),
    },
    animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "747_wheels", 2000, {1, 3}, {4, 4}, 8, 1, nil, nil, nil, nil, 1),
        utils.layerMaker(modname, "", "747",        2000, {1, 3}, {4, 4}, 8, 1, nil, nil, nil, nil, 1),
        utils.layerMaker(modname, "", "747_rotor" , 2000, {3, 1}, {3, 4}, 32, 1, nil, nil, nil, nil, 1),

        utils.layerMaker(modname, "", "747_wheels", 2000, {1, 3}, {4, 4}, 8, 2, nil, nil, nil, nil, 1),
        utils.layerMaker(modname, "", "747",        2000, {1, 3}, {4, 4}, 8, 2, nil, nil, nil, nil, 1),
      },
    },
  },
})
