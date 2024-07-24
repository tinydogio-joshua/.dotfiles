local wezterm = require("wezterm")

local config = {
	-- Colors
	colors = {
		foreground = "#E0E2EA",
		background = "#14161b",
		cursor_fg = "#14161b",
		cursor_bg = "#E0E2EA",
		cursor_border = "#14161b",
		selection_bg = "#4f5258",
		ansi = {
			"#2c2e33",
			"#E5ADB9",
			"#A2DFC0",
			"#E3CA85",
			"#95C5E5",
			"#E5B6E6",
			"#7EDFDE",
			"#C4C6CD",
		},
		brights = {
			"#4f5258",
			"#FFC0B9",
			"#B4F6C0",
			"#FCE094",
			"#A6DBFF",
			"#FFCAFF",
			"#8CF8F7",
			"#9b9ea4",
		},
	},

	-- Tab Bar Styles
	tab_bar = {
		background = wezterm.style.background("#14161b"),
		inactive_tab_edge = wezterm.style.background("#14161b"),
		active_tab = wezterm.style.foreground("#14161b").background("#E0E2EA").bold(),
		inactive_tab = wezterm.style.foreground("#C4C6CD").background("#14161b"),
		inactive_tab_hover = wezterm.style.foreground("#14161b").background("#E0E2EA").bold(),
		new_tab = wezterm.style.foreground("#c4c6cd").background("#14161b"),
		new_tab_hover = wezterm.style.foreground("#c4c6cd").italic().background("#14161b"),
	},

	-- Metadata
	theme_name = "nvim_default_dark",
}
function M.window_frame() -- (Fancy tab bar only)
	return {
		active_titlebar_bg = palette.base,
		inactive_titlebar_bg = palette.base,
	}
end

return config
