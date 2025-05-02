local path = ('__SA-AtomicTank__')

data:extend{
  {
    type = 'technology',
    name = 'sa-atomic-tank',
    icon_size = 256,
    icon = path .. '/graphics/icons/t1atomtech.png',
    effects = {
      { type = 'unlock-recipe', recipe = 'sa-atomic-tank' },
      { type = 'unlock-recipe', recipe = 't1-atom-shell' }
    },
    prerequisites = { 'atomic-bomb', 'tank'},
    unit = {
      count = 300,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 }, { 'chemical-science-pack', 1 },
        { 'production-science-pack', 1 }, { 'utility-science-pack', 1 }
      },
      time = 40
    },
    order = 'a-j-b'
  },
  {
    type = 'technology',
    name = 't1atom-damage-increase-1',
    icon_size = 128,
    icon = path .. '/graphics/icons/t1atomshelldm.png',
    effects = { { type = 'ammo-damage', ammo_category = 't1-atom-shell', modifier = 0.2 } },
    prerequisites = { 'sa-atomic-tank' },
    unit = {
      count = 100 * 1,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 }, { 'chemical-science-pack', 1 }
      },
      time = 10
    },
    upgrade = true,
    order = 'e-j-a'
  }, 
  {
    type = 'technology',
    name = 't1atom-damage-increase-2',
    icon_size = 128,
    icon = path .. '/graphics/icons/t1atomshelldm.png',
    effects = { { type = 'ammo-damage', ammo_category = 't1-atom-shell', modifier = 0.2 } },
    prerequisites = { 't1atom-damage-increase-1' },
    unit = {
      count = 150 * 2,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 }, { 'chemical-science-pack', 1 }
      },
      time = 20
    },
    upgrade = true,
    order = 'e-l-b'
  }, 
  {
    type = 'technology',
    name = 't1atom-damage-increase-3',
    icon_size = 128,
    icon = path .. '/graphics/icons/t1atomshelldm.png',
    effects = { { type = 'ammo-damage', ammo_category = 't1-atom-shell', modifier = 0.3 } },
    prerequisites = { 't1atom-damage-increase-2' },
    unit = {
      count = 200 * 3,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 }, { 'chemical-science-pack', 1 }
      },
      time = 30
    },
    upgrade = true,
    order = 'e-l-c'
  }, 
  {
    type = 'technology',
    name = 't1atom-damage-increase-4',
    icon_size = 128,
    icon = path .. '/graphics/icons/t1atomshelldm.png',
    effects = { { type = 'ammo-damage', ammo_category = 't1-atom-shell', modifier = 0.4 } },
    prerequisites = { 't1atom-damage-increase-3' },
    unit = {
      count = 250 * 4,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 }, { 'chemical-science-pack', 1 }
      },
      time = 40
    },
    upgrade = true,
    order = 'e-l-d'
  }, 
  {
    type = 'technology',
    name = 't1atom-damage-increase-5',
    icon_size = 128,
    icon = path .. '/graphics/icons/t1atomshelldm.png',
    effects = { { type = 'ammo-damage', ammo_category = 't1-atom-shell', modifier = 0.5 } },
    prerequisites = { 't1atom-damage-increase-4' },
    unit = {
      count = 300 * 5,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 }, { 'military-science-pack', 1 },
        { 'utility-science-pack', 1 }
      },
      time = 50
    },
    upgrade = true,
    order = 'e-l-e'
  }, 
  {
    type = 'technology',
    name = 't1atom-damage-increase-6',
    icon_size = 128,
    icon = path .. '/graphics/icons/t1atomshelldm.png',
    effects = { { type = 'ammo-damage', ammo_category = 't1-atom-shell', modifier = 0.7 } },
    prerequisites = { 't1atom-damage-increase-5' },
    unit = {
      count = 350 * 6,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 }, { 'military-science-pack', 1 },
        { 'utility-science-pack', 1 }
      },
      time = 60
    },
    upgrade = true,
    order = 'e-l-f'
  }, 
  {
    type = 'technology',
    name = 't1atom-damage-increase-7',
    icon_size = 128,
    icon = path .. '/graphics/icons/t1atomshelldm.png',
    effects = { { type = 'ammo-damage', ammo_category = 't1-atom-shell', modifier = 0.9 } },
    prerequisites = { 't1atom-damage-increase-6', 'space-science-pack' },
    unit = {
      count = 400 * 8,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 }, { 'military-science-pack', 1 },
        { 'utility-science-pack', 1 }, { 'space-science-pack', 1 }
      },
      time = 70
    },
    max_level = 'infinite',
    upgrade = true,
    order = 'e-l-f'
  }, 
  {
    type = 'technology',
    name = 't1atom-shooting-speed-1',
    icon_size = 128,
    icon = path .. '/graphics/icons/t1atomshellsp.png',
    effects = { { type = 'gun-speed', ammo_category = 't1-atom-shell', modifier = 0.2 } },
    prerequisites = { 'sa-atomic-tank' },
    unit = {
      count = 150 * 1,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 }, { 'chemical-science-pack', 1 }
      },
      time = 10
    },
    upgrade = true,
    order = 'e-j-a'
  }, 
  {
    type = 'technology',
    name = 't1atom-shooting-speed-2',
    icon_size = 128,
    icon = path .. '/graphics/icons/t1atomshellsp.png',
    effects = { { type = 'gun-speed', ammo_category = 't1-atom-shell', modifier = 0.2 } },
    prerequisites = { 't1atom-shooting-speed-1' },
    unit = {
      count = 150 * 2,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 }, { 'chemical-science-pack', 1 }
      },
      time = 20
    },
    upgrade = true,
    order = 'e-l-b'
  }, 
  {
    type = 'technology',
    name = 't1atom-shooting-speed-3',
    icon_size = 128,
    icon = path .. '/graphics/icons/t1atomshellsp.png',
    effects = { { type = 'gun-speed', ammo_category = 't1-atom-shell', modifier = 0.3 } },
    prerequisites = { 't1atom-shooting-speed-2' },
    unit = {
      count = 200 * 3,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 }, { 'chemical-science-pack', 1 }
      },
      time = 30
    },
    upgrade = true,
    order = 'e-l-c'
  }, 
  {
    type = 'technology',
    name = 't1atom-shooting-speed-4',
    icon_size = 128,
    icon = path .. '/graphics/icons/t1atomshellsp.png',
    effects = { { type = 'gun-speed', ammo_category = 't1-atom-shell', modifier = 0.4 } },
    prerequisites = { 't1atom-shooting-speed-3' },
    unit = {
      count = 250 * 4,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 }, { 'chemical-science-pack', 1 }
      },
      time = 40
    },
    upgrade = true,
    order = 'e-l-d'
  },
  {
    type = 'technology',
    name = 't1atom-shooting-speed-5',
    icon_size = 128,
    icon = path .. '/graphics/icons/t1atomshellsp.png',
    effects = { { type = 'gun-speed', ammo_category = 't1-atom-shell', modifier = 0.4 } },
    prerequisites = { 't1atom-shooting-speed-4' },
    unit = {
      count = 300 * 5,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 }, { 'military-science-pack', 1 },
        { 'utility-science-pack', 1 }
      },
      time = 50
    },
    upgrade = true,
    order = 'e-l-e'
  }, 
  {
    type = 'technology',
    name = 't1atom-shooting-speed-6',
    icon_size = 128,
    icon = path .. '/graphics/icons/t1atomshellsp.png',
    effects = {
      { type = 'gun-speed', ammo_category = 't1-atom-shell', modifier = 0.7 }
    },
    prerequisites = { 't1atom-shooting-speed-5' },
    unit = {
      count = 350 * 6,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 }, { 'military-science-pack', 1 },
        { 'utility-science-pack', 1 }
      },
      time = 60
    },
    upgrade = true,
    order = 'e-l-f'
  }, 
  {
    type = 'technology',
    name = 't1atom-shooting-speed-7',
    icon_size = 128,
    icon = path .. '/graphics/icons/t1atomshellsp.png',
    effects = {
      { type = 'gun-speed', ammo_category = 't1-atom-shell', modifier = 0.10 }      
    },
    prerequisites = { 't1atom-shooting-speed-6', 'space-science-pack' },
    unit = {
      count = 400 * 8,
      ingredients = {
        { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 }, { 'military-science-pack', 1 },
        { 'utility-science-pack', 1 }, { 'space-science-pack', 1 }
      },
      time = 70
    },
    max_level = 'infinite',
    upgrade = true,
    order = 'e-l-f'
  }
}
