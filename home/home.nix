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
    blender
    imv
    gparted
    zsh
    firefox
    alacritty
    ranger
    git
    wl-clipboard
    pavucontrol
    prismlauncher
    rofi-wayland
    wtype
    obs-studio
    vlc
    libreoffice-qt6
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
    nodejs_23
    ripgrep
    fd
    zathura
    texliveFull
    tree-sitter
    # Programming
    protobuf
    # Web
    yarn
    # Rust
    rustup
    # Python
    python312Packages.python
    python312Packages.pip
    # c / c++
    gcc
    libgcc
    gnumake
    cmake
    extra-cmake-modules
  ]);

  fonts = {
    fontconfig= {
      enable = true;
    };
  };
  
  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
