local IMG_PATH = MECHANICUS.IMG_PATH

local path_level1_idle = IMG_PATH .. "base/level1_idle.png"
local path_level1_idle_mask = IMG_PATH .. "base/level1_idle_mask.png"
local path_level1_running_shadow = IMG_PATH .. "base/level1_running_shadow.png"
local path_level1_idle_shadow = IMG_PATH .. "base/level1_idle_shadow.png"
local path_level1_mining_shadow = IMG_PATH .. "base/level1_mining_shadow.png"
local path_level1_idle_gun_shadow = IMG_PATH .. "base/level1_idle_gun_shadow.png"
local path_level1_running_gun_shadow_1 = IMG_PATH .. "base/level1_running_gun_shadow_1.png"
local path_level1_running_gun_shadow_2 = IMG_PATH .. "base/level1_running_gun_shadow_2.png"
local path_level1_idle_gun = IMG_PATH .. "base/level1_idle_gun.png"
local path_level1_idle_gun_mask = IMG_PATH .. "base/level1_idle_gun_mask.png"
local path_level1_mining_tool = IMG_PATH .. "base/level1_mining_tool.png"
local path_level1_mining_tool_mask = IMG_PATH .. "base/level1_mining_tool_mask.png"
local path_level1_running_gun = IMG_PATH .. "base/level1_running_gun.png"
local path_level1_running_gun_mask = IMG_PATH .. "base/level1_running_gun_mask.png"
local path_level1_running = IMG_PATH .. "base/level1_running.png"
local path_level1_running_mask = IMG_PATH .. "base/level1_running_mask.png"
local path_level1_dead = IMG_PATH .. "base/level1_dead.png"
local path_level2_idle = IMG_PATH .. "base/level2_idle.png"
local path_level2_idle_mask = IMG_PATH .. "base/level2_idle_mask.png"
local path_level2_running = IMG_PATH .. "base/level2_running.png"
local path_level2_running_mask = IMG_PATH .. "base/level2_running_mask.png"
local path_level2_running_gun = IMG_PATH .. "base/level2_running_gun.png"
local path_level2_running_gun_mask = IMG_PATH .. "base/level2_running_gun_mask.png"
local path_level2_idle_gun = IMG_PATH .. "base/level2_idle_gun.png"
local path_level2_idle_gun_mask = IMG_PATH .. "base/level2_idle_gun_mask.png"
local path_level2_mining_tool = IMG_PATH .. "base/level2_mining_tool.png"
local path_level2_mining_tool_mask = IMG_PATH .. "base/level2_mining_tool_mask.png"

local base_width = 300
local base_hight = 320
local base_scale = 0.325

-- original 0, -21
local icon_shift = util.by_pixel(0.0, -21.0)
-- original 20,-8
local shadow_shift = util.by_pixel(26, -5.0)

