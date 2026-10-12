-- local dapui = require('dapui')
-- local dap = require('dap')
-- local widgets = require('dap.ui.widgets')
local map = vim.keymap.set

-- Saner search directions
map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })

-- Clear search on esc
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- -- dap
-- map('n', '<leader>du', dapui.toggle)
-- map({ 'n', 'v' }, '<leader>de', dapui.eval)
-- map('n', '<leader>dB', function()
--   dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
-- end)
-- map('n', '<leader>db', dap.toggle_breakpoint)
-- map('n', '<leader>dc', dap.continue)
-- map('n', '<leader>dC', dap.run_to_cursor)
-- map('n', '<leader>dg', dap.goto_)
-- map('n', '<leader>di', dap.step_into)
-- map('n', '<leader>dj', dap.down)
-- map('n', '<leader>dk', dap.up)
-- map('n', '<leader>dl', dap.run_last)
-- map('n', '<leader>do', dap.step_out)
-- map('n', '<leader>dO', dap.step_over)
-- map('n', '<leader>dP', dap.pause)
-- map('n', '<leader>dr', dap.repl.toggle)
-- map('n', '<leader>ds', dap.session)
-- map('n', '<leader>dt', dap.terminate)
-- map('n', '<leader>dw', widgets.hover)

-- lsp
map('n', '[d', function()
  vim.diagnostic.jump({ count = -1 })
end)
map('n', ']d', function()
  vim.diagnostic.jump({ count = 1 })
end)
map('n', 'gD', vim.lsp.buf.declaration)
map('n', 'gd', vim.lsp.buf.definition)
map('n', 'gr', vim.lsp.buf.hover)
map('n', 'gi', vim.lsp.buf.implementation)

-- navigator
map({ 'n', 'i', 'v' }, '<c-h>', '<cmd>NavigatorLeft<cr>', { silent = true, desc = 'navigate left' })
map({ 'n', 'i', 'v' }, '<c-j>', '<cmd>NavigatorDown<cr>', { silent = true, desc = 'navigate down' })
map({ 'n', 'i', 'v' }, '<c-k>', '<cmd>NavigatorUp<cr>', { silent = true, desc = 'navigate up' })
map({ 'n', 'i', 'v' }, '<c-l>', '<cmd>NavigatorRight<cr>', { silent = true, desc = 'navigate right' })

-- oil
map('n', '-', function()
  require('oil').open()
end, { desc = 'Open parent directory' })

-- mini.pick
map('n', '<C-p>', function()
  require('mini.pick').builtin.files()
end, {})
map('n', '<C-o>', function()
  require('mini.extra').pickers.commands()
end, {})
map('n', '<leader>b', function()
  require('mini.pick').builtin.buffers()
end, {})
map('n', '<leader>xx', function()
  require('mini.extra').pickers.diagnostic()
end, {})

-- K keymap for searching word under cursor
map('n', 'K', function()
  local word = vim.fn.expand('<cword>')
  vim.cmd('grep! "\\b' .. word .. '\\b"')
  vim.cmd('cw')
end)

-- Quick splits keymaps
map('n', '<leader>v', ':vsp<CR>', { desc = 'Vertical split' })
map('n', '<leader>V', ':sp<CR>', { desc = 'Horizontal split' })
