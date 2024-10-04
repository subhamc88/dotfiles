return {
  'catppuccin/nvim',
  lazy = false,
  event = 'VimEnter',
  name = 'catppuccin-mocha',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'catppuccin-mocha'
    require('catppuccin').setup({
      show_end_of_buffer = true,
      term_colors = true,
      styles = {
        comments = { "italic" },
      },

      integrations = {
        gitsigns = true,
        treesitter = true,
        mason = true,
        markdown = true,
        cmp = true,
        dap = true,
        dap_ui = true,
        render_markdown = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
      },
    })
  end,
}
