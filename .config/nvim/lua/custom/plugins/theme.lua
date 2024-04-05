return {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    require('rose-pine').setup {
      dark_variant = 'moon',
      disable_background = true,
      variant = 'dawn',
    }
    vim.cmd.colorscheme 'rose-pine'
  end,
}
