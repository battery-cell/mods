local utils = require("utils")
local modname = "__kj_ho229__"

for i = 0, 127 do
  data:extend({
    {
      name = "kj_ho229_shadow-"..i+1,
      type = "sprite",
      layers = {
        utils.spriteMaker(modname, "", "ho229", 1000, i, {8, 8}, 2),
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
    name = "kj_ho229",
    corpse = "big-remnants",
    dying_explosion = "massive-explosion",
    collision_box = {{-0.5, -2}, {0.5, 2}},
    selection_box = {{-0.5, -2}, {0.5, 2}},
    sticker_box = {{-0.5, -0.5}, {0.5, 0.5}},
    render_layer = "air-object",
    final_render_layer = "air-object",
    turret_return_timeout = 0,
	  has_belt_immunity = true,
    is_military_target = true,
    --darkness_to_render_light_animation = -100,
    stop_trigger = utils.brakes("tank"),
    guns = {"kj_ho229_machinegun"},

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
	    burnt_inventory_size = 2,
    },
    light =
    {
      utils.lights(3, 1, {x = 0, y =-3}),
    },
    animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "ho229", 1000, {1, 1}, {8, 8}, 2, 1),--base
        utils.layerMaker(modname, "", "ho229_flying", 1000, {1, 1}, {8, 8}, 2, 1),--flying
        utils.layerMaker(modname, "", "ho229", 1000, {1, 1}, {8, 8}, 2, 3),--light
        utils.layerMaker(modname, "", "ho229", 1000, {1, 1}, {8, 8}, 2, 2),--shadow
      },
    },
    open_sound = {filename = "__base__/sound/train-door-open.ogg", volume = 0.7},
    close_sound = {filename = "__base__/sound/train-door-close.ogg", volume = 0.7},
  },
})