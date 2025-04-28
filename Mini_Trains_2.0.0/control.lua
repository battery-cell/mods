local lib = {}

local test = function(entity)
  rendering.set_use_target_orientation(rendering.draw_polygon
  {
    color = { r = 0, g = 1, b = 0, a = 0.5 },
    filled = true,
    target = entity,
    vertices = { {target = { 0, 1 }}, {target = { 1, 0 }}, {target = { 0, -1 }} },
    surface = entity.surface,
    orientation_target = entity,
    orientation = 0.75,
    x_scale = 0.5,
    y_scale = 0.5,
    render_layer = "object",
    draw_on_ground = false,
    use_target_orientation = false
  }, true)
  rendering.draw_sprite
  {
    sprite = "utility/go_to_arrow",
    target = entity,
    surface = entity.surface,
    orientation_target = entity,
    orientation = 0.75,
    oriented_offset = { 0, 0.25 },
    target_offset = { 0, -1.5 },
    x_scale = 0.5,
    y_scale = 0.5,
    render_layer = "object",
    draw_on_ground = true,
    use_target_orientation = true
  }
  rendering.draw_animation
  {
    animation = "poopy",
    target = entity,
    surface = entity.surface,
    orientation_target = entity,
    orientation = 0,
    oriented_offset = { 0, 0.25 },
    target_offset = { 0, -1.5 },
    x_scale = 0.5,
    y_scale = 0.5,
    render_layer = "object",
    draw_on_ground = true,
    use_target_orientation = true
  }
end

lib.events =
{
  [defines.events.on_built_entity] = function(event)
    local entity = event.created_entity
    if entity.name == "mini-locomotive" then
      test(entity)
    end
  end
}

local event_handler = require("event_handler")
--event_handler.add_lib(lib)
