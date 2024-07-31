-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration
local config = {}

-- Set the default font
config.font = wezterm.font("JetBrains Mono")

-- Set the font size
config.font_size = 19.0

-- Set color scheme
config.color_scheme = "Dracula"

-- Disable the audible bell
config.audible_bell = "Disabled"
config.use_ime = false

-- Return the configuration to wezterm
return config
