{ pkgs, ...}: {
  
  imports = [
    ./nvim
    ./hypr
    ./rofi
    ./waybar
    ./alacritty
    ./zsh
    ./vivid
    ./ranger
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
    lazygit
    neofetch
    tree
    wget
    curl
    vivid
    highlight
    less
    zip
    unzip
    xorg.xhost
    arch-install-scripts
    qemu
    openssl
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
    obs-studio
    vlc
    # Hypr
    hyprlock
    hyprpaper
    # Fonts
    noto-fonts
    nerd-fonts.noto
    font-awesome
    # Neovim dependencies
    lua51Packages.luarocks
    lua51Packages.lua-lsp
    lua51Packages.lua
    nodejs_23
    ripgrep
    fd
    zathura
    texliveFull
    tree-sitter
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
