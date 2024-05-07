return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>ga", ":Git add", {})
			vim.keymap.set("n", "<leader>gc", ":Git commit", {})
			vim.keymap.set("n", "<leader>gs", ":Git status<CR>", {})
			vim.keymap.set("n", "<leader>gpu", ":Git push<CR>", {})
			vim.keymap.set("n", "<leader>gpl", ":Git pull<CR>", {})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>gph", ":Gitsigns preview_hunk<CR>", {})
		end,
	},
}
