local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('MeanderingProgrammer/render-markdown.nvim') })

vim.schedule(function()
  require('render-markdown').setup({
    completions = { lsp = { enabled = true } },
    file_types = { 'markdown' },
  })
end)
