local vscode = vim.g.vscode == 1

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}
  use {'tpope/vim-surround'}
  use {'ThePrimeagen/vim-be-good', disable = vscode}
  -- use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }, disable = vscode}
  use {'xiyaowong/nvim-transparent', disable = vscode}
  use {'catppuccin/nvim', as = 'catppuccin', disable = vscode}
end)

