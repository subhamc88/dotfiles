return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.surround').setup()
    require('mini.cursorword').setup()
    require('mini.animate').setup()
  end,
}
