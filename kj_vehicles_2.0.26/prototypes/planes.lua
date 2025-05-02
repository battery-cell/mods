local tables = require("tables")
local item_sounds = require("__base__.prototypes.item_sounds")
local bool = false

for name, _ in pairs(tables.airborneMods) do
	if mods[name] then
		bool = true
	end
end
if bool == false then
	goto ende
end

local function fire_stream(data)
    return {
        type = "stream",
        name = data.name,
        flags = {"not-on-map"},
        stream_light = {intensity = 1, size = 6},
        ground_light = {intensity = 0.8, size = 6},
        particle_buffer_size = 90,
        particle_spawn_interval = data.particle_spawn_interval,
        particle_spawn_timeout = data.particle_spawn_timeout,
        particle_vertical_acceleration = 0.005 * 0.60 * 1.5, -- x
        particle_horizontal_speed = 0.2 * 0.75 * 1.5 * 1.5, -- x
        particle_horizontal_speed_deviation = 0.005 * 0.70,
        particle_start_alpha = 0.5,
        particle_end_alpha = 1,
        particle_alpha_per_part = 0.8,
        particle_scale_per_part = 0.8,
        particle_loop_frame_count = 15,
        particle_fade_out_duration = 2,
        particle_loop_exit_threshold = 0.25,
        special_neutral_target_damage = {amount = 1, type = "acid"},
        initial_action = {
            {
                type = "direct",
                action_delivery = {
                    type = "instant",
                    target_effects = {
                        {
                            type = "play-sound",
                            sound = {
                                {
                                    filename = "__base__/sound/creatures/projectile-acid-burn-1.ogg",
                                    volume = 0.8
                                },
                                {
                                    filename = "__base__/sound/creatures/projectile-acid-burn-2.ogg",
                                    volume = 0.8
                                },
                                {
                                    filename = "__base__/sound/creatures/projectile-acid-burn-long-1.ogg",
                                    volume = 0.8
                                },
                                {
                                    filename = "__base__/sound/creatures/projectile-acid-burn-long-2.ogg",
                                    volume = 0.8
                                }
                            }
                        },
                        {
                            type = "create-fire",
                            entity_name = data.splash_fire_name
                        },
                        {
                            type = "create-fire",
                            entity_name = "kj_napalm_flame",
                            initial_ground_flame_count = 30
                        }

                    }
                }
            },
            {
                type = "area",
                radius = data.spit_radius,
                force = "enemy",
                ignore_collision_condition = true,
                action_delivery = {
                    type = "instant",
                    target_effects = {
                        {type = "create-sticker", sticker = data.sticker_name},
                        {type = "damage", damage = {amount = 30, type = "fire"}}
                    }
                }
            }
        },
        particle = {
                filename = "__base__/graphics/entity/acid-projectile/acid-projectile-head.png",
                line_length = 5,
                width = 42,
                height = 164,
                frame_count = 15,
                shift = util.mul_shift(util.by_pixel(-2, 31), data.scale),
                tint = data.tint,
                priority = "high",
                scale = 0.5 * data.scale,
                animation_speed = 1
        },
        spine_animation = {
                filename = "__base__/graphics/entity/acid-projectile/acid-projectile-tail.png",
                line_length = 5,
                width = 132,
                height = 20,
                frame_count = 15,
                shift = util.mul_shift(util.by_pixel(0, -1), data.scale),
                tint = data.tint,
                priority = "high",
                scale = 0.5 * data.scale,
                animation_speed = 1
        },
        shadow = {
                filename = "__base__/graphics/entity/acid-projectile/acid-projectile-shadow.png",
                line_length = 15,
                width = 42,
                height = 164,
                frame_count = 15,
                shift = util.mul_shift(util.by_pixel(-2, 31), data.scale),
                draw_as_shadow = true,
                priority = "high",
                scale = 0.5 * data.scale,
                animation_speed = 1
        },

        oriented_particle = true,
        shadow_scale_enabled = true
    }
end

