{ pkgs, ... }:
{
home.file.".config/nvim/lua/plugins/indent-blankline.lua".text = ''
-- Indentation guides
return {
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  "lukas-reineke/indent-blankline.nvim",
  event = 'VeryLazy',
  main = "ibl",
  opts = {
    enabled = true,
    indent = {
      char = '|',
    },
  },
}
'';
}
