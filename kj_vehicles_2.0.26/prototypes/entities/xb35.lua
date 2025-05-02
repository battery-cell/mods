local utils = require("utils")
local modname = "__kj_xb35__"

for i = 0, 127 do
  data:extend({
    {
      name = "kj_xb35_shadow-"..i+1,
      type = "sprite",
      layers = {
        --utils.spriteMaker(modname, "shadow", "xb35_wheels", 2730, i, {2, 2}, 2, nil, nil, 0.5595),
        utils.spriteMaker(modname, "shadow", "xb35",        2730, i, {2, 2}, 2, nil, nil, 0.5595),
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
    name = "kj_xb35",
    corpse = "big-remnants",
    dying_explosion = "massive-explosion",
    collision_box = {{-0.7, -3}, {0.7, 3}},
    selection_box = {{-0.7, -3}, {0.7, 3}},
    sticker_box = {{-0.5, -0.5}, {0.5, 0.5}},
		drawing_box_vertical_extension = 5,
    render_layer = "air-object",
    final_render_layer = "air-object",
    turret_return_timeout = 0,
	  has_belt_immunity = true,
    is_military_target = true,
    stop_trigger = utils.brakes("tank"),
    guns = {"kj_xb35_bombs"},

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
    light =
    {
      utils.lights(3, 1, {x = 0, y =-5.5}),
      utils.lights(3, 0.75, {x = 0, y = 3.5}, nil, 0.5, {r = 1, g = 0, b = 0}),
    },
	  energy_source =
    {
      type = "burner",
      fuel_categories = {"kj_kerosine"},
      effectivity = 1,
      fuel_inventory_size = 5,
      burnt_inventory_size = 3,
    },
    animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "xb35_wheels", 2730, {1, 3}, {2, 2}, 32, 1, nil, nil, nil, nil, 0.5595),
        utils.layerMaker(modname, "", "xb35",        2730, {1, 3}, {2, 2}, 32, 1, nil, nil, nil, nil, 0.5595),
        utils.layerMaker(modname, "", "xb35_rotor" , 1910, {3, 1}, {3, 4}, 32, 1),

        utils.layerMaker(modname, "shadow", "xb35_wheels", 2730, {1, 3}, {2, 2}, 32, 2, nil, nil, nil, nil, 0.5595),
        utils.layerMaker(modname, "shadow", "xb35",        2730, {1, 3}, {2, 2}, 32, 2, nil, nil, nil, nil, 0.5595),
        utils.layerMaker(modname, "shadow", "xb35_rotor" , 1910, {3, 1}, {3, 4}, 32, 2),
	    },
    },
  },
})