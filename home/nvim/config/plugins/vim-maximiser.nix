{ pkgs, ... }:
{
home.file.".config/nvim/lua/plugins/vim-maximiser.lua".text = ''
-- Maximize and Restore Current Window
return {
  -- https://github.com/szw/vim-maximizer
  'szw/vim-maximizer',
  event = 'VeryLazy',
}
'';
}
