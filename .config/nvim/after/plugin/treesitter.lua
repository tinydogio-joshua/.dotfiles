require'nvim-treesitter.configs'.setup {
  ensure_installed = { "css", "help", "html", "lua", "javascript", "rust", "typescript" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

