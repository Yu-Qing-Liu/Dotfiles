{ pkgs, ... }:
{
home.file.".config/nvim/lua/plugins/vim-commentary.lua".text = ''
-- Comment/Uncomment Lines of Code
return {
  -- https://github.com/tpope/vim-commentary
  'tpope/vim-commentary',
  event = 'VeryLazy',
}
'';
}
