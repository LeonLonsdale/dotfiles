local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font('Cartograph CF', { weight = 'Medium' })
config.font_size = 16.0
config.line_height = 1.2

config.window_padding = {
  left = 20,
  right = 20,
  top = 20,
  bottom = 20,
}
config.enable_scroll_bar = false
config.color_scheme = 'Catppuccin Mocha'

config.window_background_opacity = 1.0

return config
