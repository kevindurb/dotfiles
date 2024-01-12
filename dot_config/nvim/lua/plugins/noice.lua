return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    lsp = {
      signature = {
        enabled = false,
      },
    },
    routes = {
      {
        filter = {
          event = 'msg_show',
          kind = '',
          find = 'written',
        },
        opts = { skip = true },
      },
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
}
