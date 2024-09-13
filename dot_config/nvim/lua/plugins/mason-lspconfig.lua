return {
  'williamboman/mason-lspconfig.nvim', -- connects mason to lspconfig
  dependencies = {
    'b0o/schemastore.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason.nvim',
  },
  opts = {
    ensure_installed = {
      'ansiblels',
      'bashls',
      'cssls',
      'dockerls',
      'eslint',
      'graphql',
      'html',
      'intelephense',
      'jsonls',
      'lua_ls',
      'marksman',
      'sqlls',
      'ts_ls',
      'yamlls',
    },
    handlers = {
      function(server_name)
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require('lspconfig')[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ['lua_ls'] = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require('lspconfig').lua_ls.setup({
          capabilities = capabilities,
          settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
        })
      end,
      ['yamlls'] = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require('lspconfig').yamlls.setup({
          capabilities = capabilities,
          settings = { yaml = { schemas = require('schemastore').yaml.schemas() } },
        })
      end,
      ['jsonls'] = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require('lspconfig').jsonls.setup({
          capabilities = capabilities,
          settings = {
            json = {
              schemas = require('schemastore').json.schemas(),
              validate = { enable = true },
            },
          },
        })
      end,
    }
  }
}