local mechanicus_animations = {

    level1 = {
        dead = {
            filename = path_level1_dead,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 2,
            scale = base_scale
        },

        idle = {
            filename = path_level1_idle,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.15,
            scale = base_scale
        },

        idle_shadow = {
            filename = path_level1_idle_shadow,
            width = base_width,
            height = base_hight,
            shift = shadow_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.6,
            draw_as_shadow = true,
            scale = base_scale
        },

        idle_mask = {
            filename = path_level1_idle_mask,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.15,
            apply_runtime_tint = true,
            scale = base_scale
        },

        idle_gun = {
            filename = path_level1_idle_gun,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.15,
            scale = base_scale
        },

        idle_gun_mask = {
            filename = path_level1_idle_gun_mask,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.15,
            apply_runtime_tint = true,
            scale = base_scale
        },

        idle_gun_shadow = {
            filename = path_level1_idle_gun_shadow,
            width = base_width,
            height = base_hight,
            shift = shadow_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.6,
            draw_as_shadow = true,
            scale = base_scale
        },

        mining_tool = {
            filename = path_level1_mining_tool,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.9,
            scale = base_scale
        },

        mining_tool_mask = {
            filename = path_level1_mining_tool_mask,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.9,
            apply_runtime_tint = true,
            scale = base_scale
		},

        mining_tool_shadow = {
            filename = path_level1_mining_shadow,
            width = base_width,
            height = base_hight,
            shift = shadow_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.6,
            draw_as_shadow = true,
            scale = base_scale
        },

        running = {
            filename = path_level1_running,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.6,
            scale = base_scale
        },

        running_mask = {
            filename = path_level1_running_mask,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.6,
            apply_runtime_tint = true,
            scale = base_scale
        },

        running_shadow = {
            filename = path_level1_running_shadow,
            width = base_width,
            height = base_hight,
            shift = shadow_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.6,
            draw_as_shadow = true,
            scale = base_scale
        },

        running_gun = {
            filename = path_level1_running_gun,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 18,
            animation_speed = 0.6,
            scale = base_scale
        },

        running_gun_mask = {
            filename = path_level1_running_gun_mask,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 18,
            animation_speed = 0.6,
            apply_runtime_tint = true,
            scale = base_scale
        },

        running_gun_shadow = {
            stripes = {
                {
                    filename = path_level1_running_gun_shadow_1,
                    width_in_frames = 22,
                    height_in_frames = 18
                }
            },
            width = base_width,
            height = base_hight,
            shift = shadow_shift,
            frame_count = 22,
            direction_count = 18,
            animation_speed = 0.6,
            draw_as_shadow = true,
            scale = base_scale
        },

        running_gun_shadow_flipped = {
            stripes = {
                {
                    filename = path_level1_running_gun_shadow_2,
                    width_in_frames = 22,
                    height_in_frames = 18
                }
            },
            width = base_width,
            height = base_hight,
            shift = shadow_shift,
            frame_count = 22,
            direction_count = 18,
            animation_speed = 0.6,
            draw_as_shadow = true,
            scale = base_scale
        }
    },

    level2addon = {
        dead = {
            filename = path_level1_dead,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 2,
            scale = base_scale
        },

        idle = {
            filename = path_level2_idle,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.15,
            scale = base_scale
        },

        idle_mask = {
            filename = path_level2_idle_mask,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.15,
            apply_runtime_tint = true,
            scale = base_scale
        },

        idle_gun = {
            filename = path_level2_idle_gun,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.15,
            scale = base_scale
        },

        idle_gun_mask = {
            filename = path_level2_idle_gun_mask,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.15,
            apply_runtime_tint = true,
            scale = base_scale
        },

        mining_tool = {
            filename = path_level2_mining_tool,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.9,
            scale = base_scale
        },

        mining_tool_mask = {
            filename = path_level2_mining_tool_mask,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.9,
            apply_runtime_tint = true,
            scale = base_scale
        },

        running = {
            filename = path_level2_running,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.6,
            scale = base_scale
        },

        running_mask = {
            filename = path_level2_running_mask,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.6,
            apply_runtime_tint = true,
            scale = base_scale
        },

        running_gun = {
            filename = path_level2_running_gun,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 18,
            animation_speed = 0.6,
            scale = base_scale
        },

        running_gun_mask = {
            filename = path_level2_running_gun_mask,
            width = base_width,
            height = base_hight,
            shift = icon_shift,
            frame_count = 22,
            direction_count = 18,
            animation_speed = 0.6,
            apply_runtime_tint = true,
            scale = base_scale
        }
    }
}

local idle_sequence =
{
   1, 2, 3, 4, 4, 3, 2, 1, 1, 2,
   3, 4, 4, 3, 2, 1, 1, 2, 3, 4,
   5, 6, 7, 8, 9,10,11,12,13,14,
  15,16,17,18,19,20,21,22
}

local function mech_anim(name, table, light)

  table.scale = table.scale or 0.5
  local mask_table = {}
  local light_table = {}
  local shadow_table = {}

  for k,v in pairs(table) do
    light_table[k] = v
    mask_table[k] = v
    shadow_table[k] = v
  end
  mask_table.apply_runtime_tint = true
  shadow_table.draw_as_shadow = true
  local base_path = ""
  if mods["space-age"] then base_path = "__space-age__/graphics/entity/mech-armor/" end
  local anim = ""
  if mods["space-age"] then anim = 
  {
    layers = {
      util.sprite_load(base_path .. name, table),
      util.sprite_load(base_path .. name .. "-mask", mask_table),
      util.sprite_load(base_path .. name .. "-shadow", shadow_table),
    }
  } end

  light = light or false
  if light then
    light_table.blend_mode = "additive"
    light_table.draw_as_light = true
    anim.layers[4] = ""
	if mods["space-age"] then anim.layers[4] = util.sprite_load(base_path .. name .. "-light", light_table) end
  end

  return anim
end

local idle_anim = mechanicus_animations.level1.idle_gun
if mods["space-age"] then idle_anim = mech_anim("mech-idle",
{
  frame_count = 22,
  animation_speed = 0.16,
  frame_sequence = idle_sequence,
  direction_count = 8,
  usage = "player",
}) end

local run_anim = mechanicus_animations.level1.running_gun
if mods["space-age"] then run_anim = mech_anim("mech-run",
{
  frame_count = 22,
  direction_count = 40,
  animation_speed = 0.37,
  usage = "player",
}) end

local mining_anim = mechanicus_animations.level1.mining_tool
if mods["space-age"] then mining_anim = mech_anim("mech-mining",
{
  frame_count = 27,
  animation_speed = 0.45,
  direction_count = 8,
  usage = "player",
}) end

local take_off = mechanicus_animations.level1.idle
if mods["space-age"] then take_off = mech_anim("mech-uplift",
{
  frame_count = 16,
  animation_speed = 0.6,
  direction_count = 8,
  usage = "player",
}, true) end

local landing = mechanicus_animations.level1.idle
if mods["space-age"] then landing = mech_anim("mech-descend",
{
  frame_count = 16,
  animation_speed = 0.6,
  direction_count = 8,
  usage = "player",
}, true) end

