{ config, pkgs, ... }:
{
    home.file.".config/vivid/themes/kanagawa.yml".text = ''
colors:
  bg:         "87af00"
  bg0:        "87af5f"
  bg1:        "1e2c35"
  bg2:        "1c2c36"
  bg3:        "444444"
  bg4:        "d75faf"

  fg:         "076678"
  fg0:        "458588"
  fg1:        "83a598"
  fg2:        "427b58"
  fg3:        "689d6a"
  fg4:        "8ec07c"

  red:        "DCD7BA"
  green:      "C34043"
  yellow:     "76946A"
  blue:       "C0A36E"
  purple:     "7E9CD8"
  aqua:       "957FB8"
  orange:     "6A9589"
  gray:       "C8C093"

  alt_red:    "727169"
  alt_green:  "E82424"
  alt_yellow: "98BB6C"
  alt_blue:   "E6C384"
  alt_purple: "7FB4CA"
  alt_aqua:   "938AA9"
  alt_orange: "7AA89F"
  alt_gray:   "FFA500"

core:
  normal_text:
    foreground: fg

  regular_file:
    foreground: fg

  reset_to_normal: {}

  directory:
    foreground: alt_gray
    font-style: bold

  symlink:
    foreground: alt_blue
    font-style: italic

  multi_hard_link:
    font-style: bold

  fifo:
    foreground: purple

  socket:
    foreground: purple
    font-style: bold

  door:
    foreground: alt_purple
    font-style: bold

  block_device:
    foreground: yellow
    font-style: bold

  character_device:
    foreground: alt_yellow
    font-style: italic

  broken_symlink:
    foreground: alt_red
    font-style: italic

  missing_symlink_target:
    foreground: fg

  setuid:
    foreground: fg

  setgid:
    foreground: bg

  file_with_capability:
    foreground: bg

  sticky_other_writable:
    foreground: fg
    font-style: italic

  other_writable:
    foreground: alt_gray
    font-style: bold

  sticky:
    foreground: fg

  executable_file:
    foreground: fg4
    font-style: bold

text:
  special:
    foreground: f3d284

  todo:
    foreground: alt_green

  licenses:
    foreground: fg1
    font-style: italic

  configuration:
    foreground: bg4

  other:
    foreground: fg

markup:
  foreground: yellow

programming:
  source:
    foreground: aqua

  tooling:
    foreground: alt_green
    font-style: italic

    continuous-integration:
      foreground: alt_blue

media:
  foreground: purple

  video:
    foreground: alt_purple
    font-style: bold

office:
  foreground: alt_blue
  font-style: bold

archives:
  foreground: cca95d
  font-style: bold

  images:
    foreground: bg0
    font-style: bold

executable:
  foreground: fg4
  font-style: bold

unimportant:
  foreground: bg3
  font-style: italic
    '';
}
