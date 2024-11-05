local wezterm = require("wezterm")
local session_manager = require("wezterm-session-manager/session-manager")

wezterm.on("save_session", function(window)
	session_manager.save_state(window)
end)
wezterm.on("load_session", function(window)
	session_manager.load_state(window)
end)
wezterm.on("restore_session", function(window)
	session_manager.restore_state(window)
end)
local config = wezterm.config_builder()
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.color_scheme = 'Gruvbox Dark (Gogh)'
config.font_size = 16
config.default_prog = { "/bin/zsh" }
config.window_decorations = "RESIZE"
config.keys = {
	{ key = "S", mods = "CTRL", action = wezterm.action({ EmitEvent = "save_session" }) },
	{ key = "L", mods = "CTRL", action = wezterm.action({ EmitEvent = "load_session" }) },
	{ key = "R", mods = "CTRL", action = wezterm.action({ EmitEvent = "restore_session" }) },
}
return config
