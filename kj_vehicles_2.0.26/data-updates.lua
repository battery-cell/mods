local tables = require("tables")
local prerequisites_mod = ""

local function establishAA()
	local settingTM = settings.startup["kj_AA_target_mask"].value
	local settingERM = settings.startup["kj_AA_ermAA"].value
	local settingFlyer = settings.startup["kj_AA_flyerAA"].value

	data:extend({
		{
			type = "trigger-target-type",
			name = "air-unit",
		},
		{
			type = "trigger-target-type",
			name = "flying",
		},
	})

	if settingTM == true then
		types = {}
		for name, _ in pairs(data.raw["trigger-target-type"]) do
			if name ~= "air-unit" and name ~= "flying" then
				table.insert(types, name)
				--log("Adding type: "..name)
			end
		end
		table.insert(types, "common")

		--Assigning Turrets attack_target_mask
		turretTypes = {"ammo", "electric", "fluid"}
		for _, turretType in pairs (turretTypes) do
			for name, turret in pairs(data.raw[turretType.."-turret"]) do
				log("Name: "..name)
				if string.sub(name,1,3) ~= "kj_" then
					log("Mod foreign turret found.")

					if turret.attack_target_mask ~= nil then
						if turret.attack_target_mask["air-unit"] ~= nil then
							data.raw[turretType.."-turret"][name].attack_target_mask["air-unit"] = false
						end

						if turret.attack_target_mask["flying"] ~= nil then
							data.raw[turretType.."-turret"][name].attack_target_mask["flying"] = false
						end

						log("Found a "..turretType.."-turret with air-unit/flying as attack_target_mask. Set to false.")
					else
						data.raw[turretType.."-turret"][name].attack_target_mask = types
						log("Standard masks applied")
					end
				end
			end
		end
	end

	--[[
	for name, character in pairs(data.raw["character"]) do
		if character.trigger_target_mask ~= nil then
			table.insert(data.raw["character"][name].trigger_target_mask, "air-unit")
		else
			data.raw["character"][name].trigger_target_mask = {"air-unit", "ground-unit", "common"}
		end
	end
	]]


	--[[
	"erm_terran_exp/aerial_scout/",
	"erm_vanilla/construction-rob",
	"erm_terran_exp/science_vesse",
	"erm_marspeople/daimanji-thun",
	"erm_marspeople/daimanji-drop",
	"erm_marspeople/daimanji-purp",
	"erm_marspeople/eye-ufo-a/",
	"erm_marspeople/eye-ufo-b/",
	"erm_marspeople/aerial_scout/",
	"erm_marspeople/ufo/",
	]]

	local airUnitName = {
		"behemoth-flyer",
		"ultra-flyer",
		"big-flyer",
		"medium-flyer",
		"small-flyer",
	}

	local subStringList = {
		"erm_terran_exp/aeri",
		"erm_terran_exp/scie",
		"erm_vanilla/constru",
		"enemy--construction",
	}

	if mods["erm_marspeople"] then
		table.insert(subStringList, "erm_marspeople/daim")
		table.insert(subStringList, "erm_marspeople/eye-")
		table.insert(subStringList, "erm_marspeople/aeri")
		table.insert(subStringList, "erm_marspeople/ufo/")
	end

	for name, unit in pairs(data.raw["unit"]) do
		local subgroup = unit.subgroup
		local doIt = false
		local erm = true

		if subgroup == "erm-dropship-enemies" or subgroup == "erm-flying-enemies" then
			doIt = true
		end

		if doIt == false then
			local subString = string.sub(name,1,19)

			for _, entry in ipairs(subStringList) do
				if subString == entry then
					doIt = true
					break
				end
			end
		end

		if doIt == false then
			for _, entry in ipairs(airUnitName) do
				if entry == name then
					doIt = true
					erm = false
					break
				end
			end
		end

		if doIt == true then
			if (erm == true and settingERM == true) or (erm == false and settingFlyer == true) then
				unit.trigger_target_mask = {"air-unit"}
				--log('"air-unit" trigger_target_mask set on unit "'..name..'"')
			else
				if unit.trigger_target_mask ~= nil then
					table.insert(unit.trigger_target_mask, "air-unit")
				else
					unit.trigger_target_mask = {"air-unit", "ground-unit", "common"}
				end
				--log('"air-unit" trigger_target_mask assigned to unit "'..name..'"')
			end
		end
	end
end

if mods["kj_2a6"] then
	local multiplier = 1
	if mods["kj_maustank"] then
		prerequisites_mod = "kj_maustank"
		multiplier = 0.5
	elseif mods["kj_panzer4"] then
		prerequisites_mod = "kj_panzer4"
		multiplier = 0.75
	else
		prerequisites_mod = "tank"
	end

	data.raw["technology"]["kj_2a6"].unit.count = multiplier * data.raw["technology"]["kj_2a6"].unit.count

	table.insert(data.raw["technology"]["kj_2a6"].prerequisites, prerequisites_mod)
