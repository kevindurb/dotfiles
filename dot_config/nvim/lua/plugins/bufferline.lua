-- pretty tabs
return {
  'akinsho/bufferline.nvim', -- pretty tabs
  opts = {
    options = {
      separator_style = 'slant',
      diagnostics = 'nvim_lsp',
      indicator = {
        style = 'underline',
      },
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' },
      },
    },
  },
}
