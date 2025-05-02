local tables = {}
tables.supportedMods = {
	kj_2a6 = 			{name = "2a6", 			car = true,		weight = 5,		order = "2[military]-p5"},
	kj_40kbaneblade = 	{name = "baneblade", 	car = true,		weight = 3,		order = "2[military]-40k-3"},
	kj_40kdreadnought =	{name = "dreadnought", 	car = true,		weight = 2,		order = "2[military]-40k-4"},
	kj_40klemanruss = 	{name = "lemanruss", 	car = true,		weight = 2,		order = "2[military]-40k-2"},
	kj_40kpredator = 	{name = "predator", 	car = true,		weight = 2,		order = "2[military]-40k-1"},
	kj_maustank = 		{name = "maus", 		car = true,		weight = 4,		order = "2[military]-p4"},
	kj_pak = 			{name = "pak", 			car = true,		weight = 5,		order = "2[military]-p1"},
	kj_panzer4 = 		{name = "panzer4", 		car = true,		weight = 4,		order = "2[military]-p2"},
	kj_rex = 			{name = "rex", 			car = true,		weight = 2,		order = "2[military]-ra"},
	kj_rattetank = 		{name = "ratte", 		car = true,		weight = 4,		order = "2[military]-p6"},
	kj_ray = 			{name = "ray", 			car = true,		weight = 4,		order = "2[military]-re"},
	kj_swspeeder = 		{name = "swspeeder", 	car = true,		weight = 1,		order = "2[military]-s"},
	kj_wirbelwind = 	{name = "wirbelwind", 	car = true,		weight = 2,		order = "2[military]-p3"},

	kj_aventador = 		{name = "aventador", 	car = true,		weight = 1,		order = "1[civil]-d"},
	kj_bulldozer = 		{name = "bulldozer", 	car = true,		weight = 1,		order = "1[civil]-f"},
	kj_cybertruck = 	{name = "cybertruck", 	car = true,		weight = 5,		order = "1[civil]-c0"},
	kj_delorean = 		{name = "delorean", 	car = true,		weight = 1,		order = "1[civil]-a"},
	kj_firetruck = 		{name = "firetruck", 	car = true,		weight = 1,		order = "1[civil]-g"},
	kj_fordmustang = 	{name = "mustang", 		car = true,		weight = 1,		order = "1[civil]-b"},
	kj_gigahorse = 		{name = "gigahorse", 	car = true,		weight = 1,		order = "1[civil]-e"},
	kj_utilitarian = 	{name = "utilitarian", 	car = true,		weight = 1,		order = "1[civil]-h"},
	kj_warrig = 		{name = "warrig", 		car = true,		weight = 5,		order = "1[civil]-i"},

	kj_40kbunker = 		{name = "bunker",		car = true,		weight = 2,		order = "3[military-turrets]-n-2"},
	kj_laser = 			{name = "laser", 		car = false,	weight = 1,		order = "3[military-turrets]-n-3"},
	kj_medieval_warfare={name = "medieval",		car = false,	weight = 2,		order = "3[military-turrets]-aa-1"},
	kj_phalanx = 		{name = "phalanx", 		car = false,	weight = 3,		order = "3[military-turrets]-aa-3"},
	kj_tower = 			{name = "tower", 		car = false,	weight = 1,		order = "3[military-turrets]-n-1"},
	kj_vierling = 		{name = "vierling", 	car = false,	weight = 3,		order = "3[military-turrets]-aa-2"},

	kj_747 = 			{name = "747", 		car = true,		weight = 1,		order = "4[aviation]-t-3"},
	kj_b17 = 			{name = "b17", 		car = true,		weight = 1,		order = "4[aviation]-b-2"},
	kj_b2 = 			{name = "b2", 		car = true,		weight = 1,		order = "4[aviation]-b-5"},
	kj_b29 = 			{name = "b29", 		car = true,		weight = 1,		order = "4[aviation]-b-3"},
	kj_bf109 = 			{name = "bf109", 	car = true,		weight = 1,		order = "4[aviation]-f-1"},
	kj_ho229 = 			{name = "ho229", 	car = true,		weight = 1,		order = "4[aviation]-f-2"},
	kj_ju52 = 			{name = "ju52", 	car = true,		weight = 1,		order = "4[aviation]-t-1"},
	kj_ju87 = 			{name = "ju87", 	car = true,		weight = 1,		order = "4[aviation]-b-1"},
	kj_jug38 = 			{name = "jug38", 	car = true,		weight = 1,		order = "4[aviation]-t-2"},
	kj_xb35 = 			{name = "xb35", 	car = true,		weight = 1,		order = "4[aviation]-b-4"},
}

tables.balancedModsRecipe = {
	kj_2a6 = {true, true},
	kj_40kbaneblade = {true, true},
	kj_40kdreadnought = {true, true},
	kj_40klemanruss = {true, true},
	kj_40kpredator = {true, true},
	kj_aventador = true,
	kj_bulldozer = true,
	kj_cybertruck = true,
	kj_delorean = true,
	kj_firetruck = true,
	kj_fordmustang = true,
	kj_gigahorse = true,
	kj_maustank = {true, true},
	kj_pak = {true, true},
	kj_panzer4 = {true, true},
	kj_rattetank = {true, true},
	kj_ray = {true, true},
	kj_rex = {true, true},
	kj_swspeeder = true,
	kj_utilitarian = true,
	kj_warrig = true,
	kj_wirbelwind = {true, true},

	kj_40kbunker = true,
	kj_laser = true,
	kj_medieval_warfare = {true, true},
	kj_phalanx = true,
	kj_tower = true,
	kj_vierling = true,

	kj_747 = true,
	kj_b17 = true,
	kj_b2 = true,
	kj_b29 = true,
	kj_bf109 = true,
	kj_ho229 = true,
	kj_ju52 = true,
	kj_ju87 = true,
	kj_jug38 = true,
	kj_xb35 = true,
}

tables.balancedMods = {
	kj_2a6 = 			true,
	kj_40kbaneblade = 	true,
	kj_40kdreadnought = true,
	kj_40klemanruss = 	true,
	kj_40kpredator = 	true,
	kj_maustank = 		true,
	kj_pak = 			{{name = "kj_pak"}, {name = "kj_pak_turret"}},
	kj_panzer4 = 		true,
	kj_rex = 			true,
	kj_rattetank = 		true,
	kj_ray = 			{{name = "kj_ray"}, {name = "kj_ray_water"}, {name = "kj_ray_small"}, {name = "kj_ray_water_small"}},
	kj_swspeeder = 		true,
	kj_wirbelwind = 	true,

	kj_aventador = 		true,
	kj_bulldozer = 		true,
	kj_cybertruck = 	true,
	kj_delorean = 		true,
	kj_firetruck = 		true,
	kj_fordmustang = 	true,
	kj_utilitarian = 	true,
	kj_gigahorse = 		true,
	kj_warrig = 		{{name = "kj_warrig"},
						{name = "kj_warrig_train", type = "locomotive"},
						{name = "kj_warrig_wagon", type = "cargo-wagon"},
						{name = "kj_warrig_wagon_fluid", type = "fluid-wagon"}},

	kj_747 = 		true,
	kj_b17 = 		true,
	kj_b2 = 		true,
	kj_b29 = 		true,
	kj_bf109 = 		true,
	kj_ho229 = 		true,
	kj_ju52 = 		true,
	kj_ju87 = 		true,
	kj_jug38 = 		true,
	kj_xb35 = 		true,

	kj_40kbunker = 	{{name = "kj_40kbunker"}, {name = "kj_40kbunker_turret"}},
	kj_laser = 		true,
	kj_medieval_warfare =	{{name = "kj_ballista"}, {name = "kj_ballista_nonAA", setting = "kj_ballista_nonAA"}},
	kj_phalanx = 	{{name = "kj_phalanx"}, {name = "kj_phalanx_nonAA", setting = "kj_phalanx_nonAA"}},
	kj_tower = 		true,
	kj_vierling = 	{{name = "kj_vierling"}, {name = "kj_vierling_nonAA", setting = "kj_vierling_nonAA"}},
}

tables.airborneMods = {
	          --50kg   250kg  500gk  1000   atom   LCal   HCal   napalm
	kj_747   = {false, false, false, false, false, false, false, false},
	kj_b17   = {true,  true,  true,  true,  false, true,  false, true},
	kj_b2 	 = {true,  true,  true,  true,  true , false, false, true},
	kj_b29   = {true,  true,  true,  true,  true , true,  false, true},
	kj_bf109 = {false, false, false, false, false, true,  true , false},
	kj_ho229 = {false, false, false, false, false, true, true , false},
	kj_ju52  = {false, false, false, false, false, false, false, false},
	kj_ju87  = {true,  true,  true,  true,  false, true,  false, false},
	kj_jug38 = {false, false, false, false, false, false, false, false},
	kj_xb35  = {true,  true,  true,  true,  true , false, false, true},
}

tables.techRequisites = {
	kj_b29 = {
		pres = {
			"kj_b17"
		},
		multiplicator = 0.75,
	},
	kj_xb35 = {
		pres = {
			"kj_b29",
			"kj_b17"
		},
		multiplicator = 0.75,
		additional = {"kj_ho229"}
	},
	kj_b2 = {
		pres = {
			"kj_xb35",
			"kj_b29",
			"kj_b17"
		},
		multiplicator = 0.75,
		additional = {"kj_ho229", "military-4"}
	},

	kj_ho229 = {
		pres = {
			"kj_bf109"
		},
		multiplicator = 0.75,
	},

	kj_ju52 = {
		pres = {
			"kj_ju87"
		},
		multiplicator = 0.75,
	},
	kj_jug38 = {
		pres = {
			"kj_ju52",
			"kj_ju87"
		},
		multiplicator = 0.75,
	},
	kj_747 = {
		pres = {
			"kj_jug38",
			"kj_ju52",
			"kj_ju87"
		},
		multiplicator = 0.75,
	},
}

