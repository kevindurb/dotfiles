local M = {}

-- asdfasdfasdfasd
M.setup = function()
  vim.cmd([[
    set t_ZH=^[[3m
    set t_ZR=^[[23m
    highlight Comment cterm=italic gui=italic
  ]])
end

return M
