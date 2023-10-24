-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	"ray-x/go.nvim",
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()
		require('go').setup {
			goimport = 'gopls', -- if set to 'gopls' will use golsp format
			gofmt = 'gopls', -- if set to gopls will use golsp format
			max_line_len = 120,
			tag_transform = false,
			test_dir = '',
			comment_placeholder = '   ',
			lsp_cfg = false, -- false: use your own lspconfig
			lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
			lsp_on_attach = true, -- use on_attach from go.nvim
			dap_debug = true,
		}
		local cfg = require 'go.lsp'.config() -- config() return the go.nvim gopls setup

		require('lspconfig').gopls.setup(cfg)
	end,
	event = { "CmdlineEnter" },
	ft = { "go", 'gomod' },
	build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
