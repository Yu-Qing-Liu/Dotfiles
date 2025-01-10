{ pkgs, ... }:

{
  programs.neovim = {
    extraLuaConfig = builtins.readFile ../../dev/nvim/init.lua;
  };
}
