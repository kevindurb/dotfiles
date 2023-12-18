return {
  'petertriho/nvim-scrollbar', -- a scrollbar
  dependencies = {
    'catppuccin/nvim',
  },
  opts = function()
    local colors = require('catppuccin.palettes').get_palette('macchiato')

    return {
      handle = { text = ' ', color = colors.surface2 },
      handlers = {
        cursor = false,
        diagnostic = true,
        gitsigns = true,
        handle = true,
        ale = false,
      },
    }
  end,
  config = function(lazy, opts)
    require('scrollbar').setup(opts)
    require('scrollbar.handlers.gitsigns').setup()
  end,
}
