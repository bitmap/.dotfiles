-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
end
vim.opt.rtp:prepend(lazypath)

-- set space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- diasble nerd fonts
vim.g.have_nerd_font = false

-- import vanilla vim settings
vim.cmd([[ source $HOME/.vimrc ]])

-- neovim title
vim.opt.title = true
vim.opt.titlestring = 'nvim %{expand("%:p")}'

-- statusline
vim.opt.laststatus = 2
vim.opt.showmode = false

-- make tabs as wide as two spaces
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.cmd([[ aunmenu PopUp.How-to\ disable\ mouse ]])
vim.cmd([[ aunmenu PopUp.-1- ]])
-- plugins
local plugins = {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function() vim.cmd.colorscheme "tokyonight" end
	}, {
		"nvim-lualine/lualine.nvim",
		dependencies = {"nvim-tree/nvim-web-devicons"},
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = false,
					section_separators = '',
					component_separators = ''
				}
	  		})
		end
	}, {
		"nvim-telescope/telescope.nvim",
		dependencies = {"nvim-lua/plenary.nvim", lazy = true},
		keys = {
			{"<C-p>", ":Telescope commands<cr>", desc = "Commands"},
			{"<leader>fb", ":Telescope buffers<cr>", desc = "[F]ind [B]uffers"},
			{"<leader>ff", ":Telescope find_files<cr>", desc = "[F]ind [F]iles"},
			{"<leader>fh", ":Telescope oldfiles<cr>", desc = "[F]ind [H]istory"},
			{"<leader>fg", ":Telescope live_grep<cr>", desc = "[F]ind [G]rep"},
			{"<leader>fk", ":Telescope keymaps<cr>", desc = "[Find] [K]eymaps"},
			{"gd", ":Telescope lsp_definitions<cr>", desc = "Go to Definition"},
			{"gr", ":Telescope lsp_references<cr>", desc = "Go to References"}
		},
		config = function()
			require("telescope").setup({
				defaults = {file_ignore_patterns = {".git", "node_modules"}}
			})
		end
	}, {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c", "lua", "vim", "vimdoc", "python", "go", "rust",
					"javascript", "typescript", "html", "css"
				},
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false
				}
			})
		end
	}
}

-- setup lazy.nvim
require("lazy").setup(plugins, {
	install = {colorscheme = {"auto"}},
	checker = {enabled = false}
})
