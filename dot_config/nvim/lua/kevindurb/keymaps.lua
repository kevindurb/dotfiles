local M = {}

M.setup = function()
  local map = vim.keymap.set

  -- Resize window using <ctrl> and arrow keys
  map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
  map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
  map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
  map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

  -- Saner search directions
  map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
  map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
  map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
  map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
  map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
  map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
end

return M
