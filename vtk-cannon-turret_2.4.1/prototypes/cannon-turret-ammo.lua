local item_sounds = require("__base__.prototypes.item_sounds")
local path = "__vtk-cannon-turret__"

if settings.startup["vtk-cannon-turret-ammo-use"].value == 1 or 3 then

-- New category for turret cannon shells
data:extend(
{
  {
    type = "ammo-category",
    name = "cannon-shell-magazine",
    icon = "__base__/graphics/icons/ammo-category/cannon-shell.png",
    subgroup = "ammo-category"
  },
})

-- New cannon turret shell magazine ammo items
-- same as shells but with magazin_size and the new cannon-shell-magazine ammo type exclusive to turrets.
data:extend(
{
  {
    type = "ammo",
    name = "cannon-shell-magazine",
    description = "cannon-shell-magazine",
    icon = path .. "/graphics/icons/cannon-shell-magazine.png",
    icon_size = 64,
    ammo_category = "cannon-shell-magazine",
    ammo_type =
    {
      category = "cannon-shell-magazine",
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "cannon-magazine-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 35,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
        }
      },
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "d[cannon-shell]-a[basic]-m[magazine]",
    stack_size = 20,
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    weight = 20 * 12 * kg
  },
  {
    type = "ammo",
    name = "explosive-cannon-shell-magazine",
    description = "explosive-cannon-shell-magazine",
    icon = path .. "/graphics/icons/explosive-cannon-shell-magazine.png",
    icon_size = 64,
    ammo_category = "cannon-shell-magazine",
    ammo_type =
    {
      category = "cannon-shell-magazine",
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "explosive-cannon-magazine-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 35,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
        }
      },
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "d[cannon-shell]-c[explosive]-m[magazine]",
    stack_size = 20,
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    weight = 20 * 12 * kg
  },
  {
    type = "ammo",
    name = "uranium-cannon-shell-magazine",
    description = "uranium-cannon-shell-magazine",
    icon = path .. "/graphics/icons/uranium-cannon-shell-magazine.png",
    icon_size = 64,
    ammo_category = "cannon-shell-magazine",
    ammo_type =
    {
      category = "cannon-shell-magazine",
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "uranium-cannon-magazine-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 35,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
        }
      },
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "d[cannon-shell]-c[uranium]-m[magazine]",
    stack_size = 20,
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    weight = 40 * 12 * kg
  },
  {
    type = "ammo",
    name = "explosive-uranium-cannon-shell-magazine",
    description = "explosive-uranium-cannon-shell-magazine",
    icon = path .. "/graphics/icons/explosive-uranium-cannon-shell-magazine.png",
    icon_size = 64,
    ammo_category = "cannon-shell-magazine",
    ammo_type =
    {
      category = "cannon-shell-magazine",
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "explosive-uranium-cannon-magazine-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 35,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
        }
      },
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "d[explosive-cannon-shell]-c[uranium]-m[magazine]",
    stack_size = 20,
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    weight = 40 * 12 * kg
  },
})

-- Blueprints for new turrent cannon ammo shell magazine

-- All cannon turret ammo shell magazine share the same receipe appart from the base shell ingredient
-- inputs = array(name, ingredient)
function build_ammo_recipe(inputs)
return
{
  type = "recipe",
  name = inputs.name,
  enabled = false,
  energy_required = 2,
  auto_recycle = false, -- ammo magazine recycle into themselves
  ingredients = 
  {
    {
      type = "item",
      name = "iron-plate",
      amount = 2
    },
    {
      type = "item",
      name = "plastic-bar",
      amount = 1
    },
    {
      type = "item",
      name = inputs.ingredient,
      amount = 10
    },
  },
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
  build_ammo_recipe{name = "cannon-shell-magazine", ingredient = "cannon-shell"},
  build_ammo_recipe{name = "explosive-cannon-shell-magazine", ingredient = "explosive-cannon-shell"},
  build_ammo_recipe{name = "uranium-cannon-shell-magazine", ingredient = "uranium-cannon-shell"},
  build_ammo_recipe{name = "explosive-uranium-cannon-shell-magazine", ingredient = "explosive-uranium-cannon-shell"},
})

--
-- New projectiles behavior for cannon turret shell magazine, same as shells but without firendly entities collision
--
local proj = table.deepcopy(data.raw["projectile"]["cannon-projectile"])
proj.name = "cannon-magazine-projectile"
proj.flags = {}
proj.direction_only = true -- make projectile vectorized instead of exploding on target
proj.force_condition = "not-same"
proj.hit_collision_mask = {layers={object=true, player=true, train=true, trigger_target=true}}

local projura = table.deepcopy(data.raw["projectile"]["uranium-cannon-projectile"])
projura.name = "uranium-cannon-magazine-projectile"
projura.flags = {}
projura.direction_only = true -- make projectile vectorized instead of exploding on target
projura.force_condition = "not-same"
projura.hit_collision_mask = {layers={object=true, player=true, train=true, trigger_target=true}}

local projexp = table.deepcopy(data.raw["projectile"]["explosive-cannon-projectile"])
projexp.name = "explosive-cannon-magazine-projectile"
projexp.flags = {}
projexp.direction_only = true
projexp.force_condition = "not-same"
projexp.hit_collision_mask = {layers={object=true, player=true, train=true, trigger_target=true}}

local projuraexp = table.deepcopy(data.raw["projectile"]["explosive-uranium-cannon-projectile"])
projuraexp.name = "explosive-uranium-cannon-magazine-projectile"
projuraexp.flags = {}
projuraexp.direction_only = true
projuraexp.force_condition = "not-same"
projuraexp.hit_collision_mask = {layers={object=true, player=true, train=true, trigger_target=true}}

if settings.startup["vtk-cannon-turret-explosion-ff"].value == false then
  projexp["final_action"]["action_delivery"]["target_effects"][2]["action"].force = "not-same"
  projuraexp["final_action"]["action_delivery"]["target_effects"][2]["action"].force = "not-same"
end

data:extend(
{
  proj,
  projexp,
  projura,
  projuraexp,
})

end