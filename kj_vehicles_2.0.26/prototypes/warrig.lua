local sounds = require("__base__/prototypes/entity/sounds.lua")
local hit_effects = require ("__base__/prototypes/entity/hit-effects.lua")
local emptySpriteRail = util.empty_sprite()
local empty_animation = util.empty_animation(1)
local resistances = {
	{
		type = "fire",
		decrease = 100,
		percent = 100,
	},
	{
		type = "acid",
		decrease = 100,
		percent = 100,
	},
}
local simLoc = {
	init =
	[[
		game.simulation.camera_zoom = 1.5
		game.surfaces[1].create_entities_from_blueprint_string
		{
			string = "0eNqdld1uwjAMhd/F1xmi/7SvMqEoLVnxKAlKAgyhvvscOgk2tqmJ1Bun9nfS+MS9Qjsc5cGgctBcATutLDSvV7DYKzH4NSX2EhrYvfOzMAZ7bgQOFkYGqDbyA5pkZP/mOypQD/npuGYglUOHchK7BReujvtWGgKy30W59ah+64DBQVuq18orEjMvGFygeVllpLNBI7vpZe739gOfRuCr+fgsAl/Px+fh+CKZjy8i8Nl8fMn+8scztlhUj12VSrSD5IPu0TrsLD9vkeK9PqHqoXkTg5UMtEGSFBNnuUiJgE7uJ5/h5rtBe2Fb2oMcbu6c0ihLcVQnomhzmcruEZ2kdaLbEZtBp4/+2uTjeqTn+WOriLMM8PEqAh/g4zoCH+DjZBnOLwOMnERMkTLAyUnEGCkDuptEzJHyz/auvW91t+M04NW0/DXn/SpV+gx/A0ju/kdgcJLG3hBFmdZ5XRd5VVdFlY3jJ0OGHqo=",
			position = {0, 0}
		}
	]]
}
local simWag = {
	init =
	[[
		game.simulation.camera_position = {0, -0.5}
		game.simulation.camera_zoom = 1
		game.surfaces[1].create_entities_from_blueprint_string
		{
			string = "0eNqdlV1ugzAQhO+yz24UfgyBq1QVcohLtjF2ZJukUcTdu4RKjdqkwn5CXi/fGO0MvsJWDfJoUXuor4Ct0Q7q1ys47LRQU02LXkINh4/mLKzFrrEClYORAeqd/IQ6Gdm//WfRGX3Xn45vDKT26FHOYrfFpdFDv5WWgOyxaOM8Pbq9BwZH4+h94pIiMfOMwQXqlyojnR1a2c6b+XS2X/g0As+X47MIfLkcn0fgq+V4Ho7nyXJ8EYEPGG3JntnvL5avNnlW3g9WarFVslGmQ+exdc15j7TuzQl1B/W7UE4yMBZJVcyo9Srlk7FPVDKWSHpQ6sHBNhHfHeC5KgIf4LlkHcEPMF0SkfgiwHVJROSLANslEZkvAsabRIS+CJlvROqLp/Olv7vzpj00dJnoufx9p0xVCunUgV72JPdz+zA4SetuCF6kVV5VPC+rkpfZOH4BXTxC6A==",
			position = {0, 0}
		}
	]]
}

