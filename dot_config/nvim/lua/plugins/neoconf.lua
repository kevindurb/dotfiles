local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('folke/neoconf.nvim') })

vim.schedule(function()
  require('neoconf').setup()
end)
