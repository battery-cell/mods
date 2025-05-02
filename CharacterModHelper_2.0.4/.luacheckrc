return {
  globals = {
    -- Math functions
    "abs", "ceil", "floor", "max", "min", "random", "sqrt",

    -- Factorio
    "mods", "settings", "data", "game", "script",
    "defines", "log", "math", "pairs", "remote", "rendering",
    "serpent", "string", "table", "table_size", "next",  "type", "util",
    "commands", "mod_gui",

    -- New in Factorio 2.0
    "storage",        -- Used to be 'global' in Factorio <= 1.1.110
    "helper", "prototypes",

    -- This mod
    "CMH", "CharModHelper",

    "common",
  },

  ignore = {
    "213",  -- Unused loop variable
  },
}
