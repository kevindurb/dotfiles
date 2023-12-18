local M = {}

M.setup = function()
  require('kevindurb.colorscheme').setup()
  require('kevindurb.filetype').setup()
  require('kevindurb.keymaps').setup()
  require('kevindurb.whitespace').setup()
  require('kevindurb.general').setup()
  require('kevindurb.ripgrep').setup()
  require('kevindurb.splits').setup()
end

return M
