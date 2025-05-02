data:extend({
	-- Global
  {
    type = "int-setting",
	name = "vtk-cannon-turret-ammo-use",
	setting_type = "startup",
	minimum_value = 1,
	default_value = 1,
	maximum_value = 3,
	order = "1"
  },
  {
    type = "bool-setting",
	name = "vtk-cannon-turret-explosion-ff",
	setting_type = "startup",
	default_value = false,
	per_user = false,
	order = "2"
  },
  {
    type = "bool-setting",
	name = "vtk-cannon-turret-magazine-new-icon",
	setting_type = "startup",
	default_value = true,
	per_user = false,
	order = "3"
  },
})
