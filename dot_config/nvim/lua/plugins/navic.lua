local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('SmiteshP/nvim-navic') })

require('nvim-navic').setup({
  lsp = {
    auto_attach = true,
    preference = { 'ts_ls', 'graphql' },
  },
})
