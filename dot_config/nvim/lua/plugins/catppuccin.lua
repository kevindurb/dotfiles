return {
  'catppuccin/nvim',
  enabled = false,
  name = 'catppuccin',
  lazy = true,
  opts = {
    background = {
      light = 'latte',
      dark = 'macchiato',
    },
  },
  init = function()
    vim.cmd.colorscheme('catppuccin')
    vim.o.background = 'dark'
  end,
}