local function fire_stream_cluster(data)
    return {
        type = "stream",
        name = data.name,
        flags = {"not-on-map"},
        stream_light = {intensity = 1, size = 4},
        ground_light = {intensity = 0.8, size = 4},
        particle_buffer_size = 90,
        particle_spawn_interval = data.particle_spawn_interval,
        particle_spawn_timeout = data.particle_spawn_timeout,
        particle_vertical_acceleration = 0.005 * 0.60 * 1.5, -- x
        particle_horizontal_speed = 0.2 * 0.75 * 1.5 * 1.5, -- x
        particle_horizontal_speed_deviation = 0.005 * 0.70,
        particle_start_alpha = 0.5,
        particle_end_alpha = 1,
        particle_alpha_per_part = 0.8,
        particle_scale_per_part = 0.8,
        particle_loop_frame_count = 15,
        particle_fade_out_duration = 2,
        particle_loop_exit_threshold = 0.25,
        special_neutral_target_damage = {amount = 1, type = "acid"},
        initial_action = {
            {
                type = "direct",
                action_delivery = {
                    type = "instant",
                    target_effects = {
                        {
                            type = "play-sound",
                            sound = {
                                {
                                    filename = "__base__/sound/creatures/projectile-acid-burn-1.ogg",
                                    volume = 0.8
                                },
                                {
                                    filename = "__base__/sound/creatures/projectile-acid-burn-2.ogg",
                                    volume = 0.8
                                },
                                {
                                    filename = "__base__/sound/creatures/projectile-acid-burn-long-1.ogg",
                                    volume = 0.8
                                },
                                {
                                    filename = "__base__/sound/creatures/projectile-acid-burn-long-2.ogg",
                                    volume = 0.8
                                }
                            }
                        },
                        {
                            type = "create-fire",
                            entity_name = data.splash_fire_name
                        },
                        {
                            type = "create-fire",
                            entity_name = "kj_napalm_flame",
                            initial_ground_flame_count = 30
                        },
                        {
                            type = "nested-result",
                            action = {
                                type = "cluster",
                                cluster_count = 4,
                                distance = 5,
                                distance_deviation = 20,
                                action_delivery = {
                                    type = "stream",
                                    stream = "na-fire-stream",
                                    starting_speed = 0.1,
                                    max_range = 20
                                }
                            }
                        }
                    }
                }
            },
            {
                type = "area",
                radius = data.spit_radius,
                force = "enemy",
                ignore_collision_condition = true,
                action_delivery = {
                    type = "instant",
                    target_effects = {
                        {type = "create-sticker", sticker = data.sticker_name},
                        {type = "damage", damage = {amount = 30, type = "fire"}}
                    }
                }
            }
        },
        particle = {
                filename = "__base__/graphics/entity/acid-projectile/acid-projectile-head.png",
                line_length = 5,
                width = 42,
                height = 164,
                frame_count = 15,
                shift = util.mul_shift(util.by_pixel(-2, 31), data.scale),
                tint = data.tint,
                priority = "high",
                scale = 0.5 * data.scale,
                animation_speed = 1
        },
        spine_animation = {
                filename = "__base__/graphics/entity/acid-projectile/acid-projectile-tail.png",
                line_length = 5,
                width = 132,
                height = 20,
                frame_count = 15,
                shift = util.mul_shift(util.by_pixel(0, -1), data.scale),
                tint = data.tint,
                priority = "high",
                scale = 0.5 * data.scale,
                animation_speed = 1
        },
        shadow = {
                filename = "__base__/graphics/entity/acid-projectile/acid-projectile-shadow.png",
                line_length = 15,
                width = 42,
                height = 164,
                frame_count = 15,
                shift = util.mul_shift(util.by_pixel(-2, 31), data.scale),
                draw_as_shadow = true,
                priority = "high",
                scale = 0.5 * data.scale,
                animation_speed = 1
        },

        oriented_particle = true,
        shadow_scale_enabled = true
    }
end

local function shadowSpriteCollector(name, direction_count)
	local sprites = {}
	for i = 1, direction_count do
		table.insert(sprites, name.."_shadow-"..i)
	end

	--log(serpent.block(sprites))
	return sprites
end


