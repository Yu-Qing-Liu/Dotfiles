{ pkgs, ... }:
{
home.file.".config/nvim/lua/plugins/git-blame.lua".text = ''
-- Git Blame
return {
  -- https://github.com/f-person/git-blame.nvim
  'f-person/git-blame.nvim',
  event = 'VeryLazy',
  opts = {
    enabled = true,
    date_format = '%m/%d/%y %H:%M:%S', -- more concise date format
  }
}
'';
}
