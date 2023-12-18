return {
  'joshdick/onedark.vim',
  name = 'onedark',
  lazy = true,
  init = function()
    vim.o.background = 'dark'
    vim.cmd.colorscheme('onedark')
  end,
}