local fire_tint = {r = 1.0, g = 0.3, b = 0.1, a = 1.000}
local ammoData = {
	{--50 kg bomb
		name = "kj_plane_50",
		ingredients = {
			{type = "item", name = "explosives",  amount = 5},
			{type = "item", name = "plastic-bar", amount = 5},
			{type = "item", name = "steel-plate", amount = 3},
		},
		time = 8,
		size = 50,
		weight = tables.ammoData.planes.AWeight,
		min = 3,
		max = 10,
		order = "4[aviation]-b-0-1",
		stackSize = 66,
		final_action =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "create-entity",
						entity_name = "big-explosion"
					},
					{
						type = "nested-result",
						action =
						{
							type = "area",
							radius = tables.ammoData.planes.AR,
							action_delivery =
							{
								type = "instant",
								target_effects =
								{
									{
										type = "damage",
										damage = {amount = tables.ammoData.planes.ADE, type = "explosion"}
									},
									{
										type = "damage",
										damage = {amount = tables.ammoData.planes.ADP , type = "physical"}
									},
									{
										type = "create-entity",
										entity_name = "medium-explosion"
									}
								}
							}
						}
					},
					{
						type = "create-entity",
						entity_name = "small-scorchmark-tintable",
						check_buildability = true
					},
					{
						type = "invoke-tile-trigger",
						repeat_count = 1,
					},
					{
						type = "destroy-decoratives",
						from_render_layer = "decorative",
						to_render_layer = "object",
						include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
						include_decals = false,
						invoke_decorative_trigger = true,
						decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
						radius = tables.ammoData.planes.AR -- large radius for demostrative purposes
					}
				}
			}
		},
	},
	{--250 kg bomb
		name = "kj_plane_250",
		ingredients = {
			{type = "item", name = "explosives",  amount = 16},
			{type = "item", name = "plastic-bar", amount = 16},
			{type = "item", name = "steel-plate", amount = 8},
		},
		time = 25,
		size = 250,
		weight = tables.ammoData.planes.BWeight,
		min = 3,
		max = 12,
		order = "4[aviation]-b-0-2",
		stackSize = 18,
		final_action =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "create-entity",
						entity_name = "massive-explosion"
					},
					{
						type = "nested-result",
						action =
						{
							type = "area",
							radius = tables.ammoData.planes.BR,
							action_delivery =
							{
								type = "instant",
								target_effects =
								{
									{
										type = "damage",
										damage = {amount = tables.ammoData.planes.BDE, type = "explosion"}
									},
									{
										type = "damage",
										damage = {amount = tables.ammoData.planes.BDP , type = "physical"}
									},
									{
										type = "create-entity",
										entity_name = "big-explosion"
									}
								}
							}
						}
					},
					{
						type = "create-entity",
						entity_name = "medium-scorchmark-tintable",
						check_buildability = true
					},
					{
						type = "invoke-tile-trigger",
						repeat_count = 1,
					},
					{
						type = "destroy-decoratives",
						from_render_layer = "decorative",
						to_render_layer = "object",
						include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
						include_decals = false,
						invoke_decorative_trigger = true,
						decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
						radius = tables.ammoData.planes.BR -- large radius for demostrative purposes
					}
				}
			}
		},
	},
	{--500 kg bomb
		name = "kj_plane_500",
		ingredients = {
			{type = "item", name = "explosives",  amount = 24},
			{type = "item", name = "plastic-bar", amount = 24},
			{type = "item", name = "steel-plate", amount = 12},
		},
		time = 38,
		size = 500,
		weight = tables.ammoData.planes.CWeight,
		min = 3,
		max = 15,
		order = "4[aviation]-b-0-3",
		stackSize = 12,
		final_action =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "create-entity",
						entity_name = "big-artillery-explosion"
					},
					{
						type = "destroy-cliffs",
						radius = tables.ammoData.planes.CR/2,
						explosion = "explosion"
					},
					{
						type = "nested-result",
						action =
						{
							type = "area",
							radius = tables.ammoData.planes.CR,
							action_delivery =
							{
								type = "instant",
								target_effects =
								{
									{
										type = "damage",
										damage = {amount = tables.ammoData.planes.CDE, type = "explosion"}
									},
									{
										type = "damage",
										damage = {amount = tables.ammoData.planes.CDP , type = "physical"}
									},
									{
										type = "create-entity",
										entity_name = "massive-explosion"
									}
								}
							}
						}
					},
					{
						type = "create-entity",
						entity_name = "big-scorchmark-tintable",
						check_buildability = true
					},
					{
						type = "invoke-tile-trigger",
						repeat_count = 1,
					},
					{
						type = "destroy-decoratives",
						from_render_layer = "decorative",
						to_render_layer = "object",
						include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
						include_decals = false,
						invoke_decorative_trigger = true,
						decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
						radius = tables.ammoData.planes.CR -- large radius for demostrative purposes
					}
				}
			}
		},
	},
	{--1000 kg bomb
		name = "kj_plane_1000",
		ingredients = {
			{type = "item", name = "explosives",  amount = 38},
			{type = "item", name = "plastic-bar", amount = 38},
			{type = "item", name = "steel-plate", amount = 18},
		},
		time = 60,
		size = 1000,
		weight = tables.ammoData.planes.DWeight,
		min = 3,
		max = 20,
		order = "4[aviation]-b-0-4",
		stackSize = 8,
		final_action =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "create-entity",
						entity_name = "nuke-explosion"
					},
					{
						type = "destroy-cliffs",
						radius = tables.ammoData.planes.DR/2,
						explosion = "explosion"
					},
					{
						type = "nested-result",
						action =
						{
							type = "area",
							radius = tables.ammoData.planes.DR,
							action_delivery =
							{
								type = "instant",
								target_effects =
								{
									{
										type = "damage",
										damage = {amount = tables.ammoData.planes.DDE, type = "explosion"}
									},
									{
										type = "damage",
										damage = {amount = tables.ammoData.planes.DDP , type = "physical"}
									},
									{
										type = "create-entity",
										entity_name = "big-artillery-explosion"
									}
								}
							}
						}
					},
					{
						type = "create-entity",
						entity_name = "kj_huge_scorchmark_tintable",
						check_buildability = true
					},
					{
						type = "invoke-tile-trigger",
						repeat_count = 1,
					},
					{
						type = "destroy-decoratives",
						from_render_layer = "decorative",
						to_render_layer = "object",
						include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
						include_decals = false,
						invoke_decorative_trigger = true,
						decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
						radius = tables.ammoData.planes.DR -- large radius for demostrative purposes
					}
				}
			}
		},
	},
	{--atom kg bomb
		name = "kj_plane_atom",
		ingredients = data.raw["recipe"]["atomic-bomb"].ingredients,
		time = 68,
		size = "atom",
		weight = tables.ammoData.planes.DWeight,
		min = 3,
		max = 20,
		order = "4[aviation]-b-0-6",
		stackSize = 8,
		final_action = data.raw["projectile"]["atomic-rocket"].action,
	},
	{--low cal mg
		name = "kj_plane_lcal",
		suffix = "lcal",
		ingredients = {
			{type = "item", name = "piercing-rounds-magazine",  amount = 1},
		},
		time = 3,
		weight = tables.ammoData.planes.EWeight,
		order = "4[aviation]-a-1",
		magazine_size = 10,
		target_effects = {
			{
				type = "create-entity",
				entity_name = "explosion-hit",
				offsets = {{0, 1}},
				offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
			},
			{
				type = "damage",
				damage = { amount = tables.ammoData.planes.EP, type = "physical"}
			},
			{
				type = "damage",
				damage = { amount = tables.ammoData.planes.EF, type = "flak"}
			}
		},
	},
	{--high cal mg
		name = "kj_plane_hcal",
		suffix = "hcal",
		ingredients = {
			{type = "item", name = "kj_plane_lcal",  amount = 1},
			{type = "item", name = "explosives",  amount = 1},
			{type = "item", name = "steel-plate", amount = 1},
		},
		time = 9,
		weight = tables.ammoData.planes.FWeight,
		order = "4[aviation]-a-2",
		magazine_size = 5,
		target_effects = {
			{
				type = "create-entity",
				entity_name = "explosion-hit",
				offsets = {{0, 1}},
				offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
			},
			{
				type = "damage",
				damage = { amount = tables.ammoData.planes.FP, type = "physical"}
			},
			{
				type = "damage",
				damage = { amount = tables.ammoData.planes.FF, type = "flak"}
			}
		},
	},
	{--napalm bomb
		name = "kj_plane_napalm",
		ingredients = {
			{type = "item", name = "explosives",  amount = 10},
			{type = "item", name = "heavy-oil-barrel", amount = 40},
			{type = "item", name = "plastic-bar", amount = 10},
			{type = "item", name = "steel-plate", amount = 20},
		},
		time = 120,
		size = "napalm",
		weight = tables.ammoData.planes.GWeight,
		min = 3,
		max = 20,
		order = "4[aviation]-b-0-5",
		stackSize = 8,
		final_action =
		{
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    {
                        type = "create-entity",
                        entity_name = "big-artillery-explosion"
                    },
					{
						type = "nested-result",
						action =
						{
							type = "area",
							radius = 5,
							action_delivery =
							{
								type = "instant",
								target_effects =
								{
									{
										type = "damage",
										damage = {amount = tables.ammoData.planes.GP, type = "physical"}
									},
									{
										type = "damage",
										damage = {amount = tables.ammoData.planes.GE , type = "explosion"}
									},
									{
										type = "damage",
										damage = {amount = tables.ammoData.planes.GF , type = "fire"}
									},
									{
										type = "create-entity",
										entity_name = "big-explosion"
									}
								}
							}
						}
					},
                    {
                        type = "nested-result",
                        action = {
                            type = "cluster",
                            cluster_count = 10,
                            distance = 2,
                            distance_deviation = 35,
                            action_delivery = {
                                type = "stream",
                                stream = "kj_napalm_cluster_fire_projectile",
                                starting_speed = 0.1,
                                max_range = 35 / 2
                            }
                        }
                    },
                    {
                        type = "create-entity",
                        entity_name = "big-scorchmark-tintable",
                        check_buildability = true
                    },
                    {
                        type = "invoke-tile-trigger",
                        repeat_count = 1
					},
                    {
                        type = "destroy-decoratives",
                        from_render_layer = "decorative",
                        to_render_layer = "object",
                        include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
                        include_decals = false,
                        invoke_decorative_trigger = true,
                        decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
                        radius = 3.5
                    },
                }
            }
		},
	},
}

