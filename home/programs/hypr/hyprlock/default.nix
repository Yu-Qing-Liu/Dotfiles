{ config, pkgs, ... }:
{
    home.file.".config/hypr/hyprlock.conf".text = ''
$accent = $mauve
$accentAlpha = $mauveAlpha
$font = JetBrainsMono Nerd Font

# GENERAL
general {
  disable_loading_bar = true
  hide_cursor = true
}

# BACKGROUND
background {
  monitor =
  path = $HOME/.config/hypr/Background.png
  blur_passes = 4
  color = $base
}


# Date
label {
  monitor =
  text = cmd[update:1000] echo "  $(date +"%A, %B %d")"
  text_align = center
  color = rgba(209, 179, 255, 1.0)
  font_size = 50
  font_family = JetBrains Mono
  rotate = 0 # degrees, counter-clockwise
  position = 0, 200
  halign = center
  valign = center
}

# Time
label {
  monitor =
  text = cmd[update:1000] echo "  $(date +%I:%M:%S) $(date +%p)"
  text_align = center
  color = rgba(204, 153, 255, 1.0)
  font_size = 30
  font_family = JetBrains Mono Extrabold
  rotate = 0 # degrees, counter-clockwise

  position = 0, 100
  halign = center
  valign = center
}

# USER AVATAR
image {
  monitor =
  path = $HOME/.config/hypr/nix.png
  size = 150
  border_color = $accent
  position = 0, -40
  halign = center
  valign = center
}

# INPUT FIELD
input-field {
    monitor =
    size = 500, 60
    outline_thickness = 2
    dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
    dots_spacing = 0.35 # Scale of dots' absolute size, 0.0 - 1.0
    dots_center = true
    outer_color = rgba(0, 0, 0, 0)
    inner_color = rgba(0, 0, 0, 0.2)
    font_color = rgb(150, 150, 150)
    fade_on_empty = false
    rounding = -1
    check_color = rgb(204, 136, 34)
    placeholder_text = <i><span foreground="##cdd6f4">Input Password...</span></i>
    hide_input = false
    position = 0, -200
    halign = center
    valign = center
}
    '';
}
