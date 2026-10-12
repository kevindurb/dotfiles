local gh = require('kevindurb.utils').gh
vim.pack.add({
  gh('nvim-mini/mini.nvim'),
  gh('nvim-mini/mini.extra'),
})

-- lsp/treesitter
require('plugins.lspconfig')
require('plugins.treesitter')

-- appearance
require('plugins.tokyo-night')
require('plugins.icons')
require('plugins.tabline')
require('plugins.navic')
require('plugins.lualine')
require('plugins.hipatterns')

-- format/lint
require('plugins.conform')
require('plugins.lint')

-- dap
-- TODO: need a good way of loading plugin adapters
-- require('plugins.dap')

-- ui
require('plugins.oil')
require('plugins.render-markdown')

-- text
require('plugins.pairs')
require('plugins.surround')
require('plugins.snippets')
require('plugins.ts-autotag')

-- comments
require('plugins.ts-comments')
require('plugins.comment')

-- other
require('plugins.neoconf')
require('plugins.lazydev')
require('plugins.navigator')
require('plugins.completion')
require('plugins.pick')
require('plugins.git')
require('plugins.diff')
