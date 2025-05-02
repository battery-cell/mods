local CHAR_NAME = require("name")

if(mods["CharSelect"]) then
    table.insert(data.raw["string-setting"]["Selected-Character"].allowed_values, CHAR_NAME)
end
