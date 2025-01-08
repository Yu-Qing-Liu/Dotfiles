{ config, pkgs, ... }:
{
home.file.".config/alacritty/alacritty.toml".text = ''
[colors.primary]
background = '#1f0033'
foreground = '#c3e600'

[colors.normal]
black   = '#ffcc66'
red     = '#c34043'
green   = '#76946a'
yellow  = '#ffcc00'
blue    = '#7e9cd8'
magenta = '#957fb8'
cyan    = '#6a9589'
white   = '#c8c093'

[colors.bright]
black   = '#727169'
red     = '#e82424'
green   = '#98bb6c'
yellow  = '#e6c384'
blue    = '#7fb4ca'
magenta = '#938aa9'
cyan    = '#7aa89f'
white   = '#dcd7ba'

[colors.selection]
background = '#2d4f67'
foreground = '#c8c093'

[[colors.indexed_colors]]
index = 16
color = '#ffa066'

[[colors.indexed_colors]]
index = 17
color = '#ff5d62'

[window]
opacity = 0.75
blur = true

[font]
size = 20

[keyboard]
bindings = [
    { key = "Enter", mods = "Alt", action = "CreateNewWindow" },
]
    '';
}