end

if mods["kj_40kbunker"] then
	data.raw["car"]["kj_40kbunker"].sound_no_fuel = nil
end

if mods["kj_40kbaneblade"] then
	if mods["kj_40klemanruss"] then
		table.insert(data.raw["technology"]["kj_40kbaneblade"].prerequisites, "kj_40klemanruss")
	else
		if mods["kj_40kpredator"] then
			table.insert(data.raw["technology"]["kj_40kbaneblade"].prerequisites, "kj_40kpredator")
		else
			table.insert(data.raw["technology"]["kj_40kbaneblade"].prerequisites, "tank")
			table.insert(data.raw["technology"]["kj_40kbaneblade"].prerequisites, "kj_gasoline")
		end
	end

	if mods["Wh40k_Armoury_fork"] or mods["Wh40k_Armoury"] then
		data.raw["gun"]["kj_baneblade_bolter"].attack_parameters["ammo_category"] = "bolt100"
		table.insert(data.raw["technology"]["kj_40kbaneblade"].prerequisites, "basic-bolter")
	else
		table.insert(data.raw["technology"]["kj_40kbaneblade"].effects, {type = "unlock-recipe", recipe = "kj_bolt"})
	end
end

if mods["kj_40kdreadnought"] then
	if mods["kj_40kpredator"] then
		table.insert(data.raw["technology"]["kj_40kdreadnought"].prerequisites, "kj_40kpredator")
	else
		table.insert(data.raw["technology"]["kj_40kdreadnought"].prerequisites, "tank")
	end

	if mods["Wh40k_Armoury_fork"] or mods["Wh40k_Armoury"] then
		data.raw["gun"]["kj_bolter"].attack_parameters["ammo_category"] = "bolt100"
		table.insert(data.raw["technology"]["kj_40kdreadnought"].prerequisites, "basic-bolter")

	else
		table.insert(data.raw["technology"]["kj_40kdreadnought"].effects, {type = "unlock-recipe", recipe = "kj_bolt"})
	end
end

if mods["kj_40klemanruss"] then
	if mods["kj_40kpredator"] then
		table.insert(data.raw["technology"]["kj_40klemanruss"].prerequisites, "kj_40kpredator")
	else
		table.insert(data.raw["technology"]["kj_40klemanruss"].prerequisites, "tank")
		table.insert(data.raw["technology"]["kj_40klemanruss"].prerequisites, "kj_gasoline")
	end


	if mods["Wh40k_Armoury_fork"] or mods["Wh40k_Armoury"] then
		data.raw["gun"]["kj_lemanruss_bolter"].attack_parameters["ammo_category"] = "bolt100"
		table.insert(data.raw["technology"]["kj_40klemanruss"].prerequisites, "basic-bolter")
	else
		table.insert(data.raw["technology"]["kj_40klemanruss"].effects, {type = "unlock-recipe", recipe = "kj_bolt"})
	end
end

if mods["kj_40kpredator"] then
	if mods["Wh40k_Armoury_fork"] or mods["Wh40k_Armoury"] then
		data.raw["gun"]["kj_predator_bolter"].attack_parameters["ammo_category"] = "bolt100"
		table.insert(data.raw["technology"]["kj_40kpredator"].prerequisites, "basic-bolter")
	else
		table.insert(data.raw["technology"]["kj_40kpredator"].effects, {type = "unlock-recipe", recipe = "kj_bolt"})
	end
end

if mods["kj_maustank"] then
	if mods["kj_panzer4"] then
		table.insert(data.raw["car"]["kj_maustank"].guns, "kj_75kwk40")
		prerequisites_mod = "kj_panzer4"
	else
		prerequisites_mod = "tank"
	end

	table.insert(data.raw["technology"]["kj_maustank"].prerequisites, prerequisites_mod)
end

if mods["kj_rattetank"] then
	if mods["kj_maustank"] then
		prerequisites_mod = "kj_maustank"
	else
		prerequisites_mod = "tank"
	end
	table.insert(data.raw["technology"]["kj_rattetank"].prerequisites, prerequisites_mod)
end

if mods["kj_utilitarian"] then
	if mods["aai-vehicles-ironclad"] then
		data.raw["car"]["kj_utilitarian"].guns = {"ironclad-mortar"}
	end
end

