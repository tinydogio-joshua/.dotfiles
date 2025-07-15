vim.cmd("set path+=**")
vim.g.netrw_list_hide = ".*.swp$,.DS_Store,node_modules/*,*/tmp/*,*.so,*.swp,*.zip,*.git,^..=/=$"
vim.o.wildignore = ".*.swp$,.DS_Store,*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip,*.git,^..=/=$"

vim.g.mapleader = vim.keycode("<space>")
vim.g.maplocalleader = vim.keycode("<cr>")

vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.confirm = true
vim.o.updatetime = 200
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.shiftround = true
vim.o.shiftwidth = 0
vim.o.tabstop = 4
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.inccommand = "split"
vim.o.scrolloff = 10
vim.o.hlsearch = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.cursorline = true
vim.o.wrap = false
vim.o.mouse = "a"

vim.g.netrw_banner = 0

-- Window Movements
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", {})
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", {})
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", {})
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", {})

-- Clear Search Highlight
vim.keymap.set("n", "<leader><Esc>", ":nohlsearch<CR>")

-- System Copy and Paste
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')

-- LSP Setup
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		-- enable completion when available
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
-- see `:h completeopt`
vim.opt.completeopt = "menuone,noselect,popup"
