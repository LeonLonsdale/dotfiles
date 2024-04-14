local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font('MonoLisa')

config.font_size = 13.5
config.line_height = 1.3

config.window_padding = {
  left = 20,
  right = 20,
  top = 20,
  bottom = 20,
}
config.native_macos_fullscreen_mode = true
config.enable_scroll_bar = false
-- config.color_scheme = 'Dark+'
-- config.color_scheme = 'Ayu Mirage'
config.color_scheme = 'Catppuccin Mocha'
config.window_background_opacity = 1.0

return config