if mods["kj_vierling"] then
	establishAA()

	if settings.startup["kj_vierling_nonAA"].value == true then
		require("prototypes.vierling")
	end

	data.raw["ammo-turret"]["kj_vierling"].attack_target_mask = {"air-unit", "flying"}

	if mods["kj_wirbelwind"] then
		if data.raw["ammo-turret"]["kj_vierling"] then
			table.insert(data.raw["ammo-turret"]["kj_vierling"].attack_parameters.ammo_categories, "kj_2cmfv")
		end
		if data.raw["gun"]["kj_2cmfv"] then
			if data.raw["gun"]["kj_2cmfv"].attack_parameters.ammo_categories then
				table.insert(data.raw["gun"]["kj_2cmfv"].attack_parameters.ammo_categories, "kj_2cmfv_vierling")
			else
				local category = data.raw["gun"]["kj_2cmfv"].attack_parameters.ammo_category
				data.raw["gun"]["kj_2cmfv"].attack_parameters.ammo_categories = {category, "kj_2cmfv_vierling"}
			end
		end
	end
end

if mods["kj_medieval_warfare"] then
	establishAA()

	local done = false
	if data.raw["technology"]["gun-turret"] ~= nil then
		table.insert(data.raw["technology"]["gun-turret"].effects, {type = "unlock-recipe", recipe = "kj_ballista"})
		table.insert(data.raw["technology"]["gun-turret"].effects, {type = "unlock-recipe", recipe = "kj_ballista_normal"})
		done = true
	else
		for _, tech in pairs(data.raw["technology"]) do
			if tech.effects ~= nil then
				for _, effect in pairs(tech.effects) do
					if effect.type == "unlock-recipe" and effect.recipe ~= nil and effect.recipe == "gun-turret" then
						table.insert(tech.effects, {type = "unlock-recipe", recipe = "kj_ballista"})
						table.insert(tech.effects, {type = "unlock-recipe", recipe = "kj_ballista_normal"})
						done = true
						break
					end
				end
			end
			if done == true then
				break
			end
		end
	end
	if done == false then
		data:extend({
            {
                type = "technology",
                name = "kj_ballista",
                icon = "__kj_medieval_warfare__/graphics/icon.png",
                icon_size = 128,
                effects = {
					{type = "unlock-recipe", recipe = "kj_ballista"},
					{type = "unlock-recipe", recipe = "kj_ballista_normal"}
				},
                prerequisites = {"automation-science-pack"},
                unit = {
					count = 10,
					time = 10,
					ingredients = {
						{"automation-science-pack", 10},
					}
				},
            },
		})
	end

	for i = 1, 5 do
		if data.raw['technology']['physical-projectile-damage-'..i] ~= nil then
			table.insert(data.raw['technology']['physical-projectile-damage-'..i]['effects'], {type = "ammo-damage", ammo_category = "kj_ballista_normal", modifier = 0.2})
		end
		if data.raw['technology']['weapon-shooting-speed-'..i] ~= nil then
			table.insert(data.raw['technology']['weapon-shooting-speed-'..i]['effects'], {type = "gun-speed", ammo_category = "kj_ballista_normal", modifier = 0.2})
		end
	end
	data.raw["ammo-turret"]["kj_ballista"].attack_target_mask = {"air-unit", "flying"}
end

if mods["kj_phalanx"] then
	establishAA()

	if settings.startup["kj_phalanx_nonAA"].value == true then
		require("prototypes.phalanx")
	end

	data.raw["ammo-turret"]["kj_phalanx"].attack_target_mask = {"air-unit", "flying"}
end

for name, entry in pairs(tables.techRequisites) do
	if mods[name] then
		for _, nameReq in pairs(entry.pres) do
			if mods[nameReq] then
				data.raw["technology"][name].prerequisites = {nameReq}
				data.raw["technology"][name].unit.count = entry.multiplicator * data.raw["technology"][name].unit.count

				if entry.additional ~= nil then
					for _, add in pairs(entry.additional) do
						if data.raw["technology"][add] ~= nil then
							table.insert(data.raw["technology"][name].prerequisites, add)
						end
					end
				end
				break
			end
		end
	end
end

local function changeRecipe(recipe, setting)
	local name = recipe

	if setting == nil then
		setting = name.."_cost_setting_multiplicator"
	end
	log("setting: "..setting)
	local recipeEnt = data.raw["recipe"][recipe]
	if recipeEnt ~= nil then
		for _, ingredient in ipairs(recipeEnt.ingredients) do
			if ingredient ~= nil and ingredient.amount ~= nil then
				ingredient.amount = ingredient.amount * settings.startup[setting].value
			end
		end
	else
		error('Recipe "'..recipe..'" not found! Pls notify the mod author!')
	end
end

for _, change in pairs(tables.recipeChanges) do
	if mods[change.modname] then
		if change.entries ~= nil then
			for _, entry in pairs(change.entries) do
				changeRecipe(entry.recipe, entry.setting)
			end
		else
			local name = change.modname
			local setting = change.modname.."_cost_setting_multiplicator"
			if change.recipe ~= nil then
				name = change.recipe
			end
			if change.setting ~= nil then
				setting = change.setting
			end

			changeRecipe(name, setting)
		end
	end
end
