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
      'openscad_lsp',
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
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = vim.tbl_deep_extend(
              'force',
              new_config.settings.yaml.schemas or {},
              require('schemastore').yaml.schemas()
            )
          end,
          settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
              keyOrdering = false,
              format = {
                enable = true,
              },
              validate = true,
              schemaStore = {
                -- Must disable built-in schemaStore support to use
                -- schemas from SchemaStore.nvim plugin
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = '',
              },
            },
          },
        })
      end,
      ['jsonls'] = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require('lspconfig').jsonls.setup({
          capabilities = capabilities,
          on_new_config = function(new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            vim.list_extend(new_config.settings.json.schemas, require('schemastore').json.schemas())
          end,
          settings = {
            json = {
              format = {
                enable = true,
              },
              validate = { enable = true },
            },
          },
        })
      end,
    },
  },
}
