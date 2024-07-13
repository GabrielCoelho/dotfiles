local wt = require("wezterm")
local config = wt.config_builder()
config.color_scheme = "Gruvbox Dark (Gogh)"
config.window_frame = {
	font = wt.font({ family = "Monaspace Xenon" }),
	font_size = 9.5,
}
config.window_background_image = "~/.bg_wez.jpg"
config.window_background_opacity = 0.789898
config.default_cursor_style = "SteadyBlock"
config.enable_kitty_keyboard = true
config.enable_tab_bar = false
config.keys = {
	{
		key = "Backspace",
		mods = "CTRL",
		action = wt.action({ SendKey = { key = "w", mods = "CTRL" } }),
	},
}
-- Spawn a fish shell in login mode
config.default_prog = { "/usr/bin/fish", "-l" }
return config
