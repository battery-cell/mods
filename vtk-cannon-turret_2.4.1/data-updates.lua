
if mods["Age-of-Production"] then
    -- in AOP mod create new dedicated recipes for the armory to directly build productivity enabled batch recipes directly from raw materials
    function build_ammo_recipe_aop(inputs)
      return
      {
        type = "recipe",
        name = inputs.name.."-batch",
        enabled = false,
        energy_required = 2,
        auto_recycle = false, -- ammo magazine recycle into themselves
        category = inputs.category,
        -- test if this is needed by raw armory factory productivity
        -- but may enable it anyway to benefit from module since the recipe is only available in this special factory
        allow_productivity = true,
        ingredients = inputs.ingredients,
        results = {
          {
            type = "item",
            name = inputs.name,
            amount = 1
          }
        },
        requester_paste_multiplier = 10,
      }
    end
    
    data:extend(
    {
      build_ammo_recipe_aop{name = "cannon-shell-magazine", category = "ammunition", ingredients =
      {
        {type = "item", name = "steel-plate", amount = 20},
        {type = "item", name = "plastic-bar", amount = 21},
        {type = "item", name = "explosives", amount = 10},
        {type = "item", name = "iron-plate", amount = 2},
      }},
      build_ammo_recipe_aop{name = "explosive-cannon-shell-magazine", category = "ammunition", ingredients =
      {
        {type = "item", name = "steel-plate", amount = 20},
        {type = "item", name = "plastic-bar", amount = 21},
        {type = "item", name = "explosives", amount = 20},
        {type = "item", name = "iron-plate", amount = 2},
      }},
      build_ammo_recipe_aop{name = "uranium-cannon-shell-magazine", category = "advanced-centrifuging", ingredients =
      {
        {type = "item", name = "steel-plate", amount = 20},
        {type = "item", name = "plastic-bar", amount = 21},
        {type = "item", name = "explosives", amount = 10},
        {type = "item", name = "uranium-238", amount = 10},
        {type = "item", name = "iron-plate", amount = 2},
      }},
      build_ammo_recipe_aop{name = "explosive-uranium-cannon-shell-magazine", category = "advanced-centrifuging", ingredients =
      {
        {type = "item", name = "steel-plate", amount = 20},
        {type = "item", name = "plastic-bar", amount = 21},
        {type = "item", name = "explosives", amount = 20},
        {type = "item", name = "uranium-238", amount = 10},
        {type = "item", name = "iron-plate", amount = 2},
      }},
    })
    
    -- add new recipes to tech unlock
    -- Set new -batch recipes to unlock with the AOP armory
    if settings.startup["vtk-cannon-turret-ammo-use"].value == 1 or
    settings.startup["vtk-cannon-turret-ammo-use"].value == 3 then
        table.insert(data.raw["technology"]["aop-armory"]["effects"], {type = "unlock-recipe", recipe = "cannon-shell-magazine-batch"})
        table.insert(data.raw["technology"]["aop-armory"]["effects"], {type = "unlock-recipe", recipe = "explosive-cannon-shell-magazine-batch"})
        table.insert(data.raw["technology"]["aop-atomic-enricher"]["effects"], {type = "unlock-recipe", recipe = "uranium-cannon-shell-magazine-batch"})
        table.insert(data.raw["technology"]["aop-atomic-enricher"]["effects"], {type = "unlock-recipe", recipe = "explosive-uranium-cannon-shell-magazine-batch"})
    end
end