local function bigBoom()
	local boom = table.deepcopy(data.raw["corpse"]["huge-scorchmark-tintable"])
	boom.name = "kj_huge_scorchmark_tintable"
	for _, layer in pairs(boom.ground_patch.layers) do
		if layer.scale ~= nil then
			layer.scale = layer.scale * 1.5
		end
	end
	for _, layer in pairs(boom.ground_patch_higher.layers) do
		if layer.scale ~= nil then
			layer.scale = layer.scale * 1.5
		end
	end
	data:extend({boom})
end

local function napalm()
	local math3d = require "math3d"

	local napalmFire = table.deepcopy(data.raw["fire"]["fire-flame"])
	napalmFire.name = "kj_napalm_flame"
	napalmFire.initial_lifetime = 1000
	napalmFire.damage_per_tick = {amount = 200 / 60, type = "fire"}
	napalmFire.on_fuel_added_action = nil
	napalmFire.damage_multiplier_decrease_per_tick = 0.0005
	napalmFire.maximum_damage_multiplier = 1
	napalmFire.fade_out_duration = 100
	napalmFire.lifetime_increase_by = 0

	data:extend({
		napalmFire,
		{
			type = "sticker",
			name = "kj_napalm_sticker",
			flags = {"not-on-map"},
			animation = {
				filename = "__base__/graphics/entity/fire-flame/fire-flame-01.png",
				line_length = 10,
				width = 840/10,
				height = 1170/9,
				frame_count = 90,
				axially_symmetrical = false,
				direction_count = 1,
				blend_mode = "normal",
				animation_speed = 1,
				scale = 0.2,
				tint = {r = 0.5, g = 0.5, b = 0.5, a = 0.18}, -- { r = 1, g = 1, b = 1, a = 0.35 },
				shift = math3d.vector2.mul({-0.078125, -1.8125}, 0.1)
			},

			duration_in_ticks = 60 * 60,
			target_movement_modifier = 0.7,
			damage_per_tick = {amount = 100 / 60, type = "fire"},
			spread_fire_entity = "fire-flame-on-tree",
			fire_spread_cooldown = 40,
			fire_spread_radius = 0.1
		},
		acid_splash_fire({
			name = "kj_napalm_fire_splash",
			scale = (3.5 - 1),
			tint = fire_tint,
			ground_patch_scale = (3.5 - 1) * ground_patch_scale_modifier,
			patch_tint_multiplier = patch_opacity,
			splash_damage_per_tick = 1,
			sticker_name = "kj_napalm_sticker"
		}),
		fire_stream({
			name = "na-fire-stream",
			scale = 3.5 - 1,
			tint = fire_tint,
			--corpse_name = "na-fire-splash-corpse",
			spit_radius = stream_radius_worm_behemoth, -- 2
			particle_spawn_interval = 1,
			particle_spawn_timeout = 6,
			splash_fire_name = "kj_napalm_fire_splash",
			sticker_name = "kj_napalm_sticker"
		}),
		fire_stream_cluster({
			name = "kj_napalm_cluster_fire_projectile",
			scale = 3.5,
			tint = fire_tint,
			---corpse_name = "na-fire-splash-corpse",
			spit_radius = stream_radius_worm_behemoth, -- 2
			particle_spawn_interval = 1,
			particle_spawn_timeout = 6,
			splash_fire_name = "kj_napalm_fire_splash",
			sticker_name = "kj_napalm_sticker"
		})
	})
