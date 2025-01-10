-- Terminals
return {
  -- https://github.com/akinsho/toggleterm.nvim
  'akinsho/toggleterm.nvim',
  opts = {

  },
  config = function(_, opts)
    require('toggleterm').setup(opts)
  end
}
