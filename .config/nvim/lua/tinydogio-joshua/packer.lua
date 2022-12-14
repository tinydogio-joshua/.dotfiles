vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Theme: Catppuccin
  use 'catppuccin/nvim'

  -- Theme: Tokyo Night
  use 'folke/tokyonight.nvim'
end)

