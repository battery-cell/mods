local utils = require("utils")
local modname = "__kj_ray__"

local waterVariantMG = table.deepcopy(data.raw["gun"]["kj_ray_mg"])
waterVariantMG.name = waterVariantMG.name.."_water"
waterVariantMG.attack_parameters.projectile_center = {0, -3}

local waterVariantRocket = table.deepcopy(data.raw["gun"]["kj_ray_rocket"])
waterVariantRocket.name = waterVariantRocket.name.."_water"
waterVariantRocket.attack_parameters.projectile_center = {0, -3}

local waterVariantCannon = table.deepcopy(data.raw["gun"]["kj_ray_cannon"])
waterVariantCannon.name = waterVariantCannon.name.."_water"
waterVariantCannon.attack_parameters.projectile_center = {0, -1}

--waterVariantCannon.attack_parameters.source_offset = {0, -2}

local waterVariant = table.deepcopy(data.raw["car"]["kj_ray"])
waterVariant.name = "kj_ray_water"
waterVariant.hidden = true
waterVariant.turret_animation.layers[1] = utils.layerMaker(modname, "", "ray", 	   2000, {1,2,64}, {1,4}, 16, 3, nil, 0.5, nil, nil, 1)
waterVariant.turret_animation.layers[2] = utils.layerMaker(modname, "", "ray_water", 2000, {2,1,64}, {2,4}, 16, 1, nil, 0.5, nil, nil, 1)
waterVariant.turret_animation.layers[3] = utils.layerMaker(modname, "", "ray_top",   2000, {2,1,64}, {2,4}, 16, 1, nil, 0.5, nil, nil, 1)
waterVariant.turret_animation.layers[4] = utils.layerMaker(modname, "", "ray_top",   2000, {2,1,64}, {2,4}, 16, 2, {3, -2.5}, 0.5, nil, nil, 1)
waterVariant.turret_animation.layers[5] = nil
waterVariant.guns = {waterVariantCannon.name, waterVariantMG.name, waterVariantRocket.name}

data:extend({waterVariantMG, waterVariantRocket, waterVariantCannon, waterVariant})



--------------Smaller Variant------------------

--MG
raymg = table.deepcopy(data.raw["gun"]["kj_ray_mg"])
raymg.name = "kj_ray_mg_small"
raymg.order = "[basic-clips]-f[raymg]"
raymg.attack_parameters.range = 20
raymg.attack_parameters.damage_modifier = 1
raymg.attack_parameters.projectile_center = {0, -2}

--Rocket Launcher
rayrocket = table.deepcopy(data.raw["gun"]["kj_ray_rocket"])
rayrocket.name = "kj_ray_rocket_small"
rayrocket.order = "[basic-clips]-f[rayrocket]"
rayrocket.attack_parameters.range = 25
rayrocket.attack_parameters.damage_modifier = 1
rayrocket.attack_parameters.projectile_center = {0, -2}

--Cannon
local raycannon = table.deepcopy(data.raw["gun"]["kj_ray_cannon"])
raycannon.name = "kj_ray_cannon_small"
raycannon.order = "y[ray]-b[railgun]"
raycannon.attack_parameters.range = 30
raycannon.attack_parameters.damage_modifier = 1
raycannon.attack_parameters.ammo_category = "kj_ray_cannon_small"
raycannon.attack_parameters.projectile_creation_distance = 8*0.333
raycannon.attack_parameters.projectile_center = {0, -4*0.333}

data:extend({raymg, rayrocket, raycannon})


local waterVariantMG = table.deepcopy(data.raw["gun"]["kj_ray_mg_small"])
waterVariantMG.name = waterVariantMG.name.."_water"
waterVariantMG.attack_parameters.projectile_center = {0, -1}

local waterVariantRocket = table.deepcopy(data.raw["gun"]["kj_ray_rocket_small"])
waterVariantRocket.name = waterVariantRocket.name.."_water"
waterVariantRocket.attack_parameters.projectile_center = {0, -1}

local waterVariantCannon = table.deepcopy(data.raw["gun"]["kj_ray_cannon_small"])
waterVariantCannon.name = waterVariantCannon.name.."_water"
waterVariantCannon.attack_parameters.projectile_creation_distance = 8*0.333
waterVariantCannon.attack_parameters.projectile_center = {0, -1*0.333}