end

local function ammoMG(order)
	data:extend({
		{
			type = "ammo-category",
			name = ammoData[order].name,
			icon = "__kj_vehicles__/graphics/category_"..ammoData[order].suffix..".png",
			icon_size = 64,
			order = "kj-u-a[bullet]-"..order-5,
			subgroup = "ammo-category",
		},
		{
			type = "recipe",
			name = ammoData[order].name,
			enabled = false,
			energy_required = ammoData[order].time,
			ingredients = ammoData[order].ingredients,
			localised_name = {"", {"recipe-name."..ammoData[order].name}},
			localised_description = {"", {"recipe-description."..ammoData[order].name}},
			results = {{type = "item", name = ammoData[order].name, amount = 1}},
		},
		{
			type = "ammo",
			name = ammoData[order].name,
			icon = "__kj_vehicles__/graphics/bullet_"..ammoData[order].suffix..".png",
			icon_size = 64,
			ammo_category = ammoData[order].name,
			ammo_type =
			{
				action =
				{
					type = "direct",
					action_delivery =
					{
						type = "instant",
						source_effects =
						{
							type = "create-explosion",
							entity_name = "explosion-gunshot"
						},
						target_effects = ammoData[order].target_effects
					}
				}
			},
			subgroup = "ammo",
			order = ammoData[order].order,
			pick_sound = data.raw["ammo"]["firearm-magazine"].pick_sound,
			drop_sound = data.raw["ammo"]["firearm-magazine"].drop_sound,
			stack_size = 100,
			weight = ammoData[order].weight * 1000,
			magazine_size = ammoData[order].magazine_size,
		},
	})

	table.insert(data.raw["technology"]["physical-projectile-damage-5"].effects,
		{
			type = "ammo-damage",
			ammo_category = ammoData[order].name,
			modifier = 0.1,
		}
	)
	table.insert(data.raw["technology"]["physical-projectile-damage-6"].effects,
		{
			type = "ammo-damage",
			ammo_category = ammoData[order].name,
			modifier = 0.1,
		}
	)
	table.insert(data.raw["technology"]["physical-projectile-damage-7"].effects,
		{
			type = "ammo-damage",
			ammo_category = ammoData[order].name,
			modifier = 0.1,
		}
	)
