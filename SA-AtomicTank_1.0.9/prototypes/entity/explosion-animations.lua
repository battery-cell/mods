local path = ('__SA-AtomicTank__')
local miniexplosion_animations = {}

miniexplosion_animations.mininuke_explosion = function()
    return
    {
      width = 628,
      height = 720,
      frame_count = 100,
      draw_as_glow = true,
      priority = "very-low",
      flags = {"linear-magnification"},
      shift = util.by_pixel(0.5, -122.5), --shift = util.by_pixel(0.5, -62.5), shifted by 60 due to scaling and centering
      animation_speed = 0.5 * 0.75,
      dice_y = 5,
      scale = 0.5,
      stripes =
      {
        {
          filename = "__base__/graphics/entity/nuke-explosion/nuke-explosion-1.png",
          width_in_frames = 5,
          height_in_frames = 5
        },
        {
          filename = "__base__/graphics/entity/nuke-explosion/nuke-explosion-2.png",
          width_in_frames = 5,
          height_in_frames = 5
        },
        {
          filename = "__base__/graphics/entity/nuke-explosion/nuke-explosion-3.png",
          width_in_frames = 5,
          height_in_frames = 5
        },
        {
          filename = "__base__/graphics/entity/nuke-explosion/nuke-explosion-4.png",
          width_in_frames = 5,
          height_in_frames = 5
        }
      }
    }
  end

return miniexplosion_animations