tables.recipeChanges = {
	{modname = "modname", entries = {
			{recipe = "test", setting = "test"},
		}
	},

	{modname = "kj_2a6", entries = {
			{recipe = "kj_2a6", setting = "kj_2a6_cost_setting_multiplicator"},
			{recipe = "kj_rh120_ap", setting = "kj_2a6ammo_cost_setting_multiplicator"},
			{recipe = "kj_rh120_he", setting = "kj_2a6ammo_cost_setting_multiplicator"},
			{recipe = "kj_rh120_aphe", setting = "kj_2a6ammo_cost_setting_multiplicator"},
			{recipe = "kj_rh120_can", setting = "kj_2a6ammo_cost_setting_multiplicator"},
		}
	},

	{modname = "kj_40kdreadnought", entries = {
			{recipe = "kj_40kdreadnought", setting = "kj_40kdreadnought_cost_setting_multiplicator"},
			{recipe = "kj_40kdreadnought_normal", setting = "kj_40kdreadnoughtammo_cost_setting_multiplicator"},
		}
	},

	{modname = "kj_40klemanruss", entries = {
			{recipe = "kj_40klemanruss", setting = "kj_40klemanruss_cost_setting_multiplicator"},
			{recipe = "kj_lemanruss_normal", setting = "kj_40klemanrussammo_cost_setting_multiplicator"},
		}
	},

	{modname = "kj_40klemanruss", entries = {
			{recipe = "kj_40klemanruss", setting = "kj_40klemanruss_cost_setting_multiplicator"},
			{recipe = "kj_lemanruss_normal", setting = "kj_40klemanrussammo_cost_setting_multiplicator"},
		}
	},

	{modname = "kj_40kpredator", entries = {
			{recipe = "kj_40kpredator", setting = "kj_40kpredator_cost_setting_multiplicator"},
			{recipe = "kj_predator_normal", setting = "kj_40kpredatorammo_cost_setting_multiplicator"},
		}
	},

	{modname = "kj_maustank", entries = {
			{recipe = "kj_maustank", setting = "kj_maustank_cost_setting_multiplicator"},
			{recipe = "kj_120kwk_ap", setting = "kj_maustankammo_cost_setting_multiplicator"},
			{recipe = "kj_120kwk_he", setting = "kj_maustankammo_cost_setting_multiplicator"},
			{recipe = "kj_120kwk_aphe", setting = "kj_maustankammo_cost_setting_multiplicator"},
		}
	},

	{modname = "kj_pak", entries = {
			{recipe = "kj_pak", setting = "kj_pak_cost_setting_multiplicator"},
			{recipe = "kj_pak_turret", setting = "kj_pak_cost_setting_multiplicator"},
			{recipe = "kj_pak_ap", setting = "kj_pakammo_cost_setting_multiplicator"},
			{recipe = "kj_pak_he", setting = "kj_pakammo_cost_setting_multiplicator"},
			{recipe = "kj_pak_inc", setting = "kj_pakammo_cost_setting_multiplicator"},
		}
	},

	{modname = "kj_panzer4", entries = {
			{recipe = "kj_panzer4", setting = "kj_panzer4_cost_setting_multiplicator"},
			{recipe = "kj_75kwk40_ap", setting = "kj_panzer4ammo_cost_setting_multiplicator"},
			{recipe = "kj_75kwk40_he", setting = "kj_panzer4ammo_cost_setting_multiplicator"},
			{recipe = "kj_75kwk40_aphe", setting = "kj_panzer4ammo_cost_setting_multiplicator"},
		}
	},

	{modname = "kj_rex", entries = {
			{recipe = "kj_rex", setting = "kj_rex_cost_setting_multiplicator"},
			{recipe = "kj_rex_normal", setting = "kj_rexammo_cost_setting_multiplicator"},
		}
	},

	{modname = "kj_rattetank", entries = {
			{recipe = "kj_rattetank", setting = "kj_rattetank_cost_setting_multiplicator"},
			{recipe = "kj_280SKC34_ap", setting = "kj_rattetankammo_cost_setting_multiplicator"},
			{recipe = "kj_280SKC34_he", setting = "kj_rattetankammo_cost_setting_multiplicator"},
			{recipe = "kj_280SKC34_inc", setting = "kj_rattetankammo_cost_setting_multiplicator"},
		}
	},

	{modname = "kj_ray", entries = {
			{recipe = "kj_ray", setting = "kj_ray_cost_setting_multiplicator"},
			{recipe = "kj_ray_small", setting = "kj_ray_cost_setting_multiplicator"},
			{recipe = "kj_ray_normal", setting = "kj_rayammo_cost_setting_multiplicator"},
		}
	},

	{modname = "kj_swspeeder"},

	{modname = "kj_wirbelwind", entries = {
			{recipe = "kj_wirbelwind", setting = "kj_wirbelwind_cost_setting_multiplicator"},
			{recipe = "kj_75kwk40_ap", setting = "kj_wirbelwindammo_cost_setting_multiplicator"},
			{recipe = "kj_75kwk40_he", setting = "kj_wirbelwindammo_cost_setting_multiplicator"},
			{recipe = "kj_75kwk40_aphe", setting = "kj_wirbelwindammo_cost_setting_multiplicator"},
		}
	},

	{modname = "kj_aventador"},
	{modname = "kj_bulldozer"},
	{modname = "kj_cybertruck"},
	{modname = "kj_delorean"},
	{modname = "kj_firetruck"},
	{modname = "kj_fordmustang"},
	{modname = "kj_gigahorse"},
	{modname = "kj_utilitarian"},

	{modname = "kj_40kbunker", entries = {
			{recipe = "kj_40kbunker", setting = "kj_40kbunker_cost_setting_multiplicator"},
			{recipe = "kj_40kbunker_turret", setting = "kj_40kbunker_cost_setting_multiplicator"},
		},
	},

	{modname = "kj_laser"},

	{modname = "kj_phalanx", entries = {
			{recipe = "kj_phalanx", setting = "kj_phalanx_cost_setting_multiplicator"},
			{recipe = "kj_apds_normal", setting = "kj_phalanx_cost_setting_multiplicator"},
		},
	},
	{modname = "kj_medieval_warfare", entries = {
			{recipe = "kj_ballista", setting = "kj_medieval_warfare_cost_setting_multiplicator"},
			{recipe = "kj_ballista_normal", setting = "kj_medieval_warfareammo_cost_setting_multiplicator"},
		},
	},

	{modname = "kj_tower"},

	{modname = "kj_vierling", entries = {
			{recipe = "kj_vierling", setting = "kj_vierling_cost_setting_multiplicator"},
			{recipe = "kj_2cmfv_normal_vierling", setting = "kj_vierling_cost_setting_multiplicator"},
		},
	},

	{modname = "kj_warrig", entries = {
			{recipe = "kj_warrig", setting = "kj_warrig_cost_setting_multiplicator"},
			{recipe = "kj_warrig_train", setting = "kj_warrig_cost_setting_multiplicator"},
			{recipe = "kj_warrig_wagon", setting = "kj_warrig_cost_setting_multiplicator"},
			{recipe = "kj_warrig_wagon_fluid", setting = "kj_warrig_cost_setting_multiplicator"},
			{recipe = "kj_warrig_rails", setting = "kj_warrig_cost_setting_multiplicator"},
		},
	},

	{modname = "kj_747"},
	{modname = "kj_b17"},
	{modname = "kj_b2"},
	{modname = "kj_b29"},
	{modname = "kj_bf109"},
	{modname = "kj_ho229"},
	{modname = "kj_ju52"},
	{modname = "kj_ju87"},
	{modname = "kj_jug38"},
	{modname = "kj_xb35"},
}

tables.categories = {
	{modname = "kj_cybertruck",		name = "kj_el_car_fuel",                                type = "fuel-category"},

	{modname = "kj_2a6",            name = "kj_rh120",               order = "kj-p7",       type = "ammo-category", icon = "cannon"},
	{modname = "kj_40kbaneblade",   name = "kj_baneblade",           order = "kj-40k-3a",   type = "ammo-category", icon = "cannon"},
	{modname = "kj_40kbaneblade",   name = "kj_baneblade_artillery", order = "kj-40k-3b",   type = "ammo-category", icon = "artillery"},
	{modname = "kj_40kdreadnought", name = "kj_dreadnought_cannon",  order = "kj-40k-4",    type = "ammo-category", icon = "cannon"},
	{modname = "kj_40klemanruss",   name = "kj_lemanruss",           order = "kj-40k-2",    type = "ammo-category", icon = "cannon"},
	{modname = "kj_40kpredator",    name = "kj_predator",            order = "kj-40k-1",    type = "ammo-category", icon = "cannon"},
	{modname = "kj_maustank",       name = "kj_128kwk",              order = "kj-p6",       type = "ammo-category", icon = "cannon"},
	{modname = "kj_pak",                                             order = "kj-p1",       type = "ammo-category", icon = "cannon"},
	{modname = "kj_panzer4",        name = "kj_75kwk40",             order = "kj-p2",       type = "ammo-category", icon = "cannon"},
	{modname = "kj_rattetank",      name = "kj_280SKC34",            order = "kj-p6",       type = "ammo-category", icon = "cannon"},
	{modname = "kj_ray",            name = "kj_ray_cannon",          order = "kj-ra",       type = "ammo-category", icon = "cannon"},
	{modname = "kj_ray",            name = "kj_ray_cannon_small",    order = "kj-rb",       type = "ammo-category", icon = "cannon"},
	{modname = "kj_rex",            name = "kj_rex_cannon",          order = "kj-rc",       type = "ammo-category", icon = "cannon"},
	{modname = "kj_rex",            name = "kj_rex_laser",           order = "kj-rd",       type = "ammo-category", icon = "laser",  hidden = true},
	{modname = "kj_swspeeder",                                       order = "kj-s",        type = "ammo-category", icon = "cannon", hidden = true},
	{modname = "kj_wirbelwind",     name = "kj_2cmfv",               order = "kj-p3",       type = "ammo-category", icon = "bullet"},

	{modname = "kj_bulldozer",                                       order = "kj-a",   		type = "ammo-category", hidden = true},

	{modname = "kj_medieval_warfare",name = "kj_ballista_normal",	order = "kj-t1",       type = "ammo-category", icon = "unique"},
	{modname = "kj_laser",     		name = "kj_laser",				order = "kj-t4",       type = "ammo-category", icon = "unique"},
	{modname = "kj_phalanx",     	name = "kj_apds_phalanx",		order = "kj-t3",       type = "ammo-category", icon = "unique"},
	{modname = "kj_vierling",     	name = "kj_2cmfv_vierling",		order = "kj-t2",       type = "ammo-category", icon = "unique"},
}

