return {
  'hrsh7th/nvim-cmp', -- auto complete menu
  dependencies = {
    'L3MON4D3/LuaSnip', -- snippet engine
    'onsails/lspkind.nvim', -- Vscode style icons
    'hrsh7th/cmp-buffer', -- auto complete buffer text
    'hrsh7th/cmp-emoji', -- auto complete emoji
    'f3fora/cmp-spell', -- auto complete spelling
    'petertriho/cmp-git', -- auto complete git things
    'davidsierradz/cmp-conventionalcommits', -- auto complete conventional commits
  },
  config = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_cmp()

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-n>'] = cmp.mapping(
          cmp.mapping.select_next_item({
            behavior = cmp.SelectBehavior.Insert,
          }),
          { 'i' }
        ),
        ['<C-p>'] = cmp.mapping(
          cmp.mapping.select_prev_item({
            behavior = cmp.SelectBehavior.Insert,
          }),
          { 'i' }
        ),
        ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        {
          name = 'buffer',
          option = {
            keyword_length = 2,
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
      },
      experimental = { ghost_text = { hl_group = 'NonText' } },
      formatting = {
        format = lspkind.cmp_format(),
      },
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'spell' },
        { name = 'git' },
        { name = 'conventionalcommits' },
        { name = 'emoji' },
      }, {
        { name = 'buffer' },
      }),
    })

    cmp.setup.filetype('markdown', {
      sources = cmp.config.sources({
        { name = 'spell' },
        { name = 'nvim_lsp' },
        { name = 'emoji' },
      }, {
        { name = 'buffer' },
      }),
    })

    -- cmp.setup.cmdline({ '/', '?' }, {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = {
    --     { name = 'buffer' },
    --   },
    -- })
    --
    -- cmp.setup.cmdline(':', {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = cmp.config.sources({
    --     { name = 'path' },
    --   }, {
    --     { name = 'cmdline' },
    --   }),
    -- })
  end,
}
