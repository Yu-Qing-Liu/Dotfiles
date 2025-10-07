{ pkgs, ... }: {
  
  imports = [
    ./nvim
    ./hypr
    ./rofi
    ./waybar
    ./alacritty
    ./zsh
    ./vivid
    ./ranger
    ./nixpkgs
  ];

  home = {
    username = "admin";
    homeDirectory = "/home/admin";
  };

  home.packages = (with pkgs; [
    # Firmware
    alsa-lib
    sof-firmware
    hplip
    # Commands
    file
    nmap
    nix-prefetch-github
    sshpass
    unrar
    util-linux
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
    openssl
    doxygen
    psmisc
    minicom
    # Applications
    zenmap
    android-studio
    android-tools
    unityhub
    blender
    google-chrome
    imv
    gparted
    zsh
    alacritty
    ranger
    git
    wl-clipboard
    pavucontrol
    prismlauncher
    rofi
    wtype
    obs-studio
    vlc
    libreoffice-qt6
    impala
    # Hypr
    hyprlock
    hyprpaper
    hyprshot
    # Fonts
    noto-fonts
    nerd-fonts.noto
    font-awesome
    # Neovim dependencies
    lua51Packages.luarocks
    lua51Packages.lua-lsp
    lua51Packages.lua
    nodejs_24
    ripgrep
    fd
    zathura
    texliveFull
    tree-sitter
    stdenv.cc
    gnumake
    cargo
  ]);

  fonts = {
    fontconfig= {
      enable = true;
    };
  };
  
  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
