-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.color_scheme = 'rose-pine-moon'
config.font = wezterm.font 'JetBrains Mono'
config.line_height = 1.25

local padding = '32px'

config.window_padding = {
  left = padding,
  right = padding,
  top = padding,
  bottom = padding,
}

config.enable_tab_bar = false
config.window_decorations = 'RESIZE'

return config
