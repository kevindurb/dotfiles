return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  enabled = true,
  opts = {
    flavour = 'macchiato',
    transparent_background = false,
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
