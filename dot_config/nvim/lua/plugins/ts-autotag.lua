local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('windwp/nvim-ts-autotag') })

vim.schedule(function()
  require('nvim-ts-autotag').setup()
end)
