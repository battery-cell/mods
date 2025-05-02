-- Prevent errors
if not mods["elevated-rails"] then 
	return 
end 

local meld = require("__core__.lualib.meld")
local drive_over_elevated_tie =
{
  type = "play-sound",
  sound = sound_variations("__elevated-rails__/sound/elevated-train-tie", 6, 0.8, {volume_multiplier("main-menu", 2.4), volume_multiplier("driving", 0.65)})
}
local updates = {}

updates.wheels =
{
	sloped = util.sprite_load("__elevated-rails__/graphics/entity/train-wheel/train-wheel-sloped",
	{
		priority = "very-low",
		direction_count = 160,
		scale = 0.5,
		shift = util.by_pixel(0, 8),
		usage = "train"
	}),
	slope_angle_between_frames = 1.25
}

updates.armored_locomotive_mk1 =
{
	wheels = updates.wheels,
	pictures =
	{
		slope_angle_between_frames = 1.25,
		sloped =
		{
			layers =
			{
				util.sprite_load("__Armored-train__/assets/graphics/armored-locomotive-mk1/armored-locomotive-mk1-sloped",
				{
					dice = 4,
					priority = "very-low",
					direction_count = 160,
					scale = 0.6,
					usage = "train"
				}),
				-- Somehow it is different from turret masks (use transparency 192)
				-- Some how it is different 20250219 again lol and everything is broken (looks liek dev patched this)
				util.sprite_load("__Armored-train__/assets/graphics/armored-locomotive-mk1/armored-locomotive-mk1-sloped-mask",
				{
					dice = 4,
					priority = "very-low",
					flags = { "mask" },
					apply_runtime_tint = true,
					--tint_as_overlay = true,
					direction_count = 160,
					scale = 0.6,
					usage = "train"
				})
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

updates.combat_platform_mk1 =
{
	wheels = updates.wheels,
	pictures =
	{
		slope_angle_between_frames = 1.25,
		slope_back_equals_front = true,
		sloped =
		{
			layers =
			{
				util.sprite_load("__Armored-train__/assets/graphics/combat-platform-mk1/combat-platform-mk1-sloped",
				{
					dice = 4,
					priority = "very-low",
					back_equals_front = true,
					direction_count = 80,
					scale = 0.5,
					usage = "train"
				})
			}
		}
	}
}

updates.combat_platform_mk2 =
{
	wheels = updates.wheels,
	pictures =
	{
		slope_angle_between_frames = 1.25,
		slope_back_equals_front = true,
		sloped =
		{
			layers =
			{
				util.sprite_load("__Armored-train__/assets/graphics/combat-platform-mk2/combat-platform-mk2-sloped",
				{
					dice = 4,
					priority = "very-low",
					back_equals_front = true,
					direction_count = 80,
					scale = 0.5,
					usage = "train"
				})
			}
		}
	}
}

updates.support_platform_mk1 =
{
	wheels = updates.wheels,
	pictures =
	{
		slope_angle_between_frames = 1.25,
		slope_back_equals_front = true,
		sloped =
		{
			layers =
			{
				util.sprite_load("__Armored-train__/assets/graphics/support-platform-mk1/support-platform-mk1-sloped",
				{
					dice = 4,
					priority = "very-low",
					back_equals_front = true,
					direction_count = 80,
					scale = 0.5,
					usage = "train"
				}
				)
			}
		}
	}
}

-- Append data
meld(data.raw["locomotive"]["armored-locomotive-mk1"], updates.armored_locomotive_mk1)

meld(data.raw["cargo-wagon"]["combat-platform-mk1"], updates.combat_platform_mk1)
meld(data.raw["cargo-wagon"]["combat-platform-mk2"], updates.combat_platform_mk2)
--meld(data.raw["cargo-wagon"]["support-platform-mk1"], updates.support_platform_mk1)
