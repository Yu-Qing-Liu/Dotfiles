-- Terminals
return {
  -- https://github.com/akinsho/toggleterm.nvim
  'akinsho/toggleterm.nvim',
  opts = {
    open_mapping = [[<c-\>]],
    hide_numbers = false,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)
  end
}
