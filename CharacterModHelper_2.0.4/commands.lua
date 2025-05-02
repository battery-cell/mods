local commands = {}

local function print_err_msg(player, msg, ...)
  CMH.entered_function({player, msg, ...})

  local args = ...
CMH.show("args", type(args))
  if type(args) == "number" or type(args) == "string" then
    args = {args}
  elseif type(args) ~= "table" then
    args = nil
  end
CMH.show("args", args)
  CMH.assert(msg, "string", "name of error message")
  player.print({
    "CMH-command-errors.error",
    {"CMH-command-errors."..msg, args and table.unpack(args)}
  })
end


-- Create a new character for the player issuing this command
commands.CMH_make_character = function(command)
  CMH.entered_command(command)

  local player = game.players[command.player_index]
  local controller = player.controller_type

  -- We can skip this if the player already has a character, …
  if player.character and player.character.valid then
    print_err_msg(player, "CMH-make-character-have-char")
    CMH.entered_command(command, "leave", "player already has a character")
    return

  -- … is not in god mode, …
  elseif controller ~= defines.controllers.god then
    print_err_msg(player, "CMH-make-character-not-god")
    CMH.entered_command(command, "leave", "player is in "..
                                          CMH.controller_names[controller].." mode")
    return

  -- … or has been put in god mode because Space Exploration's remote view is active.
  elseif CMH.SE_remote_view(player) then
    print_err_msg(player, "CMH-make-character-SE-remote-view")
    CMH.entered_command(command, "leave", "player is in "..
                                          CMH.controller_names[controller].." mode")
    return
  end

  local s = player.surface
  local pos = CMH.normalize_position(player.position)
  local step = 3
  local can_place, direction, d_x, d_y

  -- If we can't place the character at the current position, look for a
  -- good position, moving towards {0, 0}.
  local function recalc(x, y)
    local dy = (y > 0 and -1) or (y < 0 and 1) or 0
    local dx = (x > 0 and -1) or (x < 0 and 1) or 0
    local v = (dy < 0 and "north") or (dy > 0 and "south") or ""
    local h = (dx < 0 and "west") or (dx > 0 and "east") or ""
    local dir = (v ~= "" or h ~= "") and defines.direction[v..h] or nil
    return dx, dy, dir
  end

  local function round_up_or_down(dir, value)
    local ret
    if dir and value then
      ret = (dir < 0 and math.floor(value)) or
            (dir > 0 and math.ceil(value)) or
            value
    end
    return ret
  end

  CMH.writeDebug("Looking for valid position to place character (currently: %s).",
                  {pos}, "line")
  repeat
    -- Can we place the entity?
    CMH.writeDebug("Checking position %s.", {pos}, "line")
    can_place = s.can_place_entity({
      name = "character",
      position = pos,
      direction = direction,
      force = player.force,
      build_check_type = defines.build_check_type.manual
    })

    -- Can't place the character yet. Find another position?
    if not can_place then
      -- Break out of the loop when we've arrived near {0, 0}!
      if round_up_or_down(d_x, pos.x) == 0 and round_up_or_down(d_y, pos.y) == 0 then
        CMH.writeDebug("Giving up! Current position: %s", {pos})
        break

      -- Calculate the next position!
      else
        d_x, d_y, direction = recalc(pos.x, pos.y)
        pos.x = pos.x + (d_x * step)
        pos.y = pos.y + (d_y * step)
      end
    end

  -- Success!
  until can_place

  -- If we've found a position where we can place the character, create it there!
  if can_place then
    player.character = s.create_entity({
      name = "character",
      position = pos,
      direction = direction,
      force = player.force,
      raise_built = true,
    })
    player.print({"CMH-command-output.CMH-make-character-success"})
    CMH.writeDebug("Created %s for %s at position %s!",
                    {CMH.argprint(player.character), CMH.argprint(player), pos},
                    "line"  )

  -- Ask the player to move to another position and try again
  else
    print_err_msg(player, "CMH-make-character-need-new-position")
  end

  CMH.entered_command(command, "leave")
end


-- Teleport player issuing this command
commands.CMH_move = function(command)
  CMH.entered_command(command)

  local player = game.players[command.player_index]

  local direction, distance
  if command.parameter then
    direction = command.parameter:match("^%s*(%a+).*$")
    distance  = command.parameter:match("^.-(%d+).*$")
  end
CMH.show("direction", direction)
CMH.show("distance", distance)
  distance = tonumber(distance)

  -- Leave if distance is not a number!
  if not direction then
    print_err_msg(player, "CMH-move-invalid-direction", "")
    CMH.entered_command(command, "leave", "invalid direction: "..tostring(direction))
    return

  elseif not distance then
    print_err_msg(player, "CMH-move-invalid-distance", distance)
    CMH.entered_command(command, "leave", tostring(distance).." is not a valid distance")
    return

  --~ -- Convert distance from chunks to tiles
  --~ else
    --~ distance = distance * 32
  --~ end
  end

  local function clamp(value, min_value, max_value)
    CMH.entered_function({value, min_value, max_value})

    if max_value < min_value then
      min_value, max_value = max_value, min_value
    end
    CMH.show("min_value", min_value)
    CMH.show("max_value", max_value)
    return (value > max_value and max_value) or
            (value < min_value and min_value) or
            value
  end

  -- Convert distance from chunks to tiles
  distance = clamp(distance, 1, 20) * 32
  --~ end

  direction = direction:lower()

  local directions = {
    n = {0, -1},  north = {0, -1},
    e = {1, 0},   east  = {1, 0},
    s = {0, 1},   south = {0, 1},
    w = {-1, 0},  west  = {-1, 0},
  }

  local pos = CMH.normalize_position(player.position)
  local shift = directions[direction]
CMH.show("shift", shift)
  if shift then
    local x, y = pos.x + shift[1] * distance, pos.y + shift[2] * distance

    CMH.writeDebug("Trying to teleport player %s tiles (%s)!",
                    {distance, direction})
    player.teleport({clamp(x, -10^6, 10^6), clamp(y, -10^6, 10^6)})
    local c_x, c_y = player.position.x/32, player.position.y/32
    if not player.force.is_chunk_charted(player.surface, {c_x, c_y}) then
      CMH.writeDebug("Chunk is not charted!")
      local lt = {player.position.x - 16, player.position.y - 16}
      local rb = {player.position.x + 16, player.position.y + 16}
      player.force.chart(player.surface, {lt, rb})
    end
  else
    CMH.writeDebug("Invalid direction: %s", {CMH.enquote(direction)})
    print_err_msg(player, "CMH-move-invalid-direction", direction)
  end

  CMH.entered_command(command, "leave")
end


return commands
