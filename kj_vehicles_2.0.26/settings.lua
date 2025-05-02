local table = require("tables")

data:extend({
	{
		type = "bool-setting",
		name = "kj_modCategory",
		setting_type = "startup",
        default_value = false,
		order = "0-a",
	},
})

if mods["kj_tower"] then
	data:extend({
		{
			type = "bool-setting",
			name = "kj_tower_collision_box",
			setting_type = "startup",
			default_value = false,
			order = "kj_tower_collision_box",
		},
	})
end

if mods["kj_swspeeder"] then
	data:extend({
		{
			type = "int-setting",
			name = "kj_swspeeder_blaster_strength",
			setting_type = "startup",
			default_value = 1,
			order = "kj_swspeeder_blaster_strength",
		},
	})
end

if mods["kj_40kbaneblade"] then
	data:extend({
		{
			type = "bool-setting",
			name = "kj_40kbaneblade_stickers",
			setting_type = "runtime-global",
			default_value = true, 
			order = "kj_40kbaneblade_stickers",
		},
	})
end

if mods["kj_rattetank"] then
	data:extend({
		{
			type = "bool-setting",
			name = "kj_rattetank_hr",
			setting_type = "startup",
			default_value = true,
			order = "kj_rattetank_hr"
		},
	})
end

if mods["kj_rex"] then
	data:extend({
		{
			type = "int-setting",
			name = "kj_rex_walking_volume",
			setting_type = "startup",
			default_value = 50,
			minimum_value = 0,
			maximum_value = 100,
			order = "kj_rex_walking_volume"
		},
		{
			type = "bool-setting",
			name = "kj_rex_walking",
			setting_type = "startup",
			default_value = true,
			order = "kj_rex_walking"
		},
	})
end

if mods["kj_40kdreadnought"] then
	data:extend({
		{
			type = "int-setting",
			name = "kj_40kdreadnought_walking_volume",
			setting_type = "startup",
			default_value = 50,
			minimum_value = 0,
			maximum_value = 100,
			order = "kj_40kdreadnought_walking_volume"
		},
		{
			type = "int-setting",
			name = "kj_40kdreadnought_voiceline_volume",
			setting_type = "startup",
			default_value = 70,
			minimum_value = 0,
			maximum_value = 100,
			order = "kj_40kdreadnought_voiceline_volume"
		},
		{
			type = "bool-setting",
			name = "kj_40kdreadnought_walking",
			setting_type = "runtime-global",
			default_value = true,
			order = "kj_40kdreadnought_walking"
		},
	})
end

if mods["kj_pak"] then
	data:extend({
		{
			type = "int-setting",
			name = "kj_pak_range",
			setting_type = "startup",
			default_value = 50,
			minimum_value = 10,
			maximum_value = 150,
		},
	})
end

if mods["kj_ray"] then
	data:extend({
		{
			type = "int-setting",
			name = "kj_ray_walking_volume",
			setting_type = "startup",
			default_value = 50,
			minimum_value = 0,
			maximum_value = 100,
			order = "ac"
		},
		{
			type = "bool-setting",
			name = "kj_ray_walking",
			setting_type = "startup",
			default_value = true,
			order = "ac"
		},
	})
end

if mods["kj_laser"] then
	data:extend({
		{
			type = "string-setting",
			name = "kj_laser_angle",
			setting_type = "startup",
			default_value = "5",
			allowed_values = {"5", "6", "7", "8", "9", "10"},
			order = "kj_laser_angle",
		},
		{
			type = "bool-setting",
			name = "kj_laser_friendlyFire",
			setting_type = "startup",
			default_value = true,
			order = "kj_laser_friendlyFire",
		},
	})
end

if mods["kj_medieval_warfare"] or mods["kj_phalanx"] or mods["kj_vierling"] then
	data:extend({
		{
			type = "bool-setting",
			name = "kj_AA_target_mask",
			setting_type = "startup",
			default_value = true,
			order = "0-kj_AA_target_mask",
		},
		{
			type = "bool-setting",
			name = "kj_AA_ermAA",
			setting_type = "startup",
			default_value = false,
			order = "0-kj_AA_ermAA",
		},
		{
			type = "bool-setting",
			name = "kj_AA_flyerAA",
			setting_type = "startup",
			default_value = false,
			order = "0-kj_AA_flyerAA",
		},
	})
end

if mods["kj_phalanx"] then
	data:extend({
		{
			type = "int-setting",
			name = "kj_phalanx_volume",
			setting_type = "startup",
			default_value = 100,
			minimum_value = 0,
			maximum_value = 100,
			order = "kj_phalanx_volume",
		},
		{
			type = "bool-setting",
			name = "kj_phalanx_nonAA",
			setting_type = "startup",
			default_value = false,
			order = "kj_phalanx_nonAA",
		},
	})
end

if mods["kj_vierling"] then
	data:extend({
		{
			type = "bool-setting",
			name = "kj_vierling_nonAA",
			setting_type = "startup",
			default_value = false,
			order = "kj_vierling_nonAA",
		},
	})
end


