local items = require("tables").items
local setting = settings.startup["kj_laser_friendlyFire"].value
local modname = "kj_laser"

data:extend({
	{
		type = "explosion",
		name = "kj_laser_line",
		flags = {"not-on-map"},
		hidden = true,
		subgroup = "explosions",
		rotate = true,
		beam = true,
		drawing_box_vertical_extension = 10,
		animations =
		{
			{
				filename = "__"..modname.."__/graphics/beam.png",
				priority = "extra-high",
				draw_as_glow = true,
				blend_mode = "additive",
				width = 96,
				height = 288,
				frame_count = 8,
			}
		},
		light = {intensity = 2, size = 10},
	},
	{
		type = "ammo",
		name = "kj_laser_normal",
        icon = "__"..modname.."__/graphics/lense.png",
		ammo_category = "kj_laser",
		ammo_type =
		{
            energy_consumption = "3000kJ",
			action =
			{
                type = "line",
                range = 60,
                width = 3,
                range_effects =
                {
                    type = "create-explosion",
                    entity_name = "kj_laser_line"
                },
                action_delivery =
                {
                    type = "instant",
                    target_effects =
                    {
                        {
                            type = "damage",
                            damage = {amount = 1000, type = "laser"},
                        },
                        {
                            type = "create-sticker",
                            sticker = "fire-sticker",
                            show_in_tooltip = false
                        },
                        {
                            type = "create-fire",
                            entity_name = "fire-flame",
                            initial_ground_flame_count = 1,
                            show_in_tooltip = false,
                        },
                    }
                }
			}
		},
		order = items[modname].order.."-n[normal]",
	},
})

if setting == false then
    data.raw["ammo"]["kj_laser_normal"].ammo_type.action.force = "not-same"
end