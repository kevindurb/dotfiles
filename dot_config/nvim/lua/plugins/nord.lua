return {
  'shaunsingh/nord.nvim',
  enabled = false,
  init = function()
    vim.o.background = 'dark'
    vim.cmd.colorscheme('nord')
  end,
}
