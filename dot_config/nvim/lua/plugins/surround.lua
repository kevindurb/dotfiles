vim.schedule(function()
  require('mini.surround').setup({
    mappings = {
      add = 'gsa',
      delete = 'gsd',
      find = 'gsf',
      find_left = 'gsF',
      highlight = 'gsh',
      replace = 'gsr',
    },
  })
end)