data:extend({waterVariantMG, waterVariantRocket, waterVariantCannon})


local smallVariant = table.deepcopy(data.raw["car"]["kj_ray"])
smallVariant.name = "kj_ray_small"
smallVariant.hidden = true
smallVariant.icon = "__kj_ray__/graphics/icon_small.png"
smallVariant.localised_name = {"", {"entity-name.kj_ray_small"}}
smallVariant.localised_description = {"", {"entity-description.kj_ray_small"}}
smallVariant.minable = {mining_time = 8, result = "kj_ray_small"}
smallVariant.max_health = 6000
smallVariant.corpse = "medium-remnants"
smallVariant.resistances = {
	{
		type = "fire",
		decrease = 50,
		percent = 100
	},
	{
		type = "physical",
		decrease = 6,
		percent = 25
	},
	{
		type = "impact",
		decrease = 25,
		percent = 25
	},
	{
		type = "explosion",
		decrease = 15,
		percent = 25
	},
	{
		type = "acid",
		decrease = 15,
		percent = 25
	}
}
smallVariant.collision_mask = {layers = {out_of_map = true, train = true}}
smallVariant.collision_box = {{-2, -1}, {2, 1}}
smallVariant.selection_box = {{-2, -1}, {2, 1}}
smallVariant.drawing_box_vertical_extension = 3
smallVariant.sticker_box = {{-1, -1}, {1, 1}}
smallVariant.braking_power = "1000kW"
smallVariant.energy_source = {
	type = "burner",
	fuel_categories = {"kj_gas_barrel"},
	effectivity = 1,
	fuel_inventory_size = 1,
	burnt_inventory_size = 1,
	smoke = {
		{
			name = "kj_ray_splash",
			deviation = {0.5*0.333, 0.5*0.333},
			frequency = 40,
			position = {-4.5*0.333,1.5*0.333},
			starting_frame = 6,
			starting_frame_deviation = 6,
		},
		{
			name = "kj_ray_splash",
			deviation = {0.5*0.333, 0.5*0.333},
			frequency = 40,
			position = {4.5*0.333,1.5*0.333},
			starting_frame = 6,
			starting_frame_deviation = 6,
		},
		{
			name = "kj_ray_splash",
			deviation = {0.5*0.333, 0.5*0.333},
			frequency = 40,
			position = {-5*0.333,0},
			starting_frame = 6,
			starting_frame_deviation = 6,
		},
		{
			name = "kj_ray_splash",
			deviation = {0.5*0.333, 0.5*0.333},
			frequency = 40,
			position = {5*0.333,0},
			starting_frame = 6,
			starting_frame_deviation = 6,
		},
		{
			name = "kj_ray_splash",
			deviation = {0.5*0.333, 0.5*0.333},
			frequency = 40,
			position = {-6*0.333,-1.5*0.333},
			starting_frame = 6,
			starting_frame_deviation = 6,
		},
		{
			name = "kj_ray_splash",
			deviation = {0.5*0.333, 0.5*0.333},
			frequency = 40,
			position = {6*0.333,-1.5*0.333},
			starting_frame = 6,
			starting_frame_deviation = 6,
		},
	},
}
smallVariant.consumption = "200kW"
smallVariant.weight = 33333
smallVariant.guns = {"kj_ray_cannon_small", "kj_ray_mg_small", "kj_ray_rocket_small"}
smallVariant.inventory_size = 20
for _,layer in pairs(smallVariant.turret_animation.layers) do
	layer.scale = 0.333
	layer.shift = {layer.shift[1] * 0.333, layer.shift[2] * 0.333}
end

data:extend({smallVariant})

waterVariant = table.deepcopy(data.raw["car"]["kj_ray_small"])
waterVariantAnim = table.deepcopy(data.raw["car"]["kj_ray_water"].turret_animation)
waterVariant.name = "kj_ray_water_small"
waterVariant.turret_animation = waterVariantAnim
for _,layer in pairs(waterVariant.turret_animation.layers) do
	layer.scale = 0.333
	layer.shift = {layer.shift[1] * 0.333, layer.shift[2] * 0.333}
end
waterVariant.guns = {waterVariantCannon.name, waterVariantMG.name, waterVariantRocket.name}

data:extend({waterVariant})

data.raw["car"]["kj_ray"].energy_source.smoke = nil
data.raw["car"]["kj_ray_small"].energy_source.smoke = nil
