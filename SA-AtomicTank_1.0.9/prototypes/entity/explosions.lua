local explosion_animations = require('__base__/prototypes/entity/explosion-animations')
local smoke_animations = require('__base__/prototypes/entity/smoke-animations')
local sounds = require('__base__/prototypes/entity/sounds')
local miniexplosion_animations = require("prototypes.entity.explosion-animations")

data:extend{
  {
    type = 'explosion',
    name = 'mini-atomic-fire-smoke',
    fade_out_duration = 40,
    scale_out_duration = 50,
    scale_in_duration = 10,
    scale_initial = 0.1,
    scale = 0.4,
    scale_deviation = 0.2,
    scale_increment_per_tick = 0.005,
    correct_rotation = true,
    scale_animation_speed = true,
    animations = {
      {
        width = 152,
        height = 120,
        line_length = 5,
        frame_count = 60,
        shift = { -0.53125, -0.4375 },
        priority = 'high',
        animation_speed = 0.50,
        tint = { r = 0.627, g = 0.478, b = 0.345, a = 0.500 },
        filename = '__base__/graphics/entity/smoke/smoke.png',
        flags = { 'smoke' }
      }
    }
  },
  
  {
    type = "explosion",
    name = "mini-atomic-nuke-shockwave",
    icon = "__base__/graphics/icons/destroyer.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    height = 1.4,
    rotate = true,
    correct_rotation = true,
    fade_out_duration = 30,
    scale_out_duration = 40,
    scale_in_duration = 10,
    scale_initial = 0.02,
    scale = 0.02,
    scale_deviation = 0.05,
    scale_end = 0.2,
    scale_increment_per_tick = 0.01,
    scale_animation_speed = true,

    animations = explosion_animations.nuke_shockwave()
  },    
  {
    type = "explosion",
    name = "mini-cluster-nuke-explosion",
    icon = "__base__/graphics/icons/atomic-bomb-light.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    order = "a-d-b",
    animations = smoke_animations.trivial_smoke_animation(
    {
      tint = {r = 0.627, g = 0.478, b = 0.345, a = 0.500},
      scale = 1,
    }),
    scale_increment_per_tick = 0.002,
    fade_out_duration = 30,
    scale_out_duration = 20,
    scale_in_duration = 10,
    scale_initial = 0.1,
    correct_rotation = true,
    scale_animation_speed = true,
  },
  {
    type = 'explosion',
    name = 'mininuke-explosion',
    flags = { 'not-on-map'},
    subgroup = 'explosions',
    height = 0,
    animations = miniexplosion_animations.mininuke_explosion(),
    light = {intensity = 1, size = 50, color = {r=1.0, g=1.0, b=1.0}},
    sound = sounds.large_explosion(1.0),
    
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 60,
            particle_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
          }
        }
      }
    }
  
  },

}
