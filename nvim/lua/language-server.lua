local nvim_lsp = require('lspconfig');
local lsp_zero = require('lsp-zero')
lsp_zero.set_sign_icons({ error = '', warn = '', hint = '', info = '' })

-- INFO: This function became unusable
-- so I am ditching it

-- local function lspToggleDiagnostics()
--   if DiagnosticsEnabled then
--     vim.diagnostic.config({
--       virtual_text = true,
--     })
--     DiagnosticsEnabled = false
--   else
--     vim.diagnostic.config({
--       virtual_text = false,
--       signs = false,
--       update_on_insert = true
--     })
--     DiagnosticsEnabled = true
--   end
-- end

-- vim.api.nvim_create_user_command("LspToggleDiagnostics", lspToggleDiagnostics, { nargs = 0 })

require('lspconfig').pylsp.setup({
  settings = {
    pylsp = {
      pyflakes = { enabled = true },
      pycodestyle = { enabled = true, ignore = { "E501" }, maxLineLength = 88 },
      mccabe = { enabled = false },
      autopep8 = { enabled = false },
      jedi_symbols = { enabled = true, all_scopes = true },
      mypy = { enabled = true }
    }
  }
})

require('lspconfig').html.setup({
  settings = {
    html = {
      format = {
        wrapLineLength = 80,
        wrapAttributes = "force",
      },
      linkedEditing = true
    }
  }
})

nvim_lsp.denols.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}

nvim_lsp.ts_ls.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false
}