end

local function ammo(order)
	if order == 4 then
		bigBoom()
	end
	if order == 6 or order == 7 then
		ammoMG(order)
		goto endof
	end
	if order == 8 then
		napalm()
	end

	data:extend({
		{
			type = "ammo-category",
			name = ammoData[order].name,
			icon = "__kj_vehicles__/graphics/bomb_"..ammoData[order].size..".png",
			icon_size = 128,
			order = "kj-u-b[bomb]-"..order,
			subgroup = "ammo-category",
		},
		{
			type = "recipe",
			name = ammoData[order].name,
			enabled = false,
			energy_required = ammoData[order].time,
			ingredients = ammoData[order].ingredients,
			results = {{type = "item", name = ammoData[order].name, amount = 1}},
		},
		{
			type = "ammo",
			name = ammoData[order].name,
			icon = "__kj_vehicles__/graphics/bomb_"..ammoData[order].size..".png",
			icon_size = 128,
			ammo_category = ammoData[order].name,
			ammo_type =
			{
				target_type = "direction",
				action =
				{
					type = "direct",
					action_delivery =
					{
						type = "projectile",
						projectile = ammoData[order].name,
						starting_speed = 0.05,
						direction_deviation = 0.3,
						range_deviation = 0.3,
						max_range = ammoData[order].max,
						min_range = ammoData[order].min,
					}
				}
			},
			subgroup = "ammo",
			order = ammoData[order].order,
			stack_size = ammoData[order].stackSize,
			pick_sound = data.raw["ammo"]["cannon-shell"].pick_sound,
			drop_sound = data.raw["ammo"]["cannon-shell"].drop_sound,
			magazine_size = 1,
			weight = ammoData[order].weight * 1000,
			reload_time = 15,
		},
		{
			type = "projectile",
			name = ammoData[order].name,
			flags = {"not-on-map"},
			force_condition = "not-same",
			hidden = true,
			acceleration = 0,
			final_action = ammoData[order].final_action,
			animation =
			{
				filename = "__kj_vehicles__/graphics/bomb_anim.png",
				frame_count = 16,
				line_length = 2,
				lines_per_file = 8,
				width = 128,
				height = 128,
				scale = 0.25,
				priority = "high",
				animation_speed = 16/60,
			}
		},
	})

	table.insert(data.raw["technology"]["physical-projectile-damage-5"].effects,
		{
			type = "ammo-damage",
			ammo_category = ammoData[order].name,
			modifier = 0.9,
		}
	)
	table.insert(data.raw["technology"]["physical-projectile-damage-6"].effects,
		{
			type = "ammo-damage",
			ammo_category = ammoData[order].name,
			modifier = 1.3,
		}
	)
	table.insert(data.raw["technology"]["physical-projectile-damage-7"].effects,
		{
			type = "ammo-damage",
			ammo_category = ammoData[order].name,
			modifier = 1,
		}
	)

	::endof::
	if order == 7 then
		return true
	else
		return false
	end
