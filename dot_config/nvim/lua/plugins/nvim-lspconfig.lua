return {
  'neovim/nvim-lspconfig', -- language server configurations
  cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'VonHeikemen/lsp-zero.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  init = function()
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_lspconfig()

    local yamlCompanion = require('yaml-companion')
    local yamlCompanionConfig = yamlCompanion.setup()

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

    -- Global mappings.
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    vim.keymap.set('n', 'gr', vim.lsp.buf.hover)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
      end,
    })

    local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
  end,
}
