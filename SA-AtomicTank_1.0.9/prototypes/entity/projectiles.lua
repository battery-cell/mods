local path = ('__SA-AtomicTank__')
local explosion_animations = require("__base__.prototypes.entity.explosion-animations")
local smoke_animations = require("__base__.prototypes.entity.smoke-animations")
local sounds = require("__base__.prototypes.entity.sounds")


data:extend{
    
  {
    type = "projectile",
    name = "t1-atomic-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0,
    direction_only = true,
    piercing_damage = 600,
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "set-tile",
            tile_name = "nuclear-ground",
            radius = 6,
            apply_projection = true,
            tile_collision_mask = { layers={water_tile=true} }
          },
          {
            type = "destroy-cliffs",
            radius = 9,
            explosion = "explosion"
          },
          {
            type = "create-entity",
            entity_name = "mininuke-explosion"
          },
          {
            type = "camera-effect",
            effect = "screen-burn",
            duration = 50,
            ease_in_duration = 2,
            ease_out_duration = 50,
            delay = 0,
            strength = 5,
            full_strength_max_distance = 200,
            max_distance = 800
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion(0.9),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 1000,
            -- volume_modifier = 1,
            audible_distance_modifier = 3
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion_aftershock(0.4),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 1000,
            -- volume_modifier = 1,
            audible_distance_modifier = 3
          },
          {
            type = "damage",
            damage = {amount = 200, type = "explosion"}
          },
          {
            type = "damage",
            damage = {amount = 200, type = "physical"}
          },
          {
            type = "create-entity",
            entity_name = "huge-scorchmark",
            scale = 0.5,
            offsets = {{ 0, -0.5 }},
            check_buildability = true
          },
          {
            type = "invoke-tile-trigger",
            repeat_count = 1
          },
          {
            type = "destroy-decoratives",
            include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
            include_decals = true,
            invoke_decorative_trigger = true,
            decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
            radius = 14 -- large radius for demostrative purposes
          },
          {
            type = "create-decorative",
            decorative = "nuclear-ground-patch",
            spawn_min_radius = 6.5,
            spawn_max_radius = 8.5,
            spawn_min = 30,
            spawn_max = 40,
            apply_projection = true,
            spread_evenly = true
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 1000,
              radius = 7,
              action_delivery =
              {
                type = "projectile",
                projectile = "mini-atomic-bomb-ground-zero-projectile",
                starting_speed = 0.6 * 0.8,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation
              }
            }
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 1000,
              radius = 18,
              action_delivery =
              {
                type = "projectile",
                projectile = "mini-atomic-bomb-wave",
                starting_speed = 0.5 * 0.7,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation
              }
            }
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 1000,
              radius = 13,
              action_delivery =
              {
                type = "projectile",
                projectile = "mini-atomic-bomb-wave-spawns-cluster-nuke-explosion",
                starting_speed = 0.5 * 0.7,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation
              }
            }
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 700,
              radius = 4,
              action_delivery =
              {
                type = "projectile",
                projectile = "mini-atomic-bomb-wave-spawns-fire-smoke-explosion",
                starting_speed = 0.5 * 0.65,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation
              }
            }
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 1000,
              radius = 13,
              action_delivery =
              {
                type = "projectile",
                projectile = "mini-atomic-bomb-wave-spawns-nuke-shockwave-explosion",
                starting_speed = 0.5 * 0.65,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation
              }
            }
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 300,
              radius = 13,
              action_delivery =
              {
                type = "projectile",
                projectile = "mini-atomic-bomb-wave-spawns-nuclear-smoke",
                starting_speed = 0.5 * 0.65,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation
              }
            }
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 10,
              radius = 8,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "create-entity",
                    entity_name = "nuclear-smouldering-smoke-source",
                    tile_collision_mask = { layers={water_tile=true} }
                  }
                }
              }
            }
          }
        }
      }
    },
    --light = {intensity = 0.8, size = 15},
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      draw_as_glow = true,
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    }
      
  },
  -----------------------------------------------------------------------
  -- SHOCKWAVE projectiles
  -----------------------------------------------------------------------
  {
    type = 'projectile',
    name = 'mini-atomic-bomb-wave-spawns-nuke-shockwave-explosion',
    flags = { 'not-on-map' },
    acceleration = 0,
    speed_modifier = { 1, 0.707 },
    action = {
      {
        type = 'direct',
        action_delivery = {
          type = 'instant',
          target_effects = {
            {
              type = 'create-explosion',
              entity_name = 'mini-atomic-nuke-shockwave',
              max_movement_distance = _ENV.max_nuke_shockwave_movement_distance,
              max_movement_distance_deviation = _ENV.max_nuke_shockwave_movement_distance_deviation,
              inherit_movement_distance_from_projectile = true,
              cycle_while_moving = true
            }
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  }, {
    type = 'projectile',
    name = 'mini-atomic-bomb-wave-spawns-nuclear-smoke',
    flags = { 'not-on-map' },
    acceleration = 0,
    speed_modifier = { 1.000, 0.707 },
    action = {
      {
        type = 'direct',
        action_delivery = {
          type = 'instant',
          target_effects = {
            {
              repeat_count = 10,
              type = 'create-trivial-smoke',
              smoke_name = 'mini-nuclear-smoke',
              offset_deviation = { { -2, -2 }, { 2, 2 } },
              starting_frame = 10,
              starting_frame_deviation = 20,
              starting_frame_speed = 0,
              starting_frame_speed_deviation = 5,
              speed_from_center = 0.035
            }
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  }, {
    type = 'projectile',
    name = 'mini-atomic-bomb-wave-spawns-fire-smoke-explosion',
    flags = { 'not-on-map' },
    acceleration = 0,
    speed_modifier = { 1, 0.707 },
    action = {
      {
        type = 'direct',
        action_delivery = {
          type = 'instant',
          target_effects = {
            {
              type = 'create-explosion',
              entity_name = 'mini-atomic-fire-smoke',
              max_movement_distance = _ENV.max_nuke_shockwave_movement_distance,
              max_movement_distance_deviation = _ENV.max_nuke_shockwave_movement_distance_deviation,
              inherit_movement_distance_from_projectile = true,
              cycle_while_moving = true
            }
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  }, {
    type = 'projectile',
    name = 'mini-atomic-bomb-wave-spawns-cluster-nuke-explosion',
    flags = { 'not-on-map',},
    hidden = true,
    acceleration = 0.001,
    speed_modifier = { 1.0, 0.707 },
    action = {
      {
        type = 'direct',
        action_delivery = {
          type = 'instant',
          target_effects = {
            {
              type = 'create-entity',
              entity_name = 'mini-cluster-nuke-explosion'
              -- following properties are recognized only be "create-explosion" trigger
              -- max_movement_distance = max_nuke_shockwave_movement_distance,
              -- max_movement_distance_deviation = max_nuke_shockwave_movement_distance_deviation,
              -- inherit_movement_distance_from_projectile = true
            }
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  }, {
    type = 'projectile',
    name = 'mini-atomic-bomb-wave',
    flags = { 'not-on-map' },
    acceleration = 0,
    speed_modifier = { 1.0, 0.707 },
    action = {
      {
        type = 'area',
        radius = 3,
        ignore_collision_condition = true,
        action_delivery = {
          type = 'instant',
          target_effects = {
            type = 'damage',
            vaporize = false,
            lower_distance_threshold = 0,
            upper_distance_threshold = 35,
            lower_damage_modifier = 1,
            upper_damage_modifier = 0.1,
            damage = { amount = 150, type = 'explosion' }
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  }, {
    type = 'projectile',
    name = 'mini-atomic-bomb-ground-zero-projectile',
    flags = { 'not-on-map' },
    acceleration = 0,
    speed_modifier = { 1.0, 0.707 },
    action = {
      {
        type = 'area',
        radius = 3,
        ignore_collision_condition = true,
        action_delivery = {
          type = 'instant',
          target_effects = {
            type = 'damage',
            vaporize = true,
            lower_distance_threshold = 0,
            upper_distance_threshold = 35,
            lower_damage_modifier = 1,
            upper_damage_modifier = 0.01,
            damage = { amount = 75, type = 'explosion' }
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  },
}

