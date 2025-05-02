data:extend({
  {
      type = "bool-setting",
      name = "T1-rock-impact",
      setting_type = "startup",
      default_value = false
  },
  {
    type = "bool-setting",
    name = "T1-tree-impact",
    setting_type = "startup",
    default_value = true
  },
  {
    type = "double-setting",
    name = "T1-Atom-hp",
    setting_type = "startup",
    default_value = 4500,
    allowed_values = {2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000},
    order = "aa",
  },
  {
    type = "double-setting",
    name = "T1-Atom-gridwidth",
    setting_type = "startup",
    default_value = 8,
    allowed_values = {8, 10, 12},
    order = "ab",
  },
  {
    type = "double-setting",
    name = "T1-Atom-gridheight",
    setting_type = "startup",
    default_value = 8,
    allowed_values = {8, 10, 12},
    order = "ac",
  },  
})