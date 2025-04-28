data:extend{
    {
        type = "bool-setting",
        name = "aai-containers-resize-1x1",
        setting_type = "startup",
        default_value = true,
        order = "a"
    },
	{
        type = "bool-setting",
        name = "aai-containers-scale-icons",
        setting_type = "startup",
        default_value = false,
        order = "b"
    },
    {
        type = "bool-setting",
        name = "aai-containers-number-icons",
        setting_type = "startup",
        default_value = true,
        order = "c"
    },
    {
        type = "string-setting",
        name = "aai-containers-progression",
        setting_type = "startup",
        default_value = "Vanilla",
        allowed_values = {"Smooth", "Legacy", "Vanilla", "Low", "Med", "High", "CDLow", "CDMed", "CDHigh", "CDExtreme"},
        order = "d"
    },
}
