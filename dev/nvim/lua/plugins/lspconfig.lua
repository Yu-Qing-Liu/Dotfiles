-- LSP Support
return {
  -- LSP Configuration
  -- https://github.com/neovim/nvim-lspconfig
  'neovim/nvim-lspconfig',
  dependencies = {
    -- LSP Management
    -- https://github.com/williamboman/mason.nvim
    { 'williamboman/mason.nvim' },
    -- https://github.com/williamboman/mason-lspconfig.nvim
    { 'williamboman/mason-lspconfig.nvim' },

    -- Auto-Install LSPs, linters, formatters, debuggers
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },

    -- Useful status updates for LSP
    -- https://github.com/j-hui/fidget.nvim
    { 'j-hui/fidget.nvim',                        opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    -- https://github.com/folke/neodev.nvim
    { 'folke/neodev.nvim' },

    { 'hrsh7th/cmp-nvim-lsp'}
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      -- Install these LSPs automatically
      ensure_installed = {}
    })

    require('mason-tool-installer').setup({
      -- Install these linters, formatters, debuggers automatically
      ensure_installed = {},
    })

    -- There is an issue with mason-tools-installer running with VeryLazy, since it triggers on VimEnter which has already occurred prior to this plugin loading so we need to call install explicitly
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
    vim.api.nvim_command('MasonToolsInstall')

    local lspconfig = require('lspconfig')
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities()

    local lsp_attach = function(client, bufnr)
      -- Create your keybindings here...
    end

    -- Call setup on each LSP server
    require('mason-lspconfig').setup_handlers({
      function(server_name)
        -- Don't call setup for JDTLS Java LSP because it will be setup from a separate config
        if server_name ~= 'jdtls' then
          lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
          })
        end
      end
    })

    -- Lua LSP settings
    lspconfig.lua_ls.setup {
      on_attach = lsp_attach,
      capabilities = capabilities,
      cmd = {
        "lua-lsp"
      },
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
        },
      },
    }

    -- C++ LSP Settings
    lspconfig.clangd.setup {
      on_attach = lsp_attach,
      capabilities = {
        offsetEncoding = { "utf-16" },
      },
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
      },
      init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
      },
    }

    -- GLSL LSP Settings
    lspconfig.glsl_analyzer.setup {
      on_attach = lsp_attach,
      capabilities = capabilities,
      filetypes = {"vert", "tesc", ".tese", ".geom", ".frag", ".comp"}
    }

    -- Rust LSP Settings
    lspconfig.rust_analyzer.setup {
      on_attach = lsp_attach,
      capabilities = capabilities,
      cmd = {
        "rust-analyzer",
      }
    }

    -- Dart LSP settings
    lspconfig.dartls.setup {
      on_attach = lsp_attach,
      capabilities = capabilities,
      cmd = { "dart", 'language-server', '--protocol=lsp' },
    }

    -- Python LSP settings
    lspconfig.pylsp.setup {
      on_attach = lsp_attach,
      capabilities = capabilities,
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              maxLineLength = 180,
              ignore = { "E501" },
            },
            mccabe = { enabled = false },
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
