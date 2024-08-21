return {
  'folke/tokyonight.nvim',
  enabled = false,
  lazy = false,
  priority = 1000,
  opts = {
    style = 'storm',
  },
  init = function()
    vim.o.background = 'dark'
    vim.cmd.colorscheme('tokyonight')
  end,
}
