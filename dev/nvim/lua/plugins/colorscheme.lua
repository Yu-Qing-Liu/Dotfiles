return {
  'sainnhe/gruvbox-material', -- You can replace this with your favorite colorscheme
  lazy = false,								-- We want the colorscheme to load immediately when starting Neovim
  priority = 1000,						-- Load the colorscheme before other non-lazy-loaded plugins
  config = function(_)
		vim.o.termguicolors = true
    vim.g.gruvbox_material_better_performance = 1
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_transparent_background = 1
    vim.cmd("colorscheme gruvbox-material")
    local cursorline_bg = vim.api.nvim_get_hl(0, { name = "CursorLine" }).bg
    vim.api.nvim_set_hl(0, 'CursorLineNr', {
      fg = '#fe8019',  -- Gruvbox orange color
      bg = cursorline_bg,
      bold = true
    })
  end
}
