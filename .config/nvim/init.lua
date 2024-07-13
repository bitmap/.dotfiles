-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- set space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- diasble nerd fonts
vim.g.have_nerd_font = false

-- import vanilla vim settings
vim.cmd([[ source $HOME/.vimrc ]])

-- make things snappier
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 0

-- neovim title
vim.opt.title = true
vim.opt.titlestring = 'nvim %{expand("%:p")}'

-- statusline
vim.opt.laststatus = 2
vim.opt.showmode = false

-- invisible chars
vim.opt.list = true
vim.opt.listchars = { tab = "┆ ", trail = "×" }

-- disable spaces, but be nice to others
vim.opt.expandtab = false
vim.opt.copyindent = true
vim.opt.preserveindent = true
vim.opt.smartindent = true

-- make tabs as wide as two spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- better complete
vim.opt.completeopt = "menuone,noselect"

-- disable annoyances
vim.cmd([[ aunmenu PopUp.How-to\ disable\ mouse ]])
vim.cmd([[ aunmenu PopUp.-1- ]])

-- plugins
local plugins = {
	{
		-- restore previous session from cwd
		"rmagatti/auto-session",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("auto-session").setup({
				auto_save_enabled = true,
				auto_restore_enabled = true,
				auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
			})
		end,
	},
	{
		-- theme
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		-- heuristically set buffer options
		"tpope/vim-sleuth",
	},
	{
		-- :Git command
		"tpope/vim-fugitive",
	},
	{
		-- GitHub integration for fugitive
		"tpope/vim-rhubarb",
	},
	{
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({
				enabled = true,
				message_template = "← <author>, <date> (<sha>)",
				date_format = "%r",
			})
		end,
	},
	{
		-- show git status symbols
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
			})
		end,
	},
	{
		-- handle conflicts
		"akinsho/git-conflict.nvim",
		version = "*",
		config = true,
	},
	{
		-- fancy statusline
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "tokyonight",
					section_separators = "",
					component_separators = "",
				},
				sections = { lualine_c = { require("auto-session.lib").current_session_name } },
			})
		end,
	},
	{
		-- fuzzy finder
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim",                    lazy = true },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-tree/nvim-web-devicons" },
		},
		keys = {
			{ "<C-p>",           ":Telescope commands<cr>",            desc = "Commands" },
			{ "<leader><space>", ":Telescope buffers<cr>",             desc = "Find Buffers" },
			{ "<leader>ff",      ":Telescope find_files<cr>",          desc = "[F]ind [F]iles" },
			{ "<leader>fh",      ":Telescope oldfiles<cr>",            desc = "[F]ind [H]istory" },
			{ "<leader>fg",      ":Telescope live_grep<cr>",           desc = "[F]ind [G]rep" },
			{ "<leader>fk",      ":Telescope keymaps<cr>",             desc = "[Find] [K]eymaps" },
			{ "gd",              ":Telescope lsp_definitions<cr>",     desc = "[G]o to [D]efinition" },
			{ "gr",              ":Telescope lsp_references<cr>",      desc = "[G]o to [R]eferences" },
			{ "gI",              ":Telescope lsp_implementations<cr>", desc = "[G]oto [I]mplementation" },
			{ "<leader>D",       "Telescope lsp_type_definitions<cr>", desc = "Type [D]efinition" },
			{ "<leader>ds",      "Telescope lsp_document_symbols<cr>", desc = "[D]ocument [S]ymbols" },
		},
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = { file_ignore_patterns = { ".git", "node_modules" } },
				pickers = { buffers = { sort_lastused = true } },
			})
			-- load telescope-fzf-native
			telescope.load_extension("fzf")
		end,
	},
	{
		-- syntax parsing
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"python",
					"go",
					"rust",
					"javascript",
					"typescript",
					"html",
					"css",
				},
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
	{
		-- LSP support
		"neovim/nvim-lspconfig",
		dependencies = {
			-- LSP servers manager
			{ "williamboman/mason.nvim",          config = true },
			{ "williamboman/mason-lspconfig.nvim" },
			-- autocomplete
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path" },
			-- notifications
			{ "j-hui/fidget.nvim",                opts = {} },
			-- snippets
			{ "L3MON4D3/LuaSnip" },
		},
		config = function()
			-- setup LSP
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				end,
			})

			-- default capabilities
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- manage installed servers
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"html",
					"cssls",
					"tailwindcss",
					"stylelint_lsp",
					"eslint",
					"marksman",
					"tsserver",
					"clangd",
					"gopls",
					"pyright",
					"rust_analyzer",
					"solang",
					"bashls",
					"jsonls",
					"dockerls",
					"docker_compose_language_service",
				},
				handlers = {
					function(server)
						require("lspconfig")[server].setup({
							capabilities = capabilities,
						})
					end,
				},
			})

			-- autocomplete setup
			local cmp = require("cmp")
			cmp.setup({
				sources = { { name = "nvim_lsp" } },
				mapping = cmp.mapping.preset.insert({
					-- Tab key confirms completion item
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
					-- Ctrl + . triggers completion menu
					["<C-.>"] = cmp.mapping.complete(),
				}),
				-- select first candidate automatically
				completion = { completeopt = "menu,menuone,noinsert" },
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
			})
		end,
	},
	{
		-- formatter
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
			},
		},
	},
	{
		-- display a popup with possible keybindings for command
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		opts = {},
	},
	{
		-- ez lua ls setup
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},
	{
		-- directory tree
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		config = function()
			require("nvim-tree").setup()

			vim.keymap.set(
				"n",
				"<leader>tf",
				"<CMD>NvimTreeFocus<CR>",
				{ desc = "Focus nvim-tree", noremap = true, silent = true }
			)
			vim.keymap.set(
				"n",
				"<leader>tt",
				"<CMD>NvimTreeToggle<CR>",
				{ desc = "Toggle nvim-tree", noremap = true, silent = true }
			)
		end,
	},
	{
		-- explore/edit filesystem like a buffer
		"stevearc/oil.nvim",
		opts = {
			view_options = {
				show_hidden = false,
			},
		},
		config = function()
			require("oil").setup()
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
	{
		-- toggle comments
		"numToStr/Comment.nvim",
		keys = {
			-- remap to ctrl + /
			{ "<C-_>", "gcc",  mode = "n", remap = true },
			{ "<C-/>", "gcc",  mode = "n", remap = true },
			{ "<C-_>", "gcgv", mode = "v", remap = true },
			{ "<C-/>", "gcgv", mode = "v", remap = true },
		},
		config = function()
			require("Comment").setup()
		end,
	},
	{
		-- highlight instances of text under cursor
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({})
		end,
	},
	{
		-- surround
		"tpope/vim-surround",
	},
}

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- additional keymaps
-- stay in visual mode when indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- setup lazy.nvim
require("lazy").setup(plugins, {
	install = { colorscheme = { "auto" } },
	checker = { enabled = false },
	rtp = {
		disabled_plugins = {
			"netrw",
			"netrwPlugin",
		},
	},
})
