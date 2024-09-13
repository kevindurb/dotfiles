return {
  'williamboman/mason-lspconfig.nvim', -- connects mason to lspconfig
  dependencies = {
    'williamboman/mason.nvim',
    'VonHeikemen/lsp-zero.nvim',
  },
  config = function()
    local lsp_zero = require('lsp-zero')
    require('mason-lspconfig').setup({
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
        lsp_zero.default_setup,

        lua_ls = function()
          local lua_opts = lsp_zero.nvim_lua_ls()
          require('lspconfig').lua_ls.setup(lua_opts)
        end,

        yamlls = function()
          local config = {
            settings = {
              yaml = {
                schemaStore = {
                  enable = false,
                  url = '',
                },
                schemas = require('schemastore').yaml.schemas(),
              },
            },
          }

          config.settings.yaml.schemas['kubernetes'] = 'k8s/**/*.{yml,yaml}'
          require('lspconfig').yamlls.setup(config)
        end,

        jsonls = function()
          require('lspconfig').jsonls.setup({
            settings = {
              json = {
                schemas = require('schemastore').json.schemas(),
                validate = { enable = true },
              },
            },
          })
        end,
      },
    })
  end,
}
