-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "nightfox"

config.macos_window_background_blur = 30

config.enable_scroll_bar = true

config.animation_fps = 60
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

config.font_size = 16
config.line_height = 1.2
config.font = wezterm.font({
	-- family = "CommitMono Nerd Font",
	family = "UDEV Gothic 35NFLG",
	weight = "Bold",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})

config.enable_tab_bar = false

-- and finally, return the configuration to wezterm
return config
