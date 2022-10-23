local M = {}

local ok, packer = pcall(require, "packer")
if not ok then
	print("packer plugin is not installed")
	return M
end

function M.setup(is_bootstrap)
	local conf = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	}

	local function plugins(use)
		-- Speed up loading Lua modules in Neovim to improve startup time.
		use("lewis6991/impatient.nvim")

		-- GnuPG transparent encryption
		use("jamessan/vim-gnupg")

		use("wbthomason/packer.nvim")

		-- Git integration
		use("tpope/vim-fugitive") -- Git commands in nvim
		use("tpope/vim-rhubarb") -- Fugitive-companion to interact with github
		use("lewis6991/gitsigns.nvim") -- Add git related info in the signs columns and popups

		use("numToStr/Comment.nvim")

		-- Highlight, edit, and navigate code
		use("nvim-treesitter/nvim-treesitter")
		use({ "nvim-treesitter/nvim-treesitter-textobjects", after = { "nvim-treesitter" } }) -- Additional textobjects for treesitter

		-- Lsp stuff
		use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
		use("williamboman/mason.nvim") -- Manage external editor tooling i.e LSP servers
		use("williamboman/mason-lspconfig.nvim") -- Automatically install language servers to stdpath

		-- Autocompletion
		use({ "hrsh7th/nvim-cmp", requires = { "hrsh7th/cmp-nvim-lsp" } })
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-nvim-lua")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-nvim-lsp-document-symbol")
		use("saadparwaiz1/cmp_luasnip")
		use("tamago324/cmp-zsh")

		-- Snippet Engine and Snippet Expansion
		use({ "L3MON4D3/LuaSnip", requires = { "saadparwaiz1/cmp_luasnip" } })
		use("rafamadriz/friendly-snippets")

		use("tpope/vim-unimpaired") -- Useful mappings

		use("godlygeek/tabular") -- Alignment

		use("farmergreg/vim-lastplace") -- reopen files at last edites positions

		use("joshdick/onedark.vim")

		use("nvim-lualine/lualine.nvim") -- Fancier statusline

		use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides even on blank lines

		use("tpope/vim-sleuth") -- Detect tabstop and shiftwidth automatically

		-- Fuzzy Finder (files, lsp, etc)
		use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })

		-- Automatically highlighting other uses of the word under the cursor
		use("RRethy/vim-illuminate")

		if is_bootstrap then
			packer.sync()
		end
	end

	local reloadPlugins = function()
		vim.cmd([[ source $MYVIMRC ]])
		require("plenary.reload").reload_module("sebas.plugins")
		packer.compile()
		packer.sync()
	end

	-- Automatically source and re-compile packer whenever you save this init.lua
	local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
	vim.api.nvim_create_autocmd("BufWritePost", {
		callback = reloadPlugins,
		group = packer_group,
		pattern = "*/sebas/plugins.lua",
	})

	packer.init(conf)
	packer.reset()
	packer.startup(plugins)
end

return M
