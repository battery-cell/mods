local TRlib = require("__SchallTankPlatoon__.lib.TPlib") --{}

local showlog = false     -- Debug log message toggle



TRlib.sp_icon_layer["armoured"] = {icon = "__SchallArmouredTrain__/graphics/icons/armoured.png", icon_size = 128, icon_mipmaps = 3}
TRlib.sp_icon_layer["nuclear"]  = {icon = "__SchallArmouredTrain__/graphics/icons/nuclear.png", icon_size = 128, icon_mipmaps = 3}


function TRlib.suggest_item_weight(enty, entyweight, multiplier)
  -- Train items use multiplier 40, since they appears lighter than vehicles.
  local weight = entyweight or enty.weight or (1 * tons)
  return weight * (multiplier or 1) * 40
end


TRlib.energy_source_train_smoke =
{
  {
    name = "train-smoke",
    deviation = {0.3, 0.3},
    frequency = 100,
    position = {0, 0},
    starting_frame = 0,
    starting_frame_deviation = 60,
    height = 2,
    height_deviation = 0.5,
    starting_vertical_speed = 0.2,
    starting_vertical_speed_deviation = 0.1
  }
}



return TRlib