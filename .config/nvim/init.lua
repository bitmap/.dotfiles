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

-- neovim title
vim.opt.title = true
vim.opt.titlestring = 'nvim %{expand("%:p")}'

-- statusline
vim.opt.laststatus = 2
vim.opt.showmode = false

-- invisible chars
vim.opt.list = true
vim.opt.listchars = { tab = "› ", trail = "×" }

-- disable spaces, but be nice to others
vim.opt.expandtab = false
vim.opt.copyindent = true
vim.opt.preserveindent = true
vim.opt.smartindent = true

-- make tabs as wide as two spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- disable annoyances
vim.cmd([[ aunmenu PopUp.How-to\ disable\ mouse ]])
vim.cmd([[ aunmenu PopUp.-1- ]])

-- plugins
local plugins = {
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
		-- fancy statusline
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = false,
					section_separators = "",
					component_separators = "",
				},
			})
		end,
	},
	{
		-- fuzzy finder
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		keys = {
			{ "<C-p>", ":Telescope commands<cr>", desc = "Commands" },
			{ "<leader>fb", ":Telescope buffers<cr>", desc = "[F]ind [B]uffers" },
			{ "<leader>ff", ":Telescope find_files<cr>", desc = "[F]ind [F]iles" },
			{ "<leader>fh", ":Telescope oldfiles<cr>", desc = "[F]ind [H]istory" },
			{ "<leader>fg", ":Telescope live_grep<cr>", desc = "[F]ind [G]rep" },
			{ "<leader>fk", ":Telescope keymaps<cr>", desc = "[Find] [K]eymaps" },
			{ "gd", ":Telescope lsp_definitions<cr>", desc = "[G]o to [D]efinition" },
			{ "gr", ":Telescope lsp_references<cr>", desc = "[G]o to [R]eferences" },
			{ "gI", ":Telescope lsp_implementations<cr>", desc = "[G]oto [I]mplementation" },
			{ "<leader>D", "Telescope lsp_type_definitions<cr>", desc = "Type [D]efinition" },
			{ "<leader>ds", "Telescope lsp_document_symbols<cr>", desc = "[D]ocument [S]ymbols" },
		},
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = { file_ignore_patterns = { ".git", "node_modules" } },
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
			{ "williamboman/mason.nvim", config = true },
			{ "williamboman/mason-lspconfig.nvim" },
			-- autocomplete
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path" },
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
		event = "VimEnter",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},
	{
		-- ez lua ls setup
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},
}

-- setup lazy.nvim
require("lazy").setup(plugins, {
	install = { colorscheme = { "auto" } },
	checker = { enabled = false },
})
