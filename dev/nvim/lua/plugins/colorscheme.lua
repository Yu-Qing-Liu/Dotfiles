return {
  'sainnhe/gruvbox-material', -- You can replace this with your favorite colorscheme
  lazy = false,								-- We want the colorscheme to load immediately when starting Neovim
  priority = 1000,						-- Load the colorscheme before other non-lazy-loaded plugins
  config = function(_)
		vim.o.termguicolors = true
    vim.g.gruvbox_material_better_performance = 1
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_transparent_background = 2
    vim.cmd("colorscheme gruvbox-material")
  end
}
