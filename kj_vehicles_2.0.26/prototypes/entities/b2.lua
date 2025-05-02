local utils = require("utils")
local modname = "__kj_b2__"

for i = 0, 127 do
  data:extend({
    {
      name = "kj_b2_shadow-"..i+1,
      type = "sprite",
      layers = {
        utils.spriteMaker(modname, "", "b2", 2000, i, {4, 4}, 2),
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
    name = "kj_b2",
    corpse = "big-remnants",
    dying_explosion = "massive-explosion",
    collision_box = {{-0.9, -2.5}, {0.9, 2.5}},
    selection_box = {{-0.9, -2.5}, {0.9, 2.5}},
    sticker_box = {{-0.5, -0.5}, {0.5, 0.5}},
	  render_layer = "air-object",
	  final_render_layer = "air-object",
    turret_return_timeout = 0,
	  has_belt_immunity = true,
    is_military_target = true,
    stop_trigger = utils.brakes("tank"),
    guns = {"kj_b2_bombs"},

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
	    burnt_inventory_size = 2,
    },
    light =
    {
      utils.lights(3, 1, {x = -2, y =-3}),
      utils.lights(3, 1, {x =  2, y =-3}),
    },
    animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "b2", 2000, {1, 1}, {4, 4}, 8, 1),
        utils.layerMaker(modname, "", "b2_flying", 2000, {1, 1}, {4, 4}, 8, 1),
        utils.layerMaker(modname, "", "b2", 2000, {1, 1}, {4, 4}, 8, 2),
      },
    },
    open_sound = {filename = "__base__/sound/train-door-open.ogg", volume = 0.7},
    close_sound = {filename = "__base__/sound/train-door-close.ogg", volume = 0.7},
  },
})