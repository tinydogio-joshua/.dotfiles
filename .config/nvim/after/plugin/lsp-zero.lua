local vscode = vim.g.vscode == 1

if not vscode then
  vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

  local lsp = require('lsp-zero')
  lsp.preset('recommended')

  lsp.ensure_installed({
    'tsserver',
    'eslint',
  })

  lsp.nvim_workspace()

  lsp.setup()
end
