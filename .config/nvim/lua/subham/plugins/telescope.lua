return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
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
      extensions = {
        ['ui-select'] = { require('telescope.themes').get_dropdown() },
      },
    }
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find Keybinds' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Find git files' })
    vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Find string' })
    vim.keymap.set('n', '<leader>fo', builtin.builtin, { desc = 'Find telescope settings' })
    vim.keymap.set('n', '<leader>fb', builtin.find_files, { desc = 'Find buffers' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find diagnostics' })
    vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Find mark' })
    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Find neovim files' })
  end,
}
