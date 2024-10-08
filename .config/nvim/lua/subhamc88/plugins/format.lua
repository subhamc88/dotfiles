return {
	"stevearc/conform.nvim",
	event = "VimEnter",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "blackd-client" },
				rust = { "rustfmt", lsp_format = "fallback" },
				typescript = { "prettierd", stop_after_first = true },
				markdown = { "markdownlint-cli2" },
				go = { "goimports", "gomodifytags", "goimports-reviser", "golines", "gotests", "gofumpt" },
			},
			format_on_save = {
				lsp_fallback = true,
				aync = false,
				timeout_ms = 500,
			},
		})
	end,
}