end

local done = false
--50, 250, 500, 1000, Atom, Low Caliber MG, High Caliber MG, Napalm
local ammoCategories = {false, false, false, false, false, false, false, false}
for name, mod in pairs(tables.airborneMods) do
	if done == true then
		goto done
	end

	if mods[name] then
		for i, value in pairs(mod) do
			if value == true and ammoCategories[i] == false then
				done = ammo(i)
				ammoCategories[i] = true
			end
		end
	end

	::done::
end

for _, datas in pairs(ammoData) do
	if data.raw["recipe"][datas.name] ~= nil then
		for _, ingredient in ipairs(data.raw["recipe"][datas.name].ingredients) do
			ingredient.amount = ingredient.amount * settings.startup["kj_plane_ammo_cost_setting_multiplicator"].value
		end
	end
end

if data.raw["ammo-category"]["kj_plane_napalm"] ~= nil then
	data.raw["ammo-category"]["kj_plane_napalm"].icon = "__kj_vehicles__/graphics/category_napalm.png"
end
if data.raw["ammo-category"]["kj_plane_atom"] ~= nil then
	data.raw["ammo-category"]["kj_plane_atom"].icon = "__kj_vehicles__/graphics/category_atom.png"
end


local function deleteSpecifiedLayers(layers, deleteLayers)
	if #deleteLayers > 0 then
		table.sort(deleteLayers, function(a, b) return a > b end)
		--log("Before")
		--log(serpent.block(layers))
		--log(serpent.block(deleteLayers))
		for _, index in ipairs(deleteLayers) do
			if index >= 1 and index <= #layers then
				--log("Deleted Layer "..index)
				table.remove(layers, index)
			end
		end
		--log("After")
		--log(serpent.block(layers))
	end
end

