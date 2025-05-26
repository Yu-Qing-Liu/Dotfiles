local opt = vim.opt

-- Session Management
opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Line Numbers
opt.number = true
opt.relativenumber = true
opt.statuscolumn = "%s %=%{v:lnum} %=%{printf('%2d', v:relnum)}  "

-- Filetypes
vim.filetype.add({
  extension = {
    vert = 'glsl',  -- Vertex shader
    tesc = 'glsl',  -- Tessellation Control shader
    tese = 'glsl',  -- Tessellation Evaluation shader
    geom = 'glsl',  -- Geometry shader
    frag = 'glsl',  -- Fragment shader
    comp = 'glsl',  -- Compute shader
  },
})

-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 4
vim.cmd([[
  augroup FiletypeSettings
    autocmd!
    autocmd FileType dart,lua,html,xml,launch,javascript,typescript,react,nix,text,cmake,sql setlocal tabstop=2 shiftwidth=2 softtabstop=2
  augroup END
]])

-- Cursor Line
opt.cursorline = true

-- Line Wrapping
opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
vim.diagnostic.config {
  float = { border = "rounded" }, -- add border to diagnostic popups
}

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Consider - as part of keyword
opt.iskeyword:append("-")

-- Mouse Settings
opt.mouse = ""

-- VimTex
vim.g.vimtex_quickfix_open_on_warning = 0
