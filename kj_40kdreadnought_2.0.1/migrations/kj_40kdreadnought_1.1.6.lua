-- fix bolter ammo after 1.1.5
-- active recipes
if not script.active_mods["Wh40k_Armoury_fork"] then
	for _, force in pairs(game.forces) do
		if force.technologies["kj_40kdreadnought"] and force.technologies["kj_40kdreadnought"].researched then
			force.recipes["kj_bolt"].enabled = true
		end
	end
end
