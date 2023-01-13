local vscode = vim.g.vscode == 1

if not vscode then
  vim.opt.background = "dark"
  vim.cmd("colorscheme everforest")
end