tables.categoriesUpdates = {
	kj_2a6 = 			{modname = "kj_2a6",			name = "kj_tanks",			order = "d", group = "logistics", type = "item-subgroup"},
	kj_40kbaneblade = 	{modname = "kj_40kbaneblade",   name = "kj_wh40k",			order = "e", group = "logistics", type = "item-subgroup"},
	kj_40kdreadnought = {modname = "kj_40kdreadnought", name = "kj_wh40k",			order = "e", group = "logistics", type = "item-subgroup"},
	kj_40klemanruss = 	{modname = "kj_40klemanruss",   name = "kj_wh40k",			order = "e", group = "logistics", type = "item-subgroup"},
	kj_40kpredator = 	{modname = "kj_40kpredator",    name = "kj_wh40k",			order = "e", group = "logistics", type = "item-subgroup"},
	kj_maustank = 		{modname = "kj_maustank",       name = "kj_tanks",			order = "d", group = "logistics", type = "item-subgroup"},
	kj_pak = 			{modname = "kj_pak",            name = "kj_tanks",			order = "d", group = "logistics", type = "item-subgroup"},
	kj_panzer4 = 		{modname = "kj_panzer4",        name = "kj_tanks",			order = "d", group = "logistics", type = "item-subgroup"},
	kj_rex = 			{modname = "kj_rex",      		name = "kj_fantasy",		order = "f", group = "logistics", type = "item-subgroup"},
	kj_rattetank = 		{modname = "kj_rattetank",      name = "kj_tanks",			order = "f", group = "logistics", type = "item-subgroup"},
	kj_ray = 			{modname = "kj_ray",            name = "kj_fantasy",		order = "f", group = "logistics", type = "item-subgroup"},
	kj_swspeeder = 		{modname = "kj_swspeeder",      name = "kj_fantasy",  		order = "f", group = "logistics", type = "item-subgroup"},
	kj_wirbelwind = 	{modname = "kj_wirbelwind",     name = "kj_tanks",			order = "d", group = "logistics", type = "item-subgroup"},

	kj_aventador = 		{modname = "kj_aventador",		name = "kj_civils",         order = "a", group = "logistics", type = "item-subgroup"},
	kj_bulldozer = 		{modname = "kj_bulldozer",		name = "kj_trucks",         order = "b", group = "logistics", type = "item-subgroup"},
	kj_cybertruck = 	{modname = "kj_cybertruck",		name = "kj_civils",  		order = "a", group = "logistics", type = "item-subgroup"},
	kj_delorean = 		{modname = "kj_delorean",		name = "kj_civils",   		order = "a", group = "logistics", type = "item-subgroup"},
	kj_firetruck = 		{modname = "kj_firetruck",		name = "kj_trucks",     	order = "b", group = "logistics", type = "item-subgroup"},
	kj_fordmustang = 	{modname = "kj_gigahorse",		name = "kj_trucks",     	order = "b", group = "logistics", type = "item-subgroup"},
	kj_gigahorse = 		{modname = "kj_fordmustang",	name = "kj_civils",         order = "a", group = "logistics", type = "item-subgroup"},
	kj_utilitarian = 	{modname = "kj_utilitarian",	name = "kj_trucks",     	order = "b", group = "logistics", type = "item-subgroup"},
	kj_warrig = 		{modname = "kj_warrig",			name = "kj_trucks",     	order = "b", group = "logistics", type = "item-subgroup"},

	kj_40kbunker = 		{modname = "kj_40kbunker",		name = "kj_turrets",     	order = "g", group = "logistics", type = "item-subgroup"},
	kj_laser = 			{modname = "kj_laser",			name = "kj_turrets",     	order = "g", group = "logistics", type = "item-subgroup"},
	kj_medieval_warfare={modname = "kj_medieval_warfare",name = "kj_turrets",     	order = "g", group = "logistics", type = "item-subgroup"},
	kj_phalanx = 		{modname = "kj_phalanx",		name = "kj_turrets",     	order = "g", group = "logistics", type = "item-subgroup"},
	kj_tower = 			{modname = "kj_tower",			name = "kj_turrets",     	order = "g", group = "logistics", type = "item-subgroup"},
	kj_vierling = 		{modname = "kj_vierling",		name = "kj_turrets",     	order = "g", group = "logistics", type = "item-subgroup"},

	kj_747 = 			{modname = "kj_747",			name = "kj_planes",     	order = "h", group = "logistics", type = "item-subgroup"},
	kj_b17 = 			{modname = "kj_b17",			name = "kj_planes",     	order = "h", group = "logistics", type = "item-subgroup"},
	kj_b2 = 			{modname = "kj_b2",				name = "kj_planes",     	order = "h", group = "logistics", type = "item-subgroup"},
	kj_b29 = 			{modname = "kj_b29",			name = "kj_planes",     	order = "h", group = "logistics", type = "item-subgroup"},
	kj_bf109 = 			{modname = "kj_bf109",			name = "kj_planes",     	order = "h", group = "logistics", type = "item-subgroup"},
	kj_ho229 = 			{modname = "kj_ho229",			name = "kj_planes",     	order = "h", group = "logistics", type = "item-subgroup"},
	kj_ju52 = 			{modname = "kj_ju52",			name = "kj_planes",     	order = "h", group = "logistics", type = "item-subgroup"},
	kj_ju87 = 			{modname = "kj_ju87",			name = "kj_planes",     	order = "h", group = "logistics", type = "item-subgroup"},
	kj_jug38 = 			{modname = "kj_jug38",			name = "kj_planes",     	order = "h", group = "logistics", type = "item-subgroup"},
	kj_xb35 = 			{modname = "kj_xb35",			name = "kj_planes",     	order = "h", group = "logistics", type = "item-subgroup"},
}

tables.items = {
	kj_2a6 = 			{weight = 2000},
	kj_40kbaneblade = 	{weight = 2000},
	kj_40kdreadnought = {weight = 2000},
	kj_40klemanruss = 	{weight = 2000},
	kj_40kpredator = 	{weight = 2000},
	kj_maustank = 		{weight = 2000},
	kj_pak = 			{														order = "2[military]-p1a"},
	kj_pak2 = 			{modname = "kj_pak", 			name = "kj_pak_turret", order = "2[military]-p1b",		subgroup = "turret"},
	kj_panzer4 = 		{},
	kj_rex = 			{weight = 2000,											order = "2[military]-r"},
	kj_rattetank = 		{weight = 2000},
	kj_ray = 			{weight = 2000,											order = "2[military]-r-n[normal]"},
	kj_ray2 = 			{weight = 2000,modname = "kj_ray",name = "kj_ray_small",order = "2[military]-r-s[small]",	icon = "icon_small"},
	kj_swspeeder = 		{},
	kj_wirbelwind = 	{},

	kj_aventador = 		{},
	kj_bulldozer = 		{},
	kj_cybertruck = 	{},
	kj_delorean = 		{},
	kj_firetruck = 		{},
	kj_fordmustang = 	{},
	kj_gigahorse = 		{},
	kj_utilitarian = 	{},
	kj_warrig = 		{weight = 2000,				           							order = "1[civil]-i0"},
	kj_warrig2 = 		{weight = 2000, modname = "kj_warrig", name = "kj_warrig_train", order = "1[civil]-i1", icon = "train"},
	kj_warrig3 = 		{weight = 2000, modname = "kj_warrig", name = "kj_warrig_wagon", order = "1[civil]-i2", icon = "wagon"},
	kj_warrig4 = 		{weight = 2000, modname = "kj_warrig", name = "kj_warrig_wagon_fluid", order = "1[civil]-i3", icon = "wagon_fluid"},

	kj_40kbunker = 		{weight = 2000,					                    	order = "3[military-turrets]-n-2-1"},
	kj_40kbunker2 =		{weight = 2000, modname = "kj_40kbunker", name = "kj_40kbunker_turret",order = "3[military-turrets]-n-2-2",	subgroup = "turret"},
	kj_phalanx = 		{weight = 200, stackSize = 10,							order = "3[military-turrets]-aa-3",		subgroup = "turret"},
	kj_laser = 			{weight = 100, stackSize = 10,	                    	order = "3[military-turrets]-n-3",		subgroup = "turret"},
	kj_medieval_warfare={weight = 20,  stackSize = 10,name = "kj_ballista",		order = "3[military-turrets]-aa-1",		subgroup = "turret"},
	kj_tower = 			{weight = 200, stackSize = 5,                    		order = "3[military-turrets]-n-1",		subgroup = "turret"},
	kj_vierling = 		{weight = 100, stackSize = 10,modname = "kj_vierling",	order = "3[military-turrets]-aa-2",		subgroup = "turret"},

	kj_747 = 			{weight = 2000},
	kj_b17 = 			{weight = 2000},
	kj_b2 = 			{weight = 2000},
	kj_b29 = 			{weight = 2000},
	kj_bf109 = 			{weight = 2000},
	kj_ho229 = 			{weight = 2000},
	kj_ju52 = 			{weight = 2000},
	kj_ju87 = 			{weight = 2000},
	kj_jug38 = 			{weight = 2000},
	kj_xb35 = 			{weight = 2000},
}

