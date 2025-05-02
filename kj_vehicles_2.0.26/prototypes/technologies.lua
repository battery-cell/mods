local tables = require("tables")
local technologies = {
	{
		modname = "kj_2a6",
		recipes = {"kj_2a6", "kj_rh120_ap", "kj_rh120_he", "kj_rh120_aphe", "kj_rh120_can", "kj_mg3_hand"},
		prerequisites = {"kj_gasoline"},
		unit = {1500,30,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_40kbaneblade",
		recipes = {"kj_40kbaneblade", "kj_baneblade_normal", "kj_baneblade_artillery"},
		prerequisites = {"military-4"},
		unit = {1000,40,1,1,1,1,1,0,0}
	},

	{
		modname = "kj_40kdreadnought",
		recipes = {"kj_40kdreadnought", "kj_40kdreadnought_normal"},
		prerequisites = {"military-4", "kj_gasoline"},
		unit = {750,40,1,1,1,1,0,1,0}
	},

	{
		modname = "kj_40klemanruss",
		recipes = {"kj_40klemanruss", "kj_lemanruss_normal"},
		prerequisites = {},
		unit = {750,30,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_40kpredator",
		recipes = {"kj_40kpredator", "kj_predator_normal"},
		prerequisites = {"tank", "kj_gasoline"},
		unit = {750,30,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_maustank",
		recipes = {"kj_maustank", "kj_120kwk_ap", "kj_120kwk_he", "kj_120kwk_aphe", "kj_mg42_hand"},
		prerequisites = {"kj_gasoline"},
		unit = {1500,30,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_pak",
		recipes = {"kj_pak", "kj_pak_turret", "kj_pak_ap", "kj_pak_he", "kj_pak_inc"},
		prerequisites = {"military-3"},
		unit = {600,40,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_panzer4",
		recipes = {"kj_panzer4", "kj_75kwk40_ap", "kj_75kwk40_he", "kj_75kwk40_aphe", "kj_mg34_hand"},
		prerequisites = {"tank", "kj_gasoline"},
		unit = {700,30,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_rattetank",
		recipes = {"kj_rattetank", "kj_280SKC34_ap", "kj_280SKC34_he", "kj_280SKC34_inc"},
		prerequisites = {"kj_gasoline", "space-science-pack"},
		unit = {2000,60,1,1,1,1,1,1,1}
	},

	{
		modname = "kj_ray",
		recipes = {"kj_ray", "kj_ray_small", "kj_ray_normal", "kj_ray_normal_small"},
		prerequisites = {"military-4", "kj_gasoline", "space-science-pack"},
		unit = {2000,60,1,1,1,1,1,1,1}
	},
	{
		modname = "kj_rex",
		recipes = {"kj_rex", "kj_rex_normal"},
		prerequisites = {"military-4", "kj_gasoline", "space-science-pack"},
		unit = {2000,60,1,1,1,1,1,1,1}
	},
	{
		modname = "kj_swspeeder",
		recipes = {"kj_swspeeder"},
		prerequisites = {"military-4", "kj_energy_cell"},
		unit = {200,30,1,1,1,1,1,0,0}
	},
	{
		modname = "kj_wirbelwind",
		recipes = {"kj_wirbelwind", "kj_2cmfv_normal"},
		prerequisites = {"kj_panzer4"},
		unit = {500,30,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_aventador",
		recipes = {"kj_aventador"},
		prerequisites = {"automobilism", "kj_gasoline"},
		unit = {120,20,1,1,0,1,0,0,0}
	},
	{
		modname = "kj_bulldozer",
		size = 256,
		recipes = {"kj_bulldozer"},
		prerequisites = {"automobilism", "kj_gasoline"},
		unit = {200,20,1,1,0,1,0,0,0}
	},
	{
		modname = "kj_cybertruck",
		recipes = {"kj_cybertruck", "kj_el_charge", "kj_el_charge_recycle_1", "kj_el_charge_recycle_2", "kj_el_charge_recycle_3"},
		prerequisites = {"automobilism", "battery"},
		unit = {200,20,1,1,0,0,0,0,0}
	},
	{
		modname = "kj_delorean",
		recipes = {"kj_delorean"},
		prerequisites = {"automobilism", "kj_gasoline"},
		unit = {75,20,2,2,0,1,0,0,0}
	},
	{
		modname = "kj_firetruck",
		recipes = {"kj_firetruck"},
		prerequisites = {"automobilism", "kj_gasoline"},
		unit = {200,20,1,1,0,1,0,0,0}
	},
	{
		modname = "kj_fordmustang",
		recipes = {"kj_fordmustang"},
		prerequisites = {"automobilism", "kj_gasoline"},
		unit = {90,20,2,2,0,1,0,0,0}
	},
	{
		modname = "kj_gigahorse",
		recipes = {"kj_gigahorse"},
		prerequisites = {"automobilism", "kj_gasoline"},
		unit = {150,20,1,1,0,1,0,0,0}
	},
	{
		modname = "kj_utilitarian",
		recipes = {"kj_utilitarian"},
		prerequisites = {"automobilism", "kj_gasoline"},
		unit = {200,20,1,1,0,1,0,0,0}
	},
	{
		modname = "kj_warrig",
		recipes = {"kj_warrig", "kj_warrig_train", "kj_warrig_wagon", "kj_warrig_wagon_fluid", "kj_warrig_rails"},
		prerequisites = {"automobilism", "kj_gasoline", "railway"},
		unit = {250,20,1,1,0,1,0,0,0}
	},

	{
		modname = "kj_40kbunker",
		recipes = {"kj_40kbunker", "kj_40kbunker_turret"},
		prerequisites = {"military-3"},
		unit = {600,40,1,1,0,1,0,0,0}
	},

	{
		modname = "kj_phalanx",
		size = 256,
		recipes = {"kj_phalanx", "kj_apds_normal", "kj_apds_normal_single"},
		prerequisites = {"military-4"},
		unit = {200,30,1,1,1,1,0,1,0}
	},

	{
		modname = "kj_laser",
		recipes = {"kj_laser", "kj_laser_normal"},
		prerequisites = {"military-4", "laser-turret"},
		unit = {300,30,1,1,1,1,0,1,0}
	},

	{
		modname = "kj_tower",
		recipes = {"kj_tower"},
		prerequisites = {"military-3"},
		unit = {150,30,1,1,1,0,0,0,0}
	},

	{
		modname = "kj_vierling",
		recipes = {"kj_vierling", "kj_2cmfv_normal_vierling"},
		prerequisites = {"military-3"},
		unit = {200,30,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_747",
		recipes = {"kj_747"},
		prerequisites = {"kj_gasoline", "low-density-structure"},
		unit = {1000,30,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_b17",
		recipes = {"kj_b17", "kj_plane_50", "kj_plane_250", "kj_plane_500", "kj_plane_1000", "kj_plane_napalm", "kj_plane_lcal"},
		prerequisites = {"military-3", "kj_gasoline", "low-density-structure"},
		unit = {650,40,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_b29",
		recipes = {"kj_b29", "kj_plane_50", "kj_plane_250", "kj_plane_500", "kj_plane_1000", "kj_plane_atom", "kj_plane_napalm", "kj_plane_lcal"},
		prerequisites = {"military-3", "kj_gasoline", "low-density-structure"},
		unit = {900,40,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_b2",
		recipes = {"kj_b2", "kj_plane_50", "kj_plane_250", "kj_plane_500", "kj_plane_1000", "kj_plane_napalm", "kj_plane_atom"},
		prerequisites = {"military-4", "kj_gasoline", "low-density-structure"},
		unit = {1500,50,1,1,1,1,0,1,0}
	},

	{
		modname = "kj_bf109",
		recipes = {"kj_bf109", "kj_plane_lcal", "kj_plane_hcal"},
		prerequisites = {"military-3", "kj_gasoline", "low-density-structure"},
		unit = {350,30,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_ho229",
		recipes = {"kj_ho229", "kj_plane_lcal", "kj_plane_hcal"},
		prerequisites = {"military-3", "kj_gasoline", "low-density-structure"},
		unit = {500,30,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_ju52",
		recipes = {"kj_ju52"},
		prerequisites = {"lubricant", "kj_gasoline", "low-density-structure"},
		unit = {350,20,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_ju87",
		recipes = {"kj_ju87", "kj_plane_50", "kj_plane_250", "kj_plane_500", "kj_plane_1000", "kj_plane_lcal"},
		prerequisites = {"military-3", "kj_gasoline", "low-density-structure"},
		unit = {500,30,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_jug38",
		recipes = {"kj_jug38"},
		prerequisites = {"military-3", "kj_gasoline", "low-density-structure"},
		unit = {600,20,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_xb35",
		recipes = {"kj_xb35", "kj_plane_50", "kj_plane_250", "kj_plane_500", "kj_plane_1000", "kj_plane_napalm", "kj_plane_atom"},
		prerequisites = {"military-3", "kj_gasoline", "low-density-structure"},
		unit = {1000,50,1,1,1,1,0,0,0}
	},
}

local sciencePacks = {
	"automation-science-pack",
	"logistic-science-pack",
	"military-science-pack",
	"chemical-science-pack",
	"production-science-pack",
	"utility-science-pack",
	"space-science-pack"
}

local function techIngred(unit)
	local ingredients = {}
    for i = 3, 9, 1 do
		if unit[i] > 0 then
			table.insert(ingredients, {sciencePacks[i-2], unit[i]})
		end
	end

	return ingredients
end

for _, tech in pairs(technologies) do
    if mods[tech.modname] then
        local name = tech.name or tech.modname
		local effects = {}

		local unit = {
			count = tech.unit[1],
			time = tech.unit[2],
			ingredients = techIngred(tech.unit)
		}

		for _, recipe in pairs(tech.recipes) do
			table.insert(effects,{type = "unlock-recipe", recipe = recipe})
		end

        data:extend({
            {
                type = "technology",
                name = name,
                icon = "__"..tech.modname.."__/graphics/technology.png",
                icon_size = tech.size or 128,
                effects = effects,
                prerequisites = tech.prerequisites,
                unit = unit,
                order = tables.supportedMods[tech.modname].order,
            },
        })
    end
end