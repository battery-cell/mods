local item_sounds = require("__base__.prototypes.item_sounds")
local trivial_smoke = require("__base__/prototypes/entity/smoke-animations.lua").trivial_smoke
local sounds = require ("__base__/prototypes/entity/sounds.lua")
local tables = require("tables")

for mod, item in pairs(tables.items) do
    mod = item.modname or mod
    if mods[mod] then
        local name = item.name or mod

        data:extend({
            {
                type = "item-with-entity-data",
                name = name,
                icon = "__"..mod.."__/graphics/"..(item.icon or "icon")..".png",
                icon_size = 128,
                subgroup = item.subgroup or "transport",
                order = item.order or tables.supportedMods[name].order,
                inventory_move_sound = item_sounds.vehicle_inventory_move,
                pick_sound = item_sounds.vehicle_inventory_pickup,
                drop_sound = item_sounds.vehicle_inventory_move,
                place_result = name,
                stack_size = item.stackSize or 1,
                weight = (item.weight or 1000) * 1000,
            },
        })
    end
end

local sg = "transport"
local order = "1[civil]-c"
if data.raw["item-subgroup"]["kj_fuels"] ~= nil then
    sg = "kj_fuels"
    order = "q"
end

local function bolterSounds(modname)
    return {
        {
            filename = "__"..modname.."__/sounds/bolter1.ogg",
            volume = 0.57
        },
        {
            filename = "__"..modname.."__/sounds/bolter2.ogg",
            volume = 0.57
        },
        {
            filename = "__"..modname.."__/sounds/bolter3.ogg",
            volume = 0.57
        },
        {
            filename = "__"..modname.."__/sounds/bolter4.ogg",
            volume = 0.57
        },
        {
            filename = "__"..modname.."__/sounds//bolter5.ogg",
            volume = 0.57
        }
    }
end

if mods["kj_2a6"] then
    local mg3 = table.deepcopy(data.raw["gun"]["tank-machine-gun"])
    mg3.name = "kj_mg3"
    mg3.icon = "__kj_2a6__/graphics/equipment/mg42.png"
    mg3.icon_size = 128
    mg3.attack_parameters.projectile_creation_distance = 1
    mg3.attack_parameters.projectile_center = {0,0}
    mg3.attack_parameters.cooldown = 3
    mg3.attack_parameters.range = 35
    mg3.order = "[basic-clips]-d[mg3]"
    mg3.flags = {}
    mg3.attack_parameters.sound = {
        {
            filename = "__kj_2a6__/sounds/mg42_1.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_2.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_3.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_4.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_5.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_6.ogg",
            volume = 0.4,
        },
    }
    data:extend({mg3})

    mg3 = table.deepcopy(data.raw["gun"]["submachine-gun"])
    mg3.name = "kj_mg3_hand"
    mg3.icon = "__kj_2a6__/graphics/equipment/mg42.png"
    mg3.icon_size = 128
    mg3.attack_parameters.movement_slow_down_factor = 0.9
    mg3.attack_parameters.cooldown = 3
    mg3.attack_parameters.range = 25
    mg3.order = "a[basic-clips]-e[mg3]"
    mg3.flags = {}
    mg3.attack_parameters.sound = {
        {
            filename = "__kj_2a6__/sounds/mg42_1.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_2.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_3.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_4.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_5.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_6.ogg",
            volume = 0.4,
        },
    }
    data:extend({mg3})

    data:extend({
        {
            type = "gun",
            name = "kj_rh120",
            icon = "__kj_2a6__/graphics/equipment/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[leopard]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_rh120",
                cooldown = 150,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 5.5,
                projectile_center = {0, 0},
                range = 50,
                sound =
                {
                    {
                        filename = "__kj_2a6__/sounds/tank-shot.ogg",
                        volume = 0.9
                    }
                },
            },
            stack_size = 5
        }
    })
end

if mods["kj_40kbaneblade"] then
    local tank_gunshot = 
    {
        {
            filename = "__kj_40kbaneblade__/sounds/cannon_shot1.ogg",
            volume = 0.7
        },
        {
            filename = "__kj_40kbaneblade__/sounds/cannon_shot2.ogg",
            volume = 0.7
        },
        {
            filename = "__kj_40kbaneblade__/sounds/cannon_shot3.ogg",
            volume = 0.7
        },
        {
            filename = "__kj_40kbaneblade__/sounds/cannon_shot4.ogg",
            volume = 0.7
        },
    }

    data:extend({
        {
            type = "sound",
            name = "kj_40kbaneblade_s_1",
            filename = "__kj_40kbaneblade__/sounds/artillery1.ogg",
            category = "environment",
            volume = 0.5
        },
        {
            type = "sound",
            name = "kj_40kbaneblade_s_2",
            filename = "__kj_40kbaneblade__/sounds/artillery2.ogg",
            category = "environment",
            volume = 0.5
        },
        {
            type = "custom-input",
            name = "kj_40kbaneblade_fire",
            key_sequence = "SHIFT + V",
            consuming = "game-only"
        },

        {
            type = "gun",
            name = "kj_baneblade_bolter",
            icon = "__kj_40kbaneblade__/graphics/equipment/bolter.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "l[lemanruss]-b[bolter]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_bolter",
                cooldown = 15,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 1.4,
                projectile_center = {0, -0.1},
                --projectile_creation_parameters = shoot_shiftings_bolter(),
                range = 25,
                sound = bolterSounds("kj_40kbaneblade"),
            },
            stack_size = 5
        },
        {
            type = "gun",
            name = "kj_baneblade",
            icon = "__kj_40kbaneblade__/graphics/equipment/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[maustank]-a[cannon]",
            attack_parameters = 
            {
                type = "projectile",
                ammo_category = "kj_baneblade",
                cooldown = 120,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 4.7,
                projectile_center = {0, -1.7},
                range = 35,
                sound = tank_gunshot,
            },
            stack_size = 5
        },
    })
end

