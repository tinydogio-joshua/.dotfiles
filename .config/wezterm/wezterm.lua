-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

local colors = require("lua/rose-pine-dawn").colors()
local window_frame = require("lua/rose-pine-dawn").window_frame()

config.colors = colors
config.window_frame = window_frame

-- config.color_scheme = 'Everforest Dark (Gogh)'
config.font = wezterm.font("SF Mono")
config.font_size = 14
config.line_height = 1.4
config.window_background_opacity = 0.98
config.macos_window_background_blur = 50

local padding = "32px"

config.window_padding = {
	left = padding,
	right = padding,
	top = padding,
	bottom = padding,
}

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

wezterm.on("update-status", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if window:is_focused() then
		overrides.window_background_opacity = 0.98
	else
		overrides.window_background_opacity = 0.78
	end
	window:set_config_overrides(overrides)
end)

return config
