{ pkgs, ... }:
{
home.file.".config/nvim/lua/plugins/lspconfig.lua".text = ''
-- LSP Support
return {
  -- LSP Configuration
  -- https://github.com/neovim/nvim-lspconfig
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Useful status updates for LSP
    -- https://github.com/j-hui/fidget.nvim
    { 'j-hui/fidget.nvim',                        opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    -- https://github.com/folke/neodev.nvim
    { 'folke/neodev.nvim' },
  },
  config = function()
    local lspconfig = require('lspconfig')
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_attach = function(client, bufnr)
      -- Create your keybindings here...
    end

    -- Lua LSP settings
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
        },
      },
    }

    -- Dart LSP settings
    lspconfig.dartls.setup {
      capabilities = lsp_capabilities,
      cmd = { "dart", 'language-server', '--protocol=lsp' },
    }

    -- C++ LSP settings
    local clangd_path = vim.fn.system('which clangd'):gsub("\n", "")
    lspconfig.clangd.setup {
      cmd = { clangd_path }
    }

    -- Python LSP settings
    lspconfig.pylsp.setup {
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              maxLineLength = 140,
              ignore = { "E501" },
            },
          },
        },
      },
    }

    -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
    local open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded" -- Set border to rounded
      return open_floating_preview(contents, syntax, opts, ...)
    end
  end
}
'';
}