local wagon = {
	type = "cargo-wagon",
	name = "kj_warrig_wagon",
	icon = "__kj_warrig__/graphics/wagon.png",
	icon_size = 128,
	flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
	inventory_size = 200,
	minable = {mining_time = 1.8, result = "kj_warrig_wagon"},
	mined_sound = {filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8},
	max_health = 3000,
	capacity = 100000,
	dying_explosion = "cargo-wagon-explosion",
	collision_box 	= {{-1.2 , -4.6}, {1.2 , 4.6}},
	selection_box 	= {{-1.44, -4.6}, {1.44, 4.6}},
	sticker_box 	= {{-1.2 , -1.6}, {1.2 , 1.6}},
	damaged_trigger_effect = hit_effects.entity(),
	vertical_selection_shift = -0.796875,
	weight = 23000,
	max_speed = 1.5,
	braking_force = 15,
	friction_force = 0.50,
	air_resistance = 0.01,
	connection_distance = 3,
	joint_distance = 8,
	energy_per_hit_point = 0.5,
	resistances = data.raw["car"]["kj_warrig"].resistances,
	factoriopedia_simulation = simWag,
	pictures =
	{
		rotated =
		{
			layers =
			{
				{
					width = 1258,
					height = 1258,
					direction_count = 128,
					line_length = 4,
					lines_per_file = 4,
					shift = {0, -0.5},
					scale = 0.5,
					filenames =
					{
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_0.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_1.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_2.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_3.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_4.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_5.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_6.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_7.png",
					},
				},
				{
					flags = {"shadow"},
					width = 1258,
					height = 1258,
					direction_count = 128,
					draw_as_shadow = true,
					line_length = 4,
					lines_per_file = 4,
					shift = {1.25, 0.5},
					scale = 0.5,
					filenames =
					{
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_shadow_0.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_shadow_1.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_shadow_2.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_shadow_3.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_shadow_4.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_shadow_5.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_shadow_6.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_shadow_7.png",
					},
				},
			},
		},
	},
	minimap_representation =
	{
		filename = "__kj_warrig__/graphics/wagon_map_symbol.png",
		flags = {"icon"},
		size = {30, 50},
		scale = 0.5
	},
	selected_minimap_representation =
	{
		filename = "__kj_warrig__/graphics/wagon_map_symbol_selected.png",
		flags = {"icon"},
		size = {30, 50},
		scale = 0.5
	},
	--wheels = standard_train_wheels,
	--drive_over_tie_trigger = drive_over_tie(),
	--tie_distance = 50,
	working_sound =
	{
		sound =
		{
			filename = "__base__/sound/train-wheels.ogg",
			volume = 0.3
		},
		match_volume_to_activity = true
	},
	open_sound = sounds.cargo_wagon_open,
	close_sound = sounds.cargo_wagon_close,
	sound_minimum_speed = 1,
}

local rail_8shifts_vector = function(dx, dy)
	return {
		{  dx,  dy },
		{ -dx,  dy },
		{ -dy,  dx },
		{ -dy, -dx },
		{ -dx, -dy },
		{  dx, -dy },
		{  dy, -dx },
		{  dy,  dx }
	}
end

local function make_new_rail_pictures(keys, elems)
	local function make_sprite_definition(filename, elem, key, variation_count)
		return
		{
			filename = filename,
			priority = elem.priority or "extra-high",
			flags = elem.mipmap and { "trilinear-filtering" } or { "low-object" },
			draw_as_shadow = elem.draw_as_shadow,
			allow_forced_downscale = elem.allow_forced_downscale,
			width = key[3][1],
			height = key[3][2],
			x = key[2][1],
			y = key[2][2],
			scale = 0.5;
			shift = util.by_pixel(key[4][1], key[4][2]),
			variation_count = variation_count,
			usage = "rail"
		}
	end

	local res = {}
	for _, key in ipairs(keys) do
		local part = {}
		local variation_count = key[5] or 1

		for _, elem in ipairs(elems) do
			local layers = nil
			local variations = variation_count;
			layers = make_sprite_definition(elem[2], elem, key, variations)

			if (elem[1] ~= nil) then
				part[elem[1]] = layers
			else
				part = layers
			end
		end

	 	res[key[1]] = part
	end
	return res
end

