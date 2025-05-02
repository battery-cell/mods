local utils = require("utils")
local modname = "__kj_40klemanruss__"

data:extend({
  {
    type = "car",
    name = "kj_40klemanruss",
    corpse = "big-remnants",
    dying_explosion = "rocket-silo-explosion",
    equipment_grid = "kj_40klemanruss",
    render_layer = "higher-object-under",
    collision_box = {{-1.8, -2}, {1.8, 2}},
    selection_box = {{-1.8, -2}, {1.8, 2}},
    sticker_box = {{-1, -1}, {1, 1}},
	  drawing_box_vertical_extension = 1.5,
    stop_trigger = utils.brakes("tank"),
    tank_driving = true,
    turret_return_timeout = 300,
	  has_belt_immunity = true,
    guns = {"kj_lemanruss", "kj_lemanruss_bolter"},
    is_military_target = true,
    allow_remote_driving = true,

	  energy_source =
    {
      type = "burner",
      fuel_categories = {"kj_gas_barrel"},
      effectivity = 1,
      fuel_inventory_size = 2,
	    burnt_inventory_size = 1,
      smoke =
      {
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          --position = {-0.5, 2},
          north_position = {0, -2},
          south_position = {0, -2},
          east_position = {0, -2},
          west_position = {0, -2},
		      --offset = -2,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
      }
    },
    light =
    {
      utils.lights(3, 2, {x =-1.4, y = -2}),
      utils.lights(3, 2, {x = 1.4, y = -2}),
    },
    animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "lemanRuss", 1000, {2,1}, {2,8}, 16, 1),
        utils.layerMaker(modname, "", "lemanRuss", 1000, {1,2}, {8,8}, 2, 2),
      }
    },
	  turret_animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "lemanRuss", 1000, {1,1}, {8,8}, 2, 4),
        utils.layerMaker(modname, "", "lemanRuss", 1000, {1,1}, {8,8}, 2, 5),
	    }
    },
    working_sound =
    {
      main_sounds =
      {
        {
          sound = {filename = "__base__/sound/fight/tank-engine-driving.ogg", volume = 0.35, modifiers = volume_multiplier("main-menu", 1.3)},
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {
            multiplier = 4.5,
            offset = 1.0,
          },
          match_speed_to_activity = true,
          activity_to_speed_modifiers = {
            multiplier = 3.0,
            minimum = 1.0,
            maximum = 1.2,
            offset = 0.8
          }
        },
        {
          sound = {filename = "__base__/sound/fight/tank-tracks.ogg", volume = 0.35, modifiers = volume_multiplier("main-menu", 1.3)},
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {
            multiplier = 4.5,
            offset = 1.0,
          },
        },
        {
          sound = {filename = "__kj_40klemanruss__/sounds/engine.ogg", volume = 0.37 },
          match_volume_to_activity = true,
          --fade_in_ticks = 22,
          --fade_out_ticks = 4,
          activity_to_volume_modifiers = {
            --multiplier = 1.3,
            --offset = 1.3,
            inverted = true,
            minimum = 0.75,
          }
        },
      },
      activate_sound = {filename = "__kj_40klemanruss__/sounds/engine-start.ogg", volume = 0.37},
      deactivate_sound = {filename = "__kj_40klemanruss__/sounds/engine-stop.ogg", volume = 0.37},
    },
  },
})