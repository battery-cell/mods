if data.raw.technology["basic-vehicles"] then
  --data.raw.technology["vehicle-miner"].prerequisites = {"basic-vehicles"}
end

if mods["aai-industry"] then
  data.raw.recipe["vehicle-miner"].ingredients = {
          {type="item", name="burner-mining-drill", amount=5},
          {type="item", name="iron-plate", amount=20},
          {type="item", name="motor", amount=6},
  }
end
