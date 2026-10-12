local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font({
	family = "FiraCode Nerd Font",
})
config.font_size = 13
config.color_scheme = "Tokyo Night Storm (Gogh)"
config.hide_tab_bar_if_only_one_tab = true
config.enable_wayland = true
config.window_decorations = "RESIZE|TITLE"
config.freetype_load_target = "Light"
config.window_background_opacity = 1
config.use_fancy_tab_bar = false

config.keys = {
	{ key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\x1b\r" }) },
}

return config
