local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('b0o/schemastore.nvim'), gh('neovim/nvim-lspconfig') })

vim.lsp.config('yamlls', {
  settings = {
    redhat = { telemetry = { enabled = false } },
    yaml = {
      schemas = require('schemastore').yaml.schemas(),
      keyOrdering = false,
      format = {
        enable = true,
      },
      validate = true,
      schemaStore = {
        enable = false,
        url = '',
      },
    },
  },
})

vim.lsp.config('jsonls', {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      format = {
        enable = true,
      },
      validate = { enable = true },
    },
  },
})

vim.lsp.enable({
  'ansiblels',
  'bashls',
  'cssls',
  'dockerls',
  'eslint',
  'fish_lsp',
  'gopls',
  'graphql',
  'html',
  'intelephense',
  'jsonls',
  'lua_ls',
  'marksman',
  'sqls',
  'ts_ls',
  'yamlls',
})
