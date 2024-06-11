return {
  'shaunsingh/nord.nvim',
  enabled = false,
  init = function()
    vim.g.nord_disable_background = true
    vim.o.background = 'dark'
    vim.cmd.colorscheme('nord')
  end,
}
