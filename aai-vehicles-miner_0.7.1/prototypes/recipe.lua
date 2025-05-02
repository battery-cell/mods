data:extend{
    {
        type = "recipe",
        name = "vehicle-miner",
        ingredients = {
            {type="item", name="burner-mining-drill", amount=5},
            {type="item", name="iron-plate", amount=20},
            {type="item", name="iron-gear-wheel", amount=10},
        },
        enabled = false,
        energy_required = 4,
        results= { {type="item", name="vehicle-miner", amount=1} }
    },
    {
        type = "recipe",
        name = "vehicle-miner-mk2",
        ingredients = {
            {type="item", name="vehicle-miner", amount=1},
            {type="item", name="electric-mining-drill", amount=5},
            {type="item", name="engine-unit", amount=5},
            {type="item", name="steel-plate", amount=20},
        },
        enabled = false,
        energy_required = 4,
        results= { {type="item", name="vehicle-miner-mk2", amount=1} }
    },
    {
        type = "recipe",
        name = "vehicle-miner-mk3",
        ingredients = {
            {type="item", name="vehicle-miner-mk2", amount=1},
            {type="item", name="speed-module", amount=5},
            {type="item", name="electric-engine-unit", amount=10},
            {type="item", name="steel-plate", amount=30},
        },
        enabled = false,
        energy_required = 8,
        results= { {type="item", name="vehicle-miner-mk3", amount=1} }
    },
    {
        type = "recipe",
        name = "vehicle-miner-mk4",
        ingredients = {
            {type="item", name="vehicle-miner-mk3", amount=1},
            {type="item", name="speed-module-2", amount=10},
            {type="item", name="processing-unit", amount=20},
            {type="item", name="electric-engine-unit", amount=20},
            {type="item", name="steel-plate", amount=40},
        },
        enabled = false,
        energy_required = 10,
        results= { {type="item", name="vehicle-miner-mk4", amount=1} }

    },
    {
        type = "recipe",
        name = "vehicle-miner-mk5",
        ingredients = {
            {type="item", name="vehicle-miner-mk4", amount=1},
            {type="item", name="fission-reactor-equipment", amount=1},
            {type="item", name="speed-module-3", amount=20},
            {type="item", name="steel-plate", amount=50},
            {type="item", name="electric-engine-unit", amount=100},
        },
        enabled = false,
        energy_required = 12,
        results= { {type="item", name="vehicle-miner-mk5", amount=1} }
    },
}
