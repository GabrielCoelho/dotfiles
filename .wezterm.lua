local wt = require("wezterm")
local config = wt.config_builder()
config.color_scheme = "Gruvbox Dark (Gogh)"
config.font = wt.font("Monaspace Xenon")
config.font_size = 9.5
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
config.window_background_gradient = {
	-- Can be "Vertical" or "Horizontal".  Specifies the direction
	-- in which the color gradient varies.  The default is "Horizontal",
	-- with the gradient going from left-to-right.
	-- Linear and Radial gradients are also supported; see the other
	-- examples below
	orientation = "Horizontal",

	-- Specifies the set of colors that are interpolated in the gradient.
	-- Accepts CSS style color specs, from named colors, through rgb
	-- strings and more
	colors = {
		"#000",
		"#010203",
		"#1d2021",
		"#282828",
		"#32302f",
	},

	-- Instead of specifying `colors`, you can use one of a number of
	-- predefined, preset gradients.
	-- A list of presets is shown in a section below.
	-- preset = "Warm",

	-- Specifies the interpolation style to be used.
	-- "Linear", "Basis" and "CatmullRom" as supported.
	-- The default is "Linear".
	interpolation = "Linear",

	-- How the colors are blended in the gradient.
	-- "Rgb", "LinearRgb", "Hsv" and "Oklab" are supported.
	-- The default is "Rgb".
	blend = "Hsv",

	-- To avoid vertical color banding for horizontal gradients, the
	-- gradient position is randomly shifted by up to the `noise` value
	-- for each pixel.
	-- Smaller values, or 0, will make bands more prominent.
	-- The default value is 64 which gives decent looking results
	-- on a retina macbook pro display.
	-- noise = 64,

	-- By default, the gradient smoothly transitions between the colors.
	-- You can adjust the sharpness by specifying the segment_size and
	-- segment_smoothness parameters.
	-- segment_size configures how many segments are present.
	-- segment_smoothness is how hard the edge is; 0.0 is a hard edge,
	-- 1.0 is a soft edge.

	-- segment_size = 11,
	-- segment_smoothness = 0.0,
}
-- config.window_background_image = ".bg_wez.jpg"
config.window_background_opacity = 0.9
-- Spawn a fish shell in login mode
config.default_prog = { "/usr/bin/fish", "-l" }
return config
