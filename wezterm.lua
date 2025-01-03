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

config.font = wezterm.font {
    family = 'JetBrains Mono',
    weight = 'Medium'
}

-- Changing the color scheme:
-- config.color_scheme = 'One Dark (Gogh)'
-- config.color_scheme = 'Monokai (terminal.sexy)'
config.color_scheme = 'Gruvbox dark, hard (base16)'

-- Opacity for window background
config.window_background_opacity = 0.92

-- Window padding
local horizontal_padding = 16
local vertical_padding = 8
config.window_padding = {
  left = horizontal_padding,
  right = horizontal_padding,
  top = vertical_padding,
  bottom = vertical_padding,
}

-- Width & height
config.initial_cols = 140
config.initial_rows = 35

-- Set title buttons position
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_style = "Windows"
config.integrated_title_buttons = { 'Close', 'Hide', 'Maximize'}
config.integrated_title_button_alignment = "Left"

-- For macOS: Option-Left/Right

config.keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    { key = 'LeftArrow', mods = 'OPT', action = wezterm.action.SendString '\x1bb' },
    -- Make Option-Right equivalent to Alt-f; forward-word
    { key = 'RightArrow', mods = 'OPT', action = wezterm.action.SendString '\x1bf' },
}

-- Show scroll bar
config.enable_scroll_bar = true

-- Show confirm dialog when exiting 
config.window_close_confirmation = 'AlwaysPrompt'

-- and finally, return the configuration to wezterm
return config
