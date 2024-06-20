return {
  'folke/tokyonight.nvim',
  enabled = true,
  lazy = false,
  priority = 1000,
  opts = {
    style = 'storm',
    transparent = true,
  },
  init = function()
    vim.o.background = 'dark'
    vim.cmd.colorscheme('tokyonight')
  end,
}
