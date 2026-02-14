{ pkgs, ... }:

{
  programs.neovim = {
    initLua = builtins.readFile ../../dev/nvim/init.lua;
  };
}
