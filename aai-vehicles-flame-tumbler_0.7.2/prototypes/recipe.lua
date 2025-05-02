data:extend({{
	type = "recipe",
	name = "vehicle-flame-tumbler",
	ingredients =
	{
		{type="item", name="car", amount=1},
		{type="item", name="steel-plate", amount=25},
		{type="item", name="engine-unit", amount=25},
		{type="item", name="advanced-circuit", amount=25}
	},
	enabled = data.raw["technology"]["automobilism"] == nil,
	energy_required = 5,
	results=
	{
	  {type="item", name="vehicle-flame-tumbler", amount=1},
	}
}})

-- fix ammo after 0.15
if not data.raw.recipe["flamejet-ammo"] then
  local flamejet = table.deepcopy(data.raw.recipe["flamethrower-ammo"])
  flamejet.results = {{type = "item", name="flamejet-ammo", amount=1}}
  flamejet.name = "flamejet-ammo"
  table.insert(data.raw["technology"]["flamethrower"].effects, {type = "unlock-recipe", recipe = "flamejet-ammo"})
  data:extend({flamejet})
end
