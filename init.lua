-- vim: ts=4 sw=4

vim.opt.autowrite = true
vim.opt.exrc = true
vim.opt.hidden = true
vim.opt.listchars = 'eol:$,tab:>-,trail:~,extends:>,precedes:<,space:·'
vim.opt.mouse = 'a'
vim.opt.number = true
-- vim.opt.omnifunc = v:lua.vim.lsp.omnifunc
vim.opt.splitbelow = true
vim.opt.updatetime = 100
vim.opt.termguicolors = true
vim.opt.background = 'light'

vim.g.mapleader = ','
vim.g.kommentary_create_default_mappings = false

-- ------------------------------
--  Plugins
-- ------------------------------

require('packer').startup(function(use) 

	-- Plugin manager
	use 'wbthomason/packer.nvim'

	-- Colorscheme creation aid for Neovim (required by onehalf)
	use 'rktjmp/lush.nvim'

	-- Light color theme
	use 'szsdk/onehalf.nvim'

	-- A blazing fast and easy to configure Neovim statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- A file explorer tree for Neovim
	use {
		'nvim-tree/nvim-tree.lua',
		requires = { 'nvim-tree/nvim-web-devicons' }
	}

	-- Neovim plugin to comment text in and out
	use 'b3nj5m1n/kommentary'

	-- A highly extendable fuzzy finder over lists
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Super fast git decorations
	use 'lewis6991/gitsigns.nvim'

	-- Provides some git-related functions
	use 'emmanueltouzery/agitator.nvim'

	-- A neovim plugin to persist and toggle multiple terminals
	use 'akinsho/toggleterm.nvim'

	-- EditorConfig plugin for Neovim
	use 'gpanders/editorconfig.nvim'

	-- A super powerful autopair plugin for Neovim that supports multiple characters
	use 'windwp/nvim-autopairs'

	-- Clipboard manager neovim plugin with telescope integration
	use {
		'AckslD/nvim-neoclip.lua',
		requires = { 'nvim-telescope/telescope.nvim' }
	}

	-- Changes current working directory to project's root directory
	use 'ygm2/rooter.nvim'

	-- Deleting a buffer will no longer close any window unexpectedly 
	use 'ojroques/nvim-bufdel'

	-- A fast Neovim http client
	use {
		'NTBBloodbath/rest.nvim',
		requires = { 'nvim-lua/plenary.nvim' }
	}

	-- Treesitter configurations and abstraction layer for Neovim
	use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
	-- TODO: code completion
	-- TODO: https://github.com/Yggdroot/indentLine
	-- TODO: run make targets
end)

-- ------------------------------
--  Colors
-- ------------------------------

vim.cmd('colorscheme onehalf_nvim')
vim.cmd('hi Whitespace guifg=#e2e2e2') -- for "listchars"
-- README: https://github.com/neovim/neovim/issues/18843

-- ------------------------------
--  Plugin configurations
-- ------------------------------

require('lualine').setup({
	options = { theme = 'onelight' },
	sections = { lualine_b = { 'branch' } }
})

require("nvim-tree").setup({
	git = { enable = false },
	filters = { custom = { '^.git$' } }
})

require('kommentary.config').configure_language({'default', 'verilog'}, {
	prefer_single_line_comments = true,
	single_line_comment_string = '//',
})

require('telescope').setup({
	pickers = {
		find_files = {
			previewer = false,
			layout_config = {
				width = 0.5
			}
		},
		buffers = {
			previewer = false,
			layout_config = {
				width = 0.5,
				height = 0.6
			}
		},
	},
})

require('gitsigns').setup()

require('toggleterm').setup({
	open_mapping = '<C-t>',
	size = function(term)
		return vim.o.lines * 0.4
	end
})

require("nvim-autopairs").setup()

-- TODO: set layout strategy (how?)
require('neoclip').setup()
require('telescope').load_extension('neoclip')

require('bufdel').setup({
	quit = false
})

require('rest-nvim').setup({
	result_split_horizontal = true,
	skip_ssl_verification = true,
})

require('nvim-treesitter.configs').setup({
	highlight = {
		enable = true
	}
})

-- ------------------------------
--  Key mappings
-- ------------------------------

vim.keymap.set('n', 'K', 'ciw')
vim.keymap.set('n', '<c-o>', ':NvimTreeToggle<CR>', { silent = true })
vim.keymap.set('n', '<ledaer>/', '<Plug>kommentary_line_default')
vim.keymap.set('v', '<leader>/', '<Plug>kommentary_visual_default')
vim.keymap.set('n', '<leader>l', ':set list!<CR>')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-f>', builtin.find_files)
vim.keymap.set('n', '<TAB>', builtin.buffers)
vim.keymap.set('n', '<leader>p', ':Telescope neoclip<CR>')

local gs = package.loaded.gitsigns
vim.keymap.set('n', '<leader>gp', gs.preview_hunk)
vim.keymap.set('n', '<leader>gd', gs.diffthis)
vim.keymap.set('n', '<leader>gn', gs.next_hunk)
vim.keymap.set('n', '<leader>gN', gs.prev_hunk)

local agitator = require('agitator') 
vim.keymap.set('n', '<leader>gb', agitator.git_blame_toggle)
vim.keymap.set('n', '<leader>gt', agitator.git_time_machine)

vim.keymap.set('n', '<space>', ':nohlsearch<Bar>:echo<CR>', { silent = true })
vim.keymap.set('v', 'Y', '"*y')
vim.keymap.set('n', '<leader>x', ':BufDel<CR>')
-- TODO: left / right => prev / next window

vim.keymap.set('n', '<leader>r', '<Plug>RestNvim')
