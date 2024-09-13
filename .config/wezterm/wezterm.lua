local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Everforest Dark (Gogh)"

config.font = wezterm.font({
	family = "JetBrains Mono",
})
config.font_size = 15
config.line_height = 1.3
-- config.macos_window_background_blur = 100

local padding = "32px"

config.window_padding = {
	left = padding,
	right = padding,
	top = padding,
	bottom = padding,
}

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- wezterm.on("update-status", function(window, pane)
-- 	local overrides = window:get_config_overrides() or {}
-- 	if window:is_focused() then
-- 		overrides.window_background_opacity = 1.0
-- 	else
-- 		overrides.window_background_opacity = 1.0
-- 	end
-- 	window:set_config_overrides(overrides)
-- end)

return config