if mods["kj_40kdreadnought"] then

    local boltersounds =
    {
        {
            filename = "__kj_40kdreadnought__/sounds/bolter1.ogg",
            volume = 0.57
        },
        {
            filename = "__kj_40kdreadnought__/sounds/bolter2.ogg",
            volume = 0.57
        },
        {
            filename = "__kj_40kdreadnought__/sounds/bolter3.ogg",
            volume = 0.57
        },
        {
            filename = "__kj_40kdreadnought__/sounds/bolter4.ogg",
            volume = 0.57
        },
        {
            filename = "__kj_40kdreadnought__/sounds//bolter5.ogg",
            volume = 0.57
        }
    }
    
    function shoot_shiftings_bolter()
        return
            {
                {0.0000, util.by_pixel(-103.5,-97   )},
                {0.0078, util.by_pixel(-101.5,-99.5 )},
                {0.0156, util.by_pixel(-98.5 ,-103  )},
                {0.0234, util.by_pixel(-93.5 ,-106.5)},
                {0.0313, util.by_pixel(-89   ,-110.5)},
                {0.0391, util.by_pixel(-84.5 ,-113.5)},
                {0.0469, util.by_pixel(-80.5 ,-117  )},
                {0.0547, util.by_pixel(-75   ,-119.5)},
                {0.0625, util.by_pixel(-71   ,-122.5)},
                {0.0703, util.by_pixel(-66   ,-125.5)},
                {0.0781, util.by_pixel(-61.5 ,-128  )},
                {0.0859, util.by_pixel(-55   ,-134.5)},
                {0.0938, util.by_pixel(-37.5 ,-146  )},
                {0.1016, util.by_pixel(-21   ,-146.5)},
                {0.1094, util.by_pixel(-27   ,-146.5)},
                {0.1172, util.by_pixel(-31.5 ,-146.5)},
                {0.1250, util.by_pixel(-15.5 ,-147.5)},
                {0.1328, util.by_pixel(-8    ,-149  )},  
                {0.1406, util.by_pixel(-2.5  ,-147  )},
                {0.1484, util.by_pixel(1.5   ,-146  )},
                {0.1563, util.by_pixel(6     ,-145.5)},
                {0.1641, util.by_pixel(9     ,-145.5)},
                {0.1719, util.by_pixel(15    ,-144.5)},
                {0.1797, util.by_pixel(21    ,-143.5)},
                {0.1875, util.by_pixel(27    ,-143  )},
                {0.1953, util.by_pixel(32    ,-142.5)},
                {0.2031, util.by_pixel(38    ,-141  )},
                {0.2109, util.by_pixel(44.5  ,-139.5)},
                {0.2188, util.by_pixel(50.5  ,-138  )},
                {0.2266, util.by_pixel(55    ,-136  )},
                {0.2344, util.by_pixel(59.5  ,-134  )},
                {0.2422, util.by_pixel(64.5  ,-132  )},
                {0.2500, util.by_pixel(71.5  ,-129.5)},
                {0.2578, util.by_pixel(76.5  ,-126.5)},
                {0.2656, util.by_pixel(82    ,-124.5)},
                {0.2734, util.by_pixel(86.5  ,-121  )},
                {0.2813, util.by_pixel(91.5  ,-118  )},
                {0.2891, util.by_pixel(94    ,-115  )},
                {0.2969, util.by_pixel(98    ,-111  )},
                {0.3047, util.by_pixel(105   ,-109  )},
                {0.3125, util.by_pixel(108.5 ,-104.5)},
                {0.3203, util.by_pixel(112.5 ,-101  )},
                {0.3281, util.by_pixel(116   ,-95.5 )},
                {0.3359, util.by_pixel(118.5 ,-92   )},
                {0.3438, util.by_pixel(120   ,-88   )},
                {0.3516, util.by_pixel(121.5 ,-83.5 )},
                {0.3594, util.by_pixel(122.5 ,-79   )},
                {0.3672, util.by_pixel(123   ,-75.5 )},
                {0.3750, util.by_pixel(124   ,-70.5 )},
                {0.3828, util.by_pixel(125   ,-65   )},
                {0.3906, util.by_pixel(125   ,-60   )},
                {0.3984, util.by_pixel(126   ,-55.5 )},
                {0.4063, util.by_pixel(126.5 ,-50   )},
                {0.4141, util.by_pixel(124.5 ,-46   )},
                {0.4219, util.by_pixel(124   ,-41   )},
                {0.4297, util.by_pixel(123.5 ,-35.5 )},
                {0.4375, util.by_pixel(121   ,-31.5 )},
                {0.4453, util.by_pixel(119.5 ,-26.5 )},
                {0.4531, util.by_pixel(118.5 ,-23   )},
                {0.4609, util.by_pixel(116   ,-19.5 )},
                {0.4688, util.by_pixel(113   ,-13.5 )},
                {0.4766, util.by_pixel(110.5 ,-10   )},
                {0.4844, util.by_pixel(107   ,-5.5  )},
                {0.4922, util.by_pixel(103   ,-0.5  )},
                {0.5000, util.by_pixel(100   ,3     )},
                {0.5078, util.by_pixel(96.5  ,6.5   )},
                {0.5156, util.by_pixel(93    ,9.5   )},
                {0.5234, util.by_pixel(88.5  ,12.5  )},
                {0.5313, util.by_pixel(85    ,15.5  )},
                {0.5391, util.by_pixel(81    ,17.5  )},
                {0.5469, util.by_pixel(77    ,20.5  )},
                {0.5547, util.by_pixel(72    ,22.5  )},
                {0.5625, util.by_pixel(66.5  ,25.5  )},
                {0.5703, util.by_pixel(62    ,28    )},
                {0.5781, util.by_pixel(56    ,30.5  )},
                {0.5859, util.by_pixel(51    ,32    )},
                {0.5938, util.by_pixel(45    ,34    )},
                {0.6016, util.by_pixel(40    ,35    )},
                {0.6094, util.by_pixel(35    ,36    )},
                {0.6172, util.by_pixel(29.5  ,37    )},
                {0.6250, util.by_pixel(23.5  ,38    )},
                {0.6328, util.by_pixel(17.5  ,38.5  )},
                {0.6406, util.by_pixel(-6    ,39    )},
                {0.6484, util.by_pixel(1     ,39    )},
                {0.6563, util.by_pixel(6.5   ,39    )},
                {0.6641, util.by_pixel(12.5  ,39    )},
                {0.6719, util.by_pixel(-12.5 ,39    )},
                {0.6797, util.by_pixel(-18   ,38.5  )},
                {0.6875, util.by_pixel(-24   ,38    )},
                {0.6953, util.by_pixel(-29.5 ,37    )},
                {0.7031, util.by_pixel(-35   ,35.5  )},
                {0.7109, util.by_pixel(-40.5 ,34    )},
                {0.7188, util.by_pixel(-46   ,32.5  )},
                {0.7266, util.by_pixel(-51   ,31.5  )},
                {0.7344, util.by_pixel(-56.5 ,28.5  )},
                {0.7422, util.by_pixel(-61.5 ,26.5  )},
                {0.7500, util.by_pixel(-66.5 ,23.5  )},
                {0.7578, util.by_pixel(-71.5 ,21    )},
                {0.7656, util.by_pixel(-76.5 ,19    )},
                {0.7734, util.by_pixel(-81   ,16.5  )},
                {0.7813, util.by_pixel(-85.5 ,13.5  )},
                {0.7891, util.by_pixel(-90   ,10.5  )},
                {0.7969, util.by_pixel(-94   ,7     )},
                {0.8047, util.by_pixel(-97.5 ,3.5   )},
                {0.8125, util.by_pixel(-101  ,0.5   )},
                {0.8203, util.by_pixel(-104.5,-2.5  )},
                {0.8281, util.by_pixel(-107  ,-7    )},
                {0.8359, util.by_pixel(-110  ,-11.5 )},
                {0.8438, util.by_pixel(-113  ,-15.5 )},
                {0.8516, util.by_pixel(-115.5,-19   )},
                {0.8594, util.by_pixel(-117.5,-23   )},
                {0.8672, util.by_pixel(-119.5,-27   )},
                {0.8750, util.by_pixel(-121  ,-30.5 )},
                {0.8828, util.by_pixel(-121.5,-35   )},
                {0.8906, util.by_pixel(-122.5,-39.5 )},
                {0.8984, util.by_pixel(-123  ,-43   )},
                {0.9063, util.by_pixel(-123.5,-47.5 )},
                {0.9141, util.by_pixel(-124  ,-51   )},
                {0.9219, util.by_pixel(-124  ,-55   )},
                {0.9297, util.by_pixel(-123.5,-58.5 )},
                {0.9375, util.by_pixel(-123  ,-63   )},
                {0.9453, util.by_pixel(-121.5,-68   )},
                {0.9531, util.by_pixel(-119.5,-72.5 )},
                {0.9609, util.by_pixel(-118  ,-77   )},
                {0.9688, util.by_pixel(-115.5,-80.5 )},
                {0.9766, util.by_pixel(-113.5,-85   )},
                {0.9844, util.by_pixel(-110  ,-89   )},
                {0.9922, util.by_pixel(-105  ,-94   )},
            }
    end
    
    function shoot_shiftings_cannon()
        return
            {
                {0.0000, util.by_pixel(62.0  ,-169.0)},
                {0.0078, util.by_pixel(68.0  ,-165.5)},
                {0.0156, util.by_pixel(75.5  ,-162.0)},
                {0.0234, util.by_pixel(83.0  ,-157.0)},
                {0.0313, util.by_pixel(88.5  ,-151.5)},
                {0.0391, util.by_pixel(93.5  ,-148.0)},
                {0.0469, util.by_pixel(97.5  ,-146.0)},
                {0.0547, util.by_pixel(101.0 ,-139.5)},
                {0.0625, util.by_pixel(105.0 ,-134.5)},
                {0.0703, util.by_pixel(108.5 ,-131.0)},
                {0.0781, util.by_pixel(111.5 ,-127.5)},
                {0.0859, util.by_pixel(114.0 ,-124.5)},
                {0.0938, util.by_pixel(117.0 ,-119.5)},
                {0.1016, util.by_pixel(119.5 ,-117.0)},
                {0.1094, util.by_pixel(121.5 ,-112.0)},
                {0.1172, util.by_pixel(123.5 ,-107.5)},
                {0.1250, util.by_pixel(125.0 ,-104.0)},
                {0.1328, util.by_pixel(126.5 ,-99.0 )},
                {0.1406, util.by_pixel(127.0 ,-95.5 )},
                {0.1484, util.by_pixel(128.0 ,-91.0 )},
                {0.1563, util.by_pixel(129.0 ,-87.0 )},
                {0.1641, util.by_pixel(129.0 ,-82.0 )},
                {0.1719, util.by_pixel(128.5 ,-77.5 )},
                {0.1797, util.by_pixel(128.0 ,-73.0 )},
                {0.1875, util.by_pixel(127.0 ,-69.0 )},
                {0.1953, util.by_pixel(126.0 ,-65.0 )},
                {0.2031, util.by_pixel(125.0 ,-61.5 )},
                {0.2109, util.by_pixel(123.5 ,-58.0 )},
                {0.2188, util.by_pixel(121.0 ,-53.5 )},
                {0.2266, util.by_pixel(119.5 ,-48.5 )},
                {0.2344, util.by_pixel(116.5 ,-44.5 )},
                {0.2422, util.by_pixel(113.0 ,-40.0 )},
                {0.2500, util.by_pixel(111.0 ,-36.5 )},
                {0.2578, util.by_pixel(107.5 ,-32.0 )},
                {0.2656, util.by_pixel(104.0 ,-28.0 )},
                {0.2734, util.by_pixel(100.5 ,-25.0 )},
                {0.2813, util.by_pixel(97.0  ,-22.0 )},
                {0.2891, util.by_pixel(94.0  ,-18.0 )},
                {0.2969, util.by_pixel(89.5  ,-13.5 )},
                {0.3047, util.by_pixel(84.0  ,-11.0 )},
                {0.3125, util.by_pixel(78.0  ,-8.5  )},
                {0.3203, util.by_pixel(74.0  ,-7.5  )},
                {0.3281, util.by_pixel(68.5  ,-4.5  )},
                {0.3359, util.by_pixel(63.5  ,-1.5  )},
                {0.3438, util.by_pixel(59.0  ,1.0   )},
                {0.3516, util.by_pixel(53.5  ,2.5   )},
                {0.3594, util.by_pixel(47.0  ,5.0   )},
                {0.3672, util.by_pixel(42.0  ,6.5   )},
                {0.3750, util.by_pixel(36.5  ,8.0   )},
                {0.3828, util.by_pixel(27.5  ,11.5  )},
                {0.3906, util.by_pixel(21.5  ,12.5  )},
                {0.3984, util.by_pixel(15.0  ,13.5  )},
                {0.4063, util.by_pixel(8.5   ,14.0  )},
                {0.4141, util.by_pixel(3.5   ,15.0  )},
                {0.4219, util.by_pixel(-4.5  ,14.0  )},
                {0.4297, util.by_pixel(-11.0 ,13.0  )},
                {0.4375, util.by_pixel(-16.5 ,13.0  )},
                {0.4453, util.by_pixel(-22.0 ,12.5  )},
                {0.4531, util.by_pixel(-28.5 ,12.0  )},
                {0.4609, util.by_pixel(-34.0 ,11.5  )},
                {0.4688, util.by_pixel(-40.0 ,9.0   )},
                {0.4766, util.by_pixel(-46.0 ,8.0   )},
                {0.4844, util.by_pixel(-52.0 ,6.0   )},
                {0.4922, util.by_pixel(-58.0 ,5.0   )},
                {0.5000, util.by_pixel(-62.5 ,2.0   )},
                {0.5078, util.by_pixel(-68.0 ,0.0   )},
                {0.5156, util.by_pixel(-72.5 ,-2.5  )},
                {0.5234, util.by_pixel(-77.0 ,-5.0  )},
                {0.5313, util.by_pixel(-83.5 ,-8.0  )},
                {0.5391, util.by_pixel(-88.5 ,-11.0 )},
                {0.5469, util.by_pixel(-93.5 ,-14.5 )},
                {0.5547, util.by_pixel(-98.0 ,-18.5 )},
                {0.5625, util.by_pixel(-102.0,-21.5 )},
                {0.5703, util.by_pixel(-104.5,-25.0 )},
                {0.5781, util.by_pixel(-108.0,-28.5 )},
                {0.5859, util.by_pixel(-111.5,-32.5 )},
                {0.5938, util.by_pixel(-115.0,-37.0 )},
                {0.6016, util.by_pixel(-118.0,-41.0 )},
                {0.6094, util.by_pixel(-120.5,-46.0 )},
                {0.6172, util.by_pixel(-122.5,-50.0 )},
                {0.6250, util.by_pixel(-124.5,-54.5 )},
                {0.6328, util.by_pixel(-126.0,-58.5 )},
                {0.6406, util.by_pixel(-127.0,-63.0 )},
                {0.6484, util.by_pixel(-127.5,-68.0 )},
                {0.6563, util.by_pixel(-128.0,-72.0 )},
                {0.6641, util.by_pixel(-128.5,-77.0 )},
                {0.6719, util.by_pixel(-128.0,-81.5 )},
                {0.6797, util.by_pixel(-128.5,-85.0 )},
                {0.6875, util.by_pixel(-128.5,-89.0 )},
                {0.6953, util.by_pixel(-126.5,-93.0 )},
                {0.7031, util.by_pixel(-125.0,-96.0 )},
                {0.7109, util.by_pixel(-122.5,-101.0)},
                {0.7188, util.by_pixel(-121.5,-106.0)},
                {0.7266, util.by_pixel(-119.0,-109.5)},
                {0.7344, util.by_pixel(-117.0,-114.0)},
                {0.7422, util.by_pixel(-112.5,-118.5)},
                {0.7500, util.by_pixel(-110.5,-122.5)},
                {0.7578, util.by_pixel(-107.5,-126.5)},
                {0.7656, util.by_pixel(-103.0,-130.0)},
                {0.7734, util.by_pixel(-99.0 ,-134.5)},
                {0.7813, util.by_pixel(-95.0 ,-138.0)},
                {0.7891, util.by_pixel(-91.0 ,-140.5)},
                {0.7969, util.by_pixel(-87.0 ,-144.0)},
                {0.8047, util.by_pixel(-83.0 ,-146.5)},
                {0.8125, util.by_pixel(-78.5 ,-149.0)},
                {0.8203, util.by_pixel(-73.0 ,-151.5)},
                {0.8281, util.by_pixel(-67.5 ,-153.5)},
                {0.8359, util.by_pixel(-62.5 ,-155.5)},
                {0.8438, util.by_pixel(-57.5 ,-157.5)},
                {0.8516, util.by_pixel(-52.0 ,-159.5)},
                {0.8594, util.by_pixel(-46.5 ,-161.0)},
                {0.8672, util.by_pixel(-41.0 ,-162.5)},
                {0.8750, util.by_pixel(-36.0 ,-163.5)},
                {0.8828, util.by_pixel(-30.0 ,-164.5)},
                {0.8906, util.by_pixel(-24.0 ,-165.5)},
                {0.8984, util.by_pixel(-19.0 ,-166.5)},
                {0.9063, util.by_pixel(-7.0  ,-167.5)},
                {0.9141, util.by_pixel(-12.5 ,-167.5)},
                {0.9219, util.by_pixel(5.0   ,-169.5)},
                {0.9297, util.by_pixel(-1.0  ,-169.5)},
                {0.9375, util.by_pixel(11.5  ,-171.0)},
                {0.9453, util.by_pixel(17.5  ,-174.0)},
                {0.9531, util.by_pixel(27.0  ,-177.0)},
                {0.9609, util.by_pixel(33.0  ,-176.0)},
                {0.9688, util.by_pixel(39.5  ,-175.0)},
                {0.9766, util.by_pixel(45.0  ,-173.5)},
                {0.9844, util.by_pixel(51.0  ,-172.0)},
                {0.9922, util.by_pixel(57.0  ,-170.5)},
            }
    end
    
    data:extend({
        {
            type = "gun",
            name = "kj_bolter",
            icon = "__kj_40kdreadnought__/graphics/equipment/bolter.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "d[dreadnought]-b[bolter]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_bolter",
                cooldown = 20,
                health_penalty = -5,
                rotate_penalty = 5,
                --projectile_creation_distance = 1.6,
                --projectile_center = {-0.15625, -0.07812},
                projectile_creation_parameters = shoot_shiftings_bolter(),
                range = 25,
                sound = boltersounds,
            },
            stack_size = 5
        },

        {
            type = "gun",
            name = "kj_dreadnought_cannon",
            icon = "__kj_40kdreadnought__/graphics/equipment/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[maustank]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_dreadnought_cannon",
                cooldown = 90,
                health_penalty = -5,
                rotate_penalty = 5,
                --projectile_creation_distance = 3.5,
                --projectile_center = {0, -3.8},
                projectile_creation_parameters = shoot_shiftings_cannon(),
                range = 35,
                sound =
                {
                    {
                        filename = "__kj_40kdreadnought__/sounds/tank-shot.ogg",
                        volume = 0.6
                    }
                },
            },
            stack_size = 5
        },
    })

    data:extend({
        {
            type = "sound",
            name = "kj_40kdreadnought_walking_1",
            filename = "__kj_40kdreadnought__/sounds/dreadnought_walking1.ogg",
            category = "environment",
            volume = settings.startup["kj_40kdreadnought_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_40kdreadnought_walking_2",
            filename = "__kj_40kdreadnought__/sounds/dreadnought_walking2.ogg",
            category = "environment",
            volume = settings.startup["kj_40kdreadnought_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_40kdreadnought_walking_3",
            filename = "__kj_40kdreadnought__/sounds/dreadnought_walking3.ogg",
            category = "environment",
            volume = settings.startup["kj_40kdreadnought_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_40kdreadnought_walking_4",
            filename = "__kj_40kdreadnought__/sounds/dreadnought_walking4.ogg",
            category = "environment",
            volume = settings.startup["kj_40kdreadnought_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_40kdreadnought_walking_5",
            filename = "__kj_40kdreadnought__/sounds/dreadnought_walking5.ogg",
            category = "environment",
            volume = settings.startup["kj_40kdreadnought_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_40kdreadnought_walking_6",
            filename = "__kj_40kdreadnought__/sounds/dreadnought_walking6.ogg",
            category = "environment",
            volume = settings.startup["kj_40kdreadnought_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_40kdreadnought_walking_7",
            filename = "__kj_40kdreadnought__/sounds/dreadnought_walking7.ogg",
            category = "environment",
            volume = settings.startup["kj_40kdreadnought_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_40kdreadnought_walking_8",
            filename = "__kj_40kdreadnought__/sounds/dreadnought_walking8.ogg",
            category = "environment",
            volume = settings.startup["kj_40kdreadnought_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_40kdreadnought_walking_9",
            filename = "__kj_40kdreadnought__/sounds/dreadnought_walking9.ogg",
            category = "environment",
            volume = settings.startup["kj_40kdreadnought_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_40kdreadnought_walking_10",
            filename = "__kj_40kdreadnought__/sounds/dreadnought_walking10.ogg",
            category = "environment",
            volume = settings.startup["kj_40kdreadnought_walking_volume"].value / 100
        },
        
        
        
        {
            type = "sound",
            name = "kj_40kdreadnought_voiceline_1",
            filename = "__kj_40kdreadnought__/sounds/dreadnought_voiceline1.ogg",
            category = "environment",
            volume = settings.startup["kj_40kdreadnought_voiceline_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_40kdreadnought_voiceline_2",
            filename = "__kj_40kdreadnought__/sounds/dreadnought_voiceline2.ogg",
            category = "environment",
            volume = settings.startup["kj_40kdreadnought_voiceline_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_40kdreadnought_voiceline_3",
            filename = "__kj_40kdreadnought__/sounds/dreadnought_voiceline3.ogg",
            category = "environment",
            volume = settings.startup["kj_40kdreadnought_voiceline_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_40kdreadnought_voiceline_4",
            filename = "__kj_40kdreadnought__/sounds/dreadnought_voiceline4.ogg",
            category = "environment",
            volume = settings.startup["kj_40kdreadnought_voiceline_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_40kdreadnought_voiceline_5",
            filename = "__kj_40kdreadnought__/sounds/dreadnought_voiceline5.ogg",
            category = "environment",
            volume = settings.startup["kj_40kdreadnought_voiceline_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_40kdreadnought_voiceline_6",
            filename = "__kj_40kdreadnought__/sounds/dreadnought_voiceline6.ogg",
            category = "environment",
            volume = settings.startup["kj_40kdreadnought_voiceline_volume"].value / 100
        },
        
        
        {
            type = "sound",
            name = "kj_40kdreadnought_getIn",
            filename = "__kj_40kdreadnought__/sounds/dreadnought_voiceline_getIn.ogg",
            category = "environment",
            volume = settings.startup["kj_40kdreadnought_voiceline_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_40kdreadnought_getOut",
            filename = "__kj_40kdreadnought__/sounds/dreadnought_voiceline_getOut.ogg",
            category = "environment",
            volume = settings.startup["kj_40kdreadnought_voiceline_volume"].value / 100
        },

        {
            type = "custom-input",
            name = "kj_dreadnought_voiceline",
            key_sequence = "H",
        },
    })
end

if mods["kj_40klemanruss"] then
    local tank_gunshot = {
        {
            filename = "__base__/sound/fight/tank-cannon-1.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-2.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-3.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-4.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-5.ogg",
            volume = 0.57
        }
    }

    data:extend({
        {
            type = "gun",
            name = "kj_lemanruss_bolter",
            icon = "__kj_40klemanruss__/graphics/equipment/bolter.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "l[lemanruss]-b[bolter]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_bolter",
                cooldown = 15,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 1.4,
                projectile_center = {0, -0.6},
                --projectile_creation_parameters = shoot_shiftings_bolter(),
                range = 25,
                sound = bolterSounds("kj_40klemanruss"),
            },
            stack_size = 5
        },

        {
            type = "gun",
            name = "kj_lemanruss",
            icon = "__kj_40klemanruss__/graphics/equipment/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[maustank]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_lemanruss",
                cooldown = 240,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 4.7,
                projectile_center = {0, -1.8},
                range = 45,
                sound =
                {
                    {
                        filename = "__kj_40klemanruss__/sounds/cannon_shot1.ogg",
                        volume = 0.6
                    },
                    {
                        filename = "__kj_40klemanruss__/sounds/cannon_shot2.ogg",
                        volume = 0.6
                    },
                    {
                        filename = "__kj_40klemanruss__/sounds/cannon_shot3.ogg",
                        volume = 0.6
                    },
                    {
                        filename = "__kj_40klemanruss__/sounds/cannon_shot4.ogg",
                        volume = 0.6
                    },
                },
            },
            stack_size = 5
        },
    })
end

if mods["kj_40kpredator"] then
    local tank_gunshot =
    {
        {
            filename = "__base__/sound/fight/tank-cannon-1.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-2.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-3.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-4.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-5.ogg",
            volume = 0.57
        }
    }

    data:extend({
        {
            type = "gun",
            name = "kj_predator_bolter",
            icon = "__kj_40kpredator__/graphics/equipment/bolter.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "l[lemanruss]-b[bolter]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_bolter",
                cooldown = 15,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 1.4,
                projectile_center = {0, -0.1},
                --projectile_creation_parameters = shoot_shiftings_bolter(),
                range = 25,
                sound = bolterSounds("kj_40kpredator"),
            },
            stack_size = 5
        },
        {
            type = "gun",
            name = "kj_predator",
            icon = "__kj_40kpredator__/graphics/equipment/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[maustank]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_predator",
                cooldown = 60,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 3.5,
                projectile_center = {0, -1.4},
                range = 35,
                sound =
                {
                    {
                        filename = "__kj_40kpredator__/sounds/tank-shot.ogg",
                        volume = 0.6
                    }
                },
            },
            stack_size = 5
        },
   })
end

if mods["kj_maustank"] then
    local mg42 = table.deepcopy(data.raw["gun"]["tank-machine-gun"])
    mg42.name = "kj_mg42"
    mg42.icon = "__kj_maustank__/graphics/equipment/mg42.png"
    mg42.icon_size = 128
    mg42.attack_parameters.projectile_creation_distance = 3
    mg42.attack_parameters.projectile_center = {0,0}
    mg42.attack_parameters.cooldown = 3
    mg42.attack_parameters.range = 35
    mg42.order = "[basic-clips]-d[mg42]"
    mg42.flags = {}
    mg42.attack_parameters.sound = {
        {
            filename = "__kj_maustank__/sounds/mg42_1.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_2.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_3.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_4.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_5.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_6.ogg",
            volume = 0.4,
        },
    }
    data:extend({mg42})

    mg42 = table.deepcopy(data.raw["gun"]["submachine-gun"])
    mg42.name = "kj_mg42_hand"
    mg42.icon = "__kj_maustank__/graphics/equipment/mg42.png"
    mg42.icon_size = 128
    mg42.attack_parameters.movement_slow_down_factor = 0.9
    mg42.attack_parameters.cooldown = 3
    mg42.attack_parameters.range = 25
    mg42.order = "a[basic-clips]-d[mg42]"
    mg42.flags = {}
    mg42.attack_parameters.sound = {
        {
            filename = "__kj_maustank__/sounds/mg42_1.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_2.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_3.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_4.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_5.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_6.ogg",
            volume = 0.4,
        },
    }
    data:extend({mg42})

    data:extend({
        {
            type = "gun",
            name = "kj_128kwk",
            icon = "__kj_maustank__/graphics/equipment/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[maustank]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_128kwk",
                cooldown = 300,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 7.2,
                projectile_center = {0, -0.8},
                range = 50,
                sound =
                {
                    {
                        filename = "__kj_maustank__/sounds/tank-shot.ogg",
                        volume = 0.9
                    }
                },
            },
            stack_size = 5
        },
    })
end

if mods["kj_pak"] then
    local tank_gunshot =
    {
        {
            filename = "__kj_pak__/sounds/cannon1.ogg",
            volume = 0.7
        },
        {
            filename = "__kj_pak__/sounds/cannon2.ogg",
            volume = 0.7
        },
        {
            filename = "__kj_pak__/sounds/cannon3.ogg",
            volume = 0.7
        },
        {
            filename = "__kj_pak__/sounds/cannon4.ogg",
            volume = 0.7
        },
        {
            filename = "__kj_pak__/sounds/cannon5.ogg",
            volume = 0.7
        },
    }

    data:extend({
        {
            type = "gun",
            name = "kj_pak_gun",
            icon = "__kj_pak__/graphics/icon.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[maustank]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_pak",
                cooldown = 180,
                health_penalty = -50,
                rotate_penalty = 50,
                fire_penalty = 50,
                --warmup = 20,
                cooldown_deviation = 0.5,
                projectile_creation_distance = 4.4,
                projectile_center = {0, -0.8},
                range = 150,
                sound = tank_gunshot,
            },
            stack_size = 5
        },
    })
end

if mods["kj_panzer4"] then
	local mg34 = table.deepcopy(data.raw["gun"]["tank-machine-gun"])
	mg34.name = "kj_mg34"
	mg34.icon = "__kj_panzer4__/graphics/equipment/mg34.png"
	mg34.icon_size = 128
	mg34.attack_parameters.cooldown = 3.5
	mg34.order = "[basic-clips]-e[mg34]"
	mg34.flags = {}
	mg34.attack_parameters.range = 30
	mg34.attack_parameters.sound = {
		{
			filename = "__kj_panzer4__/sounds/mg34_1.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_2.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_3.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_4.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_5.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_6.ogg",
			volume = 0.4,
		},
	}
	data:extend({mg34})

    mg34 = table.deepcopy(data.raw["gun"]["submachine-gun"])
    mg34.name = "kj_mg34_hand"
    mg34.icon = "__kj_panzer4__/graphics/equipment/mg34.png"
    mg34.icon_size = 128
    mg34.attack_parameters.movement_slow_down_factor = 0.6
    mg34.attack_parameters.cooldown = 3.5
    mg34.attack_parameters.range = 25
    mg34.order = "a[basic-clips]-e[mg34]"
    mg34.flags = {}
    mg34.attack_parameters.sound = {
        {
            filename = "__kj_panzer4__/sounds/mg34_1.ogg",
            volume = 0.6,
        },
        {
            filename = "__kj_panzer4__/sounds/mg34_2.ogg",
            volume = 0.6,
        },
        {
            filename = "__kj_panzer4__/sounds/mg34_3.ogg",
            volume = 0.6,
        },
        {
            filename = "__kj_panzer4__/sounds/mg34_4.ogg",
            volume = 0.6,
        },
        {
            filename = "__kj_panzer4__/sounds/mg34_5.ogg",
            volume = 0.6,
        },
        {
            filename = "__kj_panzer4__/sounds/mg34_6.ogg",
            volume = 0.6,
        },
    }
    data:extend({mg34})

    local tank_gunshot =  {
        {
            filename = "__base__/sound/fight/tank-cannon-1.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-2.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-3.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-4.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-5.ogg",
            volume = 0.57
        }
    }
    data:extend({
        {
            type = "gun",
            name = "kj_75kwk40",
            icon = "__kj_panzer4__/graphics/equipment/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[panzer4]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_75kwk40",
                cooldown = 180,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 4.2,
                projectile_center = {0, 0},
                range = 40,
                sound = tank_gunshot,
            },
            stack_size = 5
        },
    })
end

if mods["kj_rex"] then
    local shoot_shiftings_cannon = {
        {0.0000, util.by_pixel(251.0 ,-644.0)},
        {0.0078, util.by_pixel(270.0 ,-640.0)},
        {0.0156, util.by_pixel(289.0 ,-630.0)},
        {0.0234, util.by_pixel(304.0 ,-620.0)},
        {0.0313, util.by_pixel(320.0 ,-606.0)},
        {0.0391, util.by_pixel(335.0 ,-594.0)},
        {0.0469, util.by_pixel(350.0 ,-579.0)},
        {0.0547, util.by_pixel(366.0 ,-566.0)},
        {0.0625, util.by_pixel(380.0 ,-552.0)},
        {0.0703, util.by_pixel(391.0 ,-537.0)},
        {0.0781, util.by_pixel(401.0 ,-523.0)},
        {0.0859, util.by_pixel(411.0 ,-507.0)},
        {0.0938, util.by_pixel(418.0 ,-493.0)},
        {0.1016, util.by_pixel(425.0 ,-478.0)},
        {0.1094, util.by_pixel(432.0 ,-464.0)},
        {0.1172, util.by_pixel(438.0 ,-449.0)},
        {0.1250, util.by_pixel(443.0 ,-435.0)},
        {0.1328, util.by_pixel(447.0 ,-419.0)},
        {0.1406, util.by_pixel(451.0 ,-403.0)},
        {0.1484, util.by_pixel(452.0 ,-385.0)},
        {0.1563, util.by_pixel(453.0 ,-371.0)},
        {0.1641, util.by_pixel(452.0 ,-356.0)},
        {0.1719, util.by_pixel(451.0 ,-338.0)},
        {0.1797, util.by_pixel(444.0 ,-326.0)},
        {0.1875, util.by_pixel(437.0 ,-311.0)},
        {0.1953, util.by_pixel(433.0 ,-294.0)},
        {0.2031, util.by_pixel(430.0 ,-276.0)},
        {0.2109, util.by_pixel(424.0 ,-260.0)},
        {0.2188, util.by_pixel(416.0 ,-245.0)},
        {0.2266, util.by_pixel(408.0 ,-230.0)},
        {0.2344, util.by_pixel(397.0 ,-214.0)},
        {0.2422, util.by_pixel(387.0 ,-200.0)},
        {0.2500, util.by_pixel(376.0 ,-187.0)},
        {0.2578, util.by_pixel(361.0 ,-174.0)},
        {0.2656, util.by_pixel(348.0 ,-162.0)},
        {0.2734, util.by_pixel(333.0 ,-147.0)},
        {0.2813, util.by_pixel(319.0 ,-135.0)},
        {0.2891, util.by_pixel(305.0 ,-129.0)},
        {0.2969, util.by_pixel(292.0 ,-118.0)},
        {0.3047, util.by_pixel(273.0 ,-106.0)},
        {0.3125, util.by_pixel(255.0 ,-102.0)},
        {0.3203, util.by_pixel(235.0 ,-89.0 )},
        {0.3281, util.by_pixel(215.0 ,-84.0 )},
        {0.3359, util.by_pixel(196.0 ,-76.0 )},
        {0.3438, util.by_pixel(175.0 ,-69.0 )},
        {0.3516, util.by_pixel(157.0 ,-68.0 )},
        {0.3594, util.by_pixel(131.0 ,-60.0 )},
        {0.3672, util.by_pixel(104.0 ,-58.0 )},
        {0.3750, util.by_pixel(88.0	 ,-52.0 )},
        {0.3828, util.by_pixel(41.0	 ,-49.0 )},
        {0.3906, util.by_pixel(18.0	 ,-48.0 )},
        {0.3984, util.by_pixel(66.0	 ,-48.0 )},
        {0.4063, util.by_pixel(-5.0	 ,-49.0 )},
        {0.4141, util.by_pixel(-24.0 ,-49.0 )},
        {0.4219, util.by_pixel(-69.0 ,-49.0 )},
        {0.4297, util.by_pixel(-49.0 ,-51.0 )},
        {0.4375, util.by_pixel(-93.0 ,-54.0 )},
        {0.4453, util.by_pixel(-113.0,-55.0 )},
        {0.4531, util.by_pixel(-136.0,-61.0 )},
        {0.4609, util.by_pixel(-156.0,-67.0 )},
        {0.4688, util.by_pixel(-177.0,-73.0 )},
        {0.4766, util.by_pixel(-195.0,-80.0 )},
        {0.4844, util.by_pixel(-215.0,-90.0 )},
        {0.4922, util.by_pixel(-234.0,-98.0 )},
        {0.5000, util.by_pixel(-251.0,-107.0)},
        {0.5078, util.by_pixel(-269.0,-115.0)},
        {0.5156, util.by_pixel(-287.0,-126.0)},
        {0.5234, util.by_pixel(-302.0,-137.0)},
        {0.5313, util.by_pixel(-317.0,-149.0)},
        {0.5391, util.by_pixel(-333.0,-161.0)},
        {0.5469, util.by_pixel(-348.0,-170.0)},
        {0.5547, util.by_pixel(-360.0,-181.0)},
        {0.5625, util.by_pixel(-372.0,-194.0)},
        {0.5703, util.by_pixel(-382.0,-210.0)},
        {0.5781, util.by_pixel(-392.0,-224.0)},
        {0.5859, util.by_pixel(-403.0,-236.0)},
        {0.5938, util.by_pixel(-411.0,-251.0)},
        {0.6016, util.by_pixel(-417.0,-262.0)},
        {0.6094, util.by_pixel(-422.0,-277.0)},
        {0.6172, util.by_pixel(-428.0,-293.0)},
        {0.6250, util.by_pixel(-431.0,-308.0)},
        {0.6328, util.by_pixel(-437.0,-325.0)},
        {0.6406, util.by_pixel(-439.0,-337.0)},
        {0.6484, util.by_pixel(-442.0,-355.0)},
        {0.6563, util.by_pixel(-440.0,-370.0)},
        {0.6641, util.by_pixel(-441.0,-387.0)},
        {0.6719, util.by_pixel(-442.0,-405.0)},
        {0.6797, util.by_pixel(-440.0,-420.0)},
        {0.6875, util.by_pixel(-438.0,-441.0)},
        {0.6953, util.by_pixel(-434.0,-456.0)},
        {0.7031, util.by_pixel(-428.0,-468.0)},
        {0.7109, util.by_pixel(-424.0,-483.0)},
        {0.7188, util.by_pixel(-418.0,-492.0)},
        {0.7266, util.by_pixel(-410.0,-507.0)},
        {0.7344, util.by_pixel(-399.0,-524.0)},
        {0.7422, util.by_pixel(-393.0,-537.0)},
        {0.7500, util.by_pixel(-378.0,-550.0)},
        {0.7578, util.by_pixel(-370.0,-562.0)},
        {0.7656, util.by_pixel(-353.0,-577.0)},
        {0.7734, util.by_pixel(-337.0,-585.0)},
        {0.7813, util.by_pixel(-325.0,-599.0)},
        {0.7891, util.by_pixel(-310.0,-610.0)},
        {0.7969, util.by_pixel(-294.0,-620.0)},
        {0.8047, util.by_pixel(-281.0,-630.0)},
        {0.8125, util.by_pixel(-258.0,-638.0)},
        {0.8203, util.by_pixel(-239.0,-648.0)},
        {0.8281, util.by_pixel(-221.0,-657.0)},
        {0.8359, util.by_pixel(-201.0,-663.0)},
        {0.8438, util.by_pixel(-180.0,-670.0)},
        {0.8516, util.by_pixel(-158.0,-675.0)},
        {0.8594, util.by_pixel(-140.0,-681.0)},
        {0.8672, util.by_pixel(-126.0,-687.0)},
        {0.8750, util.by_pixel(-101.0,-693.0)},
        {0.8828, util.by_pixel(-81.0 ,-696.0)},
        {0.8906, util.by_pixel(-46.0 ,-697.0)},
        {0.8984, util.by_pixel(-30.0 ,-698.0)},
        {0.9063, util.by_pixel(-11.0 ,-699.0)},
        {0.9141, util.by_pixel(17.0	 ,-696.0)},
        {0.9219, util.by_pixel(36.0	 ,-696.0)},
        {0.9297, util.by_pixel(89.0	 ,-690.0)},
        {0.9375, util.by_pixel(66.0	 ,-688.0)},
        {0.9453, util.by_pixel(108.0 ,-684.0)},
        {0.9531, util.by_pixel(129.0 ,-681.0)},
        {0.9609, util.by_pixel(148.0 ,-679.0)},
        {0.9688, util.by_pixel(174.0 ,-672.0)},
        {0.9766, util.by_pixel(192.0 ,-667.0)},
        {0.9844, util.by_pixel(215.0 ,-660.0)},
        {0.9922, util.by_pixel(235.0 ,-655.0)},
    }

    local rexmg = table.deepcopy(data.raw["gun"]["tank-machine-gun"])
    rexmg.name = "kj_rex_mg"
    rexmg.order = "[basic-clips]-e[rexmg]"
    rexmg.flags = {}
    rexmg.attack_parameters.range = 70
    rexmg.attack_parameters.cooldown = 3.5
    rexmg.attack_parameters.damage_modifier = 3
    rexmg.attack_parameters.projectile_center = {}
    rexmg.attack_parameters.projectile_center = nil
    rexmg.attack_parameters.projectile_creation_distance = nil
    rexmg.attack_parameters.projectile_creation_parameters = shoot_shiftings_cannon
    for iterator,value in ipairs(rexmg.attack_parameters.sound) do
        value.volume = 0.8
    end
    data:extend({rexmg})

    local rexrocket = table.deepcopy(data.raw["gun"]["rocket-launcher"])
    rexrocket.name = "kj_rex_rocket"
    rexrocket.order = "[basic-clips]-e[rexrocket]"
    rexrocket.flags = {}
    rexrocket.attack_parameters.range = 70
    rexrocket.attack_parameters.cooldown = 45
    rexrocket.attack_parameters.damage_modifier = 3
    rexrocket.attack_parameters.projectile_center = {}
    rexrocket.attack_parameters.projectile_center = nil
    rexrocket.attack_parameters.projectile_creation_distance = nil
    rexrocket.attack_parameters.projectile_creation_parameters = shoot_shiftings_cannon
    for iterator,value in ipairs(rexrocket.attack_parameters.sound) do
        value.volume = 0.8
    end
    data:extend({rexrocket})

    data:extend({
        {
            type = "sound",
            name = "kj_rex_walking_1",
            filename = "__kj_rex__/sounds/dreadnought_walking1.ogg",
            category = "environment",
            volume = settings.startup["kj_rex_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_rex_walking_2",
            filename = "__kj_rex__/sounds/dreadnought_walking2.ogg",
            category = "environment",
            volume = settings.startup["kj_rex_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_rex_walking_3",
            filename = "__kj_rex__/sounds/dreadnought_walking3.ogg",
            category = "environment",
            volume = settings.startup["kj_rex_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_rex_walking_4",
            filename = "__kj_rex__/sounds/dreadnought_walking4.ogg",
            category = "environment",
            volume = settings.startup["kj_rex_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_rex_walking_5",
            filename = "__kj_rex__/sounds/dreadnought_walking5.ogg",
            category = "environment",
            volume = settings.startup["kj_rex_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_rex_walking_6",
            filename = "__kj_rex__/sounds/dreadnought_walking6.ogg",
            category = "environment",
            volume = settings.startup["kj_rex_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_rex_walking_7",
            filename = "__kj_rex__/sounds/dreadnought_walking7.ogg",
            category = "environment",
            volume = settings.startup["kj_rex_walking_volume"].value / 100
        },

        {
            type = "gun",
            name = "kj_rex_cannon",
            icon = "__kj_rex__/graphics/equipment/railgun.png",
            icon_size = 32,
            hidden = true,
            subgroup = "gun",
            order = "z[rex]-a[railgun]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_rex_cannon",
                cooldown = 300,
                health_penalty = -5,
                rotate_penalty = 5,
                damage_modifier = 1,
                --projectile_creation_distance = 3.5,
                --projectile_center = {0, -3.8},
                projectile_creation_parameters = shoot_shiftings_cannon,
                range = 60,
                sound =
                {
                    {
                        filename = "__kj_rex__/sounds/railgun.ogg",
                        volume = 1
                    }
                },
            },
            stack_size = 5
        },
    })
end

if mods["kj_rattetank"] then
    data:extend({
        {
            type = "gun",
            name = "kj_280SKC34",
            icon = "__kj_rattetank__/graphics/equipment/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[maustank]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_280SKC34",
                cooldown = 900,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 19.2,
                projectile_center = {0, -5},
                range = 80,
                sound = {
                    {
                        filename = "__kj_rattetank__/sounds/ratte_shot.ogg",
                        volume = 1
                    }
                },
            },
            stack_size = 5
        },
    })
end

if mods["kj_ray"] then
    local raymg = table.deepcopy(data.raw["gun"]["tank-machine-gun"])
    raymg.name = "kj_ray_mg"
    raymg.order = "[basic-clips]-e[raymg]"
    raymg.localised_name = {"", {"item-name.kj_ray_mg"}}
    raymg.localised_description = {"", {"item-description.kj_ray_mg"}}
    raymg.flags = {}
    raymg.attack_parameters.range = 70
    raymg.attack_parameters.cooldown = 3.5
    raymg.attack_parameters.damage_modifier = 3
    raymg.attack_parameters.projectile_center = {0, -6}
    raymg.attack_parameters.projectile_creation_distance = 0
    for iterator,value in ipairs(raymg.attack_parameters.sound) do 
        value.volume = 0.8
    end
    data:extend({raymg})

    local rayrocket = table.deepcopy(data.raw["gun"]["rocket-launcher"])
    rayrocket.name = "kj_ray_rocket"
    rayrocket.hidden = true
    rayrocket.order = "[basic-clips]-e[rayrocket]"
    rayrocket.localised_name = {"", {"item-name.kj_ray_rocket"}}
    rayrocket.localised_description = {"", {"item-description.kj_ray_rocket"}}
    rayrocket.flags = {}
    rayrocket.attack_parameters.range = 70
    rayrocket.attack_parameters.cooldown = 45
    rayrocket.attack_parameters.damage_modifier = 3
    rayrocket.attack_parameters.projectile_center = {0, -6}
    rayrocket.attack_parameters.projectile_creation_distance = 0
    for iterator,value in ipairs(rayrocket.attack_parameters.sound) do 
        value.volume = 0.8
    end
    data:extend({rayrocket})

    data:extend({
        {
            type = "sound",
            name = "kj_watersplash_big",
            filename = "__kj_ray__/sounds/waterSplash.ogg",
            category = "environment",
            volume = 1
        },

        {
            type = "sound",
            name = "kj_ray_walking_1",
            filename = "__kj_ray__/sounds/ray_walking1.ogg",
            category = "environment",
            volume = settings.startup["kj_ray_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_ray_walking_2",
            filename = "__kj_ray__/sounds/ray_walking2.ogg",
            category = "environment",
            volume = settings.startup["kj_ray_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_ray_walking_3",
            filename = "__kj_ray__/sounds/ray_walking3.ogg",
            category = "environment",
            volume = settings.startup["kj_ray_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_ray_walking_4",
            filename = "__kj_ray__/sounds/ray_walking4.ogg",
            category = "environment",
            volume = settings.startup["kj_ray_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_ray_walking_5",
            filename = "__kj_ray__/sounds/ray_walking5.ogg",
            category = "environment",
            volume = settings.startup["kj_ray_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_ray_walking_6",
            filename = "__kj_ray__/sounds/ray_walking6.ogg",
            category = "environment",
            volume = settings.startup["kj_ray_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_ray_walking_7",
            filename = "__kj_ray__/sounds/ray_walking7.ogg",
            category = "environment",
            volume = settings.startup["kj_ray_walking_volume"].value / 100
        },

        {
            type = "gun",
            name = "kj_ray_cannon",
            icon = "__kj_ray__/graphics/equipment/railgun.png",
            icon_size = 32,
            hidden = true,
            subgroup = "gun",
            order = "y[ray]-a[railgun]",
            localised_name = {"", {"item-name.kj_ray_cannon"}},
            localised_description = {"", {"item-description.kj_ray_cannon"}},
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_ray_cannon",
                cooldown = 300,
                health_penalty = -5,
                rotate_penalty = 5,
                damage_modifier = 1,
                projectile_creation_distance = 8,
                projectile_center = {0, -4},
                --projectile_creation_parameters = shoot_shiftings_cannon(),
                range = 60,
                sound =
                {
                    {
                    filename = "__kj_ray__/sounds/railgun.ogg",
                    volume = 1
                    }
                },
            },
            stack_size = 5
        },

        {
            type = "trivial-smoke",
            name = "kj_ray_splash",
            duration = 60,
            fade_in_duration = 10,
            fade_away_duration = 10,
            spread_duration = 600,
            start_scale = 0.50,
            end_scale = 1.5,
            color = { r = 1, g = 1, b = 1, a = 1},
            cyclic = false,
            affected_by_wind = false,
            render_layer = "ground-layer-1",
            movement_slow_down_factor = 0,
            show_when_smoke_off = true,
            animation =
            {
                filename = "__kj_ray__/graphics/water-splash.png",
                width = 460/5,
                height = 198/3,
                line_length = 5,
                frame_count = 5*3,
                --shift = util.by_pixel(0,-16),
                priority = "high",
                scale = 2,
                animation_speed = 0.05,
            }
        },
    })

    local highestNumber = 0
    for _,layer in pairs(data.raw["collision-layer"]) do
        if tonumber(layer.order) ~= nil then
            highestNumber = math.max(highestNumber, tonumber(layer.order))
        end
    end
    data:extend({
        {type = "collision-layer", order = string.format("%02d", highestNumber + 1), name = "out_of_map"},
    })
    data.raw["tile"]["out-of-map"].collision_mask.layers.out_of_map = true
end

if mods["kj_swspeeder"] then
    local blasterStrength = settings.startup["kj_swspeeder_blaster_strength"].value

    data:extend({
        {
            type = "sound",
            name = "kj_swspeeder_s_1",
            filename = "__kj_swspeeder__/sounds/blaster1.ogg",
            category = "environment",
            volume = 0.5
        },
        {
            type = "sound",
            name = "kj_swspeeder_s_2",
            filename = "__kj_swspeeder__/sounds/blaster2.ogg",
            category = "environment",
            volume = 0.5
        },
        {
            type = "sound",
            name = "kj_swspeeder_s_3",
            filename = "__kj_swspeeder__/sounds/blaster3.ogg",
            category = "environment",
            volume = 0.5
        },
        {
            type = "custom-input",
            name = "kj_speeder_fire",
            key_sequence = "",
            linked_game_control = "shoot-enemy"
        },
        {
            type = "projectile",
            name = "kj_speeder_projectile",
            flags = {"not-on-map"},
            hidden = true,
            collision_box = {{-0.2, -0.5}, {0.2, 0.5}},
            acceleration = 0,
            height = 0,
            direction_only = true,
            piercing_damage = 300,
            action =
            {
                type = "direct",
                action_delivery =
                {
                    type = "instant",
                    target_effects =
                    {
                        {
                            type = "damage",
                            damage = {amount = 100 * blasterStrength, type = "fire"}
                        },
                        {
                            type = "damage",
                            damage = {amount = 200 * blasterStrength, type = "physical"}
                        },
                        {
                            type = "damage",
                            damage = {amount = 50 * blasterStrength, type = "electric"}
                        },
                        {
                            type = "damage",
                            damage = {amount = 400 * blasterStrength, type = "laser"}
                        },
                        {
                            type = "create-entity",
                            entity_name = "explosion"
                        }
                    }
                }
            },
            final_action =
            {
                type = "direct",
                action_delivery =
                {
                    type = "instant",
                    target_effects =
                    {
                        {
                            type = "create-entity",
                            entity_name = "small-scorchmark-tintable",
                            check_buildability = true
                        }
                    }
                }
            },
            animation =
            {
                filename = "__kj_swspeeder__/graphics/bullet.png",
                draw_as_glow = true,
                frame_count = 1,
                width = 6,
                height = 100,
                scale = 0.5,
                priority = "high"
            }
        },
        {
            type = "gun",
            name = "kj_speeder_gun",
            icon = "__kj_swspeeder__/graphics/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[speeder]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_swspeeder",
                --ammo_category = "cannon-shell",
                cooldown = 1,
                --movement_slow_down_factor = 0,
                --projectile_creation_distance = 2,
                --projectile_center = {0,0},
                range = 50,
                --sound = sounds.tank_gunshot,
                --turn_range = 0.5,
                --rotate_penalty = 1000,
            },
            stack_size = 1
        },
    })
end

if mods["kj_wirbelwind"] then
    local tank_gunshot =
    {
        {
            filename = "__base__/sound/fight/tank-cannon-1.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-2.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-3.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-4.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-5.ogg",
            volume = 0.57
        }
    }

    data:extend({
        {
            type = "damage-type",
            name = "flak"
        },
        {
            type = "gun",
            name = "kj_2cmfv",
            icon = "__kj_wirbelwind__/graphics/equipment/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[wirbelwind]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_2cmfv",
                cooldown = 10,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 2.5,
                projectile_center = {0, -1},
                range = 45,
                sound = tank_gunshot,
            },
            stack_size = 5
        },
    })
end


if mods["kj_bulldozer"] then
    data:extend({
        {
            type = "custom-input",
            name = "kj_bulldozer_speed",
            key_sequence = "",
            linked_game_control = "shoot-enemy"
        },

        {
            type = "gun",
            name = "kj_bulldozer_gun",
            icon = "__base__/graphics/icons/engine-unit.png",
            hidden = true,
            subgroup = "gun",
            order = "z[bulldozer]-a[cannon]",
            attack_parameters =
            {
                ammo_category = "kj_bulldozer",
                type = "projectile",
                cooldown = 1,
                range = 1,
            },
            stack_size = 1
        },
    })
end

if mods["kj_cybertruck"] then
    table.insert(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories, "assembling-machine-one")
    table.insert(data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories, "assembling-machine-two")
    table.insert(data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories, "assembling-machine-three")

    data:extend({
        {
            type = "recipe-category",
            name = "assembling-machine-one"
        },
        {
            type = "recipe-category",
            name = "assembling-machine-two"
        },
        {
            type = "recipe-category",
            name = "assembling-machine-three"
        },

        {
            type = "item",
            name = "kj_el_charge",
            icon = "__kj_cybertruck__/graphics/battery.png",
            icon_size = 128,
            subgroup = sg,
            order = order.."1",
            stack_size = 1,

            burnt_result = "kj_el_charge_used",
            fuel_value = "100MJ",
            fuel_acceleration_multiplier = 1.9,
            fuel_category = "kj_el_car_fuel",
            weight = 100 * 1000,
        },
        {
            type = "item",
            name = "kj_el_charge_used",
            icon = "__kj_cybertruck__/graphics/battery.png",
            icon_size = 128,
            subgroup = sg,
            order = order.."2",
            stack_size = 1,
        },
    })
end

if mods["kj_gigahorse"] then
    data:extend({
        trivial_smoke {
            name = "kj_gigahorse_smoke",
            color = {r = 0.01, g = 0.01, b = 0.01, a = 1},
            duration = 180,
            spread_duration = 180,
            fade_away_duration = 180,
            start_scale = 0.1,
            end_scale = 1.0,
        },
    })
end

if mods["kj_warrig"] then
    data:extend({
        trivial_smoke {
            name = "kj_warrig_smoke",
            color = {r = 0.01, g = 0.01, b = 0.01, a = 1},
            duration = 180,
            spread_duration = 180,
            fade_away_duration = 180,
            start_scale = 0.1,
            end_scale = 1.0,
        },

        {
            type = "rail-planner",
            name = "kj_warrig_rails",
            icon = "__kj_warrig__/graphics/road.png",
            icon_size = 128,
            subgroup = "transport",
            order = "1[civil]-i4",
            place_result = "kj_warrig_rail_straight",
            stack_size = 100,
            weight = 10*1000,
            rails =
            {
              "kj_warrig_rail_straight",
              "kj_warrig_rail_half_diagonal",
              "kj_warrig_rail_curved_rail_a",
              "kj_warrig_rail_curved_rail_b",
            },
            --rails = {"kj_warrig_rail_straight", "kj_warrig_rail_curved"},
        },
    })
end

if mods["kj_40kbunker"] then
    data:extend({
        {
            type = "gun",
            name = "kj_40kbunker_gun",
            icon = "__kj_40kbunker__/graphics/icon.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[maustank]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "bullet",
                cooldown = 4,
                movement_slow_down_factor = 0.7,
                projectile_creation_distance = 4.4,
                projectile_center = {0, 0},
                range = 25,
                sound = sounds.heavy_gunshot,
            },
            stack_size = 5
        },
    })
end

if mods["kj_b2"] then
    data:extend({
        trivial_smoke
        {
            name = "kj_b2_smoke",
            color = {r = 0.01, g = 0.01, b = 0.01, a = 1},
            duration = 10,
            spread_duration = 10,
            fade_away_duration = 10,
            start_scale = 0.1,
            end_scale = 0.5
        },
        
        {
            type = "gun",
            name = "kj_b2_bombs",
            icon = "__kj_vehicles__/graphics/bomb.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "b[b2]-b[bombs]",
            attack_parameters =
            {
                type = "projectile",
                ammo_categories = {"kj_plane_50", "kj_plane_250", "kj_plane_500", "kj_plane_1000", "kj_plane_napalm", "kj_plane_atom"},
                cooldown = 0,
                health_penalty = -10,
                projectile_creation_distance = 0,
                projectile_center = {0, 0},
                damage_modifier = 2,
                range = 20,
                sound = {
                    filename = "__base__/sound/artillery-open.ogg",
                    volume = 0.6,
                },
            },
            stack_size = 1
        },
    })
end

if mods["kj_b17"] then
    data:extend({
        trivial_smoke
        {
            name = "kj_b17_smoke",
            color = {r = 0.01, g = 0.01, b = 0.01, a = 1},
            duration = 10,
            spread_duration = 10,
            fade_away_duration = 10,
            start_scale = 0.1,
            end_scale = 0.5,
        },

        {
            type = "gun",
            name = "kj_b17_machinegun",
            icon = "__base__/graphics/icons/submachine-gun.png",
            icon_size = 64,
            hidden = true,
            subgroup = "gun",
            order = "e[b17machinegun]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_plane_lcal",
                cooldown = 9,
                movement_slow_down_factor = 0.5,
                shell_particle = data.raw["gun"]["tank-machine-gun"].attack_parameters.shell_particle,
                range = 20,
                sound = data.raw["gun"]["tank-machine-gun"].attack_parameters.sound
            },
            stack_size = 1
        },
        {
            type = "gun",
            name = "kj_b17_bombs",
            icon = "__kj_vehicles__/graphics/bomb.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "b[b17]-b[bombs]",
            attack_parameters =
            {
                type = "projectile",
                ammo_categories = {"kj_plane_50", "kj_plane_250", "kj_plane_500", "kj_plane_1000", "kj_plane_napalm"},
                cooldown = 0,
                health_penalty = -10,
                projectile_creation_distance = 0,
                projectile_center = {0, 0},
                range = 20,
                sound = {
                    filename = "__base__/sound/artillery-open.ogg",
                    volume = 0.6,
                } ,
            },
            stack_size = 1
        },
    })
end

if mods["kj_b29"] then
    data:extend({
        trivial_smoke
        {
            name = "kj_b29_smoke",
            color = {r = 0.01, g = 0.01, b = 0.01, a = 1},
            duration = 10,
            spread_duration = 10,
            fade_away_duration = 10,
            start_scale = 0.1,
            end_scale = 0.5,
        },

        {
            type = "gun",
            name = "kj_b29_machinegun",
            icon = "__base__/graphics/icons/submachine-gun.png",
            icon_size = 64,
            hidden = true,
            subgroup = "gun",
            order = "e[b29machinegun]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_plane_lcal",
                cooldown = 9,
                movement_slow_down_factor = 0.5,
                shell_particle = data.raw["gun"]["tank-machine-gun"].attack_parameters.shell_particle,
                range = 20,
                sound = data.raw["gun"]["tank-machine-gun"].attack_parameters.sound
            },
            stack_size = 1
        },
        {
            type = "gun",
            name = "kj_b29_bombs",
            icon = "__kj_vehicles__/graphics/bomb.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "b[b29]-b[bombs]",
            attack_parameters =
            {
                type = "projectile",
                ammo_categories = {"kj_plane_50", "kj_plane_250", "kj_plane_500", "kj_plane_1000", "kj_plane_atom",  "kj_plane_napalm"},
                cooldown = 0,
                health_penalty = -10,
                projectile_creation_distance = 0,
                projectile_center = {0, 0},
                range = 20,
                sound = {
                    filename = "__base__/sound/artillery-open.ogg",
                    volume = 0.6,
                } ,
            },
            stack_size = 1
        },
    })
end

if mods["kj_bf109"] then
    data:extend({
        trivial_smoke
        {
            name = "kj_bf109_smoke",
            color = {r = 0.01, g = 0.01, b = 0.01, a = 1},
            duration = 10,
            spread_duration = 10,
            fade_away_duration = 10,
            start_scale = 0.1,
            end_scale = 0.5
        },

        {
            type = "gun",
            name = "kj_bf109_machinegun",
            icon = "__base__/graphics/icons/submachine-gun.png",
            icon_size = 64,
            hidden = true,
            subgroup = "gun",
            order = "e[bf109machinegun]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_plane_lcal",
                cooldown = 5,
                movement_slow_down_factor = 0.5,
                shell_particle = data.raw["gun"]["tank-machine-gun"].attack_parameters.shell_particle,
                range = 20,
                sound = data.raw["gun"]["tank-machine-gun"].attack_parameters.sound
            },
            stack_size = 1
        },
        {
            type = "gun",
            name = "kj_bf109_machinecannon",
            icon = "__base__/graphics/icons/submachine-gun.png",
            icon_size = 64,
            hidden = true,
            subgroup = "gun",
            order = "f[bf109machinecannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_plane_hcal",
                cooldown = 8,
                movement_slow_down_factor = 0.5,
                shell_particle = data.raw["gun"]["tank-machine-gun"].attack_parameters.shell_particle,
                range = 20,
                sound =
                {
                    {
                        filename = "__kj_bf109__/sounds/machinecannon-1.ogg",
                        volume = 0.6
                    },
                    {
                        filename = "__kj_bf109__/sounds/machinecannon-2.ogg",
                        volume = 0.6
                    },
                    {
                        filename = "__kj_bf109__/sounds/machinecannon-3.ogg",
                        volume = 0.6
                    },
                },
            },
            stack_size = 1
        },
    })
end

if mods["kj_ho229"] then
    data:extend({
        trivial_smoke
        {
            name = "kj_ho229_smoke",
            color = {r = 0.01, g = 0.01, b = 0.01, a = 1},
            duration = 10,
            spread_duration = 10,
            fade_away_duration = 10,
            start_scale = 0.1,
            end_scale = 0.5
        },

        {
            type = "gun",
            name = "kj_ho229_machinegun",
            icon = "__base__/graphics/icons/submachine-gun.png",
            icon_size = 64,
            hidden = true,
            subgroup = "gun",
            order = "e[ho229machinegun]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_plane_hcal",
                cooldown = 8,
                movement_slow_down_factor = 0.5,
                shell_particle = data.raw["gun"]["tank-machine-gun"].attack_parameters.shell_particle,
                range = 30,
                sound =
                {
                    {
                        filename = "__kj_ho229__/sounds/machinecannon-1.ogg",
                        volume = 0.6
                    },
                    {
                        filename = "__kj_ho229__/sounds/machinecannon-2.ogg",
                        volume = 0.6
                    },
                    {
                        filename = "__kj_ho229__/sounds/machinecannon-3.ogg",
                        volume = 0.6
                    },
                },
            },
            stack_size = 1
        },
    })
end

if mods["kj_ju52"] then
    data:extend({
        trivial_smoke
        {
            name = "kj_ju52_smoke",
            color = {r = 0.01, g = 0.01, b = 0.01, a = 1},
            duration = 10,
            spread_duration = 10,
            fade_away_duration = 10,
            start_scale = 0.1,
            end_scale = 0.5
        },
    })
end

if mods["kj_ju87"] then
    data:extend({
        trivial_smoke
        {
            name = "kj_ju87_smoke",
            color = {r = 0.01, g = 0.01, b = 0.01, a = 1},
            duration = 10,
            spread_duration = 10,
            fade_away_duration = 10,
            start_scale = 0.1,
            end_scale = 0.5
        },

        {
            type = "gun",
            name = "kj_ju87_machinegun",
            icon = "__base__/graphics/icons/submachine-gun.png",
            icon_size = 64,
            hidden = true,
            subgroup = "gun",
            order = "e[ju87machinegun]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_plane_lcal",
                cooldown = 4,
                movement_slow_down_factor = 0.5,
                shell_particle = data.raw["gun"]["tank-machine-gun"].attack_parameters.shell_particle,
                range = 10,
                sound = data.raw["gun"]["tank-machine-gun"].attack_parameters.sound
            },
            stack_size = 1
        },

        {
            type = "gun",
            name = "kj_ju87_small_bomb",
            icon = "__kj_vehicles__/graphics/bomb.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "j[ju87]-a[small bomb]",
            attack_parameters =
            {
                type = "projectile",
                ammo_categories = {"kj_plane_50"},
                cooldown = 0,
                health_penalty = -10,
                projectile_creation_distance = 0,
                projectile_center = {0, 0},
                range = 10,
                sound = {
                    filename = "__base__/sound/metallic-chest-open.ogg",
                    volume = 0.6,
                },
            },
            stack_size = 1
        },

        {
            type = "gun",
            name = "kj_ju87_big_bomb",
            icon = "__kj_vehicles__/graphics/bomb.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "j[ju87]-b[big bomb]",
            attack_parameters =
            {
                type = "projectile",
                ammo_categories = {"kj_plane_50", "kj_plane_250", "kj_plane_500"},
                cooldown = 0,
                health_penalty = -10,
                projectile_creation_distance = 0,
                projectile_center = {0, 0},
                range = 10,
                sound = {
                    filename = "__base__/sound/artillery-open.ogg",
                    volume = 0.6,
                },
            },
            stack_size = 1
        },
    })
end

if mods["kj_jug38"] then
    data:extend({
        trivial_smoke
        {
            name = "kj_jug38_smoke",
            color = {r = 0.01, g = 0.01, b = 0.01, a = 1},
            duration = 10,
            spread_duration = 10,
            fade_away_duration = 10,
            start_scale = 0.1,
            end_scale = 0.5
        },
    })
end

if mods["kj_xb35"] then
    data:extend({
        {
            type = "gun",
            name = "kj_xb35_bombs",
            icon = "__kj_vehicles__/graphics/bomb.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "xb35[xb35]-b[bombs]",
            attack_parameters =
            {
                type = "projectile",
                ammo_categories = {"kj_plane_50", "kj_plane_250", "kj_plane_500", "kj_plane_1000", "kj_plane_napalm", "kj_plane_atom"},
                cooldown = 0,
                health_penalty = -10,
                projectile_creation_distance = 0,
                projectile_center = {0, 0},
                range = 30,
                sound =
                    {
                        filename = "__base__/sound/artillery-open.ogg",
                        volume = 0.6,
                    },
            },
            stack_size = 1
        },
    })
end