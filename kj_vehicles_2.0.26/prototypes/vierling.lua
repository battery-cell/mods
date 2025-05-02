local vierling = table.deepcopy(data.raw["ammo-turret"]["kj_vierling"])
vierling.name = "kj_vierling_nonAA"
vierling.prepare_range = 0.5 * vierling.prepare_range --100
vierling.call_for_help_radius = 0.5 * vierling.call_for_help_radius --75
vierling.attack_parameters.range = 0.5 * vierling.attack_parameters.range --70
vierling.attack_parameters.rotate_penalty = nil
vierling.attack_parameters.health_penalty = nil
vierling.localised_name = {"", {"entity-name.kj_vierling"}}
vierling.localised_description = {"", {"entity-description.kj_vierling"}}
vierling.graphics_set.base_visualisation.animation.layers[1].tint = {r = 0.5, g = 0.73, b = 1, a = 1}

local vierlingItem = table.deepcopy(data.raw["item-with-entity-data"]["kj_vierling"])
vierlingItem.name = "kj_vierling_nonAA"
vierlingItem.icons = {{icon = vierlingItem.icon, icon_size = 128, tint = {r = 0.5, g = 0.73, b = 1, a = 1}}}
vierlingItem.order = vierlingItem.order.."-2[nonAA]"
vierlingItem.place_result = "kj_vierling_nonAA"
vierlingItem.localised_name = {"", {"item-name.kj_vierling"}}
vierlingItem.localised_description = {"", {"item-description.kj_vierling"}}

local icon = data.raw["item-with-entity-data"]["kj_vierling"].icon
data.raw["item-with-entity-data"]["kj_vierling"].icons = {{icon = icon, icon_size = 128, tint = {r = 1, g = 0.5, b = 0.5, a = 1}}}

data.raw["technology"]["kj_vierling"].localised_description = {"", {"technology-description.kj_vierling_nonAA"}}

data:extend({
	vierling,
	vierlingItem,
	{
		type = "recipe",
		name = "kj_vierling_nonAA",
		enabled = false,
		ingredients =
		{
			{type = "item", name = "kj_vierling", amount = 1},
		},
		energy_required = 1,
		results = {{type = "item", name = "kj_vierling_nonAA", amount = 1}},
	},
})

data.raw["item-with-entity-data"]["kj_vierling"].order = data.raw["item-with-entity-data"]["kj_vierling"].order.."-1[AA]"
table.insert(data.raw["technology"]["kj_vierling"].effects, {type = "unlock-recipe", recipe = "kj_vierling_nonAA"})