tables.ammoRecipe = {
	time = {
		kj_rh120_ap = 12,
		kj_rh120_he = 12,
		kj_rh120_aphe = 12,
		kj_rh120_can = 12,

		kj_120kwk_ap = 12,
		kj_120kwk_he = 12,
		kj_120kwk_aphe = 12,

		kj_280SKC34_ap = 25,
		kj_280SKC34_he = 24,
		kj_280SKC34_inc = 20,

		kj_40kdreadnought_normal = 12,
		kj_baneblade_artillery = 9,

		kj_75kwk40_ap = 8,
		kj_75kwk40_he = 8,
		kj_75kwk40_aphe = 8,

		kj_apds_normal_single = 1.5,

		kj_baneblade_normal = 18,

		kj_lemanruss_normal = 15,

		kj_pak_ap = 10,
		kj_pak_he = 9,
		kj_pak_inc = 9,

		kj_predator_normal = 9,

		kj_ray_normal = 45,
		kj_ray_normal_small = 15,

		kj_rex_normal = 45,

		kj_2cmfv_normal = 4,
		kj_2cmfv_normal_vierling = 4,
	},
	steel = {
		kj_rh120_ap = 4,
		kj_rh120_he = 4,
		kj_rh120_can = 6,

		kj_baneblade_normal = 7,
		kj_baneblade_artillery = 3,

		kj_40kdreadnought_normal = 4,

		kj_lemanruss_normal = 6,

		kj_120kwk_ap = 4,
		kj_120kwk_he = 4,
		kj_120kwk_aphe = 4,

		kj_pak_ap = 3,
		kj_pak_he = 3,
		kj_pak_inc = 2,

		kj_75kwk40_ap = 2,
		kj_75kwk40_he = 2,
		kj_75kwk40_aphe = 3,

		kj_predator_normal = 3,

		kj_280SKC34_ap = 10,
		kj_280SKC34_he = 8,
		kj_280SKC34_inc = 4,

		kj_ray_normal = 20,
		kj_ray_normal_small = 7,

		kj_rex_normal = 20,

		kj_2cmfv_normal_vierling = 1,
		kj_2cmfv_normal = 1,

		kj_apds_normal_single = 3,
	},
	plastic = {
		kj_rh120_ap = 4,
		kj_rh120_he = 4,
		kj_rh120_can = 3,

		kj_baneblade_normal = 7,
		kj_baneblade_artillery = 3,

		kj_40kdreadnought_normal = 4,

		kj_lemanruss_normal = 6,

		kj_120kwk_ap = 4,
		kj_120kwk_he = 4,
		kj_120kwk_aphe = 4,

		kj_pak_ap = 3,
		kj_pak_he = 3,
		kj_pak_inc = 2,

		kj_75kwk40_ap = 2,
		kj_75kwk40_he = 2,
		kj_75kwk40_aphe = 3,

		kj_predator_normal = 3,

		kj_280SKC34_ap = 10,
		kj_280SKC34_he = 8,
		kj_280SKC34_inc = 4,

		kj_ray_normal = 20,
		kj_ray_normal_small = 7,

		kj_rex_normal = 20,

		kj_2cmfv_normal = 1,
		kj_2cmfv_normal_vierling = 1,
	},
	explosive = {
		kj_rh120_ap = 3,
		kj_rh120_he = 4,
		kj_rh120_can = 3,

		kj_baneblade_normal = 5,
		kj_baneblade_artillery = 3,

		kj_40kdreadnought_normal = 4,

		kj_lemanruss_normal = 4,

		kj_120kwk_ap = 3,
		kj_120kwk_he = 4,
		kj_120kwk_aphe = 4,

		kj_pak_ap = 2,
		kj_pak_he = 3,
		kj_pak_inc = 2,

		kj_75kwk40_ap = 2,
		kj_75kwk40_he = 3,
		kj_75kwk40_aphe = 3,

		kj_predator_normal = 3,

		kj_280SKC34_ap = 5,
		kj_280SKC34_he = 8,
		kj_280SKC34_inc = 4,

		kj_ray_normal = 5,
		kj_ray_normal_small = 2,

		kj_rex_normal = 5,

		kj_2cmfv_normal = 2,
		kj_2cmfv_normal_vierling = 2,

		kj_apds_normal_single = 1,
	},
	sulfur = {
		kj_280SKC34_inc = 8,
		kj_pak_inc = 3,
	},
	copper = {
		kj_apds_normal_single = 1,
	},
}