local function rail_pictures(rail_type)
	local keys
	local NOT_USED_POSITION = {0, 0}
	local NOT_USED_SIZE = {1, 1}
	local NOT_USED_SHIFT = {0, 0}
	if rail_type == "straight" then
		keys =
		{
			{"north",     {      0, 1 * 384}, {384, 384}, {0,0}, 1},
			{"northeast", {4 * 384, 1 * 384}, {384, 384}, {0,0}, 1},
			{"east",      {      0,       0}, {384, 384}, {0,0}, 1},
			{"southeast", {4 * 384,       0}, {384, 384}, {0,0}, 1},
			{"south",     NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
			{"southwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
			{"west",      NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
			{"northwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0}
		}
	elseif rail_type == "half-diagonal" then
		keys =
		{
			{"north",     {6 * 384,       0}, {384, 384}, {0,0}, 1},
			{"northeast", {2 * 384, 1 * 384}, {384, 384}, {0,0}, 1},
			{"east",      {6 * 384, 1 * 384}, {384, 384}, {0,0}, 1},
			{"southeast", {2 * 384,       0}, {384, 384}, {0,0}, 1},
			{"south",     NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
			{"southwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
			{"west",      NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
			{"northwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0}
		}
	elseif rail_type == "curved-a" then
		keys =
		{
			{"north",     {7 * 384,       0}, {384, 384}, {  0,-16}, 1},
			{"northeast", {1 * 384, 3 * 384}, {384, 384}, {  0,-16}, 1},
			{"east",      {7 * 384, 1 * 384}, {384, 384}, { 16,  0}, 1},
			{"southeast", {1 * 384,       0}, {384, 384}, { 16,  0}, 1},
			{"south",     {7 * 384, 2 * 384}, {384, 384}, {  0, 16}, 1},
			{"southwest", {1 * 384, 1 * 384}, {384, 384}, {  0, 16}, 1},
			{"west",      {7 * 384, 3 * 384}, {384, 384}, {-16,  0}, 1},
			{"northwest", {1 * 384, 2 * 384}, {384, 384}, {-16,  0}, 1},
		}
	elseif rail_type == "curved-b" then
		keys =
		{
			{"north",     {5 * 384,       0}, {384, 384}, {-16,  0}, 1},
			{"northeast", {3 * 384, 3 * 384}, {384, 384}, { 16,  0}, 1},
			{"east",      {5 * 384, 1 * 384}, {384, 384}, {  0,-16}, 1},
			{"southeast", {3 * 384,       0}, {384, 384}, {  0, 16}, 1},
			{"south",     {5 * 384, 2 * 384}, {384, 384}, { 16,  0}, 1},
			{"southwest", {3 * 384, 1 * 384}, {384, 384}, {-16,  0}, 1},
			{"west",      {5 * 384, 3 * 384}, {384, 384}, {  0, 16}, 1},
			{"northwest", {3 * 384, 2 * 384}, {384, 384}, {  0,-16}, 1},
		}
	end
	local elems = {{"metals", "__kj_warrig__/graphics/entity/roads.png"}}

	local res = make_new_rail_pictures(keys, elems)
	res["rail_endings"] =
	{
		north = emptySpriteRail,
		north_east = emptySpriteRail,
		north_north_east = emptySpriteRail,
		north_north_west = emptySpriteRail,
		north_west = emptySpriteRail,

		east = emptySpriteRail,
		east_north_east = emptySpriteRail,
		east_south_east = emptySpriteRail,

		south = emptySpriteRail,
		south_east = emptySpriteRail,
		south_south_east = emptySpriteRail,
		south_south_west = emptySpriteRail,
		south_west = emptySpriteRail,

		west = emptySpriteRail,
		west_north_west = emptySpriteRail,
		west_south_west = emptySpriteRail,
	}
	res["render_layers"] = {
		metal = "rail-stone-path-lower",
		screw = "rail-screw",
		stone_path = "rail-stone-path",
		stone_path_lower = "rail-stone-path-lower",
		tie = "rail-tie"
	}
	return res
end

data:extend({wagon})
wagon = table.deepcopy(wagon)
wagon.type = "fluid-wagon"
wagon.name = "kj_warrig_wagon_fluid"
wagon.icon = "__kj_warrig__/graphics/wagon_fluid.png"
wagon.minable.result = "kj_warrig_wagon_fluid"
data:extend({wagon})

--log(serpent.block(data.raw["legacy-straight-rail"]["legacy-straight-rail"].pictures))


data:extend({
	{
		type = "straight-rail",
		name = "kj_warrig_rail_straight",
		order = "1[civil]-i5",
		icon = "__kj_warrig__/graphics/road.png",
		icon_size = 128,
		hidden = true,
		collision_box = {{-1, -1}, {1, 1}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
		selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
		minable = {mining_time = 0.2, result = "kj_warrig_rails", count = 1},
		max_health = 200,
		corpse = "medium-remnants",
		dying_explosion = {name = "rail-explosion"},
		resistances = resistances,
		damaged_trigger_effect = hit_effects.wall(),
		pictures = rail_pictures("straight"),
		placeable_by = {item = "kj_warrig_rails", count = 1},
		walking_sound = sounds.rails,
		extra_planner_goal_penalty = -4,
		factoriopedia_alternative = "kj_warrig_rail_straight"
	},
	{
		type = "half-diagonal-rail",
		name = "kj_warrig_rail_half_diagonal",
		order = "1[civil]-i6",
		deconstruction_alternative = "kj_warrig_rail_straight",
		icon = "__kj_warrig__/graphics/road.png",
		icon_size = 128,
		hidden = true,
		collision_box = {{-0.75, -2.236}, {0.75, 2.236}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
		selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
		tile_height = 2,
		extra_planner_goal_penalty = -4,
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
		minable = {mining_time = 0.2, result = "kj_warrig_rails", count = 2},
		max_health = 200,
		corpse = "medium-remnants",
		dying_explosion =
		{
			{name = "rail-explosion", offset = {0.9, 2.2}},
			{name = "rail-explosion"},
			{name = "rail-explosion", offset = {-1.2, -2}}
		},
		resistances = resistances,
		-- collision box is hardcoded for rails as to avoid unexpected changes in the way rail blocks are merged
		damaged_trigger_effect = hit_effects.wall(),
		pictures = rail_pictures("half-diagonal"),
		placeable_by = {item = "kj_warrig_rails", count = 2},
		walking_sound = sounds.rails,
		extra_planner_penalty = 0,
		factoriopedia_alternative = "kj_warrig_rail_straight"
	},
	{
		type = "curved-rail-a",
		name = "kj_warrig_rail_curved_rail_a",
		order = "1[civil]-i7",
		deconstruction_alternative = "kj_warrig_rail_straight",
		icon = "__kj_warrig__/graphics/road.png",
		icon_size = 128,
		hidden = true,
		collision_box = {{-0.75, -2.516}, {0.75, 2.516}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
		selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
		minable = {mining_time = 0.2, result = "kj_warrig_rails", count = 3},
		max_health = 200,
		corpse = "medium-remnants",
		dying_explosion =
		{
			{name = "rail-explosion", offset = {0.9, 2.2}},
			{name = "rail-explosion"},
			{name = "rail-explosion", offset = {-1.2, -2}}
		},
		resistances = resistances,
		-- collision box is hardcoded for rails as to avoid unexpected changes in the way rail blocks are merged
		damaged_trigger_effect = hit_effects.wall(),
		pictures = rail_pictures("curved-a"),
		placeable_by = {item = "kj_warrig_rails", count = 3},
		walking_sound = sounds.rails,
		extra_planner_penalty = 0.5,
		deconstruction_marker_positions = rail_8shifts_vector(-0.248, -0.533),
		factoriopedia_alternative = "kj_warrig_rail_straight"
	},
	{
		type = "curved-rail-b",
		name = "kj_warrig_rail_curved_rail_b",
		order = "1[civil]-i8",
		deconstruction_alternative = "kj_warrig_rail_straight",
		icon = "__kj_warrig__/graphics/road.png",
		icon_size = 128,
		hidden = true,
		collision_box = {{-0.75, -2.441}, {0.75, 2.441}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
		selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
		minable = {mining_time = 0.2, result = "kj_warrig_rails", count = 3},
		max_health = 200,
		corpse = "medium-remnants",
		dying_explosion =
		{
			{name = "rail-explosion", offset = {0.9, 2.2}},
			{name = "rail-explosion"},
			{name = "rail-explosion", offset = {-1.2, -2}}
		},
		resistances = resistances,
		-- collision box is hardcoded for rails as to avoid unexpected changes in the way rail blocks are merged
		damaged_trigger_effect = hit_effects.wall(),
		pictures = rail_pictures("curved-b"),
		placeable_by = {item = "kj_warrig_rails", count = 3},
		walking_sound = sounds.rails,
		extra_planner_penalty = 0.5,
		deconstruction_marker_positions = rail_8shifts_vector(-0.309, -0.155),
		factoriopedia_alternative = "kj_warrig_rail_straight"
	},
})


data:extend({
	{
		type = "legacy-straight-rail",
		name = "kj_warrig_rail_straight_legacy",
		icon = "__kj_warrig__/graphics/road.png",
		icon_size = 128,
		hidden = true,
		collision_box = {{-1, -1}, {1, 1}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
		minable = {mining_time = 0.2, result = "kj_warrig_rails"},
		max_health = 100,
		corpse = "medium-remnants",
		dying_explosion = "rail-explosion",
		resistances =
		{
		  {
			type = "fire",
			decrease = 100,
			percent = 100,
		  },
		  {
			type = "acid",
			decrease = 100,
			percent = 100,
		  },
		},
		map_color = {r = 1, g = 1, b = 1, a = 1},
		-- collision box is hardcoded for rails as they need to be different for different orientations (diagonal or straight) and to
		-- avoid unexpected changes in the way rail blocks are merged
		selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
		damaged_trigger_effect = hit_effects.wall(),
		pictures = {
			north = {
				metals = {
					width = 128,
					height = 128,
					filename = "__kj_warrig__/graphics/entity/straight-rail/north.png",
					scale = 0.5,
					shift = {0, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			northeast = {
				metals = {
					width = 192,
					height = 192,
					filename = "__kj_warrig__/graphics/entity/straight-rail/northeast.png",
					scale = 0.5,
					shift = {0, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			northwest = {
				metals = {
					width = 192,
					height = 192,
					filename = "__kj_warrig__/graphics/entity/straight-rail/northwest.png",
					scale = 0.5,
					shift = {0, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			east = {
				metals = {
					width = 128,
					height = 128,
					filename = "__kj_warrig__/graphics/entity/straight-rail/east.png",
					scale = 0.5,
					shift = {0, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			south = {
				metals = {
					width = 128,
					height = 128,
					filename = "__kj_warrig__/graphics/entity/straight-rail/north.png",
					scale = 0.5,
					shift = {0, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			southeast = {
				metals = {
					width = 192,
					height = 192,
					filename = "__kj_warrig__/graphics/entity/straight-rail/southeast.png",
					scale = 0.5,
					shift = {0, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			southwest = {
				metals = {
					width = 192,
					height = 192,
					filename = "__kj_warrig__/graphics/entity/straight-rail/southwest.png",
					scale = 0.5,
					shift = {0, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			west = {
				metals = {
					width = 128,
					height = 128,
					filename = "__kj_warrig__/graphics/entity/straight-rail/east.png",
					scale = 0.5,
					shift = {0, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			rail_endings = {
				north = emptySpriteRail,
				north_east = emptySpriteRail,
				north_north_east = emptySpriteRail,
				north_north_west = emptySpriteRail,
				north_west = emptySpriteRail,

				east = emptySpriteRail,
				east_north_east = emptySpriteRail,
				east_south_east = emptySpriteRail,

				south = emptySpriteRail,
				south_east = emptySpriteRail,
				south_south_east = emptySpriteRail,
				south_south_west = emptySpriteRail,
				south_west = emptySpriteRail,

				west = emptySpriteRail,
				west_north_west = emptySpriteRail,
				west_south_west = emptySpriteRail,
			},
			render_layers = {
				metal = "rail-metal",
				screw = "rail-screw",
				stone_path = "rail-stone-path",
				stone_path_lower = "rail-stone-path-lower",
				tie = "rail-tie"
			},
		},
		placeable_by = {item = "kj_warrig_rails", count = 1},
		walking_sound = sounds.rails,
	},
	{
		type = "legacy-curved-rail",
		name = "kj_warrig_rail_curved_legacy",
		icon = "__kj_warrig__/graphics/road.png",
		icon_size = 128,
		hidden = true,
		collision_box = {{-2, -2}, {2, 2}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
		minable = {mining_time = 0.2, result = "kj_warrig_rails", count = 4},
		max_health = 200,
		corpse = "medium-remnants",
		dying_explosion =
		{
			{
				name = "rail-explosion",
				offset = {0.9, 2.2}
			},
			{
				name = "rail-explosion"
			},
			{
				name = "rail-explosion",
				offset = {-1.2, -2}
			}
		},
		resistances =
		{
			{
				type = "fire",
				decrease = 100,
				percent = 100,
			},
			{
				type = "acid",
				decrease = 100,
				percent = 100,
			},
		},
		map_color = {r = 0.84, g = 0.84, b = 0.84, a = 1},
		-- collision box is hardcoded for rails as to avoid unexpected changes in the way rail blocks are merged
		selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
		damaged_trigger_effect = hit_effects.wall(),
		pictures = {
			north = {
				metals = {
					width = 320,
					height = 512,
					filename = "__kj_warrig__/graphics/entity/curved-rail/north.png",
					scale = 0.5,
					shift = {0.5, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			northeast = {
				metals = {
					width = 320,
					height = 512,
					filename = "__kj_warrig__/graphics/entity/curved-rail/northeast.png",
					scale = 0.5,
					shift = {-0.5, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			northwest = {
				metals = {
					width = 512,
					height = 320,
					filename = "__kj_warrig__/graphics/entity/curved-rail/northwest.png",
					scale = 0.5,
					shift = {0, 0.5},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			east = {
				metals = {
					width = 512,
					height = 320,
					filename = "__kj_warrig__/graphics/entity/curved-rail/east.png",
					scale = 0.5,
					shift = {0, 0.5},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			south = {
				metals = {
					width = 320,
					height = 512,
					filename = "__kj_warrig__/graphics/entity/curved-rail/south.png",
					scale = 0.5,
					shift = {-0.5, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			southeast = {
				metals = {
					width = 512,
					height = 320,
					filename = "__kj_warrig__/graphics/entity/curved-rail/southeast.png",
					scale = 0.5,
					shift = {0, -0.5},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			southwest = {
				metals = {
					width = 320,
					height = 512,
					filename = "__kj_warrig__/graphics/entity/curved-rail/southwest.png",
					scale = 0.5,
					shift = {0.5, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			west = {
				metals = {
					width = 512,
					height = 320,
					filename = "__kj_warrig__/graphics/entity/curved-rail/west.png",
					scale = 0.5,
					shift = {0, -0.5},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			rail_endings = {
				north = emptySpriteRail,
				north_east = emptySpriteRail,
				north_north_east = emptySpriteRail,
				north_north_west = emptySpriteRail,
				north_west = emptySpriteRail,

				east = emptySpriteRail,
				east_north_east = emptySpriteRail,
				east_south_east = emptySpriteRail,

				south = emptySpriteRail,
				south_east = emptySpriteRail,
				south_south_east = emptySpriteRail,
				south_south_west = emptySpriteRail,
				south_west = emptySpriteRail,

				west = emptySpriteRail,
				west_north_west = emptySpriteRail,
				west_south_west = emptySpriteRail,
			},
			render_layers = {
				metal = "rail-metal",
				screw = "rail-screw",
				stone_path = "rail-stone-path",
				stone_path_lower = "rail-stone-path-lower",
				tie = "rail-tie"
			},
		},
		placeable_by = {item = "kj_warrig_rails", count = 4},
		walking_sound = sounds.rails
	},
})


data:extend({
	{
		type = "locomotive",
		name = "kj_warrig_train",
		icon = "__kj_warrig__/graphics/train.png",
		icon_size = 128,
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"},
		minable = {mining_time = 0.9, result = "kj_warrig_train"},
		mined_sound = {filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8},
		max_health = 2000,
		deliver_category = "vehicle",
		corpse = "medium-remnants",
		dying_explosion = "oil-refinery-explosion",
		collision_box 	= {{-1.2 , -4.6}, {1.2 , 4.6}},
		selection_box 	= {{-1.44, -4.6}, {1.44, 4.6}},
		sticker_box 	= {{-1.2 , -1.6}, {1.2 , 1.6}},
		damaged_trigger_effect = hit_effects.entity(),
		weight = 13000,
		max_speed = 0.6,
		max_power = "2000kW",
		braking_force = 15,
		reversing_power_modifier = 1,
		friction_force = 0.50,
		vertical_selection_shift = -0.5,
		air_resistance = 0.0075, -- this is a percentage of current speed that will be subtracted
		connection_distance = 3,
		joint_distance = 8,
		energy_per_hit_point = 1,
		resistances = data.raw["car"]["kj_warrig"].resistances,
		factoriopedia_simulation = simLoc,
		energy_source =
		{
			type = "burner",
			fuel_categories = {"kj_gas_barrel"},
			effectivity = 1.25,
			fuel_inventory_size = 3,
			burnt_inventory_size = 3,
			smoke = data.raw["car"]["kj_warrig"].energy_source.smoke,
		},
		front_light =
		{
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "extra-high",
					flags = { "light" },
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {-0.9, -21},
				size = 3,
				intensity = 1,
				color = {r = 1, g = 1, b = 1}
			},
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "extra-high",
					flags = { "light" },
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {0.9, -21},
				size = 3,
				intensity = 1,
				color = {r = 1, g = 1, b = 1}
			},
		},
		pictures =
		{
			rotated =
			{
				layers =
				{
					{
						width = 962,
						height = 962,
						direction_count = 128,
						allow_low_quality_rotation = false,
						line_length = 1,
						lines_per_file = 8,
						shift = {0.0, 0.5},
						scale = 0.5,
						filenames =
						{
								"__kj_warrig__/graphics/entity/warrig/warrig_0.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_1.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_2.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_3.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_4.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_5.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_6.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_7.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_8.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_9.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_10.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_11.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_12.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_13.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_14.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_15.png",
						},
					},
					{
						width = 962,
						height = 962,
						direction_count = 128,
						draw_as_shadow = true,
						allow_low_quality_rotation = false,
						line_length = 8,
						lines_per_file = 8,
						shift = {0.0, 0.5},
						scale = 0.5,
						filenames =
						{
							"__kj_warrig__/graphics/entity/warrig/warrig_shadow_0.png",
							"__kj_warrig__/graphics/entity/warrig/warrig_shadow_1.png",
						},
					},
				},
			},
		},
		front_light_pictures =
		{
			rotated =
			{
				layers =
				{
					{
						flags = {"light"},
						width = 962,
						height = 962,
						direction_count = 128,
						blend_mode = "additive",
						draw_as_glow = true,
						allow_low_quality_rotation = false,
						line_length = 8,
						lines_per_file = 8,
						shift = {0.0, 0.5},
						scale = 0.5,
						filenames =
						{
							"__kj_warrig__/graphics/entity/warrig/warrig_light_0.png",
							"__kj_warrig__/graphics/entity/warrig/warrig_light_1.png",
						},
					},
				},
			},
		},
		minimap_representation =
		{
			filename = "__kj_warrig__/graphics/map_symbol.png",
			flags = {"icon"},
			size = {128, 128},
			scale = 0.2,
		},
		selected_minimap_representation =
		{
			filename = "__kj_warrig__/graphics/map_symbol_selected.png",
			flags = {"icon"},
			size = {128, 128},
			scale = 0.2,
		},
		stop_trigger =
		{
			{
				type = "play-sound",
				sound =
				{
					{
					filename = "__kj_warrig__/sounds/brakes.ogg",
					volume = 0.6
					},
				}
			},
		},
		--drive_over_tie_trigger = drive_over_tie(),
		--tie_distance = 50,
    	impact_category = "metal-large",
		working_sound =
		{
			sound =
			{
				filename = "__kj_warrig__/sounds/engine.ogg",
				volume = 0.7
			},
			activate_sound =
			{
				filename = "__kj_warrig__/sounds/engine-start.ogg",
				volume = 0.7
			},
			deactivate_sound =
			{
				filename = "__kj_warrig__/sounds/engine-stop.ogg",
				volume = 0.5
			},
			match_speed_to_activity = true,
		},
		open_sound = data.raw["car"]["tank"].open_sound,
		close_sound = { filename = "__kj_warrig__/sounds/door-close.ogg", volume = 0.43},
	}
})
