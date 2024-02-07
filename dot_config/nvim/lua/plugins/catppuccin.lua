return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  init = function()
    vim.o.background = 'dark'
    vim.cmd.colorscheme('nord')
  end,
}
