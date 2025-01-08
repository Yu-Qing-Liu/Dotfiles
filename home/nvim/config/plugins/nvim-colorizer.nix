{ pkgs, ... }:
{
home.file.".config/nvim/lua/plugins/nvim-colorizer.lua".text = ''
-- Colors
return {
  'norcalli/nvim-colorizer.lua',
  config = function(_)
    require('colorizer').setup()
  end
}
'';
}
