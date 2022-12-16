local vscode = vim.g.vscode == 1

vim.g.mapleader = " "

if not vscode then
  vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
end

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

