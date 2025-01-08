{ config, pkgs, ... }:
{
    home.file.".config/hypr/hyprpaper.conf".text = ''
preload = ~/.config/hypr/Background.png
wallpaper = , ~/.config/hypr/Background.png
    '';
}
