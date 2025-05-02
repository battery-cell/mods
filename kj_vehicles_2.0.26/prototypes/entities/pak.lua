local utils = require("utils")
local modname = "__kj_pak__"
local tank_gunshot =
{
  {
    filename = "__kj_pak__/sounds/cannon1.ogg",
    volume = 0.7
  },
  {
    filename = "__kj_pak__/sounds/cannon2.ogg",
    volume = 0.7
  },
  {
    filename = "__kj_pak__/sounds/cannon3.ogg",
    volume = 0.7
  },
  {
    filename = "__kj_pak__/sounds/cannon4.ogg",
    volume = 0.7
  },
  {
    filename = "__kj_pak__/sounds/cannon5.ogg",
    volume = 0.7
  },
}

data:extend({
  {
    type = "car",
    name = "kj_pak",
    minable = {mining_time = 3, result = "kj_pak"},
    corpse = "big-remnants",
    dying_explosion = "tank-explosion",
	  render_layer = "lower-object-above-shadow",
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    selection_box = {{-0.75, -0.75}, {0.75, 0.75}},
    sticker_box = {{-0.75, -0.75}, {0.75, 0.75}},
    tank_driving = true,
    turret_return_timeout = 36000,
	  has_belt_immunity = false,
    guns = {"kj_pak_gun"},
    is_military_target = true,
    allow_remote_driving = true,

    energy_source =
    {
      type = "void",
      render_no_power_icon = false,
    },
    animation = util.empty_animation(1),
	  turret_animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "pak", 720, {1,1}, {8,8}, 2, 1),
        utils.layerMaker(modname, "", "pak", 720, {1,1}, {8,8}, 2, 2),
      }
    },
    working_sound =
    {
      sound =
      {
        filename = "__kj_pak__/sounds/engine.ogg",
        volume = 0
      },
      activate_sound =
      {
        filename = "__kj_pak__/sounds/engine-start.ogg",
        volume = 0
      },
      deactivate_sound =
      {
        filename = "__kj_pak__/sounds/engine-stop.ogg",
        volume = 0
      },
      match_speed_to_activity = true
    },
    open_sound = {filename = "__base__/sound/artillery-open.ogg", volume = 0.7 },
    close_sound = {filename = "__base__/sound/artillery-close.ogg", volume = 0.7 },
  },
  
  {
	type = "ammo-turret",
    name = "kj_pak_turret",
    icon = "__kj_pak__/graphics/icon.png",
    icon_size = 128,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "building-direction-8-way", "not-flammable"},
    minable = {mining_time = 3, result = "kj_pak_turret"},
	  mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    max_health = 1000,
    corpse = "big-remnants",
    resistances =
    {
      {
        type = "fire",
        decrease = 20,
        percent = 90
      },
      {
        type = "physical",
        decrease = 30,
        percent = 75
      },
      {
        type = "impact",
        decrease = 20,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 20,
        percent = 50
      },
      {
        type = "acid",
        decrease = 15,
        percent = 50
      }
    },
    dying_explosion = "tank-explosion",
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    selection_box = {{-0.75, -0.75}, {0.75, 0.75}},
    sticker_box = {{-0.75, -0.75}, {0.75, 0.75}},
    graphics_set =
    {
      base_visualisation =
      {
        animation = util.empty_animation(1)
      },
    },
	  folded_animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "pak", 720, {1,1}, {8,8}, 2, 1),
        utils.layerMaker(modname, "", "pak", 720, {1,1}, {8,8}, 2, 2),
      }
    },
    vehicle_impact_sound = generic_impact,
    open_sound = {filename = "__base__/sound/artillery-open.ogg", volume = 0.7 },
    close_sound = {filename = "__base__/sound/artillery-close.ogg", volume = 0.7 },
    rotation_speed = 0.08 / 60,
    preparing_speed = 1,
    folding_speed = 1,
    automated_ammo_count = 10,
    attacking_speed = 1,
    alert_when_attacking = true,
    inventory_size = 1,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "kj_pak",
      cooldown = 180,
      health_penalty = -50,
      rotate_penalty = 50,
      fire_penalty = 50,
      --warmup = 20,
      cooldown_deviation = 0.5,
      projectile_creation_distance = 4.4,
      projectile_center = {0, -0.8},
      range = 150,
      sound = tank_gunshot,
    },
    shoot_in_prepare_state = false,
    has_belt_immunity = false,
    call_for_help_radius = 50,
  },
})