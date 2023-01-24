local vscode = vim.g.vscode == 1

if not vscode then
  local builtin = require('telescope.builtin')

  vim.keymap.set('n', '<leader>fj', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fk', builtin.find_files, {})
  vim.keymap.set('n', '<leader>fl', builtin.git_files, {})
  vim.keymap.set('n', '<leader>f;', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
  end)
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

  require('telescope').setup{
    defaults = {
      file_ignore_patterns = {
        "node_modules/",
        "target/"
      }
    }
  }
end
