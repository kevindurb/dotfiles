return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = {
    flavor = 'macchiato',
    background = {
      light = 'latte',
      dark = 'macchiato',
    },
  },
  init = function()
    vim.o.background = 'dark'
    vim.cmd.colorscheme('catppuccin')
  end,
}
