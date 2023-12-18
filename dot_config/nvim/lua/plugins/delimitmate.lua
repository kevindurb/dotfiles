return {
  'Raimondi/delimitMate', -- auto close everything else
  enable = false,
  init = function()
    vim.g.delimitMate_matchpairs = '(:),[:],{:}'
  end,
}
