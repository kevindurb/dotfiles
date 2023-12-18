local M = {}

M.setup = function()
  vim.cmd([[
    " horizontal splits open down
    set splitbelow

    " vertical splits open right
    set splitright

    " quick splits
    nmap <leader>v :vsp<CR>
    nmap <leader>V :sp<CR>

    " split navigation
    nmap <C-h> <C-w><C-h>
    nmap <C-j> <C-w><C-j>
    nmap <C-k> <C-w><C-k>
    nmap <C-l> <C-w><C-l>
  ]])
end

return M
