-- https://github.com/neovim/neovim/issues/39006
local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('nvim-treesitter/nvim-treesitter') })

require('nvim-treesitter').setup({
  auto_install = true,
})

-- Enable Treesitter Indenting
-- https://github.com/neovim/neovim/issues/38818
vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
