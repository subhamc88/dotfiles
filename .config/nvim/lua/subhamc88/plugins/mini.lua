return {
	"echasnovski/mini.nvim",
	config = function()
		-- Setup Mini Comment
		require("mini.comment").setup({
			options = {
				custom_commentstring = nil,
				ignore_blank_line = true,
				start_of_line = false,
				pad_comment_parts = true,
			},
			mappings = {
				comment = "gc",
				comment_line = "gcc",
				comment_visual = "gc",
				textobject = "gc",
			},
		})

		-- Setup Mini Cursorword
		require("mini.cursorword").setup({})

		-- Setup Mini Surround
		require("mini.surround").setup({})

		-- Setup Mini Diff
		require("mini.diff").setup({
			view = {
				style = vim.wo.number and "number" or "sign", -- use window option for number
				signs = { add = "▒", change = "▒", delete = "▒" },
				priority = 199,
			},
			source = nil,
			delay = {
				text_change = 200,
			},
			mappings = {
				apply = "gh",
				reset = "gH",
				textobject = "gh",
				goto_first = "[H",
				goto_prev = "[h",
				goto_next = "]h",
				goto_last = "]H",
			},
			options = {
				algorithm = "histogram",
				indent_heuristic = true,
				linematch = 60,
				wrap_goto = false,
			},
		})

		-- Setup Mini Hipatterns
		require("mini.hipatterns").setup({
			highlighters = {
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
				hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
			},
		})

		-- Setup Mini IndentScope
		require("mini.indentscope").setup({
			draw = {
				delay = 100,
			},
			mappings = {
				object_scope = "ii",
				object_scope_with_border = "ai",
				goto_top = "[i",
				goto_bottom = "]i",
			},
			options = {
				border = "both",
				indent_at_cursor = true,
				try_as_border = true,
			},
			symbol = "╎",
		})

		-- Setup Mini Pairs
		require("mini.pairs").setup({
			modes = { insert = true, command = false, terminal = false },
			mappings = {
				["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
				["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
				["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

				[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
				["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
				["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

				['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
				["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
				["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
			},
		})

		-- Setup Mini Notify
		require("mini.notify").setup({
			content = {
				format = nil,
				sort = nil,
			},
			lsp_progress = {
				enable = true,
				duration_last = 1000,
			},
			window = {
				config = {},
				max_width_share = 0.382,
				winblend = 25,
			},
		})

		-- Setup Mini Trailspace
		require("mini.trailspace").setup({
			only_in_normal_buffers = true,
		})
	end,
}