tables.recipes = {
	kj_2a6 = {
		{type = "item", name = "advanced-circuit", 		amount = 70},
		{type = "item", name = "engine-unit", 			amount = 135},
		{type = "item", name = "iron-gear-wheel", 		amount = 135},
		{type = "item", name = "low-density-structure", amount = 200},
		{type = "item", name = "processing-unit",		amount = 50},
		{type = "item", name = "steel-plate",			amount = 450},
	},
	kj_40kbaneblade = {
		{type = "item", name = "advanced-circuit", 		amount = 100},
		{type = "item", name = "engine-unit", 			amount = 200},
		{type = "item", name = "iron-gear-wheel", 		amount = 300},
		{type = "item", name = "low-density-structure", amount = 100},
		{type = "item", name = "processing-unit", 		amount = 50},
		{type = "item", name = "steel-plate", 			amount = 1000},
	},
	kj_40kdreadnought = {
		{type = "item", name = "engine-unit", 			amount = 100},
		{type = "item", name = "iron-gear-wheel", 		amount = 100},
		{type = "item", name = "low-density-structure", amount = 200},
		{type = "item", name = "processing-unit", 		amount = 60},
		{type = "item", name = "steel-plate", 			amount = 225},
	},
	kj_40klemanruss = {
		{type = "item", name = "advanced-circuit", 		amount = 30},
		{type = "item", name = "engine-unit", 			amount = 100},
		{type = "item", name = "iron-gear-wheel", 		amount = 100},
		{type = "item", name = "steel-plate", 			amount = 225},
	},
	kj_40kpredator = {
		{type = "item", name = "advanced-circuit", 		amount = 30},
		{type = "item", name = "engine-unit", 			amount = 100},
		{type = "item", name = "iron-gear-wheel", 		amount = 100},
		{type = "item", name = "steel-plate", 			amount = 225},
	},
	kj_maustank = {
		{type = "item", name = "advanced-circuit", 		amount = 50},
		{type = "item", name = "engine-unit", 			amount = 150},
		{type = "item", name = "iron-gear-wheel", 		amount = 150},
		{type = "item", name = "steel-plate", 			amount = 500},
	},
	kj_pak = {
		{type = "item", name = "engine-unit", 			amount = 3},
		{type = "item", name = "iron-gear-wheel", 		amount = 5},
		{type = "item", name = "steel-plate", 			amount = 25},
	},
	kj_panzer4 = {
		{type = "item", name = "advanced-circuit", 		amount = 20},
		{type = "item", name = "engine-unit", 			amount = 75},
		{type = "item", name = "iron-gear-wheel", 		amount = 75},
		{type = "item", name = "steel-plate", 			amount = 150},
	},
	kj_rex = {
		{type = "item", name = "advanced-circuit", 		amount = 200},
		{type = "item", name = "engine-unit", 			amount = 200},
		{type = "item", name = "iron-gear-wheel", 		amount = 200},
		{type = "item", name = "low-density-structure", amount = 500},
		{type = "item", name = "processing-unit", 		amount = 100},
		{type = "item", name = "steel-plate", 			amount = 2000},
	},
	kj_rattetank = {
		{type = "item", name = "advanced-circuit", 		amount = 200},
		{type = "item", name = "engine-unit", 			amount = 500},
		{type = "item", name = "iron-gear-wheel", 		amount = 500},
		{type = "item", name = "steel-plate", 			amount = 5000},
	},
	kj_ray = {
		{type = "item", name = "advanced-circuit", 		amount = 200},
		{type = "item", name = "engine-unit", 			amount = 200},
		{type = "item", name = "iron-gear-wheel", 		amount = 200},
		{type = "item", name = "low-density-structure", amount = 500},
		{type = "item", name = "processing-unit", 		amount = 100},
		{type = "item", name = "steel-plate", 			amount = 2000},
	},
	kj_swspeeder = {
		{type = "item", name = "electric-engine-unit", 	amount = 10},
		{type = "item", name = "low-density-structure", amount = 20},
		{type = "item", name = "processing-unit", 		amount = 20},
	},
	kj_wirbelwind = {
		{type = "item", name = "advanced-circuit", 		amount = 20},
		{type = "item", name = "engine-unit", 			amount = 75},
		{type = "item", name = "iron-gear-wheel", 		amount = 75},
		{type = "item", name = "steel-plate", 			amount = 120},
	},

	kj_aventador = {
		{type = "item", name = "advanced-circuit", 		amount = 15},
		{type = "item", name = "engine-unit", 			amount = 30},
		{type = "item", name = "iron-gear-wheel", 		amount = 30},
		{type = "item", name = "plastic-bar", 			amount = 20},
		{type = "item", name = "steel-plate", 			amount = 10},
	},
	kj_bulldozer = {
		{type = "item", name = "engine-unit", 			amount = 60},
		{type = "item", name = "iron-gear-wheel", 		amount = 60},
		{type = "item", name = "iron-plate", 			amount = 10},
		{type = "item", name = "steel-plate", 			amount = 40},
	},
	kj_cybertruck = {
		{type = "item", name = "advanced-circuit", 		amount = 10},
		{type = "item", name = "electric-engine-unit", 	amount = 15},
		{type = "item", name = "iron-gear-wheel", 		amount = 15},
		{type = "item", name = "steel-plate", 			amount = 25},
	},
	kj_delorean = {
		{type = "item", name = "electronic-circuit", 	amount = 5},
		{type = "item", name = "engine-unit", 			amount = 10},
		{type = "item", name = "iron-plate", 			amount = 20},
		{type = "item", name = "steel-plate", 			amount = 5},
	},
	kj_firetruck = {
		{type = "item", name = "advanced-circuit", 		amount = 10},
		{type = "item", name = "engine-unit", 			amount = 30},
		{type = "item", name = "iron-gear-wheel", 		amount = 30},
		{type = "item", name = "steel-plate", 			amount = 40},
	},
	kj_fordmustang = {
		{type = "item", name = "engine-unit", 			amount = 20},
		{type = "item", name = "iron-gear-wheel", 		amount = 15},
		{type = "item", name = "iron-plate", 			amount = 10},
		{type = "item", name = "steel-plate", 			amount = 20},
	},
	kj_gigahorse = {
		{type = "item", name = "engine-unit", 			amount = 20},
		{type = "item", name = "iron-gear-wheel", 		amount = 15},
		{type = "item", name = "iron-plate", 			amount = 20},
		{type = "item", name = "iron-stick", 			amount = 5},
		{type = "item", name = "steel-plate", 			amount = 15},
	},
	kj_utilitarian = {
		{type = "item", name = "advanced-circuit", 		amount = 10},
		{type = "item", name = "engine-unit", 			amount = 30},
		{type = "item", name = "iron-gear-wheel", 		amount = 30},
		{type = "item", name = "steel-plate", 			amount = 40},
	},
	kj_warrig = {
		{type = "item", name = "engine-unit", 		amount = 50},
		{type = "item", name = "iron-gear-wheel", 	amount = 30},
		{type = "item", name = "iron-plate", 		amount = 40},
		{type = "item", name = "iron-stick", 		amount = 15},
		{type = "item", name = "steel-plate", 		amount = 30},
	},
	kj_warrig_wagon = {
		{type = "item", name = "iron-gear-wheel", 	amount = 20},
		{type = "item", name = "iron-plate",		amount = 50},
		{type = "item", name = "iron-stick", 		amount = 10},
		{type = "item", name = "steel-plate", 		amount = 30},
	},

	kj_40kbunker = {
		{type = "item", name = "concrete", 			amount = 600},
		{type = "item", name = "small-lamp", 		amount = 5},
		{type = "item", name = "steel-plate", 		amount = 400},
		{type = "item", name = "submachine-gun", 	amount = 1},
	},
	kj_laser = {
		{type = "item", name = "battery", 				amount = 15},
		{type = "item", name = "low-density-structure",	amount = 10},
		{type = "item", name = "processing-unit", 		amount = 10},
	},
	kj_phalanx = {
		{type = "item", name = "iron-gear-wheel", 	amount = 20},
		{type = "item", name = "steel-plate", 		amount = 40},
		{type = "item", name = "submachine-gun", 	amount = 6},
		{type = "item", name = "electric-engine-unit", amount = 10},
		{type = "item", name = "processing-unit", 	amount = 10},
		{type = "item", name = "radar", 			amount = 1},
	},
	kj_ballista = {
		{type = "item", name = "iron-plate", 	amount = 10},
		{type = "item", name = "wood", 			amount = 30},
	},
	kj_tower = {
		{type = "item", name = "concrete", 			amount = 30},
		{type = "item", name = "small-lamp", 		amount = 1},
		{type = "item", name = "steel-plate", 		amount = 50},
		{type = "item", name = "submachine-gun", 	amount = 1},
		{type = "item", name = "wood", 				amount = 10},
	},
	kj_vierling = {
		{type = "item", name = "iron-gear-wheel", 	amount = 20},
		{type = "item", name = "steel-plate", 		amount = 50},
		{type = "item", name = "submachine-gun", 	amount = 4},
	},

	kj_747 = {
		{type = "item", name = "advanced-circuit", 	amount = 40},
		{type = "item", name = "engine-unit", 		amount = 20},
		{type = "item", name = "iron-gear-wheel", 	amount = 160},
		{type = "item", name = "low-density-structure", amount = 200},
		{type = "item", name = "steel-plate", 		amount = 40},
		{type = "item", name = "processing-unit", 	amount = 40},
	},
	kj_b17 = {
		{type = "item", name = "advanced-circuit", 	amount = 50},
		{type = "item", name = "engine-unit", 		amount = 40},
		{type = "item", name = "iron-gear-wheel", 	amount = 160},
		{type = "item", name = "iron-plate", 		amount = 20},
		{type = "item", name = "low-density-structure", amount = 50},
		{type = "item", name = "steel-plate", 		amount = 25},
	},
	kj_b2 = {
		{type = "item", name = "engine-unit", 		amount = 32},
		{type = "item", name = "iron-gear-wheel", 	amount = 30},
		{type = "item", name = "low-density-structure", amount = 80},
		{type = "item", name = "processing-unit", 	amount = 60},
		{type = "item", name = "steel-plate", 		amount = 10},
	},
	kj_b29 = {
		{type = "item", name = "advanced-circuit", 	amount = 60},
		{type = "item", name = "engine-unit", 		amount = 40},
		{type = "item", name = "iron-gear-wheel", 	amount = 160},
		{type = "item", name = "low-density-structure", amount = 100},
		{type = "item", name = "steel-plate", 		amount = 15},
	},
	kj_bf109 = {
		{type = "item", name = "advanced-circuit", 	amount = 25},
		{type = "item", name = "engine-unit", 		amount = 8},
		{type = "item", name = "iron-gear-wheel", 	amount = 35},
		{type = "item", name = "iron-plate", 		amount = 8},
		{type = "item", name = "low-density-structure", amount = 20},
		{type = "item", name = "steel-plate", 		amount = 5},
	},
	kj_ho229 = {
		{type = "item", name = "advanced-circuit", 	amount = 35},
		{type = "item", name = "engine-unit", 		amount = 16},
		{type = "item", name = "iron-gear-wheel", 	amount = 20},
		{type = "item", name = "iron-plate", 		amount = 3},
		{type = "item", name = "low-density-structure", amount = 40},
		{type = "item", name = "steel-plate", 		amount = 3},
	},
	kj_ju52 = {
		{type = "item", name = "advanced-circuit", 	amount = 40},
		{type = "item", name = "engine-unit", 		amount = 30},
		{type = "item", name = "iron-gear-wheel", 	amount = 120},
		{type = "item", name = "iron-plate", 		amount = 10},
		{type = "item", name = "low-density-structure", amount = 60},
		{type = "item", name = "steel-plate", 		amount = 5},
	},
	kj_ju87 = {
		{type = "item", name = "advanced-circuit", 	amount = 30},
		{type = "item", name = "engine-unit", 		amount = 10},
		{type = "item", name = "iron-gear-wheel", 	amount = 40},
		{type = "item", name = "iron-plate", 		amount = 10},
		{type = "item", name = "low-density-structure", amount = 30},
		{type = "item", name = "steel-plate", 		amount = 5},
	},
	kj_jug38 = {
		{type = "item", name = "advanced-circuit", 	amount = 40},
		{type = "item", name = "iron-plate",		amount = 20},
		{type = "item", name = "steel-plate", 		amount = 10},
		{type = "item", name = "engine-unit", 		amount = 40},
		{type = "item", name = "low-density-structure", amount = 100},
		{type = "item", name = "iron-gear-wheel", 	amount = 160},
	},
	kj_xb35 = {
		{type = "item", name = "advanced-circuit", 	amount = 60},
		{type = "item", name = "engine-unit", 		amount = 40},
		{type = "item", name = "iron-gear-wheel", 	amount = 160},
		{type = "item", name = "low-density-structure", amount = 150},
		{type = "item", name = "steel-plate", 		amount = 10},
	},
}

