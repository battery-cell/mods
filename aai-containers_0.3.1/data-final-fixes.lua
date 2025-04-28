if settings.startup["aai-containers-resize-1x1"].value == true then
  local chest_types = {"container", "logistic-container"}
  for _, type in pairs(chest_types) do
    for _, container in pairs(data.raw[type]) do
      if container.collision_box and container.collision_box[1] and container.collision_box[2]
        and container.collision_box[1][1] == -0.35 and container.collision_box[1][2] == -0.35
        and container.collision_box[2][1] == 0.35 and container.collision_box[2][2] == 0.35 then
        container.collision_box = {{-0.3, -0.3}, {0.3, 0.3}}
      end
    end
  end
end
