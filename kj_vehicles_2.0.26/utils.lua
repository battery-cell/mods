local functions = {}
--utils.layerMaker(Modname, Folder, Name, Size, {fc, rc, dc}, {frameWidth, frameHeight}, amount, mode, shift)
local function mathSign(x)
    return x > 0 and 1 or x < 0 and -1 or 0
end

function functions.ammoRecipe(name)
    local recipe = require("tables").ammoRecipe
    local ingredients = {
        {type = "item", name = "steel-plate", amount = recipe.steel[name]},
        {type = "item", name = "explosives",  amount = recipe.explosive[name]}
    }
    if recipe.plastic[name] ~= nil then
        table.insert(ingredients, {type = "item", name = "plastic-bar",  amount = recipe.plastic[name]})
    end
    if recipe.sulfur[name] ~= nil then
        table.insert(ingredients, {type = "item", name = "sulfur",  amount = recipe.sulfur[name]})
    end
    if recipe.copper[name] ~= nil then
        table.insert(ingredients, {type = "item", name = "copper-plate",  amount = recipe.copper[name]})
    end
    return ingredients
end

function functions.brakes(brakes)
    local sounds = {
        car = {
            {
                type = "play-sound",
                sound =
                {
                    {
                        filename = "__base__/sound/car-breaks.ogg",
                        volume = 0.3
                    },
                }
            },
        },
        tank = {
            {
                type = "play-sound",
                sound =
                {
                    {
                        filename = "__base__/sound/fight/tank-brakes.ogg",
                        volume = 0.8
                    },
                }
            },
        },
    }
    return sounds[brakes]
end

--lights(size, {x = #, y = #}, intensity, rotation, color)
function functions.lights(size, scale, position, intensity, rotation, color)
    local posY = mathSign(position.y) * 3.125 * scale * size + position.y
    --(200 * (scale / 0.5) * size) / 128
    return {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
            filename = "__core__/graphics/light-cone.png",
            priority = "extra-high",
            flags = { "light" },
            scale = scale,
            width = 200,
            height = 200
        },
        shift = {position.x, posY},
        size = size,
        intensity = intensity or 1,
        rotation_shift = rotation or 0,
        color = color or {r = 1, g = 1, b = 1}
    }
end

function functions.spriteMaker(modname, folder, name, size, index, frameSizes, mode, shift, tint, scale)
    assert(type(modname) == "string", "Missing modname!")
    assert(type(folder) == "string", "Missing folder!")
    assert(type(name) == "string", "Missing name!")
    assert(type(size) == "number", "Missing size!")
    assert(type(frameSizes[1]) == "number", "Missing framewidth!")
    assert(type(frameSizes[2]) == "number", "Missing frameheight!")
    assert(type(mode) == "number", "Missing mode!")

    local shadow = false
    local folderPrefix = folder.."/"
    local glw = "normal"
    local glow = false
    local position = {0, 0}
    local suffix = {"", "_shadow", "_light", "_tower", "_tower_shadow"}

    if folder == "" then
        folderPrefix = ""
    end

    if mode == 3 then
        glw = "additive"
        glow = true
    elseif mode == 2 or mode == 5 then
        shadow = true
    end

    local elementsPerSheet = frameSizes[1] * frameSizes[2]
    local sheetIndex = math.floor(index / elementsPerSheet)
    local local_index = index % elementsPerSheet
    position[2] = math.floor(local_index / frameSizes[1]) * size
    position[1] = local_index % frameSizes[1] * size

    return {
        filename = modname.."/graphics/entity/"..folderPrefix..name..suffix[mode].."_"..sheetIndex..".png",
        size = size,
        position = position,
        draw_as_shadow = shadow,
        draw_as_glow = glow,
        blend_mode = glw,
        tint = tint,
        shift = shift or {0, 0.5},
        scale = scale or 0.5,
    }
end

function functions.layerMaker(modname, folder, name, size, counts, frameSizes, amount, mode, shift, speed, tint, runmode, scale)
    assert(type(modname) == "string", "Missing modname!")
    assert(type(folder) == "string", "Missing folder!")
    assert(type(name) == "string", "Missing name!")
    assert(type(size) == "table" or type(size) == "number", "Missing size!")
    assert(type(counts) == "table", "Missing counts!")
    assert(type(counts[1]) == "number", "Missing frame_count!")
    assert(type(counts[2]) == "number", "Missing repeat_count!")
    assert(type(frameSizes[1]) == "number", "Missing framewidth!")
    assert(type(frameSizes[2]) == "number", "Missing frameheight!")
    assert(type(amount) == "number", "Missing count!")
    assert(type(mode) == "number", "Missing mode!")
    if type(size) == "table" then
        assert(type(size[1]) == "number", "Missing width!")
        assert(type(size[2]) == "number", "Missing height!")
    end

    local shadow = false
    local folderPrefix = folder.."/"
    local glw = "normal"
    local glow = false
    local direction_count = counts[3] or 128
    local suffix = {"", "_shadow", "_light", "_tower", "_tower_shadow"}
    local stripe = {}
    local width = size
    local height = size
    if type(size) == "table" then
        width = size[1]
        height = size[2]
    end

    if folder == "" then
        folderPrefix = ""
    end

    if mode == 3 then
        glw = "additive"
        glow = true
    elseif mode == 2 or mode == 5 then
        shadow = true
    end

    if amount > 1 then
        for i = 0, amount - 1, 1 do
            stripe[i+1] =
            {
                filename = modname.."/graphics/entity/"..folderPrefix..name..suffix[mode].."_"..i..".png",
                width_in_frames = frameSizes[1],
                height_in_frames = frameSizes[2],
            }
        end
    else
        stripe[1] =
        {
            filename = modname.."/graphics/entity/"..folderPrefix..name..suffix[mode]..".png",
            width_in_frames = frameSizes[1],
            height_in_frames = frameSizes[2],
        }
    end

    return {
        width = width,
        height = height,
        frame_count = counts[1],
        repeat_count = counts[2],
		run_mode = runmode or "forward",
        direction_count = direction_count,
        draw_as_shadow = shadow,
        draw_as_glow = glow,
        blend_mode = glw,
        tint = tint,
        shift = shift or {0, 0.5},
        animation_speed = speed or 2,
		max_advance = 1,
        scale = scale or 0.5,
        stripes = stripe,
    }
end

return functions