local M = {}

M.setup = function()
  vim.cmd([[
    " saner searching directions
    nnoremap <expr> n  'Nn'[v:searchforward]
    xnoremap <expr> n  'Nn'[v:searchforward]
    onoremap <expr> n  'Nn'[v:searchforward]
    nnoremap <expr> N  'nN'[v:searchforward]
    xnoremap <expr> N  'nN'[v:searchforward]
    onoremap <expr> N  'nN'[v:searchforward]
  ]])
end

return M
