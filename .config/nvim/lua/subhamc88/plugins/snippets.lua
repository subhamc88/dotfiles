return {
	"hrsh7th/nvim-cmp",
	lazy = true,
	event = "InsertEnter",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = {
				["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-e>"] = cmp.mapping.abort(), -- Option to abort completion
			},
			sources = {
				{ name = "friendly-snippets" },
				{ name = "luasnip", option = { use_show_condition = false, show_autosnippets = true } },
				{ name = "nvim_lsp" },
			},
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol", -- show only symbol annotations
					maxwidth = 50, -- max characters for popup
					ellipsis_char = "...", -- ellipsis for truncated text
					show_labelDetails = true, -- show label details in menu
					before = function(entry, vim_item)
						-- You can customize the formatting here if needed
						return vim_item
					end,
				}),
			},
		})
	end,
}
