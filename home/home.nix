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
    efibootmgr
    # Commands
    neofetch
    tree
    wget
    curl
    vivid
    highlight
    less
    zip
    unzip
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
    wtype
    # Hypr
    hyprlock
    hyprpaper
    # Fonts
    noto-fonts
    nerd-fonts.noto
    font-awesome
    # Neovim dependencies
    lua51Packages.luarocks
    lua51Packages.lua
    nodejs_23
    ripgrep
    fd
    zathura
    texliveFull
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
