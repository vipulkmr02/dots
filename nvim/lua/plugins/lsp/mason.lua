return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'angularls',
          'lua_ls',
          'html',
          'cssls',
          'somesass_ls',
          'jsonls',
          'emmet_ls',
          'bashls',
          'pyright',
          'typos_lsp'
        },
        automatic_installed = true,
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        }
      })
    end
  }
}
