local vscode = vim.g.vscode == 1

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}

  -- Surround
  use {'tpope/vim-surround'}

  -- Vim Be Good
  use {'ThePrimeagen/vim-be-good', disable = vscode}

  -- Theme: Catppuccin
  use {'catppuccin/nvim', disable = vscode}

  -- Theme: Tokyo Night
  use {'folke/tokyonight.nvim', disable = vscode}
end)

