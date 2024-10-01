return {
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		require('telescope').setup {
			defaults = {
				layout_config = {
					width = 0.75,
					prompt_position = "top",
					preview_cutoff = 120,
					horizontal = {mirror = false},
					vertical = {mirror = false},
				}
			},
		}
		local builtin = require 'telescope.builtin'
		vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Find help' })
		vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Find Keybinds' })
		vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Find files' })
		vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = 'Find git files' })
		vim.keymap.set('n', '<leader>ss', builtin.live_grep, { desc = 'Find string' })
		vim.keymap.set('n', '<leader>so', builtin.builtin, { desc = 'Find telescope settings' })
		vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Find buffers' })
		vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Find diagnostics' })
		vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = 'Find mark' })
		vim.keymap.set('n', '<leader>sn', function()
			builtin.find_files { cwd = vim.fn.stdpath 'config' }
		end, { desc = 'Find neovim files' })
	end,
}