tables.ammos = {
	stackSize = {
		kj_laser_normal = 1,

		kj_bolt = 100,

		kj_rh120_ap = 50,
		kj_rh120_he = 50,
		kj_rh120_aphe = 50,
		kj_rh120_can = 50,

		kj_baneblade_normal = 50,
		kj_baneblade_artillery = 5,

		kj_40kdreadnought_normal = 50,

		kj_lemanruss_normal = 50,

		kj_120kwk_ap = 50,
		kj_120kwk_he = 50,
		kj_120kwk_aphe = 50,

		kj_ballista_normal = 10,

		kj_pak_ap = 100,
		kj_pak_he = 100,
		kj_pak_inc = 100,

		kj_75kwk40_ap = 100,
		kj_75kwk40_he = 100,
		kj_75kwk40_aphe = 100,

		kj_apds_normal_single = 500,
		kj_apds_normal = 1,

		kj_predator_normal = 50,

		kj_280SKC34_ap = 35,
		kj_280SKC34_he = 35,
		kj_280SKC34_inc = 35,

		kj_ray_normal = 50,
		kj_ray_ammo_small = 100,

		kj_rex_normal = 50,

		kj_2cmfv_normal_vierling = 200,
		kj_2cmfv_normal = 200,
	},
	weight = {
		kj_laser_normal = 100,

		kj_bolt = 40,

		kj_rh120_ap = 40,
		kj_rh120_he = 40,
		kj_rh120_aphe = 50,
		kj_rh120_can = 40,

		kj_baneblade_normal = 40,
		kj_baneblade_artillery = 100,

		kj_40kdreadnought_normal = 25,

		kj_lemanruss_normal = 20,

		kj_120kwk_ap = 40,
		kj_120kwk_he = 40,
		kj_120kwk_aphe = 50,

		kj_ballista_normal = 10,

		kj_pak_ap = 20,
		kj_pak_he = 20,
		kj_pak_inc = 20,

		kj_75kwk40_ap = 20,
		kj_75kwk40_he = 20,
		kj_75kwk40_aphe = 40,

		kj_apds_normal_single = 40,
		kj_apds_normal = 1500 * 40,

		kj_predator_normal = 20,

		kj_280SKC34_ap = 100,
		kj_280SKC34_he = 100,
		kj_280SKC34_inc = 100,

		kj_ray_normal = 200,
		kj_ray_ammo_small = 200/3,

		kj_rex_normal = 200,

		kj_2cmfv_normal_vierling = 20,
		kj_2cmfv_normal = 20,
	},
	iconSize = {
		kj_laser_normal = 128,

		kj_bolt = 128,

		kj_ballista_normal = 64,

		kj_apds_normal = 128,

		kj_2cmfv_normal_vierling = 80,
		kj_2cmfv_normal = 80,
	},
	magSize = {
		kj_laser_normal = 200000,

		kj_bolt = 10,

		kj_ballista_normal = 5,

		kj_apds_normal = 1500,

		kj_2cmfv_normal_vierling = 5,
		kj_2cmfv_normal = 5,
	},
	category = {
		kj_baneblade_artillery = "artillery",
		kj_apds_normal_single = "bullet",
		kj_2cmfv_normal_vierling = "bullet",
		kj_2cmfv_normal = "bullet",
	}
}

tables.ammoData = {
	kj_2a6 = {
		APDW = 2250,
		APAP = 1800,
		APHE = 300,

		HEDW = 250,
		HEAP = 400,
		HEHE = 550,

		APHEDW = 350,
		APHEAP = 650,
		APHEHE = 600,

		CANAP = 200,
		CANDW = 300,
	},
	kj_40kbaneblade = {
		HEDW = 350,
		HEAP = 600,
		HEHE = 700,

		ADW = 600,
		AAP = 500,
		AHE = 500,
	},
	kj_40kdreadnought = {
		HEDW = 250,
		HEAP = 400,
		HEHE = 550,
	},
	kj_40klemanruss = {
		HEDW = 325,
		HEAP = 500,
		HEHE = 600,
	},
	kj_40kpredator = {
		HEDW = 225,
		HEAP = 300,
		HEHE = 500,
	},
	kj_maustank = {
		APDW = 2250,
		APAP = 1800,
		APHE = 300,

		HEDW = 250,
		HEAP = 400,
		HEHE = 550,

		APHEDW = 350,
		APHEAP = 650,
		APHEHE = 600,
	},
	kj_pak = {
		APDW = 1500,
		APAP = 1500,
		APHE = 200,

		HEDW = 200,
		HEAP = 250,
		HEHE = 450,

		HEIDW = 300,
		HEIAP = 280,
		HEIFDW = 100,
		HEIFAP = 100,
		HEIFHE = 100,
	},
	kj_panzer4 = {
		APDW = 1500,
		APAP = 1200,
		APHE = 200,

		HEDW = 150,
		HEAP = 200,
		HEHE = 450,

		APHEDW = 250,
		APHEAP = 450,
		APHEHE = 450,
	},
	kj_rattetank = {
		APDW = 5000,
		APAP = 5000,
		APHE = 500,

		HEDW = 1000,
		HEAP = 1000,
		HEHE = 1000,

		HEIDW = 1000,
		HEIAP = 500,
		HEIFDW = 200,
		HEIFAP = 200,
		HEIFHE = 200,
	},
	kj_ray = {
		APAP = 2000,
		APHE = 500,
	},
	kj_rex = {
		APAP = 2000,
		APHE = 500,
	},
	kj_wirbelwind = {
		NF = 35,
		NP = 24,
		NE = 30,
	},
	kj_phalanx = {
		NF = 10,
		NP = 15,
	},
	kj_ballista = {
		NP = 50,
		NF = 50,
	},
	kj_vierling = {
		NF = 20,
		NP = 24,
		NE = 30,
	},

	planes = {
		--50kg bomb
		AR = 4, --Explosion, Cliff Radius
		ADP = 100,--90, --explosion dmg
		ADE = 700,--600, --physical
		AWeight = 50,

		--250kg bomb
		BR = 6.3,
		BDP = 300,--450,
		BDE = 2100,--3000,
		BWeight = 250,

		--500kg bomb
		CR = 8,
		CDP = 500,--900,
		CDE = 3500,--6000,
		CWeight = 500,

		--1000kg bomb
		DR = 10,
		DDP = 800,--1800,
		DDE = 5600,--12000,
		DWeight = 1000,

		--Low cal
		EP = 25,
		EF = 25,
		EWeight = 20,

		--High cal
		FP = 75,
		FF = 75,
		FWeight = 40,

		--Napalm bomb
		GR = 5,
		GP = 100,
		GE = 100,
		GF = 100,
		GWeight = 500,
	},
}

