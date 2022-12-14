local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fj', builtin.buffers, {})
vim.keymap.set('n', '<leader>fk', builtin.find_files, {})
vim.keymap.set('n', '<leader>fl', builtin.git_files, {})
vim.keymap.set('n', '<leader>f;', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "node_modules/",
      "target/"
    }
  }
}
