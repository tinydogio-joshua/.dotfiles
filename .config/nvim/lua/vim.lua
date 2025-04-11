vim.g.netrw_list_hide = ".*.swp$,.DS_Store,node_modules/*,*/tmp/*,*.so,*.swp,*.zip,*.git,^..=/=$"
vim.o.wildignore = ".*.swp$,.DS_Store,*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip,*.git,^..=/=$"

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.inccommand = "split"
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.cursorline = true
vim.opt.wrap = false

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", {})
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", {})
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", {})
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", {})

vim.keymap.set("n", "<leader><Esc>", ":nohlsearch<CR>")

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
