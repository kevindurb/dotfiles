return {
  'tomasiser/vim-code-dark',
  name = 'codedark',
  enabled = false,
  lazy = true,
  init = function()
    vim.o.background = 'dark'
    vim.cmd.colorscheme('codedark')
  end,
}
