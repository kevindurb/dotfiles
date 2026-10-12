local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('folke/ts-comments.nvim') })

vim.schedule(function()
  require('ts-comments').setup()
end)