local idle_air = mechanicus_animations.level1.idle_gun
if mods["space-age"] then idle_air = mech_anim("mech-idle-air",
{
  frame_count = 5,
  animation_speed = 0.2,
  --frame_sequence = idle_air_sequence,
  direction_count = 8,
  usage = "player",
}, true) end

local corpse = mechanicus_animations.level1.dead
if mods["space-age"] then corpse = mech_anim("mech-corpse",
{
  frame_count = 2,
  animation_speed = 1,
  usage = "player",
}, false) end

local smoke = nil
if mods["space-age"] then smoke = 
  {
    {
      name = "mech-armor-smoke",
      deviation = {0.2, 0.2},
      frequency = 5,
      position = {0.25, 1.0},
      has_8_directions = true,
      north_position = {0, 1.0 + 0.15},
      north_east_position = {-0.5303, 0.8838},
      east_position = {-0.9, 0.75},
      south_east_position = {-0.8838 + 0.5, -0.5303 + 0.5},
      south_position = {0, 1.0 - 0.5},
      south_west_position = {0.5303, -0.8838 + 0.5},
      west_position = {1, 0.75},
      north_west_position = {0.8838 - 0.5, 0.5303 + 0.5},
      starting_frame = 0,
      starting_frame_deviation = 60,
      starting_vertical_speed = -0.1,
      starting_vertical_speed_deviation = 0.04,
      height = 1
    }
  } end

return {
    {
        dead = {
			layers = {
                mechanicus_animations.level1.dead
			}
		},
		idle = {
            layers = {
                mechanicus_animations.level1.idle,
                mechanicus_animations.level1.idle_mask,
                mechanicus_animations.level1.idle_shadow
            }
        },
        idle_with_gun = {
            layers = {
                mechanicus_animations.level1.idle_gun,
                mechanicus_animations.level1.idle_gun_mask,
                mechanicus_animations.level1.idle_gun_shadow
            }
        },
        mining_with_hands = {
            layers = {
                mechanicus_animations.level1.mining_tool,
                mechanicus_animations.level1.mining_tool_mask,
                mechanicus_animations.level1.mining_tool_shadow
            }
        },
        mining_with_tool = {
            layers = {
                mechanicus_animations.level1.mining_tool,
                mechanicus_animations.level1.mining_tool_mask,
                mechanicus_animations.level1.mining_tool_shadow
            }
        },
        running_with_gun = {
            layers = {
                mechanicus_animations.level1.running_gun,
                mechanicus_animations.level1.running_gun_mask,
                mechanicus_animations.level1.running_gun_shadow
            }
        },
        flipped_shadow_running_with_gun = {
            layers = {mechanicus_animations.level1.running_gun_shadow_flipped}
        },
        running = {
            layers = {
                mechanicus_animations.level1.running,
                mechanicus_animations.level1.running_mask,
                mechanicus_animations.level1.running_shadow
            }
        }
    },
	{
        armors = {"heavy-armor", "modular-armor", "power-armor", "power-armor-mk2"},
        dead = {
			layers = {
                mechanicus_animations.level2addon.dead
			}
		},
        idle = {
            layers = {
                mechanicus_animations.level2addon.idle,
                mechanicus_animations.level2addon.idle_mask,
                mechanicus_animations.level1.idle_shadow
            }
        },
        idle_with_gun = {
            layers = {
                mechanicus_animations.level2addon.idle_gun,
                mechanicus_animations.level2addon.idle_gun_mask,
                mechanicus_animations.level1.idle_gun_shadow
            }
        },
        mining_with_hands = {
            layers = {
                mechanicus_animations.level2addon.mining_tool,
                mechanicus_animations.level2addon.mining_tool_mask,
                mechanicus_animations.level1.mining_tool_shadow
            }
        },
        mining_with_tool = {
            layers = {
                mechanicus_animations.level2addon.mining_tool,
                mechanicus_animations.level2addon.mining_tool_mask,
                mechanicus_animations.level1.mining_tool_shadow
            }
        },
        running_with_gun = {
            layers = {
                mechanicus_animations.level2addon.running_gun,
                mechanicus_animations.level2addon.running_gun_mask,
                mechanicus_animations.level1.running_gun_shadow
            }
        },
        flipped_shadow_running_with_gun = {
            layers = {mechanicus_animations.level1.running_gun_shadow_flipped}
        },
        running = {
            layers = {
                mechanicus_animations.level2addon.running,
                mechanicus_animations.level2addon.running_mask,
                mechanicus_animations.level1.running_shadow
            }
        }
    },
	{
        armors = mods["space-age"] and {"mech-armor"},
		dead = corpse,
		idle_with_gun = idle_anim,
		mining_with_tool = mining_anim,
		running_with_gun = run_anim,
		idle_with_gun_in_air = idle_air,
		take_off = take_off,
		landing = landing,
		smoke_cycles_per_tick = 0.25,
		extra_smoke_cycles_per_tile = 1.5,
		smoke_in_air = smoke
    }
}
