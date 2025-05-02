local function extendCategories(categs)
    for _, category in pairs(categs) do
        if mods[category.modname] then
            local name = category.name or category.modname
            local icon = nil
            local sg = nil

            if category.icon ~= nil then
                local categ = category.icon
                icon = ""

                if categ == "cannon" then
                    icon = "cannon-shell"
                elseif categ == "bullet"  then
                    icon = "bullet"
                elseif categ == "artillery"  then
                    icon = "artillery-shell"
                elseif categ == "laser"  then
                    icon = "laser"
                end
                icon = "__base__/graphics/icons/ammo-category/"..icon..".png"

                if categ == "unique" then
                    icon = "__"..category.modname.."__/graphics/ammo_category.png"
                end

                if categ == "bomb" then
			        icon = "__kj_vehicles__/graphics/bomb_category.png"
                end

                --log("Icon: "..icon)
            end

            if category.type == "ammo-category" then
                sg = "ammo-category"
            end

            data:extend({
                {
                    type = category.type,
                    name = name,
                    group = category.group or nil,
                    subgroup = sg,
                    order = category.order or nil,
                    icon = icon,
                    hidden_in_factoriopedia = category.hidden or false,
                },
            })
        end
    end
end

return extendCategories