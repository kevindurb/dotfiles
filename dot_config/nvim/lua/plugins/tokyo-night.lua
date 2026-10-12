local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('folke/tokyonight.nvim') })

require('tokyonight').setup()
vim.o.background = 'dark'
vim.cmd.colorscheme('tokyonight-storm')
