return {
  'ruifm/gitlinker.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = function()
    return {
      opts = {
        action_callback = require('gitlinker.actions').open_in_browser,
      },
    }
  end,
}