local function planeSound(name)
	local values = {fadeIn = 60, speedMult = 0.7, volume = 0.5, offset = 0}
	--log(serpent.block(tables.planeData.sound[name]))
	if next(tables.planeData.sound[name]) ~= nil then
		for pName, _ in pairs(values) do
			if tables.planeData.sound[name][pName] ~= nil then
				values[pName] = tables.planeData.sound[name][pName]
				--log("Value: "..tables.planeData.sound[name][pName])
			end
		end
	end

	local working_sound =
	{
		main_sounds =
		{
			{
				sound = {filename = "__"..name.."__/sounds/engine.ogg", volume = 0.65},
				match_volume_to_activity = true,
				fade_in_ticks = values.fadeIn,
				fade_out_ticks = 0,
				activity_to_volume_modifiers =
				{
					inverted = true,
					minimum = 0.75,
					multiplier = 5,
					--offset = 1,
				},
				match_speed_to_activity = true,
				activity_to_speed_modifiers =
				{
					multiplier = values.speedMult,
					minimum = 1.0,
					maximum = 1.5,
					offset = values.offset,
				}
			},
		},
		activate_sound = {filename = "__"..name.."__/sounds/engine-start.ogg", volume = values.volume},
		deactivate_sound = {filename = "__"..name.."__/sounds/engine-stop.ogg", volume = values.volume},
	}
	local sound_no_fuel = {{filename = "__"..name.."__/sounds/engine-fail.ogg", volume = values.volume}}

	return working_sound, sound_no_fuel
end

local api = require("__AircraftRealism__.api")
for plane, _ in pairs(tables.airborneMods) do
	if mods[plane] then
		local car_grounded = data.raw["car"][plane]
		car_grounded.working_sound, car_grounded.sound_no_fuel = planeSound(plane)
		local car_airborne = table.deepcopy(car_grounded)

		car_airborne.name = car_airborne.name.."-airborne"
		car_airborne.localised_name = {"", {"entity-name."..plane}}
		car_airborne.localised_description = {"", {"entity-description."..plane}}
		car_airborne.rotation_speed = tables.planeData.rotation_speed[plane]
		car_airborne.friction = tables.planeData.friction[plane] or 0.0002
		car_airborne.terrain_friction_modifier = 1
		car_airborne.collision_mask = {layers = {}}
		car_airborne.deliver_category = nil
		car_airborne.hidden = true
		car_airborne.hidden_in_factoriopedia = true

		if tables.planeData.airSound[plane] == true then
			car_airborne.working_sound.main_sounds[1].sound.filename = 
				string.gsub(car_airborne.working_sound.main_sounds[1].sound.filename, "engine", "engine-airborne")

				local modifier = car_airborne.working_sound.main_sounds[1].activity_to_speed_modifiers
				--modifier.offset = 0.5
				modifier.multiplier = 0.5 * modifier.multiplier
		end
		if tables.planeData.braking_power[plane] ~= nil then
			car_airborne.braking_power = tables.planeData.braking_power[plane]
		end
		if tables.planeData.weight[plane] ~= nil then
			car_airborne.weight = tables.planeData.weight[plane]
		end
		for i, light in pairs(car_airborne.light) do
			light.shift[2] = light.shift[2] + tables.planeData.lights[plane][i]
		end

		deleteSpecifiedLayers(car_grounded.animation.layers, tables.planeData.flyingSheet[plane][1])
		deleteSpecifiedLayers(car_airborne.animation.layers, tables.planeData.flyingSheet[plane][2])

		while #car_airborne.animation.layers > 0 do
			local found = false
			for i = #car_airborne.animation.layers, 1, -1 do
				if car_airborne.animation.layers[i].draw_as_shadow == true then
					table.remove(car_airborne.animation.layers, i)
					found = true
				end
			end
			if not found then
				break -- Beende die Schleife, wenn keine passenden Layer gefunden wurden
			end
		end

		if settings.startup[plane.."no_melee_damage"].value == true then
			for _, resistance in pairs(car_airborne.resistances) do
				if resistance.type ~= "flak" then
					resistance.decrease = 50
					resistance.percent = 100
				end
			end
		end
		data:extend({car_airborne})

		api.register_plane({
			grounded_name = plane,
			airborne_name = car_airborne.name,
			transition_speed_setting = "aircraft-takeoff-speed-"..plane,
			max_speed 	  = tables.planeData.maxSpeed[plane] / 216,
			shadow_end_speed = tables.planeData.shadowSpeed[plane] / 216,
			shadow_sprite = shadowSpriteCollector(plane, 128),
			shadow_alpha = 1,
			--shadow_offset = {},
		})
	end
end


::ende::

