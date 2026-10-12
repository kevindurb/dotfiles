vim.schedule(function()
  local snippets = require('mini.snippets')
  snippets.setup()

  vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function()
      while snippets.session.get() do
        snippets.session.stop()
      end
    end,
  })
end)
