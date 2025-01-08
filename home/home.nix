{ pkgs, ...}: {
  
  imports = [
    ./programs
    ./nvim
  ];

  home = {
    username = "admin";
    homeDirectory = "/home/admin";
  };

  home.packages = (with pkgs; [
    # Firmware
    alsa-lib
    sof-firmware
    # Commands
    neofetch
    tree
    wget
    curl
    vivid
    highlight
    # Applications
    zsh
    firefox
    alacritty
    ranger
    git
    wl-clipboard
    pavucontrol
    rustup
    rofi-wayland
    # Hypr
    hyprlock
    hyprpaper
    # Fonts
    noto-fonts
    nerd-fonts.noto
    font-awesome
    # Programming languages
    python313
    gcc
  ]);

  fonts = {
    fontconfig= {
      enable = true;
    };
  };

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
