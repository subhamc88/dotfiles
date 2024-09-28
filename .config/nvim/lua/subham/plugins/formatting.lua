return {
  'stevearc/conform.nvim',
  lazy = true,
  keys = {
    {
      '<leader>fc',
      function()
        require('conform').format { async = true, lsp_fallback = true, format_on_save = true }
      end,
      mode = '',
      desc = 'Format code',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      rust = { 'rustfmt' },
      go = { 'gotests', 'gomodifytags', 'golines', 'gofumpt', 'goimports-reviser' },
      markdown = { 'markdownlint-cli2' },
      python = { 'isort', 'black' },
      javascript = { 'prettierd' },
    },
  },
}
