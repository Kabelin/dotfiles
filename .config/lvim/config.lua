-- vim options
local opt = vim.o
opt.relativenumber = true
opt.shiftwidth = 2
opt.tabstop = 2
-- opt.shell = "/bin/sh" -- https://github.com/fish-shell/fish-shell/issues/7004

-- general
lvim.log.level = "info"
lvim.colorscheme = "catppuccin-mocha"

lvim.format_on_save = {
	enabled = true,
	pattern = "*.lua",
	timeout = 1000,
}

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
local normal_mode = lvim.keys.normal_mode
local visual_mode = lvim.keys.visual_mode

-- split windows
normal_mode["<C-s>"] = "<C-w>s"
normal_mode["<C-v>"] = "<C-w>v"
-- navigate between tabs
normal_mode["<A-l>"] = ":BufferLineCycleNext<CR>"
normal_mode["<A-h>"] = ":BufferLineCyclePrev<CR>"
normal_mode[";"] = ":"
normal_mode["n"] = "nzzzv"
normal_mode["N"] = "Nzzzv"
-- replace all occurrences of word under cursor
normal_mode["<S-s>"] = ":%s/\\<<C-r><C-w>\\>//g<left><left>"
-- better line navigation
normal_mode["H"] = "^"
normal_mode["L"] = "$"
visual_mode["H"] = "^"
visual_mode["L"] = "$"
-- scroll with centralize
normal_mode["<C-d>"] = "<C-d>zz"
normal_mode["<C-u>"] = "<C-u>zz"
normal_mode["<S-x>"] = ":BufferKill<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

local builtin = lvim.builtin
builtin.alpha.active = true
builtin.alpha.mode = "dashboard"
builtin.terminal.active = true
builtin.nvimtree.setup.view.side = "left"
builtin.nvimtree.setup.renderer.icons.show.git = true
builtin.lualine.style = "default"

-- Change Telescope navigation to use j and k for navigation in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
builtin.telescope.defaults.mappings = {
	-- for input mode
	i = {
		["<C-j>"] = {
			actions.move_selection_next,
			type = "action",
			opts = { nowait = true, silent = true },
		},
		["<C-k>"] = {
			actions.move_selection_previous,
			type = "action",
			opts = { nowait = true, silent = true },
		},
	},
	-- for normal mode
	n = {
		["<C-j>"] = {
			actions.move_selection_next,
			type = "action",
			opts = { nowait = true, silent = true },
		},
		["<C-k>"] = {
			actions.move_selection_previous,
			type = "action",
			opts = { nowait = true, silent = true },
		},
	},
}

-- Automatically install missing parsers when entering buffer
builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"yaml",
	"markdown",
	"sql",
}

builtin.treesitter.highlight.enable = true

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters, formatters and code actions <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ name = "stylua", filetypes = { "lua" } },
	{
		name = "deno_fmt",
		filetypes = { "javascript", "javascriptreact", "json", "jsonc", "markdown", "typescript", "typescriptreact" },
	},
	{
		name = "prettierd",
		filetypes = { "vue", "css", "scss", "less", "html", "yaml", "markdown.mdx", "graphql", "handlebars" },
	},
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ name = "luacheck", filetypes = { "lua" }, extra_args = { "--globals", "vim", "lvim" } },
	{
		command = "shellcheck",
		filetypes = { "sh" },
		args = { "--severity", "warning", "--format", "json1", "--source-path=$DIRNAME", "--external-sources", "-" },
	},
})
local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
	{
		command = "shellcheck",
		filetypes = { "sh" },
		args = { "--format", "json1", "--source-path=$DIRNAME", "--external-sources", "-" },
	},
})

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{ "catppuccin/nvim", name = "catppuccin" },
	{
		"sindrets/diffview.nvim",
		event = "BufRead",
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- close quickfix menu after selecting option
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf" },
	command = "nnoremap <buffer> <CR> <CR>:cclose<CR>",
})
