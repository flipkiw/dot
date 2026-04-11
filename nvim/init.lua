vim.g.mapleader = " "
vim.g.maplocalleader = " "

--------------- PLUGINS ---------------

vim.pack.add({
	-- colorscheme
	{ src = "https://github.com/folke/tokyonight.nvim" },

	-- utils
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/tpope/vim-sleuth" },

	-- lsp, treesitter & blink.cmp
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("*") },
})

--------------- PLUGINS CONFIG ---------------

-- colorscheme
vim.cmd.colorscheme("tokyonight-moon")

-- fzf
require("fzf-lua").setup({
	winopts = { height = 1, width = 1 },
	keymap = {
		builtin = { ["<C-d>"] = "preview-half-page-down", ["<C-u>"] = "preview-half-page-up" },
		fzf = { ["ctrl-d"] = "preview-half-page-down", ["ctrl-u"] = "preview-half-page-up" },
	},
})

-- conform
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd", "prettier", top_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
	},
})

-- treesitter
require("nvim-treesitter").install({ "javascript", "tsx" })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "javascriptreact" },
	callback = function()
		vim.treesitter.start()
	end,
})

-- blink.cmp
require("blink.cmp").setup({
	keymap = {
		preset = "enter",
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
	},
	completion = { documentation = { auto_show = true } },
	fuzzy = { implementation = "prefer_rust_with_warning" },
	cmdline = { completion = { menu = { auto_show = true } } },
})

-- lsp
vim.diagnostic.config({ virtual_text = true })
vim.lsp.enable("cssls")
vim.lsp.enable("html")
vim.lsp.enable("ts_ls")

--------------- KEYS ---------------

-- fzf
vim.keymap.set("n", "<leader>p", ":FzfLua files<CR>", { silent = true })
vim.keymap.set("n", "<leader>f", ":FzfLua live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>g", ":FzfLua git_status<CR>", { silent = true })
vim.keymap.set("n", "<leader>h", ":FzfLua git_bcommits<CR>", { silent = true })

-- conform
vim.keymap.set("n", "<leader>i", "<cmd>lua require('conform').format()<CR>", { silent = true })

-- lsp
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "K", vim.diagnostic.open_float)

-- netrw
vim.keymap.set("n", "-", ":Ex<CR>", { silent = true })

--------------- SETS ---------------

vim.o.backup = false
vim.o.clipboard = "unnamedplus"
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.laststatus = 3
vim.o.mouse = ""
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "number"
vim.o.smartcase = true
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.updatetime = 50
vim.o.wrap = false
vim.g.netrw_banner = false
