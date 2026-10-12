local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('DrKJeff16/wezterm-types'), gh('folke/lazydev.nvim') })

vim.schedule(function()
  require('lazydev').setup({
    library = {
      { path = 'wezterm-types', mods = { 'wezterm' } },
    },
  })
end)
