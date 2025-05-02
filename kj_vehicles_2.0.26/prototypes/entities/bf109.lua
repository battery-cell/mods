local utils = require("utils")
local modname = "__kj_bf109__"

for i = 0, 127 do
  data:extend({
    {
      name = "kj_bf109_shadow-"..i+1,
      type = "sprite",
      layers = {
        utils.spriteMaker(modname, "", "bf109",        532, i, {8, 8}, 2),
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
    name = "kj_bf109",
    corpse = "big-remnants",
    dying_explosion = "massive-explosion",
    collision_box = {{-0.25, -2}, {0.25, 2}},
    selection_box = {{-0.25, -2}, {0.25, 2}},
    sticker_box = {{-0.5, -0.5}, {0.5, 0.5}},
    render_layer = "air-object",
    final_render_layer = "air-object",
    turret_return_timeout = 0,
	  has_belt_immunity = true,
    is_military_target = true,
    stop_trigger = utils.brakes("tank"),
    guns = {"kj_bf109_machinegun", "kj_bf109_machinecannon"},

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
      fuel_inventory_size = 2,
	    burnt_inventory_size = 1,
      smoke =
      {
        {
          name = "kj_bf109_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {0, -2.7},
		      --offset = -2,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
      }
    },
    light = {
      utils.lights(3, 1, {x = 0, y =-3}),
      utils.lights(3, 0.5, {x = 0, y = 3}, nil, 0.5, {r = 1, g = 0, b = 0}),
    },
    animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "bf109",        532, {1, 3}, {8, 8}, 2, 1),
        utils.layerMaker(modname, "", "bf109_rotor",  532, {3, 1}, {3, 8}, 16, 1),
        utils.layerMaker(modname, "", "bf109",        532, {1, 3}, {8, 8}, 2, 2),
        utils.layerMaker(modname, "", "bf109_rotor",  532, {3, 1}, {3, 8}, 16, 2),
      },
    },
    open_sound = {filename = "__base__/sound/train-door-open.ogg", volume = 0.7},
    close_sound = {filename = "__base__/sound/train-door-close.ogg", volume = 0.7},
  },
})