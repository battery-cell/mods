data:extend(
{
  {
    type = "technology",
    name = "tomega-drill",
    icon = "__OmegaDrill__/graphics/icons/tomega-drill-large.png",
	icon_size = 128,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "tomega-drill"
      },
    },
    prerequisites = { "big-mining-drill", "omega-drill"},
    unit = {
      count = 400,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
		{"metallurgic-science-pack", 1}
      },
      time = 20
    },
    order = "c-g-b-z",
  },
})