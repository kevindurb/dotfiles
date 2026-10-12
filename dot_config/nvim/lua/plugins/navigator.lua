local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('numToStr/Navigator.nvim') })

vim.schedule(function()
  require('Navigator').setup({
    auto_save = nil,
    disable_on_zoom = false,
    mux = 'auto',
  })
end)
