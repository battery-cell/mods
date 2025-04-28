if not mods["elevated-rails"] then return end -- Could be changed to feature flag check if we ensure we aren't using any elevated-rails graphics

local meld = require("__core__.lualib.meld")

local drive_over_elevated_tie =
{
  type = "play-sound",
  sound = sound_variations("__elevated-rails__/sound/elevated-train-tie", 6, 0.8,
    {volume_multiplier("main-menu", 2.4), volume_multiplier("driving", 0.65)})
}


local updates = {}

updates.wheels =
{
  sloped = util.sprite_load("__Mini_Trains__/data/locomotive-sloped/hr-wheelramp",
    {
      priority = "very-low",
      direction_count = 160,
      scale = 0.5,
      shift = util.by_pixel(0, 8),
      usage = "train"
    }
  ),
  slope_angle_between_frames = 1.25
}

updates.wheelscab =
{
  sloped = util.sprite_load("__Mini_Trains__/data/locomotive-sloped/hr-cabwheelramp",
    {
      priority = "very-low",
      direction_count = 160,
      scale = 0.5,
      shift = util.by_pixel(0, 8),
      usage = "train"
    }
  ),
  slope_angle_between_frames = 1.25
}

updates.locomotive =
{
  wheels = updates.wheelscab,
  pictures =
  {
    slope_angle_between_frames = 1.25,
    sloped =
    {
      layers =
      {
        util.sprite_load("__Mini_Trains__/data/locomotive-sloped/hr-cabramp",
          {
            dice = 4,
            priority = "very-low",
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        ),
        util.sprite_load("__Mini_Trains__/data/locomotive-sloped/hr-cabrampmsk",
          {
            dice = 4,
            priority = "very-low",
            flags = {"mask"},
            apply_runtime_tint = true,
            --tint_as_overlay = true,
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        ),
        util.sprite_load("__Mini_Trains__/data/locomotive-sloped/hr-cabrampglow",
          {
            dice = 4,
            priority = "very-low",
            draw_as_glow = true,
            blend_mode = "additive",
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        ),
        util.sprite_load("__Mini_Trains__/data/locomotive-sloped/hr-cabrampsh",
          {
            dice = 4,
            priority = "very-low",
            flags = {"shadow"},
            draw_as_shadow = true,
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        )
      }
    }
  },
  front_light_pictures =
  {
    slope_angle_between_frames = 1.25,
    sloped =
    {
      layers =
      {
        util.sprite_load("__Mini_Trains__/data/locomotive-sloped/hr-cabramplamp",
          {
            dice = 4,
            priority = "very-low",
            blend_mode = "additive",
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        ),
        util.sprite_load("__Mini_Trains__/data/locomotive-sloped/hr-cabramplight",
          {
            dice = 4,
            priority = "very-low",
            blend_mode = "additive",
            draw_as_light = true,
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        ),
      }
    }
  },
  elevated_rail_sound =
  {
    sound =
    {
      filename = "__elevated-rails__/sound/elevated-train-driving.ogg",
      volume = 1.0,
      modifiers = {volume_multiplier("elevation", 1.0)}
    },
    match_volume_to_activity = true,
    activity_to_volume_modifiers =
    {
      multiplier = 1.5,
      offset = 1.0,
    },
    match_speed_to_activity = true,
    activity_to_speed_modifiers =
    {
      multiplier = 0.6,
      minimum = 1.0,
      maximum = 1.15,
      offset = 0.2,
    }
  },
  drive_over_elevated_tie_trigger = drive_over_elevated_tie
}

updates.fluid_wagon =
{
  wheels = updates.wheels,
  pictures =
  {
    slope_angle_between_frames = 1.25,
    sloped =
    {
      layers =
      {
        util.sprite_load("__Mini_Trains__/data/fluid-wagon-sloped/hr-Flwagramp",
          {
            dice = 4,
            priority = "very-low",
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        ),
        util.sprite_load("__Mini_Trains__/data/fluid-wagon-sloped/hr-Flwagrampsh",
          {
            dice = 4,
            priority = "very-low",
            draw_as_shadow = true,
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        )
      }
    }
  },
}

updates.cargo_wagon =
{
  wheels = updates.wheels,
  pictures =
  {
    slope_angle_between_frames = 1.25,
    sloped =
    {
      layers =
      {
        util.sprite_load("__Mini_Trains__/data/cargo-wagon-sloped/hr-cargoramp",
          {
            dice = 4,
            priority = "very-low",
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        ),
        util.sprite_load("__Mini_Trains__/data/cargo-wagon-sloped/hr-cargorampsh",
          {
            dice = 4,
            priority = "very-low",
            draw_as_shadow = true,
            direction_count = 160,
            scale = 0.5,
            usage = "train"
          }
        )
      }
    }
  },
}


meld(data.raw["locomotive"]["mini-locomotive"], updates.locomotive)
meld(data.raw["fluid-wagon"]["mini-fluid-wagon"], updates.fluid_wagon)
meld(data.raw["cargo-wagon"]["mini-cargo-wagon"], updates.cargo_wagon)
