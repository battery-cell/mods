local saatomictank_gun_shot = {
  name = 'saatomictank-gun-shot',
  type = 'sound',
  variations = {
    { filename = '__base__/sound/fight/artillery-shoots-1.ogg', volume = 0.8 },
    { filename = '__base__/sound/fight/artillery-shoots-2.ogg', volume = 0.8 }
    --{ filename = '__base__/sound/fight/heavy-gunshot-3.ogg', volume = 0.4 },
    --{ filename = '__base__/sound/fight/heavy-gunshot-4.ogg', volume = 0.4 }
  }
}


data:extend{ saatomictank_gun_shot }

return saatomictank_gun_shot
