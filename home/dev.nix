{ pkgs, ...}: {
  
  imports = [
    ./nvim
    ./programs/ranger
    ./programs/zsh
  ];

  home = {
    username = "admin";
    homeDirectory = "/home/admin";
  };

  home.packages = (with pkgs; [
    # Applications
    zsh
    ranger
    wl-clipboard
    # Fonts
    nerd-fonts.noto
    # Neovim dependencies
    lua51Packages.luarocks
    lua51Packages.lua
    nodejs_23
    ripgrep
    fd
    tree-sitter
  ]);

  fonts = {
    fontconfig= {
      enable = true;
    };
  };
  
  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
