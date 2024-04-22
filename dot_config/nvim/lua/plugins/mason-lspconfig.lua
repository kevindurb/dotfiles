return {
  'williamboman/mason-lspconfig.nvim', -- connects mason to lspconfig
  dependencies = {
    'b0o/schemastore.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason.nvim',
    'someone-stole-my-name/yaml-companion.nvim',
  },
  config = function()
    local lsp_zero = require('lsp-zero')
    local yamlCompanion = require('yaml-companion')
    local yamlCompanionConfig = yamlCompanion.setup()
    lsp_zero.extend_lspconfig()

    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

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
        'openscad_lsp',
        'sqlls',
        'tsserver',
        'yamlls',
      },
      handlers = {
        lsp_zero.default_setup,

        lua_ls = function()
          local lua_opts = lsp_zero.nvim_lua_ls()
          require('lspconfig').lua_ls.setup(lua_opts)
        end,

        yamlls = function()
          require('lspconfig').yamlls.setup(yamlCompanionConfig)
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
