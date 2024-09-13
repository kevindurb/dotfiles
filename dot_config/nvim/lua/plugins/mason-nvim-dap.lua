return {
  'jay-babu/mason-nvim-dap.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'mfussenegger/nvim-dap',
  },
  opts = {
    automatic_installation = true,
    ensure_installed = {
      'php',
      'js',
      'firefox',
      'chrome',
    },
    handlers = {},
  },
}
