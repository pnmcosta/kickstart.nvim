-- Unless you are still migrating, remove the deprecated commands from v2.x

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- open file_browser with the path of the current buffer
map(
	"n",
	"<space>fb",
	":Telescope file_browser path=%:p:h select_buffer=true<CR>",
	opts
)
return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup {
			extensions = {
				file_browser = {
					--    theme = "ivy",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
				},
			},
		}
		require("telescope").load_extension "file_browser"
	end
}
