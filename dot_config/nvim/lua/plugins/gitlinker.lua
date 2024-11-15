return {
  'ruifm/gitlinker.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>gy', '<cmd>lua require("gitlinker").get_buf_range_url("n")<cr>', mode = 'n' },
    { '<leader>gy', '<cmd>lua require("gitlinker").get_buf_range_url("v")<cr>', mode = 'v' },
  },
  opts = function()
    return {
      opts = {
        action_callback = require('gitlinker.actions').open_in_browser,
      },
      mappings = nil,
    }
  end,
}
