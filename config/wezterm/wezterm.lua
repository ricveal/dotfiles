local wezterm = require("wezterm")

local wezdir = os.getenv("HOME") .. "/.config/wezterm"

local padding = 5
local act = wezterm.action
local mod = "CMD"

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  return {
    { Text = " " .. tab.active_pane.title .. " " },
  }
end)

local config = {
  window_background_opacity = 0.85,
  enable_tab_bar = false,
  window_decorations = "RESIZE",
  font = wezterm.font 'Fira Code',
  font_size = 14,
  color_scheme = "NightOwl (Gogh)",
  adjust_window_size_when_changing_font_size = true,
  native_macos_fullscreen_mode = true,
  keys = {
    {
      key = "n",
      mods = "SHIFT|CTRL",
      action = wezterm.action.ToggleFullScreen,
    },
  },
  window_padding = {
    left = padding,
    right = padding,
    top = padding,
    bottom = padding,
  },
  send_composed_key_when_left_alt_is_pressed=true,
  send_composed_key_when_right_alt_is_pressed=true,
  disable_default_key_bindings = true,
  keys = {
    { mods = mod, key = "UpArrow", action = act.ActivatePaneDirection("Up") },
    { mods = mod, key = "DownArrow", action = act.ActivatePaneDirection("Down") },
    { mods = mod, key = "RightArrow", action = act.ActivatePaneDirection("Right") },
    { mods = mod, key = "LeftArrow", action = act.ActivatePaneDirection("Left") },
    { mods = mod, key = "t", action = act.SpawnTab("CurrentPaneDomain") },
    { mods = mod, key = "|", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { mods = mod, key = "_", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { mods = mod, key = ">", action = act.MoveTabRelative(1) },
    { mods = mod, key = "<", action = act.MoveTabRelative(-1) },
    { mods = mod, key = "M", action = act.TogglePaneZoomState },
    { mods = mod, key = "p", action = act.PaneSelect({ alphabet = "", mode = "Activate" }) },
    { mods = mod, key = "C", action = act.CopyTo("ClipboardAndPrimarySelection") },
    { mods = mod, key = "l", action = wezterm.action({ ActivateTabRelative = 1 }) },
    { mods = mod, key = "h", action = wezterm.action({ ActivateTabRelative = -1 }) },
    { mods = "CMD", key = "C", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
    { mods = mod, key = "d", action = wezterm.action.ShowDebugOverlay },
    { mods = 'CMD', key = 'q', action = wezterm.action.QuitApplication },
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