tables.entityData = {
	max_health = {
		kj_2a6 = 		    8000,
		kj_40kbaneblade =  13000,
		kj_40kdreadnought = 9000,
		kj_40klemanruss =   8000,
		kj_40kpredator =    9000,
		kj_maustank = 	   10000,
		kj_pak = 		    1000,
		kj_panzer4 = 	    5000,
		kj_rex = 		  100000,
		kj_rattetank = 	  100000,
		kj_ray = 		  100000,
		kj_swspeeder = 	     500,
		kj_wirbelwind =     4000,

		kj_aventador = 	  1200,
		kj_bulldozer = 	  2000,
		kj_cybertruck =   1200,
		kj_delorean = 	   800,
		kj_firetruck = 	  1000,
		kj_fordmustang =  1000,
		kj_gigahorse = 	  2000,
		kj_utilitarian =  2000,
		kj_warrig =  	  2000,

		kj_40kbunker = 20000,
		kj_ballista =  	 350,
		kj_phalanx =  	1000,
		kj_laser =  	2000,
		kj_tower =  	2000,
		kj_vierling =  	1000,

		kj_747 =  	2000,
		kj_b17 =  	3000,
		kj_b2 =  	4000,
		kj_b29 =  	3500,
		kj_bf109 = 	 800,
		kj_ho229 = 	1000,
		kj_ju52 = 	1500,
		kj_ju87 = 	1000,
		kj_jug38 = 	2000,
		kj_xb35 = 	2000,
	},
	impactInfos = {
		kj_2a6 = 		 	{true, true, 0.1},
		kj_40kbaneblade =	{true, true, 0.04},
		kj_40kdreadnought =	{true, true, 0.1},
		kj_40klemanruss =	{true, true, 0.2},
		kj_40kpredator = 	{true, true, 0.2},
		kj_maustank = 		{true, true, 0.2},
		kj_pak = 			{true, false, 0.04},
		kj_panzer4 = 		{true, true, 0.1},
		kj_rex = 			{true, true, 0.05},
		kj_rattetank = 		{true, true, 0.05},
		kj_ray = 			{true, true, 0.05},
		kj_swspeeder = 		{true, false, 10},
		kj_wirbelwind = 	{true, true, 0.1},

		kj_aventador = 		{false, false, 8},
		kj_bulldozer = 		{true, true, 0.08},
		kj_cybertruck = 	{true, false, 5},
		kj_delorean = 		{false, false, 5},
		kj_firetruck = 		{true, false, 5},
		kj_fordmustang =	{false, false, 5},
		kj_gigahorse = 		{true, false, 1},
		kj_utilitarian =	{true, true, 3},
		kj_warrig =			{true, true, 1},

		kj_40kbunker = 		{true, true, 0.04},

		kj_747 = 		{false, false, 0.1},
		kj_b17 = 		{false, false, 0.1},
		kj_b2 = 		{false, false, 0.1},
		kj_b29 = 		{false, false, 0.1},
		kj_bf109 = 		{false, false, 0.1},
		kj_ho229 = 		{false, false, 0.1},
		kj_ju52 = 		{false, false, 0.1},
		kj_ju87 = 		{false, false, 0.1},
		kj_jug38 = 		{false, false, 0.1},
		kj_xb35 = 		{false, false, 0.1},
	},
	braking_power = {
		kj_2a6 = 		  "3000kW",
		kj_40kbaneblade = "1400kW",
		kj_40kdreadnought="5000kW",
		kj_40klemanruss =  "400kW",
		kj_40kpredator =  "1000kW",
		kj_maustank = 	  "1200kW",
		kj_pak = 		   "600kW",
		kj_panzer4 = 	   "500kW",
		kj_rex = 		  "8000kW",
		kj_rattetank = 	  "6000kW",
		kj_ray = 		  "8000kW",
		kj_swspeeder = 	  "1500kW",
		kj_wirbelwind =    "500kW",

		kj_aventador = 	  "2000kW",
		kj_bulldozer = 	  "3000kW",
		kj_cybertruck =   "1200kW",
		kj_delorean = 	   "500kW",
		kj_firetruck = 	  "1000kW",
		kj_fordmustang =   "650kW",
		kj_gigahorse = 	  "1000kW",
		kj_utilitarian =   "600kW",
		kj_warrig =   	  "1500kW",

		kj_40kbunker = 	  	"10kW",

		kj_747 = 	  	"1000kW",
		kj_b17 = 	  	"1000kW",
		kj_b2 = 	  	"2000kW",
		kj_b29 = 	  	"1000kW",
		kj_bf109 = 	  	"1000kW",
		kj_ho229 = 	  	"1200kW",
		kj_ju52 = 	  	"1000kW",
		kj_ju87 = 	  	 "500kW",
		kj_jug38 = 	  	 "750kW",
		kj_xb35 = 	  	 "750kW",
	},
	consumption = {
		kj_2a6 = 		  "1600kW",
		kj_40kbaneblade = "1400kW",
		kj_40kdreadnought ="200kW",
		kj_40klemanruss =  "800kW",
		kj_40kpredator =  "2000kW",
		kj_maustank = 	  "1200kW",
		kj_pak = 		   "250kW",
		kj_panzer4 = 	   "500kW",
		kj_rex = 		   "150kW",
		kj_rattetank = 	  "6000kW",
		kj_ray = 		   "150kW",
		kj_swspeeder = 	   "555kW",
		kj_wirbelwind =    "500kW",

		kj_aventador = 	   "800kW",
		kj_bulldozer = 	  "1600kW",
		kj_cybertruck =    "600kW",
		kj_delorean = 	   "295kW",
		kj_firetruck = 	  "1000kW",
		kj_fordmustang =   "390kW",
		kj_gigahorse = 	   "700kW",
		kj_utilitarian =   "600kW",
		kj_warrig =   	  "1400kW",

		kj_40kbunker = 	  	"10kW",

		kj_747 = 	  	"3000kW",
		kj_b17 = 	  	"2500kW",
		kj_b2 = 	  	"1500kW",
		kj_b29 = 	  	"2500kW",
		kj_bf109 = 	  	 "400kW",
		kj_ho229 = 	  	"1000kW",
		kj_ju52 = 	  	 "600kW",
		kj_ju87 = 	  	 "600kW",
		kj_jug38 = 	  	"1500kW",
		kj_xb35 = 	  	"2500kW",
	},
	weight = {
		kj_2a6 = 		    62000,
		kj_40kbaneblade =  200000,
		kj_40kdreadnought = 50000,
		kj_40klemanruss =   60000,
		kj_40kpredator =    44000,
		kj_maustank = 	   100000,
		kj_pak = 		     3000,
		kj_panzer4 = 	    25000,
		kj_rex = 		   100000,
		kj_rattetank = 	  1000000,
		kj_ray = 		   100000,
		kj_swspeeder = 	      300,
		kj_wirbelwind =     25000,

		kj_aventador = 	     1600,
		kj_bulldozer = 	    50000,
		kj_cybertruck =      3000,
		kj_delorean = 	     1233,
		kj_firetruck = 	    20000,
		kj_fordmustang =     1500,
		kj_gigahorse = 	     5000,
		kj_utilitarian =    10000,
		kj_warrig =    		13000,

		kj_40kbunker = 	   230000,

		kj_747 = 	    6000,
		kj_b17 = 	   10000,
		kj_b2 = 	   10000,
		kj_b29 = 	   10000,
		kj_bf109 = 	    2200,
		kj_ho229 = 	    5000,
		kj_ju52 = 	    5700,
		kj_ju87 = 	    2750,
		kj_jug38 = 	   16000,
		kj_xb35 = 	   10000,
	},
	invRotTur = {
		kj_2a6 = 		 	{20, 0.004 , 0.11 / 60},
		kj_40kbaneblade =	{30, 0.0028, 0.09 / 60},
		kj_40kdreadnought =	{20, 0.005 , 0.2  / 60},
		kj_40klemanruss =	{30, 0.0035, 0.12 / 60},
		kj_40kpredator = 	{30, 0.0035, 0.12 / 60},
		kj_maustank = 		{30, 0.0035, 0.09 / 60},
		kj_pak = 			{ 5, 0.0025, 0.08 / 60},
		kj_panzer4 = 		{80, 0.0035, 0.17 / 60},
		kj_rex = 			{50, 0.002 , 0.2  / 60},
		kj_rattetank = 		{30, 0.0005, 0.05 / 60},
		kj_ray = 			{50, 0.002 , 0.2  / 60},
		kj_swspeeder = 		{ 5, 0.01  , 1},
		kj_wirbelwind = 	{80, 0.0035, 0.17 / 60},

		kj_aventador = 		{ 20, 0.015, 1},
		kj_bulldozer = 		{ 20, 0.004, 1},
		kj_cybertruck = 	{ 50, 0.01 , 1},
		kj_delorean = 		{ 30, 0.015, 1},
		kj_firetruck = 		{100, 0.01 , 1},
		kj_fordmustang =	{ 40, 0.013, 5},
		kj_gigahorse = 		{ 40, 0.008, 1},
		kj_utilitarian =	{150, 0.01 , 1},
		kj_warrig =			{ 70, 0.007, 1},

		kj_40kbunker = 		{ 10, 0.000, 1},

		kj_747 = 		{540, 0.002, 1},
		kj_b17 = 		{ 30, 0.002, 1},
		kj_b2 = 		{  5, 0.003, 1},
		kj_b29 = 		{ 40, 0.002, 1},
		kj_bf109 = 		{  5, 0.009, 1},
		kj_ho229 = 		{  1, 0.009, 1},
		kj_ju52 = 		{100, 0.003, 1},
		kj_ju87 = 		{ 10, 0.008, 1},
		kj_jug38 = 		{150, 0.002, 1},
		kj_xb35 = 		{ 10, 0.002, 1},
	},
	resistances = {         --  fire     physical    impact   explosion     acid     electric    laser      poison
		kj_2a6 = 		 	{{ 60, 65}, { 40, 70}, { 30, 70}, { 50, 65}, { 20, 60}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_40kbaneblade =	{{ 60, 65}, { 30, 75}, { 20, 70}, { 15, 70}, { 25, 50}, { 15, 50}, { 15, 50}, { 15, 50}},
		kj_40kdreadnought =	{{ 20, 90}, { 20, 75}, { 20, 70}, { 15, 70}, { 20, 50}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_40klemanruss =	{{ 20, 80}, { 30, 75}, { 20, 70}, { 15, 70}, { 15, 50}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_40kpredator = 	{{ 20, 80}, { 30, 75}, { 20, 70}, { 15, 70}, { 15, 50}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_maustank = 		{{ 20, 80}, { 30, 75}, { 20, 70}, { 15, 70}, {  8, 30}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_pak = 			{{ 20, 90}, { 30, 75}, { 20, 60}, { 20, 50}, { 15, 50}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_panzer4 = 		{{ 25, 70}, { 20, 60}, { 50, 80}, { 30, 70}, { 10, 40}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_rex = 			{{ 50,100}, { 20, 75}, { 70, 70}, { 50, 70}, { 50, 70}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_rattetank = 		{{ 30, 80}, { 50, 80}, { 50, 80}, { 50, 70}, { 25, 70}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_ray = 			{{ 50,100}, { 20, 75}, { 70, 70}, { 50, 70}, { 50, 70}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_swspeeder = 		{{ 15, 50}, {  5, 10}, { 10, 40}, {  5, 10}, {  5, 10}, {  5, 40}, {  5, 40}, {  5, 95}},
		kj_wirbelwind = 	{{ 20, 70}, { 20, 60}, { 50, 70}, { 20, 70}, { 10, 40}, {  0,  0}, {  0,  0}, {  0,  0}},

		kj_aventador = 		{{ 15, 80}, { 15, 40}, { 15, 70}, { 15, 30}, { 10, 30}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_bulldozer = 		{{ 15, 60}, { 15, 35}, { 50, 70}, { 15, 30}, { 10, 30}, {  5, 40}, {  5, 40}, {  5, 95}},
		kj_cybertruck = 	{{ 15, 60}, { 15, 40}, { 50, 70}, { 15, 30}, {  5, 20}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_delorean = 		{{ 15, 50}, { 15, 20}, { 40, 60}, { 15, 15}, { 10, 20}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_firetruck = 		{{ 15, 80}, { 15, 40}, { 50, 78}, { 15, 30}, { 10, 30}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_fordmustang =	{{ 15, 60}, { 15, 40}, { 50, 50}, { 15, 15}, {  5, 20}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_gigahorse = 		{{ 15, 55}, { 20, 40}, { 35, 35}, { 15, 25}, { 20, 25}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_utilitarian =	{{ 15, 80}, { 15, 40}, { 50, 70}, { 15, 30}, { 10, 30}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_warrig =			{{ 15, 60}, { 20, 50}, { 60, 80}, { 15, 30}, { 25, 30}, {  0,  0}, {  0,  0}, {  0,  0}},

		kj_40kbunker =		{{ 50,100}, { 30, 75}, {100, 95}, { 50, 70}, { 40, 70}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_ballista =		{{  0,  0}, {  5,  0}, { 10, 10}, {  0,  0}, {  0,  0}, {  0,  0}, {  0,  0}, {  5, 95}},
		kj_laser =			{{  5, 30}, {  0,  0}, { 10, 40}, {  0,  0}, {  0,  0}, {  5, 40}, {  5, 20}, {  5, 95}},
		kj_phalanx =		{{ 20, 65}, { 15, 30}, { 10, 40}, {  0, 15}, {  5, 30}, {  5, 40}, {  5, 40}, {  5, 95}},
		kj_tower =			{{ 50,100}, { 15, 75}, { 50, 50}, { 40, 20}, { 15, 30}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_vierling =		{{ 20, 70}, { 15, 30}, { 10, 50}, {  0, 20}, {  5, 30}, {  5, 40}, {  5, 40}, {  5, 95}},

		kj_747 =			{{ 20, 70}, { 10, 50}, { 10, 50}, {  5, 55}, { 15, 60}, { 15, 40}, {  5, 50}, {  5, 95}},
		kj_b17 =			{{ 20, 75}, {  5, 50}, { 10, 50}, {  5, 55}, { 15, 60}, {  5, 40}, {  5, 40}, {  5, 95}},
		kj_b2 =				{{ 20, 80}, { 25, 60}, { 15, 50}, { 20, 65}, { 20, 60}, { 50, 60}, { 20, 60}, {  5, 95}},
		kj_b29 =			{{ 20, 75}, { 10, 55}, { 12, 50}, { 10, 60}, { 15, 60}, { 20, 60}, { 10, 60}, {  5, 95}},
		kj_bf109 =			{{ 20, 70}, {  5, 50}, { 10, 40}, {  5, 60}, { 15, 50}, {  5, 40}, {  5, 40}, {  5, 95}},
		kj_ho229 =			{{ 20, 80}, {  8, 60}, { 15, 50}, { 10, 65}, { 20, 60}, { 20, 60}, { 20, 60}, {  5, 95}},
		kj_ju52 =			{{ 20, 70}, {  5, 45}, { 10, 45}, {  5, 50}, { 15, 60}, {  5, 50}, {  5, 50}, {  5, 95}},
		kj_ju87 =			{{ 20, 70}, {  5, 50}, { 10, 40}, {  5, 60}, { 15, 50}, {  5, 40}, {  5, 40}, {  5, 95}},
		kj_jug38 =			{{ 20, 70}, {  5, 45}, { 12, 50}, { 10, 50}, { 15, 60}, {  5, 40}, {  5, 50}, {  5, 95}},
		kj_xb35 =			{{ 20, 70}, {  5, 45}, { 12, 50}, { 10, 50}, { 15, 60}, {  5, 40}, {  5, 50}, {  5, 95}},
	},
	friTerSpdEff = {
		kj_2a6 = 		 	{0.002, 0.2, 0.1, 1},
		kj_40kbaneblade =	{0.002, 0.2, 0.1, 1},
		kj_40kdreadnought =	{0.001, 0.1, 0.1, 1},
		kj_40klemanruss =	{0.002, 0.2, 0.07,1},
		kj_40kpredator = 	{0.002, 0.2, 0.1, 1},
		kj_maustank = 		{0.002, 0.2, 0.1, 1},
		kj_pak = 			{0.4  ,   1, 0.1, 1},
		kj_panzer4 = 		{0.002, 0.2, 0.1, 0.9},
		kj_rex = 			{0.001, 0.1, 0.1, 1},
		kj_rattetank = 		{0.002, 0.2, 0.1, 1},
		kj_ray = 			{0.001, 0.1, 0.1, 1},
		kj_swspeeder = 		{0.002, 0.1, 0.1, 0.5},
		kj_wirbelwind = 	{0.002, 0.2, 0.1, 0.9},

		kj_aventador = 		{0.002,   1, 0.2, 1},
		kj_bulldozer = 		{0.002, 0.2, 0.2, 1},
		kj_cybertruck = 	{0.002,   1, 0.2, 1},
		kj_delorean = 		{0.002,   1, 0.2, 1},
		kj_firetruck = 		{0.002,   1, 0.1, 1},
		kj_fordmustang =	{0.002,   1, 0.1, 1},
		kj_gigahorse = 		{0.002,   1, 0.2, 1},
		kj_utilitarian =	{0.002,   1, 0.1, 1},
		kj_warrig =			{0.002, 0.1, 0.05,1},

		kj_40kbunker = 		{1	  , 0.5, 0.1, 1},

		kj_747 = 		{0.002, 1, 0.1, 1},
		kj_b17 = 		{0.002, 1, 0.1, 1},
		kj_b2 = 		{0.001, 1, 0.1, 1},
		kj_b29 = 		{0.002, 1, 0.1, 1.2},
		kj_bf109 = 		{0.001, 1, 0.1, 1},
		kj_ho229 = 		{0.001, 1, 0.1, 1},
		kj_ju52 = 		{0.002, 1, 0.1, 1},
		kj_ju87 = 		{0.001, 1, 0.1, 1},
		kj_jug38 = 		{0.002, 1, 0.1, 1},
		kj_xb35 = 		{0.002, 1, 0.1, 1},
	},
}

tables.planeData = {
	speed = {
		kj_747 = 	{takeoff = 300, landing = 200},
		kj_b17 =	{takeoff = 200, landing = 150},
		kj_b2 = 	{takeoff = 200, landing = 150},
		kj_b29 = 	{takeoff = 200, landing = 150},
		kj_bf109 =	{takeoff = 180, landing = 130},
		kj_ho229 =	{takeoff = 180, landing = 130},
		kj_ju52 =	{takeoff = 120, landing = 106},
		kj_ju87 =	{takeoff = 180, landing = 130},
		kj_jug38 =	{takeoff = 120, landing = 100},
		kj_xb35 =	{takeoff = 200, landing = 150},
	},
	weight = {
		kj_747 =  	nil,
		kj_b2 =  	5000,
		kj_b17 =  	nil,
		kj_bf109 = 	nil,
		kj_ho229 = 	2500,
		kj_ju52 = 	nil,
		kj_ju87 = 	nil,
		kj_jug38 = 	24000,
		kj_xb35 = 	nil,
	},
	braking_power = {
		--kj_747 =  	"3000kW",
		kj_b2 =  	"1000kW",
		kj_b17 =  	"1500kW",
		kj_b29 =  	"1500kW",
		--kj_bf109 = 	"3000kW",
		--kj_ho229 = 	"3000kW",
		--kj_ju52 = 	"3000kW",
		--kj_ju87 = 	"3000kW",
		--kj_jug38 = 	"3000kW",
		kj_xb35 = 	"1000kW",
	},
	rotation_speed = {
		kj_747 =  	0.0016,
		kj_b17 =  	0.0016,
		kj_b2 =  	0.004,
		kj_b29 =  	0.0016,
		kj_bf109 = 	0.004,
		kj_ho229 = 	0.004,
		kj_ju52 = 	0.0019,
		kj_ju87 = 	0.0035,
		kj_jug38 = 	0.0016,
		kj_xb35 = 	0.0016,
	},
	shadowSpeed = {
		kj_747 =  	100,
		kj_b17 =  	 60,
		kj_b2 =  	120,
		kj_b29 =  	 60,
		kj_bf109 = 	 60,
		kj_ho229 = 	140,
		kj_ju52 = 	 60,
		kj_ju87 = 	 60,
		kj_jug38 = 	 50,
		kj_xb35 = 	100,
	},
	friction = {
		kj_b2 = 0.0001,
		--kj_b17 = 0.001,
		kj_ju87 = 0.0002,
	},
	maxSpeed = {
		kj_747 =  	900,
		kj_b17 =  	485,
		kj_b2 =    1010,
		kj_b29 =    576,
		kj_bf109 = 	470,
		kj_ho229 = 	950,
		kj_ju52 = 	290,
		kj_ju87 = 	390,
		kj_jug38 = 	200,
		kj_xb35 = 	629,
	},
	sound = {
		kj_747 =  	{fadeIn = 120, 						volume = 0.7, 	offset = 0.2},
		kj_b17 =  	{},
		kj_b2 =     {fadeIn = 120, 						volume = 0.7},
		kj_b29 =  	{},
		kj_bf109 = 	{				speedMult = 0.85, 					offset = 0.2},
		kj_ho229 = 	{fadeIn = 120, 	speedMult = 0.8,	volume = 0.7},
		kj_ju52 = 	{				speedMult = 0.8},
		kj_ju87 = 	{fadeIn = 90},
		kj_jug38 = 	{				speedMult = 0.8},
		kj_xb35 = 	{fadeIn = 90,	speedMult = 0.65},
	},
	airSound = {
		kj_747 =  	true,
		kj_b17 =  	true,
		kj_b2 =     true,
		kj_b29 =    true,
		kj_bf109 = 	false,
		kj_ho229 = 	true,
		kj_ju52 = 	false,
		kj_ju87 = 	false,
		kj_jug38 = 	true,
		kj_xb35 = 	true,
	},
	flyingSheet = {--{{delete layer in ground}, {delete layer in flying}}
		kj_747 =  	{{}, {1}},
		kj_b17 =  	{{},{}},
		kj_b2 =  	{{2}, {1}},
		kj_b29 =  	{{}, {1}},
		kj_bf109 = 	{{},{}},
		kj_ho229 = 	{{2, 3}, {1}},
		kj_ju52 = 	{{},{}},
		kj_ju87 = 	{{},{}},
		kj_jug38 = 	{{},{}},
		kj_xb35 = 	{{},{1}},
	},
	lights = {
		kj_747 =  	{-5, -5, 4},
		kj_b17 =  	{-5, -5, 5},
		kj_b2 =  	{-5, -5},
		kj_b29 =  	{-5, -5, 5},
		kj_bf109 = 	{-5, 5},
		kj_ho229 = 	{-5},
		kj_ju52 = 	{-5, 5},
		kj_ju87 = 	{-5, 5},
		kj_jug38 = 	{-5, 5},
		kj_xb35 = 	{-5, 5},
	},
}

for name, mod in pairs(tables.items) do
	if mod.order == nil then
		if tables.supportedMods[name] ~= nil then
			mod.order = tables.supportedMods[name].order
		else
			mod.order = ""
		end
	end
end

return tables

--[[

    type
    name
    corpse
    mined_sound
    dying_explosion
	equipment_grid
    collision_box
    selection_box
    sticker_box
	drawing_box_vertical_extension
	darkness_to_render_light_animation
	stop_trigger
	tank_driving
	turret_return_timeout
	has_belt_immunity
	guns

	energy_source
	light
	animation
	turret_animation
	working_sound
	sound_no_fuel
	open_sound
	close_sound

]]