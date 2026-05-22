vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ========================================================================== --
-- ==                            GENERAL SETTINGS                          == --
-- ========================================================================== --
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- ========================================================================== --
-- ==                             BASIC KEYMAPS                            == --
-- ========================================================================== --
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- ========================================================================== --
-- ==                                AUTOCMDS                              == --
-- ========================================================================== --
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Auto-start Neovim native treesitter highlighting",
  group = vim.api.nvim_create_augroup("treesitter-auto-start", { clear = true }),
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

-- ========================================================================== --
-- ==             PLUGINS (Neovim 0.12 Native Package Management)          == --
-- ========================================================================== --
vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/xiyaowong/transparent.nvim" },
  { src = "https://github.com/saghen/blink.lib" },
  { src = "https://github.com/Saghen/blink.cmp" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

-- ========================================================================== --
-- ==                         PLUGIN CONFIGURATION                         == --
-- ========================================================================== --

-- 1. Blink.cmp Setup (Autocomplete)
local has_blink, blink = pcall(require, "blink.cmp")
if has_blink then
  blink.setup({
    keymap = { preset = "enter" },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    completion = {
      ghost_text = { enabled = false },
      menu = { border = "rounded", scrollbar = false },
      documentation = {
        window = {
          border = "rounded",
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDoc,Search:None",
          scrollbar = false,
        },
      },
    },
  })

  -- ======================================================================== --
  -- ==                      CUSTOM AUTOCOMPLETE COLORS                    == --
  -- ======================================================================== --
  -- 1. Mute the harsh white borders by linking them to your theme's Comment color
  vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "Comment" })
  vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { link = "Comment" })

  -- 2. Make the typed letters that match suggestions pop using your accent color
  vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { link = "Special", bold = true })

  -- 3. FIX: Match the menu backgrounds directly to your main editor window
  vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "none" })
  vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "none" })

  -- 4. Make the documentation separator line transparent with white dashes
  vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { bg = "none", fg = "#ffffff" })
end

-- 2. Formatting Engine (Conform.nvim)
local has_conform, conform = pcall(require, "conform")
if has_conform then
  conform.setup({
    formatters_by_ft = {
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettier" },
      css = { "prettier" },
      go = { "lsp" },
      lua = { "lsp" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  })
end

-- 3. Treesitter Setup (Modern Highlighting and Indentation)
local has_ts, ts_configs = pcall(require, "nvim-treesitter.configs")
if has_ts then
  ts_configs.setup({
    ensure_installed = { "html", "css", "javascript", "typescript", "tsx", "lua", "go" },
    -- Highlighting is now handled natively via the FileType autocmd above
    -- highlight = { enable = true },
    indent = { enable = true },
  })
end

-- 4. LSP & Mason Setup
local has_mason, mason = pcall(require, "mason")

if has_mason then
  mason.setup()

  -- Safely fetch default completion capabilities from blink.cmp
  local capabilities = has_blink and blink.get_lsp_capabilities() or {}

  -- Lua Server
  vim.lsp.config.lua_ls = {
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
      },
    },
  }
  vim.lsp.enable("lua_ls")

  -- Go Server
  vim.lsp.config.gopls = { capabilities = capabilities }
  vim.lsp.enable("gopls")

  -- ESLint Server
  vim.lsp.config.eslint = { capabilities = capabilities }
  vim.lsp.enable("eslint")

  -- HTML Server
  vim.lsp.config.html = { capabilities = capabilities }
  vim.lsp.enable("html")

  -- CSS Server
  vim.lsp.config.cssls = { capabilities = capabilities }
  vim.lsp.enable("cssls")

  -- JavaScript & TypeScript Server
  vim.lsp.config.ts_ls = { capabilities = capabilities }
  vim.lsp.enable("ts_ls")
end

-- Modelines
-- vim: ts=2 sts=2 sw=2 et
