local wezterm = require("wezterm")

local wezdir = os.getenv("HOME") .. "/.config/wezterm"

local padding = 5
local act = wezterm.action
local mod = "CMD"

wezterm.on("format-tab-title", function(tab)
	return {
		{ Text = " " .. tab.active_pane.title .. " " },
	}
end)

local config = {
	-- default_prog = { "/opt/homebrew/bin/tmux" },
	enable_tab_bar = false,
	window_decorations = "RESIZE",
	font = wezterm.font("Fira Code"),
	font_size = 14,
	color_scheme = "NightOwl (Gogh)",
	adjust_window_size_when_changing_font_size = false,
	native_macos_fullscreen_mode = true,
	window_padding = {
		left = padding,
		right = padding,
		top = padding,
		bottom = padding,
	},
	use_dead_keys = false,
	send_composed_key_when_left_alt_is_pressed = true,
	send_composed_key_when_right_alt_is_pressed = true,
	
	disable_default_key_bindings = true,
	keys = {
		{ key = "*", mods = mod, action = act.ResetFontSize },
		{ key = "-", mods = mod, action = act.DecreaseFontSize },
		{ key = "+", mods = mod, action = act.IncreaseFontSize },
    { key = 'q', mods = mod, action = act.QuitApplication },
		{ key = "c", mods = mod, action = act.CopyTo("ClipboardAndPrimarySelection") },
		{ key = "v", mods = mod, action = act.PasteFrom("Clipboard") },
		{ key = "P", mods = mod, action = act.ActivateCommandPalette },
		{ key = "N", mods = mod,	action = act.ToggleFullScreen },
	},
	bold_brightens_ansi_colors = true,
	window_background_opacity = 0.95,
	cell_width = 0.9,
	scrollback_lines = 10000,
	hyperlink_rules = {
		-- Linkify things that look like URLs and the host has a TLD name.
		-- Compiled-in default. Used if you don't specify any hyperlink_rules.
		{
			regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
			format = "$0",
		},

		-- linkify email addresses
		-- Compiled-in default. Used if you don't specify any hyperlink_rules.
		{
			regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
			format = "mailto:$0",
		},

		-- file:// URI
		-- Compiled-in default. Used if you don't specify any hyperlink_rules.
		{
			regex = [[\bfile://\S*\b]],
			format = "$0",
		},

		-- Linkify things that look like URLs with numeric addresses as hosts.
		-- E.g. http://127.0.0.1:8000 for a local development server,
		-- or http://192.168.1.1 for the web interface of many routers.
		{
			regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
			format = "$0",
		},

		-- Make username/project paths clickable. This implies paths like the following are for GitHub.
		-- As long as a full URL hyperlink regex exists above this it should not match a full URL to
		-- GitHub or GitLab / BitBucket (i.e. https://gitlab.com/user/project.git is still a whole clickable URL)
		{
			regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
			format = "https://www.github.com/$1/$3",
		},
	},
}

local appearance = wezterm.gui.get_appearance()

if appearance:find("Dark") then
	config.background = {
		{
			source = {
				Gradient = {
					orientation = "Horizontal",
					colors = {
						"#00000C",
						"#000026",
						"#00000C",
					},
					interpolation = "CatmullRom",
					blend = "Rgb",
					noise = 0,
				},
			},
			width = "100%",
			height = "100%",
			opacity = 0.75,
		},
		{
			source = {
				File = { path = wezdir .. "/background.gif", speed = 0.3 },
			},
			repeat_x = "Mirror",
			height = "100%",
			opacity = 0.3,
			hsb = {
				hue = 0.9,
				saturation = 0.9,
				brightness = 0.3,
			},
		},
	}
else
	config.window_background_opacity = 1
end

return config
