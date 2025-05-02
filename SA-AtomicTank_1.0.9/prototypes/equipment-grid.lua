local t1atomgridwidth = settings.startup["T1-Atom-gridwidth"].value
local t1atomgridheight = settings.startup["T1-Atom-gridheight"].value

data:extend{
  { -- SA-T1AtomicTank
    type = 'equipment-category',
    name = 'saatomictank'
  }, 
  { -- SA-T1Atom grid
    type = 'equipment-grid',
    name = 'saatomictank-equipment-grid',
    width = t1atomgridwidth,
    height = t1atomgridheight,
    equipment_categories = { 'armor', 'saatomictank' }
  }
}
