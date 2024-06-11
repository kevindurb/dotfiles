return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  enabled = false,
  opts = {
    flavour = 'macchiato',
    transparent_background = true,
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
