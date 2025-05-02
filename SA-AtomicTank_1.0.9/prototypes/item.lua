local sounds = require("prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local path = ('__SA-AtomicTank__')

data:extend(
{


  {
    type = "item-with-entity-data",
    name = "sa-atomic-tank",
    icon = path .. "/graphics/icons/t1atomicon.png",
    icon_size = 128,
    subgroup = "transport",
    order = "b[personal-transport]-b[tank]",
    place_result = "sa-atomic-tank",
    stack_size = 1
  },
  {
    type = "recipe",
    name = "sa-atomic-tank",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 100},
      {type = "item", name = "copper-plate", amount = 100},
      {type = "item", name = "electronic-circuit", amount = 15},
      {type = "item", name = "advanced-circuit", amount = 10},
      {type = "item", name = "tank", amount = 1},
      {type = "item", name = "electric-engine-unit", amount = 25}
    },
    results = {{type="item", name="sa-atomic-tank", amount=1}}
  },
  {
    type = "recipe",
    name = "t1-atom-shell",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "explosive-uranium-cannon-shell", amount = 1},
      {type = "item", name = "uranium-238", amount = 2}
    },
    results = {{type="item", name="t1-atom-shell", amount=1}}
  },  
  {
    type = "gun",
    name = "t1atom-cannon",
    icon = path .. "/graphics/icons/t1turreticon.png",
    icon_size = 128, icon_mipmaps = 3,
    hidden = true,
    subgroup = "gun",
    order = "z[tank]-a[cannon]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "t1-atom-shell",
      cooldown = 80,
      movement_slow_down_factor = 0,
      projectile_creation_distance = 3.2,
      projectile_center = {0,0},
      range = 40,
      sound = {
        {
          filename = "__base__/sound/fight/artillery-shoots-1.ogg",
          volume = 0.5
        },
        {
          filename = "__base__/sound/fight/artillery-shoots-2.ogg",
          volume = 0.6
        }
      },
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "t1atom-cannon-b",
    icon = path .. "/graphics/icons/t1turreticon.png",
    icon_size = 128, icon_mipmaps = 3,
    hidden = true,
    subgroup = "gun",
    order = "z[tank]-a[cannon]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "cannon-shell",
      cooldown = 60,
      movement_slow_down_factor = 0,
      projectile_creation_distance = 3.2,
      projectile_center = {0,0},
      range = 40,
      sound = {
        {
          filename = "__base__/sound/fight/artillery-shoots-1.ogg",
          volume = 0.5
        },
        {
          filename = "__base__/sound/fight/artillery-shoots-2.ogg",
          volume = 0.6
        }
      },
    },
    stack_size = 1
  },

--------------------------T1-Atomic-Shell

  {
    type = "ammo",
    name = "t1-atom-shell",
    icon = path .. "/graphics/icons/t1atomshell.png",
    ammo_category = "t1-atom-shell",
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = path .. "/graphics/icons/t1atomshell.png",
          scale = 0.25,
          mipmap_count = 4
        },
        {
          draw_as_glow = true,
          size = 64,
          filename = path .. "/graphics/icons/t1atomshellglow.png",
          scale = 0.25,
        }
      }
    },
    ammo_type =
    {
      category = "t1-atom-shell",
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "t1-atomic-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 40,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[cannon-shell]-c[uranium]",
    stack_size = 200,
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 100,
    weight = 20*kg
  },
})