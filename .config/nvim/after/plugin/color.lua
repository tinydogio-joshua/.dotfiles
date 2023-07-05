local vscode = vim.g.vscode == 1

if not vscode then
  require('github-theme').setup({
  })

  vim.cmd('colorscheme github_dark_dimmed')
end
