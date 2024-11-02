import os
import subprocess
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Rule, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from keymaps import keymaps

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/autostart.sh')
    subprocess.call(home)

## Settings ##
keymaps_settings = {
    "modifier_key":"mod1",
    "terminal":"kitty",
    "file_manager":"nautilus",
    "web_browser":"vivaldi",
}

keys = keymaps(keymaps_settings)

## Workspace ##

groups = [
    Group("1", label="TERM"),
    Group("2", label="WEB", matches=[Match(wm_class="vivaldi-stable")],layout="max"),
    Group("3", label="NOTE", matches=[Match(wm_class="rnote")]),
    Group("4"),
    Group("5"),
    Group("6"),
    Group("7"),
    Group("8", label="PASS", matches=[Match(wm_class="keepassxc")], layout="max"),
    Group("9", label="VOl", matches=[Match(wm_class="easyeffects")]),
]

for i in groups:
    keys.extend(
        [
            Key([keymaps_settings["modifier_key"]],i.name,lazy.group[i.name].toscreen(),desc=f"Switch to group {i.name}",),
            Key([keymaps_settings["modifier_key"], "shift" ],i.name,lazy.window.togroup(i.name, switch_group=False),desc=f"Switch to & move focused window to group {i.name}",),
        ]
    )

layouts = [
    layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    layout.Max(),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox("default config", name="default"),
                widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                widget.QuickExit(),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # x11_drag_polling_rate = 60,
    ),
]

# Drag floating layouts.
mouse = [
    Drag([keymaps_settings["modifier_key"]], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([keymaps_settings["modifier_key"]], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([keymaps_settings["modifier_key"]], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24
wmname = "LG3D"
