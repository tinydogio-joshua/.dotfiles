require("tinydogio-joshua/packer")
require("tinydogio-joshua/set")
require("tinydogio-joshua/remap")
require("tinydogio-joshua/plugin")

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]

