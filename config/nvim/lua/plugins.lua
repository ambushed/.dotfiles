return {
	{
		"stevearc/conform.nvim", -- formatter that works best with lua
		opts = {},
	},
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	},
	-- native Neovim Lsp
	{ "akinsho/toggleterm.nvim" },
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"nvim-telescope/telescope-dap.nvim",
	{
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-web-devicons" },
			{ "kdheepak/lazygit.nvim" },
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	},
	"nvim-treesitter/nvim-treesitter",
	"mfussenegger/nvim-dap",
	"neovim/nvim-lspconfig",
	"folke/lsp-colors.nvim",
	"andrejlevkovitch/vim-lua-format",
	"nvim-telescope/telescope-ui-select.nvim",
	"kdheepak/lazygit.nvim",

	--"hrsh7th/cmp-nvim-lsp",
	--"hrsh7th/cmp-nvim-lua",
	--"hrsh7th/cmp-buffer",
	--"hrsh7th/cmp-path",
	--"hrsh7th/cmp-cmdline",
	--"hrsh7th/nvim-cmp",
	--"hrsh7th/cmp-nvim-lsp-signature-help",
	--"hrsh7th/vim-vsnip",
	--"vifm/vifm.vim",
	"ambushed/telescope-cmake4vim.nvim",
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"SantinoKeupp/lualine-cmake4vim.nvim",
	"ckipp01/stylua-nvim",
	-- {  "jay-babu/mason-nvim-dap.nvim"},
	-- {"stevearc/dressing.nvim"},
	{
		"ziontee113/icon-picker.nvim",
		config = function()
			require("icon-picker").setup({
				disable_legacy_commands = true,
			})
		end,
	},
	--
	--
	--
	---- fuzzy search
	--
	---- git plugin
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-dispatch" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-projectionist" },
	{ "tpope/vim-sensible" },
	{ "tpope/vim-unimpaired" },
	{ "tpope/vim-eunuch" },
	--
	-- {'christoomey/vim-tmux-navigator'},
	--
	-- {'vim-test/vim-test'},
	-- {'airblade/vim-rooter'},
	-- {'jiangmiao/auto-pairs'},
	--
	---- color scheme
	-- {'gruvbox-community/gruvbox'},
	-- {'cocopon/iceberg.vim'},
	-- {'shaunsingh/nord.nvim' },
	-- {'EdenEast/nightfox.nvim' },
	{ "folke/tokyonight.nvim" },
	-- "rafamadriz/neon",
	--
	--
	---- LANGUAGES
	---- C++
	{ "ilyachur/cmake4vim" },
	{ "simrat39/rust-tools.nvim" },
	--
	---- DEBUGGING
	{ "mfussenegger/nvim-dap-python" },
	{ "nvim-neotest/nvim-nio" },
	{ "rcarriga/nvim-dap-ui" },
	{ "theHamsta/nvim-dap-virtual-text" },
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}
