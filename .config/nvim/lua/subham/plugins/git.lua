return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>ga", ":Git add", {})
			vim.keymap.set("n", "<leader>gc", ":Git commit", {})
			vim.keymap.set("n", "<leader>gs", ":Git status", {})
			vim.keymap.set("n", "<leader>gpu", ":Git push", {})
			vim.keymap.set("n", "<leader>gpl", ":Git,pull", {})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>gpp", ":Gitsigns preview_hunk<CR>", {})
		end,
	},
}