if mods["kj_b2"] then
	data:extend({
		{
			type = "bool-setting",
			name = "kj_b2_crash_boom",
			setting_type = "runtime-global",
			default_value = true  ,
			order = "kj_b2_crash_boom",
			localised_name = {"", {"item-name.kj_b2"}, {"mod-setting-name.crash_boom"}},
			localised_description = {"", {"mod-setting-description.crash_boom"}},
		}
	})
end

if mods["kj_b29"] then
	data:extend({
		{
			type = "bool-setting",
			name = "kj_b29_crash_boom",
			setting_type = "runtime-global",
			default_value = true,
			order = "kj_b29_crash_boom",
			localised_name = {"", {"item-name.kj_b29"}, {"mod-setting-name.crash_boom"}},
			localised_description = {"", {"mod-setting-description.crash_boom"}},
		}
	})
end

if mods["kj_xb35"] then
	data:extend({
		{
			type = "bool-setting",
			name = "kj_xb35_crash_boom",
			setting_type = "runtime-global",
			default_value = true  ,
			order = "kj_xb35_crash_boom",
			localised_name = {"", {"item-name.kj_xb35"}, {"mod-setting-name.crash_boom"}},
			localised_description = {"", {"mod-setting-description.crash_boom"}},
		}
	})
end


local function settingMaker(name)
	data:extend({
		{
			type = "int-setting",
			name = name.."-hp_modifier",
			setting_type = "startup",
			default_value = 100,
			minimum_value = 1,
			maximum_value = 100,
			localised_name = {"", {"item-name."..name}, {"mod-setting-name.hp_modifier"}},
			localised_description = {"", {"mod-setting-description.hp_modifier"}},
			order = name.."_hp_modifier",
		}
	})
	--log("HP modifier for "..name.." added.")

	data:extend({
		{
			type = "int-setting",
			name = name.."-resistance_modifier",
			setting_type = "startup",
			default_value = 100,
			minimum_value = 0,
			maximum_value = 100,
			localised_name = {"", {"item-name."..name}, {"mod-setting-name.resistance_modifier"}},
			localised_description = {"", {"mod-setting-description.resistance_modifier"}},
			order = name.."_resistance_modifier",
		}
	})
	--log("Resistance modifier for "..name.." added.")
end

for name, speed in pairs(table.planeData.speed) do
	if mods[name] then
		data:extend({
			{
				type = "double-setting",
				name = "aircraft-takeoff-speed-"..name,
				setting_type = "runtime-global",
				minimum_value = 0,
				default_value = speed.takeoff,
				order = name.."_takeoff_speed",
				localised_name = {"", {"item-name."..name}, {"mod-setting-name.takeoff_speed"}},
				localised_description = {"", {"mod-setting-description.takeoff_speed"}},
			},
			{
				type = "double-setting",
				name = "aircraft-landing-speed-"..name,
				setting_type = "runtime-global",
				minimum_value = 0,
				default_value = speed.landing,
				order = name.."_landing_speed",
				hidden = true,
				localised_name = {"", {"item-name."..name}, {"mod-setting-name.landing_speed"}},
				localised_description = {"", {"mod-setting-description.landing_speed"}},
			},
		})
	end
end


for name, _ in pairs(table.airborneMods) do
	if mods[name] then
		data:extend({
			{
				type = "bool-setting",
				name = name.."no_melee_damage",
				setting_type = "startup",
				default_value = true,
				order = "1-"..name,
				localised_name = {"", {"item-name."..name}, {"mod-setting-name.no_melee"}},
				localised_description = {"", {"mod-setting-description.kj_plane_no_melee"}},
			}
		})
	end
end

for name, _ in pairs(table.airborneMods) do
	if mods[name] then
		data:extend({
			{
				type = "int-setting",
				name = "kj_plane_ammo_cost_setting_multiplicator",
				setting_type = "startup",
				order = "2-0",
				default_value = 1,
			},
		})
		break
	end
end

for name, mod in pairs(table.balancedModsRecipe) do
	if mods[name] then
		if mod == true then
			data:extend({
				{
					type = "int-setting",
					name = name.."_cost_setting_multiplicator",
					setting_type = "startup",
					default_value = 1,
					order = name.."_cost_setting_multiplicator",
					localised_name = {"", {"item-name."..name}, {"mod-setting-name.cost_setting"}},
				},
			})
		else
			data:extend({
				{
					type = "int-setting",
					name = name.."_cost_setting_multiplicator",
					setting_type = "startup",
					default_value = 1,
					order = name.."_cost_setting_multiplicator",
					localised_name = {"", {"item-name."..name}, {"mod-setting-name.cost_setting"}},
				},
				{
					type = "int-setting",
					name = name.."ammo_cost_setting_multiplicator",
					setting_type = "startup",
					default_value = 1,
					order = name.."ammo_cost_setting_multiplicator",
					localised_name = {"", {"item-name."..name}, {"mod-setting-name.ammo_cost_setting"}},
				},
			})
		end
	end
end

for name, mod in pairs(table.balancedMods) do
	if mods[name] then
		log(name.." exists")
		if mod ~= nil then
			settingMaker(name)
		end
	end
end
